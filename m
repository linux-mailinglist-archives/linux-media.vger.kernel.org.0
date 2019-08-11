Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2783489012
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2019 09:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfHKHLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Aug 2019 03:11:11 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35015 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfHKHLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Aug 2019 03:11:11 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so46664740plp.2
        for <linux-media@vger.kernel.org>; Sun, 11 Aug 2019 00:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCT25vs9VnH2O8bbhIT2gpPs1BzwObCxZxVHwpFtcAg=;
        b=hhMOCpuA8wySo7gIuAPjtEfz2rM+kaXWqcV46C4wt3ahhZt/AmgQE20Zs2XraB/Opm
         82NN07gH9wL1gCVJCAmow4IoW7jMI3vX2EkOAAeu7dsw2qD60wAGZt2xQplsmhCVKNu4
         WnReydDveykZwsgG/FKRfBBf8BuDQZHRQU0oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCT25vs9VnH2O8bbhIT2gpPs1BzwObCxZxVHwpFtcAg=;
        b=JNsmTfkQjn5pLt1iwjqo+ZjECgUxCSR2j/1Q6qup0m2nE7wsM+GhYuzaRFQdmCemfp
         tgnMMdf6OCa2nLrMIplO1yFfTYCJJxKI/xTaGp+dT6AlTjdohoFn+jETAIXNWUTR61uf
         zbogmLP1U9pQr4P7HodCeAPtjSw80Yha42/N7QxGLQkx6d5iOkEJ4CRIgDvB4MYjqPRv
         45Ljab2xL0SXynGUL2l0eVgWSaDuyEHNgJ8s1r36C82SH7E+cDzO4IW1QMkNHM13GzZh
         lqtDIrL0qjknqCUFvONV88yoWCOYA6OALX8PRgwfHVC3XEPX3s9YCuwu+XfVfFKJgUX0
         n1Mw==
X-Gm-Message-State: APjAAAV0lV0A3Sqntrnf8//DMlvLc0XVP0A2Zon3PPfW+ZpKz4vmlnNA
        NjoQSQ4G6MQBZ5nCe2EpYikZe1gcF+bT7w==
X-Google-Smtp-Source: APXvYqxUZkht8slIBQIQXvHN1UWSjnWGHAe2tf4fAcHUzsSMCHoJKw5In8m8DQf9AaHobZqe0qc7JA==
X-Received: by 2002:a17:902:124:: with SMTP id 33mr27973321plb.145.1565507470293;
        Sun, 11 Aug 2019 00:11:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-25-85-169.hsd1.wa.comcast.net. [73.25.85.169])
        by smtp.gmail.com with ESMTPSA id u23sm106116999pfn.140.2019.08.11.00.11.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 00:11:09 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH] media: video-i2c: add mlx90640 subpage data to output
Date:   Sun, 11 Aug 2019 00:10:15 -0700
Message-Id: <20190811071015.3303-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add current subpage data via the status register to the video
frame in the last word of data, which seems to be unused
undocumented reserved data.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 078141712c88..8bc7b228ba40 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -168,8 +168,16 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
 
 static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
 {
-	return regmap_bulk_read(data->regmap, 0x400, buf,
-				data->chip->buffer_size);
+	int ret = regmap_bulk_read(data->regmap, 0x400, buf,
+				   data->chip->buffer_size);
+	int size = data->chip->bpp / 8;
+
+	if (ret)
+		return ret;
+
+	/* read status register, which contains subpage that is read */
+	return regmap_bulk_read(data->regmap, 0x8000,
+				&buf[data->chip->buffer_size - size], size);
 }
 
 static int amg88xx_setup(struct video_i2c_data *data)
-- 
2.20.1

