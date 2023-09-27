Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F13A7B0A49
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjI0Qct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjI0Qcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:32:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CC891
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832367; x=1727368367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RudmQC+2iXiULLXvR1EEr7/PIesrdyhgrIStxBi1e1k=;
  b=HrmFauJ4TSkHsJsl9j0iGivNBP9s/prIbIiNTPsCpN0Upk2aTP/SoZYP
   LxAZ9kr8Tm8LBflmgfWEu7kVMWlp8KV+xVgLIU2kj2ly+AHC1Pkc6cwuM
   GxUe/EGGBmUu/dgp4VnSf767tXPVPNEPg1ZiZoqDz8LjUYLj4OMzXdYwf
   3VsTTZSrd82Wv4lXsDpilbt0cajtd7EAm4Y348saN0I+7gHuK+THZhXNr
   sjvvCbo1eeZOsf6pcN8n5eb/9WyYp+5urH4efpb486+dslYfcCqd5cRwu
   fhEBvcDMlYxFmp7tdSaR4eWQQ2EM2KA6LYlULB2UaDgkC8Ufsp1rMPe3l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381771200"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381771200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892665737"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892665737"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:31:36 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C15A311FBCE;
        Wed, 27 Sep 2023 19:32:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 07/26] media: Documentation: ccs: Document routing
Date:   Wed, 27 Sep 2023 19:31:53 +0300
Message-Id: <20230927163212.402025-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 34 ++++++++++++++++++-
 .../media/v4l/subdev-formats.rst              |  2 ++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 161cb65f4d98..ad8615233bae 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -107,4 +107,36 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (internal pad
+1/stream 0 -> pad 0/stream 0) and the second one is for embedded data (internal
+pad 2/stream 0 -> pad 0/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The media bus code
+used for this format is :ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED
+<MEDIA-BUS-FMT-CCS-EMBEDDED>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :ref:`Data units
+<media-glossary-data-unit>` for that particular bit depth. This is indicated by
+the generic metadata format on the sensor's source sub-device's source pad.
+
+Embedded data for bit depths greater than or equal to 16 may support more dense
+packing or legacy single metadata byte per data unit, or both of these,
+depending on the device. The supported embedded data formats can be enumerated
+and configured on stream 1 of the source pad (1) of the CCS source sub-device.
+
+**Copyright** |copy| 2020, 2023 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 70cad81bf862..62396a47af4d 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8520,3 +8520,5 @@ levels above.
 This mbus code are only used for "2-byte simplified tagged data format" (code
 0xa) but their use may be extended further in the future, to cover other CCS
 embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.39.2

