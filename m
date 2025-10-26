Return-Path: <linux-media+bounces-45571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE5CC0ADF4
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 17:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E45D24E181D
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 16:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D695B1D432D;
	Sun, 26 Oct 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0oBUwQs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A05320371E;
	Sun, 26 Oct 2025 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761496988; cv=none; b=b3ZjcIHcS6bQ9gmBRhiqLp5r6cPDOFIVlrxsG+D1sISSaKV2cTQnhwiBsA0cWMYL9Flm1u+n0LEZX44Y7j1uNBZSO+YClM/m14Ck5fxUvYxzZ0wBpSwh1EecNJ8CdwPbCqAkbm0IFsXm1YM8aNGzLMsewhr74pdDprZPIxAqq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761496988; c=relaxed/simple;
	bh=t26WzWS5o4AL4HW7AxiFlvpZvca+bRc899jEYvxzJjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSXn47GmzZhvmgiWX0QQ43gLBILYCiiOPjJh7BXamMisvqv8wPO/qmBgB2/mhe5C6UGZvrZp1A7mWW5s/pLAlmQ14b93YinQhhC64E/mibeDdsFEmIYvcl1ORhQHPoIzBSTxMc8k3Gx9iVmhBRXjZKnvFQiuK25S5kJ72vdOiLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0oBUwQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B977EC4CEFB;
	Sun, 26 Oct 2025 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761496987;
	bh=t26WzWS5o4AL4HW7AxiFlvpZvca+bRc899jEYvxzJjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E0oBUwQs5GC49syEtlYA09NfQXXvjMRv75KRuGBGJ9/BrYnGBqtDB0XhXCjlv01NN
	 +YGAEzCYnC9p3vjAkpEf0xFt0sjsw15QtvVopr6MX/k/nw9QA3+SQX3ZVPER65yG8f
	 ulFEIWi6UZ/8LwK7bwEorF0QbxjJkP9U0SsMWC00m9+YxVMMc2qd+m2mZCBmDznVmF
	 fxjX7bupib9a1DwSO1zq5yRdMEar/GkrY1m2dqVYBi6c5PIzrd8fbIYWLbD1ITEDyi
	 lrpsQACK9j+dR8XpuwGfjtufK1e9FwzdwAWg5ea3DxVtPbJY1fHKaeT92P+/hdwNfE
	 b/s0PGI2ZVdcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F68CCF9EC;
	Sun, 26 Oct 2025 16:43:07 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Date: Sun, 26 Oct 2025 18:43:03 +0200
Subject: [PATCH v4 2/2] media: uvcvideo: Add D436 and D555 cameras metadata
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-fix-uvc-v4-2-610eb1329600@realsenseai.com>
References: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com>
In-Reply-To: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761496986; l=2146;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=LCH5BFHjgpXxKtpVI2rPauvqh8gfX8golDGVFeO1zks=;
 b=t9WjTvoIFI9zSj/8De/p2yRdiPneTRjAkyq116kWzA71j0gnf+qQ3tdT8H6/kuTfUDXzCfKkl
 A27JXbKZKrDD8atBIb88o5ah3L8v1aa/78BhCipMMOOOPOevW+VYeSy
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

From: ymodlin <yogev.modlin@realsenseai.com>

Add support for Intel RealSense D436 and D555 depth cameras metadata.
These cameras use the D4XX metadata format for transmitting depth and
sensor information.

The D555 camera uses UVC protocol version 1.5, while the D436 uses
an undefined protocol version. Both cameras require the D4XX metadata
format flag to properly handle their metadata streams.

Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index dbdacc64ea6b..cf3ee33cdfd4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3196,6 +3196,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel Realsense D555 Depth Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x8086,
+	  .idProduct		= 0x0b56,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Intel Realsense D405 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
@@ -3223,6 +3232,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel Realsense D436 Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x8086,
+	  .idProduct		= 0x1156,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_UNDEFINED,
+	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },

-- 
2.43.0



