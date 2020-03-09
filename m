Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4F517DD27
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgCIKO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44639 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgCIKOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mM-6W; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lh-Ll; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 02/19] dt-bindings: display: add sdtv-standards defines
Date:   Mon,  9 Mar 2020 11:14:11 +0100
Message-Id: <20200309101428.15267-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add defines which can be included to easily describe the supported
standard tv norms 'sdtv-standards' within the device tree.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v12:
- new patch because of splitting: https://patchwork.linuxtv.org/patch/58491/

 include/dt-bindings/display/sdtv-standards.h | 76 ++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 include/dt-bindings/display/sdtv-standards.h

diff --git a/include/dt-bindings/display/sdtv-standards.h b/include/dt-bindings/display/sdtv-standards.h
new file mode 100644
index 000000000000..fbc1a3db2ea7
--- /dev/null
+++ b/include/dt-bindings/display/sdtv-standards.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only or X11 */
+/*
+ * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#ifndef _DT_BINDINGS_DISPLAY_SDTV_STDS_H
+#define _DT_BINDINGS_DISPLAY_SDTV_STDS_H
+
+/*
+ * Attention: Keep the SDTV_STD_* bit definitions in sync with
+ * include/uapi/linux/videodev2.h V4L2_STD_* bit definitions.
+ */
+/* One bit for each standard */
+#define SDTV_STD_PAL_B		0x00000001
+#define SDTV_STD_PAL_B1		0x00000002
+#define SDTV_STD_PAL_G		0x00000004
+#define SDTV_STD_PAL_H		0x00000008
+#define SDTV_STD_PAL_I		0x00000010
+#define SDTV_STD_PAL_D		0x00000020
+#define SDTV_STD_PAL_D1		0x00000040
+#define SDTV_STD_PAL_K		0x00000080
+
+#define SDTV_STD_PAL		(SDTV_STD_PAL_B		| \
+				 SDTV_STD_PAL_B1	| \
+				 SDTV_STD_PAL_G		| \
+				 SDTV_STD_PAL_H		| \
+				 SDTV_STD_PAL_I		| \
+				 SDTV_STD_PAL_D		| \
+				 SDTV_STD_PAL_D1	| \
+				 SDTV_STD_PAL_K)
+
+#define SDTV_STD_PAL_M		0x00000100
+#define SDTV_STD_PAL_N		0x00000200
+#define SDTV_STD_PAL_Nc		0x00000400
+#define SDTV_STD_PAL_60		0x00000800
+
+#define SDTV_STD_NTSC_M		0x00001000	/* BTSC */
+#define SDTV_STD_NTSC_M_JP	0x00002000	/* EIA-J */
+#define SDTV_STD_NTSC_443	0x00004000
+#define SDTV_STD_NTSC_M_KR	0x00008000	/* FM A2 */
+
+#define SDTV_STD_NTSC		(SDTV_STD_NTSC_M	| \
+				 SDTV_STD_NTSC_M_JP	| \
+				 SDTV_STD_NTSC_M_KR)
+
+#define SDTV_STD_SECAM_B	0x00010000
+#define SDTV_STD_SECAM_D	0x00020000
+#define SDTV_STD_SECAM_G	0x00040000
+#define SDTV_STD_SECAM_H	0x00080000
+#define SDTV_STD_SECAM_K	0x00100000
+#define SDTV_STD_SECAM_K1	0x00200000
+#define SDTV_STD_SECAM_L	0x00400000
+#define SDTV_STD_SECAM_LC	0x00800000
+
+#define SDTV_STD_SECAM		(SDTV_STD_SECAM_B	| \
+				 SDTV_STD_SECAM_D	| \
+				 SDTV_STD_SECAM_G	| \
+				 SDTV_STD_SECAM_H	| \
+				 SDTV_STD_SECAM_K	| \
+				 SDTV_STD_SECAM_K1	| \
+				 SDTV_STD_SECAM_L	| \
+				 SDTV_STD_SECAM_LC)
+
+/* Standards for Countries with 60Hz Line frequency */
+#define SDTV_STD_525_60		(SDTV_STD_PAL_M		| \
+				 SDTV_STD_PAL_60	| \
+				 SDTV_STD_NTSC		| \
+				 SDTV_STD_NTSC_443)
+
+/* Standards for Countries with 50Hz Line frequency */
+#define SDTV_STD_625_50		(SDTV_STD_PAL		| \
+				 SDTV_STD_PAL_N		| \
+				 SDTV_STD_PAL_Nc	| \
+				 SDTV_STD_SECAM)
+
+#endif /* _DT_BINDINGS_DISPLAY_SDTV_STDS_H */
-- 
2.20.1

