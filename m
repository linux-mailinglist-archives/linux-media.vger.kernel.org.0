Return-Path: <linux-media+bounces-27418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5E9A4CBCF
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 20:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B2A918882E0
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 19:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567962343D2;
	Mon,  3 Mar 2025 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UKGaCHCI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EFC230BC2
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741029225; cv=none; b=hPuGiAldtzzCWrveUQ512A0qvY5dWV/S3ilt9R0Ua0Rn+0Yjt/MeV8BZ9l3+Suorao75MbfmB5Tpk4C9wWcpOtPdl5scJ1K53nHwDPr7jqPgK7BcP1mkbVjoaODy4YpKQA+drLaQ/2hsBXFieICGkD9lYyo4xxlLUZHq/krOVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741029225; c=relaxed/simple;
	bh=qj9XlT1WiKm4AO6hkKE1By7lypenS+uznQVD6sIZ6Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFz42dJboNMBZPg+Jsig21HIpi1UAysBljNYZAYdy6KohNmVm1WuhiMYsTs3VGxnQPaAqgVM07ZgHyOx93kr/zd/rANv1S2NFgxNWM6xx0no9p75+WojeQsHgH+xnHUecEEIwFJ0QYjguMBZSbdiVL00fRSj2oHFosEGr2uismk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UKGaCHCI; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-471fabc5bf5so22318201cf.3
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 11:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741029223; x=1741634023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MnG0EicLIQ9fYl+R5jdVwfngFFSuuPxJwnjFoj+2kg=;
        b=UKGaCHCIxdhRTo+gWPJCqO+HG1UY50P+q/gh8jSpXK0yWzP1589Kch8BP3uPUMq391
         h9OcKARkjtjRKTqfUI5QQuaKQAZx/odHhz05HtNuAx/Z5USHIyMzJ48Ti2y5QPCix+qc
         zxngfCf19ednZZCf/SHkA89rQRHzy1mw5C5/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029223; x=1741634023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MnG0EicLIQ9fYl+R5jdVwfngFFSuuPxJwnjFoj+2kg=;
        b=MfOlACEejtJJa65k9HW2NwUT81lqUgDVbY5W6+D9Fiylj5WscZGsjWh8ozRhCpXvF0
         rU4IYP1tRK2HUrkBoQWFWcIyZQZ971W/71qmgUP0SayGBACsNd/+ZjFJfhTPfg9lQ7k8
         42N0v0kR+0e2Lsvu03+O+1+bhSWEHgEsE/h7EcghtJskpQ9/YWktN+vvclVlCrKM+dgl
         EifAwUT+3js6oAM5Ld0zF46QiX8A/b8sb6acb96SaPClMn5Dj9cV31/It7Jcr/xYXeJu
         T/r+qIH5Pv6XXmTZhVKAdhIsRwuO+Vnd3nnBrTiPrZLlgiO8haKL1fDCjq5KzEAUR0k8
         iDFA==
X-Gm-Message-State: AOJu0YzOzRGfD8U2rETTVGUD4NjcQU3qWmm0hv153p+eXl0ucL9iqsE1
	kj7luDqRryZvX1i6Dul6RY6k1Fhh2bHhliNvbipT04hPmqm9f8L8Qb3CmBy5UA==
X-Gm-Gg: ASbGncvF6LIPDD0WTRJG7eRmmAT0qLvrMViHOglqNubcpk2YaFPE5M4Kcnpwaq2omlq
	co8QYXMpzEYY00dTGiRUu6IKIiAM14VuSfAJhsUT0IUl+5hupstmA8DLmVEaH3Z8BCT0H9aHBE5
	KCs2ZmEqbZ83HyHf1u5UFiaW1S3xZtScLGwx+d5CD1/W6iZDhIDGq74RbBSrvU3KkUugrb1Jxu7
	GPYKEwEBmGmcn6eTymTimo3LXdiNijUZpScGnSKjcDg8QukXspWP0A9E7jGUBhv9UzhBEmVHOac
	JtvGpM69FcvaHc2JhGD28+srli1wjsVljQqqxD6aqcWVGxnbAvvLnwoloHPT1g4wcBCISvLPFy1
	dwXkNC2ix1L0RzkZ87Z9UJQ==
X-Google-Smtp-Source: AGHT+IEQGZ29VcDcFbL/MqUTzdoYNbg1Fi5VRhzqMJ4olgsaszoAZ6iyTyqbDbVixb0BJPPsVpFm0A==
X-Received: by 2002:ac8:5a95:0:b0:472:28d:62b0 with SMTP id d75a77b69052e-474bc0f4bcdmr250554011cf.41.1741029223076;
        Mon, 03 Mar 2025 11:13:43 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474e0f1e0c1sm19745661cf.47.2025.03.03.11.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:13:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Mar 2025 19:13:38 +0000
Subject: [PATCH v5 1/5] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-uvc-granpower-ng-v5-1-a3dfbe29fe91@chromium.org>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
In-Reply-To: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

Add a variable in the file handle state to figure out if a camera is in
the streaming state or not. This variable will be used in the future for
power management policies.

Now that we are at it, make use of guards to simplify the code.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..f9cd6db759c5 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -835,11 +835,18 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
+	if (handle->is_streaming)
+		return 0;
+
 	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	if (ret)
+		return ret;
 
-	return ret;
+	handle->is_streaming = true;
+
+	return 0;
 }
 
 static int uvc_ioctl_streamoff(struct file *file, void *fh,
@@ -851,9 +858,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
 	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	handle->is_streaming = false;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..bc87e1f2c669 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -618,6 +618,7 @@ struct uvc_fh {
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
 	unsigned int pending_async_ctrls;
+	bool is_streaming;
 };
 
 struct uvc_driver {

-- 
2.48.1.711.g2feabab25a-goog


