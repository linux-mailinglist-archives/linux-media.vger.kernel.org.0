Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943E7373DD8
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhEEOnq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:43:46 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47723 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233112AbhEEOnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:43:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eIjalNZWvWztCeIjdlLk0I; Wed, 05 May 2021 16:42:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620225768; bh=Av024PgQCGoQzBKEgJiqT3Qmm3Jj8dv5DOFxbUBHbUU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TtTvHAwCOBdXfYzb/VCYG+SZ9TdOVUHaGThOIQud5Ho8RqTZE+5fJ0bdFt8gscW4K
         JNQQRomYfZ1OdUGi5PNaE7BaOZKbLoWgRnaeCeNRdnXoMyzi6nmpq4k8h/C0sqBGat
         cAZm+wgn0BrfNPZPoa6y4/DFHq5lC98GcNDMB+OGIn7zXN0Rd5lw1GrLKnBIqpUmwM
         KWHVj8mgzqiXpAk25pcxnfhKayHwNZfelkOU6Uzom/WbLQ14WXtKud6k7wT/0u8dT7
         qtiQs9js9bcU5CMHIGUcC20W0Op3OwhpLjOajV05Gcq9zpWfXBMTP3F1lyJm3gHb1F
         0qxVsGRlOxS9g==
Subject: Re: [PATCH v10 0/9] Add HANTRO G2/HEVC decoder support for IMX8MQ
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <57dd758d-07b6-abbe-ab0d-2cc165b650db@xs4all.nl>
Date:   Wed, 5 May 2021 16:42:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB4xz84t/9tJk8Tsh/SHVh+F0gHNN/2hzLMgvPRnsZgWg9cigkHp23SpfIv5EOdIN/yMbL89V4s59xpPZ/wWPxrM9vGxHd5aIHSQxy4PKciu/3fogBgX
 fuBsPFvSEK8/rkzvxVee/IXpvPHVM8hs91BJmLIVR2slEN30lh+At2QjCWeQ2PvVrGL8wuQpW93357c1iq+erPLg+1If30hxDafSuqR1VE4Ilt8nRKqzITFa
 DmWJrAUzwIoExjcYZ7zt0ROb/CzrnyxpLEc/C2SMM1o7JZDjbt0i2KD/PyZ/OQgWLXVIDgnWTSaoRCYlL6HsTdggUs1ieb1qy00XQ3eCH+lVTIHy2wROlfPp
 N17PLlTWcUG4v/yLzTrizqYFMYJLljYVIQEIjuhfnuqnqko0cAhYFnx/GOmvQBxn7xO3YFo7MQX+kw3jciWJ97WXbmidNoomK8S9vnqNhorqwZk0ze+9T5J4
 //nHlCxr/pIuL/YYmoROWposjCM5bRTvbqTr30fB1JGcS9NJ8j0auP7S+IBOqlg5XyxOE90t6lzSjtQYBYOKp3B2D49F9mU5F9XMO161Si8qzzmiIBXI7att
 h+L2pKrGQmJuoiAo6AGrjTaa+uqAUkRiz16+00zWxiX83CbgoEYuGbaW7jBUGFS8eXAO1y2Rcp5veo+5yDsctpTcCEBFqRR5QVZhVYJkZ7VcaaDs9rdzQXAx
 SrHGWyitHtWTsbyEgDIPmMMg0bAR9Tv3ZkMr/YhDxBHsFwWWv7zhy8jcAD/STjQKw/sh6t51G3jXj18BylIshyZuzeolozPih3ylR3lNFm2auUdR4EEfvnp7
 vrAs9yc9w7ffcqTM9FE+EOdklQdfFawdg1edG8hbwLlW9635P8zIqCWnXRyOjE6SNQbIuUd48GZ77avb+JHJ7TnDuyZUXfTbtzmHik9mMnx1EXCc9gZc6p1t
 3uISmyZyEs/9CaV21lCaLCEHi5DMBhvdqYI97ue9idK1ZRC9pO11iiTfRHFHwPazWaoeUR5rFG/vO6pYHehKgfg9LZ9j5JeYQv7N1FkAN+QlIT2u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On 20/04/2021 14:10, Benjamin Gaignard wrote:
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

This series clashes with this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20210427071554.2222625-1-jernej.skrabec@siol.net/

and this patch series:

https://patchwork.linuxtv.org/project/linux-media/cover/20210401144336.2495479-1-emil.l.velikov@gmail.com/

For both PRs are pending.

It's probably better to wait until this is merged before rebasing this series.

And if drivers are going to be moved out of staging, leaving only HEVC support
in staging, then I'd wait until that is done as well.

Regards,

	Hans

> 
> The driver has been tested with fluster test suite stream.
> For example with this command: ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0
> 
> version 10:
>  - Shorter version of the previous series without ctrl block patches
>    and no DT modifications.
>    The scope of this series is limited to HEVC support.
> 
> version 9:
>  - Corrections in commits messages.
>  - Define the dedicated control in hevc-controls.h
>  - Add note in documentation.
>  - Change max value of the dedicated control.
>  - Rebased on media_tree/master branch.
> 
> version 8:
>  - Add reviewed-by and ack-by tags 
>  - Fix the warnings reported by kernel test robot
>  - Only patch 9 (adding dedicated control), patch 11 (HEVC support) and
>    patch 13 (DT changes) are still missing of review/ack tag.
> 
> version 7:
>  - Remove 'q' from syscon phandle name to make usable for iMX8MM too.
>    Update the bindings documentation.
>  - Add review/ack tags.
>  - Rebase on top of media_tree/master
>  - Be more accurate when computing the size of the memory needed motion
>    vectors.
>  - Explain why the all clocks need to set in the both DT node.
> 
> version 6:
>  - fix the errors reported by kernel test robot
> 
> version 5:
>  - use syscon instead of VPU reset driver.
>  - Do not break kernel/DT backward compatibility.
>  - Add documentation for dedicated Hantro control.
>  - Fix the remarks done by Ezequeil (typo, comments, unused function)
>  - Run v4l2-compliance without errors (see below).
>  - Do not add field to distinguish version, check postproc reg instead
> 
> version 4:
> - Split the changes in hevc controls in 2 commits to make them easier to
>   review.
> - Change hantro_codec_ops run() prototype to return errors   
> - Hantro v4l2 dedicated control is now only an integer
> - rebase on top of VPU reset changes posted here:
>   https://www.spinics.net/lists/arm-kernel/msg878440.html
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
>   media: hevc: Add fields and flags for hevc PPS
>   media: hevc: Add decode params control
>   media: hantro: change hantro_codec_ops run prototype to return errors
>   media: hantro: Define HEVC codec profiles and supported features
>   media: hantro: Only use postproc when post processed formats are
>     defined
>   media: uapi: Add a control for HANTRO driver
>   media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
>   media: hantro: Introduce G2/HEVC decoder
>   media: hantro: IMX8M: add variant for G2/HEVC codec
> 
>  .../userspace-api/media/drivers/hantro.rst    |  19 +
>  .../userspace-api/media/drivers/index.rst     |   1 +
>  .../media/v4l/ext-ctrls-codec.rst             | 108 +++-
>  .../media/v4l/vidioc-queryctrl.rst            |   6 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  28 +-
>  drivers/staging/media/hantro/Makefile         |   2 +
>  drivers/staging/media/hantro/hantro.h         |  13 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  99 ++-
>  .../staging/media/hantro/hantro_g1_h264_dec.c |  10 +-
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |   4 +-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |   6 +-
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c |   4 +-
>  drivers/staging/media/hantro/hantro_hevc.c    | 327 ++++++++++
>  drivers/staging/media/hantro/hantro_hw.h      |  69 +-
>  .../staging/media/hantro/hantro_postproc.c    |  14 +
>  drivers/staging/media/hantro/hantro_v4l2.c    |   5 +-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  74 ++-
>  .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |   4 +-
>  .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |   4 +-
>  .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |   6 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  12 +-
>  include/media/hevc-ctrls.h                    |  46 +-
>  27 files changed, 1586 insertions(+), 69 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
>  create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
> 

