Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99EF37536D
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhEFMIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:08:00 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35975 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230145AbhEFMH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:07:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ecmPlunZvyEWwecmSl0rmX; Thu, 06 May 2021 14:07:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620302820; bh=6B0qo5cFnFbeyWyB0JOKX48ni7gKNjHRb1YuNVqvBo8=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GNiUTk2riMClpYtxRrSL1IapACrlbkSGuka8Kf3N5G2C6F1PQZjNuyz91nUG+7kir
         WMhuyF76M+VJumoWLsokX1auqAXdY+ADlnHGNqYbSR4WAqrBUNK0rcDns9kVOvV/pW
         bFVo1TjmfD+4wil8UsSmFZ5YlMt7kr/NNiYomZzrqBzoYDduhNoJTDOvgv2TAL2+3c
         78swC9WTItzlf8JveQXa4Mgrt+sPG55S9E8UCLZ2pEBoDksMrd6VSp952o+BfMs7ly
         qXNVTMU7ViFCTl8oBQGOL61tgOvkW2zoRZNPUR7iGvaHPzcDJ8zntgq+zBNRC2qFN7
         8iT8/9XDeqQ8Q==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] adv7842: support EDIDs up to 4 blocks
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <9fb6b6bc-6b42-9aa0-cee7-b2d461a6f20b@xs4all.nl>
Date:   Thu, 6 May 2021 14:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFxd6C5varv1rzq/e9cuJdt1o3+F/ZCzunI4rtOHE7TPyTdvoPDQBMBBtL0YzrPONs/hzYFjOBS8qDP0JpfLlvye2ZSPElLb+egCYBvNQreMHLk9ZBAe
 x4I0LNfpskMWE0e0Uck3BgN4ojKY3AM5QBrE+xXaN1t21hImWx3vdfAWVykUTPPFuVBpBfrjXCIEwGCm4PrrI1UtQXyXN89vQ/w=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The adv7842 driver didn't support EDIDs of 3 or 4 blocks, even though the
hardware supports this.

It is a bit more complicated due to the fact that the adv7842 can expose
two EDIDs: one digital, one analog, for DVI-I connectors. In that case the
VGA_EDID_ENABLE bit is set and blocks 0 and 1 of the EDID eeprom are used
for the DVI-D part and block 2 is used for the DVI-A part of the DVI-I
connector.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 29140d0c4c0e..a0be78a6a617 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -98,12 +98,12 @@ struct adv7842_state {

 	v4l2_std_id norm;
 	struct {
-		u8 edid[256];
+		u8 edid[512];
 		u32 blocks;
 		u32 present;
 	} hdmi_edid;
 	struct {
-		u8 edid[256];
+		u8 edid[128];
 		u32 blocks;
 		u32 present;
 	} vga_edid;
@@ -720,6 +720,9 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)

 	v4l2_dbg(2, debug, sd, "%s: write EDID on VGA port\n", __func__);

+	if (!state->vga_edid.present)
+		return 0;
+
 	/* HPA disable on port A and B */
 	io_write_and_or(sd, 0x20, 0xcf, 0x00);

@@ -763,7 +766,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 	struct adv7842_state *state = to_state(sd);
 	const u8 *edid = state->hdmi_edid.edid;
 	u32 blocks = state->hdmi_edid.blocks;
-	int spa_loc;
+	unsigned int spa_loc;
 	u16 pa, parent_pa;
 	int err = 0;
 	int i;
@@ -796,12 +799,14 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 		pa = (edid[spa_loc] << 8) | edid[spa_loc + 1];
 	}

-	/* edid segment pointer '0' for HDMI ports */
-	rep_write_and_or(sd, 0x77, 0xef, 0x00);

-	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX)
+	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX) {
+		/* set edid segment pointer for HDMI ports */
+		if (i % 256 == 0)
+			rep_write_and_or(sd, 0x77, 0xef, i >= 256 ? 0x10 : 0x00);
 		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
 						     I2C_SMBUS_BLOCK_MAX, edid + i);
+	}
 	if (err)
 		return err;

@@ -2491,9 +2496,17 @@ static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	return 0;
 }

+/*
+ * If the VGA_EDID_ENABLE bit is set (Repeater Map 0x7f, bit 7), then
+ * the first two blocks of the EDID are for the HDMI, and the first block
+ * of segment 1 (i.e. the third block of the EDID) is for VGA.
+ * So if a VGA EDID is installed, then the maximum size of the HDMI EDID
+ * is 2 blocks.
+ */
 static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 {
 	struct adv7842_state *state = to_state(sd);
+	unsigned int max_blocks = e->pad == ADV7842_EDID_PORT_VGA ? 1 : 4;
 	int err = 0;

 	memset(e->reserved, 0, sizeof(e->reserved));
@@ -2502,8 +2515,12 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 		return -EINVAL;
 	if (e->start_block != 0)
 		return -EINVAL;
-	if (e->blocks > 2) {
-		e->blocks = 2;
+	if (e->pad < ADV7842_EDID_PORT_VGA && state->vga_edid.blocks)
+		max_blocks = 2;
+	if (e->pad == ADV7842_EDID_PORT_VGA && state->hdmi_edid.blocks > 2)
+		return -EBUSY;
+	if (e->blocks > max_blocks) {
+		e->blocks = max_blocks;
 		return -E2BIG;
 	}

@@ -2514,7 +2531,7 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)

 	switch (e->pad) {
 	case ADV7842_EDID_PORT_VGA:
-		memset(&state->vga_edid.edid, 0, 256);
+		memset(&state->vga_edid.edid, 0, sizeof(state->vga_edid.edid));
 		state->vga_edid.blocks = e->blocks;
 		state->vga_edid.present = e->blocks ? 0x1 : 0x0;
 		if (e->blocks)
@@ -2523,7 +2540,7 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 		break;
 	case ADV7842_EDID_PORT_A:
 	case ADV7842_EDID_PORT_B:
-		memset(&state->hdmi_edid.edid, 0, 256);
+		memset(&state->hdmi_edid.edid, 0, sizeof(state->hdmi_edid.edid));
 		state->hdmi_edid.blocks = e->blocks;
 		if (e->blocks) {
 			state->hdmi_edid.present |= 0x04 << e->pad;

