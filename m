Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A412392FDC
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 15:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236394AbhE0NiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 09:38:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49780 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235634AbhE0NiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 09:38:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id E950F1F43BAD
Subject: Re: [PATCH v12 0/9] Add HANTRO G2/HEVC decoder support for IMX8MQ
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, Lucas Stach <l.stach@pengutronix.de>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210526124516.2039434-1-benjamin.gaignard@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <c8a86ba1-9bd5-f002-1459-5b030dd071b0@collabora.com>
Date:   Thu, 27 May 2021 15:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526124516.2039434-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 26/05/2021 à 14:45, Benjamin Gaignard a écrit :
> The IMX8MQ got two VPUs but until now only G1 has been enabled.
> This series aim to add the second VPU (aka G2) and provide basic
> HEVC decoding support.
>
> To be able to decode HEVC it is needed to add/update some of the
> structures in the uapi. In addition of them one HANTRO dedicated
> control is required to inform the driver of the number of bits to skip
> at the beginning of the slice header.
> The hardware require to allocate few auxiliary buffers to store the
> references frame or tile size data.
>
> The driver has been tested with fluster test suite stream.
> For example with this command: ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0
>
> version 12:
>   - Change macro to avoid the final ';'
>   - Made arrays static and const
>   - Distinguish G2 generic fields (i.e these who could be reused for VP9)
>     from HEVC dedicated fields.

Hi Hans,

Could you merge this series ?
The documentation for the compatible string will come when we will reach a conclusion
about the power domain like describe in this thread:
https://lore.kernel.org/linux-media/20210407073534.376722-1-benjamin.gaignard@collabora.com/T/#m6bd571fee94b1b1fa5c5d3fa6315ae5c9f4c8fad

Regards,
Benjamin

> version 11:
>   - Rebased on media_stage.
>   - Fix minor typo/remarks.
>
> version 10:
>   - Shorter version of the previous series without ctrl block patches
>     and no DT modifications.
>     The scope of this series is limited to HEVC support.
>
> version 9:
>   - Corrections in commits messages.
>   - Define the dedicated control in hevc-controls.h
>   - Add note in documentation.
>   - Change max value of the dedicated control.
>   - Rebased on media_tree/master branch.
>
> version 8:
>   - Add reviewed-by and ack-by tags
>   - Fix the warnings reported by kernel test robot
>   - Only patch 9 (adding dedicated control), patch 11 (HEVC support) and
>     patch 13 (DT changes) are still missing of review/ack tag.
>
> version 7:
>   - Remove 'q' from syscon phandle name to make usable for iMX8MM too.
>     Update the bindings documentation.
>   - Add review/ack tags.
>   - Rebase on top of media_tree/master
>   - Be more accurate when computing the size of the memory needed motion
>     vectors.
>   - Explain why the all clocks need to set in the both DT node.
>
> version 6:
>   - fix the errors reported by kernel test robot
>
> version 5:
>   - use syscon instead of VPU reset driver.
>   - Do not break kernel/DT backward compatibility.
>   - Add documentation for dedicated Hantro control.
>   - Fix the remarks done by Ezequeil (typo, comments, unused function)
>   - Run v4l2-compliance without errors (see below).
>   - Do not add field to distinguish version, check postproc reg instead
>
> version 4:
> - Split the changes in hevc controls in 2 commits to make them easier to
>    review.
> - Change hantro_codec_ops run() prototype to return errors
> - Hantro v4l2 dedicated control is now only an integer
> - rebase on top of VPU reset changes posted here:
>    https://www.spinics.net/lists/arm-kernel/msg878440.html
> - Various fix from previous remarks
> - Limit the modifications in API to what the driver needs
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
> - remove useless clocks in VPUs nodes
>
> Benjamin Gaignard (9):
>    media: hevc: Add fields and flags for hevc PPS
>    media: hevc: Add decode params control
>    media: hantro: change hantro_codec_ops run prototype to return errors
>    media: hantro: Define HEVC codec profiles and supported features
>    media: hantro: Only use postproc when post processed formats are
>      defined
>    media: uapi: Add a control for HANTRO driver
>    media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
>    media: hantro: Introduce G2/HEVC decoder
>    media: hantro: IMX8M: add variant for G2/HEVC codec
>
>   .../userspace-api/media/drivers/hantro.rst    |  19 +
>   .../userspace-api/media/drivers/index.rst     |   1 +
>   .../media/v4l/ext-ctrls-codec.rst             | 108 +++-
>   .../media/v4l/vidioc-queryctrl.rst            |   6 +
>   drivers/media/v4l2-core/v4l2-ctrls-core.c     |  21 +-
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   4 +
>   drivers/staging/media/hantro/Makefile         |   2 +
>   drivers/staging/media/hantro/hantro.h         |  13 +-
>   drivers/staging/media/hantro/hantro_drv.c     |  99 ++-
>   .../staging/media/hantro/hantro_g1_h264_dec.c |  10 +-
>   .../media/hantro/hantro_g1_mpeg2_dec.c        |   4 +-
>   .../staging/media/hantro/hantro_g1_vp8_dec.c  |   6 +-
>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
>   drivers/staging/media/hantro/hantro_g2_regs.h | 206 ++++++
>   .../staging/media/hantro/hantro_h1_jpeg_enc.c |   4 +-
>   drivers/staging/media/hantro/hantro_hevc.c    | 327 ++++++++++
>   drivers/staging/media/hantro/hantro_hw.h      |  69 +-
>   .../staging/media/hantro/hantro_postproc.c    |  14 +
>   drivers/staging/media/hantro/hantro_v4l2.c    |   5 +-
>   drivers/staging/media/hantro/imx8m_vpu_hw.c   |  96 ++-
>   .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |   4 +-
>   .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |   4 +-
>   .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |   6 +-
>   drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
>   drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
>   .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
>   .../staging/media/sunxi/cedrus/cedrus_h265.c  |  12 +-
>   include/media/hevc-ctrls.h                    |  46 +-
>   28 files changed, 1613 insertions(+), 69 deletions(-)
>   create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>   create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>   create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
>   create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
>
