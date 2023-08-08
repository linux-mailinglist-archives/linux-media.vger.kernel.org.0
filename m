Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE5B773F62
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbjHHQqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbjHHQpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:45:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4613F4445D
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510184; x=1723046184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=64z0iHES/dFeITo3Vn7fWATVi0C19w3f1FwZVWt4p00=;
  b=jqgf8qPxUaD09PAlAEfXAeMo2EU3BNx73XW9ln2I2vL54lASOoX0vKHV
   A1q0UGOikVA2pSTxqreEMicq7KpGRONkciuKXwwM79d1oHNxHxxek2Clr
   R1laHegDFCQde2BN2/mDbpWuKHOzcJ+/suYJduyRDl9kREJxGWnVticGD
   0U7aHN25GxugqPgfelgCgxBQEuzt2pLX2Cx+xSUAaFzNQ9xwrZNVRb5E0
   VPKhg09M1/V60IbPDzyA2nVeVF1NVy8KOWulJiS/eMJ85Ds9hmJcMYgf/
   lzRVxCZG1IvhYcHWlHi2K7j5DZYew4e2uBhQxA3fOuwtphjF0S9ZTnMuM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369648890"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="369648890"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874627394"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:56:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AB3B6122265;
        Tue,  8 Aug 2023 10:56:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qTHZE-00Clsw-0v;
        Tue, 08 Aug 2023 10:55:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v3 09/10] media: Add media bus codes for MIPI CCS embedded data
Date:   Tue,  8 Aug 2023 10:55:37 +0300
Message-Id: <20230808075538.3043934-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new MIPI CCS embedded data media bus formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         | 10 +++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c615da08502d..5d5407738af9 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8491,3 +8491,35 @@ and finally the bit number in subscript. "p" indicates a padding bit.
       - p
       - p
       - p
+
+MIPI CCS Embedded Data Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines an
+metadata format for sensor embedded data, which is used to store the register
+configuration used for capturing a given frame. The format is defined in the CCS
+specification.
+
+The bit depth of the CCS embedded data matches the pixel data bit depth
+configured on the sensor. The formats used and their corresponding generic
+formats are listed in the table below.
+
+.. flat-table: CCS embedded data mbus formats and corresponding generic formats
+    :header-rows: 1
+
+    * - CCS embedded data mbus format
+      - Generic metadata format
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_8
+      - MEDIA_BUS_FMT_META_8
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_10
+      - MEDIA_BUS_FMT_META_10
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_12
+      - MEDIA_BUS_FMT_META_12
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_14
+      - MEDIA_BUS_FMT_META_14
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_16
+      - MEDIA_BUS_FMT_META_16
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_20
+      - MEDIA_BUS_FMT_META_20
+    * - MEDIA_BUS_FMT_CCS_EMBEDDED_24
+      - MEDIA_BUS_FMT_META_24
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 2486b4178c5f..31d532446b23 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -182,7 +182,15 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Specific metadata formats. Next is 0x9008. */
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_8		0x9001
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_10		0x9002
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_12		0x9003
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_14		0x9004
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_16		0x9005
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_20		0x9006
+#define MEDIA_BUS_FMT_CCS_EMBEDDED_24		0x9007
+
 #define MEDIA_BUS_FMT_IS_META(code)		\
 	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
-
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2

