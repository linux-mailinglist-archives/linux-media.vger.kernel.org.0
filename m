Return-Path: <linux-media+bounces-46112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF2C278D1
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 07:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4733B038F
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 06:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB37528689F;
	Sat,  1 Nov 2025 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTC1AX5F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281F21D596
	for <linux-media@vger.kernel.org>; Sat,  1 Nov 2025 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761978801; cv=none; b=cStNBt+P1+/XwFW75fWOe4kBvH4dYbIJA/t6gFhC8ujjaiBCGhRrXLNEH1ufkHoq/w/47GvS0VQdKiX2rDgZsb5D9aXll9rhTT0Ovp5m5ZcEA6dlocNyLeJaOiGBQaNIi9FALHuhBYquWEt+HNm91yLThoacL62oCAOowHbC0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761978801; c=relaxed/simple;
	bh=+zQAd6/Lx4XwBMrDDvVeD3K00OAGTAt0KqKDT/5MdBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=heJnaz6SGVazA15U5u+4SD76wvkcA6sugRGv2m7Q1VydH6rbVsbLuSx2d9le5DUK3xwglPRzAdA3YALnLVjapQIRA0jOCPZ3Er4rP37fmCH0x+5mUdBgROMnCrfwCCZp3D9QhH/6wcLhdduZ7yPFa51VVfvYOC7xCh2p97qKA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTC1AX5F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a2852819a8so2746556b3a.3
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761978799; x=1762583599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csSbJcLFM5L2vu2gw+h6Q2d5cAu19xceBRmAiyL/H8Q=;
        b=iTC1AX5FnaDqv+ALdsPkxgMavndxVUMntm/8197M3jIznZwfsKboaw1TUR4FPrB5eu
         I36BZefitP8w+Q4F7dJvwKt/rlUcTRVk9xWQTjvwtntypOReymr+NPKR5TNtiC/VJcgD
         ZwV054SprZDQ2Myy1/hCVwKTliP1bzNoReGChJlayGAWk6v5nXI+yyCkMwWtZLUmk93c
         4oJ3LzLdKMQVbXu/xPcg758yk96TnagfCJ3AEsgOAledRyl1tNvsBZ9R1QYC69MXw1VR
         9yLMvlYZ+wSufdQWQo8fCYDLEGK7AWqI2BOAurcM+t3lDCD2Q3WQoFRp+uM97CVTCkNh
         IdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761978799; x=1762583599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csSbJcLFM5L2vu2gw+h6Q2d5cAu19xceBRmAiyL/H8Q=;
        b=UAXup96IL7YaClRiDXeAdi0OY7TK4OyW8Tvu/Cz5Fk5IkjnyvWxcbQ69/QLURLfmjj
         0iqJvQVa79VguYT3iwIKvOku8rE/kf4mFcs500gLQwcMIuliLBM+TUTPH41RNBfIMcCe
         EYHRm28+RA9eLiTfWaxy4lEb97xJC1BeiFSxh6pjwvuydHgHeSaTd9VoJ/5G2za19tYN
         HNvnvuzyt0uH7Mh9l/CBvLdeeAqHMbsNw38gXa3EZjLSiYMXcub2XHa66M+JXNj1jlAu
         33eWpTidu2/dRxoOlDWWikJIMFbsH+TI5V6K12ou+m84sFg1qK20poGhKk7kcUUOkgq8
         VTTg==
X-Gm-Message-State: AOJu0YwD6YG+LLx5pPET0xyt3ZYiKxtWghFVSFASiez6QBWfubUn6uhj
	yYuhdWWyf+CJPYn5Nobgg+vqKFXuKub1q0yVW/VBmlZFFd0b4FDw619x
X-Gm-Gg: ASbGncvbdZfALvkVu9erKdGfpXGue28aCrbkGD9+vpOMFKBFSe+Pr4ebASfP9E38lLY
	WA4h4xoNFEEQWyjH2WnlMtCGQLruPQW1WZH+nwqoqRfbdVAwtN/DPE/r249nS7ZGCBs6x0VhBvI
	HWVHfeNUu66gH9nn9sm4SQiYDSjnURzw7/IIh38UCQ501KPHsyIVXGXFxaOGA61DbVz4BLT4HJ2
	/ZNXJTcZwsrdkl4aDL7nbLwHLLVgykDjF+ZgWcsjxeEws2RbZQ0TEZbukNtNX9RasgJQLwoKOsM
	nJ4EkE2qohby2D42BcuTGME+YhwuLV4VrN8k95jG66TbHSq85vqpe9IdNGWTyjQbi2aK1Y4GBwF
	2Rh+eZDu3tc2nUAiDOqGjSK/BqX/ACYTpCaaLVhQKUfzklrQkmevaraiKFQC70j7Tld8KXns2CQ
	ua/Lebm5aC2Y4Apc+mm0FTabAhRAQdtO/xx78RX+xMAU31+q4qRPw9b50v3cs9oDJ87jmV8adBs
	ZVE68XtMNHlRHhw2KIUtThexA==
X-Google-Smtp-Source: AGHT+IF/YXEAtCeyA+uL076BR8IeQ9W6hQvJB4WrGBw6+wROOWrzFmGWzsApi83flVhRhFyvZoFKhQ==
X-Received: by 2002:a05:6300:2189:b0:342:b918:b475 with SMTP id adf61e73a8af0-348ca5653aemr9055088637.21.1761978799150;
        Fri, 31 Oct 2025 23:33:19 -0700 (PDT)
Received: from opensource206.. ([106.222.234.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be4045fbsm4041381a12.28.2025.10.31.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 23:33:18 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
Date: Sat,  1 Nov 2025 12:03:12 +0530
Message-ID: <20251101063312.13466-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
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


