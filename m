Return-Path: <linux-media+bounces-30577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD806A94D91
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5503B0D51
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455B721018A;
	Mon, 21 Apr 2025 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6Nm/hqz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72F1FC3;
	Mon, 21 Apr 2025 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745222401; cv=none; b=rq020BCuoj0fqu4Z8OoerEPRMHTOcTdI4QAyjEPuJbeLg9NLMy/S8EUxOtiItP222+axPZYDy9F/vo83rGBChEboA+CGDFSZIw0jx9ICjMMWWCrRja7G1Lp4Ui5GrF0KzXzEde++5O8Qf2on19MQpg+yUmUUW4AbCQZzHhoDJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745222401; c=relaxed/simple;
	bh=Yf9u5pyej2h8xVcNxU8KnVufQwGxnXvmBVbqvBK97k0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vCDgS1o49rZOk3wVLG5XjKhSucvkU+FlkXVu8tqg/G8Yd9xvmAK4bqiMI5lOjIoZ3UPCjedt5s2K7L1N2Kkt6dcd8z4JBg4O71OMA8g6Il/zdTDSue3UjVoP0SrJzjD3NSo28/Ezkc1EgR+S7V+q69irx8tDvCHgSXpALir+Zbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6Nm/hqz; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so3518993e87.1;
        Mon, 21 Apr 2025 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745222398; x=1745827198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvuBgR56H3Ca/cTTeeHduuUBQ+PQT53LAIdjzkvxWjQ=;
        b=C6Nm/hqzfIOkWANZ+7Y3LjiGxHsnbnwOPylrLB6aCR/kiCXWFA0tREESdxy3Zwq07p
         L0G6HTQq4RmZp3JkAfLDo7L29ST02olsnOOeJ+OEkimBGi5aPdDTqBxERnrXUr5//pIy
         ECo0V/AfLUq+2wDM17T9EDEdLcXanWoiLo5PUiuDKJvxEGis1dKlu24wpTmnnEqNGsOJ
         ueyb2Qvn8+J2FfPK4uM1G/5k8UQITsqLcIsC1ebm8vI4hEgL2BBlfaeVxro50iak1Mtx
         hTlJzD4voRqBAYFZgpOMxT3FI2zZ27zvNi3Tyr4j1fpzJ9h4Ug8/IOsIhumAelAFRweJ
         u5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745222398; x=1745827198;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvuBgR56H3Ca/cTTeeHduuUBQ+PQT53LAIdjzkvxWjQ=;
        b=g/4aNjHy/lZ9Z2Edp0j3WWhjhr2x9mB289s6qukFiQPiu1oP6JW2u7xJvlI2XeblSs
         eXDzoWbJxHbNMRm3FepL1e8dsAJxlalwNxX+fckbVMd//eYQmgztREMbJJ3peejAds48
         YtCupgWTSPg5W7YmwxGI32JsNw6SlhJwJNNm/k9zrGmZXryGD6Oduig69yCRoTz4lUB3
         TG2g64pDUNL1kmJo/i1xnY46MkWm/5XycoMcRpjoqIz9OfiNkYX2CIKNYOyGBkjnMc98
         pVMA9kUVtUH7OV1qtz+D1BF1q2udFtB+GCqsYTPeveGQK6wkoJ/wn/mYkD2LlEibJ1yj
         JUgw==
X-Forwarded-Encrypted: i=1; AJvYcCVw8GgGr5yYcodxwxe4S66pCN9v1oQR2QSPtZVYZe8h/I9ow59kl9dBvwZz3IESskJGR8PSlO7kFcJt@vger.kernel.org, AJvYcCXTKFUiRz+smlzAqu6y2TG8xB1uVySnj7JXeh1SLEgz25hn1yECd+IonGXEI7YPfS7ilaFLgs65P2DZoKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOE3hbYz7Dt1MfVdtwgt4ziOYfwfm6wcc/0D9h2ZebWodLyoY
	AxaOPcbWFMt1b4aBxvFh0D7xXQrUOHQRQP/m9z1GR5aetB2/HTpV
X-Gm-Gg: ASbGncsXp6WCvPmjmfxjjNRv9cNJQYpvl7tolAE95cBMXursye+gspRmpJ5ZUvrK3rv
	JyEm4e4T33kq0Yi0b7zfsTVx+KpQgEBmk0LV8DSF8TZMQFLZV0fVWAkDnzlyXU5AvO4rjQ9MR3B
	X8af45wc512IUGOWcIvJ1vv4QGM5TCFgh2TxfAINZO3L9+3GuWCOsvoEyqeCwbvghUvOldCkqXo
	0cTHhJjNshlEKFWuqCDsaUETA5pplz8aQmDdQ9f1jB++vPHYgU40awkhoTBJfiiKxVS/NbFZ2pB
	S9YhchyjQKgaEB1Saq3YgEI+A1K/VnBAJhRUy/+VVEdYX3Yc+4T7TX7U03JIuyLvj1wG
X-Google-Smtp-Source: AGHT+IEZAq3jw+cUUP5NlGWUMUP3rzGP/4HiMhkH7Xv7Tuf9Yrm8p1vgdlCMyuVhxqWNCUOyZFJ+Qg==
X-Received: by 2002:a05:6512:1288:b0:54d:6e19:ba9a with SMTP id 2adb3069b0e04-54d6e631416mr2423506e87.29.1745222397664;
        Mon, 21 Apr 2025 00:59:57 -0700 (PDT)
Received: from foxbook (adtk186.neoplus.adsl.tpnet.pl. [79.185.222.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e51a8sm846584e87.178.2025.04.21.00.59.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 21 Apr 2025 00:59:56 -0700 (PDT)
Date: Mon, 21 Apr 2025 09:59:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Support large SuperSpeedPlus isochronous
 endpoints
Message-ID: <20250421095951.1e63824e@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

USB 3.1 increased maximum isochronous bandwidth to 96KB per interval,
too much for 16 bits and the SuperSpeed Endpoint Companion descriptor.
A new SuperSpeedPlus Isochronous Endpoint Companion descriptor was
introduced to encode such bandwidths, see spec sections 9.6.7, 9.6.8.

Support the descriptor with code based on xhci_get_max_esit_payload()
and widen all 'psize' variables to 32 bits. Subsequent calculations
are 32 bit already and not expected to overflow, so this change ought
to suffice for proper alt setting selection on USB 3.x Gen 2 devices.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

This change appears to be a strict necessity for supporting USB3 Gen2
isochronous devices meaningfully. Whether it's sufficient I don't know,
I don't have such HW. No regression seen on High Speed and SuperSpeed.

 drivers/media/usb/uvc/uvc_
 drivers/media/usb/uvc/uvc_driver.c |  2 +-
 drivers/media/usb/uvc/uvc_video.c  | 13 +++++++++----
 drivers/media/usb/uvc/uvcvideo.h   |  4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 107e0fafd80f..60eaff81a8c0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -536,7 +536,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	unsigned int nformats = 0, nframes = 0, nintervals = 0;
 	unsigned int size, i, n, p;
 	u32 *interval;
-	u16 psize;
+	u32 psize;
 	int ret = -EINVAL;
 
 	if (intf->cur_altsetting->desc.bInterfaceSubClass
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..591fbfcda2c1 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1898,13 +1898,18 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 /*
  * Compute the maximum number of bytes per interval for an endpoint.
  */
-u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
+u32 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
 {
-	u16 psize;
+	u32 psize;
 
 	switch (dev->speed) {
-	case USB_SPEED_SUPER:
 	case USB_SPEED_SUPER_PLUS:
+		/* check for the SS+ Isoc EP Companion descriptor */
+		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
+			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
+		fallthrough;
+	case USB_SPEED_SUPER:
+		/* use the SS EP Companion descriptor */
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
 	default:
 		psize = usb_endpoint_maxp(&ep->desc);
@@ -1923,7 +1928,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 	struct urb *urb;
 	struct uvc_urb *uvc_urb;
 	unsigned int npackets, i;
-	u16 psize;
+	u32 psize;
 	u32 size;
 
 	psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b4ee701835fc..b0a5ddff6dda 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -450,7 +450,7 @@ struct uvc_streaming {
 
 	struct usb_interface *intf;
 	int intfnum;
-	u16 maxpsize;
+	u32 maxpsize;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;
@@ -813,7 +813,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);
-u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
+u32 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
 
 /* Quirks support */
 void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
-- 
2.48.1

