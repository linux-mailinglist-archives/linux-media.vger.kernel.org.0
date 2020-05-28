Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF581E5873
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 09:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgE1HXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 03:23:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:61593 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgE1HXi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 03:23:38 -0400
IronPort-SDR: qSIW9pCeJl1TV3CUxFrsMRb9zaG62MnKDqwEGo+DQjvmarQDGUfmjYLCpC2XL+03zZGCg4ezYO
 p0x5vhWrVSQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 00:23:38 -0700
IronPort-SDR: Cq682KuSibl51HWgu35fWEi3NwANS2Mgne5bhc3ZisPoIf3Lu3h3gtstnZAyvyo6tm9/DTiOWg
 UT0E4D4DZGkA==
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
   d="scan'208";a="291904084"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 00:23:34 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 283F1206EA; Thu, 28 May 2020 10:23:32 +0300 (EEST)
Date:   Thu, 28 May 2020 10:23:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
Message-ID: <20200528072332.GW7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com>
 <1590636882.8804.474.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590636882.8804.474.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> Hi Sakari, Rob,
> 
> On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > Hi Rob, Dongchun,
> > 
> > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > +    properties:
> > > > > > +      endpoint:
> > > > > > +        type: object
> > > > > > +        additionalProperties: false
> > > > > > +
> > > > > > +        properties:
> > > >
> > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > 
> > > Yes, if you are using it.
> > 
> > Dongchun, can you confirm the chip has a single data and a single clock
> > lane and that it does not support lane reordering?
> > 
> 
> From the datasheet, 'MIPI inside the OV02A10 provides one single
> uni-directional clock lane and one bi-directional data lane solution for
> communication links between components inside a mobile device.
> The data lane has full support for HS(uni-directional) and
> LP(bi-directional) data transfer mode.'
> 
> The sensor doesn't support lane reordering, so 'clock-lanes' property
> would not be added in next release.
> 
> > So if there's nothing to convey to the driver, also the data-lanes should
> > be removed IMO.
> > 
> 
> However, 'data-lanes' property may still be required.
> It is known that either data-lanes or clock-lanes is an array of
> physical data lane indexes. Position of an entry determines the logical
> lane number, while the value of an entry indicates physical lane, e.g.,
> for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> the clock lane is on hardware lane 0.
> 
> As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> support lane reordering, so here we shall use 'data-lanes = <1>' as
> there is only a clock lane for OV02A10.
> 
> Reminder:
> If 'data-lanes' property is not present, the driver would assume
> four-lane operation. This means for one-lane or two-lane operation, this
> property must be present and set to the right physical lane indexes.
> If the hardware does not support lane reordering, monotonically
> incremented values shall be used from 0 or 1 onwards, depending on
> whether or not there is also a clock lane.

How can the driver use four lanes, considering the device only supports a
single lane??

-- 
Sakari Ailus
