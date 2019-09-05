Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 245AFAA247
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 14:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731840AbfIEMAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 08:00:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:60292 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbfIEMAV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 08:00:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 05:00:20 -0700
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="187955306"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 05:00:15 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DC18520584; Thu,  5 Sep 2019 15:00:12 +0300 (EEST)
Date:   Thu, 5 Sep 2019 15:00:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        dongchun.zhu@mediatek.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, drinkcat@chromium.org,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, sam.hung@mediatek.com,
        shengnan.wang@mediatek.com
Subject: Re: [V2, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20190905120012.GD5475@paasikivi.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-2-dongchun.zhu@mediatek.com>
 <20190905101406.GA2680@smile.fi.intel.com>
 <20190905104829.GB5475@paasikivi.fi.intel.com>
 <20190905113509.GD2680@smile.fi.intel.com>
 <CABxcv=knP+-x0O-Ga-Dy8WTNovHk6GfX4ZEv0vVjnQvwchuVzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABxcv=knP+-x0O-Ga-Dy8WTNovHk6GfX4ZEv0vVjnQvwchuVzg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 01:49:28PM +0200, Javier Martinez Canillas wrote:
> On Thu, Sep 5, 2019 at 1:35 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Sep 05, 2019 at 01:48:30PM +0300, Sakari Ailus wrote:
> > > On Thu, Sep 05, 2019 at 01:14:06PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Sep 05, 2019 at 03:21:41PM +0800, dongchun.zhu@mediatek.com wrote:
> > > > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > >
> > > > > This patch is to add the Devicetree binding documentation and
> > > > > MAINTAINERS entry for dw9768 actuator.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 +++++++++
> > > > >  MAINTAINERS                                                     | 7 +++++++
> > > >
> > > > This should be:
> > > > 1) two separate patches
> > >
> > > Why? The MAINTAINERS entry is usually added in the first patch needing it,
> > > isn't it?
> >
> > Bindings are required to be a separate patch.
> > Rob, is it still the case or am I mistaken?
> >
> 
> According to the rule 0 in [1] it should be a separate patch indeed
> and also use as subject "dt-bindings: <binding dir>: ..." which this
> patch also doesn't follow.
> So if I'm reading that document correctly, then I think the
> maintainers entry should be added in patch 2/2 along with the driver.

I understand [1] discussing the need for the bindings to be a "separate
patch" means a separate patch from the _driver_ for the device, not the
MAINTAINERS change.

Bindings come before the driver, and MAINTAINERS entry needs to be there no
later than the files. And I see no reason to add a separate patch just for
MAINTAINERS change.

> 
> [1]: https://www.kernel.org/doc/Documentation/devicetree/bindings/submitting-patches.txt

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
