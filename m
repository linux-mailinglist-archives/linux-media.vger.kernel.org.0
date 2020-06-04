Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2671EDF15
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgFDIKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:10:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:22184 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbgFDIKm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 04:10:42 -0400
IronPort-SDR: k2PffX4gI4onnC2BwLanvyM4Ds9H/j71SzOyGLlu/2QUZWL0jcTDkNYu99ywLTs7TD24WXHA13
 pmgNmi9O39XA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 01:10:39 -0700
IronPort-SDR: CbG8SA9IhTmLTH3EL+wOoj7Z+e/tx6p7eh+kvesL/bCsdRHwoUHbG9MoFKrrpylBG1+ENZXDTC
 ZYuSLrwBrVXA==
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="294250715"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 01:10:34 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D771F20859; Thu,  4 Jun 2020 11:10:32 +0300 (EEST)
Date:   Thu, 4 Jun 2020 11:10:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20200604081032.GG16711@paasikivi.fi.intel.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com>
 <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
 <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
 <1590570089.8804.453.camel@mhfsdcap03>
 <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
 <1591238018.8804.555.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591238018.8804.555.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 04, 2020 at 10:33:38AM +0800, Dongchun Zhu wrote:
> Hi Tomasz,
> 
> On Mon, 2020-06-01 at 20:47 +0200, Tomasz Figa wrote:
> > On Wed, May 27, 2020 at 11:03 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Mon, 2020-05-25 at 13:45 +0200, Tomasz Figa wrote:
> > > > On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > > >
> > > > > Hi Tomasz,
> > > > >
> > > > > Thanks for the review. My replies are as below.
> > > > >
> > > > > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > > > > Hi Dongchun, Sakari,
> > > > > >
> > > > > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> > > > [snip]
> > > > > > > +   pm_runtime_enable(dev);
> > > > > > > +   if (!pm_runtime_enabled(dev)) {
> > > > > > > +           ret = dw9768_runtime_resume(dev);
> > > > > > > +           if (ret < 0) {
> > > > > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > > > > +                   goto entity_cleanup;
> > > > > > > +           }
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > > > +   if (ret < 0)
> > > > > > > +           goto entity_cleanup;
> > > > > > > +
> > > > > > > +   return 0;
> > > > > > > +
> > > > > > > +entity_cleanup:
> > > > > >
> > > > > > Need to power off if the code above powered on.
> > > > > >
> > > > >
> > > > > Thanks for the reminder.
> > > > > If there is something wrong with runtime PM, actuator is to be powered
> > > > > on via dw9768_runtime_resume() API.
> > > > > When actuator sub-device is powered on completely and async registered
> > > > > successfully, we shall power off it afterwards.
> > > > >
> > > >
> > > > The code above calls dw9768_runtime_resume() if
> > > > !pm_runtime_enabled(dev), but the clean-up code below the
> > > > entity_cleanup label doesn't have the corresponding
> > > > dw9768_runtime_suspend() call.
> > > >
> > >
> > > Did you mean the 'entity_cleanup' after v4l2_async_register_subdev()?
> > 
> > Yes.
> > 
> > > Actually I made some changes for OV02A V9, according to this comment.
> > > Could you help review that change? Thanks.
> > 
> > Sure, I will take a look.
> > 
> 
> Thanks.
> Sorry, I just wanna make sure the change is okay for next release.
> May we use the check like OV02A V9 did?
> ret = v4l2_async_register_subdev(&dw9768->sd);
> if (ret < 0) {
> 	if (!pm_runtime_enabled(dev))
> 		dw9768_runtime_suspend(dev);

Please do this part where you're jumping to, if possible.

> 	goto entity_cleanup;
> }
> 

-- 
Sakari Ailus
