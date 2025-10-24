Return-Path: <linux-media+bounces-45451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F67C046AF
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 07:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 320594E5370
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 05:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B59269B1C;
	Fri, 24 Oct 2025 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBwWRkJ5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883F925785D;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761284991; cv=none; b=ss3WGaPSsFYO8qDLVE0E8K7R2v7PlrQBWn4s8OsV37v0yyrX5nGEj8nV6orMtqj2jwu/6ka8SVFSlLiFAm2v9lHaH0lX/7BK8LnVYpPTwVl0FdZNyAirXH5KepYAkLwD5NHkDVEJUVQbLUksX5S/+zK8NlNSn5frxUGqkXhZea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761284991; c=relaxed/simple;
	bh=rdfOFrGw0lZEyQTo+2Qo9k+Mpd1nYAXgb3iOAyxHaP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=na/NldM9oWZdAgCL8WiwxWSI+dlrFB61GvB71jg8vCIGcxLQ+qe2tO3N+rFyJvmCPVMnyJPYktOdnjTLnNKFhCM4k8kX/ovAP8aA+eUJNa6D3f8UczWNbUK3kPNfj4WYrYPr1ySzYR/ZqP6dyD/GdZ786ur6iGxbOZ6GhxSTJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBwWRkJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EA6EC4CEF1;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761284991;
	bh=rdfOFrGw0lZEyQTo+2Qo9k+Mpd1nYAXgb3iOAyxHaP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sBwWRkJ5B9N3VucE+XtOmN5K5506O2dpXhGTmlkIzx2I5uRRfIgXTTy1PB1WCHk8E
	 cHIpIysUWjAslgn+k2cnaCP2OYJ+PNlHz5sqUHCanM8FNS8iz84sUuXtp8HTmQ3ew6
	 yIF8tCL8/CEIn+CdhJd9cbkDanGKCwPN9s1Udk1WqU+gJzSDKhauXUQt8wnSY+tluN
	 kl0XlsNf/440uikBkvPylO0CI/L9Km4ow63aHJCdqlvIFi0sH73L+e5zHF9ShS8cZi
	 YHZ8ccvex6Kx3opAkbjr/yk4RfodsD8o/zTw1Tu+cNnvtBqVzzHTTMHHIkV72wXF4Q
	 nDVyjnfNkI8fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231A9CCD1AB;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Date: Fri, 24 Oct 2025 08:49:46 +0300
Subject: [PATCH v3 1/3] change: drop 'Intel' from RealSense camera comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-fix-uvc-v3-1-b7f83c012ca7@realsenseai.com>
References: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
In-Reply-To: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761284988; l=3968;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=7fC0amnjI3i8ZCMek8+FyPEdsTPz6GrCi5GLQmNFBjs=;
 b=zqOd4EmdA2Eo2YUCh3htDTSx9bN+KRoP7UATPR9pYx7PCmKuQIdLp8Yk04NjmQqnrJiBAw6jt
 js/JdE/1yCND4WaGVaoweRS/RFF4LcZmZ9MQeaKO60amxEhtQndKNfY
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

-- 
2.43.0



