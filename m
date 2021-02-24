Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C31F324540
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 21:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbhBXUcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 15:32:55 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhBXUcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 15:32:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id ED1C51F45E8F
Message-ID: <a2ed92729e8668a527243f24004a5dc5457a8717.camel@collabora.com>
Subject: Re: [PATCH v3 0/9] Add HANTRO G2/HEVC decoder support for IMX8MQ
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Wed, 24 Feb 2021 17:31:48 -0300
In-Reply-To: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, 2021-02-22 at 13:23 +0100, Benjamin Gaignard wrote:
> The IMX8MQ got two VPUs but until now only G1 has been enabled.
> This series aim to add the second VPU (aka G2) and provide basic 
> HEVC decoding support.
> 
> To be able to decode HEVC it is needed to add/update some of the
> structures in the uapi. In addition of them one HANTRO dedicated
> control is required to inform the driver of the numbre of bits to skip
> at the beginning of the slice header.
> The hardware require to allocate few auxiliary buffers to store the
> references frame or tile size data.
> 
> The driver has been tested with fluster test suite stream.
> For example with this command: ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0
>  
> This series depends of the reset rework posted here: https://www.spinics.net/lists/arm-kernel/msg875766.html
> 
> Finally the both VPUs will have a node the device-tree and be
> independent from v4l2 point of view.
> 
> A branch with all the dev is available here:
> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/upstream_g2_v2
> 
> version 3:
> - Fix typo in Hantro v4l2 dedicated control
> - Add documentation for the new structures and fields
> - Rebased on top of media_tree for-linus-5.12-rc1 tag
> 
> version 2:
> - remove all change related to scaling
> - squash commits to a coherent split
> - be more verbose about the added fields
> - fix the comments done by Ezequiel about dma_alloc_coherent usage
> - fix Dan's comments about control copy, reverse the test logic
> in tile_buffer_reallocate, rework some goto and return cases.
> - be more verbose about why I change the bindings
> - remove all sign-off expect mime since it is confusing

I don't think it's about having less confusing commits, but
trying to describe fairly accurately the origin of the work
and the authorship of changes.

In this series I believe we have three cases, please
correct me if I'm wrong:

* Changes that you have authored, for instance it would
seem to me that "dt-bindings: media: nxp,imx8mq-vpu: Update bindings",
and "media: uapi: Add a control for HANTRO driver" would be in
that category.

* Changes that Adrian and/or me have initially authored,
where both Adrian and me did further work, and also
where you did significant work on as well.

IOW, changes where the three of us did significant work.

I guess in this case, the original author could be the
author of the patch (git's Author tag), and additionally
authorship would be indicated with Co-developed-by tags.

commit 494adacd844e5656b570895a82bc343438b23023
Author: Adrian Ratiu <adrian.ratiu@collabora.com>
Date:   Thu Feb 18 12:17:37 2021 +0100

    media: hantro: Introduce G2/HEVC decoder

    ...

    Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
    Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
    Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
    Co-developed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com> 
    Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

* And finally changes with an original author (Adrian or me),
which you haven't changed, but you are just submitting
(or you did minor work).

Maybe with the current way of splitting commits we don't have
these type of patches, but just for the sake of it, let's say
there's a commit authored by Adrian that you are mostly picking up,
it would be:

commit 896776d3bcd032808e4d5772e6749da5dd4eec42
Author: Adrian Ratiu <adrian.ratiu@collabora.com>
Date:   Fri Feb 5 12:14:16 2021 +0100

    media: hantro: Some change
    
    ...

    Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
    Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>


Thanks a lot!
Ezequiel

> - remove useless clocks in VPUs nodes
> 
> Benjamin
> 
> Benjamin Gaignard (9):
>   media: hevc: Modify structures to follow H265 ITU spec
>   media: hantro: Define HEVC codec profiles and supported features
>   media: hantro: Add a field to distinguish the hardware versions
>   media: uapi: Add a control for HANTRO driver
>   media: hantro: Introduce G2/HEVC decoder
>   media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
>   media: hantro: IMX8M: add variant for G2/HEVC codec
>   dt-bindings: media: nxp,imx8mq-vpu: Update bindings
>   arm64: dts: imx8mq: Add node to G2 hardware
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        |  54 +-
>  .../media/v4l/ext-ctrls-codec.rst             | 126 +++-
>  .../media/v4l/vidioc-queryctrl.rst            |   6 +
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  41 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  26 +-
>  drivers/staging/media/hantro/Makefile         |   2 +
>  drivers/staging/media/hantro/hantro.h         |  34 +-
>  drivers/staging/media/hantro/hantro_drv.c     | 103 +++
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++
>  drivers/staging/media/hantro/hantro_hevc.c    | 321 ++++++++++
>  drivers/staging/media/hantro/hantro_hw.h      |  48 ++
>  .../staging/media/hantro/hantro_postproc.c    |  17 +
>  drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  95 ++-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |   6 +-
>  include/media/hevc-ctrls.h                    |  45 +-
>  include/uapi/linux/hantro-v4l2-controls.h     |  20 +
>  include/uapi/linux/v4l2-controls.h            |   5 +
>  22 files changed, 1674 insertions(+), 70 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
>  create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
>  create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
> 


