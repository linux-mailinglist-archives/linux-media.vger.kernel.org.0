Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C1439C7FE
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 13:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhFEL6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 07:58:36 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:39641 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhFEL6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 07:58:36 -0400
Received: by mail-pf1-f172.google.com with SMTP id k15so9386900pfp.6
        for <linux-media@vger.kernel.org>; Sat, 05 Jun 2021 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IF9z/4CR4I9nODmhixle8IEYz+JA1I8SG+9FbLFfO/8=;
        b=avV7ATYuhsjelQ2ZmcqNoBeqwaL65oSP2Ad51A1/nlGtkmiw1lcH+IxCV0x94pB9AT
         Xy7Jq4jWuL1xD/7+XlesAsNhGyHS2CZbbY1Aw2QdKlioomj1DnZFq9eSlyaAWp/o/le0
         h95sBwLc0o4+n1nR0vtv1au3jKTTqnOrZK3dviowRQXvGG6NBT3BW6YiUcA+JDswjxVT
         2aQp9I8XcDqn4lMXn1B4ktcHaeNpZg2qpfACc9OFoAmV5pkZ9jm9t8dWSQA1GlzBhdwG
         tfgaH8UDd5Lk9MR2RcowVO3Ilj7fdOJtdTbdXM1QPyFB5pM6jWLrJTPfIS6356HiziYN
         rJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IF9z/4CR4I9nODmhixle8IEYz+JA1I8SG+9FbLFfO/8=;
        b=dTsYAFSAYsUH3kG7nljXTVj6QpFqO7PtetHUOU+1GHWMrYA44Iy4Tlh/csODgyE5oI
         tak1xnkGqcGYoXsJ3tvWEiD4XEeg1wAmrNMTZZWCneMqM8TCCcSxFQyeqUzRlXMLf14z
         JnWbF4GMDEIu8nzdFrMJCIkq2Ua9jHnodLYpcEI7eQ29gtS+cKqnEsDF/Wr4MZ3QDlsk
         oOoC8ZXIPGOnLb7UPfO+k2qteasv4C1suYbeCOSHMRp7/nzb+HB0oZ3EfPccZsdFNQmQ
         rWcDlBbdU3qRO13Pds7nRyc+aGCkDdhW9BdqBR71ujFYBvqhizo1NFOEalOrdEzp+PhB
         eh9Q==
X-Gm-Message-State: AOAM531uHxyaHXXXZ0zMggxM5reFTW0hIPFG2m0HpMqvUBPySpD414eW
        0sTM3kax1C8aKuAHGhlAVnbn3B5qftw=
X-Google-Smtp-Source: ABdhPJzrHN7KiO+uZW5WIm6J6qUByrlLX42Gjuvkf1wQtL7eLa5BLu7KPIsdDMssY2wj1k8+iek2GA==
X-Received: by 2002:a62:cf45:0:b029:2ea:c56c:7b3e with SMTP id b66-20020a62cf450000b02902eac56c7b3emr4750756pfg.40.1622894148299;
        Sat, 05 Jun 2021 04:55:48 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id p20sm3897126pff.204.2021.06.05.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 04:55:47 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH V2 2/2] media: video-i2c: append register data on MLX90640's frame
Date:   Sat,  5 Jun 2021 20:54:57 +0900
Message-Id: <20210605115456.14440-3-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516110902.784-1-euphoriccatface@gmail.com>
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
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
index 2ccb08335..f2313b446 100644
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

