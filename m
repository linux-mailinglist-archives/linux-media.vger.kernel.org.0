Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D656F8BAA
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 23:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbjEEVxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 17:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbjEEVxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 17:53:10 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034984ECF
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683323588; x=1714859588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PuBUFxBezyIHCdrKqd1+uqhhvDLY//GiI77j0EPWuxo=;
  b=JXSni1FqptfXaixav7uJzC4mM9mUF33dfM6kkttdDknDaaiFpiQJqbWG
   QxK/UKGWxz9i2I2Mh8xy+k9w4IGxBQdHAvyZ+yng5KZgu5kustbVxB7Zl
   e+vhEbmHgvWFT8IMc4XX36aHRCfm9b4BZXB7PTvE2V5bkiUZ/6MbJ2RoP
   h2PpoJZ2nS9DcyMf9vhlNKTKHiDMRnm7iMKUs0s16wxCxab1i/xBlgJht
   dl2fD6ldkrzJb+1KVbLu7nAcNym+cTtvARzY5O05JKXK0AQzXcIXBYXAS
   cmGZpZW1biGftZSWOYMNYnmxG4Akg+vyp+H1j4K/ffJNqrzu/jgS5lC7Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328925850"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="328925850"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700626155"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700626155"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:07 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C2B3212244C;
        Sat,  6 May 2023 00:53:04 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [RFC 7/7] media: v4l: Support line-based metadata capture
Date:   Sat,  6 May 2023 00:52:57 +0300
Message-Id: <20230505215257.60704-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

many camera sensors, among other devices, transmit embedded data and image
data for each CSI-2 frame. This embedded data typically contains register
configuration of the sensor that has been used to capture the image data
of the same frame.

The embedded data is received by the CSI-2 receiver and has the same
properties as the image data, including that it is line based: it has
width, height and bytesperline (stride).

Add these fields to struct v4l2_meta_format and document them.

Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
line-based i.e. these fields of struct v4l2_meta_format are valid for it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-meta.rst          | 15 +++++++++++++++
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst   |  7 +++++++
 include/uapi/linux/videodev2.h                    | 10 ++++++++++
 3 files changed, 32 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
index 0e7e1ee1471a..7d3a64514db0 100644
--- a/Documentation/userspace-api/media/v4l/dev-meta.rst
+++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
@@ -65,3 +65,18 @@ to 0.
       - ``buffersize``
       - Maximum buffer size in bytes required for data. The value is set by the
         driver.
+    * - __u32
+      - ``width``
+      - Width of a line of metadata in bytes. Valid when :c:type`v4l2_fmtdesc`
+	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
+	:c:func:`VIDIOC_ENUM_FMT`.
+    * - __u32
+      - ``height``
+      - Height of a line of metadata in bytes. Valid when :c:type`v4l2_fmtdesc`
+	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
+	:c:func:`VIDIOC_ENUM_FMT`.
+    * - __u32
+      - ``bytesperlines``
+      - Offset in bytes between the beginning of two consecutive lines. Valid
+	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
+	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 000c154b0f98..6d7664345a4e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
 	The application can ask to configure the quantization of the capture
 	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
 	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
+      - 0x0200
+      - The metadata format is line-based. In this case the ``width``,
+	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
+	valid. The buffer consists of ``height`` lines, each having ``width``
+	bytes of data and offset between the beginning of each two consecutive
+	lines is ``bytesperline``.
 
 Return Value
 ============
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index adcbdc15dcdb..3681b2c15901 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -873,6 +873,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -2407,10 +2408,19 @@ struct v4l2_sdr_format {
  * struct v4l2_meta_format - metadata format definition
  * @dataformat:		little endian four character code (fourcc)
  * @buffersize:		maximum size in bytes required for data
+ * @width:		number of bytes of data per line (valid for line based
+ *			formats only, see format documentation)
+ * @height:		number of lines of data per buffer (valid for line based
+ *			formats only)
+ * @bytesperline:	offset between the beginnings of two adjacent lines in
+ *			bytes (valid for line based formats only)
  */
 struct v4l2_meta_format {
 	__u32				dataformat;
 	__u32				buffersize;
+	__u32				width;
+	__u32				height;
+	__u32				bytesperline;
 } __attribute__ ((packed));
 
 /**
-- 
2.30.2

