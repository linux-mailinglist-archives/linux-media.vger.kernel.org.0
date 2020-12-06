Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762D62D07CF
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgLFXEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgLFXEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:04:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6B0C0613D0
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 15:03:27 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08D788D;
        Mon,  7 Dec 2020 00:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607295806;
        bh=XVdpIArv+ElsH2NjoiijiSGAT1EI1s6rvXGfzT1FsmE=;
        h=From:To:Cc:Subject:Date:From;
        b=N7hawi6NvKQ9yxGW+o2arQUCBfW5thLZJzedqwQRiqLsVbvs5WaXLCt9TIQ79xcA+
         g7vwuQ9jlN5NbMEdFTNgRmrB9xzmTp7JWMU+Yg5otsNBo/+0d8xJ+Z/uy+OHa4AFjo
         4l5AMvFBWg4yuTdhqvl2FXGCM9CBw/XY3lj9ZJTk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v4 00/16] media: Rework RGB and YUV pixel formats documentation
Date:   Mon,  7 Dec 2020 01:03:00 +0200
Message-Id: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series reworks the RGB and YUV pixel formats documentation to
make it easier to read and easier to maintain (the only part that isn't
quite easy is reviewing the patches :-)). It was previously part of the
"[PATCH v3 00/21] media: Add new pixel formats for Xilinx v-frmbuf"
([1]) series, and got split out as it can be merged on its own. The
patches have been rebased on top of the latest media master tree, but
are otherwise unchanged.

Documentation of the pixel formats has grown organically in V4L2, and
while it is fairly complete and detailed, it also duplicates lots of
information. I've thus decided to bite the bullet, and try to
consolidate the documentation first before adding new formats.

The first three patches address minor issues in videodev2.h, removing a
comment that belongs to a commit message instead (01/16) and moving two
misplaced formats to where they belong (02/16 and 03/16).

The next five patches refactor documentation for the RGB formats. Patch
04/16 removes a confusing table (that likely made sense when it was
added, but not anymore), 05/16 adds a section title for the deprecated
RGB formats to increase clarity, and patch 06/16 documents the naming
scheme followed by our RGB formats. There are two separate naming
schemes, used by 8- and 16-bit formats on one side, and 24- and 32-bit
formats on the other side. The former matches the naming conventions of
DRM, while the latter doesn't, which has often led to confusion and
errors. This can't be changed, but it's now clearly documented. Patch
07/16 makes the 8bpc formats table more compact, and patch 08/16
replaces '-' with 'x' to denote padding bits.

Patch 09/16 then moves to the RGB formats, adding extra documentation
about chroma subsampling. Patch 10/16 moves all the packed YUV formats
to the file that carries that title, as documenting "Packed YUV formats"
and UYVY/VYUY/YUYV/YVYU is confusing and can only be explained by
historical reasons. These changes allow consolidating duplicated
documentation that was copied in multiple files.

Patch 11/16 makes the packed YUV table a bit less confusing by adding
'X' characters to denote padding bits instead of leaving the
corresponding cells blank. Patch 12/16 then consolidates the packed YUV
4:4:4 format documentation in a more compact way, increasing readability
by avoiding too wide tables. Patch 13/16 explains the packed YUV format
naming scheme, similarly to what has been done for RGB formats earlier
in the series.

Next come the luma-only, semi-planar and planar YUV formats. Patches
14/16, 15/16 and 16/16 consolidate them respectively in one file for the
luma formats and one file for the planar and semi-planar formats,
documenting them in consolidated tables. Navigation of the documentation
becomes simpler as a result.

[1] https://lore.kernel.org/linux-media/20201116185207.13208-1-laurent.pinchart@ideasonboard.com/

Laurent Pinchart (16):
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

 .../userspace-api/media/v4l/pixfmt-grey.rst   |  44 -
 .../userspace-api/media/v4l/pixfmt-m420.rst   |  59 +-
 .../userspace-api/media/v4l/pixfmt-nv12.rst   | 129 ---
 .../userspace-api/media/v4l/pixfmt-nv12m.rst  | 144 ---
 .../userspace-api/media/v4l/pixfmt-nv12mt.rst |  60 --
 .../userspace-api/media/v4l/pixfmt-nv16.rst   | 153 ---
 .../userspace-api/media/v4l/pixfmt-nv16m.rst  | 157 ---
 .../userspace-api/media/v4l/pixfmt-nv24.rst   |  95 --
 .../media/v4l/pixfmt-packed-yuv.rst           | 420 ++++----
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 701 ++++---------
 .../userspace-api/media/v4l/pixfmt-uyvy.rst   | 110 --
 .../userspace-api/media/v4l/pixfmt-vyuy.rst   | 108 --
 .../userspace-api/media/v4l/pixfmt-y10.rst    |  65 --
 .../userspace-api/media/v4l/pixfmt-y10b.rst   |  33 -
 .../userspace-api/media/v4l/pixfmt-y10p.rst   |  43 -
 .../userspace-api/media/v4l/pixfmt-y12.rst    |  65 --
 .../userspace-api/media/v4l/pixfmt-y14.rst    |  65 --
 .../userspace-api/media/v4l/pixfmt-y16-be.rst |  69 --
 .../userspace-api/media/v4l/pixfmt-y16.rst    |  69 --
 .../userspace-api/media/v4l/pixfmt-y41p.rst   | 151 ---
 .../media/v4l/pixfmt-yuv-luma.rst             | 126 +++
 .../media/v4l/pixfmt-yuv-planar.rst           | 950 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-yuv410.rst | 127 ---
 .../media/v4l/pixfmt-yuv411p.rst              | 115 ---
 .../userspace-api/media/v4l/pixfmt-yuv420.rst | 143 ---
 .../media/v4l/pixfmt-yuv420m.rst              | 152 ---
 .../media/v4l/pixfmt-yuv422m.rst              | 141 ---
 .../media/v4l/pixfmt-yuv422p.rst              | 129 ---
 .../media/v4l/pixfmt-yuv444m.rst              | 141 ---
 .../userspace-api/media/v4l/pixfmt-yuyv.rst   | 118 ---
 .../userspace-api/media/v4l/pixfmt-yvyu.rst   | 108 --
 .../userspace-api/media/v4l/yuv-formats.rst   | 278 ++++-
 include/uapi/linux/videodev2.h                |  14 +-
 33 files changed, 1733 insertions(+), 3549 deletions(-)
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

