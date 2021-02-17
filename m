Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76CB31DFAA
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 20:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhBQTcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 14:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbhBQTcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 14:32:01 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58766C061574;
        Wed, 17 Feb 2021 11:31:21 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DEF431F4583E
Message-ID: <c9922c9c5875889648e765f2267505d20f9a1da8.camel@collabora.com>
Subject: Re: [PATCH v1 02/18] media: hantro: Define HEVC codec profiles and
 supported features
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Wed, 17 Feb 2021 16:31:07 -0300
In-Reply-To: <20210217080306.157876-3-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-3-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Benjamin,

Thanks a lot for the patch.

On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> Define which HEVC profiles (up to level 5.1) and features
> (no scaling, no 10 bits) are supported by the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h     |  2 +
>  drivers/staging/media/hantro/hantro_drv.c | 63 +++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 65f9f7ea7dcf..bde65231f22f 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -99,6 +99,7 @@ struct hantro_variant {
>   * @HANTRO_MODE_H264_DEC: H264 decoder.
>   * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
>   * @HANTRO_MODE_VP8_DEC: VP8 decoder.
> + * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
>   */
>  enum hantro_codec_mode {
>         HANTRO_MODE_NONE = -1,
> @@ -106,6 +107,7 @@ enum hantro_codec_mode {
>         HANTRO_MODE_H264_DEC,
>         HANTRO_MODE_MPEG2_DEC,
>         HANTRO_MODE_VP8_DEC,
> +       HANTRO_MODE_HEVC_DEC,
>  };
>  
>  /*
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e5f200e64993..0d58209fc55c 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -243,6 +243,18 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
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

Note that you are rejecting scaling lists here, butx you are adding the
SCALING_MATRIX control, and there's some support in patch 13/18
(see prepare_scaling_list_buffer).

Either drop all the scaling list support for now (and its extra controls)
or allow it properly (and make sure it's working as expected).

Thanks,
Ezequiel

> +                       /* No scaling support */
> +                       return -EINVAL;
>         }
>         return 0;
>  }
> @@ -349,6 +361,57 @@ static const struct hantro_ctrl controls[] = {
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
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
> +               },
> +       }, {
> +               .codec = HANTRO_HEVC_DECODER,
> +               .cfg = {
> +                       .id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
> +               },
>         },
>  };
>  


