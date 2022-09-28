Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7172F5EDBA0
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiI1LWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiI1LWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:22:22 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4666CDCE9F
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2903; q=dns/txt; s=iport;
  t=1664364141; x=1665573741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K0hB3FrAm9UEFFG+9U6bPquUkR74iYgbok3BKkLDx/g=;
  b=fbaBo1xiflR9GKPC2pYTwKZ45AMU185ZqKXOvJ3uu4aybLTWO0UtF/kk
   lYtYfkJ9ok+sUMQVkPt2W4voZs2TzhOHvjma2dSlOEVuMmLSYlfbftNu4
   PmzsrLgA4Fb+4+2qY+Gr+PnDvzDLYuFt6SRGD0HSORQOLYjZraX2OXCLB
   A=;
X-IronPort-AV: E=Sophos;i="5.93,352,1654560000"; 
   d="scan'208";a="4178574"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Sep 2022 11:21:16 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 28SBLFem008487;
        Wed, 28 Sep 2022 11:21:15 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v3 2/5] media: docs: Add V4L2_CAP_EDID
Date:   Wed, 28 Sep 2022 13:21:44 +0200
Message-Id: <20220928112147.358745-3-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928112147.358745-1-hljunggr@cisco.com>
References: <20220928112147.358745-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the new edid capability.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 Documentation/userspace-api/media/v4l/biblio.rst      | 11 +++++++++++
 .../userspace-api/media/v4l/vidioc-querycap.rst       | 11 +++++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
 3 files changed, 23 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 9cd18c153d19..5cbe41877a63 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -334,6 +334,17 @@ VESA DMT
 
 :author:    Video Electronics Standards Association (http://www.vesa.org)
 
+.. _vesaeddc:
+
+E-DDC
+====
+
+
+:title:     VESA Enhanced Display Data Channel (E-DDC) Standard
+:subtitle:  Version 1.3
+
+:author:    Video Electronics Standards Association (http://www.vesa.org)
+
 .. _vesaedid:
 
 EDID
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 6c57b8428356..3d11d86d9cbf 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -244,6 +244,17 @@ specification the ioctl returns an ``EINVAL`` error code.
       - 0x01000000
       - The device supports the :c:func:`read()` and/or
 	:c:func:`write()` I/O methods.
+    * - ``V4L2_CAP_EDID``
+      - 0x02000000
+      - The device stores the EDID for a video input, or retrieves the EDID for a video
+        output. It is a standalone EDID device, so no video streaming etc. will take place.
+
+        For a video input this is typically an eeprom that supports the
+        :ref:`VESA Enhanced Display Data Channel Standard <vesaeddc>`. It can be something
+        else as well, for example a micro controller.
+
+        For a video output this is typically read from an external device such as an
+        HDMI splitter accessed by a serial port.
     * - ``V4L2_CAP_STREAMING``
       - 0x04000000
       - The device supports the :ref:`streaming <mmap>` I/O method.
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 9cbb7a0c354a..b1b1127d278c 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -185,6 +185,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
 replace define V4L2_CAP_IO_MC device-capabilities
+replace define V4L2_CAP_EDID device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
-- 
2.37.3

