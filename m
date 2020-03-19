Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148B018B26C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 12:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgCSLgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 07:36:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:28282 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgCSLgN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 07:36:13 -0400
IronPort-SDR: e8zNjWbh0ykkkWfYJWE+GlBp9NqQPwvmsZFeZh5QG1ETpTowMxQDyWk+lj0VdDiZV5o3Sk6y3t
 K+Bv3W88I1+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 04:36:12 -0700
IronPort-SDR: zLFal0iZZQ0ZeR6+e3XbpetkEaXpQZVwtGXSMeK5IxeonJZfwJg60dAil2oiypArdRd8mzsDIw
 R6s5MCiPToyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; 
   d="scan'208";a="444534943"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2020 04:36:09 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jEtT9-00B3pc-1y; Thu, 19 Mar 2020 13:36:11 +0200
Date:   Thu, 19 Mar 2020 13:36:11 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        sj.huang@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>, louis.kuo@mediatek.com,
        shengnan.wang@mediatek.com
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200319113611.GJ1922688@smile.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
 <20200305120516.GQ5379@paasikivi.fi.intel.com>
 <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
 <1584612215.5781.62.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584612215.5781.62.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 06:03:35PM +0800, Dongchun Zhu wrote:
> On Tue, 2020-03-10 at 12:10 +0200, Andy Shevchenko wrote:
> > On Thu, Mar 5, 2020 at 2:07 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > > On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> > > > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > > > and provides control to set the desired focus via I2C serial interface.
> > 
> > ...
> > 
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -5139,6 +5139,7 @@ M:      Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > >  L:   linux-media@vger.kernel.org
> > > >  T:   git git://linuxtv.org/media_tree.git
> > > >  S:   Maintained
> > > > +F:   drivers/media/i2c/dw9768.c
> > > >  F:   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > 
> > This has ordering issues.
> > Run parse-maintainers.pl to fix.
> > 
> 
> Pardon, how to run parse-maintainers.pl?
> Locally I ran this script, it occurs some syntax as below.
> $./scripts/parse-maintainers.pl

It's a perl script which is made non-executable by some reason.

So, proper run as a parameter to the language interpreter, i.e.
	$ perl scripts/parse-maintainer.pl

-- 
With Best Regards,
Andy Shevchenko


