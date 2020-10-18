Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CA8292071
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 00:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgJRWTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 18:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbgJRWTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 18:19:43 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5AFC061755
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2020 15:19:43 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id cm24so8322332edb.0
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2020 15:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HNlNSWtGKHz22BkJOTQfDL7XA8BtaJWUZUUPXDCETnw=;
        b=JRtiX+f5Af6nqke8AiQdsPQwxw9FOoxZSc4NgHM9vLVt9hKkwbuYGxBK7A9LxcZIEh
         UX6CcbLvYNAwOAbLAIAmux7gbPYhh7FCRu+dTUUMGQurunzaNov2S0aAe3Kct8j44cIw
         8SOYbD/bx6iPRs+nQ2DhktxKWx2AUe5OaBLhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HNlNSWtGKHz22BkJOTQfDL7XA8BtaJWUZUUPXDCETnw=;
        b=LDHfnnbkoQTG0rCqk2FL8Q059P7LUFR499ws3fftdxd9hjwBY47wVGpwv6OI0m7aE/
         aBdxRvXWUvOIrVgIKo4EQ6h5PiUIp2CVvdmGqNh+RFwyfudutZzfSywATBZ6ItYeMw2F
         OveYufyhTX3DjOKp8FhLQ3fYOfMvbRGuLZ8BKfXAah4nVWG4g5jU4SgQD6g4w7cuGJEe
         a5J/gL1R8f/J03ulg2fSk401ioH/Fklu+VGYbRJ37PboHQOljD+Sd+vNihGoEwLlRK3T
         Jrb5EBb+qN1Kr6rxpQbHrfGAEpGEFD1nlrKW6y6NTAYfssE+JymQyTzmaQ53X8Bm+5Gv
         fKEg==
X-Gm-Message-State: AOAM531toRHeFxEs8i0Acci4lcT3grK8XhxDoYgoqSPNGx79+ujZshku
        HbJO8YS3hnravfsHIl6Ah3aPhoukS7w+QA==
X-Google-Smtp-Source: ABdhPJyXA0V9Eh1VEOzgf80n+vzFOUdZGOxitAaxLRlCIhDLJ7IL++OvK7biIDYsmMKQIdOoC5VVBQ==
X-Received: by 2002:a50:ff10:: with SMTP id a16mr15210334edu.83.1603059581888;
        Sun, 18 Oct 2020 15:19:41 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id i20sm8164399edv.96.2020.10.18.15.19.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2020 15:19:41 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id j136so10850654wmj.2
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2020 15:19:41 -0700 (PDT)
X-Received: by 2002:a1c:2586:: with SMTP id l128mr4802138wml.49.1603059580798;
 Sun, 18 Oct 2020 15:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201009084533.2405320-1-acourbot@chromium.org>
In-Reply-To: <20201009084533.2405320-1-acourbot@chromium.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sun, 18 Oct 2020 15:19:28 -0700
X-Gmail-Original-Message-ID: <CAMfZQbw4wFzcocXXGavYdt+o8ydUoW4rSw4QnnrbZgwWUnp7Nw@mail.gmail.com>
Message-ID: <CAMfZQbw4wFzcocXXGavYdt+o8ydUoW4rSw4QnnrbZgwWUnp7Nw@mail.gmail.com>
Subject: Re: [PATCH] venus: vdec: return parsed crop information from stream
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It looks like only h.264 streams are populating the event.input_crop
struct when receiving the HFI_INDEX_EXTRADATA_INPUT_CROP message in
event_seq_changed().  vp8/vp9 streams end up with the struct filled
with 0.

On Fri, Oct 9, 2020 at 1:45 AM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Per the stateful codec specification, VIDIOC_G_SELECTION with a target
> of V4L2_SEL_TGT_COMPOSE is supposed to return the crop area of capture
> buffers containing the decoded frame. Until now the driver did not get
> that information from the firmware and just returned the dimensions of
> CAPTURE buffers.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 21 ++++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7b79a33dc9d6..3bc129a4f817 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -361,6 +361,7 @@ struct venus_inst {
>         unsigned int streamon_cap, streamon_out;
>         u32 width;
>         u32 height;
> +       struct v4l2_rect crop;
>         u32 out_width;
>         u32 out_height;
>         u32 colorspace;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index ea13170a6a2c..ee74346f0cae 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -325,6 +325,10 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>
>         inst->width = format.fmt.pix_mp.width;
>         inst->height = format.fmt.pix_mp.height;
> +       inst->crop.top = 0;
> +       inst->crop.left = 0;
> +       inst->crop.width = inst->width;
> +       inst->crop.height = inst->height;
>
>         if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 inst->fmt_out = fmt;
> @@ -343,6 +347,9 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>             s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>                 return -EINVAL;
>
> +       s->r.top = 0;
> +       s->r.left = 0;
> +
>         switch (s->target) {
>         case V4L2_SEL_TGT_CROP_BOUNDS:
>         case V4L2_SEL_TGT_CROP_DEFAULT:
> @@ -363,16 +370,12 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>         case V4L2_SEL_TGT_COMPOSE:
>                 if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>                         return -EINVAL;
> -               s->r.width = inst->out_width;
> -               s->r.height = inst->out_height;
> +               s->r = inst->crop;
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
> -       s->r.top = 0;
> -       s->r.left = 0;
> -
>         return 0;
>  }
>
> @@ -1309,6 +1312,10 @@ static void vdec_event_change(struct venus_inst *inst,
>
>         inst->width = format.fmt.pix_mp.width;
>         inst->height = format.fmt.pix_mp.height;
> +       inst->crop.left = ev_data->input_crop.left;
> +       inst->crop.top = ev_data->input_crop.top;
> +       inst->crop.width = ev_data->input_crop.width;
> +       inst->crop.height = ev_data->input_crop.height;
>
>         inst->out_width = ev_data->width;
>         inst->out_height = ev_data->height;
> @@ -1412,6 +1419,10 @@ static void vdec_inst_init(struct venus_inst *inst)
>         inst->fmt_cap = &vdec_formats[0];
>         inst->width = frame_width_min(inst);
>         inst->height = ALIGN(frame_height_min(inst), 32);
> +       inst->crop.left = 0;
> +       inst->crop.top = 0;
> +       inst->crop.width = inst->width;
> +       inst->crop.height = inst->height;
>         inst->out_width = frame_width_min(inst);
>         inst->out_height = frame_height_min(inst);
>         inst->fps = 30;
> --
> 2.28.0.1011.ga647a8990f-goog
>
