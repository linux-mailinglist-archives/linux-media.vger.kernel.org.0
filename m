Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAF934D82A
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 21:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhC2T2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 15:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhC2T2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 15:28:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2DFC061574;
        Mon, 29 Mar 2021 12:28:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3850E1F454DE
Message-ID: <06e1125f057377aa8f508db5cd6672ee379f9c89.camel@collabora.com>
Subject: Re: [PATCH v7 07/13] media: hantro: Define HEVC codec profiles and
 supported features
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Mon, 29 Mar 2021 16:28:11 -0300
In-Reply-To: <20210329065743.11961-8-benjamin.gaignard@collabora.com>
References: <20210329065743.11961-1-benjamin.gaignard@collabora.com>
         <20210329065743.11961-8-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-03-29 at 08:57 +0200, Benjamin Gaignard wrote:
> Define which HEVC profiles (up to level 5.1) and features
> (no scaling, no 10 bits) are supported by the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro.h     |  3 ++
>  drivers/staging/media/hantro/hantro_drv.c | 58 +++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 37b9ce04bd4e..edb4561a6887 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -35,6 +35,7 @@ struct hantro_codec_ops;
>  #define HANTRO_MPEG2_DECODER   BIT(16)
>  #define HANTRO_VP8_DECODER     BIT(17)
>  #define HANTRO_H264_DECODER    BIT(18)
> +#define HANTRO_HEVC_DECODER    BIT(19)
>  #define HANTRO_DECODERS                0xffff0000
>  
>  /**
> @@ -100,6 +101,7 @@ struct hantro_variant {
>   * @HANTRO_MODE_H264_DEC: H264 decoder.
>   * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
>   * @HANTRO_MODE_VP8_DEC: VP8 decoder.
> + * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
>   */
>  enum hantro_codec_mode {
>         HANTRO_MODE_NONE = -1,
> @@ -107,6 +109,7 @@ enum hantro_codec_mode {
>         HANTRO_MODE_H264_DEC,
>         HANTRO_MODE_MPEG2_DEC,
>         HANTRO_MODE_VP8_DEC,
> +       HANTRO_MODE_HEVC_DEC,
>  };
>  
>  /*
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 02c5c2f1a88b..d9a3a5ef9330 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -245,6 +245,18 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>                 if (sps->bit_depth_luma_minus8 != 0)
>                         /* Only 8-bit is supported */
>                         return -EINVAL;
> +       } else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
> +               const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
> +
> +               if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> +                       /* Luma and chroma bit depth mismatch */
> +                       return -EINVAL;
> +               if (sps->bit_depth_luma_minus8 != 0)
> +                       /* Only 8-bit is supported */
> +                       return -EINVAL;
> +               if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
> +                       /* No scaling support */
> +                       return -EINVAL;
>         }
>         return 0;
>  }
> @@ -351,6 +363,52 @@ static const struct hantro_ctrl controls[] = {
>                         .def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>                 }
>         }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
> +                       .min = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
> +                       .max = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
> +                       .def = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_START_CODE,
> +                       .min = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
> +                       .max = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
> +                       .def = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +                       .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +                       .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +                       .def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +                       .min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +                       .max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_SPS,
> +                       .ops = &hantro_ctrl_ops,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_PPS,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
> +               },
>         },
>  };
>  


