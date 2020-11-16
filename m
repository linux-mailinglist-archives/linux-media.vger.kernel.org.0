Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48D12B503C
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgKPSwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbgKPSwT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:52:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59464C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 10:52:19 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7B35A1B;
        Mon, 16 Nov 2020 19:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605552736;
        bh=VFPKqaaWHIkxK1NT3+VrS8MeVGUhHgOvKa/2iQwrhoQ=;
        h=From:To:Cc:Subject:Date:From;
        b=WH3whmpIu4zH9DqchG/zMbj7f9R6qzN7W1+E2YB4oxHlDH/jlAMx1A83cJYWmyT1D
         FaCJ5bBPUhyyCKiY9d/C9Ce+Vo5ykuMP7ndDm9a8ePIoGXENYU4LWJnUxxf1aZrZoc
         KP1ceO23yZQ7V6lXY6XcbKHdOEcEzLPw9k3EYgRA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v3 00/21] media: Add new pixel formats for Xilinx v-frmbuf
Date:   Mon, 16 Nov 2020 20:51:46 +0200
Message-Id: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a set of new pixel formats needed for the Xilinx
Video Frame Buffer Read/Write IP cores (see [1]).

v3 is a minor update of v2, with all review comments taken into account.
Patches 07/21, 08/21 and 11/21 are new.

Documentation of the pixel formats has grown organically in V4L2, and
while it is fairly complete and detailed, it also duplicates lots of
information. I've thus decided to bite the bullet, and try to
consolidate the documentation first before adding new formats.

The first three patches address minor issues in videodev2.h, removing a
comment that belongs to a commit message instead (01/21) and moving two
misplaced formats to where they belong (02/21 and 03/21).

The next five patches refactor documentation for the RGB formats. Patch
04/21 removes a confusing table (that likely made sense when it was
added, but not anymore), 05/21 adds a section title for the deprecated
RGB formats to increase clarity, and patch 06/21 documents the naming
scheme followed by our RGB formats. There are two separate naming
schemes, used by 8- and 16-bit formats on one side, and 24- and 32-bit
formats on the other side. The former matches the naming conventions of
DRM, while the latter doesn't, which has often led to confusion and
errors. This can't be changed, but it's now clearly documented. Patch
07/21 makes the 8bpc formats table more compact, and patch 08/21
replaces '-' with 'x' to denote padding bits.

Patch 09/21 then moves to the RGB formats, adding extra documentation
about chroma subsampling. Patch 10/21 moves all the packed YUV formats
to the file that carries that title, as documenting "Packed YUV formats"
and UYVY/VYUY/YUYV/YVYU is confusing and can only be explained by
historical reasons. These changes allow consolidating duplicated
documentation that was copied in multiple files.

Patch 11/21 makes the packed YUV table a bit less confusing by adding
'X' characters to denote padding bits instead of leaving the
corresponding cells blank. Patch 12/21 then consolidates the packed YUV
4:4:4 format documentation in a more compact way, increasing readability
by avoiding too wide tables. Patch 13/21 explains the packed YUV format
naming scheme, similarly to what has been done for RGB formats earlier
in the series.

Next come the luma-only, semi-planar and planar YUV formats. Patches
14/21, 15/21 and 16/21 consolidate them respectively in one file for the
luma formats and one file for the planar and semi-planar formats,
documenting them in consolidated tables. Navigation of the documentation
becomes simpler as a result.

Finally, patches 17/21 to 21/21 add new pixel formats needed by the Xilinx
v-frmbuf.

There are a few 4CC names that I'm not entirely sure about:

- In patches 17/21 and 19/21, an alternative would be to separate the
  number of bits per component using underscores. For instance,
  V4L2_PIX_FMT_X2B10G10R10 would become V4L2_PIX_FMT_XBGR_2_10_10_10.

- In patch 20/21, the Y10X and Y12X names are quite ad-hoc. Clearer
  names could be useful to better describe the formats. For instance,
  Y10X, which correspond to 10-bit Y packed with 3 pixels in 4 bytes
  with 2 bits of padding could become Y10_3P_4B. Better alternatives are
  welcome.

- Similarly, in patch 21/21, a better naming scheme may be possible for
  the NV formats.

[1] https://www.xilinx.com/support/documentation/ip_documentation/v_frmbuf/v2_1/pg278-v-frmbuf.pdf

Laurent Pinchart (21):
  media: videodev2.h: Remove unneeded comment about 4CC value
  media: videodev2.h: Move HI240 format to vendor-specific section
  media: videodev2.h: Move HM12 format to YUV semi-planar section
  media: doc: pixfmt-rgb: Remove layout table for packed RGB formats
  media: doc: pixfmt-rgb: Add title for deprecated formats
  media: doc: pixfmt-rgb: Clarify naming scheme for RGB formats
  media: doc: pixfmt-rgb: Make 8 bits per component table more compact
  media: doc: pixfmt-rgb: Replace '-' with 'X' to denote padding
  media: doc: pixfmt-yuv: Document subsampling in more details
  media: doc: pixfmt-yuv: Move all packed YUV formats to common file
  media: doc: pixfmt-packed-yuv: Fill padding bits with 'X'
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
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |  749 +++-----
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
 33 files changed, 2487 insertions(+), 3538 deletions(-)
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

