Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6A520F758
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 16:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389042AbgF3OhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 10:37:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:49391 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbgF3OhI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 10:37:08 -0400
IronPort-SDR: u/5ngZ9eeHDm0uJ8+9MNY73f65U15CCfGUUgKA/cSn3JCR12S/6hKIBODzXOFxFyjq59Cpvaxt
 sdYrEzOjPgYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="164251998"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="164251998"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 07:37:08 -0700
IronPort-SDR: TXnmtpuuv8IkPHzCQZ8xil9NFjyMMlIhDaUlHleEi9/3MlNTBqZVvADOI64AV/rGk+FbVBXUaf
 bDSog2SN/SQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="266488793"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2020 07:37:04 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jqHNh-00GrcC-2T; Tue, 30 Jun 2020 17:37:05 +0300
Date:   Tue, 30 Jun 2020 17:37:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630143705.GW3703480@smile.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
 <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 30, 2020 at 04:21:31PM +0200, Tomasz Figa wrote:
> On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:

...

> > > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > >
> > >
> > > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > > the sensor off the first time. Alternatively make reset signal high in
> > > runtime suspend callback.
> >
> > We might want to keep the signals low when the regulators are powered
> > down, to reduce the leakage.
> 
> Ah, I actually recall that the reset pin was physically active low, so
> we would indeed better keep it at HIGH. Sorry for the noise.

Here HIGH means "asserted", so in the code above it's LOW, means "deasserted",
i.o.w. non-reset state. I dunno what is better, it depends to the firmware /
driver expectations of the device configuration (from the power point of view,
HIGH makes sense here, and not LOW, i.o.w. asserted reset line).

And nice of the logical state that it doesn't depend to the active low / high
(the latter just transparent to the user).

-- 
With Best Regards,
Andy Shevchenko


