Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06F51C634B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 23:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgEEVpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 17:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728756AbgEEVpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 17:45:45 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C86C061A0F;
        Tue,  5 May 2020 14:45:44 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id ck5so1838168qvb.11;
        Tue, 05 May 2020 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s66XPkgMwGFSFmHdN4XrXjad6dUlsV4ovrv9xRFYc8U=;
        b=kVMitITx0hzfbz/PVolq7QDRCcCPFBsT3hxiGclz/IUyW6it4xuWFiSfiK4zDEHln4
         HrLkQ4yq6L7xaIZclHnqhS4pQuJs8IbV3lFRVFOK7dv8Gdgk3AU3DiwN1VKt6yi+u1kH
         KuD+4TLIWVojzJixQk96HMbBUc1z5UOsDd7ik2y//0NYRle7NY/83Z3xCibxeHrpcVs9
         ngR21sNPfyKgAIwPjpEsOHCQLvK4pnBnxNyJui4jEHyVwlnHILauPoV1l7VfxYoaaDgJ
         EpMaVY/hFrnyEXK//cCvBaTtNpGQuoglfsLW12WsNEytnwft7eMinWJbbraGbS17jxx/
         hK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s66XPkgMwGFSFmHdN4XrXjad6dUlsV4ovrv9xRFYc8U=;
        b=lXjO8N750pSG+EmE+LgK6NdHVTEknt6U8TMrusM1qbNVuaRCP7YMvJYUfHokVCsH5L
         5A+dxDIUw5GrpTTiFryEsNupEqVp1S9GOn+ZSSscGwjSxJlc7bt3EpGm+lOl11B1Diik
         qzEldEiKfX9JRUW6g/sqcRhwstAnjLnWYw05BsJDDI5MCu5Xomzn1+zWxEnpGmOK5XVZ
         1UN7A+wTkHnxsx08/8oFizh3/76kOgiXm12cl0nJaLR3mO+cFq3TDlBKARzVuVs/wR2l
         1Tb/blOL4xj8C6655HzDLL8aSXeQrRGDs6Ex8yj7O0xk4uxM2ixSATOyHF98XgVWTWTO
         A4Tw==
X-Gm-Message-State: AGi0PuaxZ4vHSLBppaMqFi7bMcV+cX3KM15Tyo0IkdV/PhuBDyQ1/c/R
        BdP6q8gx0gEO2bDILCu1Wvk2vd942RjWRBIvHuQ=
X-Google-Smtp-Source: APiQypJFCA7bIBQcIPXGf65hMMzl5Ubgd/CRnfOw5kselIiTWTYUO4nuMhm6aC6/ObAD90bzhq4CH0CGhSFXW807ufs=
X-Received: by 2002:a0c:ed42:: with SMTP id v2mr4945783qvq.94.1588715143885;
 Tue, 05 May 2020 14:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200505113410.v1.1.I30f6c1f7d6001931439d5950f31b1b0f8ca9b6e8@changeid>
In-Reply-To: <20200505113410.v1.1.I30f6c1f7d6001931439d5950f31b1b0f8ca9b6e8@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 5 May 2020 23:45:32 +0200
Message-ID: <CAFqH_50grfy_Bd_R7tPvKu=kmuUU96+G74iZXzmP0F_LaJJa2Q@mail.gmail.com>
Subject: Re: [PATCH v1] [media] mtk-mdp: Remove states for format checks
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Francois Buergisser <fbuergisser@chromium.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch. Two trivial comments, see below ...

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dt., 5 de maig
2020 a les 4:07:
>
> From: Francois Buergisser <fbuergisser@chromium.org>
>
> The mtk-mdp driver uses states to check if the formats have been set
> on the capture and output when turning the streaming on, setting
> controls or setting the selection rectangles.
> Those states are reset when 0 buffers are requested like when checking
> capabilities.
> This patch removes all format checks and set one by default as queues in
> V4L2 are expected to always have a format set.
>
> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/vidioc-streamon.html
> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/vidioc-g-ctrl.html
> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/vidioc-g-selection.html
>
> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

I guess that this Reviewed-by comes from a previous Gerrit workflow.
Usually, when you submit a patch to upstream you should remove the
Reviewed-by internally done, so I'd remove it, and ask Tomasz to give
you the Reviewed-by on the upstream patch.

> (cherry picked from commit 1887bb3924d030352df179347c8962248cdb903e)

Also, drop this, only has sense in the context of ChromeOS tree.

> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---

Apart from that, the patch looks good to me, so:

Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>



>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  | 90 +++++++------------
>  2 files changed, 34 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> index bafcccd71f31..dd130cc218c9 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -28,8 +28,6 @@
>  #define MTK_MDP_FMT_FLAG_CAPTURE       BIT(1)
>
>  #define MTK_MDP_VPU_INIT               BIT(0)
> -#define MTK_MDP_SRC_FMT                        BIT(1)
> -#define MTK_MDP_DST_FMT                        BIT(2)
>  #define MTK_MDP_CTX_ERROR              BIT(5)
>
>  /**
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index 821f2cf325f0..bb9caaf513bc 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -369,13 +369,6 @@ void mtk_mdp_ctx_state_lock_set(struct mtk_mdp_ctx *ctx, u32 state)
>         mutex_unlock(&ctx->slock);
>  }
>
> -static void mtk_mdp_ctx_state_lock_clear(struct mtk_mdp_ctx *ctx, u32 state)
> -{
> -       mutex_lock(&ctx->slock);
> -       ctx->state &= ~state;
> -       mutex_unlock(&ctx->slock);
> -}
> -
>  static bool mtk_mdp_ctx_state_is_set(struct mtk_mdp_ctx *ctx, u32 mask)
>  {
>         bool ret;
> @@ -726,11 +719,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
>                 ctx->quant = pix_mp->quantization;
>         }
>
> -       if (V4L2_TYPE_IS_OUTPUT(f->type))
> -               mtk_mdp_ctx_state_lock_set(ctx, MTK_MDP_SRC_FMT);
> -       else
> -               mtk_mdp_ctx_state_lock_set(ctx, MTK_MDP_DST_FMT);
> -
>         mtk_mdp_dbg(2, "[%d] type:%d, frame:%dx%d", ctx->id, f->type,
>                     frame->width, frame->height);
>
> @@ -742,13 +730,6 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
>  {
>         struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
>
> -       if (reqbufs->count == 0) {
> -               if (reqbufs->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> -                       mtk_mdp_ctx_state_lock_clear(ctx, MTK_MDP_SRC_FMT);
> -               else
> -                       mtk_mdp_ctx_state_lock_clear(ctx, MTK_MDP_DST_FMT);
> -       }
> -
>         return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
>  }
>
> @@ -758,14 +739,6 @@ static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
>         struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
>         int ret;
>
> -       /* The source and target color format need to be set */
> -       if (V4L2_TYPE_IS_OUTPUT(type)) {
> -               if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_SRC_FMT))
> -                       return -EINVAL;
> -       } else if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_DST_FMT)) {
> -               return -EINVAL;
> -       }
> -
>         if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
>                 ret = mtk_mdp_vpu_init(&ctx->vpu);
>                 if (ret < 0) {
> @@ -899,24 +872,21 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
>                 frame = &ctx->d_frame;
>
>         /* Check to see if scaling ratio is within supported range */
> -       if (mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_DST_FMT | MTK_MDP_SRC_FMT)) {
> -               if (V4L2_TYPE_IS_OUTPUT(s->type)) {
> -                       ret = mtk_mdp_check_scaler_ratio(variant, new_r.width,
> -                               new_r.height, ctx->d_frame.crop.width,
> -                               ctx->d_frame.crop.height,
> -                               ctx->ctrls.rotate->val);
> -               } else {
> -                       ret = mtk_mdp_check_scaler_ratio(variant,
> -                               ctx->s_frame.crop.width,
> -                               ctx->s_frame.crop.height, new_r.width,
> -                               new_r.height, ctx->ctrls.rotate->val);
> -               }
> +       if (V4L2_TYPE_IS_OUTPUT(s->type))
> +               ret = mtk_mdp_check_scaler_ratio(variant, new_r.width,
> +                       new_r.height, ctx->d_frame.crop.width,
> +                       ctx->d_frame.crop.height,
> +                       ctx->ctrls.rotate->val);
> +       else
> +               ret = mtk_mdp_check_scaler_ratio(variant,
> +                       ctx->s_frame.crop.width,
> +                       ctx->s_frame.crop.height, new_r.width,
> +                       new_r.height, ctx->ctrls.rotate->val);
>
> -               if (ret) {
> -                       dev_info(&ctx->mdp_dev->pdev->dev,
> -                               "Out of scaler range");
> -                       return -EINVAL;
> -               }
> +       if (ret) {
> +               dev_info(&ctx->mdp_dev->pdev->dev,
> +                       "Out of scaler range");
> +               return -EINVAL;
>         }
>
>         s->r = new_r;
> @@ -989,7 +959,6 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
>         struct mtk_mdp_ctx *ctx = ctrl_to_ctx(ctrl);
>         struct mtk_mdp_dev *mdp = ctx->mdp_dev;
>         struct mtk_mdp_variant *variant = mdp->variant;
> -       u32 state = MTK_MDP_DST_FMT | MTK_MDP_SRC_FMT;
>         int ret = 0;
>
>         if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
> @@ -1003,17 +972,15 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ctx->vflip = ctrl->val;
>                 break;
>         case V4L2_CID_ROTATE:
> -               if (mtk_mdp_ctx_state_is_set(ctx, state)) {
> -                       ret = mtk_mdp_check_scaler_ratio(variant,
> -                                       ctx->s_frame.crop.width,
> -                                       ctx->s_frame.crop.height,
> -                                       ctx->d_frame.crop.width,
> -                                       ctx->d_frame.crop.height,
> -                                       ctx->ctrls.rotate->val);
> -
> -                       if (ret)
> -                               return -EINVAL;
> -               }
> +               ret = mtk_mdp_check_scaler_ratio(variant,
> +                               ctx->s_frame.crop.width,
> +                               ctx->s_frame.crop.height,
> +                               ctx->d_frame.crop.width,
> +                               ctx->d_frame.crop.height,
> +                               ctx->ctrls.rotate->val);
> +
> +               if (ret)
> +                       return -EINVAL;
>
>                 ctx->rotation = ctrl->val;
>                 break;
> @@ -1090,6 +1057,7 @@ static int mtk_mdp_m2m_open(struct file *file)
>         struct video_device *vfd = video_devdata(file);
>         struct mtk_mdp_ctx *ctx = NULL;
>         int ret;
> +       struct v4l2_format default_format;
>
>         ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
> @@ -1144,6 +1112,16 @@ static int mtk_mdp_m2m_open(struct file *file)
>         list_add(&ctx->list, &mdp->ctx_list);
>         mutex_unlock(&mdp->lock);
>
> +       /* Default format */
> +       memset(&default_format, 0, sizeof(default_format));
> +       default_format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       default_format.fmt.pix_mp.width = 32;
> +       default_format.fmt.pix_mp.height = 32;
> +       default_format.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420M;
> +       mtk_mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> +       default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +       mtk_mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> +
>         mtk_mdp_dbg(0, "%s [%d]", dev_name(&mdp->pdev->dev), ctx->id);
>
>         return 0;
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
