Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD78509FAF
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 14:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384622AbiDUMdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 08:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384600AbiDUMdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 08:33:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B627A1A82F
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 05:30:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C50A617EA
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47D3C385A7;
        Thu, 21 Apr 2022 12:30:09 +0000 (UTC)
Message-ID: <b67231da-dcec-f785-02af-da3d5e917127@xs4all.nl>
Date:   Thu, 21 Apr 2022 14:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3d59142ad94cf60b94b3dc94c19fdafa23aec8b1:

  media: dvb-usb: dib0700_devices: use an enum for the device number (2022-04-18 07:36:44 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19c

for you to fetch changes up to 45673acf786798081b438c57b208ffc1f8391638:

  media: hantro: Empty encoder capture buffers by default (2022-04-21 13:58:56 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Chen-Yu Tsai (2):
      media: hantro: Implement support for encoder commands
      media: hantro: Empty encoder capture buffers by default

Colin Ian King (1):
      media: platform: samsung: remove redundant assignment to variable m

Kwang Son (1):
      media: docs: Fix vimc default pipeline graph

Ming Qian (4):
      media: imx-jpeg: Add pm-sleep support for imx-jpeg
      media: imx-jpeg: Correct the pixel format of rgb
      media: imx-jpeg: don't change byteused of queued buffer
      media: amphion: fix decoder's interlaced field

Nicolas Dufresne (2):
      media: coda: Fix reported H264 profile
      media: coda: Add more H264 levels for CODA960

Philipp Zabel (9):
      media: coda: disable encoder cmd ioctl on decoder and vice versa
      media: coda: disable encoder ioctls for decoder devices
      media: coda: disable stateful encoder ioctls for jpeg encoder
      media: coda: assert bitstream mutex is locked in coda_fill_bitstream
      media: coda: consolidate job_finish calls on decoder prepare_run failure
      media: coda: add JPEG downscale support
      media: coda: jpeg: set buffer error flag when header parsing fails
      media: coda: jpeg: improve header parse error message
      media: coda: jpeg: start streaming without valid header

Piotr Oniszczuk (2):
      media: hantro: Add support for Hantro G1 on RK356x
      dt-bindings: media: rockchip-vpu: Add RK3568 compatible

Wan Jiabing (1):
      media: saa7134: simplify if-if to if-else

Yan Lei (1):
      media: v4l2: fix uninitialized value tuner_status(CWE-457)

Zheyu Ma (2):
      media: pci: cx23885: Fix the error handling in cx23885_initdev()
      media: cx25821: Fix the warning when removing the module

 Documentation/admin-guide/media/vimc.dot                  |  14 ++++----
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml |   1 +
 drivers/media/pci/cx23885/cx23885-core.c                  |   6 ++--
 drivers/media/pci/cx25821/cx25821-core.c                  |   2 +-
 drivers/media/pci/saa7134/saa7134-video.c                 |   3 +-
 drivers/media/platform/amphion/vdec.c                     |   2 +-
 drivers/media/platform/chips-media/coda-bit.c             |   4 +--
 drivers/media/platform/chips-media/coda-common.c          | 118 +++++++++++++++++++++++++++++++++----------------------------
 drivers/media/platform/chips-media/coda-jpeg.c            |  24 +++++++------
 drivers/media/platform/chips-media/coda.h                 |   7 ++++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h         |   4 +--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c            |  60 +++++++++++++++++++++----------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h            |   2 +-
 drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-s5p.c     |   1 -
 drivers/media/v4l2-core/tuner-core.c                      |   4 +--
 drivers/staging/media/hantro/hantro_drv.c                 |  18 ++++++++--
 drivers/staging/media/hantro/hantro_hw.h                  |   1 +
 drivers/staging/media/hantro/hantro_v4l2.c                |  67 +++++++++++++++++++++++++++++++++--
 drivers/staging/media/hantro/rockchip_vpu_hw.c            |  14 ++++++++
 19 files changed, 241 insertions(+), 111 deletions(-)
