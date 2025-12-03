Return-Path: <linux-media+bounces-48132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C8C9E51F
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CF954E13D9
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35842D836A;
	Wed,  3 Dec 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nL/66nl6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4883B2BEFE1
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752143; cv=none; b=hjTR7oZHCiUKUo7uSTEQGVghKSqK+OK3YFj9X4ruBdAyA2husXFgZGVdMjd0zp1Isuk5XccXPqHHz2DVZSlew1CTqD0FJH8QLgDJDY4zORz+q9F/sZTavd4MwJx3z8byv+ap9YfOqdQEOrgNtWPWTuhsIVUYjUsHsFIfk2GzNVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752143; c=relaxed/simple;
	bh=KRjf6rI6QeytErOhTZc6Hqc8yif5VI8/8ZIpds2a6M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfbJPkNi9unOjSjyqrHD2l9vROwxTVNbGlXG5BHcq8qfb9HVkg/YIUcK0M+Zxw/uHy8ZAN5b7GjjhP5aVdp/zwMYT0pcLZ8Lhu95jVrn26gAyCL8bdyyU1Mypz7UBrFYqrwLBEQjWlhIBP0b8x3ABYd6Bih2nWelJyoJRbyNiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nL/66nl6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5943d20f352so5740241e87.0
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752138; x=1765356938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woHXwxvxfwFTv0q/SqwVCTAjIUDR9jdYwm8dKIe3Yl4=;
        b=nL/66nl6Eo1iAwyzy1bN5vCPXgxbn5AKL0d+N0TobH598vXYk/lCGHpXemuKlCiRVE
         Oym1V5T1VktChhfnfNAgk/IXDJel76XomfDUGu9xGbe2sb/XomFsKBKackAnwiZDvTw4
         Pjp2mbX+I3wsoBlwVUAliWFfO/rFKKfttW6Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752138; x=1765356938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=woHXwxvxfwFTv0q/SqwVCTAjIUDR9jdYwm8dKIe3Yl4=;
        b=jirvGyzrJTahKUffhQiJeVkjzj+MLF15OyO3cvTrNzTzt6hvzDU+ihRpr1f+7PKlQl
         XwExuPVYk8aKHXpOxhlG3fvxBSmKyrSLGbu8DsCajal+IKlRZ/cltmEqzweSv6smLFhc
         2Z/YZcSF9+5c80XbLimcMogUenNZk8MUArJfMlKUL2VRlhmMBtwfmsOujBzAOiw/n+4T
         V3e4n8RFCkkMmI4is6vCn4y8WniH8no7adEiJdpZ7nQLuTny7+XNfInNMDkaHjimmzCm
         cmFFGn+SdNqgCl4oMbU/M4K6Psh8PgcLo1BY16tveoB5v8u8iGAJ/jB4ferCa+kKyVzN
         RA7g==
X-Forwarded-Encrypted: i=1; AJvYcCX+WybYrKjuRtNsLAY11xGk8QmImKsXSUm1d7mUU1XZ6OoyteA2EwYpHSiEqFLGyWmF8LRIoRqnae02uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC27P8tC9+GnT7Tuyus+jz3iKEQbOBaw1L1dX6P+/BmC6WAy5W
	88HR8dX6+X/rOKDM9VSXmK2CzGQ5z9u781uOywlWwI2VCopDhJg+XiLtVpk+pm0tXg==
X-Gm-Gg: ASbGncvQKUIn/dsRWWCC6zCzz7Y6IuPGyMeiwJ/vndt1FJaUAUXXbstFBnAhwD5BLH8
	gKE5+dmtYquAbTZ+5MEXNbNWB9WLWSGHhiNGA0zeJ1gghU0LVnF4/wf/edFqXfC2vBBhd7E5w9x
	QvR2kc8dKNW+YEpNbO05Jbbww/hZn2GNLTJ+vBUF7lJclzSwUC/j3Z0wPNYudBhbSsWi74uoK8s
	7KDgoGGWDHoptQnoDsM7ZcutaGcLs/zAA1UMOcPRJq+vJc1ivNuioO1YzkX1dStk6mVV425VwIO
	Gf4eE8M9k8OeFQYlyl0poFKL1kp/SE25E/qpyrHTQrwVlNnO1adqjPKr6+JsVF4ol/mlAfRXA5C
	ezx5ghMfUfHZh+TD6rb4aXsdyAEHoW4ZTbVJJZAx9UcWJgM42m6scPJyctTfi3ztlvkaHM2Dm4s
	VSgzgxSYc0+IPebrpRHYqcWVxcBckMVUfzIjbseNNgSVmvY5Wr4dyP7PnBf2HD2BwOlP+TYHP65
	jeaYe2nGdgFgubJFLo=
X-Google-Smtp-Source: AGHT+IFTKSoVv7lOSXtd9iPwhZeRSNLFxYSPOIOsHgyo/230WEcBofLQ8T4STXRlBe4/0ZQCEDG4nw==
X-Received: by 2002:a05:6512:b8c:b0:577:2d9:59f1 with SMTP id 2adb3069b0e04-597d3f37650mr683682e87.19.1764752138351;
        Wed, 03 Dec 2025 00:55:38 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 03 Dec 2025 08:55:34 +0000
Subject: [PATCH 1/3] media: uapi: c3-isp: Fix documentation warning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-warnings-6-19-v1-1-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
In-Reply-To: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Building htmldocs generates a warning:

WARNING: include/uapi/linux/media/amlogic/c3-isp-config.h:199
error: Cannot parse struct or union!

Which correctly highlights that the c3_isp_params_block_header symbol
is wrongly documented as a struct while it's a plain #define instead.

Fix this by removing the 'struct' identifier from the documentation of
the c3_isp_params_block_header symbol.

[ribalda: Add Closes:]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20251127131425.4b5b6644@canb.auug.org.au/
Fixes: 45662082855c ("media: uapi: Convert Amlogic C3 to V4L2 extensible params")
Cc: stable@vger.kernel.org
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index 0a3c1cc55ccbbad12f18037d65f32ec9ca1a4ec0..92db5dcdda181cb31665e230cc56b443fa37a0be 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -186,7 +186,7 @@ enum c3_isp_params_block_type {
 #define C3_ISP_PARAMS_BLOCK_FL_ENABLE	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
 
 /**
- * struct c3_isp_params_block_header - C3 ISP parameter block header
+ * c3_isp_params_block_header - C3 ISP parameter block header
  *
  * This structure represents the common part of all the ISP configuration
  * blocks and is identical to :c:type:`v4l2_isp_params_block_header`.

-- 
2.52.0.158.g65b55ccf14-goog


