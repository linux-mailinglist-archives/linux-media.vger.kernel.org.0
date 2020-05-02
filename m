Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAE11C2282
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 05:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgEBDWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 23:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgEBDWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 23:22:46 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B17C061A0C;
        Fri,  1 May 2020 20:22:44 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g26so5683015qtv.13;
        Fri, 01 May 2020 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9aiXFxkkHzWycdBKzVgypNSiFv5YUSEcCj5fU/dHuw=;
        b=JmE/5ZgiMPx9+UBCjBmgrwStyLpG/LE6GYrB4oYYDLTaD/Jz2PePLbEm7ECxNKqs1N
         0q8B4o8aH/+z4dAyLO+vzwtxoPsgk+8zwJCVDZM66ffREpzgI+kI7dSuqlJMONz+XsZd
         hO7RhWnWmcvSkDVG5w4KhLPFKIFsGrz0Vpf5gEg1eJjXuv5Agn8Nx1qj4JJ6cTnykENp
         N6BFgL4oM8ySj+C8/2w8m8QnEd6McSP3qlY25+YeKEZNrbT+Cpzpk7fnu1PnRgG46Qpe
         of9te20HNiuTlKNRwxX4aD9RccAKqCuU4S6E95pOnrkknlwd5Hg1Ifmc79lXO26O72BC
         MI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9aiXFxkkHzWycdBKzVgypNSiFv5YUSEcCj5fU/dHuw=;
        b=PihALswj6GxklcvTyZfF3D6W9aHDVplIZWf3M9AhGhzI4A+iTTBKrp39dpCFUmVJzx
         TPsbkh4Xxf1+CueeOCVBL0l/+Iu9aQ8/iFFcRAHNMPVzoyq+ykp3tTt4eOfbTZregYi2
         p2rsY5orRL5tE+2RtQBRDLchxG/WQnXmEBq6hMGO1iZg+e4CiMhAzB1RX4xkNA1Ikjmi
         A7F6eakjeuulnpUexP8kAspPjaaGUTUTTivrEfK9MelV8iYxE1m0qXb2yr/UU5u7VdNf
         +pmotsiIS1XM0r2hT4BGKV3v2MJql0C+g8eFq2e1BmgMxi5Alur+8BKw9uz6WeMZSvKZ
         Vo9w==
X-Gm-Message-State: AGi0PuZEu9jwZLiiIJMTrrrhScvaqc3oTb3oZ1Nl9XM4ytXGuIt/zMcB
        xAXg3oJaUubmpFEC+WDn0vY=
X-Google-Smtp-Source: APiQypIiceR1T8wkFb1LYT7VxbFeuyiaZkDwvF0YepOqRKrdB8mltj7qJA8UdOMUzUh6zDl2s7bqYw==
X-Received: by 2002:aed:3e27:: with SMTP id l36mr6945915qtf.192.1588389764042;
        Fri, 01 May 2020 20:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
        by smtp.gmail.com with ESMTPSA id c41sm4410399qta.96.2020.05.01.20.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 20:22:43 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v4 04/11] media: vidtv: move config structs into a separate header
Date:   Sat,  2 May 2020 00:22:09 -0300
Message-Id: <20200502032216.197977-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Move config structs to a common header so they can be used by the bridge
driver and by their respective drivers.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_config.h   | 35 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_demod.c    |  1 +
 .../media/test-drivers/vidtv/vidtv_demod.h    |  9 -----
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 12 ++-----
 4 files changed, 38 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_config.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_config.h b/drivers/media/test-drivers/vidtv/vidtv_config.h
new file mode 100644
index 0000000000000..7b95bf2444556
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_config.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_CONFIG_H
+#define VIDTV_CONFIG_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+struct vidtv_tuner_config {
+	struct dvb_frontend *fe;
+	u32 mock_power_up_delay_msec;
+	u32 mock_tune_delay_msec;
+	u32 vidtv_valid_dvb_t_freqs[8];
+	u32 vidtv_valid_dvb_c_freqs[8];
+	u32 vidtv_valid_dvb_s_freqs[8];
+	u8  max_frequency_shift_hz;
+};
+
+struct vidtv_demod_config {
+	struct dvb_frontend *frontend;
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_prob_on_low_snr;
+	/* probability of recovering when the signal improves */
+	u8 recover_tslock_prob_on_good_snr;
+	u8 chosen_delsys;
+};
+
+#endif //VIDTV_CONFIG_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index e5f157e4bbe48..15436e565a7b0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -19,6 +19,7 @@
 #include <linux/i2c.h>
 #include <media/dvb_frontend.h>
 #include "vidtv_demod.h"
+#include "vidtv_config.h"
 
 MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
 MODULE_AUTHOR("Daniel W. S. Almeida");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
index 49c2a43f71661..269855efb77f3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -21,15 +21,6 @@ struct vidtv_demod_cnr_to_qual_s {
 	u32 cnr_ok, cnr_good;
 };
 
-struct vidtv_demod_config {
-	struct dvb_frontend *frontend;
-	/* probability of losing the lock due to low snr */
-	u8 drop_tslock_prob_on_low_snr;
-	/* probability of recovering when the signal improves */
-	u8 recover_tslock_prob_on_good_snr;
-	u8 chosen_delsys;
-};
-
 struct vidtv_demod_state {
 	struct dvb_frontend frontend;
 	struct vidtv_demod_config config;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index a790508f935b3..ece4a94b0c3ac 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -17,20 +17,12 @@
 #include <linux/types.h>
 #include <media/dvb_frontend.h>
 
+#include "vidtv_config.h"
+
 MODULE_DESCRIPTION("Virtual DTV Tuner");
 MODULE_AUTHOR("Daniel W. S. Almeida");
 MODULE_LICENSE("GPL");
 
-struct vidtv_tuner_config {
-	struct dvb_frontend *fe;
-	u32 mock_power_up_delay_msec;
-	u32 mock_tune_delay_msec;
-	u32 vidtv_valid_dvb_t_freqs[8];
-	u32 vidtv_valid_dvb_c_freqs[8];
-	u32 vidtv_valid_dvb_s_freqs[8];
-	u8  max_frequency_shift_hz;
-};
-
 struct vidtv_tuner_cnr_to_qual_s {
 	/* attempt to use the same values as libdvbv5 */
 	u32 modulation;
-- 
2.26.2

