Return-Path: <linux-media+bounces-45227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB825BFB941
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63D334E9309
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E360032E6AF;
	Wed, 22 Oct 2025 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRM8OOzt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5D32E681;
	Wed, 22 Oct 2025 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131727; cv=none; b=iMIlI+ySGWIzhXJc6OCglsAWN9TLQku431QzHrR8t/cFhaEs83WFMKwjIbhyalWPy5BxRV13C3eOs7kEYKBTX8/iuHbSd6bflx8fH6xrhpaDRLnF0gMN7C1xuk83qYHVxaAA3X3r0wEhyQIcUpBTmRApq5p9GSsJAKVZBhEW4mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131727; c=relaxed/simple;
	bh=zqEtTCmUJN4qGhaAfRYaU2isx43npYjMqyN5nDxEAx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YDI3X9BtWvNET4SoAfM3OtkpWHUgOrazp8SF72eXutSO4IY7mryWlYQKwdVIGRQW/foOzZKYqogRSneXvdeMzU0mWRFnKKWs6+4a7K6pwQZL91Uxdtq+wxixiyHfIHCc6OdOY9H0wMmc71an6choWUGqnIJ7QMoqG68i5HbRN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRM8OOzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF317C4CEE7;
	Wed, 22 Oct 2025 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761131726;
	bh=zqEtTCmUJN4qGhaAfRYaU2isx43npYjMqyN5nDxEAx0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rRM8OOztunZWIymrNoO+Fy9fUipjkLzsUCi1TP4vjIjcVM6DqeSSVea6XY7QaACF0
	 5I5UjhEXicUzBtbiZE6t/Rf9dwensuVrPjutjjPD/0FlzvW300Yt8BTc/ej7sO9w6b
	 IKB5xJ1bDhBpR2bsBJkK/eaU8L0BNpvKkBw7Fg+ul3NxP5e/8/b0AF4Ja25VhD3cxu
	 LzlH0sU/Pcp7+gII7m+v5qfiUY9wxSVBTfy8LXlqO9A15H65DQY7QHDh4NOLSpWObs
	 eWE2xz2PZEm8jOoGmEmLVbN3w8RZk4BCZqojNWiAK1UfefQASdRq9XlJLJK6WlrlR3
	 0w4FozXojo0Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BF2CCD1AB;
	Wed, 22 Oct 2025 11:15:26 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Date: Wed, 22 Oct 2025 14:15:18 +0300
Subject: [PATCH] change: drop 'Intel' from RealSense camera comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-fix-uvc-v1-1-e4cd03606735@realsenseai.com>
X-B4-Tracking: v=1; b=H4sIAMW8+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3bTMCt3SsmRdI0tj85QkY8PkREtjJaDqgqJUoBTYpOjY2loAC6v
 3y1kAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yogev Modlin <yogev.modlin@realsenseai.com>, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761131725; l=4253;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=vetAyfvSfxHLKMYbudFyIvkX+DxlHNbHORbyaU7GB68=;
 b=V4VF3vBAhDjxk2g8/UoqJxHvcjLmAvIG5RVjBE63QjfyQNu8PT48l/NlCpz5bSeMh0bw2REvf
 zK8A6tZA4hNDCNZphFS0jtoDnlFruXffHlBut5tudGEO2tVU0CcIled
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

From: ymodlin <yogev.modlin@realsenseai.com>

RealSense branding is now independent of Intel. Update all driver
comments referencing "Intel RealSense" to just "RealSense" to reflect
current ownership. No code logic changes.

Signed-off-by: Yogev Modlin <yogev.modlin@realsenseai.com>
---
Since Realsense has been spin-off Intel, the comment should be change.

Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f0..b1457678833e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
-	/* Intel D410/ASR depth camera */
+	/* Realsense D410/ASR depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D415/ASRC depth camera */
+	/* Realsense D415/ASRC depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D430/AWG depth camera */
+	/* Realsense D430/AWG depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel RealSense D4M */
+	/* Realsense RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D435/AWGC depth camera */
+	/* Realsense D435/AWGC depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D435i depth camera */
+	/* Realsense D435i depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D405 Depth Camera */
+	/* Realsense D405 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D455 Depth Camera */
+	/* Realsense D455 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D421 Depth Module */
+	/* Realsense D421 Depth Module */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,

---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20251022-fix-uvc-2937db31ca93

Best regards,
-- 
ymodlin <yogev.modlin@realsenseai.com>



