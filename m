Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A9C27C194
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgI2Jqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:46:42 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:42521 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgI2Jqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:46:42 -0400
Received: by mail-ej1-f67.google.com with SMTP id q13so14039631ejo.9;
        Tue, 29 Sep 2020 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5nWv42Ih42N2NRVG8MQhIrrPCYfOCsYTrczhveDJBnc=;
        b=FC0L4dITgIc8QQ4W9S4eR5FiNCly0KqK5dYN1AR0Aganaxh+r0OacdUzDG8EbmqBxP
         wEln4FBuWx+c2LmnJlZxsuOdcklQBKBaVtK/KrIBkla9DlGbVLoaq/1EU0+7mAOmbjSZ
         29JvrbZnD2qQlFTMnXF0k7CNRev1PeMzz8f+go59AVPn3FWuOmZfeftDmWsxb7/4F4PL
         46VD4yonq1Xf8UGvYI2F4GVNmPLCagvy7r2jwPQst9aE3rQfJhtMR++5jPpG2leXZgRO
         K/C0cwEy9zEqgBkOXyTz3vRjkssseib80s0jIhDJnGGIp2K7ZYKL7n+d0I/rPftSfQXz
         Bm4Q==
X-Gm-Message-State: AOAM532VMpeS1nNh6zixwMyLBkZ4uetX9wjq7n8CVRrIEWAkbq69sdq0
        zEKzBJ6CZKTBE9brj6yZT+DBIY/O8HpA/Q==
X-Google-Smtp-Source: ABdhPJw1hpwhNC3rQ/oGOS8jzFlP0SaAObmpGtctW3hXetAzfkJI/GW1bHdNVmPi10NuZ+Id7P2tZQ==
X-Received: by 2002:a17:906:b88e:: with SMTP id hb14mr2840343ejb.543.1601372799559;
        Tue, 29 Sep 2020 02:46:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id x6sm4663845ejf.59.2020.09.29.02.46.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 02:46:38 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:46:36 +0200
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
Message-ID: <20200929094636.GA11333@kozik-lap>
References: <20200923152129.21736-1-krzk@kernel.org>
 <20200929091512.GF26842@paasikivi.fi.intel.com>
 <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
 <20200929094046.GH26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200929094046.GH26842@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 12:40:46PM +0300, Sakari Ailus wrote:
> On Tue, Sep 29, 2020 at 11:18:46AM +0200, Krzysztof Kozlowski wrote:
> > On Tue, 29 Sep 2020 at 11:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Krzysztof,
> > >
> > > On Wed, Sep 23, 2020 at 05:21:26PM +0200, Krzysztof Kozlowski wrote:
> > > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > > driver, are quite limited, e.g. do not support regulator supplies.
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > ---
> > > >
> > > > Changes since v3:
> > > > 1. Document also two lane setup.
> > > >
> > > > Changes since v2:
> > > > 1. Remove clock-frequency, add reset GPIOs, add supplies.
> > >
> > > Oops. I missed this one.
> > >
> > > How does the driver know the appropriate clock frequency for the platform
> > > if it's not in DT? The sensor supports a range of frequencies, not a single
> > > frequency.
> > >
> > > Could you add clock-frequency back?
> > 
> > Not really, it was removed on Rob's request. The bindings do not
> > describe driver's behavior so how the driver gets frequency should not
> > be part of the bindings. Also it's not a real problem - the driver
> > just calls clk_get_rate().
> 
> How is the rate determined? I mean, many ISPs or CSI-2 receivers that
> provide the clock are also capable of using a variety of frequencies. But
> only one can be used on the platform in general.

Having "clock-frequency" property in DTS did not solve that. It has no
effect on actual frequency.

> 
> Where does it come from if it's not in DT?

The frequency is either chosen by consumer (imx258) or pre-assigned from
DT, but not with "clock-frequency" property. There are generic
properties for this: assigned-clocks, assigned-clock-rates and
assigned-clock-parents.

These properties should be added to DTS if additionalProperties is
false, which is the case here... so I could add them. My DTS anyway does
not use them, as the clock is generated internally on a camera board so
I don't have a control over it.

Best regards,
Krzysztof


> 
> Using another frequency generally leads to failure later on as the desired
> link frequency likely is not available for a random external clock
> frequency.
