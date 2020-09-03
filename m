Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D0425BB08
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 08:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgICGau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 02:30:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:12741 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgICGau (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 02:30:50 -0400
IronPort-SDR: i1oxDGt4k5KE9EG3KCUfj5UcEp+iHG78eExBNHZx4QZppcawUfD/r0AcZZm4CXt7VmcODRdUtA
 k7mfJLBw9chg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="137578471"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="137578471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 23:30:49 -0700
IronPort-SDR: pjZ7tQiDH/pCeyrz+Pdq6Kot+MmMA25BcyAf0ohtVbNOLyFSScDOLezfgHo03oP1a9txzijsuT
 nIOW6kZKD3QQ==
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="477934111"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 23:30:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 08AB72034D; Thu,  3 Sep 2020 09:30:43 +0300 (EEST)
Date:   Thu, 3 Sep 2020 09:30:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Xingyu Wu <wuxy@bitland.com.cn>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "shawnx.tu" <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "dave.stevenson" <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        darfur_liu <darfur_liu@gcoreinc.com>,
        "hao.he7" <hao.he7@gmail.com>,
        =?utf-8?B?5L2V5rWpQjAzMjA1?= <hao.he@bitland.com.cn>
Subject: Re: [PATCH V3 3/3] media: i2c: gc5035: Add GC5035 image sensor driver
Message-ID: <20200903063042.GH32646@paasikivi.fi.intel.com>
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
 <1597380295-6297-5-git-send-email-wuxy@bitland.com.cn>
 <20200831174057.GO31019@paasikivi.fi.intel.com>
 <CAAFQd5ARYNVMjScuk5-w_z5Pt6jD=CPkCYG+rM2Znvt9j1Od6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5ARYNVMjScuk5-w_z5Pt6jD=CPkCYG+rM2Znvt9j1Od6g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Thu, Sep 03, 2020 at 12:59:20AM +0200, Tomasz Figa wrote:
> Hi Sakari,
> 
> On Mon, Aug 31, 2020 at 7:41 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Xingyu,
> >
> > Thanks for the update. I've got a few more comments below.
> >
> > Do you happen to have some insight on what the OTP data contains and what
> > does the driver do with it?
> >
> > At least in principle the OTP data may be programmed for the customer so
> > the same sensor could contain something else what the driver expects to
> > find there.
> >
> 
> Thanks for the review. For anything without my reply, assume fixed. :)
> 
> As far as I can see, the data is being read from an area that is
> supposed to be reserved for Galaxycore, so I'd assume it doesn't
> depend on the customer.

Sounds good.

> 
> [snip]
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index da11036..aeaf594 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -712,6 +712,18 @@ config VIDEO_APTINA_PLL
> > >  config VIDEO_SMIAPP_PLL
> > >       tristate
> > >
> > > +config VIDEO_GC5035
> > > +     tristate "Galaxycore GC5035 sensor support"
> > > +     depends on I2C && VIDEO_V4L2
> > > +     select MEDIA_CONTROLLER
> > > +     select VIDEO_V4L2_SUBDEV_API
> >
> > Add:
> >
> >         V4L2_FWNODE
> >         OF
> 
> This driver doesn't depend on OF. It uses the firmware-independent
> property access API. (v4 I sent actually uses device_property_*()).

Yes, this is even better.

> 
> [snip]
> > > +static int __gc5035_power_on(struct gc5035 *gc5035)
> > > +{
> > > +     struct device *dev = &gc5035->client->dev;
> > > +     int i, ret;
> > > +
> > > +     ret = clk_prepare_enable(gc5035->xvclk);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "Failed to enable xvclk\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     gpiod_set_value_cansleep(gc5035->reset_gpio, 1);
> > > +
> > > +     for (i = 0; i < GC5035_NUM_SUPPLIES; i++) {
> > > +             ret = regulator_enable(gc5035->supplies[i].consumer);
> > > +             if (ret) {
> > > +                     dev_err(dev, "Failed to enable %s: %d\n",
> > > +                             gc5035->supplies[i].supply, ret);
> > > +                     goto disable_reg_clk;
> >
> > Please use regulator_bulk_enable() here, and regulator_bulk_disable()
> > below.
> >
> 
> This actually needs to have one of the regulators (iovdd) enabled
> before the other ones, but regulator_bulk_enable() is async. In v4 I
> used regulator_enable() for iovdd and regulator_bulk_enable() for the
> other two for optimal sequencing.

Ack.

-- 
Sakari Ailus
