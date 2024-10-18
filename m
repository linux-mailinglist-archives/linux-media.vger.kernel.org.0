Return-Path: <linux-media+bounces-19875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C379A3FF7
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D092855F3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD272038DD;
	Fri, 18 Oct 2024 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SllOVKLR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E1D2038CC;
	Fri, 18 Oct 2024 13:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258516; cv=none; b=WEJ1XWEml1TivnrrhIs0Njq+VWb8WxGFhR2qkps8s1CAjyg/bf0t0waBkj3Jw4NwW0uzqQ9P9SM2GbIwPMBjXfi2onUZ5iK1nzZsTta+wtYymwq+GRha+mKyfCEOY4ijAmHRl1sugbxvP11Xh2fBq2bQSvtgpNFYTa+L6jn1Ba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258516; c=relaxed/simple;
	bh=+/agONk/gxEUUW3+pm9dXTEcKcgLsOsiDgSaT5pawdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJk6G3KTdkjOlYymI5bGsPEsdLT7AK2si4YTbcpH8vSLeDh8STnrSWxf0EmRzaBAGySqT5tjNMdlW8k/zPig0Fs1xl/zeACppdxK/Jqvh7DlVXuDksbdz5LuJwL+UrBJLkFHYafAALmSPhSPeafNk66TLKX0KfLEH25q6uVdK7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SllOVKLR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so13542045e9.0;
        Fri, 18 Oct 2024 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258512; x=1729863312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAJytwAC4eOvoaZ3IKILJd66FgvFsvwVRbpuQcJX+Mw=;
        b=SllOVKLRs4R15oD0tKv4BZzgQOYSKMhgb0B4Ml7VAenxefU3PS+DgYHFtOFVaAxID9
         ABVD9vqzNAu7eXEpuYIEGHxfNSOAtZE822h08WIv9E0GAwuFgoTRco3rOtjJ7A/kpnjS
         lOpdyLTdeZtV4WK9dokv6Zjh+5yD3rbRxqw1iugqG01lxN3J0U+D4939FbX/G/d1bDtX
         nf4iUvj2bAcTq//Cafep3zp66OkJVeNe99LpTaVR1TmUKSCaSro0Zncnm9fP3ve/AW2D
         X0oFELx56dmMPBg4cQ0anHbkHmw31XinJltgg6b9QuA7aV6NyurkuoFUQAXA7q7FhmQp
         rh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258512; x=1729863312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAJytwAC4eOvoaZ3IKILJd66FgvFsvwVRbpuQcJX+Mw=;
        b=LSrbHzZ9gS/hLyJc8k2C8yooXoWI3whRlXn6n3uhxlnItk3LyyTrIhh4F9vMNL//X+
         n/K3pNjF/rlFaRi0ca1qZ5nPjGWfTwaid8ILWn9yiAWVaXD2jPhqdtoQJQVz1Cj59XAg
         FkZn0305k7qSABVMoBcOWq5NshnLyB3XXc3etSMxzWM2+OKk/jUSjty+bbiAcvkccmG3
         izd8+kqS+sDLsxKjzhOLrhO59jdQuXW1pXkUZF7ZT4q3TFQkLmGrkdHcRf237hEXt5o1
         lzTF2x8DNtCA+KXGi679MRH/Ow8MHPD5BdjlV4LRkcZBaSRahLLC4iTgmBYRpuCRKHEE
         ydCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE080nPUIqJUIEhiYey1CKRDs/SY9IUVtjH8ysJlgoQL80/wrIpBynLKhT58GyU45yTAjo/FBbJOWn0z0=@vger.kernel.org, AJvYcCVFjBoRKgx+trYq83s5dzj3rod3H5Ep8tMrtRCo9sqfgEz1SGxtX1RWa8DHN4/V/zuDrsj3PBr8XGwAGAkzFJYBkw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3BBDHPhLttielpBXkbFdPEATVgu8fDzfqCdA+jeVaFhER1Xbn
	3D5AKwF/n6vgAkN1cELI1tpImU6emBjOLOJIcHTr02HPobS7SnvA
X-Google-Smtp-Source: AGHT+IFGZP2mQs2KvjTIyHap0ljBlkOqrl4imncdI3Ue8VDy/svgzbzX5krude+ICdC7DpV125GbLg==
X-Received: by 2002:a05:600c:3110:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-4316169ac06mr19875555e9.25.1729258512104;
        Fri, 18 Oct 2024 06:35:12 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:11 -0700 (PDT)
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
Subject: [PATCH v6 14/23] media: rzg2l-cru: Inline calculating bytesperline
Date: Fri, 18 Oct 2024 14:34:37 +0100
Message-ID: <20241018133446.223516-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


