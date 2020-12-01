Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C732C963F
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 05:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgLAEHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 23:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgLAEHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 23:07:43 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DE1C0613CF
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 20:07:02 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id x16so1132494ejj.7
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 20:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCRmzVN+2UNsW5awjaPA+4a7ykSzhUHE9ny8s/eIifE=;
        b=Fzk9WgLMwkrhL6Y4Liy59sv29piioGuWzjiVlNTpFoTCFI0MOt9tkTKryfA8ZGwp2n
         LLX7PovUTxI4WKK8DB6Zx90IKh6+A0rrrUzUEXv4qeCIhH7H1/4zX2Rt1sJ80zx90zBV
         5yJ5eSU+8VasR9FNC2bZxeuI4WoOTA0gJLOK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCRmzVN+2UNsW5awjaPA+4a7ykSzhUHE9ny8s/eIifE=;
        b=TzEaRWaBwAiTa/7UY7qr1Ib4cDJuO7Jd5YZL7MNCWzwx36nvTB3FfOtNoT5l7KWzy/
         TPAjiGCd2Szq/sR7Ve21IKjpUGNEkXlHMqa8Jl/9mnt2BHRiQZx77nuDnmsqVfpU3YCS
         N8IKKPzfesMUtRF04c4WdRwRwIExp44FGVvGuWSlBF7Voqa4gcFUzNznls0qrtxAc+73
         dQVNjx8bsfflobFWAI7+3sgmDlGdrIOMDuTlRWNCQAUyUTY7zaRP5Zs2wEZtPQJpWCgf
         RmTAxeYkDkD6jJ6sC5+JUOQTnDUs2WTMk0B4DiYUnSkWNSqDUi7Wc/tY/Y8cFWD5WZwa
         6qEg==
X-Gm-Message-State: AOAM530zKM7PqHv/dRL6wsydABTa38om9nbp2nQCn/jhzic1vkGRIyGC
        ZCxGKznVij7q2maX3HU0/4QjF0NLlsRm8w==
X-Google-Smtp-Source: ABdhPJwS/ThblqN+dl9Y/z0+lClf6O0eh3wDgULsdWfvYFGLEUl2961jvimtIWscR/rDzKsNgaRaWA==
X-Received: by 2002:a17:906:4698:: with SMTP id a24mr1231633ejr.90.1606795620831;
        Mon, 30 Nov 2020 20:07:00 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a10sm195778ejk.92.2020.11.30.20.07.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 20:07:00 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id a3so1527359wmb.5
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 20:07:00 -0800 (PST)
X-Received: by 2002:a1c:9e53:: with SMTP id h80mr605360wme.50.1606795619636;
 Mon, 30 Nov 2020 20:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20201129060517.2029659-1-frkoenig@chromium.org> <CAPBb6MUDUs2d+hDRnfg3-7jwqQX8jO1AwjbjyWppE8a64ovvCA@mail.gmail.com>
In-Reply-To: <CAPBb6MUDUs2d+hDRnfg3-7jwqQX8jO1AwjbjyWppE8a64ovvCA@mail.gmail.com>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Mon, 30 Nov 2020 20:06:47 -0800
X-Gmail-Original-Message-ID: <CAMfZQbzygbRZZkhA4fRr9kkeUFHwSY1gvOBpYyFtwNLSuPpHYg@mail.gmail.com>
Message-ID: <CAMfZQbzygbRZZkhA4fRr9kkeUFHwSY1gvOBpYyFtwNLSuPpHYg@mail.gmail.com>
Subject: Re: [PATCH] venus: venc: Add VIDIOC_TRY_ENCODER_CMD support
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 30, 2020 at 7:24 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Sun, Nov 29, 2020 at 3:05 PM Fritz Koenig <frkoenig@chromium.org> wrote:
> >
> > V4L2_ENC_CMD_STOP and V4L2_ENC_CMD_START are already
> > supported.  Add a way to query for support.
>
> I think your Signed-off-by is missing (checkpatch.pl should warn you
> about such problems).
>
> >
> > ---
> >  drivers/media/platform/qcom/venus/venc.c | 26 ++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> > index 2ddfeddf98514..e05db3c4bfb24 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -507,6 +507,27 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
> >         return 0;
> >  }
> >
> > +static int
> > +venc_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
> > +{
> > +       struct venus_inst *inst = to_inst(file);
> > +       struct device *dev = inst->core->dev_dec;
> > +
> > +       switch (cmd->cmd) {
> > +       case V4L2_ENC_CMD_STOP:
> > +       case V4L2_ENC_CMD_START:
> > +               if (cmd->flags != 0) {
> > +                       dev_dbg(dev, "flags=%u are not supported", cmd->flags);
> > +                       return -EINVAL;
> > +               }
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int
> >  venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
>
> I am not seeing venc_encoder_cmd() in the media tree, does this patch
> depend on others that are not yet merged? If so they should be
> submitted together as a series.
>

Sorry, I'm still a little unsure of procedures here.  There is another
patch set[1] posted
and I thought it was missing this part.  It turns out I had not
applied the whole set to
my tree.

> >  {
> > @@ -514,6 +535,10 @@ venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
> >         struct hfi_frame_data fdata = {0};
> >         int ret = 0;
> >
> > +       ret = venc_try_encoder_cmd(file, fh, cmd);
> > +       if (ret < 0)
> > +               return ret;
> > +
>
> v4l2_m2m_ioctl_try_encoder_cmd() is called right below, and AFAICT
> does the same thing as the newly-defined venc_try_encoder_cmd(). So
> IIUC this patch can be turned into a one-liner that does just the
> following:
>
> @@ -575,6 +600,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>         .vidioc_encoder_cmd = venc_encoder_cmd,
> +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
>  };
>
Yes, that's how it is in the current patch[2], which is why I may have
missed it.
(I'm embarrassed because I reviewed that patch and then posted mine.)

> >         ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
> >         if (ret)
> >                 return ret;
> > @@ -575,6 +600,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
> >         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> >         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> >         .vidioc_encoder_cmd = venc_encoder_cmd,
> > +       .vidioc_try_encoder_cmd = venc_try_encoder_cmd,
> >  };
> >
> >  static int venc_set_properties(struct venus_inst *inst)
> > --
> > 2.29.2.454.gaff20da3a2-goog
> >

[1] : https://patchwork.kernel.org/project/linux-media/list/?series=382113
[2]: https://patchwork.kernel.org/project/linux-media/patch/20201111143755.24541-7-stanimir.varbanov@linaro.org/
