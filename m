Return-Path: <linux-media+bounces-16809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9DE95F255
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99857B217E5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D8A17BEA1;
	Mon, 26 Aug 2024 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdRW4S8l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1951E519;
	Mon, 26 Aug 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677498; cv=none; b=DAzHzmqlIfBm2WmptFyIEqIVtNnW9ppunbg3ABY2uC7OwQggLdt5IPmWeR+8/dMAaLk0Re02F+uY58P4lfnge2tUVbe82JCg0gnbw5l4TaSiRCJJIDovEaETrDPRbU6cY51jJke4UxOJqrdZCEYgmFmNGOIe44ZPQ6Xre0Aeq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677498; c=relaxed/simple;
	bh=BhEgjFc9NXhQffGqP/J/E4Mmj/rFv807sRpr3uVxgpA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eQR44oPdCHtQRA+hCzovCH8d/9TbHvWef77nnzDvczO2jjUHilP9bcVbNtuYRdfk/b+IEniNauyAe9qgYpyRieOEeO+E5XddBG2j+jgiZmt/MgYmJtuIGkFb7uCa+V5zkLzjqQrNGPkw4z6upyvNQm7wzCejpj4p7zVvKEIJ63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdRW4S8l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724677497; x=1756213497;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BhEgjFc9NXhQffGqP/J/E4Mmj/rFv807sRpr3uVxgpA=;
  b=jdRW4S8lPX7gZ74yjaFMIAbOoBJlOxhjZESOfn5H+Tbh3xX1WcSYnSwt
   55aVbtmU/gs0gf2KF2dYj2hTh3TKAHW2ZW37uXcuG2OSoXro4R0rtm7ip
   pbi2WjoyaeRL8g68A+Kwde+4GJaXMdF+IKylvIb7UNxptksJyQNwZaczt
   v+rAh4lAxoB+dIB8JYbiJ5i2tQtARTeZCnt9+uW/RXhBjiWl1I9kALpGW
   QflOKKyGETVPLkZWTInY0M6fyMWimgqDzOZkqRMOZjO9wLJ1pMCxLAapb
   hzjyVdg+5TysYc6PrJRA7cDiR+IXikX5jCMlcDPyNI7C8m3PLjjVSWMM3
   Q==;
X-CSE-ConnectionGUID: MG4lRH2SQ/iKyeBivibMTA==
X-CSE-MsgGUID: vccGpQ/yRiOkfkk64M+/Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22966203"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22966203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:04:56 -0700
X-CSE-ConnectionGUID: iVyaQ6i9SeKGp0tCg0vc5w==
X-CSE-MsgGUID: nUp855TQSYCOaqCJIdRQWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="63038816"
Received: from ubuntu24.iil.intel.com ([143.185.122.15])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:04:54 -0700
Message-ID: <568efbd75290e286b8ad9e7347b5f43745121020.camel@intel.com>
Subject: [PATCH 1/2] v4l: Add luma 16-bit interlaced pixel format
From: Dmitry Perchanov <dmitry.perchanov@intel.com>
To: linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 sakari.ailus@iki.fi,  demisrael@gmail.com, gregkh@linuxfoundation.org
Date: Mon, 26 Aug 2024 16:04:23 +0300
In-Reply-To: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
References: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The formats added by this patch are:

        V4L2_PIX_FMT_Y16I

Interlaced lumina format primary use in RealSense
Depth cameras with stereo stream for left and right
image sensors.

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
---
 .../userspace-api/media/v4l/pixfmt-y16i.rst   | 74 +++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 4 files changed, 77 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Docume=
ntation/userspace-api/media/v4l/pixfmt-y16i.rst
new file mode 100644
index 000000000000..fe4f441cd63c
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
@@ -0,0 +1,74 @@
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
+in a 16-bit word in the little-endian order.
+The first pixel is from the left source.
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
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core=
/v4l2-ioctl.c
index 5eb4d797d259..4fffa5739895 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1327,6 +1327,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt=
)
 	case V4L2_PIX_FMT_Y14P:		descr =3D "14-bit Greyscale (MIPI Packed)"; brea=
k;
 	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y16I:		descr =3D "Interleaved 16-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr =3D "16-bit Depth"; break;
 	case V4L2_PIX_FMT_INZI:		descr =3D "Planar 10:16 Greyscale Depth"; break;
 	case V4L2_PIX_FMT_CNF4:		descr =3D "4-bit Depth Confidence (Packed)"; bre=
ak;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.=
h
index 4e91362da6da..46f616e43ad6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -797,6 +797,7 @@ struct v4l2_pix_format {
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
2.43.0



