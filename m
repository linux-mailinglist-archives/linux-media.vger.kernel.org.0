Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B5274436F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbjF3UoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjF3Un6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:58 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DD03C07
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157837; x=1719693837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4gMiUwZY0bZW9YmfgwN4PSttOidZn4uGQM8Cmq2XO8k=;
  b=VSmLqOY1Tn1POTsLIk1TWr2h3Aic3xFCoBDQj50LNwu7tVe03oI36TDH
   j+DW10dCWO2riKJiXH8146rXCNnmva4cFi2MeF19QuTGYrMBAs1ajkwsY
   f3VaJnBzlvq0RbVFbfADqCx5j4AL4EuXMXz35hSJl8HxcM7aQqLglQRSA
   aG6P+i78qEQLMzsVybaAabVEm5Qhu35zO990unmb+JNCFj0Cb/0WDL06e
   yqa28uURfc6awqbd8EsDfuuP+AaOMlbmpKeJ4z0TwDv7MplupjT2Zc5o/
   cWK6xjv65QYeHJzaFm8kfpI3eY0nkAoKvMlg+gsXZ+BVWkukKg63vJ+bo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866733"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866733"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987232"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987232"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 66E9A1207EB;
        Fri, 30 Jun 2023 23:43:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 7/7] media: v4l: Support line-based metadata capture
Date:   Fri, 30 Jun 2023 23:43:38 +0300
Message-Id: <20230630204338.126583-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
 .../media/videodev2.h.rst.exceptions              |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c              |  5 +++--
 include/uapi/linux/videodev2.h                    | 10 ++++++++++
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
index 0e7e1ee1471a..4b24bae6e171 100644
--- a/Documentation/userspace-api/media/v4l/dev-meta.rst
+++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
@@ -65,3 +65,18 @@ to 0.
       - ``buffersize``
       - Maximum buffer size in bytes required for data. The value is set by the
         driver.
+    * - __u32
+      - ``width``
+      - Width of a line of metadata in samples. Valid when :c:type`v4l2_fmtdesc`
+	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
+	:c:func:`VIDIOC_ENUM_FMT`.
+    * - __u32
+      - ``height``
+      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
+	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
+	:c:func:`VIDIOC_ENUM_FMT`.
+    * - __u32
+      - ``bytesperline``
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
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 2a589d34b80e..5d623bf03bc5 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -211,6 +211,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
+replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 7781b0bd3e7d..2c7a7a6059cc 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -343,8 +343,9 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		meta = &p->fmt.meta;
 		pixelformat = meta->dataformat;
-		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
-			&pixelformat, meta->buffersize);
+		pr_cont(", dataformat=%p4cc, buffersize=%u, width=%u, height=%u, bytesperline=%u\n",
+			&pixelformat, meta->buffersize, meta->width,
+			meta->height, meta->bytesperline);
 		break;
 	}
 }
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 13d404699842..7485920f1ac9 100644
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
2.39.2

