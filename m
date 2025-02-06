Return-Path: <linux-media+bounces-25729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973DA2B299
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 20:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1A73AACF7
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24051D5165;
	Thu,  6 Feb 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aoMDqbYr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1921B041A
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871227; cv=none; b=S/3ZzxhzsXxLkRXx2ZDiqnKFBJTekdsKcLIhyfDKNmeUb1MSOONApStL4tfWeF6JaXPxsTBoUAzm+SNuhLMEnuROfsRmtdv1KJFNKMAaDYFO9fXU1yKdDt9RuG56ihi0Lfe/dhlJlKux1I1RrQbJUdnacUJhFCcenOE287wpEVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871227; c=relaxed/simple;
	bh=jJOOAqwCsQWSNDiDPF3S2JW8j13hrUZylnSpIecS95c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYkZO9iI3rBgAOyqe+ohBW/jzHqj1xofVr7Lm9o9KntJ4WlmN0Y3rpVkZfO379zA/IVOWAzYZrtIA0puQM7pGjd4gd9elv9fFRDQVgkdvG8L4rsBn//dSQNppfitoH8Z7SNUVmYZg0t+4CzvrNEbTius4VC1rTmThOSk/aq7+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aoMDqbYr; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e41e18137bso12050426d6.1
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 11:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871225; x=1739476025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJ2UjanTBYGPlNg/34ayATbdI98nJQKJ+7M5AzyqOzs=;
        b=aoMDqbYrxISZtXgIwZND+pzZNBmFFxTU6yUXLxCFs5l/2EDOF0r5qM8zUATyqWk/Zm
         atgIU3kVB5d9SF3vrasT5d5bhFKmv1V7NaitFVcndw63KUI7ps/VT9RwYq66ijEUtrrg
         LPrKhfSjKHxcgP1BEAIssxCNPa9B4PurteuME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871225; x=1739476025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJ2UjanTBYGPlNg/34ayATbdI98nJQKJ+7M5AzyqOzs=;
        b=SzsBYB+674WMgihZr/QZKfkPyZ7i2HVXi/m5SOXKmJGLC9qvW3LfVG83Mjc7JD6PG1
         mnKrSulMaKAXxC6ieFgz//8UsAm1hImPnOAVk6XVvUD847J+5G5LWlm3ZHmyEvlhsf9O
         4fQdYkvE9TJWqJDGrQTmoQ0LU0VE7wJyxifoC3OF4+HpuOSpk7tNsGzwKUjGy5ncc7gX
         CaFW1RtldSkpDVq7OTpVWpMPU/MfLMQOv2irSL4pPfcGSWhhGNmBQyA2gEeOCnqo029M
         T0OZZ7BgqfYXftnMtHCP7IZve3Lk7DYHgVqeM23Pa/DL6FfwWDg+yoWvonzRhwOoqBUK
         6x7g==
X-Gm-Message-State: AOJu0YzF1J+1JGp19usVqORDrE9mOvDJKFu11zU38+49FAo/TKdIqvEy
	pzmR/qzfFmyX3RuZcB/WmQQ2OgHEJAyIyrkMV+9xkJhn04fnpwhZYCLKwJ8waQ==
X-Gm-Gg: ASbGncvJpu3srL/TtKaLh2IqEKMS73ql1Dys+he6UXvX2qPCtyEvoogFcOLDLgnRWcN
	iSLL1yulKGJAGxnZ3jZ+t4lIk3eONQnyqGVK8kQyB3sZhyhqs7wR4+QRONNXk2pPg3T3m+MYmHv
	QHGZsTVMyTJ8Co1dk74McbP/6DfPZn6428U8bGLvE5s/4ur/HHzHtGAaTG+I0BUfhMs0wEABkX1
	DOFtn7Yhlm7oo9ZRlnXwNx1dSiMcpjD3I77d2Ut078AnGlzKHUKV8PmH4WUlUNh7FvjLpfXVmgV
	dVzmXZiAfcq3wUUmj+azD3biQBuj6+Dxkq/nNcykg6iiIpGImArMEybVivli+cjxuA==
X-Google-Smtp-Source: AGHT+IFrT6xp6LSUuyg83VdMkSCUqUcLFurxtgJTgy1C4tSJldA04ZFL4Re8s9woc36U2BXKqvrHng==
X-Received: by 2002:ad4:576b:0:b0:6e1:afcf:8710 with SMTP id 6a1803df08f44-6e4455c2033mr4894416d6.8.1738871224972;
        Thu, 06 Feb 2025 11:47:04 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Feb 2025 19:47:02 +0000
Subject: [PATCH v3 3/6] media: uvcvideo: Add a uvc_status guard
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-uvc-granpower-ng-v3-3-32d0d7b0c5d8@chromium.org>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
In-Reply-To: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

It helps will help will the error handling of PM functions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index bc87e1f2c669..be0817da538c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -763,6 +763,8 @@ void uvc_status_suspend(struct uvc_device *dev);
 int uvc_status_get(struct uvc_device *dev);
 void uvc_status_put(struct uvc_device *dev);
 
+DEFINE_GUARD(uvc_status, struct uvc_device *, uvc_status_get(_T), uvc_status_put(_T))
+
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 

-- 
2.48.1.502.g6dc24dfdaf-goog


