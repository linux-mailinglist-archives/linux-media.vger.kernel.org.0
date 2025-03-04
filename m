Return-Path: <linux-media+bounces-27521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D8A4ED16
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762D11890930
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4514263899;
	Tue,  4 Mar 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfjuN4Rn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439D259C98;
	Tue,  4 Mar 2025 19:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115848; cv=none; b=k61OUhF2yDfJWe5kCJJ4f+Dq/FvznoslGStKPHKN3ehTLJC9KdUEMeDyrAwLIbFGcrz9EOHRP96z0SoGgzHYVmafftIUqazbAqG85TalIrFue1EQ9ym5LsecQZ2oJxaAXTnD937YusP2MAOqyZ4HcA3FX/dFsVtl2ud3zaPOuT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115848; c=relaxed/simple;
	bh=D9w/p2AbUAWwKTtIxl2ShDJJVFkfDWQnMGaQ6wsGmLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BjgEUs7tQDWsotV+MLPKRqFEtAGD5N/0Typ+91lIUKFrTstkkKrhlrmN6lDI4DathDnaAobAjb/LMHXoQtjOSqMFkZ6Sv6ASkDzhXYzkHQuHKs4grsL6eiDKpp6JdzI463YpG8nYpB/RuvZB03rEdfMEQ31BH4SpntmeBKruKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfjuN4Rn; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e88995a082so5772786d6.2;
        Tue, 04 Mar 2025 11:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741115845; x=1741720645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1giKdkMYSHM2E6PTZuHXm+pJJXgt4/VwdDWGQuq2boY=;
        b=YfjuN4RnL2TmA84H0yJHJSlzWJQIyBzmfE+QA5Aqfbt7i5AdqywLfawBJJ/ckOCQwZ
         k/fK+6sK9kdgteT+CA6ULap1UDutpnB9WimsVuHXCb8m5JQ+ScXNuUvjtUR+/87I1/hR
         SF3U105DpXVDpAfwU1gQwJDRPYHAxAJ8zp24ORcQvVEah9ZTILKbR1/tISdhXAl9ohlD
         P9H8/qCiK3nIupC05N1IDQSxp6RKfbtx5JjWF7YxyB6yIeuShn9k9A0jVztxo0k6uH+M
         sUQv2dgjFAmIS7IdcqWRT8bAR9F6HvBsp7B1DdUEeHgSn5sIeOTtTBj5gJcXHv6F8/ME
         Gu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741115845; x=1741720645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1giKdkMYSHM2E6PTZuHXm+pJJXgt4/VwdDWGQuq2boY=;
        b=OucRAMSs6QkqudkaMUIqfLBdFQonGUcrYmpPOrheFYcCkZo1j7yPtUReMLjHM0JpfT
         K4eTiiLbF3lyj+bdh+7NDsTjI+1HLLx5FPjBiMxGR/w8iPbL+AdYgFs9/l0EHeKbc9Wh
         nZ+b2XstvVRRgL0hkrre4UYIoCpF/hPQWUrsCuFITd0QOdduUXyBL80NlsWPHJqmkUBK
         us8vLtg1GguoUDb800juGK91PlhCSx2ZNB4+RwzrPKfZmhXnwgsYy5N0ZAjWr8eoSYa1
         /0OqNbYXa1ur3K0RMKFUKHEawWTGCQNjZkZNUZLSxTZARyhfJAIDUgPOLOn+NA5VTD7I
         UgNw==
X-Forwarded-Encrypted: i=1; AJvYcCVDFOmiw3pP/0tG5ONlZLTGzEwG0l0Lkkyg2ZuIwoPkNaHEqHWxRo5BGOZlvjABrMCy3Y5qQhld5RceA3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xJxOOfU6HQ2E4Jxqnmlo3L0AmrY2cNrJQxjfmWdRQ6D7mh7B
	c3ZBsZiXX8N6zZZgihYrZNoog5FTAFnpGCbsZN4cpjhCe9Z48yK/
X-Gm-Gg: ASbGncujFRkxcfz6Xa0uOV/cwmvLBcda9mdlN7OvPxPCahWfza84ZqdNS3JBs/XONQL
	tVwru2WplCcSuaC5sieOW/S2KtqYWuXU3OWbxGNYOTpAOjgNYsI5B6jZImB4KmvYR02W+Ox1oZx
	EHnC5KLfmrjiIZ6gIGHQ7YlehAIsGiPGK7Hnba3lHSrcJqQrX+KdC0t/fVgRIH7TjTJ9DjPRsNw
	eQSMAPo16701ptZ1t442km+O9JTDDxBHKO47vWfiIbpM3hFUCTNI4RJyVnlIRM9mU+uWRXMTlXr
	yNxFhohtkfA6SXzJuqZnuiQvI5IAd365qHJ+6DG6ALbbXd12aK0/sK8GngTIR93DQfya2cl38//
	WVjk3mpCoyg==
X-Google-Smtp-Source: AGHT+IHgrQRm0AAsbZ9bU50EotmfecI4HKOtuThQZk8FGRB87LsLBkZtADeJNbA/73B8/+fLAY/hKg==
X-Received: by 2002:ac8:7c45:0:b0:474:bc49:ee81 with SMTP id d75a77b69052e-4750b14ed92mr1540631cf.0.1741115845418;
        Tue, 04 Mar 2025 11:17:25 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:8f2c:1c50:24c:178b:a9b3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f351687bsm24079351cf.19.2025.03.04.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:17:24 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH 2/3] media: vim2m: Simplify try_fmt
Date: Tue,  4 Mar 2025 14:17:00 -0500
Message-Id: <20250304191701.2957096-3-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304191701.2957096-1-mattwmajewski@gmail.com>
References: <20250304191701.2957096-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up vidioc_try_fmt with the following changes:

1. remove unsused vim2m_fmt parameter
2. use clamp() macro to restrain width/height bounds
3. use ALIGN() macro to align width/height
4. use v4l2_fill_pixfmt to set bytesperline/sizeimage

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 drivers/media/test-drivers/vim2m.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 6c24dcf27eb0..a22b61793a52 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -26,6 +26,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/videobuf2-vmalloc.h>
+#include <media/v4l2-common.h>
 
 MODULE_DESCRIPTION("Virtual device for mem2mem framework testing");
 MODULE_AUTHOR("Pawel Osciak, <pawel@osciak.com>");
@@ -755,31 +756,21 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_g_fmt(file2ctx(file), f);
 }
 
-static int vidioc_try_fmt(struct v4l2_format *f, struct vim2m_fmt *fmt)
+static int vidioc_try_fmt(struct v4l2_format *f)
 {
-	int walign, halign;
-	/*
-	 * V4L2 specification specifies the driver corrects the
-	 * format struct if any of the dimensions is unsupported
-	 */
-	if (f->fmt.pix.height < MIN_H)
-		f->fmt.pix.height = MIN_H;
-	else if (f->fmt.pix.height > MAX_H)
-		f->fmt.pix.height = MAX_H;
+	int width, height, walign, halign;
 
-	if (f->fmt.pix.width < MIN_W)
-		f->fmt.pix.width = MIN_W;
-	else if (f->fmt.pix.width > MAX_W)
-		f->fmt.pix.width = MAX_W;
+	width = clamp(f->fmt.pix.width, MIN_W, MAX_W);
+	height = clamp(f->fmt.pix.width, MIN_H, MAX_H);
 
 	get_alignment(f->fmt.pix.pixelformat, &walign, &halign);
-	f->fmt.pix.width &= ~(walign - 1);
-	f->fmt.pix.height &= ~(halign - 1);
-	f->fmt.pix.bytesperline = (f->fmt.pix.width * fmt->depth) >> 3;
-	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
+	width = ALIGN(width, walign);
+	height = ALIGN(height, halign);
+
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 
-	return 0;
+	return v4l2_fill_pixfmt(&f->fmt.pix, f->fmt.pix.pixelformat,
+			       width, height);
 }
 
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
@@ -804,7 +795,7 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.ycbcr_enc = ctx->ycbcr_enc;
 	f->fmt.pix.quantization = ctx->quant;
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(f);
 }
 
 static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
@@ -827,7 +818,7 @@ static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
 	if (!f->fmt.pix.colorspace)
 		f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(f);
 }
 
 static int vidioc_s_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
-- 
2.25.1


