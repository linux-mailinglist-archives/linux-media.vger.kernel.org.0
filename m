Return-Path: <linux-media+bounces-33393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4758AC4075
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C0343AAD88
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3162220C03E;
	Mon, 26 May 2025 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PRdFC1QW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019EC20127A
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266211; cv=none; b=fYiyrjFpRse1wTU04wNZHlz5VbPw2TQjhTfwt2gNxFeEveSgu6KcLt8slrTZWvB+A5aHBPE53gAinxNsxAJho4L7g3FOJH54R2c+gPDQcYo/iWfw1Mme9geJAJ21qWgSl8Il0f+anLH6iqQ5lW4qV5SBFDe8Kt8cElFopPZh2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266211; c=relaxed/simple;
	bh=B+gfrPvPfbQ007mHnTlXz/lP/su1jkPTWL5kNtkbGZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuBGgwxXygkOLLdBUFhYjyJcKBVGWQN26pU7nXc+1LAS3SKeIUuLFcnVf8i6TFoT0atNmymA1PYX7KfEqlHYjqALlP4DfWyIbG86KiP2CiqCiNrjrDxY5oShvk4VC0hWptwwa3DKTG1xVXybNyjKnFOq0RWKyjYE7//jS+FUgTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PRdFC1QW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8617982;
	Mon, 26 May 2025 15:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748266182;
	bh=B+gfrPvPfbQ007mHnTlXz/lP/su1jkPTWL5kNtkbGZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PRdFC1QWUFOJBM3YN/GUXYbFm8woXsEvGCgGYBhGN+0lqL5Y41gaizm8qBnL4dyDZ
	 fIoi6g5e/3gFdkp6DNQO3HQol2gQ3ZSigx8rBpEMtkRuisLyFKAo/aUMeu/9RCgvS6
	 wGdIOZ3pia7mQ9Cei2tVCBgUPe5wL2ehWpSzB4OU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1.1 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
Date: Mon, 26 May 2025 15:30:01 +0200
Message-ID: <20250526133001.32038-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
clearing the handle. The only common code between the two cases is the
lockdep_assert_held.

The code looks cleaner if we split these two usecases in two functions.

We also take this opportunity to use pending_async_ctrls from ctrl where
possible.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Flip arguments order to uvc_ctrl_set_handle()
- Drop handle argument to uvc_ctrl_clear_handle()
---
 drivers/media/usb/uvc/uvc_ctrl.c | 68 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index f24272d483a2..303b7509ec47 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1851,48 +1851,48 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
-static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
-			       struct uvc_fh *new_handle)
+static int uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
 {
+	int ret;
+
 	lockdep_assert_held(&handle->chain->ctrl_mutex);
 
-	if (new_handle) {
-		int ret;
+	if (ctrl->handle) {
+		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
+				     "UVC non compliance: Setting an async control with a pending operation.");
 
-		if (ctrl->handle)
-			dev_warn_ratelimited(&handle->stream->dev->udev->dev,
-					     "UVC non compliance: Setting an async control with a pending operation.");
-
-		if (new_handle == ctrl->handle)
+		if (ctrl->handle == handle)
 			return 0;
 
-		if (ctrl->handle) {
-			WARN_ON(!ctrl->handle->pending_async_ctrls);
-			if (ctrl->handle->pending_async_ctrls)
-				ctrl->handle->pending_async_ctrls--;
-			ctrl->handle = new_handle;
-			handle->pending_async_ctrls++;
-			return 0;
-		}
-
-		ret = uvc_pm_get(handle->chain->dev);
-		if (ret)
-			return ret;
-
-		ctrl->handle = new_handle;
-		handle->pending_async_ctrls++;
+		WARN_ON(!ctrl->handle->pending_async_ctrls);
+		if (ctrl->handle->pending_async_ctrls)
+			ctrl->handle->pending_async_ctrls--;
+		ctrl->handle = handle;
+		ctrl->handle->pending_async_ctrls++;
 		return 0;
 	}
 
-	/* Cannot clear the handle for a control not owned by us.*/
-	if (WARN_ON(ctrl->handle != handle))
-		return -EINVAL;
+	ret = uvc_pm_get(handle->chain->dev);
+	if (ret)
+		return ret;
 
-	ctrl->handle = NULL;
-	if (WARN_ON(!handle->pending_async_ctrls))
+	ctrl->handle = handle;
+	ctrl->handle->pending_async_ctrls++;
+	return 0;
+}
+
+static int uvc_ctrl_clear_handle(struct uvc_control *ctrl)
+{
+	lockdep_assert_held(&ctrl->handle->chain->ctrl_mutex);
+
+	if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
+		ctrl->handle = NULL;
 		return -EINVAL;
-	handle->pending_async_ctrls--;
-	uvc_pm_put(handle->chain->dev);
+	}
+
+	ctrl->handle->pending_async_ctrls--;
+	uvc_pm_put(ctrl->handle->chain->dev);
+	ctrl->handle = NULL;
 	return 0;
 }
 
@@ -1910,7 +1910,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 
 	handle = ctrl->handle;
 	if (handle)
-		uvc_ctrl_set_handle(handle, ctrl, NULL);
+		uvc_ctrl_clear_handle(ctrl);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value;
@@ -2200,7 +2200,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		if (!rollback && handle && !ret &&
 		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
-			ret = uvc_ctrl_set_handle(handle, ctrl, handle);
+			ret = uvc_ctrl_set_handle(ctrl, handle);
 
 		if (ret < 0 && !rollback) {
 			if (err_ctrl)
@@ -3310,7 +3310,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
 			if (entity->controls[i].handle != handle)
 				continue;
-			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
+			uvc_ctrl_clear_handle(&entity->controls[i]);
 		}
 	}
 

base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
prerequisite-patch-id: 43cdc0977a6b8dd7167a6b2f5810d655e710cbeb
prerequisite-patch-id: 56e97ab2a2a6948c72aed53f53752a78e85de7c7
-- 
Regards,

Laurent Pinchart


