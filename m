Return-Path: <linux-media+bounces-15390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129593E6CC
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BDA0B21D2F
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338E914375A;
	Sun, 28 Jul 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BABfx6aH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37B142E92;
	Sun, 28 Jul 2024 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181635; cv=none; b=rBkGuuGHCwMAaEFJOCrZONNBLewPleVa1zckklXaioAYFHkbsYOESs9i36jP9uwJOtZueYe/+mXNzIDtFgz9oC/MoXFSqRDEW2Sn8Kmm/nXg4q2TastCsHE1PeIZoUP8UKdEkSdh7ycwD24l4nCx9MaVMQB8oVEOlwRpauXrlTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181635; c=relaxed/simple;
	bh=vpCcuT0FkR68ENM0B8uZt+NEuP8mNvg5ybYSh3hTwcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0i/416wVzS0rK0/WKvPGv6K1h6YPU3NZOJjxAt5JTN15McV/Zs3CFpsuGmQUyibDvbxi3Lwluxk00MuB2YmnGAq0SfOK32eusAEd4yY8ThVhUIaECJ7kzDn2tkhs5m7CHqCALoQ+84u0tbATUuKyVYvE5bmQaNvdH3PCV/n9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BABfx6aH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87491C116B1;
	Sun, 28 Jul 2024 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181635;
	bh=vpCcuT0FkR68ENM0B8uZt+NEuP8mNvg5ybYSh3hTwcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BABfx6aHRKI/FElZYuEgATg+hT58r9g0ClpUmxBMKBRIn+OTZL0W/cUBZix10++s0
	 wGdJ2+HiEOjXNw/nBSbRncrmfHH/uy74UtwK1s2Uyg1DUOIzPeoqa5+tPQFhYK7213
	 5znJQtcCEAw41c1HPYIII17LgvyGfxsM1IkMYKL2nXwSCgTMJzwKsRkY0+stsMgGhz
	 RYt9Ix3DrdX0C9Kh07jKV3BSgFQr8uaoeZ7PjCiW8e1Cj1Rj3mTbsRgNyVTnAitD3r
	 uPElGX9JxeF+w9v8G2ZU0KyCMrAcgeh5HYZecz99AfADbPo4Bq3eIYvuFDeeZQMjJ0
	 wCyRKjzzsSsAg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 15/20] media: uvcvideo: Remove mappings form uvc_device_info
Date: Sun, 28 Jul 2024 11:45:13 -0400
Message-ID: <20240728154605.2048490-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154605.2048490-1-sashal@kernel.org>
References: <20240728154605.2048490-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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
index e59a463c27618..121e7831d774d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2621,32 +2621,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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
index 88218693f6f0b..06c1a414ea5b2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -523,7 +523,6 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
-	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_status_streaming {
-- 
2.43.0


