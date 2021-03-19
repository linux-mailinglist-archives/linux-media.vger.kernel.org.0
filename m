Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190B63422A1
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhCSQ6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:58:22 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35831 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230224AbhCSQ6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:58:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NIRjlNKM3GEYcNIRmlSGLW; Fri, 19 Mar 2021 17:58:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616173082; bh=Xh4FQaO7gXbi7rOUuZ1pPbwXwXStL27rWL0VF4HMgkA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eVxw5OLXn/PzRy7/tZ0aD5Fyfvawr0niXiYhySkjWbWecyfF1Giafp8tULvdL3TPi
         VGWjYk7Z1d7cfA8XM5jAXtN7IkIyN+41wDvuE5ghtYAXRLXrC/6N1oYB6DPnTVRigN
         o9cbgvMrC2nJ91rav4qeaQ1hvpDg55y5ScigTDITGsG09ty0nCR57EolUy0iRMxBL2
         hkOjkqcsU+glhb5NAt1YgxgHLHiziOtgSMWmUdyRvrePn04jhuMTr+rI4VxQWh4na+
         X4BA8CHPCx5t2YKE7YttpcWSyJKorSGuDXK2nVBRbva45BGYISNyMIJ6wcMSZ6kHBa
         0s/VfIFFUYGCA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] adv7604: writing a one-block EDID failed
Message-ID: <a7736e44-cb66-46fa-6c6b-30a96722daca@xs4all.nl>
Date:   Fri, 19 Mar 2021 17:57:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDZjJjLAW7/BdZSOu97uD/9L9ArQOcG82HOiD1kwygjfVFqgF4RDIozgvbm/d7vR+UBJyxXAgvodWkhb9x/9dDcQLzvEFv7bRG8EfDiA1eTg3/egdoRL
 iXaEHeupc5dOL+SO/vgVd4eiUv4GclizAa0uJal3Ic8f0AgFNOia4Ei1BKCm6PtyYq8r27tHjqbZ7SiMIHTyT900G9AF1m24u3U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The adv7604 refused to accept a one-block EDID, it required two blocks.

Fix this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 09004d928d11..18184297e2f0 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2298,7 +2298,7 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	struct adv76xx_state *state = to_state(sd);
 	const struct adv76xx_chip_info *info = state->info;
 	unsigned int spa_loc;
-	u16 pa;
+	u16 pa, parent_pa;
 	int err;
 	int i;

@@ -2332,7 +2332,7 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 		return -E2BIG;
 	}
 	pa = v4l2_get_edid_phys_addr(edid->edid, edid->blocks * 128, &spa_loc);
-	err = v4l2_phys_addr_validate(pa, &pa, NULL);
+	err = v4l2_phys_addr_validate(pa, &parent_pa, NULL);
 	if (err)
 		return err;

@@ -2348,25 +2348,25 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	 * Return an error if no location of the source physical address
 	 * was found.
 	 */
-	if (spa_loc == 0)
+	if (edid->blocks > 1 && spa_loc == 0)
 		return -EINVAL;

 	switch (edid->pad) {
 	case ADV76XX_PAD_HDMI_PORT_A:
-		state->spa_port_a[0] = edid->edid[spa_loc];
-		state->spa_port_a[1] = edid->edid[spa_loc + 1];
+		state->spa_port_a[0] = pa >> 8;
+		state->spa_port_a[1] = pa & 0xff;
 		break;
 	case ADV7604_PAD_HDMI_PORT_B:
-		rep_write(sd, 0x70, edid->edid[spa_loc]);
-		rep_write(sd, 0x71, edid->edid[spa_loc + 1]);
+		rep_write(sd, 0x70, pa >> 8);
+		rep_write(sd, 0x71, pa & 0xff);
 		break;
 	case ADV7604_PAD_HDMI_PORT_C:
-		rep_write(sd, 0x72, edid->edid[spa_loc]);
-		rep_write(sd, 0x73, edid->edid[spa_loc + 1]);
+		rep_write(sd, 0x72, pa >> 8);
+		rep_write(sd, 0x73, pa & 0xff);
 		break;
 	case ADV7604_PAD_HDMI_PORT_D:
-		rep_write(sd, 0x74, edid->edid[spa_loc]);
-		rep_write(sd, 0x75, edid->edid[spa_loc + 1]);
+		rep_write(sd, 0x74, pa >> 8);
+		rep_write(sd, 0x75, pa & 0xff);
 		break;
 	default:
 		return -EINVAL;
@@ -2381,8 +2381,10 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 		rep_write_clr_set(sd, 0x71, 0x01, (spa_loc & 0x100) >> 8);
 	}

-	edid->edid[spa_loc] = state->spa_port_a[0];
-	edid->edid[spa_loc + 1] = state->spa_port_a[1];
+	if (spa_loc) {
+		edid->edid[spa_loc] = state->spa_port_a[0];
+		edid->edid[spa_loc + 1] = state->spa_port_a[1];
+	}

 	memcpy(state->edid.edid, edid->edid, 128 * edid->blocks);
 	state->edid.blocks = edid->blocks;
@@ -2409,7 +2411,7 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 		v4l2_err(sd, "error enabling edid (0x%x)\n", state->edid.present);
 		return -EIO;
 	}
-	cec_s_phys_addr(state->cec_adap, pa, false);
+	cec_s_phys_addr(state->cec_adap, parent_pa, false);

 	/* enable hotplug after 100 ms */
 	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 10);

