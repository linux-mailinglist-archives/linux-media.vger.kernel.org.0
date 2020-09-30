Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7561C27ECAB
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgI3P3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44682 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731068AbgI3P3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:18 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2479C634C8D
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 093/100] v4l: uapi: Add controls for analogue gain constants
Date:   Wed, 30 Sep 2020 18:28:51 +0300
Message-Id: <20200930152858.8471-94-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
 include/uapi/linux/ccs.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/uapi/linux/ccs.h

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

