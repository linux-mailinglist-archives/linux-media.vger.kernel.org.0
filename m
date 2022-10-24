Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8CF60B5C0
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 20:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiJXSjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 14:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbiJXSi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 14:38:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A94B157473
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 10:21:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8810C614EE
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 17:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42A0C433C1
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 17:05:33 +0000 (UTC)
Message-ID: <0e1107d2-fdbf-ffa6-7f39-aa8ea1bdfcc1@xs4all.nl>
Date:   Mon, 24 Oct 2022 19:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] Various fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2d

for you to fetch changes up to 16f3211110c86e724a97c00bffc7352ab89fc94c:

  media: saa7164: remove variable cnt (2022-10-24 19:03:54 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andy Shevchenko (1):
      media: c8sectpfe: Add missed header(s)

Colin Ian King (7):
      media: atomisp: Fix spelling mistake "modee" -> "mode"
      media: mxl5005s: Make array RegAddr static const
      media: atomisp: Fix spelling mistake "mis-match" -> "mismatch"
      media: vivid: remove redundant assignment to variable checksum
      media: platform: s5p-mfc: Fix spelling mistake "mmaping" -> "mmapping"
      radio-terratec: Remove variable p
      media: saa7164: remove variable cnt

Dafna Hirschfeld (1):
      media: vimc: Update device configuration in the documentation

Gaosheng Cui (7):
      media: dvb-frontends: remove unused drx_dap_fasi_funct_g declaration
      media: cxd2820r: remove unused cxd2820r_debug declaration
      media: saa7134: remove unused declarations in saa7134.h
      saa7164: remove unused saa7164_call_i2c_clients declaration
      cx25821: remove unused cx25821_video_wakeup() declaration
      bttv: remove unused tea5757_set_freq declaration
      media: zoran: remove unused declarations in zoran_device.h

Hans Verkuil (4):
      videodev2.h: add p_s32 and p_s64 pointers
      vivid: add INTEGER and INTEGER64 test control arrays
      media: meson/vdec: always init coef_node_start
      atomisp: fix potential NULL pointer dereferences

Irui Wang (1):
      media: mediatek: vcodec: Skip unsupported h264 encoder profile

Jernej Skrabec (4):
      media: v4l2-ioctl.c: Unify YCbCr/YUV terms in format descriptions
      media: cedrus: hevc: Fix offset adjustments
      media: cedrus: h265: Associate mv col buffers with buffer
      media: cedrus: h264: Optimize mv col buffer allocation

Jiasheng Jiang (1):
      media: coda: jpeg: Add check for kmalloc

Laurent Pinchart (1):
      media: v4l2-ctrls: Fix off-by-one error in integer menu control check

Liu Shixin (1):
      media: aspeed: use DEFINE_SHOW_ATTRIBUTE to simplify code

Ming Qian (1):
      media: amphion: reset instance if it's aborted before codec header parsed

Mirela Rabulea (1):
      media: imx-jpeg: Fix Coverity issue in probe

Moudy Ho (1):
      media: platform: mtk-mdp3: remove unused VIDEO_MEDIATEK_VPU config

Niklas Söderlund (2):
      media: adv748x: Remove dead function declaration
      media: adv748x: afe: Select input port when initializing AFE

Shang XiaoJing (1):
      media: stm32: dcmi: Remove redundant dev_err call

Yunfei Dong (1):
      media: mediatek: vcodec: fix h264 cavlc bitstream fail

 Documentation/admin-guide/media/vimc.rst                                  |   8 ++--
 drivers/media/dvb-frontends/cxd2820r_priv.h                               |   2 -
 drivers/media/dvb-frontends/drx39xyj/drx_dap_fasi.h                       |   2 -
 drivers/media/i2c/adv748x/adv748x-afe.c                                   |   4 ++
 drivers/media/i2c/adv748x/adv748x.h                                       |   3 --
 drivers/media/pci/bt8xx/bttv.h                                            |   1 -
 drivers/media/pci/cx25821/cx25821-video.h                                 |   3 --
 drivers/media/pci/saa7134/saa7134.h                                       |   4 --
 drivers/media/pci/saa7164/saa7164-core.c                                  |   6 +--
 drivers/media/pci/saa7164/saa7164.h                                       |   2 -
 drivers/media/pci/zoran/zoran_device.h                                    |   2 -
 drivers/media/platform/amphion/vdec.c                                     |  13 ++++--
 drivers/media/platform/aspeed/aspeed-video.c                              |  16 +------
 drivers/media/platform/chips-media/coda-jpeg.c                            |  10 ++++-
 drivers/media/platform/mediatek/mdp3/Kconfig                              |   1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c                   |   5 ++-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c      |  32 ++++++++++++--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                            |   2 +
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                          |   4 +-
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c                  |   8 ++--
 drivers/media/platform/st/stm32/stm32-dcmi.c                              |   4 +-
 drivers/media/radio/radio-terratec.c                                      |   3 --
 drivers/media/test-drivers/vivid/vivid-ctrls.c                            |  28 ++++++++++++
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c                          |   1 -
 drivers/media/tuners/mxl5005s.c                                           |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                 |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                                      |  34 +++++++--------
 drivers/staging/media/atomisp/pci/atomisp_cmd.c                           |  12 +++---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c                  |   2 +-
 drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h |   2 +-
 drivers/staging/media/meson/vdec/codec_vp9.c                              |   3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h                               |  16 +++----
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c                          | 118 +++++++++++++++++++++++++--------------------------
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                          |  88 ++++++++++++++++++++++----------------
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h                          |   2 +
 include/uapi/linux/videodev2.h                                            |   2 +
 36 files changed, 251 insertions(+), 196 deletions(-)
