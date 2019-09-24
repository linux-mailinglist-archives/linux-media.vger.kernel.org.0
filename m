Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3612BC9FC
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441266AbfIXORz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:17:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43286 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441264AbfIXORy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:17:54 -0400
Received: by mail-ot1-f65.google.com with SMTP id o44so1598513ota.10
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hs4E/SIG4sR+NCJmx4TudqSf3cBJ+6mIRa0Xwnt/fFM=;
        b=ddPADoWwo8am/XShbbLyVC5sXRoSyXmV9EZ/SWqoWTAQChSE/A2qDd7ZcbGJqL0KSf
         t4AEpi07U1S8Ywhn6Y6AjSw0JWUvl14Yu280RwtISgQfkuJF0hpZC7fnO5QsJllqi2J0
         fCLFuHamX7JBv/8YlPUe55tN/cSloulCIGTEUIVcU0eH3SxmN0fTxhvVpkouAOYt4xNy
         A2Sxqzs9x21s4QrulS3oFTLb02jzotN12Aw343wJogYnNgmus0y/IdcfC8jp19FPtg7e
         qlyupOV7CVEipoL9TeGVcZM/D5/977f+xPgyFYvPdKm1XWfFiwDeqZHvuuArlSr8mxG3
         go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hs4E/SIG4sR+NCJmx4TudqSf3cBJ+6mIRa0Xwnt/fFM=;
        b=R1mvn4abxGk2XbpH+NcehMPrHpuTS4Mp4BspGGwqEanzTd7v556hGIW1WNKTkOteVy
         w/8KGy65dWa1A3XUORd8VI2jkJB2GRgJMjlYkdXXdo1P8fk/atf2Ek+K+BF9+qoAZ/f+
         xumkFQdRJdFSJLDxmTXmqo9BNsB5AyziQy1QQMG4OqFxNx7xl9U6TTPg1Ngrk2Wovbnt
         Up+AKktBR8W4ZQMIaxxGWsWi8Nkx+A0x30eBeJ8h1CrEkrQAEDvbeqbX4Z9dOaJ9vb2G
         mO8Z52NWVn7MFfvJx31bD5BMSzNxGicg8FdTp2AeWD/spqbddamnGU/iGPSNPikTQ6+C
         y3rQ==
X-Gm-Message-State: APjAAAWP3l07v1g5qqLv9OvkHyei6ODpZqnbFZeDlFAelYFF25yxtNjh
        3bCjyD5XIg+h2hRRLYHz88aC1iwu
X-Google-Smtp-Source: APXvYqxvIYvpOdGn0gBo79fNjaWup8j/OajwswiuD7vcFz0shQdCd6finRqMx/GOS5E6iqoNnFhgiQ==
X-Received: by 2002:a9d:4e0b:: with SMTP id p11mr2208529otf.280.1569334674042;
        Tue, 24 Sep 2019 07:17:54 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id j11sm555543otk.80.2019.09.24.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 07:17:53 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 1/2] cec-follower: add tuner step increment/decrement
Date:   Tue, 24 Sep 2019 09:17:51 -0500
Message-Id: <20190924141752.5508-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924141752.5508-1-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tuner step increment/decrement will select the next highest or next
lowest service frequency.  There are a total of three possible
frequencies from analog_freqs_khz given a broadcast type and system.

Opcodes implemented:
  - <Tuner Step Increment>
  - <Tuner Step Decrement>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 49 ++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index acc3fd00..adb2f63c 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -135,6 +135,22 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	return false;
 }
 
+static int analog_find_freq_index(struct cec_op_tuner_device_info *info)
+{
+	if (info->analog.ana_freq == 0)
+		return -1;
+
+	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
+
+	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
+		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
+
+		if (ana_freq_khz == freq)
+			return i;
+	}
+	return -1;
+}
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
@@ -178,12 +194,39 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
-	case CEC_MSG_TUNER_STEP_DECREMENT:
-	case CEC_MSG_TUNER_STEP_INCREMENT:
-		if (!cec_has_tuner(1 << me))
+	case CEC_MSG_TUNER_STEP_DECREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
+
+		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+		int idx = analog_find_freq_index(info);
+
+		if (idx == -1 || idx == 0)
+			return;
+		if (info->is_analog) {
+			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][--idx];
+
+			info->analog.ana_freq = (freq * 10) / 625;
+		}
 		return;
+	}
+
+	case CEC_MSG_TUNER_STEP_INCREMENT: {
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
 
+		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+		int idx = analog_find_freq_index(info);
+
+		if (idx == -1 || idx == 2)
+			return;
+		if (info->is_analog) {
+			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][++idx];
+
+			info->analog.ana_freq = (freq * 10) / 625;
+		}
+		return;
+	}
 
 		/*
 		  One Touch Record
-- 
2.23.0

