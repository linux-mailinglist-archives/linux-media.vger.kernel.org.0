Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709B027C175
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgI2Jky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:40:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:56934 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727700AbgI2Jkx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:40:53 -0400
IronPort-SDR: j7gfkvoGoSW3HZTdBv07G7akGY7No88qdNQmX/SZBl6B4mlGlr8S5gDsjr2wLe2kuZew0U9B18
 QfqC+RyjayGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149810430"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="149810430"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 02:40:52 -0700
IronPort-SDR: /VJGhAI/awo1uw4sQ20g9MN8byzWtf7ZzBdoFu4aj+e9hLKild4FKTy+FxWCJpxcjQ9ANjVXZ8
 8dOj7SaGag3Q==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="338562828"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 02:40:48 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 75317204FD; Tue, 29 Sep 2020 12:40:46 +0300 (EEST)
Date:   Tue, 29 Sep 2020 12:40:46 +0300
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20200929094046.GH26842@paasikivi.fi.intel.com>
References: <20200923152129.21736-1-krzk@kernel.org>
 <20200929091512.GF26842@paasikivi.fi.intel.com>
 <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 11:18:46AM +0200, Krzysztof Kozlowski wrote:
> On Tue, 29 Sep 2020 at 11:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Krzysztof,
> >
> > On Wed, Sep 23, 2020 at 05:21:26PM +0200, Krzysztof Kozlowski wrote:
> > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > driver, are quite limited, e.g. do not support regulator supplies.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v3:
> > > 1. Document also two lane setup.
> > >
> > > Changes since v2:
> > > 1. Remove clock-frequency, add reset GPIOs, add supplies.
> >
> > Oops. I missed this one.
> >
> > How does the driver know the appropriate clock frequency for the platform
> > if it's not in DT? The sensor supports a range of frequencies, not a single
> > frequency.
> >
> > Could you add clock-frequency back?
> 
> Not really, it was removed on Rob's request. The bindings do not
> describe driver's behavior so how the driver gets frequency should not
> be part of the bindings. Also it's not a real problem - the driver
> just calls clk_get_rate().

How is the rate determined? I mean, many ISPs or CSI-2 receivers that
provide the clock are also capable of using a variety of frequencies. But
only one can be used on the platform in general.

Where does it come from if it's not in DT?

Using another frequency generally leads to failure later on as the desired
link frequency likely is not available for a random external clock
frequency.

-- 
Sakari Ailus
