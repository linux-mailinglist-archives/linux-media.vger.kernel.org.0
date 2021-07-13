Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1AB3C7342
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 17:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbhGMPc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 11:32:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:29791 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237033AbhGMPcz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 11:32:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="208366730"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="208366730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 08:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="412479666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2021 08:25:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 228725A1; Tue, 13 Jul 2021 18:25:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5/5] media: staging: atomisp: Remove unused port_enabled variable
Date:   Tue, 13 Jul 2021 18:25:23 +0300
Message-Id: <20210713152523.19902-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
References: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unused port_enabled variable in ia_css_isys_rx_configure().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added "media:" prefix
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 79475dc19eb6..af153c3fb86d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -490,7 +490,6 @@ static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
 void ia_css_isys_rx_configure(const rx_cfg_t *config,
 			      const enum ia_css_input_mode input_mode)
 {
-	bool port_enabled[N_MIPI_PORT_ID];
 	bool any_port_enabled = false;
 	enum mipi_port_id port;
 
@@ -527,8 +526,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 					_HRT_CSS_RECEIVER_2400_RX_COUNT_REG_IDX,
 					config->rxcount);
 
-		port_enabled[port] = true;
-
 		if (input_mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 			/* MW: A bit of a hack, straight wiring of the capture
 			 * units,assuming they are linearly enumerated. */
-- 
2.30.2

