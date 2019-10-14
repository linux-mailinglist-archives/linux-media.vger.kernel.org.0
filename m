Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24AC3D5A29
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfJNERa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:30 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43563 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfJNER3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:29 -0400
Received: by mail-oi1-f193.google.com with SMTP id t84so12654833oih.10
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X0ckv9MyFSRrRa+kve9VmKUuD31KAbsV3QWsugo4Enc=;
        b=VYSnK6Lmfc86z5nnsHhJZxT4ILgpGJspF89MYrnuztseIlZvtgB36/VbToQVk+EDso
         G3XEiqzI3Ra2kobmYwpex9pf0mJRcm0HSdU2jJgojKQ7UFISRGTUaOWA5BbSa7cpOc8b
         QF30aw/CqfZnL9gy/KNt/eNrK9+k54UH4gTKV3Dn1Ol4cYCWc6tjlBObmLxOCEZf35md
         d7oj0ezAwKpkqd9UADip9leq62CsjZRKa/tTK0yx1Wr97u+yRT/t5Ah0ilBV4kdWgfq5
         tHPI+s9afJJuhKBITmB5jHcPmcr8UFAxSkbw5+EhPSQr95+JwvPlmKMegVlC0CrwSf0/
         GNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X0ckv9MyFSRrRa+kve9VmKUuD31KAbsV3QWsugo4Enc=;
        b=t2WreTBWrYzvZG57tr5mdrhHID2wTxbm4eJ2JY+3w0a4GiDdXj2bNaMEgAO+0n3q6c
         a6YFltFdX7HQ90FWR2GygfGwLnk/p9Bk0/j+Yz6L8Oo31ytwLOA0RvI9KH9qgNBGfIml
         9JOfVoLF/3/uaQ3zm8fBdolk6U8Gs4wkw+FMdAZtjktuaN1Fgccsju1cUknF58DisOYG
         VbLxTkO29OnU3un/4k5BYa+suVlN0UOQcKChZlr02lJ+70lcfF/8uR2nU+kBzkfth0Cr
         WoFuyv5aSjscDCLEeW5jcDNNxhG6rzh+gDtCow5k2ZxlwPXi2O34RCFG7AbM6AstMF6J
         /VLw==
X-Gm-Message-State: APjAAAW/vOnIJIpqIh5n+lImyR+qgznhfaoPcNtGWjMykP3pBjuxlnwz
        5oAymLy0HRo0Mv8SCgmyChS8g0RZ
X-Google-Smtp-Source: APXvYqwWf54l7uDj6YS/IqpqG+PqfLC55TDF7FnThv9qsYOXDE7hF5yWM/bVBbdeT/pKK9yR76kgRA==
X-Received: by 2002:aca:b445:: with SMTP id d66mr21753118oif.111.1571026648744;
        Sun, 13 Oct 2019 21:17:28 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:28 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 8/8] cec-compliance: add digital tuner control testing
Date:   Sun, 13 Oct 2019 23:17:21 -0500
Message-Id: <20191014041721.52025-9-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tuner_ctl_test() will now test both digital and analog services.  There
are a total of 98 channels, 18 digital and 81 analog with digital
proceeding analog.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 50 +++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 1fd0ea92..bc89c317 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -769,8 +769,11 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
 			iter != info_vec.end(); iter++) {
 		cec_msg_init(&msg, me, la);
-		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
-			iter->analog.ana_freq, iter->analog.bcast_system);
+		if (iter->is_analog)
+			cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
+				iter->analog.ana_freq, iter->analog.bcast_system);
+		else
+			cec_msg_select_digital_service(&msg, &iter->digital);
 		fail_on_test(!transmit_timeout(node, &msg));
 		fail_on_test(cec_msg_status_is_abort(&msg));
 		cec_msg_init(&msg, me, la);
@@ -784,6 +787,39 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 			double freq_mhz = (iter->analog.ana_freq * 625) / 10000.0;
 
 			info("Analog channel freq: %.2f MHz\n", freq_mhz);
+		} else {
+			__u8 system = iter->digital.dig_bcast_system;
+
+			switch (system) {
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T: {
+				__u16 tsid = iter->digital.arib.transport_id;
+				__u16 sid = iter->digital.arib.service_id;
+				__u16 onid = iter->digital.arib.orig_network_id;
+
+				info("ARIB digital channel TSID: %u, SID: %u, ONID: %u", tsid, sid, onid);
+				break;
+			}
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T: {
+				__u16 tsid = iter->digital.atsc.transport_id;
+				__u16 pn = iter->digital.atsc.program_number;
+
+				info("ATSC digital channel TSID: %u, Program Number: %u", tsid, pn);
+				break;
+			}
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
+			case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T: {
+				__u16 tsid = iter->digital.dvb.transport_id;
+				__u16 sid = iter->digital.dvb.service_id;
+				__u16 onid = iter->digital.dvb.orig_network_id;
+
+				info("DVB digital channel TSID: %u, SID: %u, ONID: %u", tsid, sid, onid);
+				break;
+			}
+			default:
+				break;
+			}
 		}
 	}
 
@@ -792,6 +828,16 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	fail_on_test(!transmit_timeout(node, &msg));
 	fail_on_test(!cec_msg_status_is_abort(&msg));
 	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
+	cec_msg_init(&msg, me, la);
+	info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
+	info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2;
+	info.digital.dvb.transport_id = 0;
+	info.digital.dvb.service_id = 0;
+	info.digital.dvb.orig_network_id = 0;
+	cec_msg_select_digital_service(&msg, &info.digital);
+	fail_on_test(!transmit_timeout(node, &msg));
+	fail_on_test(!cec_msg_status_is_abort(&msg));
+	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
 
 	return 0;
 }
-- 
2.23.0

