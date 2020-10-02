Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D03D281212
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 14:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733260AbgJBMPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 08:15:17 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:45001 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBMPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 08:15:17 -0400
Received: by mail-ej1-f65.google.com with SMTP id a3so1629916ejy.11;
        Fri, 02 Oct 2020 05:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SHVHN4U0J7BXQzSnz/V0YBb+uNGWP+/4mY8x8M9/qTA=;
        b=T140a7w59EKYy1Lkm4UbYV/ye8HnsNzFlnqUJYc0HSWo/JTq/lY6eTal+bGp3BMIdp
         rJj/jWFcm3DlKL0I9HuZY5/KhZhmx3bQ9gppbYVXdxqEvsz1eox5b+WDYHWzrVaAdu+C
         h4B3rk88SO5EJpqpaVaiqmc1yWcIymNKy9gKT4s0z8/vxqDksF0Ho0t7Fmdce/jcY0qj
         /dyo/qJXTLUG+Lx3+JkKD9ksRzZ6u/Bo5k8GXdr5aEbh6hCUeYRXha38M2A3ga0YtuiI
         R2CrqOGTRwRR4VkECSRQPpFG6r5Hs16l2WjRTKxEaJL73ZhXEKzf1GSiy2gPk6qKEQKK
         YY4g==
X-Gm-Message-State: AOAM532cYbzRbdfAWfSrY5jqGZIlp0Dki+KrUFKuKyHGUziIIleJp6oy
        7ifDcYnuGoQLDNOj7ZrCVRc=
X-Google-Smtp-Source: ABdhPJx72+EloWJGThWDfdzVhvzdviZYBXTZycfdnLUeSu7HJQjLK128G4GplL0YIN+DXlNiT2mYDw==
X-Received: by 2002:a17:906:e15:: with SMTP id l21mr2021549eji.509.1601640914440;
        Fri, 02 Oct 2020 05:15:14 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id zn8sm1127774ejb.86.2020.10.02.05.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 05:15:13 -0700 (PDT)
Date:   Fri, 2 Oct 2020 14:15:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20201002121511.GA7285@pi3>
References: <20200923152129.21736-1-krzk@kernel.org>
 <20200929091512.GF26842@paasikivi.fi.intel.com>
 <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
 <20200929094046.GH26842@paasikivi.fi.intel.com>
 <20200929094636.GA11333@kozik-lap>
 <20200929110255.GJ26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200929110255.GJ26842@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 02:02:55PM +0300, Sakari Ailus wrote:
> On Tue, Sep 29, 2020 at 11:46:36AM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Sep 29, 2020 at 12:40:46PM +0300, Sakari Ailus wrote:
> > > On Tue, Sep 29, 2020 at 11:18:46AM +0200, Krzysztof Kozlowski wrote:
> > > > On Tue, 29 Sep 2020 at 11:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Krzysztof,
> > > > >
> > > > > On Wed, Sep 23, 2020 at 05:21:26PM +0200, Krzysztof Kozlowski wrote:
> > > > > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > > > > driver, are quite limited, e.g. do not support regulator supplies.
> > > > > >
> > > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > >
> > > > > > ---
> > > > > >
> > > > > > Changes since v3:
> > > > > > 1. Document also two lane setup.
> > > > > >
> > > > > > Changes since v2:
> > > > > > 1. Remove clock-frequency, add reset GPIOs, add supplies.
> > > > >
> > > > > Oops. I missed this one.
> > > > >
> > > > > How does the driver know the appropriate clock frequency for the platform
> > > > > if it's not in DT? The sensor supports a range of frequencies, not a single
> > > > > frequency.
> > > > >
> > > > > Could you add clock-frequency back?
> > > > 
> > > > Not really, it was removed on Rob's request. The bindings do not
> > > > describe driver's behavior so how the driver gets frequency should not
> > > > be part of the bindings. Also it's not a real problem - the driver
> > > > just calls clk_get_rate().
> > > 
> > > How is the rate determined? I mean, many ISPs or CSI-2 receivers that
> > > provide the clock are also capable of using a variety of frequencies. But
> > > only one can be used on the platform in general.
> > 
> > Having "clock-frequency" property in DTS did not solve that. It has no
> > effect on actual frequency.
> 
> It's up to the driver to do what's needed, yes.
> 
> Please see examples in e.g. drivers/media/i2c/ov8856.c and
> Documentation/devicetree/bindings/media/i2c/ov8856.yaml .

It seems the ov8856 driver uses this property in different way than
imx258 driver. It is more appropriate and quite similar to clock
providers and buses - to set the desired frequency on input clock.

Therefore what is the point of using this DT property comparing to
assigned-clock-rates?

It's the same. So let's use generic (already documented)
assigned-clock-rates.  

For your question (not related to the bindings but to driver
implementation): "How is the rate determined?", simple: clk_get_rate.
The driver then uses it like this:
	if (clk_get_rate() != only_working_configuration_hz)
		return -EINVAL;

From the bindings point of view, the clock can be anything within a
range of sensor's accepted values. The clock frequency is a property of
a clock, not of a sensor. Therefore for HW description it should be
described in the clock bindings, not in the sensor bindings.

To summarize, the "clock-frequency" property of sensor node:
1. As a way to configure the clock should be replaced with
   assigned-clock properties,
2. As a way to describe the hardware is simply invalid. It is not a HW
   description, because HW requires just a clock of frequency within
   given range, not a fixed frequency clock.

Consider the example:
        camera@1a {
                compatible = "sony,imx258";
                reg = <0x1a>;

                clocks = <&imx258_clk>;
                clock-names = "clk";

                /* Oscillator on camera board */
                imx258_clk: clk {
                        compatible = "fixed-clock";
                        #clock-cells = <0>;
                        clock-frequency = <19200000>;
                };

                port {
			...
                };
        };

What is the point to add "clock-frequency" property to the camera
itself, since it is already clearly defined by the clock?

Or another example:

        camera@1a {
                compatible = "sony,imx258";
                reg = <0x1a>;

                clocks = <&iclk 0>;
                clock-names = "clk";
		assigned-clocks = <&clk 0>;
		assigned-clock-rates = <19200000>;

                port {
			...
                };
        };

Again, no reason for artificial clock-frequency property. It is not part
of HW description of the sensor.

Best regards,
Krzysztof

