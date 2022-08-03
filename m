Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DF858885F
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237355AbiHCH6L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 03:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237318AbiHCH6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 03:58:09 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF3F2A43C
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 00:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2742; q=dns/txt; s=iport;
  t=1659513488; x=1660723088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LKY9HUBRz+tuJSsdYJUDPSCHucP72wGgTwKl3py/KGU=;
  b=PlcyDnlze2kCws9nTBP+15MIOqcfnjnbkM+SjdNVsn0vb1U+jVYRxLDD
   zUSQ7FNb0Fo4nxqOBJxkBxaZyzcawv6sYZVic+xIPXFM0HL+DwFxnglHL
   P075NQljRyMB1vTcj1AMCMRZFMKOH7jaWwl5SShk7gpCkHRM14x/WgVEz
   w=;
X-IronPort-AV: E=Sophos;i="5.93,213,1654560000"; 
   d="scan'208";a="3360424"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Aug 2022 07:58:06 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2737w5SA024084;
        Wed, 3 Aug 2022 07:58:06 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v2 2/5] media: docs: Add V4L2_CAP_EDID_MEMORY
Date:   Wed,  3 Aug 2022 09:58:47 +0200
Message-Id: <20220803075850.1196988-3-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803075850.1196988-1-hljunggr@cisco.com>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the new edid eeprom capability.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 Documentation/userspace-api/media/v4l/biblio.rst      | 11 +++++++++++
 .../userspace-api/media/v4l/vidioc-querycap.rst       |  7 +++++++
 .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
 3 files changed, 19 insertions(+)

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
index 63e23f6f95ee..bdb530bd6816 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -173,6 +173,13 @@ specification the ioctl returns an ``EINVAL`` error code.
 	interface. A video overlay device typically stores captured images
 	directly in the video memory of a graphics card, with hardware
 	clipping and scaling.
+    * - ``V4L2_CAP_EDID_MEMORY``
+      - 0x00000008
+      - The device is a standalone EDID memory device. This is typically an eeprom
+        that supports the VESA Enhanced Display Data Channel Standard.
+
+        While an eeprom is the most common implementation, it can be something else
+        as well, such as a microcontroller. Hence the generic name 'memory'.
     * - ``V4L2_CAP_VBI_CAPTURE``
       - 0x00000010
       - The device supports the :ref:`Raw VBI Capture <raw-vbi>`
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 9cbb7a0c354a..12fa290828e7 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -185,6 +185,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
 replace define V4L2_CAP_IO_MC device-capabilities
+replace define V4L2_CAP_EDID_MEMORY device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
-- 
2.37.1

