Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02815403493
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 08:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347880AbhIHGy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 02:54:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:54661 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347936AbhIHGyH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Sep 2021 02:54:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="305961202"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; 
   d="scan'208";a="305961202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 23:52:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; 
   d="scan'208";a="648370902"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 23:52:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9B91A2036B;
        Wed,  8 Sep 2021 09:52:48 +0300 (EEST)
Date:   Wed, 8 Sep 2021 09:52:48 +0300
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
Message-ID: <20210908065248.GF3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-5-djrscally@gmail.com>
 <20210810133426.GB3@paasikivi.fi.intel.com>
 <711e4f6d-f539-0a69-fe78-d5e32eecb673@gmail.com>
 <20210810214918.GL3@paasikivi.fi.intel.com>
 <ad1de4f2-dd07-9214-6e28-98cc421377b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad1de4f2-dd07-9214-6e28-98cc421377b6@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Sep 07, 2021 at 11:44:12PM +0100, Daniel Scally wrote:
> Hi Sakari
> 
> On 10/08/2021 22:49, Sakari Ailus wrote:
> > On Tue, Aug 10, 2021 at 10:37:35PM +0100, Daniel Scally wrote:
> >> Hi Sakari - thanks for all the comments
> > You're welcome!
> >
> > Nice patches btw.
> 
> 
> Thanks!
> 
> >
> >> On 10/08/2021 14:34, Sakari Ailus wrote:
> >>> Hi Daniel,
> >>>
> >>> Thanks for the set.
> >>>
> >>> On Mon, Aug 09, 2021 at 11:58:37PM +0100, Daniel Scally wrote:
> >>>> The ov8865 driver as written expects a 24MHz input clock, but the sensor
> >>>> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
> >>>> Add a set of PLL configurations to the driver to support that rate too.
> >>>> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
> >>>> during probe and set that rate if one is found.
> >>>>
> >>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >>>> ---
> >>>> Changes in v2:
> >>>>
> >>>> 	- Added an enum defining the possible frequency rates to index the
> >>>> 	  array (Andy)
> >>>>
> >>>>  drivers/media/i2c/ov8865.c | 164 +++++++++++++++++++++++++++----------
> >>>>  1 file changed, 121 insertions(+), 43 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> >>>> index fe700787bfb9..1382b16d1a09 100644
> >>>> --- a/drivers/media/i2c/ov8865.c
> >>>> +++ b/drivers/media/i2c/ov8865.c
> >>>> @@ -21,10 +21,6 @@
> >>>>  #include <media/v4l2-image-sizes.h>
> >>>>  #include <media/v4l2-mediabus.h>
> >>>>  
> >>>> -/* Clock rate */
> >>>> -
> >>>> -#define OV8865_EXTCLK_RATE			24000000
> >>>> -
> >>>>  /* Register definitions */
> >>>>  
> >>>>  /* System */
> >>>> @@ -567,6 +563,19 @@ struct ov8865_sclk_config {
> >>>>  	unsigned int sclk_div;
> >>>>  };
> >>>>  
> >>>> +/* Clock rate */
> >>>> +
> >>>> +enum extclk_rate {
> >>>> +	OV8865_19_2_MHZ,
> >>>> +	OV8865_24_MHZ,
> >>>> +	OV8865_NUM_SUPPORTED_RATES,
> >>>> +};
> >>>> +
> >>>> +static const unsigned long supported_extclk_rates[] = {
> >>>> +	[OV8865_19_2_MHZ] = 19200000,
> >>>> +	[OV8865_24_MHZ] = 24000000,
> >>>> +};
> >>>> +
> >>>>  /*
> >>>>   * General formulas for (array-centered) mode calculation:
> >>>>   * - photo_array_width = 3296
> >>>> @@ -665,6 +674,9 @@ struct ov8865_sensor {
> >>>>  	struct regulator *avdd;
> >>>>  	struct regulator *dvdd;
> >>>>  	struct regulator *dovdd;
> >>>> +
> >>>> +	unsigned long extclk_rate;
> >>>> +	enum extclk_rate extclk_rate_idx;
> >>>>  	struct clk *extclk;
> >>>>  
> >>>>  	struct v4l2_fwnode_endpoint endpoint;
> >>>> @@ -680,49 +692,83 @@ struct ov8865_sensor {
> >>>>  /* Static definitions */
> >>>>  
> >>>>  /*
> >>>> - * EXTCLK = 24 MHz
> >>>>   * PHY_SCLK = 720 MHz
> >>>>   * MIPI_PCLK = 90 MHz
> >>>>   */
> >>>> -static const struct ov8865_pll1_config ov8865_pll1_config_native = {
> >>>> -	.pll_pre_div_half	= 1,
> >>>> -	.pll_pre_div		= 0,
> >>>> -	.pll_mul		= 30,
> >>>> -	.m_div			= 1,
> >>>> -	.mipi_div		= 3,
> >>>> -	.pclk_div		= 1,
> >>>> -	.sys_pre_div		= 1,
> >>>> -	.sys_div		= 2,
> >>>> +
> >>>> +static const struct ov8865_pll1_config ov8865_pll1_configs_native[] = {
> >>>> +	{ /* 19.2 MHz input clock */
> >>>> +		.pll_pre_div_half	= 1,
> >>>> +		.pll_pre_div		= 2,
> >>>> +		.pll_mul		= 75,
> >>>> +		.m_div			= 1,
> >>>> +		.mipi_div		= 3,
> >>>> +		.pclk_div		= 1,
> >>>> +		.sys_pre_div		= 1,
> >>>> +		.sys_div		= 2,
> >>>> +	},
> >>>> +	{ /* 24MHz input clock */
> >>>> +		.pll_pre_div_half	= 1,
> >>>> +		.pll_pre_div		= 0,
> >>>> +		.pll_mul		= 30,
> >>>> +		.m_div			= 1,
> >>>> +		.mipi_div		= 3,
> >>>> +		.pclk_div		= 1,
> >>>> +		.sys_pre_div		= 1,
> >>>> +		.sys_div		= 2,
> >>>> +	},
> >>> Could you instead add a struct specific to the clock frequency with
> >>> pointers to these? See e.g. the ov8856 driver how this could otherwise end
> >>> up...I thin
> >>
> >> You mean something like
> >>
> >>
> >> static struct ov8865_pll_configs_19_2_mhz {
> >>
> >>     .pll1_config_native = &ov8865_pll1_config_native,
> >>
> >>     ...
> >>
> >> };
> >>
> >>
> >>
> >> static struct ov8865_pll_configs_24_mhz {
> >>
> >>     .pll1_config_native = &ov8865_pll1_config_native,
> >>
> >>     ...
> >>
> >> };
> >>
> >>
> >> or am I misunderstanding?
> > Yes, please --- ov8865_pll1_config_native above is thus the PLL
> > configuration for the 24 MHz clock.
> 
> I'm not sure about this actually. There's two versions of
> ov8865_pll2_config, native and binning, so it becomes something like this:
> 
> 
> struct ov8865_pll_configs {
>     struct ov8865_pll1_config *pll1_config;
>     struct ov8865_pll2_config *pll2_config_native;
>     struct ov8865_pll2_config *pll2_config_binning;
> };
> 
> static struct ov8865_pll_configs ov8865_pll_configs_19_2mhz = {
>     .pll1_config = &ov8865_pll1_config_native_19_2mhz,
>     .pll2_config_native = &ov8865_pll2_config_native_19_2mhz,
>     .pll2_config_binning = &ov8865_pll2_config_binning_19_2mhz,
> };
> 
> static struct ov8865_pll_configs ov8865_pll_configs_24mhz = {
>     .pll1_config = &ov8865_pll1_config_native_24mhz,
>     .pll2_config_native = &ov8865_pll2_config_native_24mhz,
>     .pll2_config_binning = &ov8865_pll2_config_binning_24mhz,
> };
> 
> 
> Now because a mode might use either the native or binning version of the
> pll2 configs, currently they're actually against the struct for a
> particular mode like so:
> 
> 
> struct ov8865_mode ov8865_modes[] = {
> 
>     {
> 
>         <snip>
> 
>         .pll1_config            = &ov8865_pll1_config_native,
>         .pll2_config            = &ov8865_pll2_config_binning,
>         .sclk_config            = &ov8865_sclk_config_native,
> 
>     }
> 
> };
> 
> 
> The problem I'm having is that I can't really see a clean way to store
> against the _mode_ whether it should access .pll2_config_native or
> .pll2_config_binning, from the new struct ov8865_pll_configs. Do you
> have any ideas about a way to do that?

Ah, yes. I agree, that's where you'll need some code to pick the right one.
So you could use a function pointer in the struct and give it the necessary
arguments. I don't think it'd be overkill, things tend to develop over
time. See e.g. the ov8856 driver as a (warning) example.

-- 
Kind regards,

Sakari Ailus
