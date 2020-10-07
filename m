Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EA3285AEF
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgJGIqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:22 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57076 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728055AbgJGIqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:18 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F21A7634D10
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 099/106] v4l: uapi: ccs: Add controls for analogue gain constants
Date:   Wed,  7 Oct 2020 11:45:50 +0300
Message-Id: <20201007084557.25843-90-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
 MAINTAINERS              |  1 +
 include/uapi/linux/ccs.h | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 include/uapi/linux/ccs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b72f666b8b60..c173e503b0b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11569,6 +11569,7 @@ F:	drivers/media/i2c/ccs/
 F:	drivers/media/i2c/ccs-pll.c
 F:	drivers/media/i2c/ccs-pll.h
 F:	include/uapi/linux/smiapp.h
+F:	include/uapi/linux/ccs.h
 
 MIPS
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
new file mode 100644
index 000000000000..bcdce95955b0
--- /dev/null
+++ b/include/uapi/linux/ccs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only AND BSD-3-Clause */
+/* Copyright (C) 2020 Intel Corporation */
+
+#ifndef __UAPI_CCS_H__
+#define __UAPI_CCS_H__
+
+#include <linux/videodev2.h>
+
+#define V4L2_CID_CCS_ANALOGUE_GAIN_M0		(V4L2_CID_USER_CCS_BASE + 1)
+#define V4L2_CID_CCS_ANALOGUE_GAIN_C0		(V4L2_CID_USER_CCS_BASE + 2)
+#define V4L2_CID_CCS_ANALOGUE_GAIN_M1		(V4L2_CID_USER_CCS_BASE + 3)
+#define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)
+
+#endif
-- 
2.27.0

