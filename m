Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B0D27ECB0
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbgI3P3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:24 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44636 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731074AbgI3P3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:18 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7E8D6634D0F
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 098/100] v4l: uapi: Add CCS controls for correction configuration and capabilities
Date:   Wed, 30 Sep 2020 18:28:56 +0300
Message-Id: <20200930152858.8471-99-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2 controls for controlling CCS lens shading correction as well as
conveying its capabilities.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/ccs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
index f22afa58b446..877229ce4a36 100644
--- a/include/uapi/linux/ccs.h
+++ b/include/uapi/linux/ccs.h
@@ -12,5 +12,10 @@
 #define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)
 #define V4L2_CID_CCS_ANALOGUE_LINEAR_GAIN	(V4L2_CID_USER_CCS_BASE + 5)
 #define V4L2_CID_CCS_ANALOGUE_EXPONENTIAL_GAIN	(V4L2_CID_USER_CCS_BASE + 6)
+#define V4L2_CID_CCS_SHADING_CORRECTION_CAPABILITY (V4L2_CID_USER_CCS_BASE + 7)
+#define V4L2_CCS_SHADING_CORRECTION_COLOUR	(1U << 0)
+#define V4L2_CCS_SHADING_CORRECTION_LUMINANCE	(1U << 1)
+#define V4L2_CID_CCS_SHADING_CORRECTION		(V4L2_CID_USER_CCS_BASE + 8)
+#define V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION (V4L2_CID_USER_CCS_BASE + 9)
 
 #endif
-- 
2.27.0

