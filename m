Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2A31F3954
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 13:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgFILOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 07:14:33 -0400
Received: from mga03.intel.com ([134.134.136.65]:13346 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728902AbgFILOb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 07:14:31 -0400
IronPort-SDR: z9qE89ticaNrfKwWCGu7uuxWge9VMYZ+/nc2lP3aWrnJqyFy2SPwo5K6HXD/cdOnjDuKzzcBO+
 +HjysuT5tXAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 04:14:30 -0700
IronPort-SDR: 1x2X09s+C+ZmFmpenHPAYX2alWHxwwRofz1VOCvBr/3CFXAO8x1AES5WZ0cMkbs0UWxKP4TrPA
 gyns/aLdBahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; 
   d="scan'208";a="379708876"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2020 04:14:26 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jicD6-00BsuX-SU; Tue, 09 Jun 2020 14:14:28 +0300
Date:   Tue, 9 Jun 2020 14:14:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200609111428.GH2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
 <1591424358.8804.599.camel@mhfsdcap03>
 <20200608132720.GS2428291@smile.fi.intel.com>
 <1591674341.8804.628.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591674341.8804.628.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 09, 2020 at 11:45:41AM +0800, Dongchun Zhu wrote:
> On Mon, 2020-06-08 at 16:27 +0300, Andy Shevchenko wrote:
> > On Sat, Jun 06, 2020 at 02:19:18PM +0800, Dongchun Zhu wrote:
> > > On Fri, 2020-06-05 at 15:46 +0300, Andy Shevchenko wrote:
> > > > On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:

...

> > > > > +#define DW9768_AAC_TIME_DEFAULT			0x20
> > > > 
> > > > Hex? Why not decimal?
> > > > 
> > > 
> > > There is one optional property 'dongwoon,aac-timing' defined in DT.
> > > I don't know whether you have noticed that.
> > > 
> > > 'DW9768_AAC_TIME_DEFAULT' is the value set to AACT[5:0] register.
> > > I thought the Hex unit should be proper as it is directly written to the
> > > Hex register.
> > 
> > I see. I would rather put it like (BIT(6) / 2) to show explicitly that we
> > choose half of the resolution.
> > 
> 
> I knew your idea.
> '(BIT(6) / 2)' may somewhat show the meaning of 'median of the total
> range of AACT[5:0]'.
> 
> But this value is still very obscure relative to '0x20'.
> As I thought that simple is the best, especially for kernel upstream
> patch.

Okay, let's wait for maintainers to speak up.

...

> > > > > +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > > > > +		ret = dw9768_set_dac(dw9768, val);
> > > > > +		if (ret) {
> > > > > +			dev_err(&client->dev, "I2C write fail: %d", ret);
> > > > > +			return ret;
> > > > > +		}
> > > > > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > > > > +	}
> > > > 
> > > > 
> > > > It will look more naturally in the multiplier kind of value.
> > > > 
> > > > 	unsigned int steps = DIV_ROUND_UP(...);
> > > > 
> > > > 	while (steps--) {
> > > > 		...(..., steps * ..._MOVE_STEPS);
> > > > 		...
> > > > 	}
> > > > 
> > > > but double check arithmetics.
> > > 
> > > The current coding style is actually updated with reference to your
> > > previous comments on DW9768 v3:
> > > https://patchwork.linuxtv.org/patch/61856/
> > 
> > I understand, but can you consider to go further and see if the proposal works?
> > 
> 
> In fact, your suggestion is something like one another method to set DAC
> value to actuator.
> It is like there may be several solutions to a question.
> 
> Yes. I just tried the new method and it works as expected.
> u32 steps = DIV_ROUND_UP(dw9768->focus->val, DW9768_MOVE_STEPS);
> while (steps--) {
> 	ret = dw9768_set_dac(dw9768, steps * DW9768_MOVE_STEPS);
> 	if (ret)
> 		return ret;
> 	usleep_range(move_delay_us, move_delay_us + 1000);
> }
> 
> But from my perspective, I may prefer to the original method.
> As here what we really care is the DAC value,
> 'dw9768_set_dac(dw9768, val)' seems more simple.

OK.


-- 
With Best Regards,
Andy Shevchenko


