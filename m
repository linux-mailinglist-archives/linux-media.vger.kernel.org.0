Return-Path: <linux-media+bounces-3331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D737682709D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 15:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BFA71F23329
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 14:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDA54653B;
	Mon,  8 Jan 2024 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EpdviaNk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA2946B83
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-783148737d5so190222185a.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jan 2024 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704722659; x=1705327459; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jFIqgAme8pj3yZgHK0ETOAopc0DS9Aqbs7DQMRGmnU=;
        b=EpdviaNkEUjeHkHfSTrYS1hB0QW5v4lLwxaYeX/rIViG52slXqNzC2wdMBAEX1BtZ9
         RHNj2S6qxpZSgjwBX2RwekF+ek7XihqswW+tFxb87KzpMhDQVoVJ/KsLx0VpF+QyQUR5
         mLZVREl9vyGMGcXBq16ydw7mK4796QHFt3ekE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704722659; x=1705327459;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jFIqgAme8pj3yZgHK0ETOAopc0DS9Aqbs7DQMRGmnU=;
        b=dcUCLSyuMvW0HkEwAsIZHqDpkc66ehhucuEfBXnVO+xSpYaIzxU+zJ++nGsoxDJYSs
         SEFvzYekZV9K5NaHnRBsMBgrp0m23QXJbXHLLo9pTtqzlhJXEtyNfmKK86Rv4fMA+YVX
         OKPfaiTdnVQQFDZSG3JOoncU4yslzQCSd6EQ+G9V0eQx7KGPequJXGK3TbArCmzmRjeV
         bpf6DQVZ6m5Y4mspuf5R3j+F2SLmfhHxb4UpdIyar4aVrAn1cBYl6zLCexAH205F5s+J
         A+oPpOSwZyEPrpyBycDv0gbtCVzefA4yVAdyvQJgmnyrM3gluV/XU8Uh3pq54xbd04T9
         1sAQ==
X-Gm-Message-State: AOJu0Yw8o6eW+HdhXWdho7lrUnLHbTnq22DTsFW7nnHy4MCB9ZxKrAn/
	UjM22OAqswCrpmhdeI99qRoy+EXScoTH
X-Google-Smtp-Source: AGHT+IGr7Jqo3C50QDJJ3Ehny3W7unRbzrikSD6hXFNXTJtjzfIEseqVbAgLtK8O8EgLumUQeYSGeA==
X-Received: by 2002:ad4:5b88:0:b0:681:9cc:b707 with SMTP id 8-20020ad45b88000000b0068109ccb707mr1078038qvp.63.1704722658691;
        Mon, 08 Jan 2024 06:04:18 -0800 (PST)
Received: from denia.c.googlers.com (204.246.236.35.bc.googleusercontent.com. [35.236.246.204])
        by smtp.gmail.com with ESMTPSA id bo14-20020a05621414ae00b0067f3a1a7557sm2869708qvb.120.2024.01.08.06.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:04:18 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 08 Jan 2024 14:04:16 +0000
Subject: [PATCH v2] media: uvcvideo: Fix power line control for
 Shine-Optics Camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240108-shine-v2-1-ddff959dab89@chromium.org>
X-B4-Tracking: v=1; b=H4sIAN8AnGUC/13MQQ7CIBCF4as0sxYzg6a1rryH6QIByywKZlCia
 bi72KXL/+XlWyF7YZ/h3K0gvnDmFFvoXQc2mDh7xa41aNRHJDypHDh6hb3tER0NRhto34f4O78
 35zq1DpyfST4bW+i3/guFFKnRDTc8GDIj0sUGSQu/ln2SGaZa6xfM45cmnQAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

The device does not implement the power line frequency control
correctly. It is a UVC 1.5 device, but implements the control as a UVC
1.1 device.

Add the corresponding control mapping override.

Bus 003 Device 002: ID 3277:009e Shine-Optics Integrated Camera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x3277
  idProduct          0x009e
  bcdDevice            0.01
  iManufacturer           3 Shine-Optics
  iProduct                1 Integrated Camera
  iSerial                 2 0001

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix camera name in subject
- Link to v1: https://lore.kernel.org/r/20240108-shine-v1-1-9d7b03a1a901@chromium.org
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 08fcd2ffa727..ceca1addd7e0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3012,6 +3012,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Shine-Optics Integrated Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x3277,
+	  .idProduct		= 0x009e,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
 	/* Acer EasyCamera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20240108-shine-06c600d17a2a

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


