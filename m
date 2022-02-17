Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351CF4BA105
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 14:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240747AbiBQNYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 08:24:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbiBQNYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 08:24:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5B8B10BE
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 05:23:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D9600B821A5
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 13:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA130C340E8;
        Thu, 17 Feb 2022 13:23:54 +0000 (UTC)
Message-ID: <4cb9936d-ea10-27f4-371b-69f3b6589689@xs4all.nl>
Date:   Thu, 17 Feb 2022 14:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jammy Huang <jammy_huang@aspeedtech.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Qing Wang <wangqing@vivo.com>, Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit cc74074ad9369ef54ba5d3b45edc28e9677911e7:

  media: i2c: ov08d10: Unlock on error in ov08d10_enum_frame_size() (2022-02-17 10:00:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18l

for you to fetch changes up to 188075b00695808d82d7805df4bae1eedf7fe993:

  media: meson-ir-tx: remove incorrect doc comment (2022-02-17 14:02:12 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: platform: mtk-vcodec: Do not force /dev/videoX node number

Christian Hewitt (1):
      drivers: meson: vdec: add VP9 support to GXM

Colin Ian King (5):
      media: saa7115: make static read-only array lcr2vbi const
      media: gspca: remove redundant assignment of variable n
      media: mtk-jpeg: remove redundant initialization of variable plane_fmt
      media: saa7134: remove redundant assignment to variable id
      media: saa7164: remove redundant assignment to variable idx

Dan Carpenter (1):
      media: usb: go7007: s2250-board: fix leak in probe()

Daniel González Cabanelas (1):
      media: cx88-mpeg: clear interrupt status register before streaming video

Dongliang Mu (1):
      media: em28xx: initialize refcount before kref_get

Gustavo A. R. Silva (1):
      media: usb: pwc-uncompress: Use struct_size() helper in pwc_decompress()

Hans Verkuil (1):
      pixfmt-yuv-planar.rst: fix typo: 'Cr, Cr' -> 'Cr, Cb'

Jammy Huang (5):
      media: aspeed: add comments and macro
      media: aspeed: Add macro for the fields of the mode-detect registers
      media: aspeed: Fix unstable timing detection
      media: aspeed: Use full swing as JFIF to fix incorrect color
      media: aspeed: Use of_device_get_match_data() helper

Jernej Skrabec (3):
      media: cedrus: Add watchdog for job completion
      media: cedrus: H265: Fix neighbour info buffer size
      media: cedrus: h264: Fix neighbour info buffer size

Julia Lawall (2):
      media: cx18: use GFP_KERNEL
      media: fsl-viu: use GFP_KERNEL

Mikhail Rudenko (1):
      media: sun6i-csi: fix colorspace in sun6i_video_try_fmt()

Ming Qian (2):
      media: imx-jpeg: fix a bug of accessing array out of bounds
      media: imx-jpeg: Set V4L2_BUF_FLAG_LAST at eos

Niklas Söderlund (3):
      media: rcar-vin: Refactor link notify
      media: rcar-vin: Breakout media link creation
      media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP

Rikard Falkeborn (1):
      media: go7007: Constify static struct snd_device_ops

Sean Young (1):
      media: meson-ir-tx: remove incorrect doc comment

Wang Qing (5):
      media: si21xx: use time_is_before_jiffies() instead of open coding it
      media: stv0299: use time_is_before_jiffies() instead of open coding it
      media: tda8083: use time_is_after_jiffies() instead of open coding it
      media: wl128x: use time_is_before_jiffies() instead of open coding it
      media: vivid: use time_is_after_jiffies() instead of open coding it

Xose Vazquez Perez (1):
      stkwebcam: add new Asus laptop to upside_down table

Yang Li (2):
      media: aspeed: Remove duplicated include in aspeed-video.c
      media: imx-jpeg: Remove unnecessary print function dev_err()

Yunfei Dong (1):
      media: uapi: Init VP9 stateless decode params

 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |  10 +-
 drivers/media/dvb-frontends/si21xx.c                        |   2 +-
 drivers/media/dvb-frontends/stv0299.c                       |   4 +-
 drivers/media/dvb-frontends/tda8083.c                       |   2 +-
 drivers/media/i2c/saa7115.c                                 |   2 +-
 drivers/media/pci/cx18/cx18-driver.c                        |   2 +-
 drivers/media/pci/cx88/cx88-mpeg.c                          |   3 +
 drivers/media/pci/saa7134/saa7134-video.c                   |   2 -
 drivers/media/pci/saa7164/saa7164-cmd.c                     |   1 -
 drivers/media/platform/aspeed-video.c                       |  86 +++++++++++--
 drivers/media/platform/fsl-viu.c                            |   2 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c                  |  41 ++++++-
 drivers/media/platform/imx-jpeg/mxc-jpeg.h                  |   1 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c             |   2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c      |  27 ++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c      |   2 +-
 drivers/media/platform/rcar-vin/rcar-core.c                 | 387 +++++++++++++++++------------------------------------------
 drivers/media/platform/rcar-vin/rcar-csi2.c                 |  57 ++++++++-
 drivers/media/platform/rcar-vin/rcar-dma.c                  |   2 +-
 drivers/media/platform/rcar-vin/rcar-vin.h                  |  18 +--
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c        |   6 +-
 drivers/media/radio/wl128x/fmdrv_common.c                   |   3 +-
 drivers/media/rc/meson-ir-tx.c                              |   2 +-
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c        |   3 +-
 drivers/media/test-drivers/vivid/vivid-kthread-out.c        |   3 +-
 drivers/media/test-drivers/vivid/vivid-kthread-touch.c      |   3 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c            |   3 +-
 drivers/media/usb/em28xx/em28xx-cards.c                     |   8 +-
 drivers/media/usb/go7007/s2250-board.c                      |  10 +-
 drivers/media/usb/go7007/snd-go7007.c                       |   2 +-
 drivers/media/usb/gspca/pac7302.c                           |   1 -
 drivers/media/usb/pwc/pwc-uncompress.c                      |   2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c                    |   7 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                   |   8 ++
 drivers/staging/media/meson/vdec/vdec_platform.c            |  12 ++
 drivers/staging/media/sunxi/cedrus/cedrus.c                 |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus.h                 |   3 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c             |   4 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c            |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c            |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c              |  25 ++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h              |   2 +
 42 files changed, 403 insertions(+), 363 deletions(-)
