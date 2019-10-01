Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96241C2C48
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 05:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732441AbfJADS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 23:18:27 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46273 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbfJADS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 23:18:27 -0400
Received: by mail-io1-f65.google.com with SMTP id c6so43936359ioo.13
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 20:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izQY0iTNoAgWhrXggW3STsAnFz8dUuiCptGl7M6e3tI=;
        b=Ad7fvz9o1dTvCRdjo6WDXeHJlyNCWMCt7AgS8rgw9kKlZpp5RVgu7ETZ23+AY3nrIT
         VQbA6BPR7KEvbKNB3iIoRPNi1eL2szX9JuVXTrZGWwxoduu88aA+S0JleURkV7hJwcC0
         8vbsdHgyIeK2+lqOsdJqhXsQj2mIvlKkDnN2Td0HMezUEuOEU38pU5a8B5jzhRP22fyy
         /Ki8+Dh1hIf6ZDl/DhGcXUzkhC3m8BppomtbEU7lsVsUCyPLAOfYyZfW3cK1x0vqhRTF
         PhdE5XfvdorZ/7cNhIVM7d93xsDg/VnWWdoYkiAMvYAi9vGr+C7zfVjae5LgFoWN+jEX
         7t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izQY0iTNoAgWhrXggW3STsAnFz8dUuiCptGl7M6e3tI=;
        b=hPWWp5Cm6JmC9KSMWNva8vZVD24J5gwI3vc45habQMvr3AmmB7RSZ4d8upfZWwec1Y
         ZGawcY+vdB7nK8gnpz+30XNZn10kQ9hkzjCQ6XR6rN/qmI6BUMQCpFL4qF2Qp8o+Inc8
         PnLiSsWE+ii8ov+jx+lo3pozMazbHzgmMPNxKA0rG1IVpFTAdkEmxIr3hkV8rr1o/21w
         FIam5XLTr3ZVAPx6nC9ftoO11JQulHLWoRzs10ooydElt29JrWcSoWFB3iEexg9rw0/A
         sovzgseMASpwV6NeSsW+0QqdQl+9p4BeOSJBbXBYWym1JedaIrREKiCJ3ujtDsU0kc/k
         PUJg==
X-Gm-Message-State: APjAAAVBMvyvfZ20Hrv2WmsVdtA6bPUPwPt/93SfSs4n5a8BZFB6UE8Y
        vuc6jk4hLrL/83VTMDhZwTDpjpEV
X-Google-Smtp-Source: APXvYqxG5N/kUIxrTguIFncAoqVOpzRSrJfudkIF9ieGYmDjmxC2fAJklWKSk2q/jbAw2zl+PVjILQ==
X-Received: by 2002:a6b:2c8d:: with SMTP id s135mr1943398ios.98.1569899905863;
        Mon, 30 Sep 2019 20:18:25 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l82sm8719452ilh.23.2019.09.30.20.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:18:25 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v4 1/3] cec-follower: fix bugs for tuner emulation
Date:   Mon, 30 Sep 2019 22:18:21 -0500
Message-Id: <20191001031823.312020-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043017.474025-1-c0d1n61at3@gmail.com>
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix bugs for tuner emulation:
  - analog_tuner_init() needs to store ana_freq as multiples of 62.5 kHz
  - analog_set_tuner_dev_info() needs to check the broadcast type and
    broadcast system are valid before getting the nearest frequency

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index acc3fd00..d74981b2 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -92,13 +92,15 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 
 void analog_tuner_init(struct cec_op_tuner_device_info *info)
 {
+	unsigned int freq_khz;
+
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
 	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
 	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
-	info->analog.ana_freq =
-		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
+	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
+	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
 static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
@@ -123,7 +125,7 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	__u8 system;
 
 	cec_ops_select_analogue_service(msg, &type, &freq, &system);
-	if (info->analog.ana_bcast_type < 3 && info->analog.bcast_system < 9) {
+	if (type < 3 && system < 9) {
 		int freq_khz = (freq * 625) / 10;
 		unsigned int nearest = analog_get_nearest_freq(type, system,
 							       freq_khz);
-- 
2.23.0

