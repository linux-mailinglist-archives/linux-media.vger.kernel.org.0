Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE6E39C7FA
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 13:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFEL51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 07:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhFEL50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 07:57:26 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B805C061767
        for <linux-media@vger.kernel.org>; Sat,  5 Jun 2021 04:55:25 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r1so9952414pgk.8
        for <linux-media@vger.kernel.org>; Sat, 05 Jun 2021 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OSm6bfHH1ocv8+S+rwU7DxDHYh+fh9kq1bRy/0vMyG4=;
        b=DJxCu2esV3AiFU5Ux9FdgvY4yjqjpDDx13OfYWRyUvQFG4hnf+x9cSEV+Cwo2y/C8o
         EZ8oa0r8LardYP1Y5NHav7sjyMorzykkvWMvI0vjbbapeC5VIZggDM3kDn65WpU0LzVX
         YFyfKhyNoGw++mslhlqr68BUt/vj6H9N3RCci7cLIcQrRDOrzwFR0hoBbiaoiFNwRKR0
         eRnaTNl+owT9g2sRJXy1ySGesMFfgXIuO2A7ph0i++sdfi4jjM+nCgk8z1Ubl+QQZeL5
         NOoGc+8cN6UDs6R6z3zMPjieNoK2p5sE0jpS1jK+WaUJ4DirbnfE+C0dFqUH4i0Or9er
         vKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSm6bfHH1ocv8+S+rwU7DxDHYh+fh9kq1bRy/0vMyG4=;
        b=QJD/ay7U7bp/njCZ8g65vghD8JlwdgXUa5fbd8R9f2cdHQ8xqitL4nulYcccAaPwLV
         Zd5MsDrE67rECkrnt/4NbnsiorCm8sIgSjKSawhRTawFZh4Vc2Wdn0LXpvn+tGkoDkKj
         /vNWOFBu99GA1YqX1mo6Te6025ZDRPThrb8znT6rRAwsJiZjyNXlRucazbxeRxPM/rK5
         SEecRkw5RlQA1gG27c+6kIDjBbh2IDUmguM1sy8TeWM9PN72yvIrHFg0sxpeOI+uIL8E
         f9FFyvZZ4OTBkhfG5jvLPbLt8vmSiNXXrESGLugcUYxFvA9gJ8iBrWtFcNzN7QbPvAed
         +QCA==
X-Gm-Message-State: AOAM53035HNQmoImVWp2DtbV5L3KalG2zg+CurGnQ1FOKzJuS4ISHpYa
        fxxJuov52aJrc49qUymcvn0DkyjzzaU=
X-Google-Smtp-Source: ABdhPJxBVV8Vs6dV/Kv/jb5E7t/OugKrB5h6JaRSzoe42B4D4PatmhqzkQa6fMVZHLTuqzCa2RT5bw==
X-Received: by 2002:a63:a48:: with SMTP id z8mr9418499pgk.371.1622894124762;
        Sat, 05 Jun 2021 04:55:24 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id p20sm3897126pff.204.2021.06.05.04.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 04:55:24 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH 1/2] media: video-i2c: frame delay based on last frame's end time
Date:   Sat,  5 Jun 2021 20:54:56 +0900
Message-Id: <20210605115456.14440-2-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605115456.14440-1-euphoriccatface@gmail.com>
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current implementation calculates frame delay based on the time of
start of the loop. This inevitably causes the loop delay to be
slightly longer than the actual measurement period, thus skipping a frame
every now and then.

However, MLX90640 should ideally be working without a frame skip.
Each measurement step updates half of the pixels in the frame
(every other pixel in default "chess mode", and every other row
in "interleave mode"), while additional coefficient data (25th & 26th row)
updates every step. The compensational coefficient data only corresponds
with the pixels updated in the same step.

In short, if a frame is skipped, then half of a frame loses correction
information and becomes garbage data.

Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 0465832a4..2ccb08335 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -445,14 +445,16 @@ static int video_i2c_thread_vid_cap(void *priv)
 	struct video_i2c_data *data = priv;
 	unsigned int delay = mult_frac(HZ, data->frame_interval.numerator,
 				       data->frame_interval.denominator);
+	unsigned long end_jiffies = jiffies;
 
 	set_freezable();
 
 	do {
-		unsigned long start_jiffies = jiffies;
 		struct video_i2c_buffer *vid_cap_buf = NULL;
 		int schedule_delay;
 
+		end_jiffies += delay;
+
 		try_to_freeze();
 
 		spin_lock(&data->slock);
@@ -477,10 +479,9 @@ static int video_i2c_thread_vid_cap(void *priv)
 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		}
 
-		schedule_delay = delay - (jiffies - start_jiffies);
-
-		if (time_after(jiffies, start_jiffies + delay))
-			schedule_delay = delay;
+		schedule_delay = end_jiffies - jiffies;
+		while (schedule_delay <= 0)
+			schedule_delay += delay;
 
 		schedule_timeout_interruptible(schedule_delay);
 	} while (!kthread_should_stop());
-- 
2.31.1

