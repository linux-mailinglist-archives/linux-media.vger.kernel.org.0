Return-Path: <linux-media+bounces-3808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D18308CB
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 262E51C23C93
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 14:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426B5219F6;
	Wed, 17 Jan 2024 14:52:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9CA219F4
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503127; cv=none; b=GUmDrIagx4+fXfquKIv4B8BD4oVgGByQpZlaNQeXTpL8wNfVL6MzRtQ/gYq0oyeV0jqCo+jV3DoCL5mB09fiumfolFXsUMTCMJ9z8C49ZrhfuP4zLLieayefRoK4MghFUlglTnu8WPmXH1iDAccE6Tbq/3k7tmua/kgplpt6Gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503127; c=relaxed/simple;
	bh=Fwtcj/WkxSwpT1R84SAhuNKJZ8nJXHSqYKlsT4zzQd0=;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:From:Subject:Content-Type:Content-Transfer-Encoding; b=rsbaOEcoekFkvlg/RCc/HxUE6rzUtHz0eKX/zD7x457J1hcWAqTZ+6wd7JRrCdt/2E2kUYmDI7tXhynH1nzEWvIU73q2bVw281jnr/mIa285XQJLiF57eaK3hdEx9rVLCYVLSNuy0ffgTY2+328Kyx2oIZ2vBXuJHcdj7Pd6FBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E55C433F1
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 14:52:06 +0000 (UTC)
Message-ID: <17e27e8f-dc88-486f-9b7a-1860d8053788@xs4all.nl>
Date: Wed, 17 Jan 2024 15:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-ctrls: show all owned controls in, log_status
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

VIDIOC_LOG_STATUS will log the controls owned by the driver. But the
code didn't take into account the case where a single driver creates
multiple control handlers. A good example is the vivid driver, but
others use it as well.

Modify v4l2_ctrl_handler_log_status() so that it really shows all
controls owned by this driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 4cfa4cebbee0..61e4a756837e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2562,7 +2562,8 @@ int v4l2_ctrl_handler_setup(struct v4l2_ctrl_handler *hdl)
 EXPORT_SYMBOL(v4l2_ctrl_handler_setup);

 /* Log the control name and value */
-static void log_ctrl(const struct v4l2_ctrl *ctrl,
+static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
+		     struct v4l2_ctrl *ctrl,
 		     const char *prefix, const char *colon)
 {
 	if (ctrl->flags & (V4L2_CTRL_FLAG_DISABLED | V4L2_CTRL_FLAG_WRITE_ONLY))
@@ -2572,7 +2573,11 @@ static void log_ctrl(const struct v4l2_ctrl *ctrl,

 	pr_info("%s%s%s: ", prefix, colon, ctrl->name);

+	if (ctrl->handler != hdl)
+		v4l2_ctrl_lock(ctrl);
 	ctrl->type_ops->log(ctrl);
+	if (ctrl->handler != hdl)
+		v4l2_ctrl_unlock(ctrl);

 	if (ctrl->flags & (V4L2_CTRL_FLAG_INACTIVE |
 			   V4L2_CTRL_FLAG_GRABBED |
@@ -2591,7 +2596,7 @@ static void log_ctrl(const struct v4l2_ctrl *ctrl,
 void v4l2_ctrl_handler_log_status(struct v4l2_ctrl_handler *hdl,
 				  const char *prefix)
 {
-	struct v4l2_ctrl *ctrl;
+	struct v4l2_ctrl_ref *ref;
 	const char *colon = "";
 	int len;

@@ -2603,9 +2608,12 @@ void v4l2_ctrl_handler_log_status(struct v4l2_ctrl_handler *hdl,
 	if (len && prefix[len - 1] != ' ')
 		colon = ": ";
 	mutex_lock(hdl->lock);
-	list_for_each_entry(ctrl, &hdl->ctrls, node)
-		if (!(ctrl->flags & V4L2_CTRL_FLAG_DISABLED))
-			log_ctrl(ctrl, prefix, colon);
+	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
+		if (ref->from_other_dev ||
+		    (ref->ctrl->flags & V4L2_CTRL_FLAG_DISABLED))
+			continue;
+		log_ctrl(hdl, ref->ctrl, prefix, colon);
+	}
 	mutex_unlock(hdl->lock);
 }
 EXPORT_SYMBOL(v4l2_ctrl_handler_log_status);
-- 
2.40.1


