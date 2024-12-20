Return-Path: <linux-media+bounces-23952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 856499F966A
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6AD1891F16
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB38921D5AA;
	Fri, 20 Dec 2024 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WKG3s9Ca"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5821C9F9
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711704; cv=none; b=okvZYu1xNRquCLTKHG4yVkU3WHgHYMcDRWdnJ6ImnKy1wSwArcfYc/rDn7RzgNV5JE3W8oQ2qefFccTIqiZ0+D/Bco+AAEGQ3G711U1hiUl46GX+bNfk1+IHydb9V51mD/6xVMUe9GOU3Q+dqr/j6JolvoZa7Q9Byghh/NLtd7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711704; c=relaxed/simple;
	bh=pXK+2+/QfGO0TyFvojht0JPWl8TlZGLLNkgaH46ud5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpwGnPqjWjYvpaMUpo/j0e0rxphEqt7zAZE+CWiAKmPa9shj8I6Rw1TZqrh5LdDNsG7234Y4vsHW9RKNGl1B7HuBG02e2zdDhWdPYIi9F9ycxAzlTLVBMS8t4yIdmOmjKSig+rs0CSTix//7x+/1I1+b9KYnVHZqEPXGEnEIuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WKG3s9Ca; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso14752985e9.0
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711700; x=1735316500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2BNxauvgR86wVgxl1iZjGE4qN7o21GTD/GjGRmEaXA=;
        b=WKG3s9CaGk63UdGjCS9EK+gXlHQMqvqj1f0M1sK5BV0RHMlq6vbmuXpW3Q5n/8CJWt
         2kd/J9qyd2yg03/1ydt6ZR3hi3Nt/Xfe4IVDq71YPNuOzBUVfXRGDx/0rP/D0ahZm8w1
         isRMs3cX8JnFL3/fXyQrF6ws4U0gnYPRciIkRcViKCoNHgRDi6GlZBqVhh3iKHkuMX8m
         Qr98R6PAJIoYfw0vlDK4VQrL8FumfAraMhugzm0dATNvxF4IABPYTnnv6DumM/ADFNP2
         1WNN3q5bMVTz5dhB3eWLDYA/aOnmZCRy2iUTQEQrpz5PlGRzIUU5NqW/uOIR5L0Cr4Kw
         E58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711700; x=1735316500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2BNxauvgR86wVgxl1iZjGE4qN7o21GTD/GjGRmEaXA=;
        b=fiPClHoCtUKiI6TYGaO0DAOsyO+B19mmc+E34RRGAo650Deh782CPZL3oSnNFWSU7K
         FXHmskPSWhOHcwmYlVMMZ3WSBc8at8mrTMGsiD12+9ZRqQ43l9RtFSdktUOJjG92dovJ
         LOclt1TTFpttwjJ4r4E9Ws8RYzjyKRdkdTEs25NvTHi3cZIB5wwPpTJogcidmSCM69r5
         ZN4wEwVm8whTj5hyIJYhWLMfJDNjUkKQFNL9EUHshbjLEoC1BHqXKUIWiylwqrrgt5A2
         JatOfniYayTh11BEMG9kB00K5N30EknosQQpD6C9PJ65nB8PFRc6cjdNuizLcrKuBggO
         0CvA==
X-Forwarded-Encrypted: i=1; AJvYcCVfZUROmPQYlA1ncvtuLf9DTqXi4ZcKq0CRWZW8/in3HiBzP6W5KEuru1dQg/47AKOllwbtqAxx2t3/sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjnm2mMiXG8Y/w/caWI1+PtFaH3UZM4HIzCcitKF8rYi3/boRQ
	+hXFyKiK3463DJw2zpmyQ1bj11dZtokaRMhnoosnLN4ZdNUQ8e/QfJFZNYGldoYIz6b8AB6qpXz
	bRC4=
X-Gm-Gg: ASbGncs7edRu9GFXcm1FGvf/i2I7fIBgZxC56xUJHG0qlQN2rU9rpLWI9rfd1138arD
	r9FShje2sPcEj9M7kMotX+MyCUCQGlA4EZ5h29af32+fH7HMSvYXFbtZs6vMzKgVrxXYtZq113D
	g9JBHXk3eUFIE31FRxfiFYqzmW9qyCnWVtpDU6Fs6qMSsZs3nqevukfKw/yBok9L0xIRoe3HE0d
	oFq1p7tvfDcuZfBKv+UumhGg73fnnXRkzAcCf59Kfc8I9Kc
X-Google-Smtp-Source: AGHT+IHZKwXSt3EtkR4/vJsXBDTgJju7+F4kSqL+22sBCcY1J09BA0FGI2cPpS1gnn5GDXEf6EXehw==
X-Received: by 2002:a05:600c:138d:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-43668643173mr32952625e9.12.1734711699939;
        Fri, 20 Dec 2024 08:21:39 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:39 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:17 +0000
Subject: [PATCH 6/7] RFC: v4l2-mem2mem: Remove warning from
 v4l2_m2m_job_finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-6-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

From: John Cox <john.cox@raspberrypi.com>

The Raspberry Pi HEVC decoder has a 2 stage pipeline
where the OUTPUT buffer is finished with before the
CAPTURE buffer is ready.

v4l2_m2m_job_finish allows us to do this, however as
the driver handles VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
this warn fires on every buffer as drivers that hold capture
buffers are expected to use v4l2_m2m_buf_done_and_job_finish
(introduced with [1]).
That doesn't allow us to handle not returning the destination
buffer.

[1] Commit f8cca8c97a63 ("media: v4l2-mem2mem: support held
capture buffers")

Signed-off-by: John Cox <john.cox@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index eb22d6172462..325a518beff7 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -490,13 +490,6 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	unsigned long flags;
 	bool schedule_next;
 
-	/*
-	 * This function should not be used for drivers that support
-	 * holding capture buffers. Those should use
-	 * v4l2_m2m_buf_done_and_job_finish() instead.
-	 */
-	WARN_ON(m2m_ctx->out_q_ctx.q.subsystem_flags &
-		VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

-- 
2.34.1


