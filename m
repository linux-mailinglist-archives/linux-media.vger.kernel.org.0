Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E785839D2
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 09:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbiG1Ht2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 03:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233032AbiG1Ht1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 03:49:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C256861703
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 00:49:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7C4EEB82306
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 07:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE454C43142;
        Thu, 28 Jul 2022 07:49:22 +0000 (UTC)
Message-ID: <0a7d13c2-e263-8f92-f45f-c42412fb1c77@xs4all.nl>
Date:   Thu, 28 Jul 2022 09:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.21] Move hantro driver out of staging
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

Sadly, this didn't make the cut for v5.20, so get it in for v5.21.

Regards,

	Hans

he following changes since commit 485ade76c95ac5ccaa52fee9d712471c9211b989:

  media: hantro: Remove dedicated control documentation (2022-07-27 22:38:47 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.21a

for you to fetch changes up to 547c7ca4a3bb8f176b976778bdc754a7b7b218a3:

  media: destage Hantro VPU driver (2022-07-28 09:41:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (1):
      media: destage Hantro VPU driver

 MAINTAINERS                                                                               | 2 +-
 drivers/media/platform/Kconfig                                                            | 1 +
 drivers/media/platform/Makefile                                                           | 1 +
 drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig                      | 6 +++++-
 drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile                     | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h                     | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c                 | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1.c                  | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_h264_dec.c         | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_mpeg2_dec.c        | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_regs.h             | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_vp8_dec.c          | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2.c                  | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_hevc_dec.c         | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_regs.h             | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_vp9_dec.c          | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_jpeg_enc.c         | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_regs.h             | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h264.c                | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c                | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h                  | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.c                | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.h                | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_mpeg2.c               | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_postproc.c            | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.c                | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.h                | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp8.c                 | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.c                 | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.h                 | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/imx8m_vpu_hw.c               | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c  | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c  | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c   | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_regs.h         | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu_hw.c            | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c            | 0
 drivers/{staging/media/hantro => media/platform/verisilicon}/sunxi_vpu_hw.c               | 0
 drivers/staging/media/Kconfig                                                             | 2 --
 drivers/staging/media/Makefile                                                            | 1 -
 drivers/staging/media/hantro/TODO                                                         | 2 --
 42 files changed, 8 insertions(+), 7 deletions(-)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig (91%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c (100%)
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
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h (100%)
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
