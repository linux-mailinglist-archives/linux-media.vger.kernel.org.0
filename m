Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 598E257966A
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 11:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbiGSJfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 05:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237125AbiGSJfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 05:35:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F392610F
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 02:34:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0FF6182E
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 09:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4034C341C6;
        Tue, 19 Jul 2022 09:34:57 +0000 (UTC)
Message-ID: <fe899b13-8e1c-4550-4b1a-a2b125e19cc9@xs4all.nl>
Date:   Tue, 19 Jul 2022 11:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] cedrus fix, hantro fixes and destaging
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

Hi Mauro,

This PR has three cedrus/hantro fixes and destages hantro in the final patch.
That last patch just moves code into the new directory and has no other changes.

Ezequiel, I decided to postpone the v3 of the vb2_find_buffer series to 5.21.
It's just an improvement, and the cedrus changes are a bit larger than I'd like
so close to the code freeze. I'd like to have those tested first.

Regards,

	Hans

The following changes since commit 8bd1dbf8d580c425605fb8936309a4e9745a7a95:

  media: rkisp1: debug: Add dump file in debugfs for MI main path registers (2022-07-17 12:34:43 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20m

for you to fetch changes up to 10b516fc3544cc9057495d981e43df3953bd264d:

  hantro: Remove incorrect HEVC SPS validation (2022-07-19 11:14:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (3):
      media: destage Hantro VPU driver
      hantro: Remove dedicated control documentation
      hantro: Remove incorrect HEVC SPS validation

Jernej Skrabec (1):
      media: cedrus: hevc: Add check for invalid timestamp

 Documentation/userspace-api/media/drivers/hantro.rst                                      | 19 -------------------
 Documentation/userspace-api/media/drivers/index.rst                                       |  1 -
 MAINTAINERS                                                                               |  2 +-
 drivers/media/platform/Kconfig                                                            |  1 +
 drivers/media/platform/Makefile                                                           |  1 +
 drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig                      |  6 +++++-
 drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile                     |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h                     |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c                 | 12 ++++++------
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1.c                  |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_h264_dec.c         |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_mpeg2_dec.c        |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_regs.h             |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_vp8_dec.c          |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2.c                  |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_hevc_dec.c         |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_regs.h             |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_vp9_dec.c          |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_jpeg_enc.c         |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_regs.h             |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h264.c                |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c                |  9 +--------
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h                  |  1 -
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.c                |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.h                |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_mpeg2.c               |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_postproc.c            |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.c                |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.h                |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp8.c                 |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.c                 |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.h                 |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/imx8m_vpu_hw.c               |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c  |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c  |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c   |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_regs.h         |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu_hw.c            |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c            |  0
 drivers/{staging/media/hantro => media/platform/verisilicon}/sunxi_vpu_hw.c               |  0
 drivers/staging/media/Kconfig                                                             |  2 --
 drivers/staging/media/Makefile                                                            |  1 -
 drivers/staging/media/hantro/TODO                                                         |  2 --
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                                          |  3 +++
 45 files changed, 18 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig (91%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c (99%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_h264_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_mpeg2_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_vp8_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_hevc_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_vp9_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_jpeg_enc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h264.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c (96%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h (99%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_mpeg2.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_postproc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp8.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/imx8m_vpu_hw.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu_hw.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/sunxi_vpu_hw.c (100%)
 delete mode 100644 drivers/staging/media/hantro/TODO
