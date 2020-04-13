Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FA91A6D3B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 22:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388376AbgDMU0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 16:26:09 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:21068 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388367AbgDMU0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 16:26:04 -0400
X-Halon-ID: f996a2bb-7dc4-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id f996a2bb-7dc4-11ea-aeed-005056917f90;
        Mon, 13 Apr 2020 22:25:54 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices
Date:   Mon, 13 Apr 2020 22:23:48 +0200
Message-Id: <20200413202351.1359754-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
---
 .../media/uapi/v4l/vidioc-enum-fmt.rst          | 17 ++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c            | 13 +++++++++++--
 include/uapi/linux/videodev2.h                  |  3 ++-
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 8ca6ab701e4ab99c..82792d8e910b2313 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
 formats in preference order, where preferred formats are returned before
 (that is, with lower ``index`` value) less-preferred formats.
 
-.. note::
+If the driver doesn't advertise the ``V4L2_CAP_IO_MC``
+:ref:`device-capabilities <capability>`, applications shall initialize the
+``mbus_code`` field to zero. Drivers shall enumerate all image formats supported
+by the device. The enumerated formats may depend on the active input or output
+of the device.
 
-   After switching input or output the list of enumerated image
-   formats may be different.
+If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`device-capabilities
+<capability>`, applications may initialize the ``mbus_code`` to a valid
+:ref:`v4l2_mbus_pixelcode <media bus format code>`. If the ``mbus_code` field
+is not zero, drivers shall restrict enumeration to only the image formats that
+can produce (for video output devices) or be produced from (for video capture
+devices) that media bus code. Regardless of the value of the ``mbus_code``
+field, the enumerated image formats shall not depend on the active
+configuration of the video device or device pipeline. Enumeration shall
+otherwise operate as previously described.
 
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index afd1f427df557f71..3e7b99fa415222c6 100644
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
 
@@ -1472,12 +1473,20 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_fmtdesc *p = arg;
 	int ret = check_fmt(file, p->type);
+	u32 mbus_code;
 	u32 cap_mask;
 
 	if (ret)
 		return ret;
 	ret = -EINVAL;
 
+	if (p->mbus_code && !(vdev->device_caps & V4L2_CAP_IO_MC))
+		return -EINVAL;
+
+	mbus_code = p->mbus_code;
+	CLEAR_AFTER_FIELD(p, type);
+	p->mbus_code = mbus_code;
+
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
@@ -2757,7 +2766,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
 
 static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
-	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
+	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
 	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
 	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b18f3f7cde31c2e4..c3a1cf1c507f5506 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -784,7 +784,8 @@ struct v4l2_fmtdesc {
 	__u32               flags;
 	__u8		    description[32];   /* Description string */
 	__u32		    pixelformat;       /* Format fourcc      */
-	__u32		    reserved[4];
+	__u32		    mbus_code;		/* Media bus code    */
+	__u32		    reserved[3];
 };
 
 #define V4L2_FMT_FLAG_COMPRESSED		0x0001
-- 
2.26.0

