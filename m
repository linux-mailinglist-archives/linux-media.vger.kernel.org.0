Return-Path: <linux-media+bounces-37858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A3B073C6
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 12:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB9B5014ED
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 10:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CF02C3274;
	Wed, 16 Jul 2025 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UfaUfV24"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D636F2F2359
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662630; cv=none; b=Bogh3ejTxOUc5giWn3z3JsnVM/DsGQ1I1d6QPUsF7M6F/BQ7WSL+wIz6eGkYdflOGSBTqq9zq22x6gtWtFw9y2QYPQ9WA3Y/TVxvFtt36UZVtRA5euQcdzEmuEU4pMXtUUu8eb3uDv+3y1bZHxUveYol5WjdhNoFSmgXX5fqRWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662630; c=relaxed/simple;
	bh=3uXgPR8RTlTbUm5MOy2Rb536PMRnqB2zCJVH0mSOKbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uIj0m9YLL2e0YY0DIqDvLsCTSTtpSEtTYNomGoWkyjv+v06dJl4JprXhBhzUCbZR4Pi2+rkNXuWdj9R5eCnj4BTLD4EFcElpEJ2BVUrCI0sFHNoJAjCz8ut9YCeeM/aiXqvR/3w5rvK8XUCf7dayKB1C2xg6d9HvxK35jQxL1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UfaUfV24; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32f2947ab0cso56255361fa.2
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752662627; x=1753267427; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bob/WV7qOeJklj8uEadWB6S24Kn3tH4K6MypgV+1RNA=;
        b=UfaUfV24+ZqGy9gwM2PTIklfscQRBvz0qdmAdzXbrlgux/1xZ6Z0fFCa/E5ZbHr/xR
         8cUoZ0u1T8ch3O5q0K6SK903u+/wZOl5lPajDDOpc0og3osoVI8Sejg3UMrCHpZYbs8Z
         spmrI8Ccu2LPm7HFK90G0ok8BgsUsul8CGH2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662627; x=1753267427;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bob/WV7qOeJklj8uEadWB6S24Kn3tH4K6MypgV+1RNA=;
        b=RtYpPnr2q8epn0peXYwQnd+I64trtwnTLM5gpnlC73N11Tgq5axaIEarSaRklXnqda
         ki6sWTrr489os1Y5pzNlWJPZzzUAddUOs51kLHLU7zxTbg1Gd7/vZe4nmWKSn6rkP6ng
         WuBpH96wMbADbm7GhDbM/zBwPwp15ZfQFqx3cSYI0nVV9MfnifdRJdBlbvsRwzz/QLZA
         jtOp/lUkvT112t8anHAO1lD8U52nIe1liUXQ4viP0qh2A55LO2gOXY/r+7KaXp7mRjp4
         e8UFTOXYLFvQjOIfzRp3RnznUv1Q6KUHqFpOs5gOGM9XfgeF/mVm4y2KVTRStAWr/9xJ
         lBjA==
X-Gm-Message-State: AOJu0YybspZMtIEHMUDPvvgiBCzXmZEbvNmHysgVN6V4ZYr0g8RqM3Yx
	D7HR2oLOeqG4RgoGTv4w3qEjaQavNl7GZMF9PZECEYsbnAxVPn5DOVzhIGXn9m2Yxw==
X-Gm-Gg: ASbGnctEozf13YfTxOGqd15y+ltD5lOTV1wVPeE7Dy6H3kHEn8Ev00xznq8BEw0eppQ
	mz4K6fZ+LXunXn5U+/+j7ITT1x+RQz84GwHDW09J7SU92OtBTcQOQ/7OpH6b7W7bynYyRhCAryz
	b29IKrFvfU8rvlgYtb4ScnX/vpKNbK8irx1q3PfVjZFDmpaHDMYV86M7px1zmPzXaeSHGMqh++r
	qXpDO41ZD9lKXwAr2CCCNUvaTJ42BBg2twiukL4nW9kUfBlHmPF5glQTQuzz65ooB87fSRtfUzf
	dNizg7eMTFmpgGQX5fxjK9tYvaqP58KNXqly3iceogC7k6UvAE8rhlYyCv8TBfMm2ZP8u5VuYPI
	tKY5xNrhQiXrsEvn+3GNCVD3wZ+gjHhJ/0GiHZ1MRodK9V/woKBHhREUQCgoN7j5xeaL+rFg2am
	48hQ==
X-Google-Smtp-Source: AGHT+IHZa5XbsCIjQ9PIjg1rBEBHdvI5f0YD5wHon1NOVE1OsS2yyGLjUyuWnEQInDvv/oIe8YzWkQ==
X-Received: by 2002:a05:651c:e0b:b0:32b:76fe:134e with SMTP id 38308e7fff4ca-3308f5e2b16mr4845231fa.23.1752662626984;
        Wed, 16 Jul 2025 03:43:46 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab912336sm20712161fa.99.2025.07.16.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 03:43:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Jul 2025 10:43:44 +0000
Subject: [PATCH v2] media: uvcvideo: Fix comments in uvc_meta_detect_msxu
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-uvc-meta-followup-v2-1-d3c2b995af3d@chromium.org>
X-B4-Tracking: v=1; b=H4sIAF+Cd2gC/32NQQ6CMBBFr0Jm7RjaCBhX3oOwgGEKkwAlLa0aw
 t2tHMDle8l/fwfPTtjDI9vBcRQvdkmgLxnQ2C4Do/SJQee6yCt1wxAJZ95aNHaa7CusqIi6ku9
 sSHeQdqtjI++zWTeJR/GbdZ/zIqqf/VeLChWWVdfrnvKCjX7S6OwsYb5aN0BzHMcXioE3OLUAA
 AA=
X-Change-ID: 20250714-uvc-meta-followup-1ccb6e8efc2b
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The comments can be more precise. Let's fix them.

Fixes: 6cb786f040ad ("media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
This series fixes the uvc metadata series landed in:
https://patchwork.linuxtv.org/project/linux-media/patch/998c5fb0-8d32-496c-a1e2-cc9c1a73ede0@kernel.org/

There is no need to Cc: stable, because the series have not landed in
any stable kernel.
---
Changes in v2:
- Improve comment even more... Thanks Laurent
- Link to v1: https://lore.kernel.org/r/20250714-uvc-meta-followup-v1-1-67bd2dc05ef2@chromium.org
---
 drivers/media/usb/uvc/uvc_metadata.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 229e08ff323eed9129d835b24ea2e8085bb713b8..2eea543b0575598279d7537ea767ca521b6431c0 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -196,7 +196,10 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	if (!data)
 		return -ENOMEM;
 
-	/* Check if the metadata is already enabled. */
+	/*
+	 * Check if the metadata is already enabled, or if the device always
+	 * returns metadata.
+	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret)
@@ -208,9 +211,11 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	}
 
 	/*
-	 * We have seen devices that require 1 to enable the metadata, others
-	 * requiring a value != 1 and others requiring a value >1. Luckily for
-	 * us, the value from GET_MAX seems to work all the time.
+	 * Set the value of MSXU_CONTROL_METADATA to the value reported by
+	 * GET_MAX to enable production of MSXU metadata. The GET_MAX request
+	 * reports the maximum size of the metadata, if its value is 0 then MSXU
+	 * metadata is not supported. For more information, see
+	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));

---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250714-uvc-meta-followup-1ccb6e8efc2b

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


