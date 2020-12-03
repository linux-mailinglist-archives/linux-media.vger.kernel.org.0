Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234002CD0B2
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 09:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729889AbgLCICE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 03:02:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:43654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728782AbgLCICE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 03:02:04 -0500
Date:   Thu, 3 Dec 2020 09:01:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606982483;
        bh=+/35XaQM06b+490nPNupEIiIzDg7CtRBPPoL9gYtyoU=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=NBDlCWNpz6K7sZLewTP9noBY5HyYUluDCE3uTCS1uMM/wFPy2DhaexX+9IPI2krSO
         e8ATNWDCgRJ2jIXce0Z9SHCwDWcsGdWxIIM4E5VvlLVkZzXB069O3oTaZWVZ4BEomb
         kp2K7XidL9ltUpgoTxnJMPUMu5upHqEwazXApixj4/PAk6ZV/Z2rAeuL2o9nuYVVJO
         WNrw6HRQ5bteaiATw8mDM6zT389muWyaiAwhQStzAJNsAfbzrNfzGLsbxKUy2N67/b
         X+DTMQy1P/meam3HgAgPufGfmNs+Fx9HVBRWOpo8Z+0v1us1wEwKznFNvtIGR082+u
         a02ZdhJmqiOcg==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [GIT PULL FOR v5.11] Various fixes/enhancements
Message-ID: <20201203090119.6a866747@coco.lan>
In-Reply-To: <5dbd468d-1d10-e0c8-43f0-ebe8f17abef8@xs4all.nl>
References: <5dbd468d-1d10-e0c8-43f0-ebe8f17abef8@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Dec 2020 11:42:26 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Lots of fixes and enhancements. The main enhancement is adding support fo=
r vp8
> to the cedrus driver.
>=20
> Note that you'll get a message about a wrong commit id in
> "media: rcar-vin: Mask VNCSI_IFMD register": that commit id is for the rc=
ar
> BSP repo, not the linux kernel repo.
>=20
> Regards,
>=20
> 	Hans
>=20
> The following changes since commit 67e061f044e46c9823e59ca7981786f858bfa2=
92:
>=20
>   Merge tag 'v5.10-rc6' into patchwork (2020-12-01 16:21:40 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11c
>=20
> for you to fetch changes up to 4bb8c5bfe39745de36bf6162fa054778e0028053:
>=20
>   media: rockchip: rkisp1: remove useless debugfs checks (2020-12-02 11:3=
9:23 +0100)
>=20
> ----------------------------------------------------------------
> Tag branch
>=20
> ----------------------------------------------------------------
> Andrey Konovalov (2):
>       Revert "media: camss: Make use of V4L2_CAP_IO_MC"
>       media: camss: Make use of V4L2_CAP_IO_MC
>=20
> Baskov Evgeniy (1):
>       s5p-jpeg: handle error condition in s5p_jpeg_probe
>=20
> Christian Hewitt (1):
>       media: meson: vdec: add G12/SM1 to module description
>=20
> Christophe JAILLET (3):
>       media: solo6x10: switch from 'pci_' to 'dma_' API
>       media: ttpci: switch from 'pci_' to 'dma_' API
>       media: saa7146: switch from 'pci_' to 'dma_' API
>=20
> Dan Carpenter (2):
>       media: saa7146: fix array overflow in vidioc_s_audio()
>       media: rockchip: rkisp1: remove useless debugfs checks
>=20
> Emmanuel Gil Peyrot (2):
>       media: uapi: Expose VP8 probability lengths as defines
>       media: hantro: Use VP8 lengths defined in uapi
>=20
> Fabio Estevam (2):
>       media: fsl-viu: Use the ioread/write32be() accessors
>       media: staging/imx: Increase IMX_MEDIA_EOF_TIMEOUT
>=20
> Irui Wang (2):
>       media: mtk-vpu: VPU should be in idle state before system is suspen=
ded
>       media: mtk-vpu: dump VPU status when IPI times out
>=20
> Jacopo Mondi (2):
>       media: rcar-vin: Remove unused macro


>       media: rcar-vin: Mask VNCSI_IFMD register

All patches applied, except for this one, that require a fix on
its description, as mentioned on a separate thread.

Regards,
Mauro

>=20
> Jernej Skrabec (1):
>       media: cedrus: Add support for VP8 decoding
>=20
> Jonathan Corbet (1):
>       media: stop pretending to maintain cafe and ov7670
>=20
> Marek Szyprowski (1):
>       media: platform: exynos4-is: remove all references to physical addr=
esses
>=20
> Niklas S=C3=B6derlund (4):
>       adv748x: Only set i2c addresses once during probe
>       adv748x: afe: Select input port when device is reset
>       adv748x: csi2: Set virtual channel when device is reset
>       adv748x: Configure device when resuming from sleep
>=20
> Peilin Ye (1):
>       media: rockchip: rkisp1: Fix typos in comments and macro definitions
>=20
> Tom Rix (1):
>       si4713: remove trailing semicolon in macro definition
>=20
>  MAINTAINERS                                             |   6 +-
>  drivers/media/common/saa7146/saa7146_core.c             |  39 +-
>  drivers/media/common/saa7146/saa7146_fops.c             |   7 +-
>  drivers/media/common/saa7146/saa7146_vbi.c              |   6 +-
>  drivers/media/i2c/adv748x/adv748x-afe.c                 |   6 +-
>  drivers/media/i2c/adv748x/adv748x-core.c                |  31 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c                |   6 +-
>  drivers/media/i2c/adv748x/adv748x.h                     |   2 +
>  drivers/media/pci/saa7146/mxb.c                         |  19 +-
>  drivers/media/pci/solo6x10/solo6x10-g723.c              |  11 +-
>  drivers/media/pci/solo6x10/solo6x10-p2m.c               |  10 +-
>  drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c          |  35 +-
>  drivers/media/pci/ttpci/av7110.c                        |  13 +-
>  drivers/media/platform/exynos4-is/fimc-capture.c        |   6 +-
>  drivers/media/platform/exynos4-is/fimc-core.c           |  28 +-
>  drivers/media/platform/exynos4-is/fimc-core.h           |  18 +-
>  drivers/media/platform/exynos4-is/fimc-is.c             |  20 +-
>  drivers/media/platform/exynos4-is/fimc-is.h             |   6 +-
>  drivers/media/platform/exynos4-is/fimc-lite-reg.c       |   4 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c           |   2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.h           |   4 +-
>  drivers/media/platform/exynos4-is/fimc-m2m.c            |   8 +-
>  drivers/media/platform/exynos4-is/fimc-reg.c            |  18 +-
>  drivers/media/platform/exynos4-is/fimc-reg.h            |   4 +-
>  drivers/media/platform/fsl-viu.c                        | 119 +++---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c                | 101 ++++-
>  drivers/media/platform/qcom/camss/camss-video.c         |  87 ++---
>  drivers/media/platform/rcar-vin/rcar-dma.c              |  26 +-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c |   4 +-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c     |   4 -
>  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h    |   4 +-
>  drivers/media/platform/s5p-jpeg/jpeg-core.c             |   2 +
>  drivers/media/radio/si4713/si4713.c                     |   2 +-
>  drivers/staging/media/hantro/hantro_vp8.c               |   4 +-
>  drivers/staging/media/imx/imx-media.h                   |   2 +-
>  drivers/staging/media/meson/vdec/vdec.c                 |   2 +-
>  drivers/staging/media/sunxi/cedrus/Makefile             |   3 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c             |   8 +
>  drivers/staging/media/sunxi/cedrus/cedrus.h             |  24 ++
>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c         |   5 +
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c          |   2 +
>  drivers/staging/media/sunxi/cedrus/cedrus_regs.h        |  80 ++++
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c       |   9 +
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c         | 907 ++++++++++=
++++++++++++++++++++++++++++++++++
>  include/media/vp8-ctrls.h                               |   6 +-
>  45 files changed, 1427 insertions(+), 283 deletions(-)
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c



Thanks,
Mauro
