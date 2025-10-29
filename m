Return-Path: <linux-media+bounces-45949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21DC1C8AA
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 18:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4073F1883BA3
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081BD3546EF;
	Wed, 29 Oct 2025 17:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbA7tqNm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F3332902;
	Wed, 29 Oct 2025 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761759895; cv=none; b=SFJ3zs22TXDtbRbnUqAZkLhnjYZNzcLPuIM5dZOgD/pbIfgq5Q1xOqiCYyrFD5NCCZGi3mcdudXXlVSlqAaU7oq/fMENCoqSrOkaH9j7BzceYnINAdc7877cWljanTr9KQ3kSPyr6IxR0HrCjI2LykBbi7yU48TmXkzycKHYxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761759895; c=relaxed/simple;
	bh=2hFcbnwykJKKd8Jrh3uYfXCOJBYZiMN87dt9ZIh4obw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFGhrXj+kPk6wZaqqCtiD+7TlGXrup2idGwYYt7JNODIQcwLLX+Nyi6YITx+3SPoD2iWZ48y+Az+MH7KrUDKBsXDcw/H3GZMR3k8ZM0LRfUTgDd3MKDr11H3nOH7o9iMFLMrfpbUWVeTNIr3UlqzxIws8VwMVeUApKdFMis9AdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbA7tqNm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761759893; x=1793295893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2hFcbnwykJKKd8Jrh3uYfXCOJBYZiMN87dt9ZIh4obw=;
  b=HbA7tqNmy0dtt8abKTjhnQMB1gfXi89hIvHrFz4qWb9BjnMwwUhuNsM5
   VOGTrlPFymzkxX4Ua3mh+wrayHmAog1u/FPeZYE9RmNAehMqB+1VCDRSd
   pQQFjZzTOE6WyOZeyCEmXWNfsKxlBr2n+C1A1RmslpgSoiZtWllghoeQG
   qfz+qCfsbBq/l6cIYbImRewxoj6Ye3M2+kNYUGe85XDRel1vpZCuJJECE
   tLe8FZCHd2fi9pJRkc50XFY4YZlK4owrWTo7qnPspqWXwCVrmGYJt1KlL
   oiC+k9/60hHYQCo7u/oyjyTxfBdaGbwToLMvQm2VCn2yZtSuByU3G1aQS
   w==;
X-CSE-ConnectionGUID: /cKvFoTPRWWblyg+TAqD8Q==
X-CSE-MsgGUID: M8zSfO25Ram7E8JmQPLbLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67542431"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="67542431"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:44:52 -0700
X-CSE-ConnectionGUID: n4W1H7jjRnupT8s9Oft5Bg==
X-CSE-MsgGUID: C99SNKl1QZCrEZEaQP6Rng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186184385"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.118])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:44:51 -0700
Date: Wed, 29 Oct 2025 18:44:44 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
Message-ID: <5y3rhvmaj2egcc7l6rb45vop2vczfkezliwhh5sxmh3dcv4vbp@mawsa23f6ybu>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-7-hansg@kernel.org>
 <rywqbh2ku7aexskohujwsiv7yzgn7lipgdqol3rqtkcvqrmn3q@c6oe7wc45hti>
 <8718bd8e-12b0-4c4e-9155-7e394f0d5a16@kernel.org>
 <jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m>
 <2bdea464-a75e-4be3-828c-5f2a7948715f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bdea464-a75e-4be3-828c-5f2a7948715f@kernel.org>

Hi Hans,

On Tue, Oct 28, 2025 at 04:52:54PM +0100, Hans de Goede wrote:
> Hi Medhi,
> 
> On 28-Oct-25 4:38 PM, Mehdi Djait wrote:
> > Hi Hans,
> > 
> > On Tue, Oct 28, 2025 at 03:38:28PM +0100, Hans de Goede wrote:
> >> Hi Mehdi,
> >>
> >> Thank you for all the reviews and testing.
> >>
> >> On 28-Oct-25 1:08 PM, Mehdi Djait wrote:
> >>> Hi Hans,
> >>>
> >>> Thank you for the patches!
> >>>
> >>> On Tue, Oct 14, 2025 at 07:40:14PM +0200, Hans de Goede wrote:
> >>>> When the test-pattern control gets set to 0 (Disabled) 0 should be written
> >>>> to the test-pattern register, rather then doing nothing.
> >>>>
> >>>
> >>> A small question: Do you see any difference between test_pattern 1 and
> >>> test_pattern 2 or I did not look hard enough at the screen ?
> >>
> >> IIRC the one has the colors fading (a bit) from left to right and
> >> the other from top to bottom ?
> > 
> > I see:
> > 1 and 2 are the same ?!
> > 3 fading from left -> right
> > 4 fading from top  ->  bottom
> 
> That might very well be correct. Unfortunately I no longer
> have access to the Dell XPS 13 9320 I tested this on, so I cannot
> confirm.
> 
> I think I should squash the following fix into this one:
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index 6a1ab5fa70a2..1fe643cb1e6b 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -215,9 +215,8 @@ static const struct reg_sequence ov01a1s_regs[] = {
>  static const char * const ov01a10_test_pattern_menu[] = {
>  	"Disabled",
>  	"Color Bar",
> +	"Left-Right Darker Color Bar",
>  	"Top-Bottom Darker Color Bar",

This should be changed to: "Bottom-Top Darker Color Bar"

> -	"Right-Left Darker Color Bar",
> -	"Color Bar type 4",
>  };
>  
>  static const s64 link_freq_menu_items[] = {
> @@ -318,7 +317,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>  {
>  	if (pattern)
> -		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> +		pattern |= OV01A10_TEST_PATTERN_ENABLE;
>  
>  	return cci_write(ov01a10->regmap, OV01A10_REG_TEST_PATTERN, pattern,
>  			 NULL);
> 
> This skips setting 0 as the pattern, since 0 is the same as 1,
> removes the weird "Color Bar type 4" from the menu and fixes
> the order of the 2 fading controls.
> 
> Can you give this a test ?

It works as expected. Thank you for the patch

--
Kind Regards
Mehdi Djait

