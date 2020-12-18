Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A36B2DE2CB
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 13:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgLRMZ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 07:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgLRMZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 07:25:59 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95A6C0617B0
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 04:25:18 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id a6so2149322wmc.2
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 04:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zptP6/C3RZis9BrFo7fAAZrKYnn57+H7GBHOg14Q8CI=;
        b=jCWOZpsvN/MFYNTDjM8lTtODa80v6w0yqKS0T+vYL+j/9oECDChQ+pPaaqz9Vt5Vw6
         fKD4fcfJQu+yVAShZxEaqJTEdeVuI2JnSTybq/58dqu8QYcrDG/CUNabvUKUA+QIttf8
         8wuxAg6wJ+BW4yqEEptP/q+ZRbkw3kJTD5SDXJ8lLJE3riADWybY9IVlI84BUrP3a8xG
         QNiabjyYkR4AOvwiJ5TMiQzoxrlZQDJEvhKl/04DAqpzxx8qABrdU0aFt+ZHSzkbRrv2
         Guu+H/FNRD3M06EdvdXUojrlDS3i7aMQEx7uBKEgZHgH3k5xaBECBXUHb6eU83eDxixM
         fwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zptP6/C3RZis9BrFo7fAAZrKYnn57+H7GBHOg14Q8CI=;
        b=f3lmNKHDaJqmomptLSbMpR4EIz3/GxnF4ggC+E+s5lkd0Qs91ijEBeHZw1RNQm56P7
         F6YnSuFo5g836ojTT+T8cxc8JxhRjRawP15DE2M6mQ12o4RiLMJPcQegFlFktM+51F7p
         dYvM5IWRyyE+dEZ66rh0hIj1o+yPrVrkMFgvANFLBGuAUALTnVZSv+zptLoTNF5LnNQg
         SMTAT6kx0WkTnjt7S0IeL+qJf9hCURPjSJuQacZuVblEb/q+rfZdr8j9KP0DcrsXX2z2
         tbEPSWlXIwtLhDxuqx6eF3/4cG2kXmQbCNK0QkL7KZ69WuzGJpyxir361nZ2Or3uHMfi
         oOew==
X-Gm-Message-State: AOAM531792MDtY/GllsIN6D4rVx/mNhbOdiFyGCLww7goqLrRH6dk5U0
        R/VYFXNe0bCsiGdr8Ndzgq6MNKM9Qg4g7N/lgMb7Tw==
X-Google-Smtp-Source: ABdhPJwuzjSRddGf3JSGAorsM0m907uhm9GMFMicPeUh5xxdB2QH9IdsnNN2SnWpa6yGYNmoew4qfdSRh1h62k4hYr0=
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr4038981wmn.96.1608294317336;
 Fri, 18 Dec 2020 04:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech> <20201210134648.272857-9-maxime@cerno.tech>
 <CAPY8ntA7dS1Ew+mF=xRdWFF0P071=O5X7vVKt7O_iiTdUbJM5g@mail.gmail.com> <20201218122334.tvdeslyyuus4hp4y@gilmour>
In-Reply-To: <20201218122334.tvdeslyyuus4hp4y@gilmour>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 12:25:00 +0000
Message-ID: <CAPY8ntDwp5+8+uB3xVR=mVTZYPLXp1CiYe5AFFium1JQaQNZNw@mail.gmail.com>
Subject: Re: [PATCH 08/15] drm/vc4: hdmi: Introduce a CEC clock
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jason Cooper <jason@lakedaemon.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-rpi-kernel@lists.infradead.org,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Dec 2020 at 12:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Fri, Dec 18, 2020 at 11:37:50AM +0000, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > While the BCM2835 had the CEC clock derived from the HSM clock, the
> > > BCM2711 has a dedicated parent clock for it.
> > >
> > > Let's introduce a separate clock for it so that we can handle both
> > > cases.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++++++++-
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
> > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index b93ee3e26e2b..0debd22bc992 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -145,7 +145,7 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
> > >          * Set the clock divider: the hsm_clock rate and this divider
> > >          * setting will give a 40 kHz CEC clock.
> > >          */
> > > -       clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
> > > +       clk_cnt = clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
> > >         value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
> > >         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
> > >  }
> > > @@ -1740,6 +1740,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
> > >                 return PTR_ERR(vc4_hdmi->hsm_clock);
> > >         }
> > >         vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
> > > +       vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
> > >
> > >         return 0;
> > >  }
> > > @@ -1833,6 +1834,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
> > >                 return PTR_ERR(vc4_hdmi->audio_clock);
> > >         }
> > >
> > > +       vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
> > > +       if (IS_ERR(vc4_hdmi->cec_clock)) {
> > > +               DRM_ERROR("Failed to get CEC clock\n");
> > > +               return PTR_ERR(vc4_hdmi->cec_clock);
> > > +       }
> >
> > Aren't we adding to the DT binding here and breaking backwards compatibility?
> > Admittedly CEC didn't work before (and was masked out) for vc5, but do
> > we need to worry about those with existing DT files that currently
> > work happily?
>
> The DT compatibility is not a worry here: I made sure the CEC clock and
> range were part of the binding since it's been introduced:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e3725b05b785e73482a194b99bff3d5a1c85140
>
> So we were not using it so far, but it was in the DT all along

I guess I should have read it then :-)
In which case
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
