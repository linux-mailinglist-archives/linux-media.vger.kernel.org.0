Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E55381E6D
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 13:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhEPLKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 07:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhEPLKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 07:10:34 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3351C061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 04:09:18 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id i5so2771102pgm.0
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 04:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2eimQHTqKd+HrDDi3jl37OtCNAKSqvJkml38wTW0tU=;
        b=RA4ehtJxohgHZ019bo/eXo41VkvN2kgA7powDA2waQ+LKxp9nK4aB+k3TYGKcigrDI
         e5EQDnZBlLqGSIeFSxM/hcbKYBj5222GjlgvwsGARR9JBFWc3WrbbWIln3YlBP7lCINI
         j2xkTiqW+h2h9pcJsYTgyXzLgIC6T4+nSLJWDf0Na6xr7RySJFnOPwAG9cdLef8CXjyg
         4AXukWPlVPHRXJZ7EWL7F9h8tVINP6wGAFmRWjZ5UYKx1fe4DkSpK8Uj60QVX+Sau/CU
         +fWb4AWR65JjIS7pmL8+foEAqKWIQ6G6iP9CjxCQ34nTl9FkiNBS8IMXH8NEHfl/HNkh
         UayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2eimQHTqKd+HrDDi3jl37OtCNAKSqvJkml38wTW0tU=;
        b=QKCGl+SHnHnNdgeoKq6Dt7NRraJ/3Kgjl0HRII8zCEiPJGbe9Z3I2l2synhn5RhYyn
         rdsHkYHpcfF3fsdIM9PyaOxgjdXN3kvIPLNW3b9zioWGYD40yBdsVO6SR+1u3x1PkL9u
         fLNUPFWndnEfHKM/IwGtqfjvk5pMElouF62rjdFh4VpUVk3xKS6cq/DTCc9IDDEtoFEd
         TuuwZvNrjf8SfOrTwSWaRb+EAre1Gl3u0U5t9NjP+iJIFuEB8HUVKdTtakRh/zJZrWgc
         P2XkoSFM9zCp6kJB7g57gS0WYo1fnRKA2osLPnJ28vl4WQdaH9R8EOh075L0v3lMgCH8
         u9uQ==
X-Gm-Message-State: AOAM530W49JtloTL5fsX/uCiRZFHp/vJOupTSm4vWBl33FbYHtgBaAXd
        rkr4EUbAoFTdz2YHB1vFyrMbVopeLGJJc7Fu
X-Google-Smtp-Source: ABdhPJxX0x2W4k0WrS0GqYw4XI0lCQ8Zic8dzdcWmzPL77TacVU/fYvSfd7sG9g+ZGMEuHHtSY0Mow==
X-Received: by 2002:a62:e908:0:b029:2db:8791:c217 with SMTP id j8-20020a62e9080000b02902db8791c217mr1375040pfh.28.1621163358041;
        Sun, 16 May 2021 04:09:18 -0700 (PDT)
Received: from odkf.hopto.org.skbroadband ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id v22sm7488842pff.105.2021.05.16.04.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 04:09:17 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH 2/2] media: video-i2c: append register data on MLX90640's frame
Date:   Sun, 16 May 2021 20:09:02 +0900
Message-Id: <20210516110902.784-2-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516110902.784-1-euphoriccatface@gmail.com>
References: <20210516110902.784-1-euphoriccatface@gmail.com>
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
 drivers/media/i2c/video-i2c.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 2ccb08335..ca3a1c504 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -74,7 +74,7 @@ static const struct v4l2_fmtdesc mlx90640_format = {

 static const struct v4l2_frmsize_discrete mlx90640_size = {
 	.width = 32,
-	.height = 26, /* 24 lines of pixel data + 2 lines of processing data */
+	.height = 27, /* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */
 };

 static const struct regmap_config amg88xx_regmap_config = {
@@ -168,8 +168,11 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)

 static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
 {
-	return regmap_bulk_read(data->regmap, 0x400, buf,
-				data->chip->buffer_size);
+	int ret = regmap_bulk_read(data->regmap, 0x400, buf,
+				   data->chip->buffer_size - 64);
+	if (ret) return ret;
+	return regmap_bulk_read(data->regmap, 0x8000, buf + 1664,
+				64);
 }

 static int amg88xx_setup(struct video_i2c_data *data)
@@ -375,7 +378,7 @@ static const struct video_i2c_chip video_i2c_chip[] = {
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

