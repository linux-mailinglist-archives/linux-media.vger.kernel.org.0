Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03708EACD
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbfHOL6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 07:58:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38675 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbfHOL57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 07:57:59 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEO7-00042i-58; Thu, 15 Aug 2019 13:57:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEO4-0006I3-T1; Thu, 15 Aug 2019 13:57:48 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 01/13] dt-bindings: connector: analog: add tv norms property
Date:   Thu, 15 Aug 2019 13:57:35 +0200
Message-Id: <20190815115747.24018-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815115747.24018-1-m.felsch@pengutronix.de>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
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

Some connectors no matter if in- or output supports only a limited
range of tv norms. It doesn't matter if the hardware behind that
connector supports more than the listed formats since the users are
restriced by a label e.g. to plug only a camera into this connector
which uses the PAL format.

This patch adds the capability to describe such limitation within the
firmware. There are no format restrictions if the property isn't
present, so it's completely backward compatible.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
[1] https://patchwork.kernel.org/cover/10794703/

v7:
I kept Robs r b tag because I only changed the example and extended
TVNORM_* macros.

- fix some style issues
- add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50

v6:
- tvnorms.h: use tabs instead of spaces
- tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
- tvnorms.h: drop rarely used TVNORM_ATSC_* norms

v2-v4:
- nothing since the patch was squashed from series [1] into this
  series.
---
 .../display/connector/analog-tv-connector.txt |  4 ++
 include/dt-bindings/media/tvnorms.h           | 72 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 include/dt-bindings/media/tvnorms.h

diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
index 0c0970c210ab..434e8aa0398b 100644
--- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
+++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
@@ -6,6 +6,9 @@ Required properties:
 
 Optional properties:
 - label: a symbolic name for the connector
+- tvnorms: limit the supported tv norms on a connector to the given ones else
+           all tv norms are allowed. Possible video standards are defined in
+           include/dt-bindings/media/tvnorms.h.
 
 Required nodes:
 - Video port for TV input
@@ -16,6 +19,7 @@ Example
 tv: connector {
 	compatible = "composite-video-connector";
 	label = "tv";
+	tvnorms = <(TVNORM_PAL | TVNORM_NTSC)>;
 
 	port {
 		tv_connector_in: endpoint {
diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
new file mode 100644
index 000000000000..e1275673c4d6
--- /dev/null
+++ b/include/dt-bindings/media/tvnorms.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only or X11 */
+/*
+ * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
+#define _DT_BINDINGS_MEDIA_TVNORMS_H
+
+/* One bit for each standard */
+#define TVNORM_PAL_B		0x00000001
+#define TVNORM_PAL_B1		0x00000002
+#define TVNORM_PAL_G		0x00000004
+#define TVNORM_PAL_H		0x00000008
+#define TVNORM_PAL_I		0x00000010
+#define TVNORM_PAL_D		0x00000020
+#define TVNORM_PAL_D1		0x00000040
+#define TVNORM_PAL_K		0x00000080
+
+#define TVNORM_PAL		(TVNORM_PAL_B		| \
+				 TVNORM_PAL_B1		| \
+				 TVNORM_PAL_G		| \
+				 TVNORM_PAL_H		| \
+				 TVNORM_PAL_I		| \
+				 TVNORM_PAL_D		| \
+				 TVNORM_PAL_D1		| \
+				 TVNORM_PAL_K)
+
+#define TVNORM_PAL_M		0x00000100
+#define TVNORM_PAL_N		0x00000200
+#define TVNORM_PAL_Nc		0x00000400
+#define TVNORM_PAL_60		0x00000800
+
+#define TVNORM_NTSC_M		0x00001000	/* BTSC */
+#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
+#define TVNORM_NTSC_443		0x00004000
+#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
+
+#define TVNORM_NTSC		(TVNORM_NTSC_M		|\
+				 TVNORM_NTSC_M_JP	|\
+				 TVNORM_NTSC_M_KR)
+
+#define TVNORM_SECAM_B		0x00010000
+#define TVNORM_SECAM_D		0x00020000
+#define TVNORM_SECAM_G		0x00040000
+#define TVNORM_SECAM_H		0x00080000
+#define TVNORM_SECAM_K		0x00100000
+#define TVNORM_SECAM_K1		0x00200000
+#define TVNORM_SECAM_L		0x00400000
+#define TVNORM_SECAM_LC		0x00800000
+
+#define TVNORM_SECAM		(TVNORM_SECAM_B		| \
+				 TVNORM_SECAM_D		| \
+				 TVNORM_SECAM_G		| \
+				 TVNORM_SECAM_H		| \
+				 TVNORM_SECAM_K		| \
+				 TVNORM_SECAM_K1	| \
+				 TVNORM_SECAM_L		| \
+				 TVNORM_SECAM_LC)
+
+/* Standards for Countries with 60Hz Line frequency */
+#define TVNORM_525_60		(TVNORM_PAL_M		| \
+				 TVNORM_PAL_60		| \
+				 TVNORM_NTSC		| \
+				 TVNORM_NTSC_443)
+
+/* Standards for Countries with 50Hz Line frequency */
+#define TVNORM_625_50		(TVNORM_PAL		|\
+				 TVNORM_PAL_N		|\
+				 TVNORM_PAL_Nc		|\
+				 TVNORM_SECAM)
+
+#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
-- 
2.20.1

