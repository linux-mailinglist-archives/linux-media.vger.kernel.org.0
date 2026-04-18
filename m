Return-Path: <linux-media+bounces-59059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GBxGuIv42l9DAEAu9opvQ
	(envelope-from <linux-media+bounces-59059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:16:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B919B42041D
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57252303C4D3
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 07:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C9234F48E;
	Sat, 18 Apr 2026 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oz/Uli2q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7E629346F;
	Sat, 18 Apr 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776496596; cv=none; b=HS0VfXTSonqk/2ufZCLpjK0zBng4m3dS9gKbZQGS6xmE05V/ub8MisOCrWnIE9TFI2PTYp/nadNSHhBV7BjbpfZGK7DT4wwjRcZpKIOH4f5NZNSUmPTHjJhYWlcYGpioJ+SPhrbCK5LaVCQYqnWiF/yg6JwhOXaaTeU9llOOU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776496596; c=relaxed/simple;
	bh=ALHCHeMuCMs3rVQzgKRzK9IDH6nv4mHSQI/0taKUwpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWgxEcqkQSYPYki0FAeAj1T0mswB18Apv9FDN+IZUkZzJvKd7p4y/gy+NPsUugtU0HOd18v/yQoHU6YIu7Qvg2xEix65rO1CEK2nXru2hOxRM69Ux/wST7adLqasIEnMGQfdnPpjGn0oWmaK3AL+i7taGj9GVZjrACd6eIQJQqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oz/Uli2q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776496595; x=1808032595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ALHCHeMuCMs3rVQzgKRzK9IDH6nv4mHSQI/0taKUwpY=;
  b=Oz/Uli2qnQRI8KRBe35h+wZs83ZsL5wUO9P0DMFvNR5/5gkSSyU4mNNS
   bwrdiHgv3oGZLRVA70mAJvFOHtMtzGQ6DxH96eZOnwBhVj/pYLwhMitA4
   +ymNpXrMQ2K/0m8gszhl6VxzoEd7H3oOonDBIO3KlmaXAyGikug+tWLTt
   vOuWkFsKu+PEENkwktM2AWj3mdZ84aeGswsACbvTbeyiAo0C3Qwh75qFO
   Seqy8fjSQMsIhCKO8M0J29C+wo2fp0bDgtsyxkh/COo8YUqT7wxSkuZrP
   tJvSOyzVm7ByV9q1IpoGIqEfOj2xyE9Hjv0wZ/U/h5hpXuDJQF4Ua43/v
   g==;
X-CSE-ConnectionGUID: gSSvFbg8QQCqeCtGWkc3Og==
X-CSE-MsgGUID: CWqcxXTaQyy60wHu2jmKeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77476891"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="77476891"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:16:34 -0700
X-CSE-ConnectionGUID: PKkhRm0zT1C23B2bgrPohQ==
X-CSE-MsgGUID: hzmEMxuKSiCevVNejaJCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="236213563"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:16:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EFF67121CD9;
	Sat, 18 Apr 2026 10:16:27 +0300 (EEST)
Date: Sat, 18 Apr 2026 10:16:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org,
	lee@kernel.org, platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	antti.laakso@linux.intel.com
Subject: Re: [PATCH v3 3/5] platform/x86: int3472: tps68470: add board data
 for Dell Latitude 5285
Message-ID: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-4-tchatard@gmail.com>
 <5aa199d5-251d-4c98-a6ac-5038301a1644@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aa199d5-251d-4c98-a6ac-5038301a1644@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59059-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: B919B42041D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Thierry,

On Fri, Apr 17, 2026 at 08:54:44PM +0200, Hans de Goede wrote:
> Hi,
> 
> First of all, since I forget to mention that in my previous 2 reviews
> many thanks for your work on this!
> 
> On 17-Apr-26 18:32, Thierry Chatard wrote:
> > The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
> > PMIC/clock/GPIO hub:
> > 
> >   Front: OV5670 (ACPI INT3479) on I2C4
> >   Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind TPS68470
> >          S_I2C port (controlled by reg 0x43 S_I2C_CTL)
> > 
> > GPIO mapping (TPS68470):
> >   INT3479 (OV5670): GPIO3 = reset, GPIO4 = powerdown (both active-low)
> >   INT3477 (OV8858): GPIO9 = s_resetn, GPIO7 = s_enable (both active-low)
> >     GPIO9 and GPIO7 are the TPS68470 secondary-port GPIOs (SGPO reg 0x22
> >     bits 2 and 0), not regular GPDO outputs.
> > 
> > Regulator mapping:
> >   CORE  -> dvdd  / INT3477
> >   ANA   -> avdd  / INT3477
> >   VIO   -> dovdd / INT3477
> >   VSIO  -> avdd  / INT3479 and vsio / INT3477 (always_on: keeps S_I2C_CTL
> >            non-zero from boot so OV8858 is reachable on I2C2 at any time)
> >   AUX1  -> dvdd  / INT3479
> >   AUX2  -> dovdd / INT3479
> 
> This is wrong, VIO is always on if you look at:
> 
> drivers/regulator/tps68470-regulator.c
> 
> you will see that enable_reg and enable_mask for that regulator
> are both set to 0, because there is no enable reg, as it is always
> on at the hardware level.
> 
> VIO is used for the PMIC's own I2C upstream connection I believe.
> 
> So the right mapping for the ov8858/INT3477 should be:
> 
> CORE  -> dvdd  / INT3477
> ANA   -> avdd  / INT3477
> VSIO  -> dovdd / INT3477
> 
> avoiding the need to add new "vsio" regulator support
> to the ov8858 driver.
> 
> For the OV5670/INT3477 using VSIO for avdd also sounds
> wrong. The publicly available 2 page marketing datasheet
> of the ov5670 says the following about voltages:
> 
> Core:   1.2V nominal
> analog: 2.8V nominal
> IO:     1.8V nominal
> 
> You configure aux1 at 1.2V and aux2 at 1.8V volt and
> above you mention that the OV5670 is not behind the I2C
> pass through.
> 
> So to me that suggests that the mappings for the OV5670/INT3477
> should be:
> 
> AUX1  -> dvdd  / INT3479
> AUX2  -> dovdd / INT3479
> 
> as they already were, but the VSIO -> avdd mapping is wrong
> since VSIO is 1.8V and avdd should be 2.8V, it does no harm
> since it will just enable VSIO / the passthrough. But it seems
> that instead there is some fixed 2.8V avdd source for the OV5670
> and we don't need to have a regulator at all.
> 
> So my suggestion would be to use the following mappings
> (combined):
> 
> CORE  -> dvdd  / INT3477
> ANA   -> avdd  / INT3477
> VSIO  -> dovdd / INT3477
> AUX1  -> dvdd  / INT3479
> AUX2  -> dovdd / INT3479
> 
> and drop the double mapping of VSIO.
> 
> If that does not work because the OV5670 turns out to be behind
> the i2c-passthrough too then indeed it would be best to as a hack
> map avdd (which the driver will try to get a regulator for and
> enable) from vsio. If that is necessary please add a comment about
> this hack.
> 
> > Marking VSIO always_on ensures the TPS68470 S_I2C passthrough is active
> > from the moment the PMIC driver probes, eliminating a timing dependency
> > between TPS68470 and ov8858 probe ordering.
> 
> This also seems wrong, vsio should not be marked as always on.
> 
> Maybe the ov8865 driver needs a bigger delay after the regulator
> enable call there ?
> 
> Anyways first please try the suggested updating mapping and assuming
> that works then as a separate step maybe try dropping the always-on
> from vsio.
> 
> > A static clock consumer list is provided for both sensors (INT3477 and
> > INT3479) to work around the broken ACPI _DEP on INT3479 described in the
> > previous patch.
> 
> Ack, this is good.
> 
> > 
> > Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> > ---
> >  .../x86/intel/int3472/tps68470_board_data.c   | 176 ++++++++++++++++++
> >  1 file changed, 176 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > index 71357a036..c1bf13faf 100644
> > --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > @@ -287,6 +287,175 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
> >  	},
> >  };
> >  
> > +/* Settings for Dell Latitude 5285 2-in-1 */
> > +
> > +/*
> > + * The BIOS leaves GNVS field C0TP at zero, which causes INT3479's _DEP to
> > + * resolve to PCI0 instead of the INT3472 device.  Provide a static clock
> > + * consumer list so probe registers MCLK lookups for both sensors regardless
> > + * of the broken _DEP traversal.
> > + */
> > +static const struct tps68470_clk_consumer dell_5285_clk_consumers[] = {
> > +	{ .consumer_dev_name = "i2c-INT3477:00" },	/* OV8858 rear camera  */
> > +	{ .consumer_dev_name = "i2c-INT3479:00" },	/* OV5670 front camera */
> > +};
> > +
> > +static struct regulator_consumer_supply dell_5285_int3477_ana_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("avdd", "i2c-INT3477:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply dell_5285_int3477_core_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("dvdd", "i2c-INT3477:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply dell_5285_int3477_vio_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply dell_5285_int3479_vsio_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
> > +	/* S_I2C_CTL: must be enabled for OV8858 I2C daisy-chain access */
> > +	REGULATOR_SUPPLY("vsio", "i2c-INT3477:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply dell_5285_int3479_aux1_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply dell_5285_int3479_aux2_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
> > +};
> > +
> > +static const struct regulator_init_data dell_5285_tps68470_core_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1200000,
> > +		.max_uV = 1200000,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_core_consumer_supplies),
> > +	.consumer_supplies = dell_5285_int3477_core_consumer_supplies,
> > +};
> > +
> > +static const struct regulator_init_data dell_5285_tps68470_ana_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 2815200,
> > +		.max_uV = 2815200,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_ana_consumer_supplies),
> > +	.consumer_supplies = dell_5285_int3477_ana_consumer_supplies,
> > +};
> > +
> > +static const struct regulator_init_data dell_5285_tps68470_vcm_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 2815200,
> > +		.max_uV = 2815200,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = 0,
> > +	.consumer_supplies = NULL,
> > +};
> > +
> > +static const struct regulator_init_data dell_5285_tps68470_vio_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1800600,
> > +		.max_uV = 1800600,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vio_consumer_supplies),
> > +	.consumer_supplies = dell_5285_int3477_vio_consumer_supplies,
> > +};
> 
> 
> when I2C passthrough is used vio and vsio MUST have the exact same voltage,
> which you do correctly here. Also this regulator is always in the hardware
> and as such does not support REGULATOR_CHANGE_STATUS.
> 
> And VIO should never have direct consumers, these all go through VSIO.

As far as I understand, VIO can be used freely if I²C daisy chain is not
used, but usually it appears to be, whether it's needed or not.

Interestingly, vio isn't set as always_on for some systems using daisy
chain, including MSI Prestige AI+ EVO (also see my other comment).

> 
> Basically this should look identical to this:
> 
> /* Ensure the always-on VIO regulator has the same voltage as VSIO */
> static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
>         .constraints = {
>                 .min_uV = 1800600,
>                 .max_uV = 1800600,
>                 .apply_uV = true,
>                 .always_on = true,
>         },
> };
> 
> I think it would be best to start with an extra renaming the existing
> surface_go_tps68470_vio_reg_init_data to generic_tps68470_vio_reg_init_data
> and move it to the top of the file since it now no longer is surface
> specific.
> 
> And then just use the new generic_tps68470_vio_reg_init_data for the Dell
> 5285 too.
> 
> And maybe a follow-up patch replacing the somewhat wrong vio_reg_init_data
> for the Dell 7212 with the new generic_tps68470_vio_reg_init_data too.
> 
> > +
> 
> Add a comment here that since I2C pass-through is used the vsio voltage must
> be the exact same voltage as the one from generic_tps68470_vio_reg_init_data.
> 
> > +static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1800600,
> > +		.max_uV = 1800600,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +		/*
> > +		 * Keep S_I2C_CTL enabled from boot so OV8858 I2C daisy-chain
> > +		 * is accessible before ov8858 driver probes.
> > +		 */
> > +		.always_on = 1,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_vsio_consumer_supplies),
> > +	.consumer_supplies = dell_5285_int3479_vsio_consumer_supplies,
> > +};
> > +> +static const struct regulator_init_data dell_5285_tps68470_aux1_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1213200,
> > +		.max_uV = 1213200,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux1_consumer_supplies),
> > +	.consumer_supplies = dell_5285_int3479_aux1_consumer_supplies,
> > +};
> > +
> > +static const struct regulator_init_data dell_5285_tps68470_aux2_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1800600,
> > +		.max_uV = 1800600,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux2_consumer_supplies),
> > +	.consumer_supplies = dell_5285_int3479_aux2_consumer_supplies,
> > +};
> > +
> > +static const struct tps68470_regulator_platform_data dell_5285_tps68470_pdata = {
> > +	.reg_init_data = {
> > +		[TPS68470_CORE] = &dell_5285_tps68470_core_reg_init_data,
> > +		[TPS68470_ANA]  = &dell_5285_tps68470_ana_reg_init_data,
> > +		[TPS68470_VCM]  = &dell_5285_tps68470_vcm_reg_init_data,
> > +		[TPS68470_VIO]  = &dell_5285_tps68470_vio_reg_init_data,
> > +		[TPS68470_VSIO] = &dell_5285_tps68470_vsio_reg_init_data,
> > +		[TPS68470_AUX1] = &dell_5285_tps68470_aux1_reg_init_data,
> > +		[TPS68470_AUX2] = &dell_5285_tps68470_aux2_reg_init_data,
> > +	},
> > +};
> > +
> > +static struct gpiod_lookup_table dell_5285_int3477_gpios = {
> > +	.dev_id = "i2c-INT3477:00",
> > +	.table = {
> > +		/*
> > +		 * TPS68470 GPIO9 = s_resetn (secondary camera reset, active-low)
> > +		 * TPS68470 GPIO7 = s_enable (secondary camera enable/powerdown)
> > +		 * These logic outputs are specifically designed for secondary
> > +		 * camera control on the TPS68470. Matches Surface Go pattern.
> > +		 */
> > +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
> > +		{ }
> > +	}
> > +};
> > +
> > +static struct gpiod_lookup_table dell_5285_int3479_gpios = {
> > +	.dev_id = "i2c-INT3479:00",
> > +	.table = {
> > +		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
> > +		{ }
> > +	}
> > +};
> > +
> > +static const struct int3472_tps68470_board_data dell_5285_tps68470_board_data = {
> > +	.dev_name = "i2c-INT3472:05",
> > +	.tps68470_regulator_pdata = &dell_5285_tps68470_pdata,
> > +	.n_clk_consumers = ARRAY_SIZE(dell_5285_clk_consumers),
> > +	.clk_consumers = dell_5285_clk_consumers,
> > +	.n_gpiod_lookups = 2,
> > +	.tps68470_gpio_lookup_tables = {
> > +		&dell_5285_int3477_gpios,
> > +		&dell_5285_int3479_gpios,
> > +	},

As I²C daisy chain configuration is needed, see for an example in commit
be653ae8110b078cae7cb50646a080f17d35fdb2 how to configure the GPIOs as
inputs without pull.

I²C daisy chaining is currently enabled by the driver if the IO regulator
is enabled but that is actually a bug, albeit not a problem for the current
users. The configuration should be bound to the daisy chain GPIO
configuration instead and this should be added to the rest of the systems
here needing it.

Cc Antti.

> > +};
> > +
> >  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
> >  	{
> >  		.matches = {
> > @@ -316,6 +485,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
> >  		},
> >  		.driver_data = (void *)&dell_7212_tps68470_board_data,
> >  	},
> > +	{
> > +		.matches = {
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR,   "Dell Inc."),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> > +		},
> > +		.driver_data = (void *)&dell_5285_tps68470_board_data,
> > +	},
> >  	{ }
> >  };
> >  
> 
> Regards,
> 
> Hans
> 
> 
> 
> p.s.
> 
> I would expect the OV8858 to have a variavble-focus lens with some VCM driver,
> bit we can add support for that later.
> 

-- 
Kind regards,

Sakari Ailus

