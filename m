Return-Path: <linux-media+bounces-7913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C588D8CA
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75F71C2668E
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 08:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7DE364DF;
	Wed, 27 Mar 2024 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ehGslJHm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF12E652
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527893; cv=none; b=Fs2TO/qqvq4OpZUYA0hPB5fFoVft1YL8pbAdrHyk2Ts/OU5HrDnmCBKgiFI3gHpm2TNtQC38T2bV6pmLc9S7ZSnFCokEs8z/Erz6F31g/3GcQs7eQzU6b+EWx33eUohqHGhV1WqJd7MQoku7Ex46tj5SehUna12GzgLNrftZ1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527893; c=relaxed/simple;
	bh=nahiOHPE8IkoaUj7w2mRwbmhYqYPACwR6bZojjKSo5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIy1NWpYazBm3y/iVttAYHk9tmx56A/z+fRIu8eZz7tojONUxAspMfkYVA7tvGqqtrwfmoKCs91pOQ9O8jUAvCiopi/F1s/+HDiFlnY2gYhO3uRjuvEYSluat51uQ5UQFQCzXGPlSee9+SGKibBUwNgbCZOTEL8nNAyce0xgfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ehGslJHm; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42e323a2e39so5189051cf.1
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711527891; x=1712132691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkLI9A62H1Ggh1TCkrNUBd+w+3o29QTz44nWNnN5YQA=;
        b=ehGslJHm5IXl9yQVuCJylonirPcnS3eQBD4CvC4/vwO8y2nejVQkF3w6ZimSMZ0oMO
         +gf0y63rkdhVn3FEwPusmdNhaLsd40Lba/bm14gwviaV0lHD1NtairyLJHIyCzzdhsyh
         yjN5cj2/3W1lWN3J09vjJvfLG4K051G/4DD8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527891; x=1712132691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkLI9A62H1Ggh1TCkrNUBd+w+3o29QTz44nWNnN5YQA=;
        b=TrQ+yiSohpbMwvFTh2f5ZZpghWEtGFCX/yeazdWab2DuSiSs1u7+GQLXiO/Dcouowl
         QoOco9VT3lwk6g6I642k+4gGV5f3rYJL0o2oklb2S+8sUvpxtygbGPvTj3oLkKG3akIz
         NiBm33MBUySWwL4Y2LLJgnLUnd8IHTbtxcVhnFOJ8Wzmu1JgEHBpOytwLe7Cleprpj1N
         TbBlFWVlUJ0V1cBjg5cSlWxrrSLCk5TIT4b6slojRgGh/otKTErdCAQE766etJjVqtcE
         U3UTCj6wXUL6Z8eZU4bOLKwuXfx54Wb6WpyhYiYXyJWrxNZBjUxMHrD/1YkmQZzOUnzN
         Dp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUglviW2d6zpyOqxbvKoC7PdfU0mBzrQ9yX0x8ijJpE/8uz81XWIqsXErWfiT2INpw7jGooh/GbmZRXGHeBqm8b+SO/tzAcmNwhd2g=
X-Gm-Message-State: AOJu0Yx1E8Qa3WFSmTc3yKutDrl5ASQmReIDCqzgb3LupDgRU5MQ7rML
	SlafABGuQjJFwijoXSHe77+jNLGiz39/8QN3s1/5XiLRcL6ci7gzrsut0iWnxZnTGPwx3RBt1rB
	UZ53f
X-Google-Smtp-Source: AGHT+IGNUblwo/JlwehDtdXHQDYBlalI2e9kD1Y2cVhoODvGCnn0vyY+nubC8YlGQFiQ/qJcUAgU9w==
X-Received: by 2002:a05:622a:40a:b0:431:503e:4139 with SMTP id n10-20020a05622a040a00b00431503e4139mr6285588qtx.14.1711527891164;
        Wed, 27 Mar 2024 01:24:51 -0700 (PDT)
Received: from denia.c.googlers.com (131.65.194.35.bc.googleusercontent.com. [35.194.65.131])
        by smtp.gmail.com with ESMTPSA id ca9-20020a05622a1f0900b00430ea220b32sm4581691qtb.71.2024.03.27.01.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:24:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Mar 2024 08:24:46 +0000
Subject: [PATCH v4 3/4] media: uvcvideo: Avoid race condition during
 unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-guenter-mini-v4-3-49955c198eae@chromium.org>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
In-Reply-To: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.4

The control events are handled asynchronously by the driver. Once the
control event are handled, the urb is re-submitted.

If we simply kill the urb, there is a chance that a control event is
waiting to be processed, which will re-submit the urb after the device is
disconnected.

uvc_status_suspend() flushes the async controls and stops the urb in a
correct manner.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 375a95dd30110..8fd8250110e2f 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -294,7 +294,7 @@ int uvc_status_init(struct uvc_device *dev)
 
 void uvc_status_unregister(struct uvc_device *dev)
 {
-	usb_kill_urb(dev->int_urb);
+	uvc_status_suspend(dev);
 	uvc_input_unregister(dev);
 }
 

-- 
2.44.0.396.g6e790dbe36-goog


