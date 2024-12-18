Return-Path: <linux-media+bounces-23731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB3C9F6FA1
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3972B1890B83
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B891FECA2;
	Wed, 18 Dec 2024 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZSnYYNwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339501FE44D
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557971; cv=none; b=MRpjGMVkCIehuewuxRc2sDq6edlsqlSmO/MZZhb4RB9mXoGW7gxrNuS+XTYolp/nsxrMS39j7IvyXV9GVxeVB2jOYwHJBJg+npgO9PDY5SHurd3wDc1AHQhkGUIaSlYWrGgnwU3fRiVNc/UUdNuqe5l2T/JWbMDui6LX5jXN2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557971; c=relaxed/simple;
	bh=DhBuuSW9MUIQpcqfUsKuLLo1g4KmmcRnk8ucnEiFIdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5SIbJN5Qaw0f6HpBSwga2XCxvg9mxSfKp16cCo6YblfKkfvwlnpW+11dA7WMGIXp8M9IUplnSZ4NPF2xIykyxCZoHUYRoWT4V2FayzRcdbiPxu5cXclUuieY8jJ2bZq7kx9L49yp1MMvEXwyNbG5/T28i3odTAKKI4Zq8s2cxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZSnYYNwd; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467918c360aso704551cf.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557969; x=1735162769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcx11cNcczSAZshcCeyKTXI0xmNNHV+eiS3phSI5Ghw=;
        b=ZSnYYNwdPIr4Wmj3UL1BsGELGijOmIV5DfmbfAL2LpOdRlpVDw/f73fVXd5YzJzC6x
         kIBNzFdmLgMgzO0rVEho+O0vHrLbebcNiFlLl+gS/wLoBD1psCPZ8Ob26ZDxqn7BEvAu
         EGgNfp6hLWBUYm+PjU/bpSwSi8UQF6Pn6L5hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557969; x=1735162769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcx11cNcczSAZshcCeyKTXI0xmNNHV+eiS3phSI5Ghw=;
        b=dlK5Ggbj9MLRiBjmqXp3oIR33EGe/DNVLfzxJE8FVBEnoXqiMQuipDqAMJB9nIKRoH
         SaUgBYQpIAZJmIs5csLUKBkMRaUBEtVC8aeO18kzCYrzkyxHTnXZKti13uhRIzJyn9ca
         n4leNX86R8ptVcXOKdxhVnwa+WDKQXZb1NH8VMXoD7qzaI9f6AOozxLqJM3J2DPApIo7
         /Zmztp9KKfj0BgsrCyTHcyr4YG2bzprsbmYLQrVEBpYgFizN9//KkSpAsKnrvJW62eQ7
         /P5slsdJly3sRmJkZrcbiBIL4CwDLF5PZFivtbCT020nTbAOt1NSF38lyGrkNVh7zakV
         mN3w==
X-Gm-Message-State: AOJu0YyL9vGJbFi2DS2/wpxnMWsPjiMgmmPfM2/vExa867fLJVu9hj3P
	U/U8Eq5m/uziEwyqX/JjCW9HneFdN+N7i/0bPq6e3BeX9YLUzFMF3KmC+tUnEAgp4wUU26V329E
	=
X-Gm-Gg: ASbGncuhtGJIq0xTA4pWWlTWdEeim5pdDYELjeU9V6/MRz8oOow/s+yl/rZr60l5RE2
	atTre5kIs0zAuMbFXroIdh0yOX9simpe3aCerVaAj/3VXJaueez04rncm0ufTfNTWRMbJoR8eYl
	KXAFrRUgC6xQtXqi3eOdsAgVH/u3kHKSimwe0x5fdIJ8VfJct0K5Y0DCLQoN49TjNbORlsTCmrQ
	OL8Geu7XoJSXGCV7tFp9D7lWhkRnLDxecwDvHGmMEii1yTohksl6hIIiuG/TDMxxz6yNGi1TSIN
	UW34ffBtwTXS0e1CDcTL9XqhF7OWDMw=
X-Google-Smtp-Source: AGHT+IHAFG2tbIFDyqlrvTJzXNQ7OmWJs8w6/+hb962JqnaH0dxvvp85RBnT6p4L5Azr1IBWby2OuQ==
X-Received: by 2002:a05:622a:309:b0:467:54f4:737b with SMTP id d75a77b69052e-46908e1ed90mr61838381cf.25.1734557968851;
        Wed, 18 Dec 2024 13:39:28 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6e312sm55176651cf.8.2024.12.18.13.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:39:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 21:39:09 +0000
Subject: [PATCH v2 2/4] media: uvcvideo: Invert default value for nodrop
 module param
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-uvc-deprecate-v2-2-ab814139e983@chromium.org>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
In-Reply-To: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The module param `nodrop` defines what to do with frames that contain an
error: drop them or sending them to userspace.

The default in the rest of the media subsystem is to return buffers with
an error to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.
In UVC we drop buffers with errors by default.

Change the default behaviour of uvcvideo to match the rest of the
drivers and maybe get rid of the module parameter in the future.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b3c8411dc05c..091145743872 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -32,7 +32,7 @@
 
 unsigned int uvc_clock_param = CLOCK_MONOTONIC;
 unsigned int uvc_hw_timestamps_param;
-unsigned int uvc_no_drop_param;
+unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;

-- 
2.47.1.613.gc27f4b7a9f-goog


