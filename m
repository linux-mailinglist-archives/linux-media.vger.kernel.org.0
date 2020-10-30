Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816402A0C25
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 18:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgJ3RJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 13:09:22 -0400
Received: from mga07.intel.com ([134.134.136.100]:13406 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727302AbgJ3RJV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 13:09:21 -0400
IronPort-SDR: Y8yhdcsHf6gaZ3HuUt3p4CpPFMl+1SLC7zoZ4ZrqZHBAaTYQWZnMpb3qe7gGyc0kl4LwS9Merg
 1iWavjVYPPHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="232815560"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="232815560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 10:09:21 -0700
IronPort-SDR: ws0AqHa+sfBSJMWZTmlC/P4vwPmOIJTN6GqcPVJPQA6N2F3meXhAevZDbLaMQoghfLO+k1rVnM
 PGExSGNFJgsw==
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="469582751"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 10:09:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2F86C20AA6; Fri, 30 Oct 2020 18:27:56 +0200 (EET)
Date:   Fri, 30 Oct 2020 18:27:56 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201030162756.GR26150@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
 <20201019082759.GL13341@paasikivi.fi.intel.com>
 <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz, Dongchun,

On Mon, Oct 19, 2020 at 09:20:15PM +0200, Tomasz Figa wrote:
> On Mon, Oct 19, 2020 at 10:28 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Wed, Oct 14, 2020 at 01:48:00PM +0200, Tomasz Figa wrote:
> > > On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > > > > Hello Sakari,
> > > > >
> > > > > Thanks for your timely review.
> > > > >
> > > > > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > > > > Hi Dongchun,
> > > > > >
> > > > > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > > > > relevant MAINTAINERS entries.
> > > > > > >
> > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > ---
> > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > >  2 files changed, 169 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > >
> > > > >
> > > > > [snip]...
> > > > >
> > > > > > > +  ovti,mipi-clock-voltage:
> > > > > > > +    description:
> > > > > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > > > > +      the clock driver capability.
> > > > > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > > > > +    minItems: 2
> > > > > > > +    default: [390000, 4]
> > > > > >
> > > > > > Why do you have the link frequency here as well?
> > > > > >
> > > > > > In principle this does belong to the endpoint as link frequencies are
> > > > > > specific to that, but I don't mind; there's just a single port anyway.
> > > > > >
> > > > >
> > > > > This is an optional property which we model as an array of <link speed,
> > > > > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > > > > use the value 4 for current driver. If one wants to select different
> > > > > voltage for different link, they could do so as well.
> > > >
> > > > If you think you'd need that, then you need to put this to the endpoint.
> > >
> > > The mipi-clock-voltage property is not a property of the endpoint. The
> > > link frequency there does not set the link frequency - it only
> > > specifies which link frequency the given voltage should be used for.
> >
> > If it is not bound to the endpoint --- that specifies the properties of the
> > link --- then you could just put it to the driver, couldn't you?
> >
> > But earlier on, we established that this is specific to a given board, or a
> > given link. Endpoints are used to describe connections that a device may
> > have to other devices. Therefore their properties are different.
> >
> > The graph bindings allow for several endpoints on a single physical port,
> > some may be disabled in that case. This is admittedly mostly done with
> > CSI-2 receivers.
> >
> > Either way, putting this property to the device may affect how DT source is
> > arranged for boards that have this device. Any similar configuration on
> > other devices with multiple transmitters or receivers would be in endpoints
> > anyway --- because they have to, so I don't see why bindings for this
> > device should be different.
> >
> > If you put it to endpoint, the driver also doesn't need to match the link
> > frequencies in kHz and Hz between the two properties, but just use the same
> > index for both.
> 
> I agree in general, but I think in this case this is a device-specific
> property and the sensor only has 1 CSI-2 interface, so maybe it
> doesn't really matter?
> 
> Specifying frequency, voltage pairs is a common practice in other
> bindings, such as the OPP bindings, by the way.
> 
> That said, if you insist, I'm fine with this being moved to the
> endpoint node too.

Please, unless there are sound technical reasons to do otherwise.

-- 
Sakari Ailus
