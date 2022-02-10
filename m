Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9484B1673
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 20:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344038AbiBJTg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 14:36:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344044AbiBJTgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 14:36:51 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA0821B7
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 11:36:51 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u18so12734470edt.6
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ptZVq5/OACdzoIInBegUu3n6cJuM6ROH0MFWfN4fC5g=;
        b=Al1lumb+Ruq7QDmYAV8g8apKYzEOgUKvXOn2emwFsnhX+LXgtj8ehfg/7Y6wT1YbqO
         sKIJSw2bIeGaA7TlIBdnUR45BjlCt8zWpjm5EVBmcESOVF/8+jnewYuF+4Ae44kc/20k
         KKXxCAI6kHw6F2P/kOKZZu6RSYD49LFuYQnoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ptZVq5/OACdzoIInBegUu3n6cJuM6ROH0MFWfN4fC5g=;
        b=mBMs3aw2nu4SGuqewvfeSj86yiQWYCI3AvVPWMhk6GkUXVJ6XXtnpRsyUU5WEs+3IY
         kyBaA+fpGXiuRgaaqngXN3a7oomkLuLU+S+IFbsIEtutK4FnSYyM/Ni4cwUFaovtIrm3
         bwOZtGc9D77l2vtg/Xlu5ezihr11wBixboqnUZq7cKslJb0bdkghnocVOTUkXcFYbiAz
         8XUVXA2uOyPGPS2mQptFB4aD0w5cquOJ3FoZcRbST2qXS0tv28FDZ1VTLRmpcY8zE37x
         mtbk2Di+8WVOza8EQ2MNg7W345e/euzbu8B7vWcko/Lrx7M7eGqN8fmHPQfKuwcOO5Zc
         sWaA==
X-Gm-Message-State: AOAM53347Tv+c+1Ki6Sn9c4Kxu9cmfgpC3AzKJYnN6IMa25z+1q0YgGH
        QznaXIN17lDYMGTPdp1PoJBehrOS29LEbw==
X-Google-Smtp-Source: ABdhPJzDnC88FpxaHTuALEyMRAFEsbCwwEZN20MsxoMSqvxIhD12WuPOpuhwKG6ucvCVE6HtpU7Whg==
X-Received: by 2002:a50:d616:: with SMTP id x22mr10071233edi.47.1644521809533;
        Thu, 10 Feb 2022 11:36:49 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id r22sm9939779edt.51.2022.02.10.11.36.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 11:36:48 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id w11so11432253wra.4
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 11:36:48 -0800 (PST)
X-Received: by 2002:adf:dc08:: with SMTP id t8mr7614168wri.40.1644521808015;
 Thu, 10 Feb 2022 11:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20220208155204.630966-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20220208155204.630966-1-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Thu, 10 Feb 2022 14:36:35 -0500
X-Gmail-Original-Message-ID: <CAMfZQbw6j_ojbCur3S3D6iJ+RLbDcbE_px1ADMyE8HAuehUp_Q@mail.gmail.com>
Message-ID: <CAMfZQbw6j_ojbCur3S3D6iJ+RLbDcbE_px1ADMyE8HAuehUp_Q@mail.gmail.com>
Subject: Re: [PATCH] venus: venc: Fix h264 8x8 transform control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 8, 2022 at 10:52 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> During encoder driver open controls are initialized via a call
> to v4l2_ctrl_handler_setup which returns EINVAL error for
> V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM v4l2 control. The control
> default value is disabled and because of firmware limitations
> 8x8 transform cannot be disabled for the supported HIGH and
> CONSTRAINED_HIGH profiles.
>
> To fix the issue change the control default value to enabled
> (this is fine because the firmware enables 8x8 transform for
> high and constrained_high profiles by default). Also, correct
> the checking of profile ids in s_ctrl from hfi to v4l2 ids.
>
> Fixes: bfee75f73c37 ("media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c       | 4 ++--
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 84bafc3118cc..adea4c3b8c20 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -662,8 +662,8 @@ static int venc_set_properties(struct venus_inst *inst)
>
>                 ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>                 h264_transform.enable_type = 0;
> -               if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
> -                   ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +               if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> +                   ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>                         h264_transform.enable_type = ctr->h264_8x8_transform;
>
>                 ret = hfi_session_set_property(inst, ptype, &h264_transform);
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 1ada42df314d..ea5805e71c14 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -320,8 +320,8 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ctr->intra_refresh_period = ctrl->val;
>                 break;
>         case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> -               if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH &&
> -                   ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +               if (ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_HIGH &&
> +                   ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>                         return -EINVAL;
>
>                 /*
> @@ -457,7 +457,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>                           V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
>
>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> -                         V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
> +                         V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 1);
>
>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>                           V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
> --
> 2.25.1
>
Tested-by: Fritz Koenig <frkoenig@chromium.org>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
