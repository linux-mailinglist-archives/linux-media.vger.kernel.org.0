Return-Path: <linux-media+bounces-12928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E6903509
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52174288A04
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23D7176232;
	Tue, 11 Jun 2024 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fMel/r97"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C08174EDF
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718093537; cv=none; b=XVlYxSjBsm9FguJAfv9OXPwYm51z9w/4uJB/VKcX0I/R7ZmzAdhW6+HOH7TC2kT5R9bPOUJ1/6xxQA1wdH9gN0yM/Ipuj4AeLUarP/9GJW9LoZzdgR9Xhd8//lv5do8FRf/uzRalwFQKv24qFpdSBOoVXyRlVm3EzMgu8Vkm6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718093537; c=relaxed/simple;
	bh=lM/AUoiIFm5wy7ofM3hcaSkgrO99OY8cJt9TzA0Mu0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4YY9OLqK/89nppk5OY78hGQK8Oqgaf5n8s6+xiM36/QKdhb9w21fHrdNK6rOSbjjltSh3WYGXdWns94Xm7MpyxARd23c6z5S8SWc5RSBYqob/FxKF0u0yM9BkU+5qzd9b4wCMtctPflRPrhy2AZvB+WphvblpEvCsBLgwk0cec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fMel/r97; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b06f1f9a06so12869296d6.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718093534; x=1718698334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IVYq4GaETsYJZvHz4dUOl+klY8inCplH9StLoFX6IE=;
        b=fMel/r97AwRXfzRf/t4roSGkTmuESgiOdit34GoxNAuN39Iqs+8ZmdSMO2QVIq66FS
         N3oSErUN4z01RjKNLsRa0mdifTtG3dENFyaH+DLxyPwjsXw/nImIptMgNgu6LUcBHN3G
         asyqWR1916/mIbC8EYVLAnEtGKepQ1krjQYQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718093534; x=1718698334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IVYq4GaETsYJZvHz4dUOl+klY8inCplH9StLoFX6IE=;
        b=oR1D7R0v657yTODDLFGEsMEitMqN9EubLFDj2FeoTW8FJtyb+v46tVYP5iKa0RAZmA
         KGYBz9jojD3redZ/HrNg3SRAjbQBoCziBx+y8As02W7k01SDjqAkXk/F9dc+L2sbXbF9
         4CeIXhB3L1v5s5NVE8DkgA9FdGri0Kab85PUavF8osSy40Cf2bdFWzr54VuVHiN63fFY
         Jf0efM3NxjRYEGvX2yxj7vs+/f/OZ/tdoy65y6lxJpNLzoxlZd3pqgddk51er8D3RsGB
         jtmP4Ar2ehopTyAq6zTfPEMTgM2wA5uGX8c1QQf2tPJxHggxyW8GpLEo5mdSAdOxUQ4Y
         EHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkcGA/0lkkmwQwEif5UbiZdoXSrv+9UkjB4f2hwOHrZHIrhHu2c68vFRJ92MPsC/1Y3zcqOTPl8gB00ZRki6zoB5CMrekCWCZ7U/s=
X-Gm-Message-State: AOJu0YwK4Z0AscYAqg/b2eTCfvap1Xqiymt02Fayh9a68rIzZsyQKC3m
	pVmAP3N2r701JD5stRE+F9jZo20guIyD2iOkJ1osxG4Te2JSUcxmQ0e7vl5jWQ==
X-Google-Smtp-Source: AGHT+IEjrTQrxUo5zhixs+9k+Fjq2LfdHnJzlQOexh9ApNRRB0qiNKvKRrFodyQbd3JFr46awJRgPA==
X-Received: by 2002:a05:6214:319b:b0:6b0:8e1d:f71b with SMTP id 6a1803df08f44-6b08e1dfafcmr6921546d6.49.1718093534519;
        Tue, 11 Jun 2024 01:12:14 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b09039c2b9sm1548886d6.28.2024.06.11.01.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:12:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 08:12:09 +0000
Subject: [PATCH v5 4/4] media: uvcvideo: Exit early if there is not int_urb
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-guenter-mini-v5-4-047b6fe5d08b@chromium.org>
References: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
In-Reply-To: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0

If there is no int_urb there is no need to do a clean stop.

Also we avoid calling usb_kill_urb(NULL). It is properly handled by the
usb framework, but it is not polite.

Now that we are at it, fix the code style in uvc_status_start() for
consistency.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 8fd8250110e2..9108522beea6 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -308,7 +308,7 @@ static int __uvc_status_start(struct uvc_device *dev, gfp_t flags)
 {
 	lockdep_assert_held(&dev->status_lock);
 
-	if (dev->int_urb == NULL)
+	if (!dev->int_urb)
 		return 0;
 
 	return usb_submit_urb(dev->int_urb, flags);
@@ -320,6 +320,9 @@ static void __uvc_status_stop(struct uvc_device *dev)
 
 	lockdep_assert_held(&dev->status_lock);
 
+	if (!dev->int_urb)
+		return;
+
 	/*
 	 * Prevent the asynchronous control handler from requeing the URB. The
 	 * barrier is needed so the flush_status change is visible to other

-- 
2.45.2.505.gda0bf45e8d-goog


