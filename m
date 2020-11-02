Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE09C2A36AB
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgKBWly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBWly (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:41:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4E8C0617A6
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 14:41:54 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81F9C583;
        Mon,  2 Nov 2020 23:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356912;
        bh=L0IpfKQX4upxa/1p3zEWUsGM+GF9YXBj4MhJ0rXKrhU=;
        h=From:To:Cc:Subject:Date:From;
        b=A5AH3lvVxLIUaYAyAFPWf0s6LHREITIiCAvvv1LIhgvF7s2WcnO3u3SR3tBEcPHKS
         BN7pns4IeyHlTRRb00xHeNFpW66r7XWyYY6Jwh5eeDKuMrVO3zYiOwZ/nAUPeK+doj
         V3PQa/7IxOORHiJQiqmRX3PjIlL8aaSVR6egTgk8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 00/19] media: Add new pixel formats for Xilinx v-frmbuf
Date:   Tue,  3 Nov 2020 00:40:43 +0200
Message-Id: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a set of new pixel formats needed for the Xilinx
Video Frame Buffer Read/Write IP cores (see [1]).

Compared to v1, the series has been extended to include semi-planar YUV
formats. The code is now based on v5.10-rc2, which uses SPDX license
headers for the media documentation, so new files have been switched to
do so as well. Review comments have also been incorported, thank you
Hans and Nicolas for providing feedback on v1.

Documentation of the pixel formats has grown organically in V4L2, and
while it is fairly complete and detailed, it also duplicates lots of
information. I've thus decided to bite the bullet, and try to
consolidate the documentation first before adding new formats.

The first three patches address minor issues in videodev2.h, removing a
comment that belongs to a commit message instead (01/19) and moving two
misplaced formats to where they belong (02/19 and 03/19).

The next three patches refactor documentation for the RGB formats. Patch
04/19 removes a confusing table (that likely made sense when it was
added, but not anymore), 05/19 adds a section title for the deprecated
RGB formats to increase clarity, and patch 06/19 documents the naming
scheme followed by our RGB formats. There are two separate naming
schemes, used by 8- and 16-bit formats on one side, and 24- and 32-bit
formats on the other side. The former matches the naming conventions of
DRM, while the latter doesn't, which has often led to confusion and
errors. This can't be changed, but it's now clearly documented.

Patches 07/19 then moves to the RGB formats, adding extra documentation
about chroma subsampling. Patch 08/19 moves all the packed YUV formats
to the file that carries that title, as documenting "Packed YUV formats"
and UYVY/VYUY/YUYV/YVYU is confusing and can only be explained by
historical reasons. These changes allow consolidating duplicated
documentation that was copied in multiple files.

Patch 09/19 makes the packed YUV table a bit less confusing by adding
'-' characters to denote padding bits instead of leaving the
corresponding cells blank. Patch 10/19 then consolidates the packed YUV
4:4:4 format documentation in a more compact way, increasing readability
by avoiding too wide tables. Patch 11/19 explains the packed YUV format
naming scheme, similarly to what has been done for RGB formats earlier
in the series.

Next come the luma-only, semi-planar and planar YUV formats. Patches
12/19, 13/19 and 14/19 consolidate them respectively in one file for the
luma formats and one file for the planar and semi-planar formats,
documenting them in consolidated tables. Navigation of the documentation
becomes simpler as a result.

Finally, patches 15/19 to 19/19 add new pixel formats needed by the Xilinx
v-frmbuf.

There are a few 4CC names that I'm not entirely sure about:

- In patches 15/19 and 17/19, an alternative would be to separate the
  number of bits per component using underscores. For instance,
  V4L2_PIX_FMT_X2B10G10R10 would become V4L2_PIX_FMT_XBGR_2_10_10_10.

- In patch 18/19, the Y10X and Y12X names are quite ad-hoc. Clearer
  names could be useful to better describe the formats. For instance,
  Y10X, which correspond to 10-bit Y packed with 3 pixels in 4 bytes
  with 2 bits of padding could become Y10_3P_4B. Better alternatives are
  welcome.

- Similarly, in patch 19/19, a better naming scheme may be possible for
  the NV formats.

[1] https://www.xilinx.com/support/documentation/ip_documentation/v_frmbuf/v2_1/pg278-v-frmbuf.pdf

Laurent Pinchart (19):
  media: videodev2.h: Remove unneeded comment about 4CC value
  media: videodev2.h: Move HI240 format to vendor-specific section
  media: videodev2.h: Move HM12 format to YUV semi-planar section
  media: doc: pixfmt-rgb: Remove layout table for packed RGB formats
  media: doc: pixfmt-rgb: Add title for deprecated formats
  media: doc: pixfmt-rgb: Clarify naming scheme for RGB formats
  media: doc: pixfmt-yuv: Document subsampling in more details
  media: doc: pixfmt-yuv: Move all packed YUV formats to common file
  media: doc: pixfmt-packed-yuv: Fill padding bits with '-'
  media: doc: pixfmt-packed-yuv: Express 4:4:4 formats in a more compact
    way
  media: doc: pixfmt-packed-yuv: Clarify naming scheme for 4:4:4 formats
  media: doc: pixfmt-yuv: Move all luma-only YUV formats to common file
  media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common
    file
  media: doc: pixfmt-yuv: Move all planar YUV formats to common file
  media: v4l2: Add 10-, 12- and 16-bpc BGR formats
  media: v4l2: Add a few missing packed YUV 4:4:4 formats
  media: v4l2: Add 10-, 12- and 16-bpc 4:4:4 packed VUY formats
  media: v4l2: Add 10- and 12-bpc luma-only formats with linear packing
  media: v4l2: Add 10-, 12- and 16-bpc 4:2:0 and 4:2:2 semi-planar YUV
    formats

 .../userspace-api/media/v4l/pixfmt-grey.rst   |   44 -
 .../userspace-api/media/v4l/pixfmt-m420.rst   |   59 +-
 .../userspace-api/media/v4l/pixfmt-nv12.rst   |  129 --
 .../userspace-api/media/v4l/pixfmt-nv12m.rst  |  144 --
 .../userspace-api/media/v4l/pixfmt-nv12mt.rst |   60 -
 .../userspace-api/media/v4l/pixfmt-nv16.rst   |  153 --
 .../userspace-api/media/v4l/pixfmt-nv16m.rst  |  157 --
 .../userspace-api/media/v4l/pixfmt-nv24.rst   |   95 --
 .../media/v4l/pixfmt-packed-yuv.rst           |  505 +++---
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |  315 ++--
 .../userspace-api/media/v4l/pixfmt-uyvy.rst   |  110 --
 .../userspace-api/media/v4l/pixfmt-vyuy.rst   |  108 --
 .../userspace-api/media/v4l/pixfmt-y10.rst    |   65 -
 .../userspace-api/media/v4l/pixfmt-y10b.rst   |   33 -
 .../userspace-api/media/v4l/pixfmt-y10p.rst   |   43 -
 .../userspace-api/media/v4l/pixfmt-y12.rst    |   65 -
 .../userspace-api/media/v4l/pixfmt-y14.rst    |   65 -
 .../userspace-api/media/v4l/pixfmt-y16-be.rst |   69 -
 .../userspace-api/media/v4l/pixfmt-y16.rst    |   69 -
 .../userspace-api/media/v4l/pixfmt-y41p.rst   |  151 --
 .../media/v4l/pixfmt-yuv-luma.rst             |  149 ++
 .../media/v4l/pixfmt-yuv-planar.rst           | 1512 +++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-yuv410.rst |  127 --
 .../media/v4l/pixfmt-yuv411p.rst              |  115 --
 .../userspace-api/media/v4l/pixfmt-yuv420.rst |  143 --
 .../media/v4l/pixfmt-yuv420m.rst              |  152 --
 .../media/v4l/pixfmt-yuv422m.rst              |  141 --
 .../media/v4l/pixfmt-yuv422p.rst              |  129 --
 .../media/v4l/pixfmt-yuv444m.rst              |  141 --
 .../userspace-api/media/v4l/pixfmt-yuyv.rst   |  118 --
 .../userspace-api/media/v4l/pixfmt-yvyu.rst   |  108 --
 .../userspace-api/media/v4l/yuv-formats.rst   |  278 ++-
 include/uapi/linux/videodev2.h                |   39 +-
 33 files changed, 2425 insertions(+), 3166 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-grey.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst

-- 
Regards,

Laurent Pinchart

