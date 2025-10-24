Return-Path: <linux-media+bounces-45454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF410C046A9
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 07:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8BB33B8D23
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 05:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4965F26B08F;
	Fri, 24 Oct 2025 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2F6OmVA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C62580E2;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761284991; cv=none; b=mmjQOqGnqcrEhCztIW4fq1SKsLrRxM4ize6nTNn8crQAlsYe1vPWwzKxW7jLSeDeNCklJMnn6HxJcoKArYlbNkQKZ52wbS0mMGOJ4VlsYa01eAVsQS8Io1Moc4WuLv5EfBUEiJq9odU5JOuCdqHlx5Vsr/Cy7YeNU974STPgD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761284991; c=relaxed/simple;
	bh=EdM/sy/5aeQUf8n/j4msd8ao+SjyIxXH6M1/eotnrXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUVC6hdwM05zfrJhyO3j4IG6mR7o59AOKn/gd1i4KFISI9uC4EB5m1AuUC0U8CHZwz0yoX9HuXwNRe32oBUQOoQYdeqFxv2u1FoYiYG2twSbft0jqKFcEePbcHI0rGlJbrdPSdCZkfgxbPg4CWNGXWbChLQZKXVC2RtteaeWXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2F6OmVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 457B4C116C6;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761284991;
	bh=EdM/sy/5aeQUf8n/j4msd8ao+SjyIxXH6M1/eotnrXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e2F6OmVAchIur0e0rmSI6BHgSOF6OJSqBGZ/E6hsQxHha6gewcCqQiUdeeiuHOeEc
	 uHHI1f+DnOktOERk8++gOvsm6VOxhM9PZEhWw6v/fslDtstMWk3D/PiMziEZv8woX4
	 wTuDBmR4NEfmMf3LkdsPPuqJeEF4TpVfzP73UtheneDgLlaEBG3q21YSsLXoDNilKc
	 G0qLD9BF87dpN18RljVIZhX/9vvMaVaWc13RG9G7ytcRI9VVXqFNe5IsMTvfwoh9WX
	 vRWHpkGhRoYVHwmZ07nUZ+Arc1Nafwab/gOvogA3uuUY2k/BT5lkQpKewgy7LOLDv+
	 BCwPKp855arMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0DCCCF9E9;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
From: Yogev Modlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Date: Fri, 24 Oct 2025 08:49:48 +0300
Subject: [PATCH v3 3/3] media: uvc: Add D436 and D555 cameras metadata
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-fix-uvc-v3-3-b7f83c012ca7@realsenseai.com>
References: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
In-Reply-To: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761284988; l=1832;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=iyrLXXvX6649ccACpjDB81ZR69kmGOLUpxdAJ8yQQ8w=;
 b=CpS2m7QQ8wrOXNVjTwBxqDseIklATOaiom16pdXFTEhbtfQCSLaUAcqmSVK4USMa2GmUtPq6f
 Q29L/XfaV0SCYrw6YzeliA/jSjwfNVqVUE3DpK/ncLSL7bBL4+fMQXR
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: Yogev Modlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

From: Yogev Modlin <yogev.modlin@realsenseai.com>

Add support for Intel RealSense D436 and D555 depth cameras metadata.
These cameras use the D4XX metadata format for transmitting depth and
sensor information.

The D555 camera uses UVC protocol version 1.5, while the D436 uses
an undefined protocol version. Both cameras require the D4XX metadata
format flag to properly handle their metadata streams.

Signed-off-by: Yogev Modlin <yogev.modlin@realsenseai.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index dbdacc64ea6b..6f0053a78123 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3223,6 +3223,24 @@ static const struct usb_device_id uvc_ids[] = {
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



