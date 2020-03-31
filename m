Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B94F19933D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 12:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbgCaKO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 06:14:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:60712 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727655AbgCaKO5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 06:14:57 -0400
IronPort-SDR: ZGvaBWTSaOaXmRdRjOh2pvpPV3IBGw7B8GFCaIDrr7xwCsABQC79qbopNrMbVwYyZTz9WCqlEE
 HyY9T4mx5F+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 03:14:57 -0700
IronPort-SDR: xPCffzS9PbMWyCOuBM5F+UBfUSZP3WxETeayPQ8cYvYjCbEKXZqAJcpvXtk/wk5/CqL85my64e
 SlhEiGKl3dZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="241873299"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2020 03:14:54 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jJDv6-00ESFD-3H; Tue, 31 Mar 2020 13:14:56 +0300
Date:   Tue, 31 Mar 2020 13:14:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V4, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200331101456.GG1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-3-dongchun.zhu@mediatek.com>
 <20200330135751.GQ1922688@smile.fi.intel.com>
 <1585620980.5781.80.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585620980.5781.80.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 31, 2020 at 10:16:20AM +0800, Dongchun Zhu wrote:
> On Mon, 2020-03-30 at 16:57 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 30, 2020 at 08:36:34PM +0800, Dongchun Zhu wrote:
> > > This patch adds a V4L2 sub-device driver for DW9768 voice coil moter,
> > > providing control to set the desired focus via I2C serial interface.
> > 
> > ...
> > 
> > > +static const struct dev_pm_ops dw9768_pm_ops = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > +				pm_runtime_force_resume)
> > > +	SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> > > +};
> > > +
> > > +static struct i2c_driver dw9768_i2c_driver = {
> > > +	.driver = {
> > > +		.name = DW9768_NAME,
> > 
> > > +		.pm = IS_ENABLED(CONFIG_PM) ? &dw9768_pm_ops : NULL,
> > 
> > What is this conditional for?
> > 
> 
> For the dw9768_pm_ops, here my idea is to use an IS_ENABLED() check to
> avoid defining the structure when CONFIG_PM is not set.

Have you looked at the implementation of SET_SYSTEM_SLEEP_OPS() and another one?

Have you tried to actually compile with !CONFIG_PM? In your case the warning
should be issued.

-- 
With Best Regards,
Andy Shevchenko


