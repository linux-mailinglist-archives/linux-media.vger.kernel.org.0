Return-Path: <linux-media+bounces-625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 065987F1CF3
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 19:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B319028273F
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 18:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C52A321A9;
	Mon, 20 Nov 2023 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 306 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Nov 2023 10:53:27 PST
Received: from irl.hu (irl.hu [95.85.9.111])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1A210E;
	Mon, 20 Nov 2023 10:53:27 -0800 (PST)
Received: from fedori.lan (51b689b3.dsl.pool.telekom.hu [::ffff:81.182.137.179])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FE64.00000000655BA9F1.000F4952; Mon, 20 Nov 2023 19:48:17 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 RESEND] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0 as default
Date: Mon, 20 Nov 2023 19:47:51 +0100
Message-ID: <088902f67634fb0931da7b045e05afe5c8197cdc.1700505816.git.soyer@irl.hu>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Devices with pan/tilt controls but without pan/tilt speed controls
return 1 for the default value of V4L2_CID_PAN_SPEED or
V4L2_CID_TILT_SPEED. For these controls, the value of 1 means a
move and that's not a good default.

Currently, for these controls the UVC_GET_DEF query returns
bPanSpeed or bTiltSpeed of CT_PANTILT_RELATIVE_CONTROL.

According to the UVC 1.5 specification, the default value of bPanSpeed
or bTiltSpeed should be 1 if the pan/tilt control doesn't support
speed control.

"If the control does not support speed control for the Tilt control,
it will return the value 1 in this field for all these requests."

This patch modifies the uvc_ctrl_get_rel_speed to return hardcoded 0
for UVC_GET_DEF query, because that's the stop or don't move value
for these V4L2 controls.

Previous discussion
Link: https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5e9d3da862dd..e131958c0930 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
 		return -data[first+1];
 	case UVC_GET_MAX:
 	case UVC_GET_RES:
+		return data[first+1];
 	case UVC_GET_DEF:
 	default:
-		return data[first+1];
+		return 0;
 	}
 }
 

base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
-- 
2.42.0


