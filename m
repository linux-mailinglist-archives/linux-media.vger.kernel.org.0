Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E5285AF1
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgJGIqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:24 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57038 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgJGIqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:19 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 479DB634D13
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:23 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 104/106] v4l: uapi: ccs: Add CCS controls for shading correction
Date:   Wed,  7 Oct 2020 11:45:55 +0300
Message-Id: <20201007084557.25843-95-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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

