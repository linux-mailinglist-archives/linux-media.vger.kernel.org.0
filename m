Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0C8293A86
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394147AbgJTMBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:01:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:8216 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394132AbgJTMBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:01:06 -0400
IronPort-SDR: DHgkFjFUWJKseVlNDVPcIQnpY4BkkUifIiG5JIZFagNSTEZ3947xvrGhF3HNLfzYxK26j8VVy5
 7L56Hs4oTHEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="154978389"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="154978389"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:01:04 -0700
IronPort-SDR: zzKV3P7kDS4bP8U7KFDCk//wulR8UGagUlyrToflc2poQu9DhyzwJrtrOW7GwCtTDp6ICsZX67
 kFuFsZMaD0WQ==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="522354589"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:01:00 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B2FF82062D; Tue, 20 Oct 2020 15:00:58 +0300 (EEST)
Date:   Tue, 20 Oct 2020 15:00:58 +0300
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
Message-ID: <20201020120058.GU13341@paasikivi.fi.intel.com>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201020103833.GT13341@paasikivi.fi.intel.com>
 <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Oct 20, 2020 at 12:54:09PM +0200, Krzysztof Kozlowski wrote:
> On Tue, 20 Oct 2020 at 12:38, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Krzysztof,
> >
> > On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
> > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > driver, are quite limited, e.g. do not support regulator supplies.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v4:
> > > 1. Add clock-lanes,
> > > 2. Add Rob's review,
> > > 3. Add one more example and extend existing one,
> > > 4. Add common clock properties (assigned-*).
> >
> > Using the assigned-* clock properties may be workable for this driver at
> > the moment. But using these properties does not guarantee the external
> > clock frequency intended to be used on the hardware.
> 
> It guarantees it. The clock frequency will be as expected (except if
> someone misconfigures the DTS).

Is that guaranteed?

I'm not saying no to the approach, but if we change how camera sensor DT
bindings are defined, I'd prefer an informed decision is made on the
matter.

> 
> > Using other
> > frequencies *is not* expected to work. That applies to this driver as well.
> 
> This is the binding which is HW description. According to HW datasheet
> other frequencies from described range are accepted and expected to
> work.

As per datasheet, yes, different external clock frequencies can be used.
But the link frequency is still not independent of the external clock
frequency.

The properties of the sensor's PLL tree determines what can be achieved
given a certain external clock frequency. So picking a wrong external clock
frequency quite possibly means that none of the designated link frequencies
are available, rendering the sensor inoperable.

> 
> > This, instead of the clock-frequency property, effectively removes the
> > ability to set the correct frequency from the driver, at least with current
> > set of the used APIs.
> 
> It seems you confuse DT bindings with some specific driver
> implementation. Bindings do not describe the driver behavior but the
> HW. The ability to set the correct frequency from the driver is not
> removed. It was never part of the bindings and never should. It is
> part of the driver.
> 
> >
> > I suppose you could add a function to set the assigned clock frequency and
> > keep it, just as clk_set_rate_exclusive does?
> >
> > Cc the common clock framework list + maintainers.
> 
> The bindings have Rob review which is the DT maintainer. His
> ack/review is needed for the bindings to be accepted. What more do you
> need? Shall I point to submitting-bindings document?
> 
> I am really tired of discussing this. You raise some concerns about
> driver behavior in the wrong context - in the patch for device tree
> bindings. You use the arguments about the driver while we talk about
> bindings. This is clearly not correct. I am all the time repeating
> myself - the bindings describe the hardware, not the driver.

My concerns are not related to the current driver implementation nor the
driver patches in this set.

-- 
Regards,

Sakari Ailus
