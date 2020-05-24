Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7AA1E02C2
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 22:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388075AbgEXUdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 16:33:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:8056 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388045AbgEXUdu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 16:33:50 -0400
IronPort-SDR: DCubHS15rd9IwKKdybv3X9Sleift3gq9agqNrnj4MdfLcY+J96Yk8NUZKjiktPO69TQgvh+Y/y
 oqY8IFhS6RLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2020 13:33:50 -0700
IronPort-SDR: hGO7Y3wYazKbBMeBckgS76jnZK8vgx3/d2+Tum7KpIZBE7Os41Bbvt3Qwb/u2VDS+n2UM4fhvq
 Z18P3EudgMLg==
X-IronPort-AV: E=Sophos;i="5.73,430,1583222400"; 
   d="scan'208";a="254745249"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2020 13:33:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 554C820736; Sun, 24 May 2020 23:33:44 +0300 (EEST)
Date:   Sun, 24 May 2020 23:33:44 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200524203344.GB7618@paasikivi.fi.intel.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com>
 <20200511160207.GA32476@bogus>
 <1589251221.8804.289.camel@mhfsdcap03>
 <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 21, 2020 at 08:59:56PM +0200, Tomasz Figa wrote:
> Hi Dongchun, Rob,
> 
> On Tue, May 12, 2020 at 4:41 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Rob,
> >
> > Thanks for the review.
> >
> > On Mon, 2020-05-11 at 11:02 -0500, Rob Herring wrote:
> > > On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
> [snip]
> > > > +            port {
> > > > +                wcam_out: endpoint {
> > > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > > +                    data-lanes = <1>;
> > >
> > > This doesn't match the schema which says this should be 4 entries.
> > >
> >
> > Property "data-lanes" shows the number of lanes that sensor supports.
> > If this property is omitted, four-lane operation is assumed.
> > For OV02A10, it is one-lane operation, so the property is supposed to be
> > set to <1>.
> >
> 
> To clarify on this, the ov02a10 sensor supports only 1 lane. It's not
> a driver limitation.

If there's nothing to configure there, then the property should be omitted.
I understood the sensor supported one to four lanes...

-- 
Sakari Ailus
