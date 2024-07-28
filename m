Return-Path: <linux-media+bounces-15378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7AB93E497
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 12:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721701F218B5
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 10:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACB529D06;
	Sun, 28 Jul 2024 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyIbL3l6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBC51E4A8
	for <linux-media@vger.kernel.org>; Sun, 28 Jul 2024 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722162964; cv=none; b=Z4qLa4544zWG5ttp9UKlW1JIC9TPqKl35WB7BmQM1HFG5ZzADpmNmKjuCZspIjK6v/1/6acJ+Sv12KiO4d8lESZevit3kolUo48s8o5UEfGPvlTb1TaYSnnYEMUBe6wLMEMEdkegNzXuVXRIEPkV7FFPqPQrlnoC6LqZZm4MLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722162964; c=relaxed/simple;
	bh=Srng1H4kgu5B2K26c1JzD2e7dute+aR55mkJuRjaXk4=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=jR9Ssty9SusW4IxtsD0WeFMPf+U7BJJLTDaNm5G/tJ0Mrt5I+n0uuKimlJ4ZuPv/wX/oxEkW9/TbPBRjBj/ZHmsOmenI054k1J8SiYFN9w/O5M1KVwPlqSv0DmxOcUkDf4Hy7y5ZcQQzvv7IQcELiYnRnF2QSFHPmet4xUdVbxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyIbL3l6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722162963; x=1753698963;
  h=message-id:subject:from:to:cc:date:
   content-transfer-encoding:mime-version;
  bh=Srng1H4kgu5B2K26c1JzD2e7dute+aR55mkJuRjaXk4=;
  b=KyIbL3l6zpv6J7LrLo5FjHIkVBZlc1xwPIUUQwKvPNmHueKWhu46g38k
   gWSGqXPIATawN6kz+PmkiRNA7En3i2C+QxKAwKJG2l3t6ofAlqTGYD9TZ
   0CXMEK+aH/28dTeeiyDBicoba9mlEglaEGkoi2NIQuaTv/S2V9qRIZHmx
   yCGJp2ica7dlVAexxWzVy+y+ZO7BDRilCeNM2ttftlaTgfEstJadTRIKf
   D0qy8/Bk2NYEHarsR1QMl4ucYKMu3twC1oNtjRSJyZMRvQxa2TASyOS/7
   qQu/WMlHr2eD9xpBIVw+t7kaDQ2RwKy0Zvt+rrfsNtrcRQDj1N4dP7gp8
   Q==;
X-CSE-ConnectionGUID: VW3bL5LPRTKWDVgVVbj06g==
X-CSE-MsgGUID: co2Mc38nQVCRNREUa+CfOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="20065095"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="20065095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 03:36:02 -0700
X-CSE-ConnectionGUID: gytMupkFS0mAP3BWdwPeMA==
X-CSE-MsgGUID: P0OeXyPpToeR5irKmy5fWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="58775882"
Received: from foundation.iil.intel.com ([143.185.122.18])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 03:36:01 -0700
Message-ID: <96a65ab833ab160ce2ecac97edb719bfa9fa18ca.camel@intel.com>
Subject: [PATCH] [media] v4l: Add luma 16-bit interlaced pixel format
From: Dmitry Perchanov <dmitry.perchanov@intel.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 sakari.ailus@iki.fi,  demisrael@gmail.com
Date: Sun, 28 Jul 2024 06:35:57 -0400
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The formats added by this patch are:

        V4L2_PIX_FMT_Y16I
        UVC_GUID_FORMAT_Y16I

Interlaced lumina format primary use in RealSense
Depth cameras with stereo stream for left and right
image sensors.

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
---
 .../userspace-api/media/v4l/pixfmt-y16i.rst   | 80 +++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
 drivers/media/common/uvc.c                    |  4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/linux/usb/uvc.h                       |  3 +
 include/uapi/linux/videodev2.h                |  1 +
 6 files changed, 90 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Docume=
ntation/userspace-api/media/v4l/pixfmt-y16i.rst
new file mode 100644
index 000000000000..3303b7832cdb
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _V4L2-PIX-FMT-Y16I:
+
+**************************
+V4L2_PIX_FMT_Y16I ('Y16I')
+**************************
+
+Interleaved grey-scale image, e.g. from a stereo-pair
+
+
+Description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This is a grey-scale image with a depth of 16 bits per pixel, but with
+pixels from 2 sources interleaved and unpacked. Each pixel is stored
+in a 32-bit word in the little-endian order. On a little-endian machine
+these pixels can be deinterlaced using
+
+.. code-block:: c
+
+    __u8 *buf;
+    left0 =3D 0xffff & *(__u16 *)buf;
+    right0 =3D 0xffff & *((__u16 *)buf + 1);
+
+**Pixel unpacked representation.**
+Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - Y'\ :sub:`0L[7:0]`
+      - Y'\ :sub:`0L[15:8]`
+      - Y'\ :sub:`0R[7:0]`
+      - Y'\ :sub:`0R[15:8]`
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00Llow`
+      - Y'\ :sub:`00Lhigh`
+      - Y'\ :sub:`00Rlow`
+      - Y'\ :sub:`00Rhigh`
+      - Y'\ :sub:`01Llow`
+      - Y'\ :sub:`01Lhigh`
+      - Y'\ :sub:`01Rlow`
+      - Y'\ :sub:`01Rhigh`
+    * - start + 8:
+      - Y'\ :sub:`10Llow`
+      - Y'\ :sub:`10Lhigh`
+      - Y'\ :sub:`10Rlow`
+      - Y'\ :sub:`10Rhigh`
+      - Y'\ :sub:`11Llow`
+      - Y'\ :sub:`11Lhigh`
+      - Y'\ :sub:`11Rlow`
+      - Y'\ :sub:`11Rhigh`
+    * - start + 16:
+      - Y'\ :sub:`20Llow`
+      - Y'\ :sub:`20Lhigh`
+      - Y'\ :sub:`20Rlow`
+      - Y'\ :sub:`20Rhigh`
+      - Y'\ :sub:`21Llow`
+      - Y'\ :sub:`21Lhigh`
+      - Y'\ :sub:`21Rlow`
+      - Y'\ :sub:`21Rhigh`
+    * - start + 24:
+      - Y'\ :sub:`30Llow`
+      - Y'\ :sub:`30Lhigh`
+      - Y'\ :sub:`30Rlow`
+      - Y'\ :sub:`30Rhigh`
+      - Y'\ :sub:`31Llow`
+      - Y'\ :sub:`31Lhigh`
+      - Y'\ :sub:`31Rlow`
+      - Y'\ :sub:`31Rhigh`
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Docume=
ntation/userspace-api/media/v4l/yuv-formats.rst
index 24b34cdfa6fe..78ee406d7647 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -269,5 +269,6 @@ image.
     pixfmt-yuv-luma
     pixfmt-y8i
     pixfmt-y12i
+    pixfmt-y16i
     pixfmt-uv8
     pixfmt-m420
diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index 9c0ba7a6c185..246fb6da5903 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -120,6 +120,10 @@ static const struct uvc_format_desc uvc_fmts[] =3D {
 		.guid		=3D UVC_GUID_FORMAT_Y12I,
 		.fcc		=3D V4L2_PIX_FMT_Y12I,
 	},
+	{
+		.guid		=3D UVC_GUID_FORMAT_Y16I,
+		.fcc		=3D V4L2_PIX_FMT_Y16I,
+	},
 	{
 		.guid		=3D UVC_GUID_FORMAT_Z16,
 		.fcc		=3D V4L2_PIX_FMT_Z16,
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core=
/v4l2-ioctl.c
index 6e7b8b682d13..49a17487e196 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1314,6 +1314,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt=
)
 	case V4L2_PIX_FMT_IPU3_Y10:	descr =3D "10-bit greyscale (IPU3 Packed)"; b=
reak;
 	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y16I:		descr =3D "Interleaved 16-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr =3D "16-bit Depth"; break;
 	case V4L2_PIX_FMT_INZI:		descr =3D "Planar 10:16 Greyscale Depth"; break;
 	case V4L2_PIX_FMT_CNF4:		descr =3D "4-bit Depth Confidence (Packed)"; bre=
ak;
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 88d96095bcb1..1c16be20c966 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -118,6 +118,9 @@
 #define UVC_GUID_FORMAT_Y12I \
 	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y16I \
+	{ 'Y',  '1',  '6',  'I', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_Z16 \
 	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.=
h
index a8015e5e7fa4..d152027021d3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -793,6 +793,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C73=
M3 interleaved UYVY/JPEG */
 #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greyscale=
 8-bit L/R interleaved */
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale=
 12-bit L/R interleaved */
+#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greyscale=
 16-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth dat=
a 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek =
compressed block mode  */
 #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek =
8-bit block mode, two non-contiguous planes */
--=20
2.34.1



