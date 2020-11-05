Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386B42A846C
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 18:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731604AbgKERG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 12:06:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:55560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgKERG2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 12:06:28 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28A1E20756;
        Thu,  5 Nov 2020 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604595987;
        bh=+n+w/1hHZGrKSZYjmbc1DjktrNb4ft0D6QRN4d1Z6LQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fZR//xCEJJ0QKz3dcqM3sdzUciLiqfXyAj6SqP2tD88qQ0C3i2kwn9WzLeE8Nw0Zx
         Z2x9IImICGx146D78B3mKyGFtmt+vAyRLv8+6+ida80bwUFaqCRt1xXVIPzfcBA4CA
         J2Jfw2soUA8RKNrTRWjs4qUJLYq/IkbHPB9YNuuY=
Date:   Thu, 5 Nov 2020 18:06:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v5.11] v2: Various fixes
Message-ID: <20201105180623.48b135d0@coco.lan>
In-Reply-To: <f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl>
References: <f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Nov 2020 14:50:00 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Supersedes https://patchwork.linuxtv.org/project/linux-media/patch/01dbfda7-c126-8b8b-4af5-2cc767b34e19@xs4all.nl/
> 
> The only change is that two patches from Jernej were added.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:
> 
>   Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11e
> 
> for you to fetch changes up to 451afd8c2a0a889105c27f16a38a8897086532f3:
> 
>   media: cedrus: Add support for R40 (2020-11-05 14:44:59 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Dafna Hirschfeld (2):
>       media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
>       media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED
> 
> Evgeny Novikov (1):
>       media: isif: reset global state
> 
> Ezequiel Garcia (2):
>       coda: coda_buffer_meta housekeeping fix
>       coda: Add a V4L2 user for control error macroblocks count
> 
> Hsin-Yi Wang (1):
>       media: mtk-vcodec: remove allocated dma_parms
> 
> Jernej Skrabec (2):
>       dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible
>       media: cedrus: Add support for R40
> 
> Liu Shixin (1):
>       media: media/pci: simplify the return expression of verify_window_lock
> 
> Yu Kuai (6):
>       media: platform: add missing put_device() call in mtk_jpeg_clk_init()
>       media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove()
>       media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
>       media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
>       media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
>       media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm()
> 
> Zhang Qilong (2):
>       media: staging: rkisp1: cap: fix runtime PM imbalance on error
>       media: cedrus: fix reference leak in cedrus_start_streaming

A few patches on this sereis didn't apply:

	0010-0017-media-platform-add-missing-put_device-call-in-mtk_jp.patch
	0012-0017-media-mtk-vcodec-add-missing-put_device-call-in-mtk_.patch
	0013-0017-media-mtk-vcodec-add-missing-put_device-call-in-mtk_.patch
	0014-0017-media-mtk-vcodec-add-missing-put_device-call-in-mtk_.patch
	0015-0017-media-mtk-vcodec-add-missing-put_device-call-in-mtk_.patch

I suspect that those were merged via some other tree.


> 
>  .../devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml  |  1 +
>  Documentation/userspace-api/media/v4l/subdev-formats.rst             | 27 +++++++++++++++++
>  drivers/media/pci/bt8xx/bttv-driver.c                                | 12 +++-----
>  drivers/media/platform/coda/coda-bit.c                               | 52 +++++++++++++++++++++++++++-----
>  drivers/media/platform/coda/coda-common.c                            | 18 +++++++++++
>  drivers/media/platform/coda/coda.h                                   | 11 +++++++
>  drivers/media/platform/davinci/isif.c                                | 11 +++++--
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                      |  9 ++++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c               |  9 +-----
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c                | 19 ++++++++----
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c               |  9 +-----
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c                | 28 ++++++++++++-----
>  drivers/staging/media/rkisp1/TODO                                    |  1 -
>  drivers/staging/media/rkisp1/rkisp1-capture.c                        |  1 +
>  drivers/staging/media/rkisp1/rkisp1-isp.c                            |  8 ++---
>  drivers/staging/media/sunxi/cedrus/cedrus.c                          |  9 ++++++
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c                    |  4 ++-
>  include/uapi/linux/media-bus-format.h                                |  8 +++++
>  include/uapi/linux/v4l2-controls.h                                   |  6 ++++
>  19 files changed, 191 insertions(+), 52 deletions(-)



Thanks,
Mauro
