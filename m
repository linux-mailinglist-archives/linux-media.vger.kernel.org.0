Return-Path: <linux-media+bounces-47159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CEC5FD59
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 02:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C6073BAE1D
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 01:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DD11C3BF7;
	Sat, 15 Nov 2025 01:30:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337613D521;
	Sat, 15 Nov 2025 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763170238; cv=none; b=d2p6z4mmridl2u2cVDrQv7zvX17MK/NogLTfk9ePmYYUfl9x+g/AQUFpaN0xGlPwUqlAvJA8Vt82Jn2B3sJo5TAbG9O9Bmlkrkn/kBA/Y5NmqvuM1m7J8aXkYNVTYym8UGrqmxgmJP/tEqZIk8a+/hcxwrU/PBWWMGQjeQoQIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763170238; c=relaxed/simple;
	bh=+jjPCsTMv2g9V4AV1f9+ey/xZSQwfi5ZtkXT3bcuN/0=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=purQikwUW4NLFMc+3jbNdC4lPGEhlIcB9tz5Tnlwd5gZESkHPA+PWCeZ9D71NutQOJqBUzVgF8isQLoOyD1Kf30nDa4PDc5dXCg9jwWxWR5JmEr7jsz/x+hS6DL2ZvzMO4U72OZqcwr52KNKQuoOseESXvm/2wPOWkrYy3o4Tnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b69c3a.dsl.pool.telekom.hu [::ffff:81.182.156.58])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000830C5.000000006917D7B4.00328662; Sat, 15 Nov 2025 02:30:28 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  John Bauer <johnebgood@securitylive.com>,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v5] media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.
Date: Sat, 15 Nov 2025 02:30:07 +0100
Message-ID: <20251115013007.4842-1-soyer@irl.hu>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

From: John Bauer <johnebgood@securitylive.com>

For relative PTZ controls, UVC_GET_MIN for b(Pan|Tilt|Zoom)Speed
returns the minimum speed of the movement in direction specified
in the sign field.

So in the negative direction, only the slowest speed can be used
at the moment.

For minimum value, use maximum speed but in negative direction.

Signed-off-by: John Bauer <johnebgood@securitylive.com>
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
Changes in v5:
- Rebased on 6.18
- Link to v4: https://lore.kernel.org/all/cover.1718835633.git.soyer@irl.hu/

Changes in v4:
- Based on Ricardo's suggestion, only query the min value in uvc_ctrl_set
  if necessary
- Rename is_relative_ptz_ctrl function to uvc_ctrl_is_relative_ptz for
  consistency
- Rename 'relative speed implementation' to 'relative PTZ controls' in
  comments
- Fix indentation of comments
- Reduce the length of the new lines to 80
- Link to v3: https://lore.kernel.org/all/cover.1718726777.git.soyer@irl.hu/

Changes in v3:
- Based on Ricardo's suggestion, I squashed the two patches.
- Link to v2: https://lore.kernel.org/all/20240405-uvc-fix-relative-ptz-speed-v1-0-c32cdb2a899d@securitylive.com/

Changes in v2:
- Made recommended changes, moved control check to helper function and removed dead code.
- Link to v1: https://lore.kernel.org/all/20240326-uvc-relative-ptz-speed-fix-v1-1-453fd5ccfd37@securitylive.com/
---
 drivers/media/usb/uvc/uvc_ctrl.c | 52 +++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2905505c240c..38a7d71526c2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -526,8 +526,6 @@ static int uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
 		*out = (sign == 0) ? 0 : (sign > 0 ? value : -value);
 		return 0;
 	case UVC_GET_MIN:
-		*out = -value;
-		return 0;
 	case UVC_GET_MAX:
 	case UVC_GET_RES:
 	case UVC_GET_DEF:
@@ -1517,6 +1515,17 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
+static bool uvc_ctrl_is_relative_ptz(__u32 ctrl_id)
+{
+	switch (ctrl_id) {
+	case V4L2_CID_ZOOM_CONTINUOUS:
+	case V4L2_CID_PAN_SPEED:
+	case V4L2_CID_TILT_SPEED:
+		return true;
+	}
+	return false;
+}
+
 /*
  * Maximum retry count to avoid spurious errors with controls. Increasing this
  * value does no seem to produce better results in the tested hardware.
@@ -1576,18 +1585,28 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 		break;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
-		v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
-	else
-		v4l2_ctrl->minimum = 0;
-
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 	else
 		v4l2_ctrl->maximum = 0;
 
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
+		/*
+		 * For relative PTZ controls, UVC_GET_MIN for
+		 * b(Pan|Tilt|Zoom)Speed returns the minimum speed of the
+		 * movement in direction specified in the sign field.
+		 * For minimum value, use maximum speed but in negative direction.
+		 */
+		if (uvc_ctrl_is_relative_ptz(v4l2_ctrl->id))
+			v4l2_ctrl->minimum = -v4l2_ctrl->maximum;
+		else
+			v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping,
+				UVC_GET_MIN, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	} else {
+		v4l2_ctrl->minimum = 0;
+	}
+
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
 		v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
@@ -2449,6 +2468,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
 
 static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
 			  struct uvc_control *ctrl,
+			  u32 v4l2_id,
 			  struct uvc_control_mapping *mapping,
 			  s32 *value_in_out)
 {
@@ -2466,10 +2486,20 @@ static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
 				return ret;
 		}
 
-		min = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
-					  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 		max = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
 					  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+		/*
+		 * For relative PTZ controls, UVC_GET_MIN for
+		 * b(Pan|Tilt|Zoom)Speed returns the minimum speed of the
+		 * movement in direction specified in the sign field.
+		 * For minimum value, use maximum speed but in negative direction.
+		 */
+		if (uvc_ctrl_is_relative_ptz(v4l2_id))
+			min = -max;
+		else
+			min = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+
 		step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
 					   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 		if (step == 0)
@@ -2583,7 +2613,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		return -EACCES;
 
-	ret = uvc_ctrl_clamp(chain, ctrl, mapping, &xctrl->value);
+	ret = uvc_ctrl_clamp(chain, ctrl, xctrl->id, mapping, &xctrl->value);
 	if (ret)
 		return ret;
 	/*
-- 
2.51.1


