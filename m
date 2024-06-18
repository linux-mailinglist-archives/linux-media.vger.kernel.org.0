Return-Path: <linux-media+bounces-13585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37390D94C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413481C2445F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A591386C6;
	Tue, 18 Jun 2024 16:33:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B04D8BD;
	Tue, 18 Jun 2024 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728393; cv=none; b=Kv+zo9ey2yUTnXJzqJN4nomqXqu6SLaWu+FY0rDX7M5bQD0ARrI5cBw5uUVbzf5gIfCEzeFuHFNzqymmobWk72a81j7DPnGOH1dsAl9Mi3Yo19EtT/T8OeY+dri/GX++BCXrLoI5/rHPC4CKTXcolLVzA6Y8P8054pTvxXWgtP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728393; c=relaxed/simple;
	bh=7q4SLjqvoE5tKhcBw6h3BfxkMgZ1oGX4akOqYJf6/LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type; b=C8uZywfpAZzYNdipjHTUNJEkr4tTNZEb0JWiD58aH1EwC3Rw1BN98AuyDkpF3CXi8IX7Nl7WiYQWKEwmGALURTb7YNZWzUDeqdarQYC4lKhV2619ScvldUWawR6o4ZQfx4XZp3JCMU63Yb3jbBBFHWU6iGjM4mAn64PAwmrats0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b69c7d.dsl.pool.telekom.hu [::ffff:81.182.156.125])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071665.000000006671B6C4.002A21A5; Tue, 18 Jun 2024 18:33:03 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  John Bauer <johnebgood@securitylive.com>, ribalda@chromium.org,
  linh.tp.vu@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v3 1/1] media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.
Date: Tue, 18 Jun 2024 18:32:40 +0200
Message-ID: <b062c3ec615a69cbc1b154b1838df3cdc3e1282a.1718726777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718726777.git.soyer@irl.hu>
References: <cover.1718726777.git.soyer@irl.hu>
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

The minimum UVC control value for the relative pan/tilt/zoom speeds
cannot be probed as the implementation condenses the pan and tilt
direction and speed into two 16 bit values. The minimum cannot be
set at probe time because it is probed first and the maximum is not
yet known. With this fix if a relative speed control is queried
or set the minimum is set and checked based on the additive inverse of
the maximum at that time.

Signed-off-by: John Bauer <johnebgood@securitylive.com>
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 38 +++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4b685f883e4d..93ed2462e90b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -441,7 +441,6 @@ static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
 		return (rel == 0) ? 0 : (rel > 0 ? data[first+1]
 						 : -data[first+1]);
 	case UVC_GET_MIN:
-		return -data[first+1];
 	case UVC_GET_MAX:
 	case UVC_GET_RES:
 	case UVC_GET_DEF:
@@ -1233,6 +1232,17 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
+static bool is_relative_ptz_ctrl(__u32 ctrl_id)
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
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl,
 	struct uvc_control_mapping *mapping,
@@ -1322,14 +1332,23 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		break;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
-		v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
-
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
 				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
+		/*
+		 * For the relative speed implementation the minimum
+		 * value cannot be probed so it becomes the additive
+		 * inverse of maximum.
+		 */
+		if (is_relative_ptz_ctrl(v4l2_ctrl->id))
+			v4l2_ctrl->minimum = -v4l2_ctrl->maximum;
+		else
+			v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
+						uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	}
+
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
 		v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
 				  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
@@ -1916,6 +1935,15 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 		max = mapping->get(mapping, UVC_GET_MAX,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+
+		/*
+		 * For the relative speed implementation the minimum
+		 * value cannot be probed so it becomes the additive
+		 * inverse of maximum.
+		 */
+		if (is_relative_ptz_ctrl(xctrl->id))
+			min = -max;
+
 		step = mapping->get(mapping, UVC_GET_RES,
 				    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 		if (step == 0)
-- 
2.45.2


