Return-Path: <linux-media+bounces-677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4207F36F6
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 20:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61731C20BE5
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 19:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9790B42070;
	Tue, 21 Nov 2023 19:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XF7p33qx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B999619E
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 11:53:52 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-679f56c4707so569286d6.2
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 11:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700596432; x=1701201232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDCQx2svTZtfCmrCU69fY87fRl7Sd0hrHJUJrOpUR1s=;
        b=XF7p33qxwVcMCafNsYpOaqKk78Gm78d+4D54vMFD+yOprNN92MfBt03qzL5+F2jlz8
         XWsvUjZ+hC/cHjadbCHNFi0qTjjg0IyjFvZDviirZnOF019Ew2SdDdTp8UyKPtg2efZV
         1QM2scZ8t/DiL/HnvY62F/XIiPMfAdlzGjMQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700596432; x=1701201232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDCQx2svTZtfCmrCU69fY87fRl7Sd0hrHJUJrOpUR1s=;
        b=OmaRGwcv6aliQ50DSKYUPVhHl+iT8o5lbixZV4jH4TQfFJ2tsZaJEm09gY++F+SaqB
         vq1et/D8twT1OtZByG3dyAMmsapJhhwJRD7lbcFnLRWUAxhN4jlRfVZjaOCuNAYC58j6
         G6Vp8STTflkIXvYSMWpVVjVlWht3/xc1zXzsHMpoy4Oc6e3D+8LTW1/GXkjPmabOSRTz
         mj1x2YnvRROmYsEj1jE/nicPcn8ENW/hTPjllefdbB757pCC/ddGRuHPPC7G5IijUIA3
         V+h9f/9z1rN3fPQw1M58KHUTs71Y9gyvSFbkzOwVGLmhfIJtEaXvkYDt8iobvT3OzsLR
         88MA==
X-Gm-Message-State: AOJu0Yy/HCVUoU9cCuclfAgfTvBMvBn0KDmVYiriYbiNzl/EUGGTTGFh
	Sh7H+QUzOyRztl+jz2GRPLoeBQ==
X-Google-Smtp-Source: AGHT+IF+lZdugSOktq4NX5eTYkUsxrmRa17an3i9t4gdkRbjS4TnOQljcMe6VQLkna5ICl+GoJLspg==
X-Received: by 2002:a05:6214:21e2:b0:66d:2d07:eab4 with SMTP id p2-20020a05621421e200b0066d2d07eab4mr51485qvj.42.1700596431833;
        Tue, 21 Nov 2023 11:53:51 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id ct2-20020a056214178200b0065b0d9b4ee7sm4199409qvb.20.2023.11.21.11.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 11:53:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Nov 2023 19:53:48 +0000
Subject: [PATCH v3 1/3] media: uvcvideo: Always use uvc_status_stop()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-guenter-mini-v3-1-d8a5eae2312b@chromium.org>
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
In-Reply-To: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.3

uvc_status_stop() handles properly the race conditions with the
asynchronous worker.
Let's use uvc_status_stop() for all the code paths that require stopping
it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 4 ----
 drivers/media/usb/uvc/uvc_status.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..8e22a07e3e7b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2765,10 +2765,6 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
 	struct uvc_entity *entity;
 	unsigned int i;
 
-	/* Can be uninitialized if we are aborting on probe error. */
-	if (dev->async_ctrl.work.func)
-		cancel_work_sync(&dev->async_ctrl.work);
-
 	/* Free controls and control mappings for all entities. */
 	list_for_each_entry(entity, &dev->entities, list) {
 		for (i = 0; i < entity->ncontrols; ++i) {
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index a78a88c710e2..0208612a9f12 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -292,7 +292,7 @@ int uvc_status_init(struct uvc_device *dev)
 
 void uvc_status_unregister(struct uvc_device *dev)
 {
-	usb_kill_urb(dev->int_urb);
+	uvc_status_stop(dev);
 	uvc_input_unregister(dev);
 }
 

-- 
2.43.0.rc1.413.gea7ed67945-goog


