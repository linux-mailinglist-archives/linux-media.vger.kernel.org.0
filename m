Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83368197DAA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 15:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgC3N5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 09:57:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:55285 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgC3N5x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 09:57:53 -0400
IronPort-SDR: XRBD/VPW9I8Kr0ERlEONgxd7Wux+StSnBj24Nf54OS5n5tGmKQBoHqEsDX2u3yIJE9lUu3ZZ4Z
 YCCpdQ31MVkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 06:57:52 -0700
IronPort-SDR: gpBtDX8eCH7FPm/oTANkhiBgT7C3LcYmTxj4V4fYHVRnHSmLlXU2EfOXWkjBLcFEkqq3cZ3hvj
 sR+HqgJrtWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; 
   d="scan'208";a="449803069"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2020 06:57:49 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jIuvH-00EDZT-4T; Mon, 30 Mar 2020 16:57:51 +0300
Date:   Mon, 30 Mar 2020 16:57:51 +0300
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
Message-ID: <20200330135751.GQ1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330123634.363-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 30, 2020 at 08:36:34PM +0800, Dongchun Zhu wrote:
> This patch adds a V4L2 sub-device driver for DW9768 voice coil moter,
> providing control to set the desired focus via I2C serial interface.

...

> +static const struct dev_pm_ops dw9768_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> +};
> +
> +static struct i2c_driver dw9768_i2c_driver = {
> +	.driver = {
> +		.name = DW9768_NAME,

> +		.pm = IS_ENABLED(CONFIG_PM) ? &dw9768_pm_ops : NULL,

What is this conditional for?

> +		.of_match_table = dw9768_of_table,
> +	},
> +	.probe_new  = dw9768_probe,
> +	.remove = dw9768_remove,
> +};

> +

Extra blank line.

> +module_i2c_driver(dw9768_i2c_driver);

-- 
With Best Regards,
Andy Shevchenko


