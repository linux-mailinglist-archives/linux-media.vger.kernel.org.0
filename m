Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB56E103E
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 04:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389426AbfJWCw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 22:52:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:19903 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389423AbfJWCw6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 22:52:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 19:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; 
   d="scan'208";a="201861047"
Received: from ipu5-build.bj.intel.com ([10.238.232.193])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2019 19:52:57 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        bingbu.cao@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH] doc-rst: ipu3: clarification on data type conversion of IEFD CU
Date:   Wed, 23 Oct 2019 10:59:02 +0800
Message-Id: <1571799542-19129-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

The data type conversion of the IEFD CU inputs in ipu3 uapi
is ambiguities, add some clarification to help user to
understand this conversion.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/ipu3/TODO                 | 2 --
 drivers/staging/media/ipu3/include/intel-ipu3.h | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
index 5e55baeaea1a..f2542a7a09b5 100644
--- a/drivers/staging/media/ipu3/TODO
+++ b/drivers/staging/media/ipu3/TODO
@@ -13,8 +13,6 @@ staging directory.
   Comments on configuring v4l2 subdevs for CIO2 and ImgU.
 
 - uAPI documentation:
-  Further clarification on some ambiguities such as data type conversion of
-  IEFD CU inputs. (Sakari)
   Move acronyms to doc-rst file. (Mauro)
 
 - Switch to yavta from v4l2n in driver docs.
diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index c7cd27efac8a..08eaa0bad0de 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -1217,6 +1217,11 @@ struct ipu3_uapi_shd_config {
  *
  * All CU inputs are unsigned, they will be converted to signed when written
  * to register, i.e. a01 will be written to 9 bit register in s4.4 format.
+ * The data precision s4.4 means 4 bits for integer parts and 4 bits for the
+ * fractional part, the first bit indicates positive or negative value.
+ * For userspace software (commonly the imaging library), the computation for
+ * the CU slope values should be based on the slope resolution 1/16 (binary
+ * 0.0001 - the minimal interval value), the slope value range is [-256, +255].
  * This applies to &ipu3_uapi_iefd_cux6_ed, &ipu3_uapi_iefd_cux2_1,
  * &ipu3_uapi_iefd_cux2_1, &ipu3_uapi_iefd_cux4 and &ipu3_uapi_iefd_cux6_rad.
  */
-- 
2.7.4

