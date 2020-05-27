Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE671E4FDD
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 23:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgE0VMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 17:12:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:21905 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgE0VMA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 17:12:00 -0400
IronPort-SDR: 4F4XlTyn8/pBK0aDtkqp3Ys+Vejakqshu6one+qzRHBzK9zrGBSbu2uAhl2TMYe+SmTiVl6bsr
 K+boIJHe+Q8Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 14:11:59 -0700
IronPort-SDR: ZCZn22c4t0Kf4WafHmfwy6fPyENsMjl0y7aCtmUolIaeqy5VZ3cwjdvpDtqwYxgHkLtyy1f9+6
 CeMReU8g/sPw==
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; 
   d="scan'208";a="284940319"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 14:11:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0E362206EA; Thu, 28 May 2020 00:11:53 +0300 (EEST)
Date:   Thu, 28 May 2020 00:11:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200527211152.GS7618@paasikivi.fi.intel.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com>
 <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
 <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 25, 2020 at 01:45:07PM +0200, Tomasz Figa wrote:
> On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > Thanks for the review. My replies are as below.
> >
> > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > Hi Dongchun, Sakari,
> > >
> > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> [snip]
> > > > +   pm_runtime_enable(dev);
> > > > +   if (!pm_runtime_enabled(dev)) {
> > > > +           ret = dw9768_runtime_resume(dev);
> > > > +           if (ret < 0) {
> > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > +                   goto entity_cleanup;
> > > > +           }
> > > > +   }
> > > > +
> > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > +   if (ret < 0)
> > > > +           goto entity_cleanup;
> > > > +
> > > > +   return 0;
> > > > +
> > > > +entity_cleanup:
> > >
> > > Need to power off if the code above powered on.
> > >
> >
> > Thanks for the reminder.
> > If there is something wrong with runtime PM, actuator is to be powered
> > on via dw9768_runtime_resume() API.
> > When actuator sub-device is powered on completely and async registered
> > successfully, we shall power off it afterwards.
> >
> 
> The code above calls dw9768_runtime_resume() if
> !pm_runtime_enabled(dev), but the clean-up code below the
> entity_cleanup label doesn't have the corresponding
> dw9768_runtime_suspend() call.

Yes, an example on using runtime PM can be found in e.g. ov8856 driver.

The open / release callbacks seem fine though. Sensors just don't need
them as they have the streaming state (and s_stream).

-- 
Sakari Ailus
