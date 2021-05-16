Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFB0381E6C
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 13:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhEPLK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 07:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhEPLK2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 07:10:28 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D4EC061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 04:09:13 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id h7so1684597plt.1
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSm6bfHH1ocv8+S+rwU7DxDHYh+fh9kq1bRy/0vMyG4=;
        b=RWKnnuAkFJ/qZx1bhozPOYQ1R1zAhkmKcbMXXkzYYp8BslbZ6baIgzt1rqAgINhdNY
         Q4a1I0otd4C4ipMrPp7sSP3T7BulNb3o9cMGZPIgArld9Xn1pl0b13pfPMR/dhrIEQPL
         +R3SmkYw13+3LC+PQo4fe/Ot4h3vyaOz6E6ywS+UQgialoU9DayI4PcB8X8l9TOKbPbH
         qCROFwmqvLrhLBrD9Fs7llfLv3ra7pX9Rbgn/FT5hEywjdH1KBFJAUZPEDIO8YjxU4ls
         61W8ecIDhLgwkE8T8qcdVc+49UgkF8yPV0A5+hVtvzb9j4Ho+69CRRiP4KvRvJFpNm99
         KveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSm6bfHH1ocv8+S+rwU7DxDHYh+fh9kq1bRy/0vMyG4=;
        b=hS4Q7Szhf2isg4I2EKKlXbZVfAiR1WkwUpz7ISJhsCToim/624SHImS67mlCvBC1/1
         Iu+tW+LM5Vau8goI3D+rfILRdamhGJvJkjO72F2aJN1RHtgQoDFRwcyNaa+gny0OH5jm
         buILuSTJ5j/xOYzvG5+Q/AlMQJyzKU4v5WmR/zPGBIsTkY1KyvBp6RaTw3NvFdAbfGwj
         U7DpvNipcYtcPsTPPOG1D+0xsV5gVN9toQUqnP8mdyi3ymQllpjrOaS2TSmzZ6YxGEmw
         khzVRKcbcinwJJBgtsVesuiLkWP2qglPfz93eVaXCciwtQSauAvdeJJpLdXUls/8ffZn
         5lig==
X-Gm-Message-State: AOAM530frymsY8CYvNQwWrJcPaNFs4nIwe8UVYfHC5rfokzyn43/91PV
        PgF+HumRp3Zo48p6eCVX7gK2FTAVcyJ68Q==
X-Google-Smtp-Source: ABdhPJxNt0FFHfDTYWfPSwWzVdbdTMFPcBWPTb76Do6r36r8yUkCCZmk0DAl5dnUbyzzJ+ZoWJXtsQ==
X-Received: by 2002:a17:90a:2:: with SMTP id 2mr6033453pja.107.1621163352382;
        Sun, 16 May 2021 04:09:12 -0700 (PDT)
Received: from odkf.hopto.org.skbroadband ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id v22sm7488842pff.105.2021.05.16.04.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 04:09:11 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH 1/2] media: video-i2c: frame delay based on last frame's end time
Date:   Sun, 16 May 2021 20:09:01 +0900
Message-Id: <20210516110902.784-1-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
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

