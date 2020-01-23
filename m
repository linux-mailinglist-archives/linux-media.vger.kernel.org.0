Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E54A2147263
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 21:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgAWUI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 15:08:26 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:37716 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727215AbgAWUI0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 15:08:26 -0500
Received: from sf.home (tunnel547699-pt.tunnel.tserv1.lon2.ipv6.he.net [IPv6:2001:470:1f1c:3e6::2])
        (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: slyfox)
        by smtp.gentoo.org (Postfix) with ESMTPSA id EE8BC34E432;
        Thu, 23 Jan 2020 20:08:24 +0000 (UTC)
Received: by sf.home (Postfix, from userid 1000)
        id BC908279885A2; Thu, 23 Jan 2020 20:08:21 +0000 (GMT)
From:   Sergei Trofimovich <slyfox@gentoo.org>
To:     linux-media@vger.kernel.org
Cc:     Sergei Trofimovich <slyfox@gentoo.org>
Subject: [PATCH] libdvb5: fix build failure against gcc-10
Date:   Thu, 23 Jan 2020 20:08:20 +0000
Message-Id: <20200123200820.955710-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On gcc-10 (and gcc-9 -fno-common) build fails as:

```
  CCLD     libdvbv5.la
ld: .libs/libdvbv5_la-dvb-fe.o:(.bss+0x0):
  multiple definition of `delivery_system_name'; .libs/libdvbv5_la-dvb-v5.o:v4l-utils/lib/libdvbv5/dvb-v5.h:29: first defined here
ld: .libs/libdvbv5_la-dvb-fe.o:(.bss+0xa0):
  multiple definition of `dvb_v5_name'; .libs/libdvbv5_la-dvb-v5.o:v4l-utils/lib/libdvbv5/dvb-v5.h:28: first defined here
```

gcc-10 will change the default from -fcommon to fno-common:
https://gcc.gnu.org/PR85678.

The error also happens if CFLAGS=-fno-common passed explicitly.

Bug: https://bugs.gentoo.org/706130
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 lib/include/libdvbv5/desc_t2_delivery.h |  2 +-
 lib/libdvbv5/dvb-v5.h                   | 26 ++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/include/libdvbv5/desc_t2_delivery.h b/lib/include/libdvbv5/desc_t2_delivery.h
index 93594b76..8c11fa9a 100644
--- a/lib/include/libdvbv5/desc_t2_delivery.h
+++ b/lib/include/libdvbv5/desc_t2_delivery.h
@@ -215,7 +215,7 @@ extern const unsigned dvbt2_transmission_mode[];
  * @brief converts from internal representation to string the SISO_MISO
  *	  field of dvb_desc_t2_delivery:SISO_MISO field.
  */
-const char *siso_miso[4];
+extern const char *siso_miso[4];
 
 #ifdef __cplusplus
 }
diff --git a/lib/libdvbv5/dvb-v5.h b/lib/libdvbv5/dvb-v5.h
index 45aaddda..3540bac1 100644
--- a/lib/libdvbv5/dvb-v5.h
+++ b/lib/libdvbv5/dvb-v5.h
@@ -14,17 +14,17 @@ struct fe_status_name {
 	char *name;
 };
 extern struct fe_status_name fe_status_name[8];
-const char *fe_code_rate_name[14];
-const char *fe_modulation_name[15];
-const char *fe_transmission_mode_name[10];
-const unsigned fe_bandwidth_name[8];
-const char *fe_guard_interval_name[12];
-const char *fe_hierarchy_name[6];
-const char *fe_voltage_name[4];
-const char *fe_tone_name[3];
-const char *fe_inversion_name[4];
-const char *fe_pilot_name[4];
-const char *fe_rolloff_name[5];
-const char *dvb_v5_name[72];
-const char *delivery_system_name[20];
+extern const char *fe_code_rate_name[14];
+extern const char *fe_modulation_name[15];
+extern const char *fe_transmission_mode_name[10];
+extern const unsigned fe_bandwidth_name[8];
+extern const char *fe_guard_interval_name[12];
+extern const char *fe_hierarchy_name[6];
+extern const char *fe_voltage_name[4];
+extern const char *fe_tone_name[3];
+extern const char *fe_inversion_name[4];
+extern const char *fe_pilot_name[4];
+extern const char *fe_rolloff_name[5];
+extern const char *dvb_v5_name[72];
+extern const char *delivery_system_name[20];
 #endif
-- 
2.25.0

