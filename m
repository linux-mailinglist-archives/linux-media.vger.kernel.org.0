Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79EF7E216A
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbjKFM0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjKFM0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:23 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB224F3
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273579; x=1730809579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1eRhR3vdQbwE+zqQIbgaOvRBqmRRrtHraOJQuVIaw5A=;
  b=X2zIOTQG+GdQgZlQTZckVrjL7lijY1YJ8Fu8DvhU5TBF/J3eHasdG+vj
   BIg/FguqwjJ593Eb1AptY/VbwsNoBfOR3z99nUI3vEhfxjQkHyTHR+5Cl
   9vTJsY26SOQFJ9dLS9H90flC34SN0JwnPYInhl1dYWsIJU2B4j5IhL+gZ
   D2bkE8cxlxEiX9fYCoYzdPl7ydbfOGjGGiRN/L7wbLF0DjOFXs9GmTMac
   sp9YFfXypzEWlXs/cU5VuoXPD6j5yT16N2lrifdMByaV0CjnrQAEOtAWm
   EYs3KEfE601OW1q+AWmTNITNQsBLXiBjvj+OOaSo4r6tHPaZtXD4lSGL+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369469699"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369469699"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879427752"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="879427752"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:16 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A6AE1202BB;
        Mon,  6 Nov 2023 14:26:13 +0200 (EET)
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
Subject: [PATCH v7 23/31] media: uapi: ccs: Add media bus code for MIPI CCS embedded data
Date:   Mon,  6 Nov 2023 14:25:31 +0200
Message-Id: <20231106122539.1268265-24-sakari.ailus@linux.intel.com>
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

