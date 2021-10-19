Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508A6433DE6
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 19:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbhJSR6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 13:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbhJSR6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 13:58:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD454C061746
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 10:55:49 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ec8so16233653edb.6
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 10:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PXb52J6hd7BomyN/PmEWdejyn+jCuQ3g/t9Vn3q/0lw=;
        b=d+xL8PP56n6UdZKFTacrQjs8kaEuxkY9aLVPXq3DnxZBm3XH+QS2qmXxOU6cbZNyBa
         m29jK9EZLHz4ahgQXf7HE0aWI7F+IovrEAdF+7KWAWULGJ+V4eq/UTd6eL61M0wSEJNo
         q61PK6jfIXr6vzFGDWGON82eDZjmy7xuG9yf/M2dJTog4+8C9TqoASbRtjDHwBHfmr/b
         GNuCHfoJ3H10DvfiGkdu3C3g4dDPpb8D4oZe2C8tg2zlXtvUKBuymytmlQSbBd2DI6Em
         2+e1JsPtysGHykjUe4/EIKgfvNYNyTi91v0lRG5Bqs3poOApdLWANOElOePpGFq+7ESu
         BFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PXb52J6hd7BomyN/PmEWdejyn+jCuQ3g/t9Vn3q/0lw=;
        b=qZrP5eCuRI3rTW+T/RwRHc2MuB3wN7AH4REUSXEfwxbsENqMslujk5zmrqB9RrwIaC
         99PcpKXq/GPMJLpeRP5uC0vV/wI1jW7hDr17QmR1Ap4VgK/mDzktvPa/9WN3FuydzAqG
         dv7Bd3XfBAkdO1ZwflnJ+C7Xa8pEvx/qmMn81CIzZrdltR7zozU/FeVbdZBv0DF4aRA2
         XPNZyWatsQTVyN+WuV1ygtV/ehhJmYEDLpmM3p7yYbFpfbMSGIlMbxa/hIy31e15554i
         lMqJDVMUE2A6+zobNFNd+IYytHpJ1WcRlHQ6U+ZKC4JbF5S9H5NKN393Vxt9EH3i6MQR
         3Ydw==
X-Gm-Message-State: AOAM5309HRqrmHysywjJ6m59/FNRSPa5uMnnSnofgOuKO1jrGhHCE3vK
        OOzWH33obwUkUoTv2pT+s7fnltwKgTB9Dt/ZQa+aAW5a1mM=
X-Google-Smtp-Source: ABdhPJxtangUHUcDocBPElcYQS9Fixn3Yfl5F0okILILSk35Cn5QwVN+Lv1aOo4WOQ5Jz+AapqExQS1mtgdftoIR+vg=
X-Received: by 2002:a17:906:b782:: with SMTP id dt2mr41003181ejb.310.1634666148180;
 Tue, 19 Oct 2021 10:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210929160439.6601-1-andrzej.p@collabora.com>
In-Reply-To: <20210929160439.6601-1-andrzej.p@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 19 Oct 2021 13:55:36 -0400
Message-ID: <CAAEAJfDCo7iZ+bBAhgT1dZmRMXcNVXDXs6rUaumH+L_nXhBpow@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] VP9 codec V4L2 control interface
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

On Wed, 29 Sept 2021 at 12:04, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Dear all,
>
> This patch series adds VP9 codec V4L2 control interface and two drivers
> using the new controls. It is a follow-up of previous v6 series [1].
>
> In this iteration, we've implemented VP9 hardware decoding on two devices:
> Rockchip VDEC and Hantro G2, and tested on RK3399, i.MX8MQ and i.MX8MP.
> The i.MX8M driver needs proper power domains support, though, which is a
> subject of a different effort, but in all 3 cases we were able to run the
> drivers.
>
> GStreamer support is also available, the needed changes have been submitted
> by Daniel Almeida [2]. This MR is ready to be merged, and just needs the
> VP9 V4L2 controls to be merged and released.
>
> Both rkvdec and hantro drivers are passing a significant number of VP9 tests
> using Fluster[3]. There are still a few tests that are not passing, due to
> dynamic frame resize (not yet supported by V4L2) and small size videos
> (due to IP block limitations).
>
> The series adds the VP9 codec V4L2 control API as uAPI, so it aims at being
> merged without passing through staging, as agreed[4]. The ABI has been checked
> for padding and verified to contain no holes.
>

I took another look at this, and I'm fairly happy with it.

I'd just like to have an A-b or R-b from Nicolas Dufresne and
Daniel Almeida, given they've done a lot of work on the client side
of the API.

Another option would be to wait until Jernej finishes the work on
Allwinner H6, so we have another hardware supported.

Thanks,
Ezequiel

> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=6377
> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/2144
> [3] https://github.com/fluendo/fluster
> [4] https://lore.kernel.org/linux-media/b8f83c93-67fd-09f5-9314-15746cbfdc61@xs4all.nl/
>
> The series depends on the YUV tiled format support prepared by Ezequiel:
> https://www.spinics.net/lists/linux-media/msg197047.html
>
> Rebased onto latest media_tree.
>
> Changes related to v6:
> - moved setting tile filter and tile bsd auxiliary buffer addresses so
> that they are always set, even if no tiles are used (thanks, Jernej)
> - added a comment near the place where the 32-bit DMA mask is applied
>   (thanks, Nicolas)
> - improved consistency in register names (thanks, Nicolas)
>
> Changes related to v5:
> - improved the doc comments as per Ezequiel's review (thanks, Ezequiel)
> - improved pdf output of documentation
> - added Benjamin's Reviewed-by (thanks, Benjamin)
>
> Changes related to v4:
> - removed unused enum v4l2_vp9_intra_prediction_mode
> - converted remaining enums to defines to follow the convention
> - improved the documentation, in particular better documented how to use segmentation
> features
>
> Changes related to v3:
>
> Apply suggestions from Jernej's review (thanks, Jernej):
> - renamed a control and two structs:
>         V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS =>
>                 V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR
>         v4l2_ctrl_vp9_compressed_hdr_probs =>
>                 v4l2_ctrl_vp9_compressed_hdr
>         v4l2_vp9_mv_compressed_hdr_probs => v4l2_vp9_mv_probs
> - moved tx_mode to v4l2_ctrl_vp9_compressed_hdr
> - fixed enum v4l2_vp9_ref_frame_sign_bias values (which are used to test a bitfield)
> - explicitly assigned values to all other vp9 enums
>
> Apply suggestion from Nicolas's review (thanks, Nicolas):
> - explicitly stated that the v4l2_ctrl_vp9_compressed_hdr control is optional
> and implemented only by drivers which need it
>
> Changes related to the RFC v2:
>
> - added another driver including a postprocessor to de-tile
>         codec-specific tiling
> - reworked uAPI structs layout to follow VP8 style
> - changed validation of loop filter params
> - changed validation of segmentation params
> - changed validation of VP9 frame params
> - removed level lookup array from loop filter struct
>         (can be computed by drivers)
> - renamed some enum values to match the spec more closely
> - V4L2 VP9 library changed the 'eob' member of
>         'struct v4l2_vp9_frame_symbol_counts' so that it is an array
>         of pointers instead of an array of pointers to arrays
>         (IPs such as g2 creatively pass parts of the 'eob' counts in
>         the 'coeff' counts)
> - factored out several repeated portions of code
> - minor nitpicks and cleanups
>
> Andrzej Pietrasiewicz (6):
>   media: uapi: Add VP9 stateless decoder controls
>   media: Add VP9 v4l2 library
>   media: hantro: Rename registers
>   media: hantro: Prepare for other G2 codecs
>   media: hantro: Support VP9 on the G2 core
>   media: hantro: Support NV12 on the G2 core
>
> Boris Brezillon (1):
>   media: rkvdec: Add the VP9 backend
>
> Ezequiel Garcia (4):
>   hantro: postproc: Fix motion vector space size
>   hantro: postproc: Introduce struct hantro_postproc_ops
>   hantro: Simplify postprocessor
>   hantro: Add quirk for NV12/NV12_4L4 capture format
>
>  .../userspace-api/media/v4l/biblio.rst        |   10 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   |  573 +++++
>  .../media/v4l/pixfmt-compressed.rst           |   15 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |    8 +
>  .../media/v4l/vidioc-queryctrl.rst            |   12 +
>  .../media/videodev2.h.rst.exceptions          |    2 +
>  drivers/media/v4l2-core/Kconfig               |    4 +
>  drivers/media/v4l2-core/Makefile              |    1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  180 ++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    8 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  drivers/media/v4l2-core/v4l2-vp9.c            | 1850 +++++++++++++++++
>  drivers/staging/media/hantro/Kconfig          |    1 +
>  drivers/staging/media/hantro/Makefile         |    7 +-
>  drivers/staging/media/hantro/hantro.h         |   40 +-
>  drivers/staging/media/hantro/hantro_drv.c     |   23 +-
>  drivers/staging/media/hantro/hantro_g2.c      |   27 +
>  .../staging/media/hantro/hantro_g2_hevc_dec.c |   69 +-
>  drivers/staging/media/hantro/hantro_g2_regs.h |  132 +-
>  .../staging/media/hantro/hantro_g2_vp9_dec.c  |  980 +++++++++
>  drivers/staging/media/hantro/hantro_hw.h      |   83 +-
>  .../staging/media/hantro/hantro_postproc.c    |   79 +-
>  drivers/staging/media/hantro/hantro_v4l2.c    |   20 +
>  drivers/staging/media/hantro/hantro_vp9.c     |  240 +++
>  drivers/staging/media/hantro/hantro_vp9.h     |  103 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |   38 +-
>  .../staging/media/hantro/rockchip_vpu_hw.c    |    7 +-
>  .../staging/media/hantro/sama5d4_vdec_hw.c    |    3 +-
>  drivers/staging/media/rkvdec/Kconfig          |    1 +
>  drivers/staging/media/rkvdec/Makefile         |    2 +-
>  drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1078 ++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c         |   52 +-
>  drivers/staging/media/rkvdec/rkvdec.h         |   12 +-
>  include/media/v4l2-ctrls.h                    |    4 +
>  include/media/v4l2-vp9.h                      |  182 ++
>  include/uapi/linux/v4l2-controls.h            |  284 +++
>  include/uapi/linux/videodev2.h                |    6 +
>  37 files changed, 6033 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-vp9.c
>  create mode 100644 drivers/staging/media/hantro/hantro_g2.c
>  create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
>  create mode 100644 drivers/staging/media/hantro/hantro_vp9.h
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
>  create mode 100644 include/media/v4l2-vp9.h
>
>
> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
> --
> 2.17.1
>
