Return-Path: <linux-media+bounces-19462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA299AA3F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF4751F2804A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6037E1D1318;
	Fri, 11 Oct 2024 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXs1lOsc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A311D0F4C;
	Fri, 11 Oct 2024 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667878; cv=none; b=UzS7+r0Yozp0ZKEtXSA7ifZMgOZSpTWRG919SYNqclucbBDk38mY8+JGqYWGq+EWd+INIIkuL0gCHMkuEEVMtEu1KbcZdit51nR+g0hBMkGqRK1UDuEmzpq3jT2DA/w7Ljt5OwpjvKeSjqxvrZDS8MUWSxi1JliTBJSFTatOsL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667878; c=relaxed/simple;
	bh=OqGc6rLHSoJdJdnZGMY3nmYDbjz8rOMXI8c84zvYwRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4/FgRNB590giwhFqEo+CxpEpBAJFL+i0dPMVsK94tk0YoBtvBDxzyynk/0hPuIlmjFQohT2MxyCCqvhJnSffK8M3BuHaRRyJ0NkPJ2UQjwhPB9pFcj4UEbu7s3EMtOvzX+YsR4OKOLxkc6SSiWMZY6xEAas4XxFxwMQ5NdeO20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXs1lOsc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43117917eb9so17825225e9.0;
        Fri, 11 Oct 2024 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667875; x=1729272675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq1bR8QGhhUwaxGn4V/P0rav0fA/IINTBBL00un5dpA=;
        b=DXs1lOsc+f/ucGy6oNI7bo9RHMqXremLP7/ZDrOcHifk0ppfTMTDfH3y7/p7GGr+fV
         sMk/ds4LEPDLEAFlZ+QR50vqijR1IicNiyTvqOdWvJtJIgP5MFSC9LFwMlwoG5NOX1RF
         w7U98amVyRPcgLyviD+ICUuo8BFFPPqt8hJpdatpLRXgX2IoA42JUJAAZ/DwfRJ1AYEc
         QeTny6szMr6JxdzYYv0WQ1LZBMBoOXf8CJ1Tr3n+pdyeKWd+f3d3IpRR4u+Wyi+5Fdxb
         /G6kLhXdfyH6LzZjaNETaOPf5KTBS911qrNK4Mz+f1jv1dxn4D5l13kJn42Z2CbJ6HCN
         amYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667875; x=1729272675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq1bR8QGhhUwaxGn4V/P0rav0fA/IINTBBL00un5dpA=;
        b=ENcky8nLbGPVn6jCCmAQy7oq8QnBPHCrTf9Fut9IEGBCfwlWm1nSlGMGmbu1qh0i+e
         ggPY1vA/hK5NjwAdfFafg8T1e382ukuJUXaRQt8t3GCg7xpKdfEijofbrXIl0bPygPN6
         +TYkKF3kvhPqy2Q/4M9VDGa4lgGKSqZFn6KiGVio8OoWkpSHQXVD0BEGVoPWW11bewe/
         rJQPOUXSYixklNpAMiCvaq50z2K0ercnjRU3AG87pe34TERlGCAD7+xTM1tB6vPP8Wfu
         G7Uvv7+KLws/3pp1YSOi1lRnQnVJcGVFSOvtBZZIscH7wS9wlZItHaAeAFyEfCJ16pZ4
         IjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+YmIuAp3tlP2VBow/bX7zWmTGfSi6jfamcU+D2E7q4ijsrkba9NlEfJg3uQMhAWOjsCeG4WKw3GpSGj8=@vger.kernel.org, AJvYcCWGPKs4icelcvZa3HHiUNa2Hwgq44PShNHvqIBtFaVxqtLl+omeeBmmTOuU6qv1TvkEBWbEKnU/clkxgFHQnqliatE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/Xe8i/XyHIYQMMJfdzHYoMHp8a6ovIXEf7MMqX+UJ1SzdeJR
	vu9yHujFNrjIM/PvWFPXfCXAUlf2otH9Xa13hxpqDsQbrow0G7l8
X-Google-Smtp-Source: AGHT+IGmAHZ1HM/a3bdIdNo1p2ZKL5ZNuMZCNKC6qc/q/6P7urG/FftINnMUuDc62xQlctfHL71RcA==
X-Received: by 2002:a05:600c:458d:b0:42c:bf94:f9ad with SMTP id 5b1f17b1804b1-4311df42073mr27114465e9.34.1728667875244;
        Fri, 11 Oct 2024 10:31:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 14/22] media: rzg2l-cru: Inline calculating bytesperline
Date: Fri, 11 Oct 2024 18:30:44 +0100
Message-ID: <20241011173052.1088341-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the `rzg2l_cru_format_bytesperline()` function and inline the
calculation of `bytesperline` directly in `rzg2l_cru_format_align()`.
This simplifies the code by removing an unnecessary function call and
directly multiplying the image width by the `bpp` (bytes per pixel)
from the format structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c     | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a0fa4542ac43..8932fab7c656 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -812,20 +812,16 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
  * V4L2 stuff
  */
 
-static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
+static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
+				   struct v4l2_pix_format *pix)
 {
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
-
-	return pix->width * fmt->bpp;
-}
-
-static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
-				   struct v4l2_pix_format *pix)
-{
-	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
+	if (!fmt) {
 		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
+		fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
+	}
 
 	switch (pix->field) {
 	case V4L2_FIELD_TOP:
@@ -844,7 +840,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
 			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
 
-	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
+	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
-- 
2.43.0


