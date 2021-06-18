Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E46D3ACBDE
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 15:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFRNRs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 09:17:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44442 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbhFRNRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 09:17:46 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:141f:c87a:873e:7b6f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 772591F448CC;
        Fri, 18 Jun 2021 14:15:34 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/8] Additional features for Hantro HEVC
Date:   Fri, 18 Jun 2021 15:15:18 +0200
Message-Id: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

version 3:
 - Change trace file name to hantro_trace.h

version 2:
 - Fix structure name in ext-ctrls-codec.rst
 - Define the value for compression storage size
 - Add comments about registers usage
 - Add documentation about P010 padding

Basic HEVC support has been added to Hantro driver in this pull request:
https://www.spinics.net/lists/linux-media/msg193744.html

Thanks to that it is now possible to support more features for this driver.

The first patch allow to log the hardware performance per macroblock.
The second patch makes the driver use compressed reference frames to
reduce memory bandwidth consumption.
Patches 3 to 5 allow to decode and produce 10-bits P010 frames.
Patch 6 make usage of G2 post processor to scale down the frames.
Patches 7 and 8 add the support of HEVC scaling matrix by adding a new
control.

All these patches enhance the HEVC support for Hantro (G2) hardware.
Unluckily they almost all touch the same pieces of code, where buffer
size, offset and addresses are set, so they have to be in this order.
They depend of the series pushed in this pull request:
https://www.spinics.net/lists/linux-media/msg193744.html

Benjamin


Benjamin Gaignard (8):
  media: hantro: Trace hevc hw cycles performance register
  media: hantro: Add support of compressed reference buffers
  media: hantro: hevc: Allow 10-bits encoded streams
  media: Add P010 video format
  media: hantro: hevc: Allow to produce 10-bit frames
  media: hantro: enumerate scaled output formats
  media: hevc: Add scaling matrix control
  media: hantro: Add scaling lists feature

 .../media/v4l/ext-ctrls-codec.rst             |  45 +++++
 .../media/v4l/pixfmt-yuv-planar.rst           |  78 +++++++-
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 drivers/media/v4l2-core/v4l2-common.c         |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   6 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/hantro/hantro.h         |   4 +
 drivers/staging/media/hantro/hantro_drv.c     |  32 ++-
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 186 ++++++++++++++++--
 drivers/staging/media/hantro/hantro_g2_regs.h |  12 ++
 drivers/staging/media/hantro/hantro_hevc.c    |  67 ++++++-
 drivers/staging/media/hantro/hantro_hw.h      |   7 +
 drivers/staging/media/hantro/hantro_trace.h   |  39 ++++
 drivers/staging/media/hantro/hantro_v4l2.c    |  10 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |   6 +
 include/media/hevc-ctrls.h                    |  11 ++
 include/uapi/linux/videodev2.h                |   1 +
 18 files changed, 492 insertions(+), 24 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_trace.h

-- 
2.25.1

