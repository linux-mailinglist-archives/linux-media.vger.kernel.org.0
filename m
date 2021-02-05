Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BB03106E1
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhBEIiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:38:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:14144 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229736AbhBEIiD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 03:38:03 -0500
IronPort-SDR: 1lyIEEZCHWsuBxZq0tABCg67KABRBUWZW8iAGjUQn/QI/jtHUMTn4eeFe3Gg9lWSu8HrUbL6I1
 tYKlnsrMYuvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="180627142"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="180627142"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 00:36:11 -0800
IronPort-SDR: Q3dRjpCv2RccvW796ai0N3auitlP3dOEZRq4rGlTkFc8QtJXMSvVbnNUC9RxmqV6LszSaIsgpn
 1yXZaJ0YYz5A==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="415952976"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 00:36:09 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 81D99205D2; Fri,  5 Feb 2021 10:35:37 +0200 (EET)
Date:   Fri, 5 Feb 2021 10:35:37 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Martina Krasteva <martinax.krasteva@linux.intel.com>,
        gjorgjix.rosikopulos@linux.intel.com, devicetree@vger.kernel.org,
        Daniele Alessandrelli <daniele.alessandrelli@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        paul.j.murphy@linux.intel.com
Subject: Re: [PATCH v7 1/2] dt-bindings: media: Add bindings for imx334
Message-ID: <20210205083537.GE32460@paasikivi.fi.intel.com>
References: <20210203135441.136-1-martinax.krasteva@linux.intel.com>
 <20210203135441.136-2-martinax.krasteva@linux.intel.com>
 <1612452057.710530.452037.nullmailer@robh.at.kernel.org>
 <20210204161654.GC32460@paasikivi.fi.intel.com>
 <CAL_JsqJDwtUQEe7RTaNsCkbLr+WO-RS5QuGsQwtAmmm5nkcw_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDwtUQEe7RTaNsCkbLr+WO-RS5QuGsQwtAmmm5nkcw_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Rob,

On Thu, Feb 04, 2021 at 05:06:04PM -0600, Rob Herring wrote:
> On Thu, Feb 4, 2021 at 10:17 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Rob,
> >
> > On Thu, Feb 04, 2021 at 09:20:57AM -0600, Rob Herring wrote:
> > > On Wed, 03 Feb 2021 13:54:40 +0000, Martina Krasteva wrote:
> > > > From: Martina Krasteva <martinax.krasteva@intel.com>
> > > >
> > > > - Add dt-bindings documentation for Sony imx334 sensor driver.
> > > > - Add MAINTAINERS entry for Sony imx334 binding documentation.
> > > >
> > > > Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> > > > Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> > > > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > > > Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 90 ++++++++++++++++++++++
> > > >  MAINTAINERS                                        |  8 ++
> > > >  2 files changed, 98 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Error: Documentation/devicetree/bindings/media/i2c/sony,imx334.example.dts:28.17-18 syntax error
> > > FATAL ERROR: Unable to parse input tree
> 
> That's usually a missing header for #defines.
> 
> > > make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/media/i2c/sony,imx334.example.dt.yaml] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [Makefile:1370: dt_binding_check] Error 2
> > >
> > > See https://patchwork.ozlabs.org/patch/1435383
> > >
> > > This check can fail if there are any dependencies. The base for a patch
> > > series is generally the most recent rc1.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit.
> >
> > Thanks for reporting this. The example was apparently missing the
> > assigned-clock-parents property. I'll squash the following change to the
> > patch:
> 
> Doubtful. That would be a more specific schema error.

Well, I guess the parsing didn't get quite there. There's a missing
semicolon a few lines above it.

> 
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> > index 3145e94d043e7..4217fbea0735a 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> > @@ -76,6 +76,7 @@ examples:
> >              clocks = <&imx334_clk>

				       ^

> >
> >              assigned-clocks = <&imx334_clk>;
> > +            assigned-clock-parents = <&imx334_clk_parent>;
> >              assigned-clock-rates = <24000000>;
> >
> >              port {
> >

-- 
Kind regards,

Sakari Ailus
