Return-Path: <linux-media+bounces-24548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E6A0804A
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 19:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 086E91888985
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 18:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F6E1A9B4A;
	Thu,  9 Jan 2025 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="kPuUrGJm";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="GzdvCaIq"
X-Original-To: linux-media@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21615B99E;
	Thu,  9 Jan 2025 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449133; cv=pass; b=iHNOK4Ti/dShkrxp1DPYauCmNnSvRr4hAFRre3y8D03lz/kHZVuLySJ/Ok5Ul7bUMCpy9LImEkANCAcofltivyFwuBchnMNPPEnC6SEPM4dA6V75uLt8yxFbAFJw2tR/Tz3HhEoWXo9ycocsdW33uOZujf5sJZ5EY9Fl3IVzgxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449133; c=relaxed/simple;
	bh=GMCwBuCPoFRcD3FGs5+4s1FKXtPidJbvcE2cGK1A7R8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dzOw3HKL+6xNa3ouu84PmvbL8KEiFIk6NhB5tmpW57FygivXA4mUCur1uA/fJEKebZV05FtaiAiB4e9L7vcqNf4ayGKwXhr3ZwDQW5Rhr3nax29b14JzZN3OeVtWzo/wdxfQFPpJNCbm+Dai/iwwSTsXwQ6pbFCpG0AN0xSYz9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=a98shuttle.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=kPuUrGJm; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=GzdvCaIq; arc=pass smtp.client-ip=81.169.146.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a98shuttle.de
ARC-Seal: i=1; a=rsa-sha256; t=1736448938; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IXB0uxMSW65yPnorqlkCZ2ifxgv887rEf0cX29xa8Q2bWdYWLK3L6No1/4YUcN01u/
    Y43M4GND1ohOZ3KOJIQkMCYe0f8YmJwo6bFeQXL82ciQt/+Db2O9x6vomn9FYu+L98cn
    fULLS+zQf54abJ8TvVeaitceb6IWfPKdLRsnIleBVMjxQ8bTXSzYwIYPS1+Wa89HozJJ
    fHEXcN/TsT3AHcyJgDTrFV+t22AYWhR/u0M02/aVw7nRaR/yHfBL+fjbeWi/tPzwEgxj
    qqh3MZGK4P2Oa2jx+/jCFQdNXkL98NOHynFS/a28fPNoqyM9AUPQ1tcOmPFte8EzHQgf
    rorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1736448938;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Zt9TBg6V0ARuQzyKioQaHgFvFhqZ3HTMfR3QKsfsdhU=;
    b=izvr+QmFNMIBrU8BSfE1uyX19266cyR2mZDsQn00ntrLqD45EaJeR6O0+/HrP2WBws
    Iyuo+j8Ly6/GpLjtX60Mp3xYAAv0x1zb1P1IZt0xkRXm9IOAQggTdyoUBxDzwmW589fT
    NxItPD2aUGQc87Ds+DHd4ZdNNfqPqxchl25Itr1G4XuFrTKHzAh2sMpANY37rYYvgj2C
    XeJcTYLdth3B186DBft3gpw7mmNB1oBJJ2LFB7+D+gPLvNG3/xHNsFe+TLUKVVZPvTIl
    YJRHPPyebJki+iTVSmNhtU3mxQIXLPYCfIG09cePhvdzbj4/DzyvC3DO0CeX2iTYRKmU
    hfGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1736448938;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Zt9TBg6V0ARuQzyKioQaHgFvFhqZ3HTMfR3QKsfsdhU=;
    b=kPuUrGJmXHHD0wsj9WAiju0RqTV3DgMkJIFg9hubtTYi8Q75f1CAD+z1r6ZVzmvZ9h
    fm/rVp3qYRqF1KMapchM1kOTdPHb3x7hSZqi8WsO0wZ2/AaOYADx33k4gTmu0VsIT/+D
    rDY5FQb2N+Lt4VDOHg0uHdi+Y47NZaSKqELNJuWYTpylJAqxKdLpuXUvQGdepXjW8aeT
    dOq8VuWbOIpg58L6np7bhMILqWfI9X3zl+ACq4xCA7y6LJmtSJc40X9uWsAey9peUNmH
    /rcliSKFjG5B7VD8t5A9EHwNUxy7tbHTcYclQSF/P+uIQ0p6EBGsLCd+A1kUTnF+gy4Y
    ddgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1736448938;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Zt9TBg6V0ARuQzyKioQaHgFvFhqZ3HTMfR3QKsfsdhU=;
    b=GzdvCaIqNk4J7DtEieC8r0SmcJNjBysJA+4OpeOTWZPGK5qlEvGneVbNixUB3/yqB7
    TPIRIR6nLXlxj1h0KkAA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id f86788109ItcYOr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 9 Jan 2025 19:55:38 +0100 (CET)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1tVxgv-00087t-2O;
	Thu, 09 Jan 2025 19:55:37 +0100
Received: (nullmailer pid 17089 invoked by uid 502);
	Thu, 09 Jan 2025 18:55:37 -0000
From: Michael Klein <michael@fossekall.de>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Klein <michael@fossekall.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: rc: add keymap for Siemens Gigaset RC20 remote
Date: Thu,  9 Jan 2025 19:55:10 +0100
Message-Id: <20250109185511.17049-1-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Add keymap for the Siemens Gigaset RC20 remote (RC-5).

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../rc/keymaps/rc-siemens-gigaset-rc20.c      | 71 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 73 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 7fdf0d9edbfd..d04572627cdd 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_RC_MAP) += \
 			rc-rc6-mce.o \
 			rc-real-audio-220-32-keys.o \
 			rc-reddo.o \
+			rc-siemens-gigaset-rc20.o \
 			rc-snapstream-firefly.o \
 			rc-streamzap.o \
 			rc-su3000.o \
diff --git a/drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c b/drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c
new file mode 100644
index 000000000000..defc77932e10
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* rc-siemens-gigaset-rc20.c - Keytable for the Siemens Gigaset RC 20 remote
+ *
+ * Copyright (c) 2025 by Michael Klein
+ */
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table siemens_gigaset_rc20[] = {
+	{ 0x1501, KEY_POWER },
+	{ 0x1502, KEY_MUTE },
+	{ 0x1503, KEY_NUMERIC_1 },
+	{ 0x1504, KEY_NUMERIC_2 },
+	{ 0x1505, KEY_NUMERIC_3 },
+	{ 0x1506, KEY_NUMERIC_4 },
+	{ 0x1507, KEY_NUMERIC_5 },
+	{ 0x1508, KEY_NUMERIC_6 },
+	{ 0x1509, KEY_NUMERIC_7 },
+	{ 0x150a, KEY_NUMERIC_8 },
+	{ 0x150b, KEY_NUMERIC_9 },
+	{ 0x150c, KEY_NUMERIC_0 },
+	{ 0x150d, KEY_UP },
+	{ 0x150e, KEY_LEFT },
+	{ 0x150f, KEY_OK },
+	{ 0x1510, KEY_RIGHT },
+	{ 0x1511, KEY_DOWN },
+	{ 0x1512, KEY_SHUFFLE },        /* double-arrow */
+	{ 0x1513, KEY_EXIT },
+	{ 0x1514, KEY_RED },
+	{ 0x1515, KEY_GREEN },
+	{ 0x1516, KEY_YELLOW },         /* OPT */
+	{ 0x1517, KEY_BLUE },
+	{ 0x1518, KEY_MENU },
+	{ 0x1519, KEY_TEXT },
+	{ 0x151a, KEY_MODE },           /* TV/Radio */
+
+	{ 0x1521, KEY_EPG },
+	{ 0x1522, KEY_FAVORITES },
+	{ 0x1523, KEY_CHANNELUP },
+	{ 0x1524, KEY_CHANNELDOWN },
+	{ 0x1525, KEY_VOLUMEUP },
+	{ 0x1526, KEY_VOLUMEDOWN },
+	{ 0x1527, KEY_INFO },
+};
+
+static struct rc_map_list siemens_gigaset_rc20_map = {
+	.map = {
+		.scan     = siemens_gigaset_rc20,
+		.size     = ARRAY_SIZE(siemens_gigaset_rc20),
+		.rc_proto = RC_PROTO_RC5,
+		.name     = RC_MAP_SIEMENS_GIGASET_RC20,
+	}
+};
+
+static int __init init_rc_map_siemens_gigaset_rc20(void)
+{
+	return rc_map_register(&siemens_gigaset_rc20_map);
+}
+
+static void __exit exit_rc_map_siemens_gigaset_rc20(void)
+{
+	rc_map_unregister(&siemens_gigaset_rc20_map);
+}
+
+module_init(init_rc_map_siemens_gigaset_rc20)
+module_exit(exit_rc_map_siemens_gigaset_rc20)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michael Klein");
+MODULE_DESCRIPTION("Siemens Gigaset RC20 remote keytable");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 4867eb2f931e..d90e4611b066 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -313,6 +313,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_RC6_MCE                   "rc-rc6-mce"
 #define RC_MAP_REAL_AUDIO_220_32_KEYS    "rc-real-audio-220-32-keys"
 #define RC_MAP_REDDO                     "rc-reddo"
+#define RC_MAP_SIEMENS_GIGASET_RC20      "rc-siemens-gigaset-rc20"
 #define RC_MAP_SNAPSTREAM_FIREFLY        "rc-snapstream-firefly"
 #define RC_MAP_STREAMZAP                 "rc-streamzap"
 #define RC_MAP_SU3000                    "rc-su3000"
-- 
2.39.5


