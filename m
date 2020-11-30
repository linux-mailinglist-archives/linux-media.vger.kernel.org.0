Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07452C8761
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 16:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgK3PEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 10:04:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56162 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgK3PEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 10:04:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 540D11F450AB
Message-ID: <67aa7f00ae2ea7d7e59720ce37d32ebd0de8a60a.camel@collabora.com>
Subject: Re: [PATCH 4/4] venus: venc: Add support for AUD NALU control
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Mon, 30 Nov 2020 10:03:21 -0500
In-Reply-To: <20201130090859.25272-5-stanimir.varbanov@linaro.org>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
         <20201130090859.25272-5-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 30 novembre 2020 à 11:08 +0200, Stanimir Varbanov a écrit :
> Add support for Access Unit Delimiter control into encoder.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  1 +
>  drivers/media/platform/qcom/venus/venc.c       | 14 ++++++++++++++
>  drivers/media/platform/qcom/venus/venc_ctrls.c |  8 +++++++-
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h
> b/drivers/media/platform/qcom/venus/core.h
> index 52df8b3ea438..041d33ad7688 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -244,6 +244,7 @@ struct venc_controls {
>         u32 header_mode;
>         u32 intra_refresh_mode;
>         u32 intra_refresh_mbs;
> +       bool aud_enable;
>  
>         u32 profile;
>         u32 level;
> diff --git a/drivers/media/platform/qcom/venus/venc.c
> b/drivers/media/platform/qcom/venus/venc.c
> index 71b525099e45..986d33b633db 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -696,6 +696,20 @@ static int venc_set_properties(struct venus_inst *inst)
>                         return ret;
>         }
>  
> +       if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> +           inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +               struct hfi_enable en = {};
> +
> +               ptype = HFI_PROPERTY_PARAM_VENC_H264_GENERATE_AUDNAL;
> +
> +               if (ctr->aud_enable)
> +                       en.enable = 1;
> +
> +               ret = hfi_session_set_property(inst, ptype, &en);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
>         if (ret)
>                 return ret;
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c
> b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 74b4269e2e9c..8d34a5396306 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -202,6 +202,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ctr->intra_refresh_mbs = ctrl->val;
>                 ctr->intra_refresh_mode = HFI_INTRA_REFRESH_RANDOM;
>                 break;
> +       case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
> +               ctr->aud_enable = ctrl->val;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -217,7 +220,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  {
>         int ret;
>  
> -       ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 34);
> +       ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 35);
>         if (ret)
>                 return ret;
>  
> @@ -372,6 +375,9 @@ int venc_ctrl_init(struct venus_inst *inst)
>                           V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB, 0,
>                           ((7680 * 4320) >> 8), 1, 0);
>  
> +       v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +                         V4L2_CID_MPEG_VIDEO_AU_DELIMITER, 0, 1, 1, 0);
> +

Any rationale not to make this the default ? AUD is optional in H264/HEVC but is
mandatory when contained into MPEG TS. Not enabling it by default lead to bugs
where invalid file are being produced. That would be my rationale to always
enable this, I'd be curious to see what you and others think of this proposal.

>         ret = inst->ctrl_handler.error;
>         if (ret)
>                 goto err;


