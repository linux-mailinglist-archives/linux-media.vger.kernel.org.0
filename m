Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42191348E38
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhCYKjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:39:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38299 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230417AbhCYKjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:39:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PNOrlDPkrUzyrPNOulVJkG; Thu, 25 Mar 2021 11:39:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616668780; bh=09XUsRXorgxCACVzRTgI/qKvpPUOR713iakc2uwcIW4=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gSJmg/FWDdTr3SSUUgWzslSC1+hR6ZmK1rF1EmUtEYIaImD6mHW6yy6ZaBAlLFsZ8
         9/jOG2e16oqEBes8HYPBGVVnRmbQU8yZaDeCNGTMNF0se/xMRkziIeJHGvZgt8/TQM
         jgzavEdABSRGEVxWZrb923z7aiVun5+oReN+e0QzSD5D2aHfSd3K8SoHKuTT4rtYhX
         VzdXll3rZjg1Lo+jWbvSMyhxNnxhqRd2mEetB6kBvqCM+EoqNC41RsxwT+Yokx0J94
         JxPSQ1GwuhQwWIK0XYvAOfQ/XTLcSjv7lzQeHidovR+fJjHPCsG0Ci3PrvUWTx2if8
         Qtu/aR9cW9l2A==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] adv7604: support EDIDs up to 4 blocks
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Message-ID: <c4f1ded6-5f84-f49c-44a3-185194b4b20d@xs4all.nl>
Date:   Thu, 25 Mar 2021 11:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIOgCg7VYqFYSAw2PhwtYhGcwZzOIV2YNuiBMl0NesUSKpgjRoEVcg40ncYUJTW02PMHdJ5Pmg7zYgusoLpWBu5g3737TU4WNxtJ7T56rUFh19W+nIea
 RGByf2TJn+zmxcDvyHr26Hc9b4snHRkhIMm57yVDs7/p1SYeVla0JTSzsORq8SC2qoOce+Zkg2xTQ8OYAQYMEWYB8JUijvj4tAPk5ncLx6gv7UwhDJZ220Cp
 37FnApGBSHCfQhjIEHZgsw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the adv7604/11/12 hardware supported EDIDs up to 4 blocks, the
driver didn't. This patch adds support for this. It also improves support
for EDIDs that do not have a Source Physical Address: in that case the
spa location is set to the first byte of the second block, and the
'physical address' is just the two bytes at that location. This is per
the suggestion in the adv76xx documentation for such EDIDs.

Tested with an adv7604 and adv7612.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Change since v2' remove ADV7604 type test, was spurious code that should
have been removed. Thanks to Niklas for catching that!
---
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 18184297e2f0..7547afc85eb1 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -73,6 +73,8 @@ MODULE_LICENSE("GPL");

 #define ADV76XX_MAX_ADDRS (3)

+#define ADV76XX_MAX_EDID_BLOCKS 4
+
 enum adv76xx_type {
 	ADV7604,
 	ADV7611,
@@ -108,6 +110,11 @@ struct adv76xx_chip_info {

 	unsigned int edid_enable_reg;
 	unsigned int edid_status_reg;
+	unsigned int edid_segment_reg;
+	unsigned int edid_segment_mask;
+	unsigned int edid_spa_loc_reg;
+	unsigned int edid_spa_loc_msb_mask;
+	unsigned int edid_spa_port_b_reg;
 	unsigned int lcf_reg;

 	unsigned int cable_det_mask;
@@ -176,7 +183,7 @@ struct adv76xx_state {
 	const struct adv76xx_format_info *format;

 	struct {
-		u8 edid[256];
+		u8 edid[ADV76XX_MAX_EDID_BLOCKS * 128];
 		u32 present;
 		unsigned blocks;
 	} edid;
@@ -2327,15 +2334,25 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 				__func__, edid->pad, state->edid.present);
 		return 0;
 	}
-	if (edid->blocks > 2) {
-		edid->blocks = 2;
+	if (edid->blocks > ADV76XX_MAX_EDID_BLOCKS) {
+		edid->blocks = ADV76XX_MAX_EDID_BLOCKS;
 		return -E2BIG;
 	}
+
 	pa = v4l2_get_edid_phys_addr(edid->edid, edid->blocks * 128, &spa_loc);
 	err = v4l2_phys_addr_validate(pa, &parent_pa, NULL);
 	if (err)
 		return err;

+	if (!spa_loc) {
+		/*
+		 * There is no SPA, so just set spa_loc to 128 and pa to whatever
+		 * data is there.
+		 */
+		spa_loc = 128;
+		pa = (edid->edid[spa_loc] << 8) | edid->edid[spa_loc + 1];
+	}
+
 	v4l2_dbg(2, debug, sd, "%s: write EDID pad %d, edid.present = 0x%x\n",
 			__func__, edid->pad, state->edid.present);

@@ -2344,59 +2361,63 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	adv76xx_set_hpd(state, 0);
 	rep_write_clr_set(sd, info->edid_enable_reg, 0x0f, 0x00);

-	/*
-	 * Return an error if no location of the source physical address
-	 * was found.
-	 */
-	if (edid->blocks > 1 && spa_loc == 0)
-		return -EINVAL;
-
 	switch (edid->pad) {
 	case ADV76XX_PAD_HDMI_PORT_A:
 		state->spa_port_a[0] = pa >> 8;
 		state->spa_port_a[1] = pa & 0xff;
 		break;
 	case ADV7604_PAD_HDMI_PORT_B:
-		rep_write(sd, 0x70, pa >> 8);
-		rep_write(sd, 0x71, pa & 0xff);
+		rep_write(sd, info->edid_spa_port_b_reg, pa >> 8);
+		rep_write(sd, info->edid_spa_port_b_reg + 1, pa & 0xff);
 		break;
 	case ADV7604_PAD_HDMI_PORT_C:
-		rep_write(sd, 0x72, pa >> 8);
-		rep_write(sd, 0x73, pa & 0xff);
+		rep_write(sd, info->edid_spa_port_b_reg + 2, pa >> 8);
+		rep_write(sd, info->edid_spa_port_b_reg + 3, pa & 0xff);
 		break;
 	case ADV7604_PAD_HDMI_PORT_D:
-		rep_write(sd, 0x74, pa >> 8);
-		rep_write(sd, 0x75, pa & 0xff);
+		rep_write(sd, info->edid_spa_port_b_reg + 4, pa >> 8);
+		rep_write(sd, info->edid_spa_port_b_reg + 5, pa & 0xff);
 		break;
 	default:
 		return -EINVAL;
 	}

-	if (info->type == ADV7604) {
-		rep_write(sd, 0x76, spa_loc & 0xff);
-		rep_write_clr_set(sd, 0x77, 0x40, (spa_loc & 0x100) >> 2);
-	} else {
-		/* ADV7612 Software Manual Rev. A, p. 15 */
-		rep_write(sd, 0x70, spa_loc & 0xff);
-		rep_write_clr_set(sd, 0x71, 0x01, (spa_loc & 0x100) >> 8);
-	}
+	if (info->edid_spa_loc_reg) {
+		u8 mask = info->edid_spa_loc_msb_mask;

-	if (spa_loc) {
-		edid->edid[spa_loc] = state->spa_port_a[0];
-		edid->edid[spa_loc + 1] = state->spa_port_a[1];
+		rep_write(sd, info->edid_spa_loc_reg, spa_loc & 0xff);
+		rep_write_clr_set(sd, info->edid_spa_loc_reg + 1,
+				  mask, (spa_loc & 0x100) ? mask : 0);
 	}

+	edid->edid[spa_loc] = state->spa_port_a[0];
+	edid->edid[spa_loc + 1] = state->spa_port_a[1];
+
 	memcpy(state->edid.edid, edid->edid, 128 * edid->blocks);
 	state->edid.blocks = edid->blocks;
 	state->aspect_ratio = v4l2_calc_aspect_ratio(edid->edid[0x15],
 			edid->edid[0x16]);
 	state->edid.present |= 1 << edid->pad;

-	err = edid_write_block(sd, 128 * edid->blocks, state->edid.edid);
+	rep_write_clr_set(sd, info->edid_segment_reg,
+			  info->edid_segment_mask, 0);
+	err = edid_write_block(sd, 128 * min(edid->blocks, 2U), state->edid.edid);
 	if (err < 0) {
 		v4l2_err(sd, "error %d writing edid pad %d\n", err, edid->pad);
 		return err;
 	}
+	if (edid->blocks > 2) {
+		rep_write_clr_set(sd, info->edid_segment_reg,
+				  info->edid_segment_mask,
+				  info->edid_segment_mask);
+		err = edid_write_block(sd, 128 * (edid->blocks - 2),
+				       state->edid.edid + 256);
+		if (err < 0) {
+			v4l2_err(sd, "error %d writing edid pad %d\n",
+				 err, edid->pad);
+			return err;
+		}
+	}

 	/* adv76xx calculates the checksums and enables I2C access to internal
 	   EDID RAM from DDC port. */
@@ -2989,6 +3010,11 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
 		.num_dv_ports = 4,
 		.edid_enable_reg = 0x77,
 		.edid_status_reg = 0x7d,
+		.edid_segment_reg = 0x77,
+		.edid_segment_mask = 0x10,
+		.edid_spa_loc_reg = 0x76,
+		.edid_spa_loc_msb_mask = 0x40,
+		.edid_spa_port_b_reg = 0x70,
 		.lcf_reg = 0xb3,
 		.tdms_lock_mask = 0xe0,
 		.cable_det_mask = 0x1e,
@@ -3039,6 +3065,8 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
 		.num_dv_ports = 1,
 		.edid_enable_reg = 0x74,
 		.edid_status_reg = 0x76,
+		.edid_segment_reg = 0x7a,
+		.edid_segment_mask = 0x01,
 		.lcf_reg = 0xa3,
 		.tdms_lock_mask = 0x43,
 		.cable_det_mask = 0x01,
@@ -3083,6 +3111,11 @@ static const struct adv76xx_chip_info adv76xx_chip_info[] = {
 		.num_dv_ports = 1,			/* normally 2 */
 		.edid_enable_reg = 0x74,
 		.edid_status_reg = 0x76,
+		.edid_segment_reg = 0x7a,
+		.edid_segment_mask = 0x01,
+		.edid_spa_loc_reg = 0x70,
+		.edid_spa_loc_msb_mask = 0x01,
+		.edid_spa_port_b_reg = 0x52,
 		.lcf_reg = 0xa3,
 		.tdms_lock_mask = 0x43,
 		.cable_det_mask = 0x01,
