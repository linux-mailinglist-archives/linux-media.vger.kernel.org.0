Return-Path: <linux-media+bounces-45422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC74C032B7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 664124F3C51
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 19:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DB334D918;
	Thu, 23 Oct 2025 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPffygOM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845234CFC8;
	Thu, 23 Oct 2025 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247460; cv=none; b=lyBLX9B7rGtYl1FbhEY+T7s1jXFXh7LHEWhBAOicEoFlzcn8O3sSb521vz0ebqd7xmWVurHvEbZ3tstvtvJ6eXXoPEJMKRFvlMXm4AqzdmsNfHPVvWx+ah1A8RdrOpZUPBDW8nZoFIGlu3B87mM7XULomfRQ9FbU/+3i9ulKCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247460; c=relaxed/simple;
	bh=x3Iel7e3TIG8TOAMR8VNovnrkUc0hLPTIjmEWChRMBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6HBK3ugkBcdLxlWS2/eQ8fJ3V25hVyzLAtqmix9vlw83RhYdvmXL8gjaXx83PKbe4Dhj6MUw5ZwoJm5RnGoTF3sz/Hm4ixzxLafCfE/Sf6wgBzJawqXr3qIPHtok6C96+nuX0zcTwzW1MJb6BqISF2n7Mj1zWI/LKMQnGxxfmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPffygOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 057BDC4CEFD;
	Thu, 23 Oct 2025 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761247460;
	bh=x3Iel7e3TIG8TOAMR8VNovnrkUc0hLPTIjmEWChRMBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZPffygOMKFkUTOVQHlYaw3dEixP3scqi7ZX6DBOZaq8SOVj650sEgN1184jNPzEYe
	 4bta4ewsOoZ7upNG53RitnkSPlgRIDlbhiwJZc5F7eHU1H4lVWxlGO9swesjKxjDoB
	 gPRfagY+xafGycx6csj4U11rbexbNpMQ+aQ11nCf7AB/u2bfuvw+xSpDi+uDueXsmY
	 ADQOwDMgGnYhc08e8GDnPGNRHt6Pu1MbHUXn8ZceKhT+SPDlFfRlY7m1V6KSwygNUE
	 6eza6pyMqcx/DiBKBcQOqw0imuj/eMbSOobHMukEFztkx207nSfES9joJSk4Tbm92W
	 4HPYXa6o4otmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAC5CCF9E5;
	Thu, 23 Oct 2025 19:24:19 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Date: Thu, 23 Oct 2025 22:24:15 +0300
Subject: [PATCH v2 2/2] media: uvc: Add RealSense vendor prefix to Intel
 camera comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-fix-uvc-v2-2-1c93853257dc@realsenseai.com>
References: <20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com>
In-Reply-To: <20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761247458; l=4001;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=ABdr+wkWJwGbsZdorE7WJmV7KucbGjsqeVTDQNBUj5c=;
 b=FD86vL8cay22dp8QSk6Y8UM2DT8Sh9t0IzKOm73wlj4fWzzVaeZ5WQ5B4+7YTe7Gj379JhHfW
 s0DNIJeEx63CM+iXEGpWIyOpBKWCjQYskI5a7SkOtaytihZBAsnyXX4
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

From: ymodlin <yogev.modlin@realsenseai.com>

Update comment strings for 'Intel RealSense' depth cameras to include
the "RealSense" vendor prefix for better identification.

Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b1457678833e..dbdacc64ea6b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
-	/* Realsense D410/ASR depth camera */
+	/* Intel Realsense D410/ASR depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D415/ASRC depth camera */
+	/* Intel Realsense D415/ASRC depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D430/AWG depth camera */
+	/* Intel Realsense D430/AWG depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense RealSense D4M */
+	/* Intel Realsense RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D435/AWGC depth camera */
+	/* Intel Realsense D435/AWGC depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D435i depth camera */
+	/* Intel Realsense D435i depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D405 Depth Camera */
+	/* Intel Realsense D405 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D455 Depth Camera */
+	/* Intel Realsense D455 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Realsense D421 Depth Module */
+	/* Intel Realsense D421 Depth Module */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,

-- 
2.43.0



