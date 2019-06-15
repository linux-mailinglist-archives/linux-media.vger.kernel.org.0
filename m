Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D56C947094
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2019 17:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfFOPBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 11:01:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35792 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfFOPBK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 11:01:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id p1so2251353plo.2
        for <linux-media@vger.kernel.org>; Sat, 15 Jun 2019 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=d/LYfEaalp5LFqT9rkfYpwhznVcTdVjFdPH1FV2t1KU=;
        b=mlxe0+lC6cabtTmQeoZyhhBKKesqoZDy/LH67jIaW73jeMJZ1/bbmCtLepu5YpleEk
         hwyAX+1Ll6J4iyoj18nNx05VXbYGtu8E4KvXhBwcxrvv7GCA/Wbu9XkvdkcGDHwCYWlj
         1/8+HyKYWJEgKAWzmsbf/a98MVgrgrIuwT/RjnAs+PEX7vj2fNEv9TeOX1YUOdaUmEeq
         gSjSPzwX3AtEKnXNmz9HdGmBor/XCmrgRAd6D5gZlD/0i47OTHDrkobUFkdmZ/xOigl5
         dGc+aJmSIFZuHiFAHgDznRg6LhDfwXrZgwrOpY/k6kN/jd7czsEOn/4AzvDIgre2q7aY
         Ca8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d/LYfEaalp5LFqT9rkfYpwhznVcTdVjFdPH1FV2t1KU=;
        b=MFYkJ8rXWZ0YbTJJrmb2i1w98kuTsD8m/I51iT88VH43hhoOUppIExXQYDsW3IxX0G
         /RtHFD8GHDOA1t1aWDvFZoctet1FIgPBEkaS7sT6zbCPT+tPHCGCOPV6w/7K9WfTR0Uy
         XwiF/PvdzWeJyO/LMaAC5eIYQDwkrB4SboNjnbUHAQ3reOQ8uhom+hBqBqUZ4AqEyCui
         KtLiRFo3k8UV8X8EN2Dw3ycaCNRRh82iah2bUjTptak1qkFu+gGYOXskeE+DvKpdN8ST
         /i5iXcK2gOFUiWiCHAkCG+DNkBGYTYCG2f/C38Hv57nWqUp7Ur870w/r/tStgKP0ZkyA
         3p1A==
X-Gm-Message-State: APjAAAV1UjP3nGC6wTLvDq4pPEOFgC8HD8WqgwzJMBe38lecPcv3zzVM
        OS8QWDjxXo1TyUHiB4BEV+xY1mp2QOg=
X-Google-Smtp-Source: APXvYqyPPnCZ8d9YmWIC4DEOfES3sehFVbLwy2rJbt94MtUCVjMMq5zZ3+tXP8p0CdxwRNnQOw4jYg==
X-Received: by 2002:a17:902:2006:: with SMTP id n6mr41875637pla.232.1560610869668;
        Sat, 15 Jun 2019 08:01:09 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:1b24:991b:df50:ea3f])
        by smtp.gmail.com with ESMTPSA id m6sm7428633pgr.18.2019.06.15.08.01.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 15 Jun 2019 08:01:08 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: video-i2c: use V4L2_FRACT_COMPARE
Date:   Sun, 16 Jun 2019 00:00:57 +0900
Message-Id: <1560610857-20978-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use V4L2_FRACT_COMPARE to check whether two v4l2_fract structs are equal.

Cc: Matt Ranostay <matt.ranostay@konsulko.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index abd3152..0781417 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -190,12 +190,8 @@ static int mlx90640_setup(struct video_i2c_data *data)
 	unsigned int n, idx;
 
 	for (n = 0; n < data->chip->num_frame_intervals - 1; n++) {
-		if (data->frame_interval.numerator
-				!= data->chip->frame_intervals[n].numerator)
-			continue;
-
-		if (data->frame_interval.denominator
-				== data->chip->frame_intervals[n].denominator)
+		if (V4L2_FRACT_COMPARE(data->frame_interval, ==,
+				       data->chip->frame_intervals[n]))
 			break;
 	}
 
-- 
2.7.4

