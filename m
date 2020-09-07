Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50950260232
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 19:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgIGRU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 13:20:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:32295 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729712AbgIGNxS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Sep 2020 09:53:18 -0400
IronPort-SDR: KyMNN8CrHL07unmX9jVAJwInqykI24fTxUrAXwbPzZbMZz5TRt6iePxlhE9uSdWvEEMBHZJM2a
 2sdN3kOcLi0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="158983617"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="158983617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 06:51:10 -0700
IronPort-SDR: QA6tpQQPK2xO+vA9bWsf8yc3XQicbfmqmYZRNKcI7GVnV/iLwnJM0rEc48iraNGRgHIudDeUA0
 ypJW6zZghdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="333169136"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2020 06:51:06 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kFHXz-00ExtQ-Ge; Mon, 07 Sep 2020 16:51:03 +0300
Date:   Mon, 7 Sep 2020 16:51:03 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>, matrix.zhu@aliyun.com
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20200907135103.GI1891694@smile.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <1599225767.4733.64.camel@mhfsdcap03>
 <CAHp75Ve8WNuCuRmFcXaZHLjHMGfsvM=69ii5g4H+NYud6N95eQ@mail.gmail.com>
 <CAAFQd5BH4NZrhg=abqc=P9Uzf+t4Davn4SP9i3QktS4Q05WtzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BH4NZrhg=abqc=P9Uzf+t4Davn4SP9i3QktS4Q05WtzA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 07, 2020 at 03:15:17PM +0200, Tomasz Figa wrote:
> On Fri, Sep 4, 2020 at 4:06 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Sep 4, 2020 at 4:48 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > On Wed, 2020-09-02 at 16:44 +0300, Andy Shevchenko wrote:
> > > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:

...

> > > > > +   struct i2c_client *client = to_i2c_client(dev);
> > > > > +   struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > >
> > > >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > >
> > > > Same for the rest similar cases.
> > >
> > > We've discussed the issue in DW9768 V2.
> > >
> > > For V4L2 sub-device drivers, dev_get_drvdata() shouldn't be used
> > > directly.
> > >
> > > More details please check the Google Issue:
> > > https://partnerissuetracker.corp.google.com/issues/147957975
> >
> > This is not a public link. Can you remind me what was the issue?
> >
> 
> v4l2-subdev framework uses dev drvdata for its own purposes. However,
> that problem was about the driver setting its own drvdata and having
> it overridden by the framework. There is nothing wrong in using
> dev_get_drvdata(), assuming the correct type is known and here it's
> guaranteed to be v4l2_subdev for the v4l2-subdev framework.
> 
> In fact i2c_get_clientdata() [1] is just a wrapper that calls
> dev_get_drvdata(&client->dev).

And funny future would be that if we don't do this now we will have plenty of
janitors to DoS attack us with the fix in the future.

> [1] https://elixir.bootlin.com/linux/v5.9-rc3/source/include/linux/i2c.h#L351

-- 
With Best Regards,
Andy Shevchenko


