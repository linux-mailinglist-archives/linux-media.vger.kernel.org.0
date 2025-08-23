Return-Path: <linux-media+bounces-40819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94268B328C2
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 15:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 751065E1F16
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 13:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81C62512D1;
	Sat, 23 Aug 2025 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjukksuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE21D555
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755955341; cv=none; b=CvcH6q717RtoyRXxoaKD0DB/sRmDmk63IQEnn9/H7Q601JPNM3tmmw0AdU1M/M9zaSfLW6XH2KCGe/N7urqo3ubA8JWLcUhs80BbQLqqVHaAT9s2d6F863LIzO6ysDkVByJjfs4Rg0NC9p5ctXwFE8GljR9/CiSr92CoC8z8H6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755955341; c=relaxed/simple;
	bh=le3L+l2Y6bs2R9f/xBdwi0KB/ynqBHDteoV/oj+e3iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOzD4c6O5Z05b8bw+6kawC1DxGL/Dh2YC/JzzKZ8ibnMmzDe6gOj+eYKLimnzJ4W701doACkvhtxtxAU+fEHU/Hb8Jrima2oHLGYZLn64Fb5t/3cbMqWyfw/ffccEHdcoD/dzCRzCGB71bzjQUMTUqce+QeAwUtHoE+TrKsfPwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjukksuJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f3bbc9f50so38368e87.2
        for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755955337; x=1756560137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNGXgUA7C+dWYPkdgXZlZ9xlx6Vyb3i1tPvQOd+Hlzs=;
        b=XjukksuJyVQ2g1FrFO30jKLdkFdQffWhlOEPDPsXas2N0gbvDRL++Rxtuc5NbdqThr
         FYI0r+T5BtxRSKKmVHpaz+TFUNQF6eja8lHq0wZFOeukZVDjOH+Wrp87NswuGMVLIkFK
         BGdZnxCHNduLlgpe7IAxQPo3NdzrwPytGpZtLpuTjvkky3FPp6pNzyrQ/OTXzFVCFl1I
         vtepUc+TixXi2yTJed0UtEx+q+WssBdB9j8WIw1B+AMGnmXZwH4RuTcW0Xb7CEuiSybc
         q9J1sgjYqVbzDmn09T+lqcVdrI46E6L/NP7m+PDRPEzOcdr5AD7PDmsYBvomRdQFbFLC
         VIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755955337; x=1756560137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNGXgUA7C+dWYPkdgXZlZ9xlx6Vyb3i1tPvQOd+Hlzs=;
        b=F2I1bPcKfyY2HbOKUucEVgx4VfFMJlm6cMhFqYXvO9yhKMIQt2riuhX2Qz+26SlhB7
         w2EEmUENh3/q+YUh+WbNOn52iQfiS/A3ByxSLhNrpm/i3JIWw8YqMeulncq6KYw6Ok5V
         wXqMLZ9z8nTaqEnFRxncFo3S78DsC3wY6B072Lv1YOhcxSpBDEcOEShldsjdBpvKhjAd
         cWinqMYuisH5omXU0pIQ8rSu6LSyITLtKG5Sqg2tXJYAZC00LnAyvc3Nrqx1J4U4Z7SA
         dI5hicyZDSPVmQgDw/B3pCZUoyDiS/3IC8Yv63Wyzz5xHKwUJRx1tqTuI8xf6iK2wKwv
         /ngQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhZv/fpkfQs9/0ljGExf1KazDsid7OFt8mfSPgh9EvvV32bh1H9NQFPxoszeHDisnZFefklqOK4htMRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XoR3RQ4RxVWJ9jpzpSET3LWiCuGkzXEttmCfqSBct5fVa5nV
	Md3XcyDAPwfU0h7bNvRq8rrKXMHRW8xPekBpR1NpjDfqPQbRd+2s6fWUU7+vmVjrH4I=
X-Gm-Gg: ASbGncvqhg9k0o/JwhuMXhAwdoHSRHf7EvcYU6+dhCkOz7ieNQGU5yNUBzYdkINWSv7
	1/X4lZZ9Aae258N4+MbRZln5rbr1Q+KMQwrp9i5a0tUashkiH8BSNnHWezCGQT95Q0n+g+M2kyt
	+RvLb5EXPfOiegRyE3+JCfP8RZ9Fo8NDfHMXT/qnZ32XfffmeFN7MTKMItxKUOV2kQ1xr0fkKqO
	vUBjh0f9RVzzUEgGqCCGMpjToa6c8ux+4phiod/uRriMbHmn5SO/pxTQMQPsPY2BQiCdfUs4see
	WOqKmyXzXspbxI7lfYvxN/uJCBjLLVqR/dUyIbZuDSTVCe4yxro5dgZgh2EJQvyW8xjaYaE8AMN
	wyJPN+j+pXqLBIeq19M65DU7IWozpvpDsU/JdZsR/BCxi2bCZwCCgv+/at4paEjm1F+qRBMA=
X-Google-Smtp-Source: AGHT+IEgh1ufmU9zp834JYknXCdRCyi/zpwVxzyqk7vhzrOR7rkTA+MaMo+rHIinQCjDYtOTFd6RPw==
X-Received: by 2002:a05:651c:1501:b0:333:f1e5:77e7 with SMTP id 38308e7fff4ca-336510397a4mr9159101fa.8.1755955337067;
        Sat, 23 Aug 2025 06:22:17 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5a56c9sm5119591fa.37.2025.08.23.06.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 06:22:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: og01a1b: Specify monochrome media bus format instead of Bayer
Date: Sat, 23 Aug 2025 16:22:06 +0300
Message-ID: <20250823132206.160181-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OmniVision OG01A1B image sensor is a monochrome sensor, it supports
8-bit and 10-bit RAW output formats only.

That said the planar greyscale Y8/Y10 media formats are more appropriate
for the sensor instead of the originally and arbitrary selected SGRBG one,
since there is no red, green or blue color components.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 78d5d406e4b7..b7d0b677975d 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -682,7 +682,7 @@ static void og01a1b_update_pad_format(const struct og01a1b_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -828,7 +828,7 @@ static int og01a1b_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
 
 	return 0;
 }
@@ -840,7 +840,7 @@ static int og01a1b_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.49.0


