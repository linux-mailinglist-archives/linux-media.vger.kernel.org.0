Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981C934406A
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 13:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhCVMFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 08:05:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60865 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230370AbhCVMEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 08:04:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OJIblvdOi4XAGOJIelXSSc; Mon, 22 Mar 2021 13:04:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616414688; bh=mtDT0SpRT9m9JfMA/3C1HQPqsxpzH9oTG4UjM4wBojg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lLr95vZPwhVKXisg1NKi53XUo4bwTRLG5lpYCr46fT4ZRsnepAsdabCLOgx99Nnzk
         MZNtwJGwBqlCGVQkEdbLFe+p0NHpOTJQziT3nLag530Lf+zb0p6Ene8bk6bmjNeiv9
         Flw9KaMSPjeRvr59tEt5YO3Y9r+xveKtR9mWwyEQtRHiZvhLyrTXlAYcgNvgP/t91T
         s8uutKgKQ5i79IQo2IahsZCZbb29WTZM1eb/YPN2IiBp7eFdLAUWTrw2JIKR3eGCyw
         Y8+n1V846KUzRfKc0ShzqpOiz6vdmAm9zBCOcdYQXzqqk0DvlmYibywHVzxDP1jbIG
         dnRKPhGBosrpA==
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
Message-ID: <b1c94f21-4ae1-148c-fa5f-f9e4719049b9@xs4all.nl>
Date:   Mon, 22 Mar 2021 13:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGdsPQeigVVyuMIYSQfu+u0Tnkaf/4FHzUsLIQlsIw5s6F3q8x8fxug7YkD0wYHi8N3M8OW8Q17yGjv7bN02fn5k+55VGV0Cel3AomVgpWqOkFBHouL6
 ef5dzRepM0vi7mKzn1PtJ+ZEMGyGfsZYPPiwDyoi7rZJwP8mkd4j1qEwTLKvRSOgzwJXdXMJRvfouJIxcUEMotC7TBjYgkMzgWFmW9+DzziQv+tpz8vnHkvt
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check for inactive controls in uvc_ctrl_is_accessible().
Use the new value for the master_id controls if present,
otherwise use the existing value to determine if it is OK
to set the control. Doing this here avoids attempting to
set an inactive control, which will return an error from the
USB device.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
Ricardo: this can be added to your uvc series. It avoids attempts to set
inactive controls.
---
 drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d9d4add1e813..6e7b904bc33d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1047,10 +1047,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 }

 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read)
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl)
 {
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
+	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
+	bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
+	s32 val;
+	int ret;
+	int i;

 	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
 		return -EACCES;
@@ -1065,6 +1073,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
 		return -EACCES;

+	if (read || try || !mapping->master_id)
+		return 0;
+
+	for (i = ctrls->count - 1; i >= 0; i--)
+		if (ctrls->controls[i].id == mapping->master_id)
+			return ctrls->controls[i].value ==
+					mapping->master_manual ? 0 : -EACCES;
+
+	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
+			   &master_ctrl, 0);
+
+	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		return 0;
+
+	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	if (ret >= 0 && val != mapping->master_manual)
+		return -EACCES;
+
 	return 0;
 }

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 12362e0f9870..e40db7ae18b1 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -803,8 +803,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	int ret = 0;

 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
-					    ioctl == VIDIOC_G_EXT_CTRLS);
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
+					    ioctl);
 		if (ret)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index aedb4d3d4db9..8849d7953767 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -869,7 +869,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read);
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl);

 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
-- 
2.30.0


