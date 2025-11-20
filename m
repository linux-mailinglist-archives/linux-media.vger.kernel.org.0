Return-Path: <linux-media+bounces-47452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4593C72F49
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 345524E2262
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B793112B2;
	Thu, 20 Nov 2025 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grH2bmHG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC248243367
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628594; cv=none; b=eixhPcctFTiOqF/mXJJ6Pg28Dxoz5wv5JIRdL/h8az3Hrun7x+Zv9odKAKZBrJ9/no6u4cqHOsKIkv5kOkKWQoo4hQkEjnUmCNU+p8UWuTw4+Ut7vDu6X7gghdofk58sLN83rlRgmbHrjjifLtqdaIV2Hnttas55IQTJScNxfyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628594; c=relaxed/simple;
	bh=+zQAd6/Lx4XwBMrDDvVeD3K00OAGTAt0KqKDT/5MdBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exj2oCKMczasgsqjkg6J1lb5EPDRkmZYkMqbwyfMyzTnHcjWQ3fgjGeaDnrZIbmUG0KAHEJnQGssJ/zOfxh060RthnL14VSVBy56iWqE7JPerQ+O5c6JQwzfD3CF7BJeqx8B9qlnAOv7ll2tVfypIKDe0sarQXFN5pltVBPzjHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grH2bmHG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ba49f92362so433008b3a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628592; x=1764233392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csSbJcLFM5L2vu2gw+h6Q2d5cAu19xceBRmAiyL/H8Q=;
        b=grH2bmHGAIFzJqvap/DyyULgWyN0a+qTvRuVQAa95XcM47I8ow6QOqQbihec67QyUe
         X3ympg3nuqyFGRPYF2GbLvKhgIEPQ/xrQcA4pkbHD4JRvA3K4koRHuV+fjSfAyz/LDOy
         enrCs2BC1e9Z5pVYNAoVJmz5C0XcsLSBiKfEk7eJvcTwCSB6K3lG5yp6UR/29KUnhiEJ
         teSaABbYkRwT6cTbKz0Tv7vpCMhjtTxYWe/sjkCbZCL97beXIKGTz1lPNwVsEaLGrvLu
         xA2S/Fz60hGZAoLGOkF0Kp4nzzwvtT92EfGZr76cFJAhz+Wayp8xxFQTshr0P8PQjZg+
         8bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628592; x=1764233392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csSbJcLFM5L2vu2gw+h6Q2d5cAu19xceBRmAiyL/H8Q=;
        b=T9wbD6ewxxRAmVuB+UTPASoJHcqvT9Ev8RrWEVEO2HuRUvNELYPN4AVnPvQk+mm1F0
         rNgY5NcXYYOwm1lt4l/BIq5QsuG65EPyLpJfexOUgdBUEOd9XKkCWXRyL9qh8GhE625d
         Y+FCrZtgLPSJtmIC639lNGOWdYw7LRS237uCmMjR5lUfm4RWUlRKM4B3vhlMPx7Rk5Bz
         9dAAs9PRjAokRul0aTTW4jO/XP0XA1kDeECRr0dQT/6+Edsmy5wrocgbSxZQgG99XYAq
         3smWQgOwW/Tm9P3crEnyqs7ZLlMPo+VlFmT3bksoPRg7TRuwXPb4doVPGpjsKKbdJHH7
         2i9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOktkYihsmw3kSOYqQ4QSm45zQefPMf3O6uy6t6hopnI9nZZ7E2uSbOQR1me8qxcveourIqgIustPRqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTFR5ku7/Pt6QGMzmOUVG+sCayN5rdlr0YhDhzu1kD7ZLNQ6Q
	MhxsnBqaK5ZuOlzZC/7jR9sIIQcufHBiRkOVWY7mcr5xaPOUPSY4Uw5S
X-Gm-Gg: ASbGncvFvcpTFuPgFSannxJWpP+3I8VXkXvQVl0cfV9e36xFR1P/e9CZI3242JQbr/D
	LiFdw+L95B3kN/dguTTrjMFeEn4+w8uqxgAshPN7bW0A2t2De5BZv2orwVnIvULFbNHX2mGBped
	vcPRPJaiIZN66kNWPvyB6ibXy4afWf079CfWiQsvPUaGqn1Bxrq6EZjneTzxxS6qLsv5O1ek//h
	+NR2jJTMhgSjh21GEkxCDdebluT/MoHLYKFli7ZfFcuYX2GC/pUyrUoVxp4nrBCJgtvqFCLrpMu
	DQAkGH4A9mn5Dc459RxpMYxhF6lfnvoNhLHqPBmLJh/HlnWiMz0UDeoLlUUnuGZPbG2EH1uADMA
	incajKiK/GOFzaiGcw7U5ngbmqgbJq3LNh+sMsVlF4fEHeJhalL1Mckp9BD2nE5q5BcyA9c6fnn
	XDI0zgVG2t+Q2o1+q+yNFtn7JlVwo8YtHm0SV4C4saOEtCOAHY
X-Google-Smtp-Source: AGHT+IEmgiNcjldYedQWRDUNHff3U8cCEAT8yv/OTxc8A9b5LjVo/3OaLWyNtUJbj7gEtzSczrGhzA==
X-Received: by 2002:aa7:91d8:0:b0:77f:9ab:f5 with SMTP id d2e1a72fcca58-7c420577385mr1389092b3a.14.1763628591939;
        Thu, 20 Nov 2025 00:49:51 -0800 (PST)
Received: from opensource206.. ([157.50.102.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm1974900b3a.41.2025.11.20.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:49:51 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 2/5] media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
Date: Thu, 20 Nov 2025 14:19:23 +0530
Message-ID: <20251120084926.18620-3-opensource206@gmail.com>
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

The vimc sensor currently ignores V4L2_FIELD_ALTERNATE and always
configures the test pattern generator (TPG) with a progressive field.
This patch adds basic handling for the ALTERNATE field type.

When userspace requests V4L2_FIELD_ALTERNATE, the TPG is configured
to output alternating top and bottom fields by calling tpg_s_field()
with the interlaced flag set. For all other field types, existing
progressive behaviour is preserved.

This change allows the vimc-sensor subdevice to correctly reflect
the requested field type in its reported format, enabling basic
testing of interlaced-field negotiation in the media pipeline.
Other vimc entities (debayer, scaler, capture) still treat all
streams as progressive, so streaming with ALTERNATE may not yet
succeed.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 027767777763..900c3f329f1c 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -105,8 +105,10 @@ static void vimc_sensor_tpg_s_format(struct vimc_sensor_device *vsensor,
 	tpg_s_bytesperline(&vsensor->tpg, 0, format->width * vpix->bpp);
 	tpg_s_buf_height(&vsensor->tpg, format->height);
 	tpg_s_fourcc(&vsensor->tpg, vpix->pixelformat);
-	/* TODO: add support for V4L2_FIELD_ALTERNATE */
-	tpg_s_field(&vsensor->tpg, format->field, false);
+	if (format->field == V4L2_FIELD_ALTERNATE)
+		tpg_s_field(&vsensor->tpg, V4L2_FIELD_TOP, true);
+	else
+		tpg_s_field(&vsensor->tpg, format->field, false);
 	tpg_s_colorspace(&vsensor->tpg, format->colorspace);
 	tpg_s_ycbcr_enc(&vsensor->tpg, format->ycbcr_enc);
 	tpg_s_quantization(&vsensor->tpg, format->quantization);
@@ -127,8 +129,7 @@ static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 	fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
 			      VIMC_FRAME_MAX_HEIGHT) & ~1;
 
-	/* TODO: add support for V4L2_FIELD_ALTERNATE */
-	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+	if (fmt->field == V4L2_FIELD_ANY)
 		fmt->field = fmt_default.field;
 
 	vimc_colorimetry_clamp(fmt);
-- 
2.43.0


