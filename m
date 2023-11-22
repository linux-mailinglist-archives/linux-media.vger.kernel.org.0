Return-Path: <linux-media+bounces-776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66727F4391
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AA15B20BCC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAAA51020;
	Wed, 22 Nov 2023 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I/HjlToi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B21197
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:19:48 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-678013cc22bso25410096d6.2
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700648387; x=1701253187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y6RZGZZzUKyI0AjxKgp4LZORspR1wFnVoan2A/smok=;
        b=I/HjlToif65LhLdRS0B35L26u++dsWGjxAPPjcZLEAt73+yV3xFpJT+RYKw4jVJGKG
         w4ETGigoJAzffKSJHdz9fRJu8RmOnM7lGYXdF77FOTkhYnWJn99BXbMbtsvb1pvetZ5L
         MZLpbBxEdhwhW7x0ihj5geRP3EpukcCF9E400=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648387; x=1701253187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y6RZGZZzUKyI0AjxKgp4LZORspR1wFnVoan2A/smok=;
        b=r+JkcLAccRLrzfjH9Sw2Z+/PNAvT7Y4XhlZmATZSzVYX75j7mgYpKL7uK58YK6GNc7
         1oQVUDXDd454PLArsN+6/2He8ZlZjIH5+M1pAxEe3XCVVv6jbQSZKHi8NppQhoo92HIx
         HNo0YIw3AVeHXjO2Am18Sp1DekpW55VnJInZACmTA6suV5FgRoJq4IgchXkymC4Lr2bc
         l8GM7zEC3C1M1f0RpcuKOCMbUEiBxYHHdyyYHl7Kx0kcIOFizpEAvNDBAKuociN1W0/6
         NCw6EoisxHKBTBJEv0FDte8H+eqOL3PusfhBjvw3/swCPp611KxtkRlzdtWP0ymB4PQT
         Onpw==
X-Gm-Message-State: AOJu0YyKWF7TOL2TV/WbzyfEDTYKMXn6cwEL2LZ+pInUgFRqiQ8cigw2
	UUt6U2RbwXN3U1UEFX/6R/iLHw==
X-Google-Smtp-Source: AGHT+IFEsCJ45XVX1lArkw/YPBxax3uJbusPHME8iW0AJ3NFgR82vx54nuQtKxpCgoZhDZ7EzAQl9g==
X-Received: by 2002:ad4:5e86:0:b0:672:118e:e368 with SMTP id jl6-20020ad45e86000000b00672118ee368mr2089387qvb.24.1700648387220;
        Wed, 22 Nov 2023 02:19:47 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id di6-20020ad458e6000000b0066d1d2242desm4739352qvb.120.2023.11.22.02.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:19:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 10:19:35 +0000
Subject: [PATCH v4 2/3] media: uvcvideo: Always use uvc_status_stop()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-guenter-mini-v4-2-3d94e1e34dc1@chromium.org>
References: <20231122-guenter-mini-v4-0-3d94e1e34dc1@chromium.org>
In-Reply-To: <20231122-guenter-mini-v4-0-3d94e1e34dc1@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.3

The only thread safe way to stop the status handler is with uvc_status.

Let's remove all the code paths partially stopping uvc_status.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


