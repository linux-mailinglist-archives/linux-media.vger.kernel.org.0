Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6275832E2
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 21:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbiG0TGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 15:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbiG0TGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 15:06:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0484E4E63E
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 11:35:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 833AA61934
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 18:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CFDC433D6;
        Wed, 27 Jul 2022 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658946957;
        bh=2zBowoIrWNpV8hpck32EyYis73Cn2FERtfH8mUvvfc0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NDB8pP1PwRt89H+ZlkEsaGxDHCsqNKZKPOfhBL/UW8yKgWN+4762iYoTLTzczaS9T
         5vSmeOJ0wWdYST/ApZnJi4/PxO15wiPRJhRqcWPVaAh/IBNTgllTcAsCQQORTWwgW6
         bYWE9CEryKUwojEP37Efwkon2TTRC1HP5Hm7GDMC+GhsvacoYSpOchDWq553/bXwsx
         c5ZgM6HHiPcuOBdKbm7qy4Zi3K1fCrDGNMzUC1zeT3whprSx+Sn7nm3FYSvN+3NJ3e
         bkTUEmexOdCsGQGvcjNuaAl25u3MEaQ6NOLJ6XbrG/LG9Fl+oMaO27aidIZjt6Ssl4
         tfL8NLAmcBIBQ==
Date:   Wed, 27 Jul 2022 20:35:51 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [GIT PULL FOR v5.20] cedrus fix, hantro fixes and destaging
Message-ID: <20220727203551.32901319@coco.lan>
In-Reply-To: <fe899b13-8e1c-4550-4b1a-a2b125e19cc9@xs4all.nl>
References: <fe899b13-8e1c-4550-4b1a-a2b125e19cc9@xs4all.nl>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 19 Jul 2022 11:34:55 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Mauro,
> 
> This PR has three cedrus/hantro fixes and destages hantro in the final patch.
> That last patch just moves code into the new directory and has no other changes.
> 
> Ezequiel, I decided to postpone the v3 of the vb2_find_buffer series to 5.21.
> It's just an improvement, and the cedrus changes are a bit larger than I'd like
> so close to the code freeze. I'd like to have those tested first.

It sounds too late to merge it for the upcoming merge window.

So, I applied only patch 1/4:

	media: cedrus: hevc: Add check for invalid timestamp

Let's merge the remaining ones after -rc1.

Regards,
Mauro

> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 8bd1dbf8d580c425605fb8936309a4e9745a7a95:
> 
>   media: rkisp1: debug: Add dump file in debugfs for MI main path registers (2022-07-17 12:34:43 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.20m
> 
> for you to fetch changes up to 10b516fc3544cc9057495d981e43df3953bd264d:
> 
>   hantro: Remove incorrect HEVC SPS validation (2022-07-19 11:14:41 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Ezequiel Garcia (3):
>       media: destage Hantro VPU driver
>       hantro: Remove dedicated control documentation
>       hantro: Remove incorrect HEVC SPS validation
> 
> Jernej Skrabec (1):
>       media: cedrus: hevc: Add check for invalid timestamp
> 
>  Documentation/userspace-api/media/drivers/hantro.rst                                      | 19 -------------------
>  Documentation/userspace-api/media/drivers/index.rst                                       |  1 -
>  MAINTAINERS                                                                               |  2 +-
>  drivers/media/platform/Kconfig                                                            |  1 +
>  drivers/media/platform/Makefile                                                           |  1 +
>  drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig                      |  6 +++++-
>  drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile                     |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h                     |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c                 | 12 ++++++------
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1.c                  |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_h264_dec.c         |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_mpeg2_dec.c        |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_regs.h             |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_vp8_dec.c          |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2.c                  |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_hevc_dec.c         |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_regs.h             |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_vp9_dec.c          |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_jpeg_enc.c         |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_regs.h             |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h264.c                |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c                |  9 +--------
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h                  |  1 -
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.c                |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.h                |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_mpeg2.c               |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_postproc.c            |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.c                |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.h                |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp8.c                 |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.c                 |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.h                 |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/imx8m_vpu_hw.c               |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c  |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c  |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c   |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_regs.h         |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu_hw.c            |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c            |  0
>  drivers/{staging/media/hantro => media/platform/verisilicon}/sunxi_vpu_hw.c               |  0
>  drivers/staging/media/Kconfig                                                             |  2 --
>  drivers/staging/media/Makefile                                                            |  1 -
>  drivers/staging/media/hantro/TODO                                                         |  2 --
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c                                          |  3 +++
>  45 files changed, 18 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig (91%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c (99%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_h264_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_mpeg2_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_regs.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_vp8_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_hevc_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_regs.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_vp9_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_jpeg_enc.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_regs.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h264.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c (96%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h (99%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_mpeg2.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_postproc.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp8.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/imx8m_vpu_hw.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_regs.h (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu_hw.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c (100%)
>  rename drivers/{staging/media/hantro => media/platform/verisilicon}/sunxi_vpu_hw.c (100%)
>  delete mode 100644 drivers/staging/media/hantro/TODO



Thanks,
Mauro
