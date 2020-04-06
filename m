Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2F61A0198
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgDFXV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:21:29 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40915 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgDFXV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:21:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id y25so1315907qtv.7;
        Mon, 06 Apr 2020 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OaKLagKkBXSlUggDF7Q3Hul7FW0QuHIxEa1ITJQXhiM=;
        b=u6C+F8HxVrCGoXEr+POxhMSGbQuO5uamUz8SuihoKeW60L7JOw8gBldwwXhVS2xe5O
         xdYQK120VYk7HrHHvo1k7Ak5fLLASA5R+t+cRxYHJJ9IZvgKg5QZASj4xQUFOX1BG52Y
         aZ35nxwzdd5+Woc1qx0sfQN37AoT5upfIcjbPWqPmZiy4C4EeOw7xPAE1yKER13gbNdw
         UcFuZyKMaxeYL4qqKJo8B3JS4InbSykT83nm0JHDii/XIBtZN1encFXlg/0HR2condsf
         1F1Ogzut5RR2bKRa2XdJEjsBwVOMAwm7Hu8KNKW5hqCU4QxauGizsc10XdQbQcPI96g5
         mYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OaKLagKkBXSlUggDF7Q3Hul7FW0QuHIxEa1ITJQXhiM=;
        b=C6Y1+SMrDiGsajb/zKq0sur7gJrq0gpD2onFF9PWfaAI28Wiaj7NGDQwxwja/pwV52
         Lf0689IXz+q4uKVGmoA/yqONUiKTnFnUglMgfxYHuy2RW40rU0rp6oqGpd9+jZBeFL8s
         hARzww4iKrYxcNpshGCPKMeUB78PXumNekjfkNO1eG21Wcfw2BL5Utn/fj8hRVXdgKiK
         CeOW9zV0rr9VPJFUIl8pWaBrz5Jeb+MYRXIjFKLpsx1jjUVr/48Kyd7+tx/XiVEo1JLs
         vExZHwqfExZXs/vFeX8uF0J8CAJrJqCsZ5AiD5qeokfnNLq1cxFF+/+DmkB+3B3pVcmM
         hrWQ==
X-Gm-Message-State: AGi0Pua+N1nVyPJrwiahlODxX1d5fRTh2uGhqDpq1/KfQui1cq/Yc6Ba
        ya1ztQ2tspzDZBDrPnEQHxk=
X-Google-Smtp-Source: APiQypKIMzGPMnyM6M/gB4c56C+5YWQnNPvoaJcP4Nep+NhXWW08QMvd1RS7NBLpPunHLyKhw7KNIw==
X-Received: by 2002:ac8:224c:: with SMTP id p12mr2021756qtp.32.1586215286610;
        Mon, 06 Apr 2020 16:21:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:21:26 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v3 5/6] media: vidtv: move config structs into a common header
Date:   Mon,  6 Apr 2020 20:20:54 -0300
Message-Id: <20200406232055.1023946-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
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
 .../media/test_drivers/vidtv/vidtv_common.h   | 19 +++++++++++++++++++
 .../media/test_drivers/vidtv/vidtv_demod.h    |  9 ---------
 .../media/test_drivers/vidtv/vidtv_tuner.c    | 12 ++----------
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/media/test_drivers/vidtv/vidtv_common.h b/drivers/media/test_drivers/vidtv/vidtv_common.h
index 43269833ee866..e6b36429cc8de 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test_drivers/vidtv/vidtv_common.h
@@ -56,6 +56,25 @@ struct vidtv_mpeg_ts {
 	struct vidtv_mpeg_ts_adaption adaption[];
 } __packed;
 
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
 u32 vidtv_memcpy(void *to,
 		 const void *from,
 		 size_t len,
diff --git a/drivers/media/test_drivers/vidtv/vidtv_demod.h b/drivers/media/test_drivers/vidtv/vidtv_demod.h
index 49c2a43f71661..269855efb77f3 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test_drivers/vidtv/vidtv_demod.h
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
diff --git a/drivers/media/test_drivers/vidtv/vidtv_tuner.c b/drivers/media/test_drivers/vidtv/vidtv_tuner.c
index c948daa66ec73..8b1befc861e33 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test_drivers/vidtv/vidtv_tuner.c
@@ -17,20 +17,12 @@
 #include <linux/types.h>
 #include <media/dvb_frontend.h>
 
+#include "vidtv_common.h"
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
2.26.0

