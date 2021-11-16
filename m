Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7230845345A
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237440AbhKPOlt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:41:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37518 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235830AbhKPOlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id BE7A71F457C7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073528; bh=+b47GQmNziBAW86kZfP3ZEMr86YXBuq7LHFs8idsRUM=;
        h=From:To:Cc:Subject:Date:From;
        b=ksXILFQXJFJW4dwSzYeqcXXOad2SsJRAU0a6yk7qO4OrDoHw5Lf4lwY5CmkSoOVK2
         Nsxfbl7o4EJyudn3nNOliWV45tn5f27Z3YLzCqMctiJ0gyWhCkPt1x3MspRfkt4uNb
         IMIgBpqaBhIna3PRmejxupMVHc37KhJBY86hnVAR7kVTND/TZ9za2yzToJu2rh+ddL
         bG9SRJKLmV2Nd+F2JDu5Gd3Mg3ADWW3sU3RP9btu1ul2q0Hf4rJj6k07RtHbdDGWhE
         8y/EvvwHvGjIU1yeMDR56Q9hN3ep9BVycWT7OloQJ5bvzwrZVt0YBKXXvZqwlVSMVi
         hhk/y7rm7e1NA==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
Subject: [PATCH v8 00/12] VP9 codec V4L2 control interface
Date:   Tue, 16 Nov 2021 15:38:30 +0100
Message-Id: <20211116143842.75896-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

This patch series adds VP9 codec V4L2 control interface and two drivers
using the new controls. It is a follow-up of previous v7 series [1].

In this iteration, we've implemented VP9 hardware decoding on two devices:
Rockchip VDEC and Hantro G2, and tested on RK3399, i.MX8MQ and i.MX8MP.
The i.MX8M driver needs proper power domains support, though, which is a
subject of a different effort, but in all 3 cases we were able to run the
drivers.

GStreamer support is also available, the needed changes have been submitted
by Daniel Almeida [2]. This MR is ready to be merged, and just needs the
VP9 V4L2 controls to be merged and released.

Both rkvdec and hantro drivers are passing a significant number of VP9 tests
using Fluster[3]. There are still a few tests that are not passing, due to
dynamic frame resize (not yet supported by V4L2) and small size videos
(due to IP block limitations).

The series adds the VP9 codec V4L2 control API as uAPI, so it aims at being
merged without passing through staging, as agreed[4]. The ABI has been checked
for padding and verified to contain no holes.

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=6393
[2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/2144
[3] https://github.com/fluendo/fluster
[4] https://lore.kernel.org/linux-media/b8f83c93-67fd-09f5-9314-15746cbfdc61@xs4all.nl/

The series depends on the YUV tiled format support prepared by Ezequiel:
https://www.spinics.net/lists/linux-media/msg197047.html

Rebased onto latest media_stage.

Changes related to v7:

- rebased onto latest media_stage
- added fixes to eliminate sparse/smatch/kernel-doc warnings, including
changes to pre-existing code in PATCH 11/12

Changes related to v6:
- moved setting tile filter and tile bsd auxiliary buffer addresses so
that they are always set, even if no tiles are used (thanks, Jernej)
- added a comment near the place where the 32-bit DMA mask is applied
  (thanks, Nicolas)
- improved consistency in register names (thanks, Nicolas)

Changes related to v5:
- improved the doc comments as per Ezequiel's review (thanks, Ezequiel)
- improved pdf output of documentation
- added Benjamin's Reviewed-by (thanks, Benjamin)

Changes related to v4:
- removed unused enum v4l2_vp9_intra_prediction_mode
- converted remaining enums to defines to follow the convention
- improved the documentation, in particular better documented how to use segmentation 
features

Changes related to v3:

Apply suggestions from Jernej's review (thanks, Jernej):
- renamed a control and two structs:
	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS =>
		V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR
	v4l2_ctrl_vp9_compressed_hdr_probs =>
		v4l2_ctrl_vp9_compressed_hdr
	v4l2_vp9_mv_compressed_hdr_probs => v4l2_vp9_mv_probs
- moved tx_mode to v4l2_ctrl_vp9_compressed_hdr
- fixed enum v4l2_vp9_ref_frame_sign_bias values (which are used to test a bitfield)
- explicitly assigned values to all other vp9 enums

Apply suggestion from Nicolas's review (thanks, Nicolas):
- explicitly stated that the v4l2_ctrl_vp9_compressed_hdr control is optional
and implemented only by drivers which need it

Changes related to the RFC v2:

- added another driver including a postprocessor to de-tile
        codec-specific tiling
- reworked uAPI structs layout to follow VP8 style
- changed validation of loop filter params
- changed validation of segmentation params
- changed validation of VP9 frame params
- removed level lookup array from loop filter struct
        (can be computed by drivers)
- renamed some enum values to match the spec more closely
- V4L2 VP9 library changed the 'eob' member of
        'struct v4l2_vp9_frame_symbol_counts' so that it is an array
        of pointers instead of an array of pointers to arrays
        (IPs such as g2 creatively pass parts of the 'eob' counts in
        the 'coeff' counts)
- factored out several repeated portions of code
- minor nitpicks and cleanups



Andrzej Pietrasiewicz (8):
  media: uapi: Add VP9 stateless decoder controls
  media: Add VP9 v4l2 library
  media: rkvdec: Add the VP9 backend
  media: hantro: Rename registers
  media: hantro: Prepare for other G2 codecs
  media: hantro: Support VP9 on the G2 core
  media: hantro: Staticize a struct in postprocessor code
  media: hantro: Support NV12 on the G2 core

Ezequiel Garcia (4):
  hantro: postproc: Fix motion vector space size
  hantro: postproc: Introduce struct hantro_postproc_ops
  hantro: Simplify postprocessor
  hantro: Add quirk for NV12/NV12_4L4 capture format

 .../userspace-api/media/v4l/biblio.rst        |   10 +
 .../media/v4l/ext-ctrls-codec-stateless.rst   |  573 +++++
 .../media/v4l/pixfmt-compressed.rst           |   15 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |    8 +
 .../media/v4l/vidioc-queryctrl.rst            |   12 +
 .../media/videodev2.h.rst.exceptions          |    2 +
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  180 ++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    8 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-vp9.c            | 1850 +++++++++++++++++
 drivers/staging/media/hantro/Kconfig          |    1 +
 drivers/staging/media/hantro/Makefile         |    7 +-
 drivers/staging/media/hantro/hantro.h         |   40 +-
 drivers/staging/media/hantro/hantro_drv.c     |   23 +-
 drivers/staging/media/hantro/hantro_g2.c      |   27 +
 .../staging/media/hantro/hantro_g2_hevc_dec.c |   71 +-
 drivers/staging/media/hantro/hantro_g2_regs.h |  132 +-
 .../staging/media/hantro/hantro_g2_vp9_dec.c  |  980 +++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  115 +-
 .../staging/media/hantro/hantro_postproc.c    |   81 +-
 drivers/staging/media/hantro/hantro_v4l2.c    |   20 +
 drivers/staging/media/hantro/hantro_vp9.c     |  240 +++
 drivers/staging/media/hantro/hantro_vp9.h     |  103 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |   38 +-
 .../staging/media/hantro/rockchip_vpu_hw.c    |    7 +-
 .../staging/media/hantro/sama5d4_vdec_hw.c    |    3 +-
 drivers/staging/media/rkvdec/Kconfig          |    1 +
 drivers/staging/media/rkvdec/Makefile         |    2 +-
 drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1074 ++++++++++
 drivers/staging/media/rkvdec/rkvdec.c         |   41 +-
 drivers/staging/media/rkvdec/rkvdec.h         |   12 +-
 include/media/v4l2-ctrls.h                    |    4 +
 include/media/v4l2-vp9.h                      |  233 +++
 include/uapi/linux/v4l2-controls.h            |  284 +++
 include/uapi/linux/videodev2.h                |    6 +
 37 files changed, 6104 insertions(+), 105 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-vp9.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp9.h
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
 create mode 100644 include/media/v4l2-vp9.h


base-commit: 96977c97e2c76f48d5e1f28ff5c6cd6f83a91ced
-- 
2.25.1

