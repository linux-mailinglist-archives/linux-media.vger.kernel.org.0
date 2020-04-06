Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0756019F189
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 10:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDFI0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 04:26:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44177 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgDFI0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 04:26:05 -0400
Received: by mail-ot1-f65.google.com with SMTP id a49so14374943otc.11
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vOURNP/+1sHn2/oMAz9DpyrmfncIc+Lque59yZC/+5w=;
        b=LNSvxDZjUIJxP4/R0gUjwWEcoIXjaM14W0yLZVSrDlbz182T85YKg9jbdKtsDv4lSw
         CJiAmks7NsnTkIghjBXK8DlURDeKnUSzJHYlN+12DuAULHbIVlDN8ppxELEfYm4zwqBs
         aw/ZeWuSYt776wwjblNiwil1Cb3zzS0HMTuWr4qv/qliIlcRDXzDzrT9gX+SGuK3v/KQ
         SyvKYC+rBZ/4QqGchMam2id0O6G1vGyw3EkfvK4wIoXf3OQ9eMKwadXJfYRiD2FLFq/W
         QUHuyHh4ngh+RtAjWUyHyUabXwCzTo0oYRE1r8ouVeIQ7FxN8oMye+v/vqt+KJHyEl5z
         t9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vOURNP/+1sHn2/oMAz9DpyrmfncIc+Lque59yZC/+5w=;
        b=aPlccGyTC/zNTFurUjSaOTySoAF+UOijA4YLDtWA6CL9emwE7YHKiZ7+Ld+tF1WyVv
         6WhLiEQs3eNFxErrCr3O5obmqexA2Ieitg7m9JSpYVOpp2DrmSVeyKGCLsJoRCWJgYyU
         GuQaKwcUwzuANssJrx9nEp2KZ8KyFR80cbnIsvgh9VvWdnvvu67l6Fx1/n3YLX0G2qZs
         t10TQdE/PQMUiJCgx93ouhSZKK+McPpMXLOeuAjpu+E0Gkc9b28nn67DfdqyczZKl1eU
         m/seAB1r1cM97b4efBnakQeZwXHXGthY+wFZ2ksyrKg6jbywIREAJiF/tO79MBlrMF74
         HxCg==
X-Gm-Message-State: AGi0PuZ6SzW0Xj3yUvVb8DCfAdloHik8iGIkwlmKkT0lqD3mkGt3Xg0J
        JvSCXphxCN7Y8P4Nh/8ecfF2orUDHWJKG7JawjNdJQ==
X-Google-Smtp-Source: APiQypIkuoFfBZNbSuH6xY0DqxdXdxWr0AqNxKMHvTzBtHBZP9ZPw+ZzMKWrTKGg9oy2VTppKuGgJcpLQV7RZVDW/2Y=
X-Received: by 2002:a4a:e495:: with SMTP id s21mr16488515oov.79.1586161562627;
 Mon, 06 Apr 2020 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-2-robert.foss@linaro.org> <20200401080705.j4goeqcqhoswhx4u@gilmour.lan>
 <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
 <20200403232736.GA6127@valkosipuli.retiisi.org.uk> <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
In-Reply-To: <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 6 Apr 2020 10:25:50 +0200
Message-ID: <CAG3jFytX19r4FCateVtcd6C7mHNHUF4NA24mGTrogs6DWiE1pQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Maxime,

On Sat, 4 Apr 2020 at 11:34, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Sat, Apr 04, 2020 at 02:27:36AM +0300, Sakari Ailus wrote:
> > Hi Robert,
> >
> > On Thu, Apr 02, 2020 at 12:10:00PM +0200, Robert Foss wrote:
> > > Hey Maxime,
> > >
> > > On Wed, 1 Apr 2020 at 10:07, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Mar 31, 2020 at 03:33:44PM +0200, Robert Foss wrote:
> > > > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > >
> > > > > This patch adds documentation of device tree in YAML schema for the
> > > > > OV8856 CMOS image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > > > ---
> > > > >
> > > > > - Changes since v5:
> > > > >   * Add assigned-clocks and assigned-clock-rates
> > > > >   * robher: dt-schema errors
> > > > >
> > > > > - Changes since v4:
> > > > >   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
> > > > >   * Add clock-lanes property to example
> > > > >   * robher: Fix syntax error in devicetree example
> > > > >
> > > > > - Changes since v3:
> > > > >   * robher: Fix syntax error
> > > > >   * robher: Removed maxItems
> > > > >   * Fixes yaml 'make dt-binding-check' errors
> > > > >
> > > > > - Changes since v2:
> > > > >   Fixes comments from from Andy, Tomasz, Sakari, Rob.
> > > > >   * Convert text documentation to YAML schema.
> > > > >
> > > > > - Changes since v1:
> > > > >   Fixes comments from Sakari, Tomasz
> > > > >   * Add clock-frequency and link-frequencies in DT
> > > > >
> > > > >  .../devicetree/bindings/media/i2c/ov8856.yaml | 150 ++++++++++++++++++
> > > > >  MAINTAINERS                                   |   1 +
> > > > >  2 files changed, 151 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..beeddfbb8709
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > > @@ -0,0 +1,150 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +# Copyright (c) 2019 MediaTek Inc.
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Ben Kao <ben.kao@intel.com>
> > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > +
> > > > > +description: |-
> > > > > +  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
> > > > > +  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
> > > > > +  sub-sampled, and windowed 10-bit MIPI images in various formats via the
> > > > > +  Serial Camera Control Bus (SCCB) interface. This chip is programmable
> > > > > +  through I2C and two-wire SCCB. The sensor output is available via CSI-2
> > > > > +  serial data output (up to 4-lane).
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: ovti,ov8856
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clock-names:
> > > > > +    description:
> > > > > +      Input clock for the sensor.
> > > > > +    items:
> > > > > +      - const: xvclk
> > > > > +
> > > > > +  clock-frequency:
> > > > > +    description:
> > > > > +      Frequency of the xvclk clock in Hertz.
> > > >
> > > > We also had that discussion recently for another omnivision sensor
> > > > (ov5645 iirc), but what is clock-frequency useful for?
> > > >
> > > > It seems that the sensor is passed in clocks, so if you need to
> > > > retrieve the clock rate you should use the clock API instead.
> > > >
> > > > Looking at the driver, it looks like it first retrieves the clock, set
> > > > it to clock-frequency, and then checks that this is OV8856_XVCLK_19_2
> > > > (19.2 MHz).
> > >
> > > As far as I understand it, 19.2MHz is requirement for the sensor mode
> > > that currently defaults to. Some modes require higher clock speeds
> > > than this however.
> >
> > It's very system specific. Either way, bindings should not assume a
> > particular driver implementation.
> >
> > >
> > > >
> > > > The datasheet says that the sensor can have any frequency in the 6 -
> > > > 27 MHz range, so this is a driver limitation and should be set in the
> > > > driver using the clock API, and you can always bail out if it doesn't
> > > > provide a rate that is not acceptable for the drivers assumption.
> > > >
> > > > In any case, you don't need clock-frequency here...
> > >
> > > So your suggestion is that we remove all clocks-rate properties, and
> > > replace the clk_get_rate() calls in the driver with clk_set_rate()
> > > calls for the desired frequencies?
> >
> > The driver shouldn't set the rate here unless it gets it from DT (but that
> > was not the intention). So the driver should get the frequency instead.
>
> I'm actually saying the opposite :)
>
> Like you were saying, the binding (or DT, for that matter) shouldn't
> assume a particular driver implementation.
>
> So one corollary is that if the driver has some restrictions in Linux,
> it shouldn't be part of the binding, right?
>
> This binding uses multiple clock properties but as far as I can see,
> the driver retrieves a clock using clocks and makes sure that its rate
> match its limitation of 19.2MHz using clock-frequency (which is
> redundant on a clk_get_rate on the clocks provided earlier).
>
> I'm suspecting that the parent clock on multiple SoCs can be
> configured and is not a fixed rate crystal, so assigned-clocks-rate is
> here just to make sure we set the frequency at the one being checked
> in the driver's probe so that it all works.
>
> But that 19.2MHz is not a limitation of the device itself, it's a
> limitation of our implementation, so we can instead implement
> something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> sure that our parent clock is configured at the right rate) and the
> clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> been rounded too far apart from the frequency we expect).
>
> This is doing exactly the same thing, except that we don't encode our
> implementation limitations in the DT, but in the driver instead.
>

Thanks for taking the time to explain this.
I'll spin a new revision that moves the clock rate handling into the driver.
