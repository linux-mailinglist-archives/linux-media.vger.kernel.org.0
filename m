Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A4F293C21
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406584AbgJTMrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:47:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:43701 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406564AbgJTMrB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:47:01 -0400
IronPort-SDR: 8AYuMoFeKZW9HVNIjd6jTAL7pwNUIr5NrXFGHWBLf1KP+9Wgupo+gLAFH2AXK0ubgEWWMbzq8e
 swjLypTqxnlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="166423078"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; 
   d="scan'208";a="166423078"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:47:00 -0700
IronPort-SDR: nNSm2JVctSzKdcN0Bx3T1hXrWB06XwSKxLzAWM0LkIEAaiTvVv7OhYcAwVvK5H1LlBuxr+b/7B
 NRyoCDTczOxg==
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; 
   d="scan'208";a="522367367"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:46:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E28062062D; Tue, 20 Oct 2020 15:46:54 +0300 (EEST)
Date:   Tue, 20 Oct 2020 15:46:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <20201020124654.GX13341@paasikivi.fi.intel.com>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201020103833.GT13341@paasikivi.fi.intel.com>
 <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
 <20201020120058.GU13341@paasikivi.fi.intel.com>
 <20201020122621.GA126891@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020122621.GA126891@kozik-lap>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 02:26:21PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2020 at 03:00:58PM +0300, Sakari Ailus wrote:
> > Hi Krzysztof,
> > 
> > On Tue, Oct 20, 2020 at 12:54:09PM +0200, Krzysztof Kozlowski wrote:
> > > On Tue, 20 Oct 2020 at 12:38, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Krzysztof,
> > > >
> > > > On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
> > > > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > > > driver, are quite limited, e.g. do not support regulator supplies.
> > > > >
> > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > >
> > > > > ---
> > > > >
> > > > > Changes since v4:
> > > > > 1. Add clock-lanes,
> > > > > 2. Add Rob's review,
> > > > > 3. Add one more example and extend existing one,
> > > > > 4. Add common clock properties (assigned-*).
> > > >
> > > > Using the assigned-* clock properties may be workable for this driver at
> > > > the moment. But using these properties does not guarantee the external
> > > > clock frequency intended to be used on the hardware.
> > > 
> > > It guarantees it. The clock frequency will be as expected (except if
> > > someone misconfigures the DTS).
> > 
> > Is that guaranteed?
> > 
> > I'm not saying no to the approach, but if we change how camera sensor DT
> > bindings are defined, I'd prefer an informed decision is made on the
> > matter.
> > 
> > > 
> > > > Using other
> > > > frequencies *is not* expected to work. That applies to this driver as well.
> > > 
> > > This is the binding which is HW description. According to HW datasheet
> > > other frequencies from described range are accepted and expected to
> > > work.
> > 
> > As per datasheet, yes, different external clock frequencies can be used.
> > But the link frequency is still not independent of the external clock
> > frequency.
> > 
> > The properties of the sensor's PLL tree determines what can be achieved
> > given a certain external clock frequency. So picking a wrong external clock
> > frequency quite possibly means that none of the designated link frequencies
> > are available, rendering the sensor inoperable.
> 
> The driver then controls the HW and knows exactly what is needed. If
> link frequency (which has its own DT property) requires some clock
> frequency, the driver will configure the clock to that value. The same

Well it doesn't if it doesn't get that information from DT.

The frequency is usually a range, and looking at these bindings, it's from
6 MHz to 27 MHz. That'd be a lot of frequencies for a driver to try.

> going other direction. Driver has the knowledge about both its input
> clock and link frequency, therefore it can make the best decision.

Again you're assuming a particular driver implementation.

Typically only a few frequencies are really available on platforms, so a in
practice a driver would not be able to get any requested frequency. I
wouldn't start hard-coding every possible frequency to camera sensor
drivers.

> > > > This, instead of the clock-frequency property, effectively removes the
> > > > ability to set the correct frequency from the driver, at least with current
> > > > set of the used APIs.
> > > 
> > > It seems you confuse DT bindings with some specific driver
> > > implementation. Bindings do not describe the driver behavior but the
> > > HW. The ability to set the correct frequency from the driver is not
> > > removed. It was never part of the bindings and never should. It is
> > > part of the driver.
> > > 
> > > >
> > > > I suppose you could add a function to set the assigned clock frequency and
> > > > keep it, just as clk_set_rate_exclusive does?
> 
> I did not reply to this comment, so let me know. Of course, one could
> add such functions. It's not a job for DT bindings, though.

I'm not suggesting to add it to DT binding patch. What I'm saying that with
this approach is looks like it may well be needed.

-- 
Regards,

Sakari Ailus
