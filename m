Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4967536662B
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235546AbhDUHVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbhDUHVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:12 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C637C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:40 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e9so4143358plj.2
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c/2RibfG4nS5rPwvMYLatU1oFvhbBRYrWgP4lB+fXPU=;
        b=oS6uWu1f0eqSrNfzlqzfDd2MZ0152E3nXkoebJUU0sp/a2AcW5vwfmNbTmYVQAwKMF
         c2h3Z1tbNoIyTEooYNQQjvcOcwCfANhzdG4YfOYTfLzmfN7rVLiNAjWow/AaBvH+oKAt
         FgRCnzbfYwqaoNxD8OKh76f1flB3qiRN7HdrlQeSQm9diGeejbhtHhZzO6Jb60UDlvAO
         Su78ORH8TetcpY6hXn9RWRFs4z6Y/XDjNIgm3XuAc/v5wM94FAGuWCSesLVfONFV5I1F
         Z8LS4Yuohw0/9rHmyKQSTs/BWizVWOXzrWJKm+/KQxDIdPYu3Lud0b9+669O5CqbAmF8
         ZqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c/2RibfG4nS5rPwvMYLatU1oFvhbBRYrWgP4lB+fXPU=;
        b=cU8ITNSbmNWCxQIuKjC2JxhCOlgmhCCg+OWumUXY4ZEySYee5OuHDdIRAijAb2pdUb
         TTKhqdYgbyBMAvDBUAXI3vK6uSO8KLWamwYsD3HOTMq6AxzXHx1jMK2fFAWFyng3IFMG
         ulUyFxGtpzcJWCjvCeN9tw7UOnvQ7hpcdjmL50L5IyNts4QNc7RzVR2V1C6HXvNJYTAY
         BrEsID3gvtZ/AHYxDBczjr/sbReiJH2idBcXZWRlYYBRGpCx/7EqX+f+V3hswD4lSBWp
         wSXFMCJrfTpSM52cH/VCvCZcxLPFkLKUhQSsmq9MNXR56DGDX5t1x5rq65eqZLFp8NEK
         RGHw==
X-Gm-Message-State: AOAM533hZ1iT/92tL9/+zLR5K+2mAegDnVHPncUd64Qxod/z9NrOEsUx
        zY+K2LR9EScOIKvjWFyeuP85sCmUNb8/KA==
X-Google-Smtp-Source: ABdhPJy+xxkFxrZGJb+FJWMJzZ50w5u5oeUWjVExbdvgLeMAZAkusIXiVPiLfj0gFwulmwW4KQR99A==
X-Received: by 2002:a17:902:4c:b029:ec:a39a:41ad with SMTP id 70-20020a170902004cb02900eca39a41admr15147981pla.52.1618989639641;
        Wed, 21 Apr 2021 00:20:39 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:39 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/8] cec-tuner: std::array conversions
Date:   Wed, 21 Apr 2021 00:20:31 -0700
Message-Id: <20210421072035.4188497-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allows getting rid of sizeof macros.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 140 +++++++++++++++----------------
 1 file changed, 70 insertions(+), 70 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index ac5c49950..b9c21684b 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -3,6 +3,7 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <array>
 #include <ctime>
 #include <string>
 
@@ -13,10 +14,8 @@
 
 #define NUM_ANALOG_FREQS 3
 #define NUM_DIGITAL_CHANS 3
-#define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
-#define TOT_DIGITAL_CHANS ((sizeof(digital_arib_data) / sizeof(digital_arib_data[0][0])) + \
-			   (sizeof(digital_atsc_data) / sizeof(digital_atsc_data[0][0])) + \
-			   (sizeof(digital_dvb_data) / sizeof(digital_dvb_data[0][0])))
+#define TOT_ANALOG_FREQS analog_freqs_khz[0][0].size()
+#define TOT_DIGITAL_CHANS digital_arib_data[0].size() + digital_atsc_data[0].size() + digital_dvb_data[0].size()
 
 struct service_info {
 	unsigned tsid;
@@ -45,22 +44,22 @@ struct service_info {
  *
  * https://sichbopvr.com/frequency-tables/Brazil/Rio%20de%20Janeiro/Rio%20De%20Janeiro
  */
-static const struct service_info digital_arib_data[2][NUM_DIGITAL_CHANS] =
-{
+using arib = std::array<service_info, NUM_DIGITAL_CHANS>;
+static constexpr std::array<arib, 2> digital_arib_data{
 	// satellite, arib-bs
-	{
+	arib{
 		// tsid, onid, sid, fmt, major, minor
-		{ 1032, 1, 30203, 1, 0, 30203 },
-		{ 1046, 1, 30505, 1, 0, 30505 },
-		{ 1060, 1, 30609, 1, 0, 30609 }
+		service_info{ 1032, 1, 30203, 1, 0, 30203 },
+		service_info{ 1046, 1, 30505, 1, 0, 30505 },
+		service_info{ 1060, 1, 30609, 1, 0, 30609 },
 	},
 	// terrestrial, arib-t
-	{
+	arib{
 		// tsid, onid, sid, fmt, major, minor
-		{ 1519, 1519, 48608, 1, 0, 48608 },
-		{ 1624, 1624, 51992, 1, 0, 51992 },
-		{ 1905, 1905, 60960, 1, 0, 60960 }
-	}
+		service_info{ 1519, 1519, 48608, 1, 0, 48608 },
+		service_info{ 1624, 1624, 51992, 1, 0, 51992 },
+		service_info{ 1905, 1905, 60960, 1, 0, 60960 },
+	},
 };
 
 /*
@@ -84,22 +83,22 @@ static const struct service_info digital_arib_data[2][NUM_DIGITAL_CHANS] =
  * ATSC does not use ONIDs and SID will be used as the program number.  All ATSC
  * channel number formats are 2 part.
  */
-static const struct service_info digital_atsc_data[2][NUM_DIGITAL_CHANS] =
-{
+using atsc = std::array<service_info, NUM_DIGITAL_CHANS>;
+static constexpr std::array<atsc, 2> digital_atsc_data{
 	// satellite, atsc-sat
-	{
+	atsc{
 		// tsid, onid, sid, fmt, major, minor
-		{ 2065, 0, 50316, 2, 3, 50316 },
-		{ 2090, 0, 50882, 2, 3, 50882 },
-		{ 2122, 0, 55295, 2, 3, 55295 }
+		service_info{ 2065, 0, 50316, 2, 3, 50316 },
+		service_info{ 2090, 0, 50882, 2, 3, 50882 },
+		service_info{ 2122, 0, 55295, 2, 3, 55295 },
 	},
 	// terrestrial, atsc-t
-	{
+	atsc{
 		// tsid, onid, sid, fmt, major, minor
-		{ 1675, 0, 1, 2, 4, 1 },
-		{ 1675, 0, 2, 2, 4, 2 },
-		{ 1675, 0, 3, 2, 4, 3 }
-	}
+		service_info{ 1675, 0, 1, 2, 4, 1 },
+		service_info{ 1675, 0, 2, 2, 4, 2 },
+		service_info{ 1675, 0, 3, 2, 4, 3 },
+	},
 };
 
 /*
@@ -119,22 +118,22 @@ static const struct service_info digital_atsc_data[2][NUM_DIGITAL_CHANS] =
  * https://sichbopvr.com/frequency-tables/Sweden/Skane%20Lan/Malm%c3%b6
  *
  */
-static const struct service_info digital_dvb_data[2][NUM_DIGITAL_CHANS] =
-{
+using dvb = std::array<service_info, NUM_DIGITAL_CHANS>;
+static constexpr std::array<dvb, 2> digital_dvb_data{
 	// satellite, dvb-s2
-	{
+	dvb{
 		// tsid, onid, sid, fmt, major, minor
-		{ 61, 70, 7193, 1, 0, 24 },
-		{ 65, 70, 7040, 1, 0, 72 },
-		{ 28, 70, 7012, 1, 0, 101 }
+		service_info{ 61, 70, 7193, 1, 0, 24 },
+		service_info{ 65, 70, 7040, 1, 0, 72 },
+		service_info{ 28, 70, 7012, 1, 0, 101 },
 	},
 	// terrestrial, dvb-t
-	{
+	dvb{
 		// tsid, onid, sid, fmt, major, minor
-		{ 1002, 8400, 2025, 1, 0, 21 },
-		{ 1004, 8400, 84, 1, 0, 31 },
-		{ 1004, 8945, 1040, 1, 0, 1040 }
-	}
+		service_info{ 1002, 8400, 2025, 1, 0, 21 },
+		service_info{ 1004, 8400, 84, 1, 0, 31 },
+		service_info{ 1004, 8945, 1040, 1, 0, 1040 },
+	},
 };
 
 /*
@@ -150,71 +149,72 @@ static const struct service_info digital_dvb_data[2][NUM_DIGITAL_CHANS] =
  *
  * https://en.wikipedia.org/wiki/Television_channel_frequencies
  */
-static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
-{
+using khz = std::array<unsigned int, NUM_ANALOG_FREQS>;
+using freqs = std::array<khz, 9>;
+static constexpr std::array<freqs, 3> analog_freqs_khz{
 	// cable
-	{
+	freqs{
 		// pal-bg
-		{ 471250, 479250, 487250 },
+		khz{ 471250, 479250, 487250 },
 		// secam-lq
-		{ 615250, 623250, 631250 },
+		khz{ 615250, 623250, 631250 },
 		// pal-m
-		{ 501250, 507250, 513250 },
+		khz{ 501250, 507250, 513250 },
 		// ntsc-m
-		{ 519250, 525250, 531250 },
+		khz{ 519250, 525250, 531250 },
 		// pal-i
-		{ 45750, 53750, 61750 },
+		khz{ 45750, 53750, 61750 },
 		// secam-dk
-		{ 759250, 767250, 775250 },
+		khz{ 759250, 767250, 775250 },
 		// secam-bg
-		{ 495250, 503250, 511250 },
+		khz{ 495250, 503250, 511250 },
 		// secam-l
-		{ 639250, 647250, 655250 },
+		khz{ 639250, 647250, 655250 },
 		// pal-dk
-		{ 783250, 791250, 799250 }
+		khz{ 783250, 791250, 799250 },
 	},
 	// satellite
-	{
+	freqs{
 		// pal-bg
-		{ 519250, 527250, 535250 },
+		khz{ 519250, 527250, 535250 },
 		// secam-lq
-		{ 663250, 671250, 679250 },
+		khz{ 663250, 671250, 679250 },
 		// pal-m
-		{ 537250, 543250, 549250 },
+		khz{ 537250, 543250, 549250 },
 		// ntsc-m
-		{ 555250, 561250, 567250 },
+		khz{ 555250, 561250, 567250 },
 		// pal-i
-		{ 175250, 183250, 191250 },
+		khz{ 175250, 183250, 191250 },
 		// secam-dk
-		{ 807250, 815250, 823250 },
+		khz{ 807250, 815250, 823250 },
 		// secam-bg
-		{ 543250, 551250, 559250 },
+		khz{ 543250, 551250, 559250 },
 		// secam-l
-		{ 687250, 695250, 703250 },
+		khz{ 687250, 695250, 703250 },
 		// pal-dk
-		{ 831250, 839250, 847250 }
+		khz{ 831250, 839250, 847250 },
 	},
 	// terrestrial
-	{
+	freqs{
 		// pal-bg
-		{ 567250, 575250, 583250 },
+		khz{ 567250, 575250, 583250 },
 		// secam-lq
-		{ 711250, 719250, 727250 },
+		khz{ 711250, 719250, 727250 },
 		// pal-m
-		{ 573250, 579250, 585250 },
+		khz{ 573250, 579250, 585250 },
 		// ntsc-m
-		{ 591250, 597250, 603250 },
+		khz{ 591250, 597250, 603250 },
 		// pal-i
-		{ 199250, 207250, 215250 },
+		khz{ 199250, 207250, 215250 },
 		// secam-dk
-		{ 145250, 153250, 161250 },
+		khz{ 145250, 153250, 161250 },
 		// secam-bg
-		{ 591250, 599250, 607250 },
+		khz{ 591250, 599250, 607250 },
 		// secam-l
-		{ 735250, 743250, 751250 },
+		khz{ 735250, 743250, 751250 },
 		// pal-dk
-		{ 169250, 177250, 185250 }
-	}
+		khz{ 169250, 177250, 185250 },
+	},
 };
 
 void tuner_dev_info_init(struct state *state)
-- 
2.30.2

