	.include "constants/gba_constants.inc"
	.include "constants/misc_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start DoTVShowTodaysSmartShopper
DoTVShowTodaysSmartShopper: @ 80C0E00
	push {r4-r6,lr}
	ldr r0, _080C0E2C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0E30 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C0E34 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0E38 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xC
	bls _080C0E22
	b _080C1014
_080C0E22:
	lsls r0, r6, 2
	ldr r1, _080C0E3C @ =_080C0E40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0E2C: .4byte gSpecialVar_0x8004
_080C0E30: .4byte gSaveBlock1 + 0x2738
_080C0E34: .4byte gScriptResult
_080C0E38: .4byte gUnknown_020387E8
_080C0E3C: .4byte _080C0E40
	.align 2, 0
_080C0E40:
	.4byte _080C0E74
	.4byte _080C0EB0
	.4byte _080C0EF8
	.4byte _080C0F0A
	.4byte _080C0EF8
	.4byte _080C0EF8
	.4byte _080C0F34
	.4byte _080C0F64
	.4byte _080C0F94
	.4byte _080C0FA0
	.4byte _080C0FAE
	.4byte _080C0FC0
	.4byte _080C1004
_080C0E74:
	ldr r0, _080C0E98 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r0, _080C0E9C @ =gStringVar2
	ldrb r1, [r5, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0EA4
	ldr r1, _080C0EA0 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0E98: .4byte gStringVar1
_080C0E9C: .4byte gStringVar2
_080C0EA0: .4byte gUnknown_020387E8
_080C0EA4:
	ldr r1, _080C0EAC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0EAC: .4byte gUnknown_020387E8
_080C0EB0:
	ldr r0, _080C0EEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C0EF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xC]
	movs r0, 0x2
	bl sub_80BF088
	ldr r4, _080C0EF4 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C1014
	.align 2, 0
_080C0EEC: .4byte gStringVar1
_080C0EF0: .4byte gStringVar2
_080C0EF4: .4byte gUnknown_020387E8
_080C0EF8:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F04
	movs r0, 0x6
	strb r0, [r2]
	b _080C1014
_080C0F04:
	movs r0, 0xA
	strb r0, [r2]
	b _080C1014
_080C0F0A:
	ldrh r1, [r5, 0xC]
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F28
	ldr r1, _080C0F24 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F24: .4byte gUnknown_020387E8
_080C0F28:
	ldr r1, _080C0F30 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F30: .4byte gUnknown_020387E8
_080C0F34:
	ldr r4, _080C0F5C @ =gStringVar2
	ldrh r0, [r5, 0x8]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xE]
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0xA]
	cmp r0, 0
	beq _080C0F7C
	ldr r1, _080C0F60 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F5C: .4byte gStringVar2
_080C0F60: .4byte gUnknown_020387E8
_080C0F64:
	ldr r4, _080C0F8C @ =gStringVar2
	ldrh r0, [r5, 0xA]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF088
_080C0F7C:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	beq _080C0FE2
	ldr r1, _080C0F90 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F8C: .4byte gStringVar2
_080C0F90: .4byte gUnknown_020387E8
_080C0F94:
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0FBA
	movs r0, 0xC
	strb r0, [r2]
	b _080C1014
_080C0FA0:
	movs r0, 0x1
	adds r1, r5, 0
	bl sub_80BF154
	bl TVShowDone
	b _080C1014
_080C0FAE:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FBA
	movs r0, 0x8
	strb r0, [r2]
	b _080C1014
_080C0FBA:
	movs r0, 0x9
	strb r0, [r2]
	b _080C1014
_080C0FC0:
	ldr r0, _080C0FEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C0FF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FF8
_080C0FE2:
	ldr r1, _080C0FF4 @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0FEC: .4byte gStringVar1
_080C0FF0: .4byte gStringVar2
_080C0FF4: .4byte gUnknown_020387E8
_080C0FF8:
	ldr r1, _080C1000 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C1000: .4byte gUnknown_020387E8
_080C1004:
	ldr r0, _080C1028 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	bl TVShowDone
_080C1014:
	ldr r0, _080C102C @ =gTVSmartShopperTextGroup
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1028: .4byte gStringVar1
_080C102C: .4byte gTVSmartShopperTextGroup
	thumb_func_end DoTVShowTodaysSmartShopper

	.align 2, 0 @ Don't pad with nop.
