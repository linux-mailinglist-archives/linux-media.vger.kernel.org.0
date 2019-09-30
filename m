Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6BDC1AB9
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 06:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfI3EaY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 00:30:24 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43659 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfI3EaX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 00:30:23 -0400
Received: by mail-ot1-f68.google.com with SMTP id o44so7137275ota.10
        for <linux-media@vger.kernel.org>; Sun, 29 Sep 2019 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ahsa6j6dBoXvj9i/t0RutlNEJUCMc7anuihqmO6fhEo=;
        b=NMtLtiIxAsZhFl8E4Vne/pRWwQVY+LvT/mYmS/cmsy/m8lLJiraZJ8DXTJd3OGIBKl
         OI/390k+qG0O6JccuKHy+XVyj7RFIL+pq0Z4DaRwzVo8dAE+58mbo/JjQ926HBZngupK
         23ppwyGtsEziIIumR8ekMTyyJ0mdeSeANTT38XtSHzS2wMem3H0W92i9e21HmFDeIVIC
         JoPagIAz9lzdDksqlK7QO0M1U4L6XTDzAM9TWEYmfHlCJvMD8upXxfnYDapf67u1zoXt
         REE2lYZmnete5YilnFDNmDA+jtwGVs+Wzrut2qsEAd8u04sfMfbhbmD6oO1skvW85gfr
         bAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ahsa6j6dBoXvj9i/t0RutlNEJUCMc7anuihqmO6fhEo=;
        b=T225816TRsPYSifGrcEfcQudTcK5ldobBGWRdQBqXVjh4uLADLkl1CsdgDD3FZ/bij
         90/eYFv+RkQZseIDwEHBBwFbavLx9dH7rSxx7NSS67ejvN9RQkWxT4t0WqWVIowlQ228
         kk+fsL+ESMrJWya2/ZW9eUvKPLu99M6Yox86jbWyQRq1l1Yp9s4HDJ3/QKjpwAmv0iLw
         hNekzSP7v2PmzjffsPNs6qR9V9Iyc5KyWCYx8dLy+MJ4nSpMWlI7cf0nxvQaaf/dmSFX
         dfXlf2UZefP2hzv4NzsdSAaEPvqO/RuwhoagMONo6CXMiwNQR6qphVNXXMni13s2GSZj
         wM3Q==
X-Gm-Message-State: APjAAAWGZpRAPPXwRMeDUsf4/TRExXEK1I/GCXG8ViKw8+5fcqeiY/LY
        kdENpTuoj8lubmJABjPVXmIQwImS
X-Google-Smtp-Source: APXvYqwhn7yxXYA+Q9TKqrGOWsGv8iTeEPFNKt3EAhcIhp8qGuDd0/FRYKI1F7ThhNFbmScv1S+CCg==
X-Received: by 2002:a9d:3be3:: with SMTP id k90mr12881023otc.180.1569817821384;
        Sun, 29 Sep 2019 21:30:21 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id w20sm3509017otq.72.2019.09.29.21.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2019 21:30:20 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3 1/3] cec-follower: fix bugs for tuner emulation
Date:   Sun, 29 Sep 2019 23:30:15 -0500
Message-Id: <20190930043017.474025-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix some typos for tuner emulation:
  - analog_tuner_init() store ana_freq in hex
  - analog_get_nearest_freq() temp variable check

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index acc3fd00..2f6e3425 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -92,13 +92,15 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
 
 void analog_tuner_init(struct cec_op_tuner_device_info *info)
 {
+	unsigned int freq_khz =
+		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
+
 	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
 	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
 	info->is_analog = true;
 	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
 	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
-	info->analog.ana_freq =
-		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
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

