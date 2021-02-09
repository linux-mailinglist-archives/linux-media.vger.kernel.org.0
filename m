Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D9E314C22
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 10:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhBIJwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 04:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbhBIJuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 04:50:04 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1442C06178A
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 01:49:23 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id u14so2815920wmq.4
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iODsYL577vtiTZcS5AXU5f62AD5nWHRXTaswzxJRGpE=;
        b=JBX1u8nYfJ2D17HCZU3bF64mR3tXNePMMbkujQwPzUB4EHhq0FLPs5OOM92rDCpHBF
         4O9xTvVsnstE1b4IgRWf/cN/5JU2cy+inHw8TS2/FNMZeJNBStL7jnJ8ZcPrtCFvxPG4
         V/4KyzneELW/HpkZBFhB9trOu3KvpkoWlsMbt5tVgBOMJdCNMuB/45CFP7unHH4zy3N2
         NFahaB6yHkIYKLQFa/wTYu0dpNn78LVyWqe8lOs5wsRRZj5Dw2+AdWS4zVBv+s35utmv
         HQfK/sg06HSj9kgzRvVI2EWfBGQTkY4bQKv9rmjLvOp2dFbUsZ/6hGhjOZ1SksYp8P8F
         /Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iODsYL577vtiTZcS5AXU5f62AD5nWHRXTaswzxJRGpE=;
        b=D72yCsDXrGgatNxm2fPlPs+QVr+OYTINUdelSweWVrBaGbB4x5ilM9xP8vC8bnZWwX
         BB8MQSvZ/L/lMnuJvgyQ8UYq+aYQ5R0hnvMi21Yh4wL/R6jI9qACoI46NXabDtloawzR
         J8ZX1ZQBfrLA13h6YrEWtNpbOCG3mtBLUu0SBdlEFOaN7FYUd1bIbDhH1xuEYXNFIY/D
         E6Hcwh44t9CydrISABDsOdFfid61IoVZYBusYznI2ISJGBPXvseYMlvDpg+FXEnD2BXW
         pI3dScKDKYsWuUcVHZvBe7xFZgzu6FFWGk0oarDt7Xiw0iuHA9Ffppwz/phIb+9KHB/k
         nR8A==
X-Gm-Message-State: AOAM530kLHOVqZAnmPOPfeQVeyyFDLdRSo26s7J5LmcAPapbkbwP9fXq
        zLLZChvuWY7UoIPLLaiJ6Hn73V0HMoWJEOvUoxpBNA==
X-Google-Smtp-Source: ABdhPJwkXMO4uhvCsmyjxeJIJN/dMVthik8rV2agcLFH9W28tEatgkKRxyaLXGqmb/ZxKjwVzyOeJ3lIrOe3jbSNI4Y=
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr2607883wml.116.1612864162564;
 Tue, 09 Feb 2021 01:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-15-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-15-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 9 Feb 2021 09:49:05 +0000
Message-ID: <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt controller
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
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

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BSC controllers used for the HDMI DDC have an interrupt controller
> shared between both instances. Let's add it to avoid polling.

This seems to have unintended side effects.
GIC interrupt 117 is shared between the standard I2C controllers
(i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.

Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
doesn't appear to be an option for l2-intc registering as an interrupt
controller. i2c-bcm2835 therefore loses out and fails to register for
the interrupt.

Is there an equivalent flag that an interrupt controller can add to
say that the parent interrupt is shared? Is that even supported?

Thanks
  Dave

> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/arm/boot/dts/bcm2711.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 4847dd305317..8bb46ae76a92 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -308,6 +308,14 @@ dvp: clock@7ef00000 {
>                         #reset-cells = <1>;
>                 };
>
> +               bsc_intr: interrupt-controller@7ef00040 {
> +                       compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
> +                       reg = <0x7ef00040 0x30>;
> +                       interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +               };
> +
>                 hdmi0: hdmi@7ef00700 {
>                         compatible = "brcm,bcm2711-hdmi0";
>                         reg = <0x7ef00700 0x300>,
> @@ -341,6 +349,8 @@ ddc0: i2c@7ef04500 {
>                         reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
>                         reg-names = "bsc", "auto-i2c";
>                         clock-frequency = <97500>;
> +                       interrupt-parent = <&bsc_intr>;
> +                       interrupts = <0>;
>                         status = "disabled";
>                 };
>
> @@ -377,6 +387,8 @@ ddc1: i2c@7ef09500 {
>                         reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
>                         reg-names = "bsc", "auto-i2c";
>                         clock-frequency = <97500>;
> +                       interrupt-parent = <&bsc_intr>;
> +                       interrupts = <1>;
>                         status = "disabled";
>                 };
>         };
> --
> 2.29.2
>
