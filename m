Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7F82D74EC
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 12:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389984AbgLKLtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 06:49:23 -0500
Received: from retiisi.eu ([95.216.213.190]:43920 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733113AbgLKLtC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 06:49:02 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 30485634C87;
        Fri, 11 Dec 2020 13:46:55 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v1.1 07/24] v4l: uapi: ccs: Add controls for analogue gain constants
Date:   Fri, 11 Dec 2020 13:39:25 +0200
Message-Id: <20201211113925.8170-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-8-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2 controls for analogue gai constants required to control
analogue gain. The values are device specific and thus need to be obtained
from the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Include v4l2-controls.h instead of videodev2.h.

 .../userspace-api/media/drivers/ccs.rst       | 25 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 include/uapi/linux/ccs.h                      | 14 +++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 include/uapi/linux/ccs.h

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 00bb3a6288f5..a95d7941533d 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -56,4 +56,29 @@ analogue data is never read from the pixel matrix that are outside the
 configured selection rectangle that designates crop. The difference has an
 effect in device timing and likely also in power consumption.
 
+Private controls
+----------------
+
+The MIPI CCS driver implements a number of private controls under
+``V4L2_CID_USER_BASE_CCS`` to control the MIPI CCS compliant camera sensors.
+
+Analogue gain model
+~~~~~~~~~~~~~~~~~~~
+
+The CCS defines an analogue gain model where the gain can be calculated using
+the following formula:
+
+	gain = m0 * x + c0 / (m1 * x + c1)
+
+Either m0 or c0 will be zero. The constants that are device specific, can be
+obtained from the following controls:
+
+	V4L2_CID_CCS_ANALOGUE_GAIN_M0
+	V4L2_CID_CCS_ANALOGUE_GAIN_M1
+	V4L2_CID_CCS_ANALOGUE_GAIN_C0
+	V4L2_CID_CCS_ANALOGUE_GAIN_C1
+
+The analogue gain (``x`` in the formula) is controlled through
+``V4L2_CID_ANALOGUE_GAIN`` in this case.
+
 **Copyright** |copy| 2020 Intel Corporation
diff --git a/MAINTAINERS b/MAINTAINERS
index ab0bf9b8dd72..bd6ee5c746f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11648,6 +11648,7 @@ F:	Documentation/userspace-api/media/drivers/ccs.rst
 F:	drivers/media/i2c/ccs-pll.c
 F:	drivers/media/i2c/ccs-pll.h
 F:	drivers/media/i2c/ccs/
+F:	include/uapi/linux/ccs.h
 F:	include/uapi/linux/smiapp.h
 
 MIPS
diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
new file mode 100644
index 000000000000..57515ed7aaab
--- /dev/null
+++ b/include/uapi/linux/ccs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright (C) 2020 Intel Corporation */
+
+#ifndef __UAPI_CCS_H__
+#define __UAPI_CCS_H__
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_CCS_ANALOGUE_GAIN_M0		(V4L2_CID_USER_CCS_BASE + 1)
+#define V4L2_CID_CCS_ANALOGUE_GAIN_C0		(V4L2_CID_USER_CCS_BASE + 2)
+#define V4L2_CID_CCS_ANALOGUE_GAIN_M1		(V4L2_CID_USER_CCS_BASE + 3)
+#define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)
+
+#endif
-- 
2.29.2

