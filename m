Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17ED3356E48
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348176AbhDGOQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:16:34 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46787 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243058AbhDGOQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 10:16:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8yglSP3zMxedU8yjlIlFz; Wed, 07 Apr 2021 16:16:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617804982; bh=S83PAm0KA7RhWYgZY/SJuS+T5vxQnZNe6qRok09zaXE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=boNE3qZu2jhBqPgFE5RfmXsm95ydbxyAPWY2vDgiFQyoMRH83t5gUQsw0H7h28qDk
         SLcxsfcZ4oDMtWQhBsx7lY4vzB8esfiJ+B/Gpq2RqX2PE/gTMLm4Ks+b5ChoOH/Uxu
         KymvITZfrGm1araA6q9iGro43yWg5GSFVjHG1uh21efrB3+ZUAzxhZ52HgUHN7BHB5
         ab5E6Opbhc3TrqZTaVV7UZb3YOJvo38vP5hvU1qe+q+NTDHcVhvu5uIQP+bbRfkKuV
         22jk6cgjqm3qtaupZgM0xKedQST5BQ5NsxSSzc2ShTTufSpp7u50jFsnE3N9PzRBvJ
         kC1HrivWv6+6A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] adv7842: support 1 block EDIDs, fix clearing EDID
Date:   Wed,  7 Apr 2021 16:16:18 +0200
Message-Id: <20210407141618.196617-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407141618.196617-1-hverkuil-cisco@xs4all.nl>
References: <20210407141618.196617-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGJVeeZa+ocSy0LhvrOj7GEwyuK1h7x/tshZzs0fDeJdUeWNHueckOj2P8H0zyatvycKKdX8PT3oDxuT6YpSjkPiXYyf4cpe1+fNQAq13vkMK3rjE7RQ
 ir9oQpXheOYAgejOOZ1xYbGU1N2Gp2nL++yiko9Jkgxl/StfLoLpjehoqpjq0jKJ11faCMe1U4mw/JrPbW1pUjJjWG8K2XL+uVGIil8Hf7VX8c2y1OtmeFmR
 3l41zSEAxwuomEXMYnQJWQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for EDIDs consisting of one EDID block.

Related to this, improve CEC physical address handling.

Clearing the EDID caused a bug since v4l2_calc_aspect_ratio() was
called with a NULL pointer.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/adv7842.c | 71 ++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 10a1a9a711e6..29140d0c4c0e 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -99,10 +99,12 @@ struct adv7842_state {
 	v4l2_std_id norm;
 	struct {
 		u8 edid[256];
+		u32 blocks;
 		u32 present;
 	} hdmi_edid;
 	struct {
 		u8 edid[256];
+		u32 blocks;
 		u32 present;
 	} vga_edid;
 	struct v4l2_fract aspect_ratio;
@@ -711,7 +713,8 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct adv7842_state *state = to_state(sd);
-	const u8 *val = state->vga_edid.edid;
+	const u8 *edid = state->vga_edid.edid;
+	u32 blocks = state->vga_edid.blocks;
 	int err = 0;
 	int i;
 
@@ -726,10 +729,10 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
 	/* edid segment pointer '1' for VGA port */
 	rep_write_and_or(sd, 0x77, 0xef, 0x10);
 
-	for (i = 0; !err && i < 256; i += I2C_SMBUS_BLOCK_MAX)
+	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX)
 		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
 						     I2C_SMBUS_BLOCK_MAX,
-						     val + i);
+						     edid + i);
 	if (err)
 		return err;
 
@@ -759,8 +762,9 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct adv7842_state *state = to_state(sd);
 	const u8 *edid = state->hdmi_edid.edid;
+	u32 blocks = state->hdmi_edid.blocks;
 	int spa_loc;
-	u16 pa;
+	u16 pa, parent_pa;
 	int err = 0;
 	int i;
 
@@ -778,33 +782,35 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 		return 0;
 	}
 
-	pa = v4l2_get_edid_phys_addr(edid, 256, &spa_loc);
-	err = v4l2_phys_addr_validate(pa, &pa, NULL);
+	pa = v4l2_get_edid_phys_addr(edid, blocks * 128, &spa_loc);
+	err = v4l2_phys_addr_validate(pa, &parent_pa, NULL);
 	if (err)
 		return err;
 
-	/*
-	 * Return an error if no location of the source physical address
-	 * was found.
-	 */
-	if (spa_loc == 0)
-		return -EINVAL;
+	if (!spa_loc) {
+		/*
+		 * There is no SPA, so just set spa_loc to 128 and pa to whatever
+		 * data is there.
+		 */
+		spa_loc = 128;
+		pa = (edid[spa_loc] << 8) | edid[spa_loc + 1];
+	}
 
 	/* edid segment pointer '0' for HDMI ports */
 	rep_write_and_or(sd, 0x77, 0xef, 0x00);
 
-	for (i = 0; !err && i < 256; i += I2C_SMBUS_BLOCK_MAX)
+	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX)
 		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
 						     I2C_SMBUS_BLOCK_MAX, edid + i);
 	if (err)
 		return err;
 
 	if (port == ADV7842_EDID_PORT_A) {
-		rep_write(sd, 0x72, edid[spa_loc]);
-		rep_write(sd, 0x73, edid[spa_loc + 1]);
+		rep_write(sd, 0x72, pa >> 8);
+		rep_write(sd, 0x73, pa & 0xff);
 	} else {
-		rep_write(sd, 0x74, edid[spa_loc]);
-		rep_write(sd, 0x75, edid[spa_loc + 1]);
+		rep_write(sd, 0x74, pa >> 8);
+		rep_write(sd, 0x75, pa & 0xff);
 	}
 	rep_write(sd, 0x76, spa_loc & 0xff);
 	rep_write_and_or(sd, 0x77, 0xbf, (spa_loc >> 2) & 0x40);
@@ -824,7 +830,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 				(port == ADV7842_EDID_PORT_A) ? 'A' : 'B');
 		return -EIO;
 	}
-	cec_s_phys_addr(state->cec_adap, pa, false);
+	cec_s_phys_addr(state->cec_adap, parent_pa, false);
 
 	/* enable hotplug after 200 ms */
 	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 5);
@@ -2443,6 +2449,7 @@ static int adv7842_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
 static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 {
 	struct adv7842_state *state = to_state(sd);
+	u32 blocks = 0;
 	u8 *data = NULL;
 
 	memset(edid->reserved, 0, sizeof(edid->reserved));
@@ -2450,30 +2457,34 @@ static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	switch (edid->pad) {
 	case ADV7842_EDID_PORT_A:
 	case ADV7842_EDID_PORT_B:
-		if (state->hdmi_edid.present & (0x04 << edid->pad))
+		if (state->hdmi_edid.present & (0x04 << edid->pad)) {
 			data = state->hdmi_edid.edid;
+			blocks = state->hdmi_edid.blocks;
+		}
 		break;
 	case ADV7842_EDID_PORT_VGA:
-		if (state->vga_edid.present)
+		if (state->vga_edid.present) {
 			data = state->vga_edid.edid;
+			blocks = state->vga_edid.blocks;
+		}
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	if (edid->start_block == 0 && edid->blocks == 0) {
-		edid->blocks = data ? 2 : 0;
+		edid->blocks = blocks;
 		return 0;
 	}
 
 	if (!data)
 		return -ENODATA;
 
-	if (edid->start_block >= 2)
+	if (edid->start_block >= blocks)
 		return -EINVAL;
 
-	if (edid->start_block + edid->blocks > 2)
-		edid->blocks = 2 - edid->start_block;
+	if (edid->start_block + edid->blocks > blocks)
+		edid->blocks = blocks - edid->start_block;
 
 	memcpy(edid->edid, data + edid->start_block * 128, edid->blocks * 128);
 
@@ -2497,26 +2508,30 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 	}
 
 	/* todo, per edid */
-	state->aspect_ratio = v4l2_calc_aspect_ratio(e->edid[0x15],
-			e->edid[0x16]);
+	if (e->blocks)
+		state->aspect_ratio = v4l2_calc_aspect_ratio(e->edid[0x15],
+							     e->edid[0x16]);
 
 	switch (e->pad) {
 	case ADV7842_EDID_PORT_VGA:
 		memset(&state->vga_edid.edid, 0, 256);
+		state->vga_edid.blocks = e->blocks;
 		state->vga_edid.present = e->blocks ? 0x1 : 0x0;
-		memcpy(&state->vga_edid.edid, e->edid, 128 * e->blocks);
+		if (e->blocks)
+			memcpy(&state->vga_edid.edid, e->edid, 128 * e->blocks);
 		err = edid_write_vga_segment(sd);
 		break;
 	case ADV7842_EDID_PORT_A:
 	case ADV7842_EDID_PORT_B:
 		memset(&state->hdmi_edid.edid, 0, 256);
+		state->hdmi_edid.blocks = e->blocks;
 		if (e->blocks) {
 			state->hdmi_edid.present |= 0x04 << e->pad;
+			memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);
 		} else {
 			state->hdmi_edid.present &= ~(0x04 << e->pad);
 			adv7842_s_detect_tx_5v_ctrl(sd);
 		}
-		memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);
 		err = edid_write_hdmi_segment(sd, e->pad);
 		break;
 	default:
-- 
2.30.2

