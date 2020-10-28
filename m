Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCB929DA3B
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 00:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388046AbgJ1XRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 19:17:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46883 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbgJ1XRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 19:17:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id n6so775616wrm.13;
        Wed, 28 Oct 2020 16:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0DnG4LJjdv6mAxFeMJR8DGf+NctXJFLBf9GwLy+AxJQ=;
        b=o8dt85FiopWcGhXhpt25kIrlJBkT7xuHrqLVBo2fDOCuGnm7LJbaKxbp04x0/TQKC4
         8JWvvjn3IUu4FSy/iWT85nQz4dMXhSOPL8187t64GzS9u0HARKocB4kGRZg5iokCfPPn
         XQCCYmL0jZDdTNlWO23UEQM6ORn2hvyP66lc68+t5S9djlRhfphA2VHhCvDmCXvzoOmC
         ZYMcNDVw0ZJw5A9B874xObT0KoE1tmf/YRaXl/6jRJrPMxcCaiPKaQzAyg4LJNOi6lNB
         5ObO+rPjJqsZzC1BfcgXNsszs9e/w1f3lpepPjpmLbt6CjfEOC01A+JvQEredxLI3EHl
         ctGw==
X-Gm-Message-State: AOAM533RFgqbzdCd0F79yN4y6YolCk/UKzf8IDS2E9Mn/ntUkax3KcOe
        43033a5xQlyAeF2N/IWaair532W+wEtnzWWE
X-Google-Smtp-Source: ABdhPJzfpLMuUvtJrSFwIFWjAp/ycvj6HKNRVF8qRIcs0RQFe6tX1Ju0ziEFEpJPgFr+LJbS453aoA==
X-Received: by 2002:a17:907:204c:: with SMTP id pg12mr6158094ejb.464.1603874307610;
        Wed, 28 Oct 2020 01:38:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id v6sm2525073ejj.112.2020.10.28.01.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 01:38:26 -0700 (PDT)
Date:   Wed, 28 Oct 2020 09:38:24 +0100
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20201028083824.GA32155@kozik-lap>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201020103833.GT13341@paasikivi.fi.intel.com>
 <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
 <20201020120058.GU13341@paasikivi.fi.intel.com>
 <20201020122621.GA126891@kozik-lap>
 <20201020124654.GX13341@paasikivi.fi.intel.com>
 <20201020125852.GA128323@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020125852.GA128323@kozik-lap>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 02:58:52PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2020 at 03:46:54PM +0300, Sakari Ailus wrote:
> > On Tue, Oct 20, 2020 at 02:26:21PM +0200, Krzysztof Kozlowski wrote:
> > > On Tue, Oct 20, 2020 at 03:00:58PM +0300, Sakari Ailus wrote:
> > > > Hi Krzysztof,
> > > > 
> > > > On Tue, Oct 20, 2020 at 12:54:09PM +0200, Krzysztof Kozlowski wrote:
> > > > > On Tue, 20 Oct 2020 at 12:38, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > > > >
> > > > > > Hi Krzysztof,
> > > > > >
> > > > > > On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
> > > > > > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > > > > > driver, are quite limited, e.g. do not support regulator supplies.
> > > > > > >
> > > > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > > Changes since v4:
> > > > > > > 1. Add clock-lanes,
> > > > > > > 2. Add Rob's review,
> > > > > > > 3. Add one more example and extend existing one,
> > > > > > > 4. Add common clock properties (assigned-*).
> > > > > >
> > > > > > Using the assigned-* clock properties may be workable for this driver at
> > > > > > the moment. But using these properties does not guarantee the external
> > > > > > clock frequency intended to be used on the hardware.
> > > > > 
> > > > > It guarantees it. The clock frequency will be as expected (except if
> > > > > someone misconfigures the DTS).
> > > > 
> > > > Is that guaranteed?
> > > > 
> > > > I'm not saying no to the approach, but if we change how camera sensor DT
> > > > bindings are defined, I'd prefer an informed decision is made on the
> > > > matter.
> > > > 
> > > > > 
> > > > > > Using other
> > > > > > frequencies *is not* expected to work. That applies to this driver as well.
> > > > > 
> > > > > This is the binding which is HW description. According to HW datasheet
> > > > > other frequencies from described range are accepted and expected to
> > > > > work.
> > > > 
> > > > As per datasheet, yes, different external clock frequencies can be used.
> > > > But the link frequency is still not independent of the external clock
> > > > frequency.
> > > > 
> > > > The properties of the sensor's PLL tree determines what can be achieved
> > > > given a certain external clock frequency. So picking a wrong external clock
> > > > frequency quite possibly means that none of the designated link frequencies
> > > > are available, rendering the sensor inoperable.
> > > 
> > > The driver then controls the HW and knows exactly what is needed. If
> > > link frequency (which has its own DT property) requires some clock
> > > frequency, the driver will configure the clock to that value. The same
> > 
> > Well it doesn't if it doesn't get that information from DT.
> 
> It will get it - via clk_get_rate(). You do not need DT for this.
> 
> > The frequency is usually a range, and looking at these bindings, it's from
> > 6 MHz to 27 MHz. That'd be a lot of frequencies for a driver to try.
> 
> It does not have to try all of them. Assuming link frequency is fixed,
> just use any matching (or hard-coded) input clock frequency. Since the
> input clock frequency most likely will be set with assigned-clock-rates,
> there will be no job to do for the driver at all. Unless the driver
> wants to do something more, of course.
> 
> > 
> > > going other direction. Driver has the knowledge about both its input
> > > clock and link frequency, therefore it can make the best decision.
> > 
> > Again you're assuming a particular driver implementation.
> 
> Actually not, I am talking about bindings as far away from the driver
> implementation as possible.  This is why some specific frequency *is
> not* part of the bindings.
> 
> > 
> > Typically only a few frequencies are really available on platforms, so a in
> > practice a driver would not be able to get any requested frequency. I
> > wouldn't start hard-coding every possible frequency to camera sensor
> > drivers
> 
> If the driver cannot get requested frequency which it apparently
> requires, there is nothing more to do. It's broken HW implementation.
> The input clock must be matching requirements, regardless of what
> property you put in DT.  You can add "clock-frequency" property, you can
> even add "really-i-require-clock-frequency" but if the real HW input
> clock does not have, it won't work.
> 
> IOW, adding "clock-frequency" property does not change the reality - the
> board (HW) must provide given frequency so the entire system works.
> 
> > 
> > > > > > This, instead of the clock-frequency property, effectively removes the
> > > > > > ability to set the correct frequency from the driver, at least with current
> > > > > > set of the used APIs.
> > > > > 
> > > > > It seems you confuse DT bindings with some specific driver
> > > > > implementation. Bindings do not describe the driver behavior but the
> > > > > HW. The ability to set the correct frequency from the driver is not
> > > > > removed. It was never part of the bindings and never should. It is
> > > > > part of the driver.
> > > > > 
> > > > > >
> > > > > > I suppose you could add a function to set the assigned clock frequency and
> > > > > > keep it, just as clk_set_rate_exclusive does?
> > > 
> > > I did not reply to this comment, so let me know. Of course, one could
> > > add such functions. It's not a job for DT bindings, though.
> > 
> > I'm not suggesting to add it to DT binding patch. What I'm saying that with
> > this approach is looks like it may well be needed.
> 
> New properties can always be added to DT. However existing properties
> cannot be removed. Their meaning or values cannot be changed.

Any more comments on the bindings or the patchset?

Best regards,
Krzysztof

