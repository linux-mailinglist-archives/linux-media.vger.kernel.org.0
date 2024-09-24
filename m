Return-Path: <linux-media+bounces-18511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4C09847C8
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9F01C22EFE
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899701AB524;
	Tue, 24 Sep 2024 14:36:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1F154C07;
	Tue, 24 Sep 2024 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727188603; cv=none; b=D+GZeBCf1daLjKTqqIWRvSiscHbCMpS8jrdmb96UuY0O5/knIqzxQxN6QxBjhe+WC6XUTaxUJ0tFZX80mdwcTAzeooSUG5OvFY54utoWbYXGt0pLfa/R/dKXVG9sNAr7v68BnUzcHQvYy100OVBAKj0LuHsFU7mpOrl/ZTX7YXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727188603; c=relaxed/simple;
	bh=M2ce2lcVbRtIB2fZ2mpWo50yDU9E2t13g2caRBoNqIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMIJAqkyd/Po++yJZmCmye/rblpGKKAwO3yVEouUPWgTozyiRhOSfVjp7jgV1sKEhZVa0cbXpbFP7jDWgXUs7P4lTJdRjRgCYGH8qLZwWeJNWqc1vF99zt9gc7lc5Ab6vLT/fURggMMXI6vKa9psyy02PYJyv3+diChfMTPcILM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space; spf=pass smtp.mailfrom=koyu.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=koyu.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XCj9F4Bycz9tf6;
	Tue, 24 Sep 2024 16:36:33 +0200 (CEST)
Message-ID: <8ec78173-ff0f-4511-a606-e379e84c3d33@koyu.space>
Date: Tue, 24 Sep 2024 16:36:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4033
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Giuliano Lotta <giuliano.lotta@gmail.com>
References: <20240924-uvc-quanta-v1-1-2de023863767@chromium.org>
Content-Language: en-US
From: Leonie Ain <me@koyu.space>
In-Reply-To: <20240924-uvc-quanta-v1-1-2de023863767@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but implements UVC 1.0a as shown by the UVC probe control being 26 bytes long. Force the UVC version for that device.

I tested this patch and can confirm it working ~Leonie

Reported-by: Giuliano Lotta<giuliano.lotta@gmail.com>
Closes:https://lore.kernel.org/linux-media/fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space/
Signed-off-by: Ricardo Ribalda<ribalda@chromium.org>
Reviewed-by: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
Tested-by: Leonie Ain <me@koyu.space>
---
  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
  1 file changed, 11 insertions(+)


---
base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
change-id: 20240924-uvc-quanta-52a120a277fe

Best regards,

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08c2d..cc62bdf77c08 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2431,6 +2431,17 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
   */
  static const struct usb_device_id uvc_ids[] = {
  	/* Quanta ACER HD User Facing */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4033,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
+	/* Quanta ACER HD User Facing */
  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
  				| USB_DEVICE_ID_MATCH_INT_INFO,
  	  .idVendor		= 0x0408,


