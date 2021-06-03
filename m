Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C4F399D95
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 11:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhFCJVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 05:21:07 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34581 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhFCJVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 05:21:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ojVPlaug5IpGyojVTlRARF; Thu, 03 Jun 2021 11:19:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622711961; bh=IXQ3t6qOZzpezRNUQjlBPukx7l+NBDO2OI2DLuH5NWQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Px+Giv7ZPo83csRa5MH1UxYl3oPXVgVE90sNyEJHZL/O8faq+2ecGDFzjbAess3xi
         oAJ26fAHXnScuVj5rVbPea24SN3qNHR2YS4RUYKXOiMpPS/PvDSce4OgQecBFKr3NQ
         VotRa+vSvkdsIhk1q1Tfi5FxXj5EgEYSbU/ZamuSL3cJNPKCJzWaQ6pqcMiwzk2nz7
         h9IvBqDTVJjr1j+csYlFUJQSO4qdb41dAahCxa3mAQzv+zuDTB8pwOS1K9OiwmeZZA
         1PDA5oEw3lLx4sl0E2MMifmRkH96/sBQPii+stW5YKJ90hG2/kOjGz6YSa5ylSZUdB
         mNdzMOAUNIXVw==
Subject: Re: [PATCH v12 0/9] Add HANTRO G2/HEVC decoder support for IMX8MQ
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210526124516.2039434-1-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1627e9d3-7008-dda5-19d1-251c4715af9e@xs4all.nl>
Date:   Thu, 3 Jun 2021 11:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210526124516.2039434-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE/5cuyJKGykF94syzgFlWsnr+LsARjE9ELRRtG95HZiIh0Ag90RwkQzWB09PufCUJFZBoKXBgVUVawAzYVNOX//g3wexekpo+CJRRRtNgtzJ7JsNgsb
 p/h95zHfNC2LMAN2Drdram3powV+ZCLG0sd/aZc8wG3KJ+h67T1Nolfrcb8/kBm/n89d3qsyH4jImzF3M7BW0i0OszWlJ+PgOVTUH+NPN3ojSMtN5Z8xnNdC
 U3PB39Bmb5/0KjotpCpWcgSaQ00YeSYQ63H1YWTTd32SiXaBczhUNpmz7DZFBlGutgzrEW0PFHjK0Z/PTCraELg7DwNJIt2LVm9J6hhNpwlytOpYYd3onA+S
 tmCO+uMwJC4DOXVD9mO4ijK0rjjvp9wEr0h5YZs7fPWhF+e/8tEVvovBtNjW+zm+E+E8R10F8Lp70MLu25tDXiV2YRZWoF/F2xMgfNrmzTy+6C/PIc30QMJH
 SvIcbRuJr/1FuFy6J1yGH3cD+zMTpHHDMLZ7TCnrlx8N69OAGKa977Wr2BXjGXN7CpkgAzlCkfoLK3MeukCk8aKro2rf1VRRUq7ESuA43msWFG9ulYOihG7W
 XJbedwYF4RtaRRS5Os3bQQiPVf1rfPfB97zFpwgAyMa37c2l7GFW0sLWb75g4geeMIgNJLIdDR3Lgq3hW+xXYKe0wFe+ijjf3zA1HhFdX8LAS6hPmb9wrFA3
 s1nKP+hwuSgJso+ocw1NlUriBwSAlhDK3DLjXsq5XwC27brTcUJyebHipdxGyDBKlNtb/0847DQX+u4RE9eBH5pFdzl+cP6W2Ybv9RJHEKEsastGV4wM2Xho
 Faf8G7MkIuhFmjGcmrCxUVDOZ62cRu/cVg7ewsSzfPPZucvdW2JxY9v9nuuj5A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On 26/05/2021 14:45, Benjamin Gaignard wrote:
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
>  - Change macro to avoid the final ';'
>  - Made arrays static and const
>  - Distinguish G2 generic fields (i.e these who could be reused for VP9)
>    from HEVC dedicated fields.

I ran the latest checkpatch/smatch/sparse etc. over this series and got a lot
of issues.

The trickiest first:

I get many reports for the register definitions in hantro_g2_regs.h:

drivers/staging/media/hantro/hantro_g2_regs.h:16:33: warning: 'g2_strm_start_offset' defined but not used [-Wunused-const-variable=]

I think it is a bad idea to declare variables in a header, and that's really
what is causing this.

I think it should be possible to rework this to defines such as:

#define G2_DEC_REG(b, s, m) \
        (const struct hantro_reg) { \
                .base = G2_SWREG(b), \
                .shift = s, \
                .mask = m, \
        }

#define g2_strm_start_offset G2_DEC_REG(259, 0, 0xffffffff)

This allows you to do:

hantro_reg_write(vpu, &g2_strm_start_offset, 0);

without having to declare static variables in a header.

Other warnings:

From the compiler:

linux-git-arm-multi: WARNINGS

drivers/staging/media/hantro/hantro_g2_hevc_dec.c: In function 'hantro_write_addr':
drivers/staging/media/hantro/hantro_g2_hevc_dec.c:23:24: warning: right shift count >= width of type [-Wshift-count-overflow]
   23 |  vdpu_write(vpu, (addr >> 32) & 0xffffffff, offset + 4);
      |                        ^~

Note: this builds on a 32-bit arm!

From smatch:

drivers/staging/media/hantro/hantro_hevc.c:228 tile_buffer_reallocate() error: double free of 'hevc_dec->tile_sao.cpu'
drivers/staging/media/hantro/hantro_hevc.c:234 tile_buffer_reallocate() error: double free of 'hevc_dec->tile_bsd.cpu'

From kerneldoc:

drivers/staging/media/hantro/hantro_hw.h:136: warning: Function parameter or member 'ref_bufs' not described in 'hantro_hevc_dec_hw_ctx'
drivers/staging/media/hantro/hantro_hw.h:136: warning: Function parameter or member 'ref_bufs_poc' not described in 'hantro_hevc_dec_hw_ctx'
drivers/staging/media/hantro/hantro_hw.h:136: warning: Function parameter or member 'ref_bufs_used' not described in 'hantro_hevc_dec_hw_ctx'
drivers/staging/media/hantro/hantro_hw.h:136: warning: Function parameter or member 'num_tile_cols_allocated' not described in
'hantro_hevc_dec_hw_ctx'

Regards,

	Hans

> 
> version 11:
>  - Rebased on media_stage.
>  - Fix minor typo/remarks.
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
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  21 +-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   4 +
>  drivers/staging/media/hantro/Makefile         |   2 +
>  drivers/staging/media/hantro/hantro.h         |  13 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  99 ++-
>  .../staging/media/hantro/hantro_g1_h264_dec.c |  10 +-
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |   4 +-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |   6 +-
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_g2_regs.h | 206 ++++++
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c |   4 +-
>  drivers/staging/media/hantro/hantro_hevc.c    | 327 ++++++++++
>  drivers/staging/media/hantro/hantro_hw.h      |  69 +-
>  .../staging/media/hantro/hantro_postproc.c    |  14 +
>  drivers/staging/media/hantro/hantro_v4l2.c    |   5 +-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  96 ++-
>  .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |   4 +-
>  .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |   4 +-
>  .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |   6 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  12 +-
>  include/media/hevc-ctrls.h                    |  46 +-
>  28 files changed, 1613 insertions(+), 69 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
>  create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
> 

