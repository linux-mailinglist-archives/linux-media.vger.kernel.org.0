Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFDB39FA99
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 17:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhFHP2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 11:28:20 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:54836 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhFHP2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 11:28:11 -0400
Received: by mail-pj1-f42.google.com with SMTP id g24so12119773pji.4
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y67AglBKHaankHKgtfxy4RSwV9tG9pH2Koc8u0qf15g=;
        b=Xb6BCTxCAR9+DSv3PxHqT4RL8esJXW7vq0xQw3qXKxPzFrbrtdNl7v2HreeklUGSDk
         nxdIkk/TN5QYzJmSCVcBeWoKI5zJAQX19koMpyPi4GOrXxaulgUwKtm0gElpUMTGrw7A
         VVG/LwC6bKJMaVArT/6YhOf8FuENWHU1yhHRIG8uP5utnFuVPWw79dIIsTwW/bkxPAQy
         GL14uUkFWsfao1yM9G7AMyFCfwQoqOcBBiBdIw+eMm1YoTur6XhskR6qql2gtkMej0op
         nbZq65TyQB+3+auv7bcMbsq5DAO+J/AsdgmNxL0je47i9lt2pYHbvyEFRCPLKnhKTYwL
         nI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y67AglBKHaankHKgtfxy4RSwV9tG9pH2Koc8u0qf15g=;
        b=PWOvZP8W4IlNZzdkSuRhr4kLswyroW3b8CAdrwMwBvp3j6u91YYlcgamozUMUnAQwS
         vnB2qC36POJKRxiwvGJcECQXuuyYu09BnnhcIPozXJ6iErUkYWjRDTI2FeYKOhKtkoRj
         ydkruD6B+e6IVkkatZ2+v3M5iEqzJe3RLmYSotGYU+uGonaU4OQIGLwTHbKvxk7RyBtw
         ZD/lx9NWjcT4biwxlm3+rjdsjLXSujKnIfN+R/S2/qGRzpA5CKp4j46zqLYQYvbJk4O8
         R/4Yw7C2TcdBjeqyOrh++v/dkWMxNwPWhyhjCnOURJa6+3TFMNjMXecYYvQXxFuDqZHK
         ERIw==
X-Gm-Message-State: AOAM530p1LbfFAYJA9N23GsYc5u1Kcve5pBiC3QMHPUdgZtQmO0Y3dF3
        fg+cUJru6g3RKpJZWGRaJBD/LAbK75Y=
X-Google-Smtp-Source: ABdhPJzGAykH1a/M8w/+GaTdT6nXT6X2DDDpznkmFPu0uX6G29JMGQyYArHx39ycE1arJtZz1MU0/g==
X-Received: by 2002:a17:90b:955:: with SMTP id dw21mr2127171pjb.28.1623165917814;
        Tue, 08 Jun 2021 08:25:17 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id nn6sm14726668pjb.57.2021.06.08.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:25:17 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH v3 1/2] media: video-i2c: more precise intervals between frames
Date:   Wed,  9 Jun 2021 00:24:50 +0900
Message-Id: <20210608152451.14730-2-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608152451.14730-1-euphoriccatface@gmail.com>
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MLX90640 should ideally be working without a frame skip.
In short, if a frame is skipped, then half of a frame loses correction
information, having no way to retrieve its original compensation.

This patch improves the timing in three ways:

1) Replaced schedule_timeout_interruptible() to usleep_range()
The former "only ensures that it will sleep for at least
schedule_delay (if not interrupted)", as pointed out by mchehab.
As a result, the frame rate could lag behind than the actual capability
of the hardware
(Raspberry Pi would show a few Hz slower than set value)

2) Calculation based on us, not jiffies
Jiffies usually has resolution of 100Hz, and possibly even cruder.
MLX90640 can go up to 64Hz frame rate, which does not make sense to
calculate the interval with aforementioned resolution.

3) Interval calculation based on the last frame's end time
Using the start time of the current frame will probably make tiny bit
of drift every time. This made more sense when I didn't realize 1),
but it still makes sense without adding virtually any complexity,
so this stays in.

Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 0465832a4..64ba96329 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -443,14 +443,15 @@ static void buffer_queue(struct vb2_buffer *vb)
 static int video_i2c_thread_vid_cap(void *priv)
 {
 	struct video_i2c_data *data = priv;
-	unsigned int delay = mult_frac(HZ, data->frame_interval.numerator,
-				       data->frame_interval.denominator);
+	u32 delay = mult_frac(1000000UL, data->frame_interval.numerator,
+			       data->frame_interval.denominator);
+	s64 end_us = ktime_to_us(ktime_get());
 
 	set_freezable();
 
 	do {
-		unsigned long start_jiffies = jiffies;
 		struct video_i2c_buffer *vid_cap_buf = NULL;
+		s64 current_us;
 		int schedule_delay;
 
 		try_to_freeze();
@@ -477,12 +478,14 @@ static int video_i2c_thread_vid_cap(void *priv)
 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		}
 
-		schedule_delay = delay - (jiffies - start_jiffies);
-
-		if (time_after(jiffies, start_jiffies + delay))
-			schedule_delay = delay;
-
-		schedule_timeout_interruptible(schedule_delay);
+		end_us += delay;
+		current_us = ktime_to_us(ktime_get());
+		if (current_us < end_us) {
+			schedule_delay = end_us - current_us;
+			usleep_range(schedule_delay * 3/4, schedule_delay);
+		} else {
+			end_us = current_us;
+		}
 	} while (!kthread_should_stop());
 
 	return 0;
-- 
2.31.1

