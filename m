Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711AF3C7332
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 17:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237063AbhGMPb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 11:31:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:16981 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236842AbhGMPb4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 11:31:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="231984581"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="231984581"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 08:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="630077935"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 13 Jul 2021 08:25:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 17359551; Tue, 13 Jul 2021 18:25:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 4/5] media: staging: atomisp: Move MIPI_PORT_LANES to the only user
Date:   Tue, 13 Jul 2021 18:25:22 +0300
Message-Id: <20210713152523.19902-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
References: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move MIPI_PORT_LANES to the only user of it, i.e. pci/runtime/isys/src/rx.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added "media:" prefix, fixed compilation error in some configurations (LKP)
 .../media/atomisp/pci/isp2400_input_system_local.h    | 11 -----------
 .../staging/media/atomisp/pci/runtime/isys/src/rx.c   | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 21f11bdfc85f..2614b89b8e34 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -362,17 +362,6 @@ static const hrt_address __maybe_unused MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
 	0x00000200UL
 };
 
-static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
-	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_2LANE_CFG},
-	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
-	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG}
-};
-
 static const hrt_address __maybe_unused SUB_SYSTEM_OFFSET[N_SUB_SYSTEM_ID] = {
 	0x00001000UL,
 	0x00002000UL,
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 4a18da6bf0c1..79475dc19eb6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -476,6 +476,17 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
 #endif
 
 #if !defined(ISP2401)
+static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
+	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_2LANE_CFG},
+	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
+	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG}
+};
+
 void ia_css_isys_rx_configure(const rx_cfg_t *config,
 			      const enum ia_css_input_mode input_mode)
 {
-- 
2.30.2

