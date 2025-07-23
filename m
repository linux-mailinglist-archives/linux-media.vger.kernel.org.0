Return-Path: <linux-media+bounces-38295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C0B0FF19
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 05:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C74F1CE01B2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 03:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDB1DE8AD;
	Thu, 24 Jul 2025 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Argxwltk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D01B4F0A;
	Thu, 24 Jul 2025 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753327076; cv=none; b=f10Ea+aDIJjIpJtdvwtiU4EE2aIv0EUss0PMnmApGvPV9MPxBKBZEIgR5Xg2xZ2SsOaiMkKMqHd+wBOCmjoS4BRNHi4nTEXQq+411xzSDuPD+eI1/qz07L6w2ahmEBSv+HHFYWutaJS7qd1KWlqS3vjxU5B7Gl3UbxEKErFonQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753327076; c=relaxed/simple;
	bh=QTkkDJTPCTOX/PBqhLvE73FsUJC/VYLEVVtFobyeEfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OujN7OzEcY7+QDXWmt3jBO2Vonjv5c7L0fIc1OfmRknrOFua8F1CsJg69sYH9/8oI5Kf8hqdW9zjhcJmp48TbuvWHn9I44SdVpzsulNuxUzBWMHDGVpoHyvY6VnuXO51SLUPawKGEW76A/KlRC3rq1FNXNS8UnHLLY0gjj/jTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Argxwltk; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e346ab52e9so70540985a.2;
        Wed, 23 Jul 2025 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753327073; x=1753931873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAljfrVbCQMP4OjU7vXlw+3foLy1g0TZyrn3Si/4cH4=;
        b=ArgxwltkWUz0jHWt7Un7OLxICQR62OJ8g+x9UWhVfzYFppbn2ADoWmahETDdRfUcCr
         vB9jubCUG/pmMfLQF4QDY2D9wpKxks0wN6kdz+o6AHmG3YVJtnUN3HwnOTeoc/TGW531
         xz2HJ1EhufNnwrpTYMJBzHSp3yIlFUpRqizyeRxIyG/d2QeR+SnvWVWDkQkCmKzbY7+Q
         lzJrWbXtVvoRDJWeLatnmYgt481I4eab6j4HSvsdEvmMfCwHQ6ifc1vd1eoU7fT4JmhN
         wnLVTXKHR8Rr2mEVHMbEI+0BdR9j07a4mrrIn0/WmoadD9PLAOIUTfDARMMRV3ddfUud
         4AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753327073; x=1753931873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAljfrVbCQMP4OjU7vXlw+3foLy1g0TZyrn3Si/4cH4=;
        b=AdqvXyhblGM3MDF0U3OXhWmDic8WWb1RANMGBUGgMpVHq6exKxOK6hzjCysnHWYkxb
         KWrHNW9Xi3LK8IdUyWp4AaQy/wg+OZtKbutT8Qxn0DBwcPmuK6WfyueVyYltPpSucM66
         Z3fEagH84yT3tAhT//jawhl7olzxmU9/NMB0b/xfcbssyU+tepS8Xq5HBEoyXeQl6/QR
         2AmXy6cnsYYVKnWTTCotBR1tR7OuShQwUh0OKs9OxAkHcrxTCxS1x9t19ff91tbsnP70
         6NgJKnGowgS++HhFRgSqvcQvmMRM50k9Z56rOqB0lzNSufsc2ckATQ3w32A2TqIVq69g
         w9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Y3ddJW7uCOP3bA4+c5JDU8eI42QuVvF3HXhrZMbcPOcYKqAxBbuwlbiBC7J4s9H7mNL6JWj5cM5RE48=@vger.kernel.org, AJvYcCU7aTvdGFNtv3Kkfh3lCNIpsWRZ44GLzclwRmVBaGPeu9BSjV+IsNwkKz473uVN85Jil3osgSFGtOwPtkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3d5tox+ozlbTxm7SwAo7F9Wl+5u5wz0Zq7NpLoTdPvI964nJn
	kMBatxW1RkEYScReY1tqiCk9ehqbreiPx5+foZuQHVPHziwhgHr2IM80
X-Gm-Gg: ASbGncvIa66AGY45FVAJAzC7mqIGEXDkU9Bf9ZNbteuYn8hyP0OWw2sMpKCrGn8k0xn
	i4nNk70Q1rr1UCAY9HDANTT5Ov2YrhBZyMjDqSmBavynX19NQ8hYWLlsWM0Gy6ar/iATz99aBqJ
	Bj8CvKNCNU/eI/AkexUo4d16bZGGYpY4TjoMER+MBR/nnwJnxpTDIj1POWtfKypZZK2ACEbopKO
	3nMOMlluWgm/55ZxqJc2a81CfhPxTQiUAalfBHGaT9eWNOeRxTRToDX/yxLpaBWpM/AsDWui4V5
	9l1AEgiA2UNcdDJPIIpcMdNjeJLoWrJdXXtLpYl0lGLqtYGGyeGlhu2atDzhUmAwqvminoslbaS
	A6SjEjlujZWDe7NNeU2MsHz3ffUxuLXjzj8YzcWjDoH86ZXmSOEKV1v8RJdQ8K51nfnBz4BfmcA
	==
X-Google-Smtp-Source: AGHT+IGMaoS2TN/vrjr4g20wygLTfR/K95in9/Al1VF4gv+iGx1fxXLgraUVzRNWvs/TzpAp/LgS5A==
X-Received: by 2002:a05:6214:21e9:b0:6fb:f03:6b24 with SMTP id 6a1803df08f44-7070069c990mr78773656d6.40.1753327073341;
        Wed, 23 Jul 2025 20:17:53 -0700 (PDT)
Received: from ax1.localdomain (c-69-136-155-163.hsd1.mi.comcast.net. [69.136.155.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7070fca2597sm6671566d6.64.2025.07.23.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 20:17:53 -0700 (PDT)
From: "A.T. Jefferies" <alextjefferies@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"A.T. Jefferies" <alextjefferies@gmail.com>
Subject: [PATCH] staging: media: tegra-video: use BIT() macro instead of shift
Date: Wed, 23 Jul 2025 23:17:57 +0000
Message-ID: <20250723231757.15443-1-alextjefferies@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace two instances of (1 << X) with BIT(X) in tegra20.c to follow
kernel coding style guidelines and improve clarity. The BIT() macro
also ensures proper type handling for larger shifts.

Signed-off-by: A.T. Jefferies <alextjefferies@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..1473f1b1f203 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -42,7 +42,7 @@
 #define       VI_INPUT_BT656				BIT(25)
 #define       VI_INPUT_YUV_INPUT_FORMAT_SFT		8  /* bits [9:8] */
 #define       VI_INPUT_YUV_INPUT_FORMAT_UYVY		(0 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
-#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		(1 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		BIT(VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_YUV_INPUT_FORMAT_YUYV		(2 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_INPUT_FORMAT_SFT			2  /* bits [5:2] */
@@ -73,7 +73,7 @@
 #define       VI_OUTPUT_H_DIRECTION			BIT(19)
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT		17
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_UYVY		(0 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
-#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_VYUY		(1 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_VYUY		BIT(VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_YUYV		(2 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_YVYU		(3 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_BYTE_SWAP		BIT(16)
-- 
2.50.0


