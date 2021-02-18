Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A4831F042
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 20:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhBRToh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 14:44:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42418 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234286AbhBRTTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 14:19:39 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D94251F417F7;
        Thu, 18 Feb 2021 19:18:52 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/9] Add HANTRO G2/HEVC decoder support for IMX8MQ
Date:   Thu, 18 Feb 2021 20:18:35 +0100
Message-Id: <20210218191844.297869-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX8MQ got two VPUs but until now only G1 has been enabled.
This series aim to add the second VPU (aka G2) and provide basic 
HEVC decoding support.

To be able to decode HEVC it is needed to add/update some of the
structures in the uapi. In addition of them one HANTRO dedicated
control is required to inform the driver of the numbre of bits to skip
at the beginning of the slice header.
The hardware require to allocate few auxiliary buffers to store the
references frame or tile size data.

The driver has been tested with fluster test suite stream.
For example with this command: ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0
 
This series depends of the reset rework posted here: https://www.spinics.net/lists/arm-kernel/msg875766.html

Finally the both VPUs will have a node the device-tree and be
independent from v4l2 point of view.

A branch with all the dev is available here:
https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/upstream_g2_v2

version 2:
- remove all change related to scaling
- squash commits to a coherent split
- be more verbose about the added fields
- fix the comments done by Ezequiel about dma_alloc_coherent usage
- fix Dan's comments about control copy, reverse the test logic
in tile_buffer_reallocate, rework some goto and return cases.
- be more verbose about why I change the bindings
- remove all sign-off expect mime since it is confusing
- remove useless clocks in VPUs nodes

Benjamin

Benjamin Gaignard (9):
  media: hevc: Modify structures to follow H265 ITU spec
  media: hantro: Define HEVC codec profiles and supported features
  media: hantro: Add a field to distinguish the hardware versions
  media: uapi: Add a control for HANTRO driver
  media: hantro: Introduce G2/HEVC decoder
  media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
  media: hantro: IMX8M: add variant for G2/HEVC codec
  dt-bindings: media: nxp,imx8mq-vpu: Update bindings
  arm64: dts: imx8mq: Add node to G2 hardware

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  54 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  41 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  26 +-
 drivers/staging/media/hantro/Makefile         |   2 +
 drivers/staging/media/hantro/hantro.h         |  34 +-
 drivers/staging/media/hantro/hantro_drv.c     | 103 +++
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++
 drivers/staging/media/hantro/hantro_hevc.c    | 321 ++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  48 ++
 .../staging/media/hantro/hantro_postproc.c    |  17 +
 drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  95 ++-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |   6 +-
 include/media/hevc-ctrls.h                    |  45 +-
 include/uapi/linux/hantro-v4l2-controls.h     |  20 +
 include/uapi/linux/v4l2-controls.h            |   5 +
 20 files changed, 1557 insertions(+), 55 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
 create mode 100644 include/uapi/linux/hantro-v4l2-controls.h

-- 
2.25.1

