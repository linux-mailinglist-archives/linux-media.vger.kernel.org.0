Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D25639FA9C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 17:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhFHP2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 11:28:25 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:44651 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbhFHP2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 11:28:24 -0400
Received: by mail-pl1-f182.google.com with SMTP id b12so4839846plg.11
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6GoIE2w8uwO1CRLMthy9ZvDr93rSRBTSHKv3/wrWWI=;
        b=ndo1VItZ2u6gUcjZzkodUOa7zJstQ20jBklTaLdc/BegTJ2fWMWwbL52ONv5QjkzWN
         umQeRdO7vIf2Br3I/LN4TisFpFMK8veYiWxI2b8xMjtKH/ey/yDKWVvCWGNN1Zvusrcf
         HcTbzELevcNpShm3QPweILD3Z+Aq8Xgofu6nC7SBd53nQ9/W+yesM9gohJBv8K4O6Z/M
         COnNcfuJR1/dVB74fOcccHcDmxwrwYzDjljCP1ozwrsG9xYLdDDXcHSQQ7i3pOuW4zi0
         jgZ63JYyICSsbr4enfWyvz3ntyxiH+64rTrQdykxV8UhYtkaGdcmM3sdHTXiHNOM+dIb
         9QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6GoIE2w8uwO1CRLMthy9ZvDr93rSRBTSHKv3/wrWWI=;
        b=e1qOtsVW4DRCQLFZuyAFX2iLQeDSQRWh7BHEc1bruM6E1tnodYId/v7fZ+y1Xgq9m6
         P06ZOg5uWoTiViFCeA3fiWZ+leSuFMGtiZQa/r8rUxHxwNbSNPA7uS53WrZPKU4nTeLy
         81pv5iiyiLMBhkV+M+YMkC49vSg74kP58LLYMemE9PpTCz95avRp4ZJunKpZuHbYEO5P
         NuNLeo/SFDBGvOBEexuSmUPppFNq0ihAjYxDKd18I9+TngFcXtjp/aaRyYwvz2WS63tP
         hTWYvuIKPYtPG/0ZZajvSbbNdhH7RMQnsKOVe9TpLq7hzZ1TXo05qWN3wUt+IMYbEGLU
         U1bA==
X-Gm-Message-State: AOAM532NfxBcPUAZ2rTjGch5F06ubuHKp99jH8po3/PVdFjEAr05RN4R
        +/NQ/hMKHuyFqfhr+s/UqB58vhyT9WI=
X-Google-Smtp-Source: ABdhPJwcR8W+OrU5/DeUbpl6XdhdSNssaMLMjcNHv6CHQN87/BVYSqxzgi+cpVCde8k/mX910WTPog==
X-Received: by 2002:a17:90a:e60d:: with SMTP id j13mr25819477pjy.112.1623165922191;
        Tue, 08 Jun 2021 08:25:22 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id nn6sm14726668pjb.57.2021.06.08.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:25:21 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH v3 2/2] media: video-i2c: append register data on MLX90640's frame
Date:   Wed,  9 Jun 2021 00:24:51 +0900
Message-Id: <20210608152451.14730-3-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608152451.14730-1-euphoriccatface@gmail.com>
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On MLX90640, Each measurement step updates half of the pixels in the frame
(every other pixel in default "chess mode", and every other row
in "interleave mode"), while additional coefficient data (25th & 26th row)
updates every step. The compensational coefficient data only corresponds
with the pixels updated in the same step.

Only way to know which "subpage" was updated on the last step is to read
"status register" on address 0x8000. Without this data,
compensation calculation may be able to detect which sets of pixels have
been updated, but it will have to make assumptions when frame skip happens,
and there is no way to do it correctly when the host simply cannot
keep up with refresh rate.

Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 64ba96329..2b50a76f3 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -74,7 +74,8 @@ static const struct v4l2_fmtdesc mlx90640_format = {
 
 static const struct v4l2_frmsize_discrete mlx90640_size = {
 	.width = 32,
-	.height = 26, /* 24 lines of pixel data + 2 lines of processing data */
+	.height = 27,
+	/* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */
 };
 
 static const struct regmap_config amg88xx_regmap_config = {
@@ -168,8 +169,12 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
 
 static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
 {
-	return regmap_bulk_read(data->regmap, 0x400, buf,
-				data->chip->buffer_size);
+	int ret = regmap_bulk_read(data->regmap, 0x400, buf,
+				   data->chip->buffer_size - 64);
+	if (ret)
+		return ret;
+	return regmap_bulk_read(data->regmap, 0x8000, buf + (data->chip->buffer_size - 64),
+				64);
 }
 
 static int amg88xx_setup(struct video_i2c_data *data)
@@ -375,7 +380,7 @@ static const struct video_i2c_chip video_i2c_chip[] = {
 		.format		= &mlx90640_format,
 		.frame_intervals	= mlx90640_frame_intervals,
 		.num_frame_intervals	= ARRAY_SIZE(mlx90640_frame_intervals),
-		.buffer_size	= 1664,
+		.buffer_size	= 1728,
 		.bpp		= 16,
 		.regmap_config	= &mlx90640_regmap_config,
 		.nvmem_config	= &mlx90640_nvram_config,
-- 
2.31.1

