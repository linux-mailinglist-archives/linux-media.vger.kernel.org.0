Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992A21B7747
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 15:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgDXNnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 09:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726717AbgDXNnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 09:43:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DC3C09B045;
        Fri, 24 Apr 2020 06:43:51 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31C3D4F7;
        Fri, 24 Apr 2020 15:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587735829;
        bh=7p6WM4syAfD9Bhy1LHRcVn90YBrIr/1MSC7VUbYj7GE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OiCyqtjwLjMOJ7ziJpqAyGsqFZSkz03OXx2tER7P3rXXa5PHwgnw6q3xD0I3GgoMT
         hfCYsJDCu/IFtSkp2oUtwfBw5C6mBH5vovs6Ik3X7Yvh/2DqlTIGRYtaH6oQbGecib
         Wtcbjwk9m6FrF6C2kxMh1LqFz2x+QAhm7A+bgqqs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices
Date:   Fri, 24 Apr 2020 16:43:31 +0300
Message-Id: <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
node. For MC-centric devices, its behaviour has always been ill-defined,
with drivers implementing one of the following behaviours:

- No support for VIDIOC_ENUM_FMT at all
- Enumerating all formats supported by the video node, regardless of the
  configuration of the pipeline
- Enumerating formats supported by the video node for the active
  configuration of the connected subdevice

The first behaviour is obviously useless for applications. The second
behaviour provides the most information, but doesn't offer a way to find
what formats are compatible with a given pipeline configuration. The
third behaviour fixes that, but with the drawback that applications
can't enumerate all supported formats anymore, and have to modify the
active configuration of the pipeline to enumerate formats.

The situation is messy as none of the implemented behaviours are ideal,
and userspace can't predict what will happen as the behaviour is
driver-specific.

To fix this, let's extend the VIDIOC_ENUM_FMT with a missing capability:
enumerating pixel formats for a given media bus code. The media bus code
is passed through the v4l2_fmtdesc structure in a new mbus_code field
(repurposed from the reserved fields). With this capability in place,
applications can enumerate pixel formats for a given media bus code
without modifying the active configuration of the device.

The current behaviour of the ioctl is preserved when the new mbus_code
field is set to 0, ensuring compatibility with existing userspace. The
API extension is documented as mandatory for MC-centric devices (as
advertised through the V4L2_CAP_IO_MC capability), allowing applications
and compliance tools to easily determine the availability of the
VIDIOC_ENUM_FMT extension.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v8:

- Zero the mbus_code field if V4L2_CAP_IO_MC isn't set
- Document the new mbus_code field
- Fix ref tags in documentation
---
 .../media/uapi/v4l/vidioc-enum-fmt.rst        | 25 ++++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          | 13 ++++++++--
 include/uapi/linux/videodev2.h                |  3 ++-
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 8ca6ab701e4a..a987debc7654 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
 formats in preference order, where preferred formats are returned before
 (that is, with lower ``index`` value) less-preferred formats.
 
-.. note::
+If the driver doesn't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
+<device-capabilities>`, applications shall initialize the ``mbus_code`` field
+to zero and drivers shall ignore the value of the field.  Drivers shall
+enumerate all image formats. The enumerated formats may depend on the active
+input or output of the device.
 
-   After switching input or output the list of enumerated image
-   formats may be different.
+If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`capability
+<device-capabilities>`, applications may initialize the ``mbus_code`` field to
+a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. If the
+``mbus_code`` field is not zero, drivers shall restrict enumeration to only the
+image formats that can produce (for video output devices) or be produced from
+(for video capture devices) that media bus code.  Regardless of the value of
+the ``mbus_code`` field, the enumerated image formats shall not depend on the
+active configuration of the video device or device pipeline. Enumeration shall
+otherwise operate as previously described.
 
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -106,7 +117,13 @@ formats in preference order, where preferred formats are returned before
 	   These codes are not the same as those used
 	   in the Windows world.
     * - __u32
-      - ``reserved``\ [4]
+      - ``mbus_code``
+      - Media bus code restricting the enumerated formats, set by the
+        application. Only applicable to drivers that advertise the
+        ``V4L2_CAP_IO_MC`` :ref:`capability <device-capabilities>`, shall be 0
+        otherwise.
+    * - __u32
+      - ``reserved``\ [3]
       - Reserved for future extensions. Drivers must set the array to
 	zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 3545a8adf844..0550f20d7177 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -264,12 +264,13 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
 {
 	const struct v4l2_fmtdesc *p = arg;
 
-	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, description='%.*s'\n",
+	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
 		p->index, prt_names(p->type, v4l2_type_names),
 		p->flags, (p->pixelformat & 0xff),
 		(p->pixelformat >>  8) & 0xff,
 		(p->pixelformat >> 16) & 0xff,
 		(p->pixelformat >> 24) & 0xff,
+		p->mbus_code,
 		(int)sizeof(p->description), p->description);
 }
 
@@ -1467,12 +1468,20 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_fmtdesc *p = arg;
 	int ret = check_fmt(file, p->type);
+	u32 mbus_code;
 	u32 cap_mask;
 
 	if (ret)
 		return ret;
 	ret = -EINVAL;
 
+	if (!(vdev->device_caps & V4L2_CAP_IO_MC))
+		p->mbus_code = 0;
+
+	mbus_code = p->mbus_code;
+	CLEAR_AFTER_FIELD(p, type);
+	p->mbus_code = mbus_code;
+
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
@@ -2752,7 +2761,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
 
 static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
-	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
+	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
 	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
 	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c793263a3705..0ece960844a5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -779,7 +779,8 @@ struct v4l2_fmtdesc {
 	__u32               flags;
 	__u8		    description[32];   /* Description string */
 	__u32		    pixelformat;       /* Format fourcc      */
-	__u32		    reserved[4];
+	__u32		    mbus_code;		/* Media bus code    */
+	__u32		    reserved[3];
 };
 
 #define V4L2_FMT_FLAG_COMPRESSED		0x0001
-- 
Regards,

Laurent Pinchart

