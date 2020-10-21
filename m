Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CF72946A9
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 04:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411303AbgJUCra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 22:47:30 -0400
Received: from mga09.intel.com ([134.134.136.24]:36130 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411301AbgJUCr3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 22:47:29 -0400
IronPort-SDR: FzdKnF+UllgZhm8ASvSVf/j7S9xwl1Yeerocs7kTQd7hJYT1fmen/OljwDwCuxHmqwHjuIJ8MD
 IB3pY22k7rmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167425190"
X-IronPort-AV: E=Sophos;i="5.77,399,1596524400"; 
   d="scan'208";a="167425190"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 19:47:28 -0700
IronPort-SDR: TdiL+GJakbmwmp97dkpP1ssnmjrhLmC0UKDY1dAqXYx7t3PpLtI4a6IKVvkzN1flK1lh6f0U+f
 i6lxb8mS77kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,399,1596524400"; 
   d="scan'208";a="320870193"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2020 19:47:26 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: ov2740: change the minimal exposure value to 4
Date:   Wed, 21 Oct 2020 10:44:10 +0800
Message-Id: <1603248250-24847-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The minimal valid exposure value should be 4 lines instead of 8 for
ov2740 mannual exposure control.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov2740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index bd0d45b0d43f..0dbae4949cb3 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -37,7 +37,7 @@
 
 /* Exposure controls from sensor */
 #define OV2740_REG_EXPOSURE		0x3500
-#define OV2740_EXPOSURE_MIN		8
+#define OV2740_EXPOSURE_MIN		4
 #define OV2740_EXPOSURE_MAX_MARGIN	8
 #define OV2740_EXPOSURE_STEP		1
 
-- 
2.7.4

