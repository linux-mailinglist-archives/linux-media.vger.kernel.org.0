Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A8C1AE79D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 23:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgDQVdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 17:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727857AbgDQVdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 17:33:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C58C061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:33:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so1414900plk.10
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRVWYfn+agkgNXDTv/0Vqv183Su0DYR8FunhHcNZVGk=;
        b=ZV1/I2rw139SSWnQtVWmVKgKQGCdiJc7ryPM2WBqByGvg/jqFmnM/LAH7rR66okY0L
         xqI+KSgRPSLXCFXhABeK2l3MotDWYtKI9O9OfYqt74skimpXcKyjXhvRaFiGzNdp7k6F
         GBtcsKWYyLX0Q043Ml19sx/5NvVpmcHSOg4KO+vQ9NZ/1M3EqxkcjQfMUQwW4Op23CCX
         BKOdZT5MEKvBGp2KK9B8gwjJNkxEwHOorUEGzzBcvcWjpLlfHAUZ2LO0ce2HiZiXPhux
         nDYG7EkFpRB0K6Aht1t9xEmVwHkTkqhSIIm8PqFHjFk/jEEH/GbxB7XkUpS5v1ygnIot
         3yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRVWYfn+agkgNXDTv/0Vqv183Su0DYR8FunhHcNZVGk=;
        b=oCFz6jA++2zqjX8L+xvR3OTMEBa7id86oL6XofFFhgylVmApi6IphrI/ErXk7bYvQI
         32E8BUMcOHfApaSyiMaKefm5POLkyDuwImAm5iMnw1TLaiTWsSD3PQqDYVBUf2xpfdZF
         r8lDTbgYMNpec3Js4XHCM/Lp8prt93ihB3kKbXmpbR7P3apvl9nDy6R/amTlFZDl41xP
         uQmPGDwjJmz4/aI74ZY9vaYcSvxBeqO1tRHaNvZgV5zjyGBxFFcuMOko25Jk4VEaswM6
         goWXAYhTjwvhNnBzZE177kI4w1syHmNBJVrwsSZZlvZd/g05yTKNBA1p0QpBRLd6J7kF
         0/iQ==
X-Gm-Message-State: AGi0PubE+IbQvGnqPNYst1My+pb1+hMT+A9pupe18g2TsiGnd1+5nEiZ
        8mjKVD4lb3jZKWw/sU0PeAde7hpZr0k=
X-Google-Smtp-Source: APiQypIh1KgMHp4HCfNOtLrV824vHOu1sU2TvSI8CEHJw6XiMvT8kIkr2ImKiTnrm1GpXqiDlS3RnQ==
X-Received: by 2002:a17:90b:956:: with SMTP id dw22mr6635378pjb.152.1587159214326;
        Fri, 17 Apr 2020 14:33:34 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id c144sm8886627pfb.172.2020.04.17.14.33.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:33:33 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: fix math problems
Date:   Fri, 17 Apr 2020 14:33:32 -0700
Message-Id: <20200417213332.7645-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with bugprone-incorrect-roundings
Found with performance-type-promotion-in-math-fn

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/dvb-fe.c             | 2 +-
 utils/rds-ctl/rds-ctl.cpp         | 5 +++--
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/libdvbv5/dvb-fe.c b/lib/libdvbv5/dvb-fe.c
index 4ff64d58..46fadaf0 100644
--- a/lib/libdvbv5/dvb-fe.c
+++ b/lib/libdvbv5/dvb-fe.c
@@ -1638,7 +1638,7 @@ static int __dvb_fe_snprintf_eng(char *buf, int len, float val, int metric)
 	 * Converts the number into an expoent and a
 	 * value between 0 and 1000, exclusive
 	 */
-	exp = (int)log10(val);
+	exp = (int)log10f(val);
 	if (exp > 0)
 		exp = (exp / 3) * 3;
 	else
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index e0db5f39..58dc98a4 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -28,6 +28,7 @@
 #include <libv4l2rds.h>
 
 #include <cctype>
+#include <cmath>
 #include <ctime>
 #include <list>
 #include <vector>
@@ -915,8 +916,8 @@ static void get_options(const int fd, const int capabilities, struct v4l2_freque
 			else
 				printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
 					 vt.rangelow / 16.0, vt.rangehigh / 16.0);
-			printf("\tSignal strength/AFC  : %d%%/%d\n",
-				static_cast<int>((vt.signal / 655.35)+0.5), vt.afc);
+			printf("\tSignal strength/AFC  : %ld%%/%d\n",
+				std::lround(vt.signal / 655.25), vt.afc);
 			printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
 			printf("\tAvailable subchannels: %s\n",
 					rxsubchans2s(vt.rxsubchans).c_str());
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 87c7790d..f6e268e3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -422,7 +422,7 @@ void tuner_get(cv4l_fd &_fd)
 				     vt.rangelow / 16.0, vt.rangehigh / 16.0);
 
 			if (vt.type != V4L2_TUNER_SDR && vt.type != V4L2_TUNER_RF) {
-				printf("\tSignal strength/AFC  : %d%%/%d\n", static_cast<int>((vt.signal / 655.35)+0.5), vt.afc);
+				printf("\tSignal strength/AFC  : %ld%%/%d\n", lround(vt.signal / 655.35), vt.afc);
 				printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
 				printf("\tAvailable subchannels: %s\n", rxsubchans2s(vt.rxsubchans).c_str());
 			}
-- 
2.25.2

