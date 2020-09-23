Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EA1274F24
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 04:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgIWCoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 22:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgIWCoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 22:44:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407C0C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 19:44:13 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4CCC555;
        Wed, 23 Sep 2020 04:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600829051;
        bh=8rau1AmPNw6HAgh7XcOtrsWUy3Dq4Di1+ZwZ2Cm2Uag=;
        h=From:To:Cc:Subject:Date:From;
        b=bzyumC9q/50k53cfF1DiPfq3Cd0ptPFXSmVhtyGJrI1mN2r3Gzql52k08xZal4Zqa
         DJYzkulvrYKoLp9UTeAF0x9FZ8aqvj/iloGvWhU6tSNBrocE2/m3COI1f51HI2zHIX
         23ed/01vAyetArKnDagVW49oxF9zH+IbNQHQ+tpk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: [PATCH/RFC 00/16] media: Add new pixel formats for Xilinx v-frmbuf
Date:   Wed, 23 Sep 2020 05:43:17 +0300
Message-Id: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a set of new pixel formats needed for the Xilinx
Video Frame Buffer Read/Write IP cores (see [1]). I've focussed on the
RGB and packed YUV formats so far, the planar YUV formats will follow.

Documentation of the pixel formats has grown organically in V4L2, and
while it is fairly complete and detailed, it also duplicates lots of
information. I've thus decided to bite the bullet, and try to
consolidate the documentation first before adding new formats.

The first three patches address minor issues in videodev2.h, removing a
comment that belongs to a commit message instead (01/16) and moving two
misplaced formats to where they belong (02/16 and 03/16).

The next three patches refactor documentation for the RGB formats. Patch
04/16 removes a confusing table (that likely made sense when it was
added, but not anymore), 05/16 adds a section title for the deprecated
RGB formats to increase clarity, and patch 06/16 documents the naming
scheme followed by our RGB formats. There are two separate naming
schemes, used by 8- and 16-bit formats on one side, and 24- and 32-bit
formats on the other side. The former matches the naming conventions of
DRM, while the latter doesn't, which has often led to confusion and
errors. This can't be changed, but it's now clearly documented.

Patches 07/16 then moves to the RGB formats, adding extra documentation
about chroma subsampling. Patch 08/16 moves all the packed YUV formats
to the file that carries that title, as documenting "Packed YUV formats"
and UYVY/VYUY/YUYV/YVYU is confusing and can only be explained by
historical reasons. These changes allow consolidating duplicated
documentation that was copied in multiple files.

Patch 09/16 makes the packed YUV table a bit less confusing by adding
'-' characters to denote padding bits instead of leaving the
corresponding cells blank. Patch 10/16 then consolidates the packed YUV
4:4:4 format documentation in a more compact way, increasing readability
by avoiding too wide tables. Patch 11/16 explains the packed YUV format
naming scheme, similarly to what has been done for RGB formats earlier
in the series.

Next come the luma-only formats. Patch 12/16 consolidate them in a
single file, documenting them in a single table. Navigation of the
documentation becomes simpler as a result.

Finally, patch 13/16 to 16/16 add new pixel formats needed by the Xilinx
v-frmbuf.

Before addressing the planar YUV formats I would like to receive
feedback on the documentation refactoring, as the semi-planar and planar
formats would in my opinion benefit from a similar cleanup.

[1] https://www.xilinx.com/support/documentation/ip_documentation/v_frmbuf/v2_1/pg278-v-frmbuf.pdf

Laurent Pinchart (16):
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
  media: v4l2: Add 10-, 12- and 16-bpc BGR formats
  media: v4l2: Add a few missing packed YUV 4:4:4 formats
  media: v4l2: Add 10-, 12- and 16-bpc 4:4:4 packed VUY formats
  media: v4l2: Add 10- and 12-bpc luma-only formats with linear packing

 .../userspace-api/media/v4l/pixfmt-grey.rst   |  51 --
 .../userspace-api/media/v4l/pixfmt-m420.rst   |  59 +-
 .../userspace-api/media/v4l/pixfmt-nv12.rst   |  57 +-
 .../userspace-api/media/v4l/pixfmt-nv12m.rst  |  60 +--
 .../userspace-api/media/v4l/pixfmt-nv16.rst   |  73 +--
 .../userspace-api/media/v4l/pixfmt-nv16m.rst  |  73 +--
 .../media/v4l/pixfmt-packed-yuv.rst           | 504 ++++++++++--------
 .../userspace-api/media/v4l/pixfmt-rgb.rst    | 315 +++++++----
 .../userspace-api/media/v4l/pixfmt-uyvy.rst   | 117 ----
 .../userspace-api/media/v4l/pixfmt-vyuy.rst   | 115 ----
 .../userspace-api/media/v4l/pixfmt-y10.rst    |  72 ---
 .../userspace-api/media/v4l/pixfmt-y10b.rst   |  40 --
 .../userspace-api/media/v4l/pixfmt-y10p.rst   |  50 --
 .../userspace-api/media/v4l/pixfmt-y12.rst    |  72 ---
 .../userspace-api/media/v4l/pixfmt-y14.rst    |  72 ---
 .../userspace-api/media/v4l/pixfmt-y16-be.rst |  76 ---
 .../userspace-api/media/v4l/pixfmt-y16.rst    |  76 ---
 .../userspace-api/media/v4l/pixfmt-y41p.rst   | 158 ------
 .../media/v4l/pixfmt-yuv-luma.rst             | 156 ++++++
 .../userspace-api/media/v4l/pixfmt-yuv410.rst |  59 +-
 .../media/v4l/pixfmt-yuv411p.rst              |  39 +-
 .../userspace-api/media/v4l/pixfmt-yuv420.rst |  66 +--
 .../media/v4l/pixfmt-yuv420m.rst              |  66 +--
 .../media/v4l/pixfmt-yuv422m.rst              |  44 +-
 .../media/v4l/pixfmt-yuv422p.rst              |  44 +-
 .../media/v4l/pixfmt-yuv444m.rst              |  33 +-
 .../userspace-api/media/v4l/pixfmt-yuyv.rst   | 125 -----
 .../userspace-api/media/v4l/pixfmt-yvyu.rst   | 115 ----
 .../userspace-api/media/v4l/yuv-formats.rst   | 264 ++++++++-
 include/uapi/linux/videodev2.h                |  27 +-
 30 files changed, 927 insertions(+), 2151 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-grey.rst
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
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst

-- 
Regards,

Laurent Pinchart

