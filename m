Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F6C7E2173
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjKFM0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjKFM0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:35 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EDBDB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273592; x=1730809592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RudmQC+2iXiULLXvR1EEr7/PIesrdyhgrIStxBi1e1k=;
  b=dJhcNGNFzzTu0iJok6zCUoqwV+qqR1Jqju7KGJ3UuiKSMumbnFxPtjqx
   f+g6KLN1qb3+SDQpPkyjt50vMzn4fUF4hJdiHIzfH/3srHJDsOKTySfc5
   hSDt5ZJIbeMHouFrOjwwqwV3a7k9+n1yAohzRj2++fyjDPQWZq8f0fDwf
   hFf5XLhq9lIIX1tqdFsZFTiMdH7HopG2Ny04GQ45O+LipwGX477esDRGs
   k2IgUHQAkrB9TzRq0pDCGJo0kwKALZFlhYf7GVto/ud36LktwuRKdV7I3
   n+S9SLCdgP3Zljlg749biHkVJQfvqEm5yqx9CstvJVTWM/hjPBbkeaCfB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475498655"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="475498655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755836335"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="755836335"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:28 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E854711FB8D;
        Mon,  6 Nov 2023 14:26:24 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 30/31] media: Documentation: ccs: Document routing
Date:   Mon,  6 Nov 2023 14:25:38 +0200
Message-Id: <20231106122539.1268265-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

