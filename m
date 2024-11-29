Return-Path: <linux-media+bounces-22361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B49DEC59
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 20:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A1932822C0
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10951A38F9;
	Fri, 29 Nov 2024 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T/vk8ZML"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC3C1A254C
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908313; cv=none; b=sOC+LHlW7teFeUJr9AO1P+RIRz1erxRJr014PAXYMoHA7fAZOp73jCCWwDg52sG+vrkkEz6waukJ5sTZxc1qvDRZfnyU9Wyw9hJggZyQm3acAnhCXaWhaGML7p8eQG/1KqMlASM0wOIOnX9UUa68Zivw6HGG7EPSlzYcNubhjic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908313; c=relaxed/simple;
	bh=KDAOGjpXXULpZa75pLl+o8CodfY7IbmICZMYyev2FdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/EEnjtkuyZUJEssN1rWLsUMAVhZIrJ6h51VFhrGibpDWB1/hYukHCUIdtgDo5nN4sOi8CDUmDHss+6KzWmfGMmuxvia6HgoTSpLvbHwnzRTuQtEs3wromuuQU4/lUw/SKADyamVDUbEWSbFEgKCOugxp+0v0qivMXsXfYcrPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T/vk8ZML; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d87a55bc50so11754556d6.3
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732908310; x=1733513110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsG2Wx3W9iEMxWqh3g5yUw4V+bP3sc1QbSYtLT8mhKI=;
        b=T/vk8ZMLG+g6cSw/uloiOmkCDvM8y5KeYGFMRun0KbsM6Z5F6M06LgllDP0n1CzuN9
         VM2/1Tp/ffu2oFAdXdyxa6MWewiMvOEpvYqS4BgjFoIu+6yuejQ2871B3Xtvq1k7d5zC
         Lt/djj0sGnmwyTG0XhIkQOLDz5gdv9g3c3FyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732908310; x=1733513110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsG2Wx3W9iEMxWqh3g5yUw4V+bP3sc1QbSYtLT8mhKI=;
        b=qe4BFw/Ot3l0AV/GiTpSBT79jCzDLdrZ/W/XSlXW712Zk7QZAuMM5OixkfTPcLEev4
         qjdmQXdT9mUBcB2byFDhMUTcfwLS1oBMT+Puqpkj4nSyGRA+3NfOb323AAooeaAwKE3W
         GGeJu7LVCw367dYe2yXmkx1BddtSRfwl8g8eHSP1hKWOnSfEH0/wCesMqtfiPMfb8w1Z
         ckobjyZGaRZVFvaObM/TDj1LsJ1zgIfoF5GQ4Pf5xv2BarsBWN8R7A95DIE09AEOXvPK
         jvqULe7eTpJuukIVht6iUHrqDyVl6VurusDaBmRXjXNm8vDv83rt4ZSkkXsgpFag4jT1
         /wgw==
X-Forwarded-Encrypted: i=1; AJvYcCV3qXz+uitWRy8f7DpGoFGq3ZkSqCEnKRvrHp4u/c5fFKoBTpFoGlhcsmj+IHMQD4D1zx3UQ1Fe+f/84g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZAYIOahhfxWfPan1GGD0uxn9UQ8GUQKCadJXfGX4QEgJzStpq
	D1k9lvy/ikumps9j+8rIAi+qsBeACeJ64sJQDnbM7hjvv8oUySixNOdz/Hhjcw==
X-Gm-Gg: ASbGncvrpExA7bvjRjF+N99lohjKSbTu30IuY1/PHNhV92QdZAcn5aPCuj84qa5cw1o
	/VELdavgghoEK1hVaIHK/oFiKojW6l0RvhFWENNVKY/KneMuUA0EInM6XIZJuZo4T62w5a44F05
	2WNZ7Ui3BOAJUzxyL9UFm4P7V39daefvos3oAhJhzQGi3UjA6wXMCXIqq7wz01sVHd4a2DLJcT4
	G3UQn+wEGSzaGvy9AMJzPQyyWqbevYKrPMb1Xy8JQyBTU4iT1eTuHiHV7VSvxPlUe3NYJzqkrC0
	RqIku8K2X5h3baWK1o+Wmkc6
X-Google-Smtp-Source: AGHT+IHWYLjW914nhGcA62UKvuHc86hH3lbm+mb3t304Ztc6ITsE/xyJVsbWU3vwDNxLRMjZMNifvQ==
X-Received: by 2002:a05:6214:1d25:b0:6d8:8289:26ac with SMTP id 6a1803df08f44-6d8828927damr78350326d6.45.1732908310529;
        Fri, 29 Nov 2024 11:25:10 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d87d899ec2sm14462146d6.50.2024.11.29.11.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 11:25:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:25:02 +0000
Subject: [PATCH v3 1/4] media: uvcvideo: Do not replace the handler of an
 async ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v3-1-ab675ce66db7@chromium.org>
References: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

ctrl->handle was used to keep a reference to the last fh that changed an
asynchronous control.

But what we need instead, is to keep a reference to the originator of an
uncompleted operation.

We use that handle to filter control events. Under some situations, the
originator of an event shall not be notified.

In the current implementation, we unconditionally replace the handle
pointer, which can result in an invalid notification to the real
originator of the operation.

Lets fix that.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..88ef8fdc2be2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2046,7 +2046,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	mapping->set(mapping, value,
 		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
+	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
 		ctrl->handle = handle;
 
 	ctrl->dirty = 1;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..ce688b80e986 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -150,7 +150,10 @@ struct uvc_control {
 
 	u8 *uvc_data;
 
-	struct uvc_fh *handle;	/* File handle that last changed the control. */
+	struct uvc_fh *handle;	/*
+				 * File handle that initially changed the
+				 * async control.
+				 */
 };
 
 /*

-- 
2.47.0.338.g60cca15819-goog


