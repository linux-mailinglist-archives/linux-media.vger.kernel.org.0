Return-Path: <linux-media+bounces-18300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B42979871
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 21:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6195D2828E1
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 19:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237D71C9EB4;
	Sun, 15 Sep 2024 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="rIbSh0Bx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364E1B85D9
	for <linux-media@vger.kernel.org>; Sun, 15 Sep 2024 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726428758; cv=none; b=AMd9WOdxlJkjogGOq7XSQTe3OeiXPHlfi+jDFFXB4bFGMN6XOoGJTyjifXWB6R8W29UX/C96YBRHGzwE6VXrkfA1Acd5X1qrsedHQ2ljCN1rjPLkLkmII60TIu9/xKj/2MrRKLPtk9Qpq/xFX3oEut5B9s2oWGbtRSZbcSbaIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726428758; c=relaxed/simple;
	bh=3Q7LotnhPR8JLJS6JFR6FUlbnK//MHDGs5Ykftr13dA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fI2OZbjR+Qm+fTdjOoPbLwF0x/KMqOsnuLpf75IaHSiM9f6Bx5KBaWuWr2T7IUki/ehJd+zq8aIWpDSwkjLRVY5pw5GXoxLS3zOKlGqYryJHbMFCLxiMvsU52fFWBQ1Qq80AKZ56WIkxOvkZEBGl1bXyGJoXqoXJPjGRrz7dsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=rIbSh0Bx; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=qC7/UsNfPiGZO3MfZD2VHDkx+uMRSha0Rm3F7MqZaB4=; b=rIbSh0Bx41NxmjYs1FZGaqimxH
	n3Li8TQK59VPMHvygobbNf5c92Z39a8IeW5lnhAmSo6aGHwibgKriA2utfsL3b8EwPT/8X3qXjuMM
	21XeDOTXqBR4m2YKKYKM3xZO3MA+oC4pclh6XzeKjHBeOfJq2Dacr4D0089QGDXBlqzyo3irEjgEE
	iBO5AH3x+MvBlrmpDrxoAPGE3+jkTKJTIdAWe17NkUpZs07noEprhls3ahUQY5v3plwd0f7F89yrI
	3jxzmLLcy1vRXZqdW++bcZS7obwLzHzItwDFeYLAXVlxD7oUhD7wmdAmbVE5f6nWR0NYje5tTlP0e
	977RONuw==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1spuyw-009Wbg-Au
	for linux-media@vger.kernel.org; Sun, 15 Sep 2024 20:32:26 +0100
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d87176316eso3413667a91.0
        for <linux-media@vger.kernel.org>; Sun, 15 Sep 2024 12:32:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Yymp+88j1W1CVaxt9N6jjmYnE7TA4q8LKmqGfVo/LygooBDuDmq
	R5FKt8GZt1ccAOpsVrMgHIrZwuTc0dotXp4ukS0ZTmxPfvD0AIK3odyY4M01wlDjHWeXz3ZU9H8
	wgKvTJG95C7WYYcq78ITu0jB+nno=
X-Google-Smtp-Source: AGHT+IFmTFAy4bD3er8dlS3zSUX/C65Wb4ggV1sXIdGlmcNAve3oKZGn0sSuMRk9HtbpVd6UU1kyJGVKSm0TlPJughA=
X-Received: by 2002:a17:90a:2f06:b0:2c9:90fa:b9f8 with SMTP id
 98e67ed59e1d1-2db9fc66af5mr19593840a91.10.1726428743392; Sun, 15 Sep 2024
 12:32:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David Given <dg@cowlark.com>
Date: Sun, 15 Sep 2024 21:32:12 +0200
X-Gmail-Original-Message-ID: <CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com>
Message-ID: <CALgV52gHPWrcBBv2m6fAAyF_i_8T7cRTtBRS+FKe4TgfRVG0DA@mail.gmail.com>
Subject: [PATCH] uvc: add support for the Kaiweets KTI-W02 infrared camera
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 0

- adds support for the D3DFMT_R5G6B5 bitmap format (just RGBP but with
a different GUID)
- adds a quirk for the Kaiweets camera which uses it

The camera uses an NXP chipset (product ID 0x1fc9), but I can't find
any references to a device with vendor ID 0x009b. It may be specific
to the Kaiweets camera.

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index c54c2268f..c12d58932 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
         .guid        = UVC_GUID_FORMAT_RGBP,
         .fcc        = V4L2_PIX_FMT_RGB565,
     },
+    {
+        .guid        = UVC_GUID_FORMAT_D3DFMT_R5G6B5,
+        .fcc        = V4L2_PIX_FMT_RGB565,
+    },
     {
         .guid        = UVC_GUID_FORMAT_BGR3,
         .fcc        = V4L2_PIX_FMT_BGR24,
diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08..5a29f6970 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3072,6 +3072,15 @@ static const struct usb_device_id uvc_ids[] = {
       .bInterfaceSubClass    = 1,
       .bInterfaceProtocol    = 0,
       .driver_info        = UVC_INFO_META(V4L2_META_FMT_D4XX) },
+    /* NXP Semiconductors IR VIDEO */
+    { .match_flags        = USB_DEVICE_ID_MATCH_DEVICE
+                | USB_DEVICE_ID_MATCH_INT_INFO,
+      .idVendor        = 0x1fc9,
+      .idProduct        = 0x009b,
+      .bInterfaceClass    = USB_CLASS_VIDEO,
+      .bInterfaceSubClass    = 1,
+      .bInterfaceProtocol    = 0,
+      .driver_info        = (kernel_ulong_t)&uvc_quirk_probe_minmax },
     /* Generic USB Video Class */
     { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
     { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 88d96095b..01c3b2f45 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -140,6 +140,9 @@
 #define UVC_GUID_FORMAT_D3DFMT_L8 \
     {0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
      0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
+    {0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+     0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
 #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
     {0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
      0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

