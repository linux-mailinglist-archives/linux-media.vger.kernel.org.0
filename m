Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACF13A9A60
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhFPMav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:49292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232430AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CE0E613BF;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=5xE3IwwXuxM1BbQOm8ouU3VOutGE5pmZml00Zbft4vo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wynh6cAEEtZcmoAvQ7U1c+jm8dk1emJPtqjEGMM9iNO3/wFwJ+8sn2IHse1Gx3Si1
         soo3emmhNvkyEMUYfhQeK5KkrrsSb2+YfI5nO0CIcpX2PfJeYhzTT5F9dWmTLAVG/r
         to5ET8UsmbeYeZuahZwYIqF/pWEWUThydrFRu6RaMRcfnaCmZkfBJBcQn/AwJGXrSD
         hFCUEqfsguCdu6tkY+Snc9wYaObDy7rdbjRWSTiwSYtcugMikNb1DcVirVel9LmMo5
         Bb6cQ/VG9npDLy9IpoEKLcVDrAML67GR3f2W5cm7AYKR3lQwHmG3N///cfmcP7HZ58
         u9Loou2Ip8njw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oir-ET; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 08/11] media: adv7842: better document EDID block size
Date:   Wed, 16 Jun 2021 14:28:34 +0200
Message-Id: <6bed7a69367856080a62e3ee89df6a2a3d0d5f20.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the logic there is correct, it leads to smatch warnings:
	/home/hans/work/build/media-git/drivers/media/i2c/adv7842.c:2538 adv7842_set_edid() error: memcpy() '&state->vga_edid.edid' too small (128 vs 512)

Because the code tricks static analyzers by doing:
	memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);

for ADV7842_EDID_PORT_VGA, where a logic before that makes
e->blocks being either 0 or 1.

Yet, it is ugly to see the "128" magic number all spread about the
EDID code. So, while here, replace 128 (and 4 x 128) by macros:

And ensure that the logic which copy into the VGA block
will use EDID_MAX_VGA_BLOCKS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/adv7842.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 78e61fe6f2f0..30bddab320b9 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -85,6 +85,10 @@ struct adv7842_format_info {
 	u8 op_format_sel;
 };
 
+#define EDID_BLOCK_SIZE		128
+#define EDID_MAX_HDMI_BLOCKS	4
+#define EDID_MAX_VGA_BLOCKS	1
+
 struct adv7842_state {
 	struct adv7842_platform_data pdata;
 	struct v4l2_subdev sd;
@@ -98,12 +102,12 @@ struct adv7842_state {
 
 	v4l2_std_id norm;
 	struct {
-		u8 edid[512];
+		u8 edid[EDID_BLOCK_SIZE * EDID_MAX_HDMI_BLOCKS];
 		u32 blocks;
 		u32 present;
 	} hdmi_edid;
 	struct {
-		u8 edid[128];
+		u8 edid[EDID_MAX_VGA_BLOCKS * EDID_MAX_VGA_BLOCKS];
 		u32 blocks;
 		u32 present;
 	} vga_edid;
@@ -732,12 +736,13 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
 	/* edid segment pointer '1' for VGA port */
 	rep_write_and_or(sd, 0x77, 0xef, 0x10);
 
-	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX)
+	for (i = 0; && i < blocks * EDID_BLOCK_SIZE; i += I2C_SMBUS_BLOCK_MAX) {
 		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
 						     I2C_SMBUS_BLOCK_MAX,
 						     edid + i);
-	if (err)
-		return err;
+		if (err)
+			return err;
+	}
 
 	/* Calculates the checksums and enables I2C access
 	 * to internal EDID ram from VGA DDC port.
@@ -785,7 +790,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 		return 0;
 	}
 
-	pa = v4l2_get_edid_phys_addr(edid, blocks * 128, &spa_loc);
+	pa = v4l2_get_edid_phys_addr(edid, blocks * EDID_BLOCK_SIZE, &spa_loc);
 	err = v4l2_phys_addr_validate(pa, &parent_pa, NULL);
 	if (err)
 		return err;
@@ -800,7 +805,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 	}
 
 
-	for (i = 0; !err && i < blocks * 128; i += I2C_SMBUS_BLOCK_MAX) {
+	for (i = 0; !err && i < blocks * EDID_BLOCK_SIZE; i += I2C_SMBUS_BLOCK_MAX) {
 		/* set edid segment pointer for HDMI ports */
 		if (i % 256 == 0)
 			rep_write_and_or(sd, 0x77, 0xef, i >= 256 ? 0x10 : 0x00);
@@ -2491,7 +2496,9 @@ static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	if (edid->start_block + edid->blocks > blocks)
 		edid->blocks = blocks - edid->start_block;
 
-	memcpy(edid->edid, data + edid->start_block * 128, edid->blocks * 128);
+	memcpy(edid->edid,
+	       data + edid->start_block * EDID_BLOCK_SIZE,
+	       edid->blocks * EDID_BLOCK_SIZE);
 
 	return 0;
 }
@@ -2506,9 +2513,12 @@ static int adv7842_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 {
 	struct adv7842_state *state = to_state(sd);
-	unsigned int max_blocks = e->pad == ADV7842_EDID_PORT_VGA ? 1 : 4;
+	unsigned int max_blocks;
 	int err = 0;
 
+	max_blocks = e->pad == ADV7842_EDID_PORT_VGA ?
+		     EDID_MAX_VGA_BLOCKS  : EDID_MAX_HDMI_BLOCKS;
+
 	memset(e->reserved, 0, sizeof(e->reserved));
 
 	if (e->pad > ADV7842_EDID_PORT_VGA)
@@ -2535,7 +2545,7 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 		state->vga_edid.blocks = e->blocks;
 		state->vga_edid.present = e->blocks ? 0x1 : 0x0;
 		if (e->blocks)
-			memcpy(&state->vga_edid.edid, e->edid, 128 * e->blocks);
+			memcpy(&state->vga_edid.edid, e->edid, EDID_BLOCK_SIZE);
 		err = edid_write_vga_segment(sd);
 		break;
 	case ADV7842_EDID_PORT_A:
@@ -2544,7 +2554,8 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)
 		state->hdmi_edid.blocks = e->blocks;
 		if (e->blocks) {
 			state->hdmi_edid.present |= 0x04 << e->pad;
-			memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);
+			memcpy(&state->hdmi_edid.edid, e->edid,
+			       EDID_BLOCK_SIZE * e->blocks);
 		} else {
 			state->hdmi_edid.present &= ~(0x04 << e->pad);
 			adv7842_s_detect_tx_5v_ctrl(sd);
-- 
2.31.1

