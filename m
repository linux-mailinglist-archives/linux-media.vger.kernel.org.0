Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DC73E85A5
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 23:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbhHJVts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 17:49:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:51787 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234830AbhHJVtr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 17:49:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278748525"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="278748525"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 14:49:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="503275417"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 14:49:21 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id A0E93202B4;
        Wed, 11 Aug 2021 00:49:18 +0300 (EEST)
Date:   Wed, 11 Aug 2021 00:49:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in
 ov8865
Message-ID: <20210810214918.GL3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-5-djrscally@gmail.com>
 <20210810133426.GB3@paasikivi.fi.intel.com>
 <711e4f6d-f539-0a69-fe78-d5e32eecb673@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <711e4f6d-f539-0a69-fe78-d5e32eecb673@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 10:37:35PM +0100, Daniel Scally wrote:
> Hi Sakari - thanks for all the comments

You're welcome!

Nice patches btw.

> 
> On 10/08/2021 14:34, Sakari Ailus wrote:
> > Hi Daniel,
> >
> > Thanks for the set.
> >
> > On Mon, Aug 09, 2021 at 11:58:37PM +0100, Daniel Scally wrote:
> >> The ov8865 driver as written expects a 24MHz input clock, but the sensor
> >> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
> >> Add a set of PLL configurations to the driver to support that rate too.
> >> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
> >> during probe and set that rate if one is found.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >> Changes in v2:
> >>
> >> 	- Added an enum defining the possible frequency rates to index the
> >> 	  array (Andy)
> >>
> >>  drivers/media/i2c/ov8865.c | 164 +++++++++++++++++++++++++++----------
> >>  1 file changed, 121 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> >> index fe700787bfb9..1382b16d1a09 100644
> >> --- a/drivers/media/i2c/ov8865.c
> >> +++ b/drivers/media/i2c/ov8865.c
> >> @@ -21,10 +21,6 @@
> >>  #include <media/v4l2-image-sizes.h>
> >>  #include <media/v4l2-mediabus.h>
> >>  
> >> -/* Clock rate */
> >> -
> >> -#define OV8865_EXTCLK_RATE			24000000
> >> -
> >>  /* Register definitions */
> >>  
> >>  /* System */
> >> @@ -567,6 +563,19 @@ struct ov8865_sclk_config {
> >>  	unsigned int sclk_div;
> >>  };
> >>  
> >> +/* Clock rate */
> >> +
> >> +enum extclk_rate {
> >> +	OV8865_19_2_MHZ,
> >> +	OV8865_24_MHZ,
> >> +	OV8865_NUM_SUPPORTED_RATES,
> >> +};
> >> +
> >> +static const unsigned long supported_extclk_rates[] = {
> >> +	[OV8865_19_2_MHZ] = 19200000,
> >> +	[OV8865_24_MHZ] = 24000000,
> >> +};
> >> +
> >>  /*
> >>   * General formulas for (array-centered) mode calculation:
> >>   * - photo_array_width = 3296
> >> @@ -665,6 +674,9 @@ struct ov8865_sensor {
> >>  	struct regulator *avdd;
> >>  	struct regulator *dvdd;
> >>  	struct regulator *dovdd;
> >> +
> >> +	unsigned long extclk_rate;
> >> +	enum extclk_rate extclk_rate_idx;
> >>  	struct clk *extclk;
> >>  
> >>  	struct v4l2_fwnode_endpoint endpoint;
> >> @@ -680,49 +692,83 @@ struct ov8865_sensor {
> >>  /* Static definitions */
> >>  
> >>  /*
> >> - * EXTCLK = 24 MHz
> >>   * PHY_SCLK = 720 MHz
> >>   * MIPI_PCLK = 90 MHz
> >>   */
> >> -static const struct ov8865_pll1_config ov8865_pll1_config_native = {
> >> -	.pll_pre_div_half	= 1,
> >> -	.pll_pre_div		= 0,
> >> -	.pll_mul		= 30,
> >> -	.m_div			= 1,
> >> -	.mipi_div		= 3,
> >> -	.pclk_div		= 1,
> >> -	.sys_pre_div		= 1,
> >> -	.sys_div		= 2,
> >> +
> >> +static const struct ov8865_pll1_config ov8865_pll1_configs_native[] = {
> >> +	{ /* 19.2 MHz input clock */
> >> +		.pll_pre_div_half	= 1,
> >> +		.pll_pre_div		= 2,
> >> +		.pll_mul		= 75,
> >> +		.m_div			= 1,
> >> +		.mipi_div		= 3,
> >> +		.pclk_div		= 1,
> >> +		.sys_pre_div		= 1,
> >> +		.sys_div		= 2,
> >> +	},
> >> +	{ /* 24MHz input clock */
> >> +		.pll_pre_div_half	= 1,
> >> +		.pll_pre_div		= 0,
> >> +		.pll_mul		= 30,
> >> +		.m_div			= 1,
> >> +		.mipi_div		= 3,
> >> +		.pclk_div		= 1,
> >> +		.sys_pre_div		= 1,
> >> +		.sys_div		= 2,
> >> +	},
> > Could you instead add a struct specific to the clock frequency with
> > pointers to these? See e.g. the ov8856 driver how this could otherwise end
> > up...
> 
> 
> You mean something like
> 
> 
> static struct ov8865_pll_configs_19_2_mhz {
> 
>     .pll1_config_native = &ov8865_pll1_config_native,
> 
>     ...
> 
> };
> 
> 
> 
> static struct ov8865_pll_configs_24_mhz {
> 
>     .pll1_config_native = &ov8865_pll1_config_native,
> 
>     ...
> 
> };
> 
> 
> or am I misunderstanding?

Yes, please --- ov8865_pll1_config_native above is thus the PLL
configuration for the 24 MHz clock.

-- 
Sakari Ailus
