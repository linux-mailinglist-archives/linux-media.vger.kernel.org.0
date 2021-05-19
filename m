Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F07D3885A7
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 05:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353062AbhESDve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 23:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353035AbhESDve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 23:51:34 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAF5C06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 20:50:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so2743147pjp.4
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 20:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IF9z/4CR4I9nODmhixle8IEYz+JA1I8SG+9FbLFfO/8=;
        b=mOJmigFjM68s+YZeY9hUbJh7NLZ/iS5i0LsfdpTKEZdQZR2D2Z19il570KhKV+r+43
         u0BKRfUfXQguxfdnfJO3fh27J5mJmzJaLNUoPIZgc6KIMeF+/jCVEIbx7E4m8Qfl/ZNH
         dpgc+3tehog7G5QuP3fem6QzQfN25JPtVC0k6dQCTun03mHjSknYyqZzhC1q4Rrtichk
         pkNPB6d88cpIs54mAO5/ZbPPh06kIYmK2OoxJ7TF6VoKrcBcm8YKVANTBXnpG1LSXBZA
         oujTFWLaNrs/vgkiPcCvyeOk/PbxwzRg7fQDM1Fq1WWOoUJ+rE712KAoICMlXHx0orh/
         mqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IF9z/4CR4I9nODmhixle8IEYz+JA1I8SG+9FbLFfO/8=;
        b=aoLNsQFW7xRVKQjF6XErYkIfzyfVtKqidvLERSDUWOqJo6d5hlX+A/8z2V8fIiSJtS
         PQZO2PHrnobyT/Lm+ZN9gOEs8Wjj+eCkDcZno2IFqrQQ3l1Ao8GQk9ZSEBL7jyx3BUkM
         olvYpfAzt0vOgt2dJZ+PSDIYVeAmGTk8tBp1+ftdeQINRZIyAfzdDNchw3an61GB9wWl
         pML73zrqO6jKDghfNUmxR0rLR3t/1wC183OjnmYwFbevTtzXEg2tabK7XVeh36vkJLa4
         mn9zqdcd8oL8PdShUV9JVEXQwo0M2Q6JPPgKs/gBuhMencCQ9Kkg8UtiGnhaAQN5BzrI
         aWFQ==
X-Gm-Message-State: AOAM530Qe+xcpXC8YSTBoApi8eK89HgaPVomXDakYl7DG/lBej6ABveQ
        91ErWXbCXgQFKYkNOZTwPy89MVPOw6zXhQ==
X-Google-Smtp-Source: ABdhPJweBaVCNuEmaGJuJkpPNoaiXSjWnlfPWyge68Mr64fMjT12xK1cFDcoNel3ATbHncId4FJpxg==
X-Received: by 2002:a17:902:b7c3:b029:ef:8d29:a7d1 with SMTP id v3-20020a170902b7c3b02900ef8d29a7d1mr8434918plz.55.1621396213903;
        Tue, 18 May 2021 20:50:13 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id o4sm14070038pjf.9.2021.05.18.20.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 20:50:13 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH V2 2/2] media: video-i2c: append register data on MLX90640's frame
Date:   Wed, 19 May 2021 12:45:08 +0900
Message-Id: <20210519034507.9576-1-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516110902.784-1-euphoriccatface@gmail.com>
References: 
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

