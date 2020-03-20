Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8022B18CC2A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 12:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgCTLFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 07:05:33 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35572 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgCTLFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 07:05:32 -0400
Received: by mail-oi1-f194.google.com with SMTP id k8so6080054oik.2;
        Fri, 20 Mar 2020 04:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qk9ZSy2DLiaTxJZm6e71Gii7NkNOP2X+Pdycr1qsNeg=;
        b=T+nBHriHh3lIfVReU0GHeHK4HHl7g31JXkRS+J8PxYVNM8aTF8UariRa8t2V040IKG
         HAUVZBA3nR5ojM6l9uUyzOlWfUJQ/w18Lpmx1jMFdMhdD0xf7OPg6ujRsur2x93NdXxb
         kzUFprOZaroPEkHbDiLiZr4SyvGue9CQ5F3bTWt4K1HJep0A0fVVoFpCXD87AJUWeG56
         18srr4cv/SvMlaeFscn9ClWZ0egkOdo1RPZC+2Sdeb0US1HiEiBxtewWqP+gUgx8ml+X
         hpTPVvuOds4+3p6LlfLknbe7MmP9RrtQ6S5pVQc34qsWUQcsV3/+w+rPzYuizVdMBrtX
         XcSw==
X-Gm-Message-State: ANhLgQ0Ye+sRJO/h+vexCU8GmwoApqE6kEOJQQkMVEciUdjYjUQD16wO
        dwm8g/NhZpYo6egYNWiv4n4ci9SZYrZSMasvF4Xl7w==
X-Google-Smtp-Source: ADFU+vvZyP9GBWBhMAk5XHXHMbgIrKzVUdFFXha+oMjRGimfx83JH0ySN8kjfcMPKWHrHJ11GggEe2Z4AVFy0DPZVrQ=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr6113278oie.54.1584702331516;
 Fri, 20 Mar 2020 04:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <252bb433f47b0ccb61bb077abdbd892091abc550.1584639664.git.alexander.riesen@cetitec.com>
 <CAMuHMdXOAQtuxCAfb=sZKodyJWwSrf-GO-pdV3HYkOytQW4ENg@mail.gmail.com> <20200320105846.GG4344@pflmari>
In-Reply-To: <20200320105846.GG4344@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 12:05:20 +0100
Message-ID: <CAMuHMdVRJZ+RLSxeFdXXPntVxCUMd-Ai+=vizFrvN-CHNW=kjA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] media: adv748x: add support for HDMI audio
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Fri, Mar 20, 2020 at 11:58 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Fri, Mar 20, 2020 09:43:29 +0100:
> > On Thu, Mar 19, 2020 at 6:42 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > This adds an implemention of SoC DAI driver which provides access to the
> > > I2S port of the device.
>
> I just noticed I don't do clk_prepare_enable anywhere.
> Shouldn't the clock master enable its clocks somewhere?

Usually the consumer is responsible for doing that.
Does the rcar-sound driver do that?

But in this case, perhaps the clock should be enabled implicitly in response
to a request from the audio subsystem, like you do below.

Note that you register a fixed-rate clock, which is assumed to be always
enabled. Perhaps a gateable clock type is more appropriate?

> > > diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
> > > new file mode 100644
> > > index 000000000000..4775a0c7ed7f
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/adv748x/adv748x-dai.c
> ...
> > > +static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> > > +{
> > > +       struct adv748x_state *state = state_of(dai);
> > > +
> > > +       if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
> > > +               return -EINVAL;
> > > +       return set_audio_pads_state(state, 1);
> > > +}
>
> For example, here, after activation of the lines succeeded?
>
> > > +static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
> > > +{
> > > +       struct adv748x_state *state = state_of(dai);
> > > +
> > > +       set_audio_pads_state(state, 0);
> > > +}
>
> And clk_disable_unprepare here, before shutting down the pads?
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
