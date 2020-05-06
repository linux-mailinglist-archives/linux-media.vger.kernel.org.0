Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CCD1C6F56
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgEFL3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbgEFL3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:29:55 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E05C061A10
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 04:29:54 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id k110so1044403otc.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2020 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YSDapmMgNKW5r9KuP6TQNUmeTHZRb0J/HB9oD2+E5xY=;
        b=MQZj6pwlg0yTJaS9PRfkaH5gydyswEKWshRAcYFNNiG+FnRWt+d1I5K+uVTmAAh6HT
         uXDVK4EkwfhhFGpXOVRFBr1NJr8TwYUCRbww/eS8XKxDtm1eZ6fwKDQ4g1pvmlVy9CsY
         JDSEhZHdbN51G+MpZpuJ3qgO8THgeAxp77Z8yobpcfWhM/hizRI3Hb9YMwNjgnnnG9EH
         Ub6+n9Z7C9s9R/28/KrUcz6wsGEqhC0XTR/9pnaw5Hx2WYNAPK7mJ/dGiQTelDJ556jZ
         TkkKn5c5ntKQOC8jgFODOJjMAUEycj4khQ5qkYBju0gESsUmgv6fSO4Wa40Yjw/Twc+7
         G70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YSDapmMgNKW5r9KuP6TQNUmeTHZRb0J/HB9oD2+E5xY=;
        b=rEwtns97u6dzfseIKOYg5Xg8FbF1SZmIwctBT1FugEAeeeOHDt0WbPZDFOoeky3Obf
         neepdabuj1tcyNzKLvIelhb0263zHqhurqdvdokJi98hyZBtY/XpzEU2T21r8DBNuxIw
         IkQCaa3p0R/25qegmp519O5s8MTvbNX60TMA/qPpquqGXi9/e+aDsCAFXDsD1l/QicF8
         SZb1a0jwBvSNWHOJUlt+CP8F/0zBEU8fbGHsLeEVDxjiK11O2MSM9L2TGXC1IJIGmaY4
         ALx0HZwCET8Ndo/Xzih0hLAUVGr7xjVM3yJF/G5AJFPTCIarD2qoXRuk+zjdmTZ1etub
         cfOA==
X-Gm-Message-State: AGi0PuZPp0gAWFsNoy1+Y6efIkodWhmUEIhaxmKBNKkKU5JILmUSzfgs
        F66kaae9uDS67QVsHSN0v+M4J3kV4DP1JXdZlFTnJg==
X-Google-Smtp-Source: APiQypIGS3Olnt59XIqgX3m5pyxz9JgUlFMHAZAqicbZYG6FQMcwoTgHPVTzSA29qFYkRFUig7c8zx837fnoQ2EYvdI=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id e14mr5760377otj.91.1588764594274;
 Wed, 06 May 2020 04:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-2-robert.foss@linaro.org> <1588679279.8804.133.camel@mhfsdcap03>
In-Reply-To: <1588679279.8804.133.camel@mhfsdcap03>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 6 May 2020 13:29:43 +0200
Message-ID: <CAG3jFyvo3gmO3zLRUKQEdgRkmzvvvMTzDKV-LZAeKYFdOfCnEw@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ben Kao <ben.kao@intel.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Dongchun,

Thanks for having a look at this series.

> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov8856: camera@10 {
> > +            compatible = "ovti,ov8856";
> > +            reg = <0x10>;
> > +
> > +            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
>
> Apologies for missing to follow the earlier discussion related to this.
> I noticed the GPIO flag para and __ov8856_power_on() are aligned using
> ACTIVE_LOW.
>
> But from the datasheet, XSHUTDN pin is active-high for OV8856.
> It means devm_gpiod_get API (in probe func) should use GPIOD_OUT_LOW to
> initialize the GPIO as output with a value of 0.
> Otherwise it should use GPIOD_OUT_HIGH.
>
> There is one case for GPIO_ACTIVE_LOW setting:
> https://patchwork.linuxtv.org/patch/63460/
> https://patchwork.linuxtv.org/patch/63461/

We went back and forth about this a few times, and I switched to this
gpio setting after having worked through the device probing reset gpio
toggling. Semantically it seemed easier to understand in the driver,
since the gpio is called reset and not !shutdown.

Looking into devm_gpiod_get_optional(), the flag argument
GPIOD_OUT_LOW or HIGH for that matter is actually not used initialize
the output, but only used for an exclusivity check.
https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib-devres.c#L109

If you prefer, I can invert the logic again. To me making the reset
gpio active resulting in the device being actually reset seems like
the most intuitive and easy to understand option.
The different OmniVision drivers seem to have different approaches to
this. The ov9640 driver for example is doing what this series
currently is doing.

>
> Sakari, Tomasz, am I right?
>
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&clk_24m_cam>;
> > +
> > +            clocks = <&cam_osc>;
> > +            clock-names = "xvclk";
> > +            clock-frequency = <19200000>;
> > +
> > +            avdd-supply = <&mt6358_vcama2_reg>;
> > +            dvdd-supply = <&mt6358_vcamd_reg>;
> > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > +
> > +            port {
> > +                wcam_out: endpoint {
> > +                    remote-endpoint = <&mipi_in_wcam>;
> > +                    data-lanes = <1 2 3 4>;
> > +                    link-frequencies = /bits/ 64 <360000000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > \ No newline at end of file
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 26f281d9f32a..84b262afd13d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12489,6 +12489,7 @@ L:    linux-media@vger.kernel.org
> >  S:   Maintained
> >  T:   git git://linuxtv.org/media_tree.git
> >  F:   drivers/media/i2c/ov8856.c
> > +F:   Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >
>
> Had you run parse-maintainers.pl?
> The new item is supposed to be arranged in alphabetical order.

No, I have not. But upon running it now, it doesn't make suggest any
changes. But let me order the files manually in the next revision.

However, I noticed I removed the wrong person from the maintainers
file in this revision.
So, I'll correct that and add you Dongchun as the maintainer if that's ok.

>
> >  OMNIVISION OV9640 SENSOR DRIVER
> >  M:   Petr Cvek <petrcvekcz@gmail.com>
>
