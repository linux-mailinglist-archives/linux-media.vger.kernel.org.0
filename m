Return-Path: <linux-media+bounces-15395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D293E6F7
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4E31C213C7
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8407112D1FF;
	Sun, 28 Jul 2024 15:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+CtT3wt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CB146A60;
	Sun, 28 Jul 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181737; cv=none; b=Bz3sc7bytqCsmZD2Kj1IbW0Xt35K772MsQGvgpAtjJkrNovH00b0KAbnDL1Blsah2B2BBXrLi6jTTDECNPNzU3j4JVpYFdmKGSCnufhO7he95v7FXINisLwSDPzJvD5rv3YXBfYnF+nmzjp0AOgGt5z7Xld17OBXxXCwW9NJne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181737; c=relaxed/simple;
	bh=ubxwpbxIOQYQMsrwXUt7Ai2VS4cl4Dw1PR8ubN0r3Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+p3ZoYWtcxbRglJ6IHwaiYGqYBGoDjuSNXUNFxlu9qy521TL2KYIuZ++yOOfIaPOXzRyIEICgB6Tw16CHNqe7Lc4RU5PZBO6qwAN+SDuYiF/HOzENKE6DOI8kULBtHFRLWTtUU7jnl8MdERk1RjoLEct21GkIRsRioSC6iY2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+CtT3wt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83ED6C4AF13;
	Sun, 28 Jul 2024 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181737;
	bh=ubxwpbxIOQYQMsrwXUt7Ai2VS4cl4Dw1PR8ubN0r3Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o+CtT3wtRBrGZYNvwxgY7pvMBmW2g21qAkQmQK4gp4uY0YtQ3mI+4Gb1ApJxllQ7H
	 I46/R957jj2CBStz2uWUDt3iX2WiqQQFHyJd0TLfrwT0xE25QH7E8YCEWHVABN8mf9
	 wlI+PoQE+Izm3zwbchRXwErSmvF9RA4/7ULC5dA0w95I+nzt+5zilpeu8pXKvyXXwS
	 OPk6ZsgEyr0CfoCBUvAifNrBK03PDxSwLh5ZKPXmCcm5Le+FEkKZCiwlJvXbjZEotF
	 yhAvN4c35iJ9zwhAg4XWfoqFoxq/ffjxBhzmcaGzG17YDWMclUgleIkXy1ih0iSPDo
	 hbKmjXL5ui7bA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/17] media: uvcvideo: Remove mappings form uvc_device_info
Date: Sun, 28 Jul 2024 11:47:22 -0400
Message-ID: <20240728154805.2049226-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154805.2049226-1-sashal@kernel.org>
References: <20240728154805.2049226-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 8c40efeda94108d65c52038ea82ee83b2fb933e2 ]

We do not have any quirk device making us of this. Remove from now. It
can be easily reverted later if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 27 +--------------------------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6d7535efc09de..cdf1d14aad5d3 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2533,32 +2533,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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
index 33e7475d4e64a..5faa256094d43 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -523,7 +523,6 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
-	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_device {
-- 
2.43.0


