Return-Path: <linux-media+bounces-13347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A590A0C4
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3C61C20F4F
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8CC757EA;
	Sun, 16 Jun 2024 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kSZGoPTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C757345A
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579663; cv=none; b=hA5SYoYh3sgASQLwOpzfge2R2dtdaOcpZiy6rnFZEo3SvMJM+B62edMthmO20Rtc8Mr4s8mbY3w6ikNjHO5IxnA6lKQCEXs6sE47FkYH0vcZDr4x4TcAdTJy8Amd0lw4VuyHRpvko+ADIqvKOs9qqVMfWk2ZGKLFOBMq04FoCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579663; c=relaxed/simple;
	bh=ty92+51p503s5GdOukIwOXXvA3Ib9qMnJPk9CxE/ZAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZsslLkz+a1KAYGWh7gS4sCRY0tvmKyUPd+ottQbdLdi96wCijWKGZKD+mHFjyvdzXsRMGnzdrTbW7IDKJlBvggZykG8SfP7WNb/ry4urrFoOJsSxpZXRvA/vFm/kBB3NTd+XxPKOpgn4lh3gbkWt4mJNIZkDG9lzw4NUeAUnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kSZGoPTQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE4162D5;
	Mon, 17 Jun 2024 01:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579644;
	bh=ty92+51p503s5GdOukIwOXXvA3Ib9qMnJPk9CxE/ZAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSZGoPTQhoc4cHm924Mf+JHeJ48gtCR0UYwD2oal5QVGtzmo3hkimyVk0auq2Oq1c
	 nNVGa8tk950tzK4FzhFCXLglJnvqifFauKs8FHEIkAk3xMN+Rb4MDiBo2a4NIWXLiG
	 KActar7Mrv6tKummN+kA/J7b8rjIA1FFkcfN9m08=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 6/6] media: uvcvideo: Remove mappings form uvc_device_info
Date: Mon, 17 Jun 2024 02:13:50 +0300
Message-ID: <20240616231350.6787-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

We do not have any quirk device making us of this. Remove from now. It
can be easily reverted later if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 27 +--------------------------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e2452ba62939..9a78baaf927b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2669,32 +2669,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
-	/*
-	 * First check if the device provides a custom mapping for this control,
-	 * used to override standard mappings for non-conformant devices. Don't
-	 * process standard mappings if a custom mapping is found. This
-	 * mechanism doesn't support combining standard and custom mappings for
-	 * a single control.
-	 */
-	if (chain->dev->info->mappings) {
-		bool custom = false;
-
-		for (i = 0; chain->dev->info->mappings[i]; ++i) {
-			const struct uvc_control_mapping *mapping =
-				chain->dev->info->mappings[i];
-
-			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
-			    ctrl->info.selector == mapping->selector) {
-				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-				custom = true;
-			}
-		}
-
-		if (custom)
-			return;
-	}
-
-	/* Process common mappings next. */
+	/* Process common mappings. */
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
 		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index da3c38922ebd..d21d83a6d7a4 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -530,7 +530,6 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
-	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_status_streaming {
-- 
Regards,

Laurent Pinchart


