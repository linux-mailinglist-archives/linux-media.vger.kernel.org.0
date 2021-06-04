Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A138139B96B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFDNId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhFDNId (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:08:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C02C06174A;
        Fri,  4 Jun 2021 06:06:46 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:389:b21e:a7e4:8cad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D471B1F438B6;
        Fri,  4 Jun 2021 14:06:37 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 0/8] Additional features for Hantro HEVC
Date:   Fri,  4 Jun 2021 15:06:11 +0200
Message-Id: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
 .../media/v4l/pixfmt-yuv-planar.rst           |   8 +
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 drivers/media/v4l2-core/v4l2-common.c         |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   6 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/hantro/hantro.h         |   4 +
 drivers/staging/media/hantro/hantro_drv.c     |  32 +++-
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 175 ++++++++++++++++--
 drivers/staging/media/hantro/hantro_g2_regs.h |  12 ++
 drivers/staging/media/hantro/hantro_hevc.c    |  60 +++++-
 drivers/staging/media/hantro/hantro_hw.h      |   7 +
 drivers/staging/media/hantro/hantro_v4l2.c    |  10 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |   6 +
 drivers/staging/media/hantro/trace.h          |  40 ++++
 include/media/hevc-ctrls.h                    |  11 ++
 include/uapi/linux/videodev2.h                |   1 +
 18 files changed, 407 insertions(+), 22 deletions(-)
 create mode 100644 drivers/staging/media/hantro/trace.h

-- 
2.25.1

