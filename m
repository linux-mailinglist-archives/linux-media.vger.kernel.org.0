Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4632B1813F6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 10:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgCKJFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 05:05:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:10325 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbgCKJFy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 05:05:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 02:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="234652853"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 11 Mar 2020 02:05:49 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jBxJG-008h6u-OT; Wed, 11 Mar 2020 11:05:50 +0200
Date:   Wed, 11 Mar 2020 11:05:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
Message-ID: <20200311090550.GB1922688@smile.fi.intel.com>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org>
 <20200310142652.GK1922688@smile.fi.intel.com>
 <CAG3jFyu5S1H=r6pV92tc_a2LoCUnhb0mDbOegP2BCO8a5C1nVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyu5S1H=r6pV92tc_a2LoCUnhb0mDbOegP2BCO8a5C1nVg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 10, 2020 at 04:55:20PM +0100, Robert Foss wrote:
> On Tue, 10 Mar 2020 at 15:26, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Mar 10, 2020 at 02:46:02PM +0100, Robert Foss wrote:

...

> > > +     ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> > > +     if (IS_ERR(ov8856->xvclk)) {
> > > +             dev_err(&client->dev, "failed to get xvclk\n");
> > > +             return -EINVAL;
> > > +     }
> >
> > Previously it worked without clock provider, now you make a dependency.
> >
> > This won't work.
> 
> So the ideal behavior would be to only use the xclk if it is provided?

Yes, make it optional.

-- 
With Best Regards,
Andy Shevchenko


