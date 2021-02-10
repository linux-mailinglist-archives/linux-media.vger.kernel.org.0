Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F08316A7B
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 16:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhBJPuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 10:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBJPuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 10:50:02 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE81DC06174A
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 07:49:21 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o24so2223118wmh.5
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 07:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYZgMVhM68r4TeIL1eqUcRIh/19tL8LpowcnJQBeiLo=;
        b=dSUu1ROVfX9VnD5N/wmt0yOiO0MLXBe7aSpyu4quDdFKJc6PcUPDxu3raKXw++Ek0N
         2Dv1lat9ACE2l0XH90tJLthIuJJ3Ra+tvFBhVqRhTvZ0+vj+gVyROAl/3EhQHjPllj73
         +CzZTMzOIFFwe3xapqnoGAEcClWh0bS70GYqYpvu52mEutOyn7KcA2gjXGCdezMzbk9e
         27ICpKRGjdb9NAtti3fPpZO/xY0g72kopq5GBuVgmkxFzZBT+zDzHq3u7Por+bNcQQny
         HtCGcV48LA+HwGngSoKFUXHkYj6Mrz8dibG32AlXDXQ84UjOg/hIoEPilnHg3PGFMfNZ
         xPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYZgMVhM68r4TeIL1eqUcRIh/19tL8LpowcnJQBeiLo=;
        b=TqGgtguAxeXaAaerSFQWp7QGbGMb/R28K/eBWcFuhLQhvoVadXcj7dLt9eDQcpsWha
         2M62+IZuwryHcaKbsFROcDF7GoBtkbjAjuqdkndx34ELmpL457ONEqEJGLbJHhdd5mS2
         Nx/3TG5Ou51p54356yzSROBi/WeGcKnFo3o28OoY6M7SW6MkuL5B4uz6qX0iM2agDVca
         rIAoDi4x8PLY8H3Dv75OxpJho4cNG/1ISYlzsainIwcd+59xga9dT7d75pCXIEj5F5rd
         yWCNteswgwadBJdf+5bboGRNC87X8nTllACempnHdmPEY5EZS5Xqe3RDaJstU0ci4D6K
         1ygw==
X-Gm-Message-State: AOAM533ktx/wzuGCnyNz5iU3iHwFsCktt44Rdut898CEG4OSSoK1EUBb
        sjzMZld1uTw/ULSwjrQiu44dFXF00OVNoIU9pxgljw==
X-Google-Smtp-Source: ABdhPJzVGS+MJZSjsBcZpXaEfuUikR3k1vTMjTsq3S6hU+cP8Eoa9+ZrmBtxOFY4nwMZV3HSd+UcMCdET28GHNpoKRc=
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr3534527wmf.82.1612972160635;
 Wed, 10 Feb 2021 07:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour> <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
In-Reply-To: <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 10 Feb 2021 15:49:03 +0000
Message-ID: <CAPY8ntCG3vLy1NWNF09DEZWE-t_xc+q5m89Jv8GB8GofBLVp3Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt controller
To:     Marc Zyngier <maz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marc.

On Wed, 10 Feb 2021 at 15:30, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Maxime,
>
> On 2021-02-10 14:40, Maxime Ripard wrote:
> > Hi Dave,
> >
> > On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
> >> On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
> >> >
> >> > The BSC controllers used for the HDMI DDC have an interrupt controller
> >> > shared between both instances. Let's add it to avoid polling.
> >>
> >> This seems to have unintended side effects.
> >> GIC interrupt 117 is shared between the standard I2C controllers
> >> (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.
> >>
> >> Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
> >> doesn't appear to be an option for l2-intc registering as an interrupt
> >> controller. i2c-bcm2835 therefore loses out and fails to register for
> >> the interrupt.
> >>
> >> Is there an equivalent flag that an interrupt controller can add to
> >> say that the parent interrupt is shared? Is that even supported?
> >
> > Indeed, it looks like setting an equivalent to IRQF_SHARED would be the
> > solution, but I couldn't find anything that would allow us to in the
> > irqchip code.
> >
> > Marc, Thomas, is it something that is allowed?
>
> No, not really. That's because the chained handler is actually an
> interrupt flow, and not a normal handler. IRQF_SHARED acts at the wrong
> level for that.
>
> I can see two possibilities:
>
> - the l2-intc gets turned into a normal handler, and does the demux
>    from there. Horrible stuff.
>
> - the i2c controller gets parented to the l2c-int as a fake interrupt,
>    and gets called from there. Horrible stuff.
>
> Pick your poison... :-/

Thanks for the info.

Option 3 - remove l2-intc and drop back to polling the i2c-brcmstb
blocks (which the driver supports anyway).
HDMI I2C generally isn't heavily used once displays are connected, so
I'd be OK with that.

(We can keep the l2-intc that handles CEC and HPD as that is on a
unique GIC interrupt).

  Dave
