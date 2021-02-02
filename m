Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A7130B693
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 05:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhBBEfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 23:35:52 -0500
Received: from mga12.intel.com ([192.55.52.136]:50389 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231747AbhBBEfq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 23:35:46 -0500
IronPort-SDR: NTmQBTYFj4pzla/iuKIpuu8tN5pY8sQgWJSvDQ7WRtR4ZQOfccquhpcX+Q57YJxu8ZeTsB9WVP
 d3HlV43RkN1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="159962693"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="159962693"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 20:34:53 -0800
IronPort-SDR: 1CsSq5tEDkOngwM0H6tVxP6un+nQT6pqAceGkMclu1R4yWTKY0Sx5ai0bnFG2DEPFGYq6MdpJI
 mn66z9CgsazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="413014992"
Received: from server-intel-chrome-camera.itwn.intel.com ([10.5.215.143])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2021 20:34:51 -0800
From:   Shawnx Tu <shawnx.tu@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com, jim.lai@intel.com, bingbu.cao@intel.com
Subject: [PATCH v1] ov5675: fix vflip/hflip control
Date:   Tue,  2 Feb 2021 12:35:01 +0800
Message-Id: <20210202043501.26660-1-shawnx.tu@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shawn Tu <shawnx.tu@intel.com>

Set/clear the bits to configure the register to expected value
to assume the v/hflip state.

Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
---
 drivers/media/i2c/ov5675.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 5e35808037ad..ae00d717e599 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -624,7 +624,7 @@ static int ov5675_set_ctrl_hflip(struct ov5675 *ov5675, u32 ctrl_val)
 
 	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
 				OV5675_REG_VALUE_08BIT,
-				ctrl_val ? val & ~BIT(3) : val);
+				ctrl_val ? val & ~BIT(3) : val | BIT(3));
 }
 
 static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
@@ -639,7 +639,7 @@ static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
 
 	ret = ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
 			       OV5675_REG_VALUE_08BIT,
-			       ctrl_val ? val | BIT(4) | BIT(5)  : val);
+			       ctrl_val ? val | BIT(4) | BIT(5)  : val & ~BIT(4) & ~BIT(5));
 
 	if (ret)
 		return ret;
@@ -652,7 +652,7 @@ static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
 
 	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT2,
 				OV5675_REG_VALUE_08BIT,
-				ctrl_val ? val | BIT(1) : val);
+				ctrl_val ? val | BIT(1) : val & ~BIT(1));
 }
 
 static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.17.1

