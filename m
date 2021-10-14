Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBE442D794
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhJNLCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 07:02:18 -0400
Received: from mga04.intel.com ([192.55.52.120]:21684 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230198AbhJNLCS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:02:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226422564"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="226422564"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 04:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="527560608"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2021 04:00:11 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, jeanmichel.hautbois@ideasonboard.com
Subject: [PATCH] media: staging: ipu3-imgu: clarify the limitation of grid config
Date:   Thu, 14 Oct 2021 18:56:17 +0800
Message-Id: <1634208977-22278-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some grid configuration limitations for ImgU, which was
not described clearly in current uAPI header file, add the description
to help user to set the grid configuration correctly.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index fa3d6ee5adf2..65290c1b1892 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -34,11 +34,21 @@
  * struct ipu3_uapi_grid_config - Grid plane config
  *
  * @width:	Grid horizontal dimensions, in number of grid blocks(cells).
+ *		For AWB, the range is (16, 80),
+ *		for AF/AE, the range is (16, 32).
  * @height:	Grid vertical dimensions, in number of grid cells.
+ *		For AWB, the range is (16, 60),
+ *		For AF/AE, the range is (16, 24).
  * @block_width_log2:	Log2 of the width of each cell in pixels.
- *			for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
+ *			For AWB, the range is (2^3, 2^4, 2^5, 2^6),
+ *			values [3, 6].
+ *			For AF/AE, the range is (2^3, 2^4, 2^5, 2^6, 2^7),
+ *			values [3, 7].
  * @block_height_log2:	Log2 of the height of each cell in pixels.
- *			for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
+ *			For AWB, the range is (2^3, 2^4, 2^5, 2^6),
+ *			values [3, 6].
+ *			For AF/AE, the range is (2^3, 2^4, 2^5, 2^6, 2^7),
+ *			values [3, 7].
  * @height_per_slice:	The number of blocks in vertical axis per slice.
  *			Default 2.
  * @x_start: X value of top left corner of Region of Interest(ROI).
-- 
2.7.4

