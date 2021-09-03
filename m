Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5993FFBC2
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 10:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348278AbhICIUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 04:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348122AbhICITO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 04:19:14 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993F8C061575
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 01:18:14 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id M4OmmMcnqy7WyM4Onm9kQf; Fri, 03 Sep 2021 10:18:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630657091; bh=dFWyimxNsFr/enW3h/FF+ryjDZ9v/9+LHngkVIkCQx0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AR+qh9FEYDxp+5mPc/wnxvszGfIm5qH0LyoBy0MwM6vG7OQ/i3mBywAB9yegyK3io
         yk2MWxwEAZ5A9SAgkxtLU0Y2xChkMXmCQQg038R03+amObW424I3bgrBGuRCmG6/Bk
         2Hrm8FxGixJ/R6TLzO4J2MtZs7Q3HHFD5ZtjORj3B/qcGuFLlQNwLvtuDVplTuhYIx
         NUrWI8QBBKXpxHlJ22+wNbdxjCA8ZmynySG64+tXbt1m7GSxrbBAgJKfLNuPcZTQBE
         mUAhR5m00o/Tim057KeypFaiE9sTX0sPOyDa0ozh8/VE3yRBgieWrfqVfo7QA0kmLN
         EGsfAhNvtFw5Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Cai Huoqing <caihuoqing@baidu.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <7f52b9ae-6093-e1db-a60f-09769edffdde@xs4all.nl>
Date:   Fri, 3 Sep 2021 10:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO0JVdYuWFQ0Wyp9c1ArHBSQsh0/BlBaqTdMaAfazy5uzKKSERP0TSxeEa442DZRFKmku3AZ5JJkM3igYWapqnWRM5zugcDVNBOJ1a/qCnK9CUKcYVQG
 HgLdrMxMmwJ8I0uS66x48QmQyEa5qAwe5bzB5VDiBMr+UBRXITmj1wNGPttW9UyMGsiq02Tiq8BrH8FNaLWZ2w6KkYiDjP2UZj8SYKS4gr26+Xul6VPC9nL3
 hrfab97FKXEuxZtPd1kvUpGAObVwCb5tllq1RIV/q9fE/SC6GPJ8dnST5V0A7Kv+NJOhZjUJLHy0hznCQvHxuTEqTliCOi9TTY/90uV/WWc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16a

for you to fetch changes up to d9662001a1567adec59ffa34e4b67051262aa852:

  media: rcar_drif: Make use of the helper function devm_platform_get_and_ioremap_resource() (2021-09-03 10:03:44 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Cai Huoqing (36):
      media: am437x: Make use of the helper function devm_platform_ioremap_resource()
      media: cadence: Make use of the helper function devm_platform_ioremap_resource()
      media: cec: ao-cec: Make use of the helper function devm_platform_ioremap_resource()
      media: cec: s5p_cec: Make use of the helper function devm_platform_ioremap_resource()
      media: coda: Make use of the helper function devm_platform_ioremap_resource()
      media: davinci: Make use of the helper function devm_platform_ioremap_resource()
      media: exynos-gsc: Make use of the helper function devm_platform_ioremap_resource()
      media: exynos4-is: Make use of the helper function devm_platform_ioremap_resource()
      media: imx-jpeg: Make use of the helper function devm_platform_ioremap_resource()
      media: imx-pxp: Make use of the helper function devm_platform_ioremap_resource()
      media: meson: ge2d: Make use of the helper function devm_platform_ioremap_resource()
      media: mtk-jpeg: Make use of the helper function devm_platform_ioremap_resource()
      media: mx2_emmaprp: Make use of the helper function devm_platform_ioremap_resource()
      media: rc: img-ir: Make use of the helper function devm_platform_ioremap_resource()
      media: rc: ir-hix5hd2: Make use of the helper function devm_platform_ioremap_resource()
      media: rc: meson-ir: Make use of the helper function devm_platform_ioremap_resource()
      media: rc: mtk-cir: Make use of the helper function devm_platform_ioremap_resource()
      media: rc: st_rc: Make use of the helper function devm_platform_ioremap_resource()
      media: rc: sunxi-cir: Make use of the helper function devm_platform_ioremap_resource()
      media: rcar-csi2: Make use of the helper function devm_platform_ioremap_resource()
      media: rcar_fdp1: Make use of the helper function devm_platform_ioremap_resource()
      media: rcar_jpu: Make use of the helper function devm_platform_ioremap_resource()
      media: renesas-ceu: Make use of the helper function devm_platform_ioremap_resource()
      media: rockchip: rga: Make use of the helper function devm_platform_ioremap_resource()
      media: s3c-camif: Make use of the helper function devm_platform_ioremap_resource()
      media: s5p-g2d: Make use of the helper function devm_platform_ioremap_resource()
      media: s5p-jpeg: Make use of the helper function devm_platform_ioremap_resource()
      media: s5p-mfc: Make use of the helper function devm_platform_ioremap_resource()
      media: sti: Make use of the helper function devm_platform_ioremap_resource()
      media: stih-cec: Make use of the helper function devm_platform_ioremap_resource()
      media: stm32-cec: Make use of the helper function devm_platform_ioremap_resource()
      media: sunxi: Make use of the helper function devm_platform_ioremap_resource()
      media: venus: core : Make use of the helper function devm_platform_ioremap_resource()
      media: vsp1: Make use of the helper function devm_platform_ioremap_resource()
      media: xilinx: Make use of the helper function devm_platform_ioremap_resource()
      media: rcar_drif: Make use of the helper function devm_platform_get_and_ioremap_resource()

 drivers/media/cec/platform/meson/ao-cec-g12a.c     |  4 +---
 drivers/media/cec/platform/meson/ao-cec.c          |  4 +---
 drivers/media/cec/platform/s5p/s5p_cec.c           |  4 +---
 drivers/media/cec/platform/sti/stih-cec.c          |  4 +---
 drivers/media/cec/platform/stm32/stm32-cec.c       |  4 +---
 drivers/media/platform/am437x/am437x-vpfe.c        |  4 +---
 drivers/media/platform/cadence/cdns-csi2rx.c       |  4 +---
 drivers/media/platform/cadence/cdns-csi2tx.c       |  4 +---
 drivers/media/platform/coda/imx-vdoa.c             |  3 +--
 drivers/media/platform/davinci/vpbe_venc.c         |  9 ++-------
 drivers/media/platform/davinci/vpif.c              |  5 ++---
 drivers/media/platform/davinci/vpss.c              | 10 ++--------
 drivers/media/platform/exynos-gsc/gsc-core.c       |  3 +--
 drivers/media/platform/exynos4-is/mipi-csis.c      |  4 +---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c         |  4 +---
 drivers/media/platform/imx-pxp.c                   |  4 +---
 drivers/media/platform/meson/ge2d/ge2d.c           |  4 +---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |  4 +---
 drivers/media/platform/mx2_emmaprp.c               |  4 +---
 drivers/media/platform/qcom/venus/core.c           |  4 +---
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  4 +---
 drivers/media/platform/rcar_drif.c                 |  3 +--
 drivers/media/platform/rcar_fdp1.c                 |  4 +---
 drivers/media/platform/rcar_jpu.c                  |  4 +---
 drivers/media/platform/renesas-ceu.c               |  4 +---
 drivers/media/platform/rockchip/rga/rga.c          |  5 +----
 drivers/media/platform/s3c-camif/camif-core.c      |  5 +----
 drivers/media/platform/s5p-g2d/g2d.c               |  4 +---
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |  5 +----
 drivers/media/platform/s5p-mfc/s5p_mfc.c           |  3 +--
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |  3 +--
 drivers/media/platform/sti/hva/hva-hw.c            |  4 +---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |  4 +---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |  4 +---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  4 +---
 drivers/media/platform/vsp1/vsp1_drv.c             |  4 +---
 drivers/media/platform/xilinx/xilinx-vip.c         |  4 +---
 drivers/media/rc/img-ir/img-ir-core.c              |  4 +---
 drivers/media/rc/ir-hix5hd2.c                      |  4 +---
 drivers/media/rc/meson-ir.c                        |  4 +---
 drivers/media/rc/mtk-cir.c                         |  4 +---
 drivers/media/rc/st_rc.c                           |  5 +----
 drivers/media/rc/sunxi-cir.c                       |  4 +---
 43 files changed, 46 insertions(+), 137 deletions(-)
