Return-Path: <linux-media+bounces-49716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E3CE9B88
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF97301E911
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9381F099C;
	Tue, 30 Dec 2025 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFLv40WJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E742A1BA;
	Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099630; cv=none; b=ToPTS8Ku7tgLFGhFqczosYzwegy8rdQ5qJiKv4L4z8g9hPV5l/dfgx22C0wNllym3CHLmAXtjyqkCEJH6pQKTXHjIVLcx0Yr+sVIIQMjrKQt93x/2ZJFwJemSkvHCEuE3FUFNRmosJTYN7BH3vgkV2XZOspVomaAp8o2HTF8ztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099630; c=relaxed/simple;
	bh=wsaEBEU0KaTY/m1emqX+BkzhdU2R4YEFP/thKfk41pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekxHu4L7AgDmXOciRRc+DmOF4pHPGdJPlJ5JO5vcDV9kvg9jjTnBqux6d/Ud1rI4JVMELC3P2TwnUHPGONnTVGTmyEn2rq1gu1osXHCoG+CUyg/wyhPsd3kPRA//CV+n7ur9F+Ggho9Dk4nm6v2+EKmPxtUJ1tj9uWv9ynCN0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFLv40WJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767099628; x=1798635628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wsaEBEU0KaTY/m1emqX+BkzhdU2R4YEFP/thKfk41pw=;
  b=fFLv40WJBsM7Zz+OvgdCaRBn5eijNsCutOrr4esxjoXaJ3AVBCitjKNN
   74ZOSUTikN0W8+xkwK01Qjc8ceg+QYC+k4kR0ULImrzioptpq7Qxjj+P3
   Ci1YucQPqfVY6kIQA1k98JoMBbutDeEqY9xHgfwZ50iFne9+V2examks4
   R/yjupt7HBP5C5edWYhk9Nx9B5ZJkRvpYZKaEhjz0KqG5Do4kooP+nYlz
   BUoke6nzoYLOrqvwdpDQmek2lQy6ss3RrKYfDEf87nnJil7oHW1IPxnPT
   DjevMZasXBY5t1jOZXP0i5DbW3VlcU+aMU0Mhof8CU6vyE/mWgol5/q5g
   Q==;
X-CSE-ConnectionGUID: 19Wjqtn6S5a3bMo+DeZ/nw==
X-CSE-MsgGUID: axXC8VRXQHylr6IAIHaaeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67692122"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="67692122"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:00:28 -0800
X-CSE-ConnectionGUID: 3lG7u4/1TnedmqZg9w+XQA==
X-CSE-MsgGUID: Pu3tfONdQ+6kB3Y3btQTbA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:00:26 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 176AC11F8E7;
	Tue, 30 Dec 2025 15:00:34 +0200 (EET)
Date: Tue, 30 Dec 2025 15:00:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Add note to prevent buggy code re-use
Message-ID: <aVPM8vPySNFMUI5s@kekkonen.localdomain>
References: <20251230083435.26267-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aVOV2QrFvoCVQSrA@kekkonen.localdomain>
 <462e5ec1-cc26-4003-ac5c-adde2c243959@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <462e5ec1-cc26-4003-ac5c-adde2c243959@oss.qualcomm.com>

On Tue, Dec 30, 2025 at 10:35:28AM +0100, Krzysztof Kozlowski wrote:
> On 30/12/2025 10:05, Sakari Ailus wrote:
> > Hi Krzysztof,
> > 
> > Thanks for the patch.
> > 
> > On Tue, Dec 30, 2025 at 09:34:36AM +0100, Krzysztof Kozlowski wrote:
> >> adv7604 and et8ek8 sensor drivers have mixed up logical and line level
> >> for reset/powerdown signal.  They call it a reset signal (it indeed
> >> behaves like that), but drivers assert the reset to operate which is
> >> clearly incorrect and relies on wrong ACTIVE_HIGH flag in the DTS.
> >>
> >> People in discussions copy existing poor code and claim they can repeat
> >> same mistake, so add a note to prevent that.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> ---
> >>
> >> Similar to my commit 9d108d226224 ("media: i2c: imx: Add note to prevent
> >> buggy code re-use"). I went through rest of i2c drivers and found only
> >> these two doing it incorrectly.
> >> ---
> >>  drivers/media/i2c/adv7604.c              | 8 +++++++-
> >>  drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 ++++
> >>  2 files changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> >> index 516553fb17e9..67116a4ef134 100644
> >> --- a/drivers/media/i2c/adv7604.c
> >> +++ b/drivers/media/i2c/adv7604.c
> >> @@ -3453,7 +3453,13 @@ static int configure_regmaps(struct adv76xx_state *state)
> >>  static void adv76xx_reset(struct adv76xx_state *state)
> >>  {
> >>  	if (state->reset_gpio) {
> >> -		/* ADV76XX can be reset by a low reset pulse of minimum 5 ms. */
> >> +		/*
> >> +		 * Note: Misinterpretation of reset assertion - do not re-use
> >> +		 * this code.  The reset pin is using incorrect (for a reset
> >> +		 * signal) logical level.
> >> +		 *
> >> +		 * ADV76XX can be reset by a low reset pulse of minimum 5 ms.
> >> +		 */
> >>  		gpiod_set_value_cansleep(state->reset_gpio, 0);
> >>  		usleep_range(5000, 10000);
> >>  		gpiod_set_value_cansleep(state->reset_gpio, 1);
> >> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> >> index 2cb7b718782b..50121c3e5b48 100644
> >> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
> >> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> >> @@ -835,6 +835,10 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
> >>  
> >>  	udelay(10); /* I wish this is a good value */
> >>  
> >> +	/*
> >> +	 * Note: Misinterpretation of reset assertion - do not re-use this code.
> >> +	 * The reset pin is using incorrect (for a reset signal) logical level.
> >> +	 */
> >>  	gpiod_set_value(sensor->reset, 1);
> >>  
> >>  	msleep(5000 * 1000 / sensor->xclk_freq + 1); /* Wait 5000 cycles */
> > 
> > Related to the topic, would you be able to comment on the discussion
> > related to <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>? I
> > believe you're cc'd, with your @kernel.org address.
> 
> I don't have it in my inbox (it's limited to ~10k of messages, so the
> roll out of inbox after 1 month usually).

I just bounced the thread to you...

-- 
Sakari Ailus

