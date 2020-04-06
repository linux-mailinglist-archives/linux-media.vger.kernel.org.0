Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E758E19F878
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 17:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgDFPGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 11:06:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:4461 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728695AbgDFPGa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 11:06:30 -0400
IronPort-SDR: IpCH46fnrgIwOj0Uw5Z8/PBPcL309qndtdiBx0TUyB8iMunWD++KxLucXS1rePGTrOd9LZgXvH
 cbgA0L82J9+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:06:28 -0700
IronPort-SDR: mqw7ycFAc1LmPAC67DPTqIPgVgTjHFH2j8p8RoZfwndcKlL/z+tEfGOZN1CLbTbI2F7YfryUZ/
 sRgsmN8ohpTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="450862810"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2020 08:06:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jLTKU-00GCiI-8A; Mon, 06 Apr 2020 18:06:26 +0300
Date:   Mon, 6 Apr 2020 18:06:26 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/3] media: ov8856: Add devicetree support
Message-ID: <20200406150626.GW3676135@smile.fi.intel.com>
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-3-robert.foss@linaro.org>
 <CAHp75VfFKY6nzb8aEWmop73v2haZ0P5+aTsKDEU8M=uUPn0u3g@mail.gmail.com>
 <CAG3jFyuH5Kad16R7Oit-c_7RasiEfPycOpA68JYLVopbyQ749w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyuH5Kad16R7Oit-c_7RasiEfPycOpA68JYLVopbyQ749w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 06, 2020 at 03:37:24PM +0200, Robert Foss wrote:
> On Tue, 31 Mar 2020 at 16:01, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Mar 31, 2020 at 4:36 PM Robert Foss <robert.foss@linaro.org> wrote:

...

> > > +       if (ret < 0) {
> >
> > Do you need all ' < 0' parts all over the series?
> 
> Some checks are needed due to ACPI and DT support co-existing.
> Maybe it would be better to just split the probing into an ACPI path
> and a DT path.
> 
> I'll have a look through the series for redundant retval checks.

Drop where it is redundant.

...

> > > -       ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> > > -       if (ret)
> > > -               return ret;
> >
> > Where is it gone? Why?
> 
> It was replaced by a clk_get_rate call, which as Sakari pointed out,
> isn't correct.
> I'll rework the clock handling for v4.

If it was in the driver it should stay -- properties is an ABI (between firmware and kernel).

> > > +       ov8856->xvclk = devm_clk_get_optional(dev, "xvclk");
> > > +       if (IS_ERR(ov8856->xvclk)) {
> >
> > > +               dev_err(dev, "could not get xvclk clock (%ld)\n",
> > > +                       PTR_ERR(ov8856->xvclk));
> >
> > Also you may use %pe here and in similar cases.
> 
> Weirdly checkpatch complains about this.
> But it builds and runs cleanly, so I'll add it in v4.

%pe requires pointer, PTR_ERR converts pointer to integer.

...

> > > +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
> > > +                                     ov8856->supplies);
> > > +       if (ret) {
> >
> > > +               dev_warn(dev, "failed to get regulators\n");
> >
> > If it's a warning, why we return from here?
> > Same question to all other places with same issue.
> 
> The issue I was seeing was the driver having to return a EDEFER here,
> so this warning sheds some light on which exact component is returning
> an EDEFER.
> 
> [   15.962623] ov8856 16-0010: Dropping the link to regulator.29
> [   15.968464] ov8856 16-0010: failed to get regulators
> [   15.973493] ov8856 16-0010: failed to get HW configuration: -517
> [   15.979591] ov8856 16-0010: removing from PM domain titan_top_gdsc
> [   15.985855] ov8856 16-0010: genpd_remove_device()
> [   15.990672] i2c 16-0010: Driver ov8856 requests probe deferral
> 
> Personally I found it helpful to speed up debugging, but I'll happily
> remove it if you prefer no warning.

My point is that you have it in align:
 - if it is an error, print as an error and bail out, otherwise
 - if it is a warning, print it and continue.

> > > +               return ret;
> > >         }

-- 
With Best Regards,
Andy Shevchenko


