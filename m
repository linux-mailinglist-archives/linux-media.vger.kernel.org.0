Return-Path: <linux-media+bounces-28501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B60A693B0
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53CB319C4ACB
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2161957FF;
	Wed, 19 Mar 2025 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ok2ngBAW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E20194A44
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742397392; cv=none; b=tgk23zXPppsUE7DQuAAMcK8Eu9ph10ItKCrz44avbUsFcfLg+jASYQNy36Ulr/B+hbmaiyjS/E4LQOd373Ckfew/kg9i89Yty9QqXkVgDYHjH38p1yphy3SPiIu5pHEpwTw7e9OWkuGmzzBUbki2ZwiF8mEHNGsPnJTHRfeSicE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742397392; c=relaxed/simple;
	bh=m9TL1gLKTg/exFf7cV9NdWXE6O+XnMZ+FtW1WHKDqk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZnMCHqpdoO1e15L3diOzWtR9kIeG13I8CTnphO4N/ealTjZJ47m1/8LjsQJoOcC2FCQuiPPfONtlLQbVx0TCqsSmZk2YuEuE6hyy1+Za2KHCYWw3CE6YZWzsZhitZ83/tsh+B8h/NaQsdD5cTvWOgmDsgQTojjggqMTSrRH6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ok2ngBAW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742397391; x=1773933391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m9TL1gLKTg/exFf7cV9NdWXE6O+XnMZ+FtW1WHKDqk8=;
  b=Ok2ngBAWL2tFGdqVauSOcfVNZv/wzph+xvS8iIJn8w+mpMfPBYQ5fV6z
   4viKd3RmGpXm73f9ZhDuVJOuuLYvR6J4L98N2oyDP5kMi08Kicl5jF5tJ
   X2jeucfndLhAWPKHK/64RX3C10AX2uoYRfjFmYIIyf9ZTxvkgRuS7gZhl
   hQPsttWfkQSoOblAa3hJRYFxrZK9dMrdEGc/sINIH0SV+kAELYCxcEudl
   J+g16APdge8X4hrzAP4U3LOTfwx/3IOVb+By0BfqEARMq+7CvmFNRflUS
   VNRLFEjzJK6SRh7/zf4oGg8Kw/XpwhMWHotd1Wzax0FLZGI0INXNAAlwC
   w==;
X-CSE-ConnectionGUID: lkTcjDdlRbWdqO2udFOD1g==
X-CSE-MsgGUID: mUJnjnBQSTelrsQmKv8yjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43726484"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43726484"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 08:16:30 -0700
X-CSE-ConnectionGUID: q28IKUWvREqbO3iB5JIbaQ==
X-CSE-MsgGUID: HYY/uzzyRmaTPTa1sQyB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123402940"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 08:16:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7698C11F998;
	Wed, 19 Mar 2025 17:16:25 +0200 (EET)
Date: Wed, 19 Mar 2025 15:16:25 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 1/1] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <Z9rfyfHhBXydJGo6@kekkonen.localdomain>
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250314101125.9853-2-hdegoede@redhat.com>
 <Z9QlNEP8aL1XdlAv@kekkonen.localdomain>
 <20d55eba-d802-46c1-a08e-d836eea2717f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20d55eba-d802-46c1-a08e-d836eea2717f@redhat.com>

Hi Hans,

On Wed, Mar 19, 2025 at 03:59:31PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 14-Mar-25 1:46 PM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the update.
> > 
> > On Fri, Mar 14, 2025 at 11:11:25AM +0100, Hans de Goede wrote:
> >> From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> >>
> >> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
> >> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
> >> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
> >>
> >> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
> >> driver and the libcamera software ISP code.
> >>
> >> Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com>
> >> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> >> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> <snip>
> 
> >> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> >> new file mode 100644
> >> index 000000000000..5626aa2fe62c
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ov02c10.c
> >> @@ -0,0 +1,1012 @@
> 
> <snip>
> 
> >> +static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
> > 
> > Could you use struct cci_reg_sequence for this?
> > 
> >> +	{0x0301, 0x08},
> > 
> > { CCI_REG8(0x0301), 0x08 },
> > 
> > etc.
> > 
> > That would also enable using human-readable names in this list.
> 
> TBH I would rather not, adding the CCI_REGx everywhere will make
> it harder to keep the out of tree code in sync with this, using
> raw struct reg_sequence combined with regmap_multi_reg_write()
> is sort of the norm for drivers converted to the CCI helpers.
> 
> Also while using symbolic register names (defines) greatly
> improves the readability of other code accessing the registers,
> I find it unhelpful for these large just send a bunch of
> register values to the sensor cases, especially since for many
> of the addresses we've no clue what we're sending / what 
> the register does.

That's true for the undocumented ones (and this being an OV sensor, there
are many) but for the rest it's helpful.

I presume there's no need for updating downstream drivers after we have one
in upstream?

> 
> > 
> >> +	{0x0303, 0x06},
> >> +	{0x0304, 0x01},
> >> +	{0x0305, 0xe0},
> 
> <snip>
> 
> >> +};
> >> +
> >> +static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
> >> +	{0x301b, 0xd2},
> >> +	{0x3027, 0xe1},
> >> +	{0x380c, 0x08},
> >> +	{0x380d, 0xe8},
> >> +	{0x380e, 0x04},
> >> +	{0x380f, 0x8c},
> >> +	{0x394e, 0x0b},
> >> +	{0x4800, 0x24},
> >> +	{0x5000, 0xf5},
> >> +	/* plls */
> >> +	{0x0303, 0x05},
> >> +	{0x0305, 0x90},
> >> +	{0x0316, 0x90},
> >> +	{0x3016, 0x12},
> >> +};
> >> +
> >> +static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
> >> +	{0x301b, 0xf0},
> >> +	{0x3027, 0xf1},
> >> +	{0x380c, 0x04},
> >> +	{0x380d, 0x74},
> >> +	{0x380e, 0x09},
> >> +	{0x380f, 0x18},
> >> +	{0x394e, 0x0a},
> >> +	{0x4041, 0x20},
> >> +	{0x4884, 0x04},
> >> +	{0x4800, 0x64},
> >> +	{0x4d00, 0x03},
> >> +	{0x4d01, 0xd8},
> >> +	{0x4d02, 0xba},
> >> +	{0x4d03, 0xa0},
> >> +	{0x4d04, 0xb7},
> >> +	{0x4d05, 0x34},
> >> +	{0x4d0d, 0x00},
> >> +	{0x5000, 0xfd},
> >> +	{0x481f, 0x30},
> > 
> > It's surprising to have more registers when the number of lanes is 2. I
> > guess for 1 lane case it's using defaults?
> 
> I guess so. At your request I split the registers which were
> different for the 1 / 2 lane cases into 2 separate registerlists
> and some register writes where only in the long 2 lane register list
> of the previous version.

Ok. Adding further modes later on will require addressing this.

> 
> >> +static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)
> >> +{
> >> +	int ret = 0;
> >> +
> >> +	if (!pattern)
> >> +		return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> >> +				       BIT(7), 0, NULL);
> >> +
> >> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> >> +			0x03, pattern - 1, &ret);
> >> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> >> +			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
> > 
> > I'd do here:
> > 
> > 	return cci_update_bits(...);
> 
> Since we are relying on the error preserving / propagating
> behavior of the CCI helpers here that feels weird / inconsistent,
> I would expect either:
> 
> 	ret = cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> 			      0x03, pattern - 1, NULL);
> 	if (ret)
> 		return ret;
> 
> 	return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> 			       BIT(7), OV02C10_TEST_PATTERN_ENABLE, NULL);
> }
> 
> or:
> 
> 	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> 			0x03, pattern - 1, &ret);
> 	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> 			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
> 	return ret;
> }
> 
> not a mix of the 2, with my preference going to the latter.

Works for me, too, although I expect someone, will come some day and submit
a cleanup patch for this. :-)

I'm ok with v10, I guess further cleanup can be done if / when more
functionality is added.

-- 
Regards,

Sakari Ailus

