Return-Path: <linux-media+bounces-49690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DED48CE923E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F5E3019BFB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDDD274659;
	Tue, 30 Dec 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN/OKcLi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9D71E5B70;
	Tue, 30 Dec 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085525; cv=none; b=t6xpN7l6Zg5yFcNpJRb4Nsa55x+sqZLThHdxSAbP25lXyi/0fOJSN9jSPYXtzk2tyYANKaaZqgIYMKcb/iUlBkbEAx/txPrJPIHRrQvitfFYjt6zC4h01H5m153vJhLkGUy+lrtSje6Yg2zkLvt9+6OeKYbuMIDVtb7l7xnDAR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085525; c=relaxed/simple;
	bh=PE6NPGXVML7KQDnspAbSkdZVdGs24GuLOwH/jrUPFmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OELJC/WFG+u5v6zKwdUcd97vTFmxnqq+T9FyrhC8h4XG7vTuFGO5bZ6ujEOMFifwGIsHRyhO1RtNbtZY6RWZMo65SgPAeuQrWz2OMRVL0YhWjyi/m0FXstt26vv72sBJVHYHspHaHb0j6uUGpi1RH5R9O8Bl+IGS+t2QovBt29c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN/OKcLi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767085523; x=1798621523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PE6NPGXVML7KQDnspAbSkdZVdGs24GuLOwH/jrUPFmM=;
  b=KN/OKcLibOsRkwzANY4GMzW9ydaLGQOB7J9whtDIiD1sJPRJEV0vejLn
   L6sVJJecOz9USUeNXgqgXa+hgf/uh8wUdiqb9HMuEdI3h8KR7iqeX806D
   ELeUO90iQHUMcRBv3jwTFIonutWLZ3spo+1ZbCHIla5lOS7pGIrC3aW2C
   ugNDKR+9TMLqO9jDMC/V4AiVaMwQFtBI9o71fZl7ZHOuNAC0nSoA/qgFf
   HPupE9/xiO7gGjbgwjsQR1WYkfQh+0RDQPa08k2RUb/2VmNab8gu6SVOd
   MhZIhBEvbzW0mJeQ6Di9KHrGIsy+MGTI79FnxmhGGneQlD5GM32HxbTqH
   w==;
X-CSE-ConnectionGUID: Wi5mk2EkQCSMcjDiMW8Hhg==
X-CSE-MsgGUID: twUh2SWjTTSfcFIFlYU3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68712145"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68712145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:05:22 -0800
X-CSE-ConnectionGUID: Eux4PWfFQ5KRLgeFwzNWQQ==
X-CSE-MsgGUID: OeZWY3JHRQqfTjsbz0rMJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="205696221"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:05:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 258B4121D81;
	Tue, 30 Dec 2025 11:05:29 +0200 (EET)
Date: Tue, 30 Dec 2025 11:05:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Add note to prevent buggy code re-use
Message-ID: <aVOV2QrFvoCVQSrA@kekkonen.localdomain>
References: <20251230083435.26267-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230083435.26267-2-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

Thanks for the patch.

On Tue, Dec 30, 2025 at 09:34:36AM +0100, Krzysztof Kozlowski wrote:
> adv7604 and et8ek8 sensor drivers have mixed up logical and line level
> for reset/powerdown signal.  They call it a reset signal (it indeed
> behaves like that), but drivers assert the reset to operate which is
> clearly incorrect and relies on wrong ACTIVE_HIGH flag in the DTS.
> 
> People in discussions copy existing poor code and claim they can repeat
> same mistake, so add a note to prevent that.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Similar to my commit 9d108d226224 ("media: i2c: imx: Add note to prevent
> buggy code re-use"). I went through rest of i2c drivers and found only
> these two doing it incorrectly.
> ---
>  drivers/media/i2c/adv7604.c              | 8 +++++++-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 516553fb17e9..67116a4ef134 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -3453,7 +3453,13 @@ static int configure_regmaps(struct adv76xx_state *state)
>  static void adv76xx_reset(struct adv76xx_state *state)
>  {
>  	if (state->reset_gpio) {
> -		/* ADV76XX can be reset by a low reset pulse of minimum 5 ms. */
> +		/*
> +		 * Note: Misinterpretation of reset assertion - do not re-use
> +		 * this code.  The reset pin is using incorrect (for a reset
> +		 * signal) logical level.
> +		 *
> +		 * ADV76XX can be reset by a low reset pulse of minimum 5 ms.
> +		 */
>  		gpiod_set_value_cansleep(state->reset_gpio, 0);
>  		usleep_range(5000, 10000);
>  		gpiod_set_value_cansleep(state->reset_gpio, 1);
> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> index 2cb7b718782b..50121c3e5b48 100644
> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> @@ -835,6 +835,10 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
>  
>  	udelay(10); /* I wish this is a good value */
>  
> +	/*
> +	 * Note: Misinterpretation of reset assertion - do not re-use this code.
> +	 * The reset pin is using incorrect (for a reset signal) logical level.
> +	 */
>  	gpiod_set_value(sensor->reset, 1);
>  
>  	msleep(5000 * 1000 / sensor->xclk_freq + 1); /* Wait 5000 cycles */

Related to the topic, would you be able to comment on the discussion
related to <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>? I
believe you're cc'd, with your @kernel.org address.

What I don't like too much is that there's no way to write correct DTS
without fixing these drivers somehow. :-(

-- 
Kind regards,

Sakari Ailus

