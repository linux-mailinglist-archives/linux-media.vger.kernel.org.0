Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB6E330EDE
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 14:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhCHNHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 08:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCHNHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 08:07:46 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E0FC06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 05:07:46 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id d25so4770805vsr.11
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 05:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=deq0yqA29vIrPB8WmXbuxApDbzkis5nTAdLSUP1pwOE=;
        b=KYoKxncZ18d+SXQpFuFZgYCdO/u18sJFykWVSj/yYQl4XRabLW/Sk2EoCE4MFEJ4A5
         MJx/H/fBfZbtlrrPfjrRlxw2Jt/XvxGSkq7nesT5OlF1ToAlUMBKwcqHpv57+KLc0zpp
         ltjZkFXIXDDy8BjtJPVsjxuKKFcwHYUl3ymSy3QQ3k7wZ/UTgzPPbf/PE9yp7HZOyBQD
         pQDRlJqJ2cz6jExuR8SzQxCrykETFwLv+vSx5PvRXyOe794tfU1CGxMsXDnnHX7XTb47
         TeFfX2BqqMR7xnk9aFoCDpMwNpBmPDyiv6I3+jsXvRxG5/UfszqXz6dp7b/utczpCgfC
         GzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=deq0yqA29vIrPB8WmXbuxApDbzkis5nTAdLSUP1pwOE=;
        b=QRJOJVQPHywPZHZQwhFFhRNY2HcVy8Hwgp0OsR99/8UXZTYRpqxEa9PsRLx7xv14gx
         z4FosTeNj8VVZdaPr+Er36bedNIyMrWRpDEWvc3l0DzXXiBp5wKBoXDuP/eUUImTX5iR
         T3uktfL2ATj6rKrV2DYzmh5I6mzyQxm/sS23/G+x5KY7atk+O4WQeZRwvieY3zTTh3PY
         mEbQk+GtTDtYLN+KzlQSTscA5ztKTeKL3FafWYees/uD/tbxM1SpkvLBcTzIIjz4fK5X
         K7LLmswaNyuIBlqQvPDVOyNl0jkXOJ89uJYPl2fm+nOQy3bConrwNT5YTz+10ZNlaTlY
         RrnQ==
X-Gm-Message-State: AOAM531/GpUK+A4dYVEfsGgU9VCOAPhuOvrc26AFrx0GzTY22BBRYgxK
        K7a6qtFpfe2q7tG6rymhAVxgCUVLjCcJ3mGwdVx5BqNIj244KQ==
X-Google-Smtp-Source: ABdhPJxkF5qkE2inEdZP+pPZPaTckLoHUSckdlWM0meoANY3bjnVcJIS42T0wDag4s4BJGpu0Oh/sxChTvSBsGmVwSw=
X-Received: by 2002:a67:f04f:: with SMTP id q15mr12595267vsm.22.1615208865673;
 Mon, 08 Mar 2021 05:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-8-emil.l.velikov@gmail.com> <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
In-Reply-To: <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 8 Mar 2021 13:07:33 +0000
Message-ID: <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 Hi Ezequiel,

Thanks for the prompt reply

On Sat, 6 Mar 2021 at 11:25, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> (adding another Nicolas)
>
> Hi Emil,
>
> Thanks a lot for the patch.
>
> On Fri, 2021-03-05 at 18:39 +0000, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > The SoC features a Hantro G1 compatible video decoder.
> >
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
>
> Usually device-tree changes go to their own patch.
>
> The new compatible string "atmel,sama5d4-vdec" needs
> an update to the DT bindings, see Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> for an example.
>
> DT bindings change should also go to a separate
> patch, see Documentation/devicetree/bindings/submitting-patches.rst.
>
Will do. Thanks

> >  arch/arm/configs/sama5_defconfig              |   3 +
>
> Better if config changes are a separate patch.
>
> But also, the driver is in staging and we haven't enabled
> in ARM64 defconfig. Let's leave that decision to the machine
> maintainer to decide.
>
Makes sense. Will keep it separate patch for completeness sake, with
explicit note.
ARM/Microchip (AT91) SoC maintainers will be in CC list and will defer
the decision to them.

> > +static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_YUYV,
> > +               .codec_mode = HANTRO_MODE_NONE,
> > +       },
> > +};
> > +
>
> I haven't found information on how the series
> was tested in the cover letter, could you add that to the next
> iteration?
>
> Please test the YUYV post-processed output and MPEG-2 decoding as well.
>
Any recommendations for MPEG-2 and post-processing testing? For the
former I could use gstreamer on Big Buck Bunny or other media, yet not
sure about the latter.

> Also add the fluster score on this platform, and while here you could
> give a pass at v4l2-compliance, which should pass without failures.
> Note that you need to use v4l2-compliance HEAD from git.
>
> https://git.linuxtv.org/v4l-utils.git
>
Ack, will do. Fwiw I did not see any results in the i.MX8M series so I
followed suit :-P

> > +static int sama5d4_hw_init(struct hantro_dev *vpu)
> > +{
> > +       return 0;
>
> Ah, the hantro_variant.init ops is not optional, but
> if this VPU has no hw-specific init, then it should be.
>
> In any case, we might get rid of it soon: Benjamin's work
> will hopefully remove the i.MX8M need for ctrl_base.
>
> And then the static clk_set_rate() in Rockchip variants could
> be replaced with some dynamic rate using devfreq.
>
Neat looking forward to it.

Thanks
Emil
