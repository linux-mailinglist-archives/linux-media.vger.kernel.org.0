Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE24A7B0A41
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbjI0Qcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjI0Qco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:32:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E32AE6
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832363; x=1727368363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1eRhR3vdQbwE+zqQIbgaOvRBqmRRrtHraOJQuVIaw5A=;
  b=HqN6aluGYfvkK+LLp0qr4pj330UnNneqrEptZgaU5uyyuJd8k81rzUkL
   mC/vUMSD9Q0Y7i2WlMUJ274MnI+7Oarh5bgEWxkWCKlwP38oPoOY+SLtS
   FC9MjaFIddp2e6my/Mr+/B3bajQ58YizXppoiHLokKgRqCLvGECLwFTqg
   XHiG/mfNWwymKKHWsCANgC5VTfN7a6LQeOb0drBW/l/l0kFmolJuA4Sxs
   jYZFJJG/XBUqL837M5GkS2dOhxy3PBsplRLhNlH7WnJB0ebzVxaQR9cqw
   SCiKU98Na+W6nCu0RpckGuNwVYXuMNvLHfqby3VaOSW9/mK8Kf3b35EdQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381771187"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381771187"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892665734"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892665734"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:31:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9908D11F967;
        Wed, 27 Sep 2023 19:32:35 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 06/26] media: uapi: ccs: Add media bus code for MIPI CCS embedded data
Date:   Wed, 27 Sep 2023 19:31:52 +0300
Message-Id: <20230927163212.402025-7-sakari.ailus@linux.intel.com>
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

Add new MIPI CCS embedded data media bus code
(MEDIA_BUS_FMT_CCS_EMBEDDED).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 ++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c54bf834d839..70cad81bf862 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8492,3 +8492,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
       - X
       - X
       - X
+
+.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
+
+MIPI CCS Embedded Data Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
+metadata format for sensor embedded data, which is used to store the register
+configuration used for capturing a given frame. The format is defined in the CCS
+specification. The media bus code for this format is
+``MEDIA_BUS_FMT_CCS_EMBEDDED``.
+
+The CCS embedded data format definition includes three levels:
+
+1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
+   documented in the MIPI CCS specification.
+
+2. The tagged data format as documented in the MIPI CCS specification.
+
+3. Register addresses and register documentation as documented in the MIPI CCS
+   specification.
+
+The format definition shall be used only by devices that fulfill all three
+levels above.
+
+This mbus code are only used for "2-byte simplified tagged data format" (code
+0xa) but their use may be extended further in the future, to cover other CCS
+embedded data format codes.
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 9ee031397372..9805f8e73e48 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -182,4 +182,7 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Specific metadata formats. Next is 0x9002. */
+#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2

