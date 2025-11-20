Return-Path: <linux-media+bounces-47454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BEDC72F58
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 31BC72B43A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0D73126D6;
	Thu, 20 Nov 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB/nbm5C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADC5311979
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628602; cv=none; b=p53tcvkcWk8eRIQ1/QYPEr3XlbNc8YfrWGGXArHPIGonIxSaVZkzXj5+aDaL0eiLlUI2gA/vmr70BZvEPbz0x/08Y9BFkimoepWq/3OtUIPoN8uYu6zIVYT078BMB4JBVLj4QGO/hUPtrFhC6nJ7jhBIeTWo/75xq07rlhAStWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628602; c=relaxed/simple;
	bh=q9U2/lglyvUZ+6SzKjNSNlDwmEjWmsKN97d6E/pOIIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUpeZPGJ2itZDLZ2ejUGl7Ya/M7e5OFxIBMZrDYBClLAag9zvIflbg4VQHY7yRBz0FAivdKDbL8ebwbprcjdCDBSTzQXWI1sKYYPabN26DeG+tZMjtzjkF4FPOfTSPPlVl+uEUPSraRUntRUQbMeiYNrK8+J8KGeMtViK7dZu/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB/nbm5C; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so608213b3a.2
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628600; x=1764233400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7GOu69hsNGmnIy0MHORKTrtvDnS7Wvg9FFJEsAiMq0=;
        b=GB/nbm5CqaiIYh0XzpNVZ5KKW85pPhZu50I/z6bZj3F1GEouQBSqfXaawMQSfm1zdN
         n/ndc7T3CFr3ISkX+d8FknMTZx4eDPnfR8YDkLYr1axwAypJx+8koiyh4GUap45h+IZT
         5PFzN9/fyNUdLjsLD98KAgsLefYfA4xsZTgQp2bTNjV+iAKhWklnzTVUssiiWsuTWOv0
         6RLJm534RfDTljqQhEVZYNkZtEtpwRIZ+c+rZNWaozyfYfjGDsdjxRks25i0k3oC5NIo
         1y1kJK+LmfvatzP23yiI+G9mfk8G1cVYtZkgb/qXJVsvAiXFuYUVo3khkrDB1ls3bWoA
         gylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628600; x=1764233400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n7GOu69hsNGmnIy0MHORKTrtvDnS7Wvg9FFJEsAiMq0=;
        b=qlrSiCQb1QJFkNr49BWGk4BAK7rn2IIzcN55rX3UyzkJ7nMxgUkmwSv4VY5moq5Ixp
         +uaq2U5r5KpHUGz16F9R48RYPri4NUniCE6htBBFOuOR4T9EIKUVhB4WI/eytU+TFDuJ
         pbpXkDDBZ1Q5/aUxGlNPo/tUdVlpObP4hRd4GDZsF/pwedX5zvbkoJHNxJqsh4HY90+P
         Zn4SWT35F89OwTDfHiNJPe7w0FyDpO88pRU6Lib4TiHukxQ18LAaclcREja/nAXGx/PR
         Re8iP/1wu+eOW55hJK0kR0ynRBtToUXcjQJ3Ljw5tsEDl20/+8sUi70gyUlHAQzz/jLN
         qMSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6+EsfG02re4igeflTeDWTrK1Hc70XzAozQWKMkJa0/zRj9OVCjWLCy25YWcK6cea1FWQor3APFzILLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ24hmBBtJ/DotObK5PaecdoK6Tubh37kdZNM7s1NeITVP1cIG
	HWVEGeAWx28DI/8s0XtgDfjLMnOw8yyFX+hlGSSLh8U+isf9AaCblK7T
X-Gm-Gg: ASbGncu+QBapx4HXXIy8oJb1GjZcKqpcDfIooeHnx27R9HRWp6WM5uxVvA4Mqgxk6IT
	sd+s1K77WgrsoeJ4/FZvVy64M55/2+NTNdw06GK3xw5EG07G6UV/GtG6n7ZxEHoX2RUMBgJ8W/k
	y3SBv9uEuek5GWf6oXiGCpDtjUpG0IaoOelHLzY/uNkhUPS0Mp3A1JlNR26q+qO6ZZ+Dce7PLMl
	y5JIWbUIZ2oto5U6lhKDn2l+ADQq2NVXEv6yjwToG5zynVK3ZhuyXmavpOuY6P29JYYx5+cdv21
	2VVeE+xJxfKU7U50sand5iHU5qDQezL9FsLW66ZdltAUmmTXUiLyFGGFudI6VTPqk2fcPcz6ail
	vQBAlRkLlfM26aJ6gC7alpZedR5kAMK4Ae0e+MI0jXiVDZskyOhzF53KM0nofIyfbK8fZn6N3kv
	TzLsF3OwixbnkEzK3USTWD6eCurlYxFZ1e05zNu0mTs4kLE3Y+
X-Google-Smtp-Source: AGHT+IETrPi74BdCXGprduZagz7q3BGs8jaQJi/0NaAzVeg4Go0h6DCV8yKgZzo5mAFfrmlHcc2nJA==
X-Received: by 2002:a05:6a20:3d1a:b0:35e:6a5b:cbc9 with SMTP id adf61e73a8af0-3613b62b45fmr3420426637.50.1763628600413;
        Thu, 20 Nov 2025 00:50:00 -0800 (PST)
Received: from opensource206.. ([157.50.102.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm1974900b3a.41.2025.11.20.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:50:00 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 4/5] media: vimc: capture: support custom bytesperline values
Date: Thu, 20 Nov 2025 14:19:25 +0530
Message-ID: <20251120084926.18620-5-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120084926.18620-1-opensource206@gmail.com>
References: <20251120084926.18620-1-opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow userspace to request custom bytesperline (stride) values in the
vimc capture driver. The driver now clamps the requested value to a
valid range instead of forcing a fixed stride.

The minimum bytesperline is width * bytes_per_pixel, while the maximum
is limited by VIMC_FRAME_MAX_WIDTH * bytes_per_pixel. This makes the
virtual capture node behave more like real hardware that supports
aligned or padded scanlines.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 7f6124025fc9..7164ec51eb80 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -85,6 +85,7 @@ static int vimc_capture_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
 	const struct vimc_pix_map *vpix;
+	u32 min_bpl, max_bpl;
 
 	format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
 				VIMC_FRAME_MAX_WIDTH) & ~1;
@@ -97,8 +98,18 @@ static int vimc_capture_try_fmt_vid_cap(struct file *file, void *priv,
 		format->pixelformat = fmt_default.pixelformat;
 		vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
 	}
-	/* TODO: Add support for custom bytesperline values */
-	format->bytesperline = format->width * vpix->bpp;
+
+	/* Calculate the minimum supported bytesperline value */
+	min_bpl = format->width * vpix->bpp;
+	/* Calculate the maximum supported bytesperline value */
+	max_bpl = VIMC_FRAME_MAX_WIDTH * vpix->bpp;
+
+	/* Clamp bytesperline to the valid range */
+	if (format->bytesperline > max_bpl)
+		format->bytesperline = max_bpl;
+	if (format->bytesperline < min_bpl)
+		format->bytesperline = min_bpl;
+
 	format->sizeimage = format->bytesperline * format->height;
 
 	if (format->field == V4L2_FIELD_ANY)
-- 
2.43.0


