Return-Path: <linux-media+bounces-66121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U0tgGzfeQ2rTkgoAu9opvQ
	(envelope-from <linux-media+bounces-66121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:18:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB026E5D92
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:18:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Iqjv1dD2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66121-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66121-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6536130262F7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A626B366541;
	Tue, 30 Jun 2026 15:18:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EED2475D0;
	Tue, 30 Jun 2026 15:18:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832682; cv=none; b=nBkm5PpnVjrgvD8eOpjvrOUZlD9oTi8PmA97YJ00CHg1etJgUmpIrRDv9hLhfD30Y1uBn6ibBDFJps7Sr2ZmJErBnnQLytVSKTBmTiqPwMWnEcrFsa1g34lG46BtlXKHCon7/xPT4KvcGPBjF8uKAOs6whJOe5u8jePzFfXzdgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832682; c=relaxed/simple;
	bh=YCwk/fJkVezQEYvDgduVi9KHY6vufC43aC3M8tUxVVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbyN2RAGOewWH+5QreOVFkbjwMqH9eBhJHNc6bgrgWNGV4p0Xj/yxj3PeVq6csXrdX2r3WgxO1zVj8lEzyH1HPZ8AQLjWCC57t9iE4h8TWmoRMzcpf3QDI57VDRkHLzg3hNtGMKM26xfCUEeT4jFfxF9Q2RWNN1qBgh5skEUdHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iqjv1dD2; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782832680; x=1814368680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCwk/fJkVezQEYvDgduVi9KHY6vufC43aC3M8tUxVVY=;
  b=Iqjv1dD2oqJH//kXh4KumDTDLaCLbwpYQ2c8rRIR7EAPqTTYjrE36oHO
   ffkfCgBsoo/odIxVi4LTOMOg/Y81xHzvJn8mvfbAK0+5ZXnrbeG+Z8SJa
   7ITq/BUpJq5HjdJ/x7cBa+ZHmN7R9SYdJ4nWx8bevH5okr0uUXzq/nSwa
   0lZdVdcsP2NVPSD1VduaGeRkhqlvTmmoayITf8QNDRptDrqgGDuq/Kdmi
   Bq0294/NiRvY6g59t2qw3GhdYquPe+xzGMgaE2SI/NqaJMcFgVTNOr9q8
   05rDX4EjtnJ75Olc5HeNUxt55HhUs1Il0bp6D0Zgb59BWYIZplME4v2ul
   Q==;
X-CSE-ConnectionGUID: nAI6yC35S2yxL9Mz/WWogQ==
X-CSE-MsgGUID: ejObBFM3SuWkEAkH18DOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="100976625"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="100976625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:17:55 -0700
X-CSE-ConnectionGUID: ybw0GU+9R4qBExbSxIEKow==
X-CSE-MsgGUID: 9I7++mjOQ52SmWYAypZXhA==
X-ExtLoop1: 1
Received: from amilburn-desk.amilburn-desk (HELO mdjait-mobl) ([10.245.245.227])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:17:52 -0700
Date: Tue, 30 Jun 2026 17:17:44 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/15] media: i2c: os05b10: split common and
 mode-specific init registers
Message-ID: <akPJvSDdbSo00584@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-5-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-5-tarang.raval@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66121-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,mdjait-mobl:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFB026E5D92

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:50PM +0530, Tarang Raval wrote:
> Separate common initialization registers from mode-specific settings.
> Move resolution-dependent registers into a per-mode register list and
> program them during stream enable.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 118 ++++++++++++++++++++++--------------
>  1 file changed, 74 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 751494fdba6d..9499867ad40e 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -122,37 +122,34 @@ static const char * const os05b10_supply_name[] = {
>  };
>  
>  static const struct cci_reg_sequence os05b10_common_regs[] = {
> -	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
> -	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
> -	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
> -	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
> -	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
> +	{ OS05B10_REG_PLL_CTRL_01,		0x44 },
> +	{ OS05B10_REG_PLL_CTRL_03,		0x02 },
> +	{ OS05B10_REG_PLL_CTRL_05,		0x32 },
> +	{ OS05B10_REG_PLL_CTRL_06,		0x00 },
> +	{ OS05B10_REG_PLL_CTRL_25,		0x3b },
> +	{ OS05B10_REG_MIPI_SC_CTRL,		0x72 },
> +	{ OS05B10_REG_MIPI_SC_CTRL_1,		0x01 },
> +	{ OS05B10_REG_DIGITAL_GAIN,		0x0400 },
> +	{ OS05B10_REG_ANALOG_GAIN_SHORT,	0x0080 },
> +	{ OS05B10_REG_DIGITAL_GAIN_SHORT,	0x0400 },
> +	{ OS05B10_REG_EXPOSURE_SHORT,		0x000020 },

The changes above seem to be more cosmetic and are not part of this
patch. the register values are also tab aligned not like the others
below

>  	{ CCI_REG8(0x3002), 0x21 },
> -	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
>  	{ CCI_REG8(0x301e), 0xb4 },
>  	{ CCI_REG8(0x301f), 0xd0 },
>  	{ CCI_REG8(0x3021), 0x03 },
> -	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
>  	{ CCI_REG8(0x3107), 0xa1 },
>  	{ CCI_REG8(0x3108), 0x7d },
>  	{ CCI_REG8(0x3109), 0xfc },
>  	{ CCI_REG8(0x3503), 0x88 },
> -	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
> -	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
> -	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
> -	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
>  	{ CCI_REG8(0x3600), 0x4d },
>  	{ CCI_REG8(0x3601), 0x08 },
> -	{ CCI_REG8(0x3610), 0x87 },
>  	{ CCI_REG8(0x3611), 0x24 },
>  	{ CCI_REG8(0x3614), 0x4c },
> -	{ CCI_REG8(0x3620), 0x0c },
>  	{ CCI_REG8(0x3632), 0x80 },
>  	{ CCI_REG8(0x3633), 0x00 },

--
Kind Regards
Mehdi Djait

