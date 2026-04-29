Return-Path: <linux-media+bounces-59949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGIfE+vI8Wn+kQEAu9opvQ
	(envelope-from <linux-media+bounces-59949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:01:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35578491778
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D26C730066A7
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C683BA25F;
	Wed, 29 Apr 2026 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBlE/GxG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0A13635E;
	Wed, 29 Apr 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453279; cv=none; b=o8VnknfR8flsdXi/hvwCBoFVYtO239y0tuTDBkXcq1f6Ec6FKEboORzhb0/fqCKlIRoFNqcocCOVScepXfFqfyTArpI9ZuWeIG9DyD6gtFidlXDxy4EqkomSioCyLRQZ2Ad7rrndsjZdoK8/MxidLykuWzyR1IZaejIV0+Eh/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453279; c=relaxed/simple;
	bh=D1rUmMbehvBYJbM0kC4OWzVs0xX9gIHhdT+aisRJpAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrObPymckY8nXKSTe1r77dijn43dQCAaArHE7dlbDoQOP7sAf8zTn6LkUXTpSTCpfi5RphpYi/1UM//9gNSBjymXzKiMPE9aFmuE79d+yD13uq5Uvk/+V62BWEwwoUfYsiamAMlZ+O6jghYUatRYu0lml8QGQD+tLFB3fZfZn3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBlE/GxG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777453278; x=1808989278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D1rUmMbehvBYJbM0kC4OWzVs0xX9gIHhdT+aisRJpAo=;
  b=IBlE/GxGVbrP2jOtokkU8oXuIfTC7om0FnmVgY8OQ8P8c+vADGnLcbVk
   nxPKNoC3YYw5IRcwml6rypx+hvEMenb8aNg7TFULQLUroewuj8W0Jh2Vh
   fyEivBXbLXCMRD0HORpNilF3lPCwPylhm783S0c5f8XhFve2AWEXqpeeW
   e1NW1+1XnJ/RoP4bLIDwh+SfNMdbDYz+EoUWKph/GFPrUc0kJUrEAvpzc
   IpipcNsT1df9EbQfHKy29x6U0vtK27JTbujKDD/8fsqlt0YVbXF/mTOzY
   oWRG6Og8o3vkNmZqesVaYkZvR2X7B1irCp/dn/zj+MIr6vhCwZ65z8SVw
   g==;
X-CSE-ConnectionGUID: 8apChf4gTduASjmyAYo+dQ==
X-CSE-MsgGUID: pgKV/bVwRsm0gE57JjkhAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78363054"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78363054"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 02:01:17 -0700
X-CSE-ConnectionGUID: +HREylMYQy6JHUpgqLWycg==
X-CSE-MsgGUID: hZwPaZnpSjWXhBGsQi3i/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="231070348"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 02:01:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 46347121CB5;
	Wed, 29 Apr 2026 12:01:15 +0300 (EEST)
Date: Wed, 29 Apr 2026 12:01:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: hi846: Add 6MP and 8MP modes support
Message-ID: <afHI29SDHDggH2Wt@kekkonen.localdomain>
References: <20260429070351.1307204-1-mitltlatltl@gmail.com>
 <20260429070351.1307204-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429070351.1307204-3-mitltlatltl@gmail.com>
X-Rspamd-Queue-Id: 35578491778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59949-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[mitltlatltl.gmail.com:query timed out];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Pengyu,

On Wed, Apr 29, 2026 at 03:03:51PM +0800, Pengyu Luo wrote:
> Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> utilization.
> 
> Note that these modes require 4-lane MIPI CSI-2, as the downstream
> driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> operation on the target device. The register sequences are extracted
> from the downstream Windows driver.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 154 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 153 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 09c109f3fba9..b8ae7344f1a0 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1027,6 +1027,106 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
>  	{HI846_REG_TG_ENABLE,			0x0100},
>  };
>  
> +static const struct hi846_reg mode_3264x1836_config[] = {
> +	{HI846_REG_MODE_SELECT,			0x0000},
> +	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
> +	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
> +	{HI846_REG_Y_ADDR_START_VACT_H,		0x0172},
> +	{HI846_REG_Y_ADDR_END_VACT_H,		0x089d},
> +	{HI846_REG_UNKNOWN_005C,		0x2101},
> +	{HI846_REG_FLL,				0x09de},
> +	{HI846_REG_LLP,				0x0ed8},
> +	{HI846_REG_BINNING_MODE,		0x0022},
> +	{HI846_REG_HBIN_MODE,			0x0000},
> +	{HI846_REG_UNKNOWN_0A24,		0x0000},
> +	{HI846_REG_X_START_H,			0x0000},
> +	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
> +	{HI846_REG_Y_OUTPUT_SIZE_H,		0x072c},
> +	{HI846_REG_EXPOSURE,			0x09d8},
> +
> +	/* For OTP */
> +	{HI846_REG_UNKNOWN_021C,		0x0001},
> +	{HI846_REG_UNKNOWN_021E,		0x0235},
> +
> +	{HI846_REG_ISP_EN_H,			0x014a},
> +	{HI846_REG_UNKNOWN_0418,		0x023e},
> +	{HI846_REG_UNKNOWN_0B02,		0xe04d},
> +	{HI846_REG_UNKNOWN_0B10,		0x6821},
> +	{HI846_REG_UNKNOWN_0B12,		0x0120},
> +	{HI846_REG_UNKNOWN_0B14,		0x0001},
> +	{HI846_REG_UNKNOWN_2008,		0x38fd},
> +	{HI846_REG_UNKNOWN_326E,		0x0000},
> +};
> +
> +static const struct hi846_reg mode_3264x1836_mipi_4lane[] = {
> +	{HI846_REG_UNKNOWN_0900,		0x0300},
> +	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
> +	{HI846_REG_UNKNOWN_0914,		0xc109},
> +	{HI846_REG_TCLK_PREPARE,		0x061a},
> +	{HI846_REG_UNKNOWN_0918,		0x0407},
> +	{HI846_REG_THS_ZERO,			0x0a0b},
> +	{HI846_REG_TCLK_POST,			0x0e08},
> +	{HI846_REG_UNKNOWN_091E,		0x0a00},
> +	{HI846_REG_UNKNOWN_090C,		0x0427},
> +	{HI846_REG_UNKNOWN_090E,		0x0059},
> +	{HI846_REG_UNKNOWN_0954,		0x0089},
> +	{HI846_REG_UNKNOWN_0956,		0x0000},
> +	{HI846_REG_UNKNOWN_0958,		0xca80},
> +	{HI846_REG_UNKNOWN_095A,		0x9240},
> +	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
> +	{HI846_REG_TG_ENABLE,			0x0100},
> +};
> +
> +static const struct hi846_reg mode_3264x2448_config[] = {
> +	{HI846_REG_MODE_SELECT,			0x0000},
> +	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
> +	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
> +	{HI846_REG_Y_ADDR_START_VACT_H,		0x0040},
> +	{HI846_REG_Y_ADDR_END_VACT_H,		0x09cf},
> +	{HI846_REG_UNKNOWN_005C,		0x2101},
> +	{HI846_REG_FLL,				0x09de},
> +	{HI846_REG_LLP,				0x0ed8},
> +	{HI846_REG_BINNING_MODE,		0x0022},
> +	{HI846_REG_HBIN_MODE,			0x0000},
> +	{HI846_REG_UNKNOWN_0A24,		0x0000},
> +	{HI846_REG_X_START_H,			0x0000},
> +	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
> +	{HI846_REG_Y_OUTPUT_SIZE_H,		0x0990},
> +	{HI846_REG_EXPOSURE,			0x09d8},
> +
> +	/* For OTP */
> +	{HI846_REG_UNKNOWN_021C,		0x0001},
> +	{HI846_REG_UNKNOWN_021E,		0x0235},
> +
> +	{HI846_REG_ISP_EN_H,			0x014a},
> +	{HI846_REG_UNKNOWN_0418,		0x0000},
> +	{HI846_REG_UNKNOWN_0B02,		0xe04d},
> +	{HI846_REG_UNKNOWN_0B10,		0x6821},
> +	{HI846_REG_UNKNOWN_0B12,		0x0120},
> +	{HI846_REG_UNKNOWN_0B14,		0x0001},
> +	{HI846_REG_UNKNOWN_2008,		0x38fd},
> +	{HI846_REG_UNKNOWN_326E,		0x0000},
> +};
> +
> +static const struct hi846_reg mode_3264x2448_mipi_4lane[] = {
> +	{HI846_REG_UNKNOWN_0900,		0x0300},
> +	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
> +	{HI846_REG_UNKNOWN_0914,		0xc109},
> +	{HI846_REG_TCLK_PREPARE,		0x061a},
> +	{HI846_REG_UNKNOWN_0918,		0x0407},
> +	{HI846_REG_THS_ZERO,			0x0a0b},
> +	{HI846_REG_TCLK_POST,			0x0e08},
> +	{HI846_REG_UNKNOWN_091E,		0x0a00},
> +	{HI846_REG_UNKNOWN_090C,		0x0427},
> +	{HI846_REG_UNKNOWN_090E,		0x0059},
> +	{HI846_REG_UNKNOWN_0954,		0x0089},
> +	{HI846_REG_UNKNOWN_0956,		0x0000},
> +	{HI846_REG_UNKNOWN_0958,		0xca80},
> +	{HI846_REG_UNKNOWN_095A,		0x9240},
> +	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
> +	{HI846_REG_TG_ENABLE,			0x0100},
> +};
> +
>  static const char * const hi846_test_pattern_menu[] = {
>  	"Disabled",
>  	"Solid Colour",
> @@ -1042,9 +1142,11 @@ static const char * const hi846_test_pattern_menu[] = {
>  
>  #define FREQ_INDEX_640	0
>  #define FREQ_INDEX_1280	1
> +#define FREQ_INDEX_3264	2
>  static const s64 hi846_link_freqs[] = {
>  	[FREQ_INDEX_640] = 80000000,
>  	[FREQ_INDEX_1280] = 200000000,
> +	[FREQ_INDEX_3264] = 288000000,

Looking at the driver, the PLL configuration is present in the lane number
specific register list so the link frequency is in fact the same for all
modes. This problem isn't introduced by this patch but I think this needs
to be fixed before adding further modes to the driver.

The pixel rate is likely incorrect as well.

>  };
>  
>  static const struct hi846_reg_list hi846_init_regs_list_2lane = {
> @@ -1134,7 +1236,57 @@ static const struct hi846_mode supported_modes[] = {
>  			.width = 1632 * 2,
>  			.height = 1224 * 2,
>  		},
> -	}
> +	},
> +	{
> +		.width = 3264,
> +		.height = 1836,
> +		.link_freq_index = FREQ_INDEX_3264,
> +		.fps = 30,
> +		.frame_len = 2526,
> +		.llp = HI846_LINE_LENGTH,
> +		.reg_list_config = {
> +			.num_of_regs = ARRAY_SIZE(mode_3264x1836_config),
> +			.regs = mode_3264x1836_config,
> +		},
> +		.reg_list_2lane = {
> +			.num_of_regs = 0,
> +		},
> +		.reg_list_4lane = {
> +			.num_of_regs = ARRAY_SIZE(mode_3264x1836_mipi_4lane),
> +			.regs = mode_3264x1836_mipi_4lane,
> +		},
> +		.crop = {
> +			.left = 0x46,
> +			.top = 0x172,
> +			.width = 3264,
> +			.height = 1836,
> +		},
> +	},
> +	{
> +		.width = 3264,
> +		.height = 2448,
> +		.link_freq_index = FREQ_INDEX_3264,
> +		.fps = 30,
> +		.frame_len = 2526,
> +		.llp = HI846_LINE_LENGTH,
> +		.reg_list_config = {
> +			.num_of_regs = ARRAY_SIZE(mode_3264x2448_config),
> +			.regs = mode_3264x2448_config,
> +		},
> +		.reg_list_2lane = {
> +			.num_of_regs = 0,
> +		},
> +		.reg_list_4lane = {
> +			.num_of_regs = ARRAY_SIZE(mode_3264x2448_mipi_4lane),
> +			.regs = mode_3264x2448_mipi_4lane,
> +		},
> +		.crop = {
> +			.left = 0x46,
> +			.top = 0x40,
> +			.width = 3264,
> +			.height = 2448,
> +		},
> +	},
>  };
>  
>  struct hi846_datafmt {

-- 
Regards,

Sakari Ailus

