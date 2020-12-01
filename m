Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4F72C9660
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 05:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgLAER7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 23:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgLAER6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 23:17:58 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3569EC0613D2
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 20:17:18 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s27so1308066lfp.5
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 20:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WpC1M4YbFxEU0qcfNjt8XtI70ux/NgpyKgBiGPj7CHw=;
        b=hxam5/3a/ox2onWPgbCP5KHp2k+3vN3YKm2u7WtZDqGN2VeQG4i0IKiHlAt9HdNW28
         LY0CuFXXSe9a0Zc05ixo7TwKrDQhRDtZk7LelMIGFUrZ6RFzzqWdhS9oFiw2FqfamFb9
         igZapYdi0SW+tGy5ug3VD3zoARszUEDiQONkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WpC1M4YbFxEU0qcfNjt8XtI70ux/NgpyKgBiGPj7CHw=;
        b=hUajLZH5bXdj6wGp9LzzhoxmGyT+Q/P/yFxe5V9iUR6Lr8XilC7aE+1u9ihjhkE1Lj
         6+UwzeRv1/5kb8SjzWbigewwy+ecuxJPMYm515w/izuc5vWIcY4h7sdGK6uaR8xOhL6O
         A/ZaBM/WiKmNZy/4oEp9/Oja0IKDTsGqmrtHZ6hhlG8HrAUYu93boUjhhC8hj7oi9SBb
         MAcpRGDEx9pyrPxSSwSRlpqbxPbXYXvwjkp8lJw7I3jtDEzQKxTqiuqYvg7dDdcIVZ4V
         RrcXHCPicBGqacCUk/7/gqSvPuu50V7R9c5Odtaaf8X/y1jdNH+kNfmQhvdcfc/Jt6zT
         J2AA==
X-Gm-Message-State: AOAM532x5glSShNZax0qGmFAe0n2GjCaRNMAgktzpE8R9DDJ51jMUis7
        7s/5q7y7jE1y8OH0sF69hewTeNwcpcM7R2Z/
X-Google-Smtp-Source: ABdhPJxVmSdHgaNepBuj0f24HZ+IWDTs9+K0VoE1retJ4ySt2mO3qfKKtbEIy5DMyBK1EGkUEQkLHA==
X-Received: by 2002:a19:248a:: with SMTP id k132mr388368lfk.387.1606796235760;
        Mon, 30 Nov 2020 20:17:15 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id u8sm63394lfb.133.2020.11.30.20.17.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 20:17:15 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id r24so1277297lfm.8
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 20:17:14 -0800 (PST)
X-Received: by 2002:a19:3817:: with SMTP id f23mr346974lfa.587.1606796234247;
 Mon, 30 Nov 2020 20:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20201129060517.2029659-1-frkoenig@chromium.org>
 <CAPBb6MUDUs2d+hDRnfg3-7jwqQX8jO1AwjbjyWppE8a64ovvCA@mail.gmail.com> <CAMfZQbzygbRZZkhA4fRr9kkeUFHwSY1gvOBpYyFtwNLSuPpHYg@mail.gmail.com>
In-Reply-To: <CAMfZQbzygbRZZkhA4fRr9kkeUFHwSY1gvOBpYyFtwNLSuPpHYg@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 1 Dec 2020 13:17:03 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVY+yBSTkdwR1Um6Er1bJxbgTL9nx1HYHpE-w--sfbaBg@mail.gmail.com>
Message-ID: <CAPBb6MVY+yBSTkdwR1Um6Er1bJxbgTL9nx1HYHpE-w--sfbaBg@mail.gmail.com>
Subject: Re: [PATCH] venus: venc: Add VIDIOC_TRY_ENCODER_CMD support
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 1, 2020 at 1:07 PM Fritz Koenig <frkoenig@chromium.org> wrote:
>
> On Mon, Nov 30, 2020 at 7:24 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > On Sun, Nov 29, 2020 at 3:05 PM Fritz Koenig <frkoenig@chromium.org> wrote:
> > >
> > > V4L2_ENC_CMD_STOP and V4L2_ENC_CMD_START are already
> > > supported.  Add a way to query for support.
> >
> > I think your Signed-off-by is missing (checkpatch.pl should warn you
> > about such problems).
> >
> > >
> > > ---
> > >  drivers/media/platform/qcom/venus/venc.c | 26 ++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> > > index 2ddfeddf98514..e05db3c4bfb24 100644
> > > --- a/drivers/media/platform/qcom/venus/venc.c
> > > +++ b/drivers/media/platform/qcom/venus/venc.c
> > > @@ -507,6 +507,27 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
> > >         return 0;
> > >  }
> > >
> > > +static int
> > > +venc_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
> > > +{
> > > +       struct venus_inst *inst = to_inst(file);
> > > +       struct device *dev = inst->core->dev_dec;
> > > +
> > > +       switch (cmd->cmd) {
> > > +       case V4L2_ENC_CMD_STOP:
> > > +       case V4L2_ENC_CMD_START:
> > > +               if (cmd->flags != 0) {
> > > +                       dev_dbg(dev, "flags=%u are not supported", cmd->flags);
> > > +                       return -EINVAL;
> > > +               }
> > > +               break;
> > > +       default:
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int
> > >  venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
> >
> > I am not seeing venc_encoder_cmd() in the media tree, does this patch
> > depend on others that are not yet merged? If so they should be
> > submitted together as a series.
> >
>
> Sorry, I'm still a little unsure of procedures here.  There is another
> patch set[1] posted
> and I thought it was missing this part.  It turns out I had not
> applied the whole set to
> my tree.
>
> > >  {
> > > @@ -514,6 +535,10 @@ venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
> > >         struct hfi_frame_data fdata = {0};
> > >         int ret = 0;
> > >
> > > +       ret = venc_try_encoder_cmd(file, fh, cmd);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> >
> > v4l2_m2m_ioctl_try_encoder_cmd() is called right below, and AFAICT
> > does the same thing as the newly-defined venc_try_encoder_cmd(). So
> > IIUC this patch can be turned into a one-liner that does just the
> > following:
> >
> > @@ -575,6 +600,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
> >         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> >         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> >         .vidioc_encoder_cmd = venc_encoder_cmd,
> > +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
> >  };
> >
> Yes, that's how it is in the current patch[2], which is why I may have
> missed it.
> (I'm embarrassed because I reviewed that patch and then posted mine.)

Ah, ack - no worries, I am also far from being on top of everything
and missed the connection with that patchset. :)

I guess we can drop this one then.

>
> > >         ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
> > >         if (ret)
> > >                 return ret;
> > > @@ -575,6 +600,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
> > >         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> > >         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > >         .vidioc_encoder_cmd = venc_encoder_cmd,
> > > +       .vidioc_try_encoder_cmd = venc_try_encoder_cmd,
> > >  };
> > >
> > >  static int venc_set_properties(struct venus_inst *inst)
> > > --
> > > 2.29.2.454.gaff20da3a2-goog
> > >
>
> [1] : https://patchwork.kernel.org/project/linux-media/list/?series=382113
> [2]: https://patchwork.kernel.org/project/linux-media/patch/20201111143755.24541-7-stanimir.varbanov@linaro.org/
