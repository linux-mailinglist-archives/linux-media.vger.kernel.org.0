Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A1A2DE213
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 12:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgLRLit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 06:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgLRLis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 06:38:48 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1246FC0617B0
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 03:38:08 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id c5so1782680wrp.6
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoWRWWsuuMiJYUiJ8ref+3sTcxGYyjAa+0+yB4BqHyE=;
        b=AvZqdIZugmy8fz42MgEo3JGpxLGI1jqAzQ+K83/MQzqa8S0Ed/57+iVER2/DHBDud7
         RK9Dmm3AKP7BsQWhlAU8iEYqlKmsylzmP7L8PpdEdABuLGw0LX09uu1SxKnkx9PZrKlu
         n3IxJGftbpq/p5tKuxrLfmqpYWSQyEec0DMPJpmiz3dT/5zN36m9naF/STFklDW4AD5D
         NZBPUcAL2zIFDG1PtCbydQ1FTAooZSn5+gfuFu4NT24GmEt3XdhmUJAdZi4hoChQ+ajk
         OuqvuOK690WL/3hVJ6c2NsoTtqa6OqYLbn3HAPUdH/ezxWmUatS5URoumFDqmUiGg6uV
         bcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoWRWWsuuMiJYUiJ8ref+3sTcxGYyjAa+0+yB4BqHyE=;
        b=fbpf6jbj5ooN9eAsPmSqZT5JcqGn+yumxJGgsSq0dEqwbubfBau64S2olsIgELoTW3
         VnGb+XynZKtP/z5s5FliKvzlmgVUXkDqBKVKeIHxk45iXAXZyqoDiklm39Y6SOjV0/l4
         LMvC51TIQnA8BgM5kcXQjMWg4yDlLxI1px5utQP4KKPV9Q9Ppz52De4xuEX06/opcCMh
         OgjDGcm+xrRbnh5zgkfksnY5YD1wzUwWrATf5b/sNFMFeg2fiwAa6/qrvpMzS8cHgDga
         IqTmdFXzJI6/njxtigVjHFiulCSXgftNk3JRCxrsP+GA+GNTGPqmr2oGk9n0FRSRVNrf
         AucQ==
X-Gm-Message-State: AOAM533nmg/OqWJE3dZpN7IX6B0xp9KdevuByZFo8yPZBJzegRarVVIt
        vDYGl7SpqfcDBCI3R3UO2VzBtZN1MWXAaMfw49GPww==
X-Google-Smtp-Source: ABdhPJxt9Qjxw7c5+Hh3aD8hBJUskegWQUD6m2kBGo4SogNADwmeYKiy6yDfkcMp9JIo6fNbuwpX5x7KlTUVnh3igRE=
X-Received: by 2002:adf:d18a:: with SMTP id v10mr3901140wrc.273.1608291486699;
 Fri, 18 Dec 2020 03:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech> <20201210134648.272857-9-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-9-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 11:37:50 +0000
Message-ID: <CAPY8ntA7dS1Ew+mF=xRdWFF0P071=O5X7vVKt7O_iiTdUbJM5g@mail.gmail.com>
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

Hi Maxime

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> While the BCM2835 had the CEC clock derived from the HSM clock, the
> BCM2711 has a dedicated parent clock for it.
>
> Let's introduce a separate clock for it so that we can handle both
> cases.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index b93ee3e26e2b..0debd22bc992 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -145,7 +145,7 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
>          * Set the clock divider: the hsm_clock rate and this divider
>          * setting will give a 40 kHz CEC clock.
>          */
> -       clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
> +       clk_cnt = clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
>         value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
>         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
>  }
> @@ -1740,6 +1740,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>                 return PTR_ERR(vc4_hdmi->hsm_clock);
>         }
>         vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
> +       vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
>
>         return 0;
>  }
> @@ -1833,6 +1834,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>                 return PTR_ERR(vc4_hdmi->audio_clock);
>         }
>
> +       vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
> +       if (IS_ERR(vc4_hdmi->cec_clock)) {
> +               DRM_ERROR("Failed to get CEC clock\n");
> +               return PTR_ERR(vc4_hdmi->cec_clock);
> +       }

Aren't we adding to the DT binding here and breaking backwards compatibility?
Admittedly CEC didn't work before (and was masked out) for vc5, but do
we need to worry about those with existing DT files that currently
work happily?

Otherwise I'm happy with the patch.

  Dave

> +
>         vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
>         if (IS_ERR(vc4_hdmi->reset)) {
>                 DRM_ERROR("Failed to get HDMI reset line\n");
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 720914761261..adc4bf33ff15 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -155,6 +155,7 @@ struct vc4_hdmi {
>         bool cec_tx_ok;
>         bool cec_irq_was_rx;
>
> +       struct clk *cec_clock;
>         struct clk *pixel_clock;
>         struct clk *hsm_clock;
>         struct clk *audio_clock;
> --
> 2.28.0
>
