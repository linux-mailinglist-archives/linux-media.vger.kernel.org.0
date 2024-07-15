Return-Path: <linux-media+bounces-15021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532E93123E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 12:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 303FA1F2389A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 10:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB7B187870;
	Mon, 15 Jul 2024 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PNa18tsM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72116CD36
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039071; cv=none; b=RkUCOzsyy65xdG4QpRqeHVWyfN6QNSchCYfSQ7Idl/lOVVF0qWwz3PHuiroBE/vYZHn5+Wd2B3b5mDRpwqttAbc/gshYIPOY2oqREeox5Bd8cG6cazyt1cqXMMaCYF0GJxhe5FMrw02oWx8gHRfPuX8tOstU7RdNqsR3azunE40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039071; c=relaxed/simple;
	bh=bjdW92jh6LmGheduG7+IpwoMZvRX1OvTyhl9Ubztxsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UVExGw6s0M3jKhoYsLqv3w5OaZQs5CLJCLIW+3KnLMZ1eF5V/Z2t6MYcapAVKsHFvLdXiksMu53H+TOpK2FvQwjMWeyloUUFDcOK7O8BZmXZfKg1k5eHNHqpO/tIrFJjnL/KE4x91U8sXNJk+sxDIYefiCeEznBhQ7ya3MKId4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=PNa18tsM; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-4266f344091so29641275e9.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1721039068; x=1721643868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk0IVIISB+xxoDEVYUa+oHK676R5bZEKLrea1OIcBv0=;
        b=PNa18tsMa5e6j69Hh5cz4oaFsc8mFSCqrgPjYdbYNLJqhpM9OCQRhL7LjCVX9aVoxd
         C8I504wUHqt9OX3WbeUHDfb3wSJ0yO2/snrdNbF43QWXT6vaLT0xxR6iJlE3isMGxF1D
         RRu87ORuPIqEWjW3wC5cZi9yLJm8Uv27vPU9kAH9cel+rC90kTH7YPyPeJniFzPVOoiC
         hxnzKujq7UwDVGSPrqUDKp1flGI+f38m/O0759CuFUA/8SI1dfaH8SNbDuiq6/dCOF59
         WtS0MmTBYnB9AgcW3p8/ZxJMoSVaYyQn3mXMDu9+RA7VIKUdB+WUT6c1S5kMQuDSgJwn
         drlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039068; x=1721643868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk0IVIISB+xxoDEVYUa+oHK676R5bZEKLrea1OIcBv0=;
        b=bWEkdJ1vpd3nqRAto6ye0XVGvAQeIwcuwaempOli44ZcfQw40xCTiogc9n5rObPWNE
         t8yrIAAAI2HxnRjCQeRFGHiSgjbYbRD/dtHcuuanrBJjLtLUfUfghLn6fOlzIH81rJIH
         DFZMKluEq1ZdPbf+R9QwjlTH3zDWWmQCOMdraa/CRw87ot2jki6zButp57S7SFhAWzVg
         Bgge+pIZ6PsdCH4ROfmRmN2QSC0eF9fc4sHKXhwOEhJ5Zwjt5uBsJZqTc4fVPwwRnC4r
         D5Kqf8OM//MhuS1XqCewUDFtiU1bDSvDfyRUK2XjAdUM+lU291nDXHdZIodtNGb+yIN+
         iDdw==
X-Gm-Message-State: AOJu0Yyu6SZARqRnBIrnWmMlMmlBKdi6YQFfZbOkhvf54WW5tYC8djZh
	7OazRt7itjb9H0l8j97U4DzptsT+Gc2lX35+GiJwgc3BPZQ29mxdMSqDRj8lL0FKpkokTXRxVDc
	ZBPcVi7ZiwuP8lygWZx8IfuVeIHCgmqTw9EzHM/9c
X-Google-Smtp-Source: AGHT+IFLqxh9pq4OrKUsrwIC/EV3wXumntEVM0LHQyBmkzESNGse7Y8Rbpvx4nRm52nqY8CGXoZyEuLvX7nY
X-Received: by 2002:a05:600c:4818:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-426707db749mr117242695e9.18.1721039067714;
        Mon, 15 Jul 2024 03:24:27 -0700 (PDT)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4279f2ce10esm2669325e9.41.2024.07.15.03.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:24:27 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: linux-media@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] media: pispbe: Protect against left-shift wrap in V4L2_COLORSPACE_MASK()
Date: Mon, 15 Jul 2024 11:24:25 +0100
Message-Id: <20240715102425.1244918-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the user requested colorspace value does not wrap when
using the V4L2_COLORSPACE_MASK() macro. If the requested colorspace
value >= BIT_PER_LONG, revert to the default colorspace for the given
format.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index e74df5b116dc..bd5d77c691d3 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1124,8 +1124,9 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
 	 * not supported. This also catches the case when the "default"
 	 * colour space was requested (as that's never in the mask).
 	 */
-	if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
-	    fmt->colorspace_mask))
+	if (f->fmt.pix_mp.colorspace >= BITS_PER_LONG ||
+	    !(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
+	      fmt->colorspace_mask))
 		f->fmt.pix_mp.colorspace = fmt->colorspace_default;
 
 	/* In all cases, we only support the defaults for these: */
-- 
2.34.1


