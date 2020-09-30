Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBC827ECB3
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbgI3P31 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:27 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44644 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731071AbgI3P3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:17 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4B710634C89
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 095/100] v4l: uapi: Add controls for CCS alternative analogue gain
Date:   Wed, 30 Sep 2020 18:28:53 +0300
Message-Id: <20200930152858.8471-96-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add two new controls for alternative analogue gain some CCS compliant
camera sensors support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/ccs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
index bcdce95955b0..f22afa58b446 100644
--- a/include/uapi/linux/ccs.h
+++ b/include/uapi/linux/ccs.h
@@ -10,5 +10,7 @@
 #define V4L2_CID_CCS_ANALOGUE_GAIN_C0		(V4L2_CID_USER_CCS_BASE + 2)
 #define V4L2_CID_CCS_ANALOGUE_GAIN_M1		(V4L2_CID_USER_CCS_BASE + 3)
 #define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)
+#define V4L2_CID_CCS_ANALOGUE_LINEAR_GAIN	(V4L2_CID_USER_CCS_BASE + 5)
+#define V4L2_CID_CCS_ANALOGUE_EXPONENTIAL_GAIN	(V4L2_CID_USER_CCS_BASE + 6)
 
 #endif
-- 
2.27.0

