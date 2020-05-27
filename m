Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9321E4FE8
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 23:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgE0VQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 17:16:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:56933 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgE0VQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 17:16:36 -0400
IronPort-SDR: qNdzHCkvwmR/OgGy+qJ66mcPpczBcJ7G47v2IVSElos9dO61Ac1b8aLE6JLvHYHBljK0zd9g2c
 IYS7imn0ODEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 14:16:35 -0700
IronPort-SDR: XCm8vub/jNoIWjRW3pQgdNpxd20fY5viVZZhDBe1JUEsvjmEBvyvBAAIgEeyHz31GajEQ6Ggny
 cgVGkXlUxPsA==
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; 
   d="scan'208";a="468887887"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 14:16:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9D86F206EA; Thu, 28 May 2020 00:16:28 +0300 (EEST)
Date:   Thu, 28 May 2020 00:16:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200527211628.GT7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob, Dongchun,

On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +        additionalProperties: false
> > > > +
> > > > +        properties:
> >
> > Actually I wonder whether we need to declare 'clock-lanes' here?
> 
> Yes, if you are using it.

Dongchun, can you confirm the chip has a single data and a single clock
lane and that it does not support lane reordering?

So if there's nothing to convey to the driver, also the data-lanes should
be removed IMO.

-- 
Kind regards,

Sakari Ailus
