Return-Path: <linux-media+bounces-50493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FED1668B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 04:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91212300D909
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 03:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7CC3090C5;
	Tue, 13 Jan 2026 03:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQFf3lvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B913074AB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 03:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768273798; cv=none; b=fCXMdP79FYNz+aVj8FlnmTUbMTrynduYD9WduiGi/6ZjUQNCm2wrGpwnhZ/f8Coy7AO0NwQRk2Gka4qP9i5KeLSviDEq0F/cQzTHnjTsh7OiWSUS6P6U8CcNWlKb23TXEBKDZw6YenYyMQ0nE0PdZ2uZoceTggEncFmZx6PHIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768273798; c=relaxed/simple;
	bh=dtJxcBWgxySmxWxmTVIvgHphDTgCLjeQWxcm4RPwk/8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lgElgor8NgsrJNXOit7cPHgTfpBIVpdsfeNHb6thLiI42tmrtqCi/Vb1JYdsAMWFdBVWTcQzsihv1wrr6F9KrkSeXvxcwyBx9TGQmnFSA88YIReSeyZZ/b+c2T2O592eRK4L3UUunx41minnzSXP3/vTV1no/tqGxIWsiCLB4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQFf3lvj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768273797; x=1799809797;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=dtJxcBWgxySmxWxmTVIvgHphDTgCLjeQWxcm4RPwk/8=;
  b=IQFf3lvjG/N3Cw5UKwzLP1knxPnuPqN9/zzogZUpiPXG8FPir0TuTH2j
   8HlswTq+BTPMIl/aFKJ2M3hoT9lythRjDL1fPhvFwgRPveFIkBa3GRq+z
   CATSIrfQ5uGFOGzoZnJMeXUGMj6GBzFc55juRly2SVLFvsAHtVDzFy5dW
   MlDr9hRW3yAOv9+T0azbzcr9lqgUK2TrTDfDLFcjXT1ZmQVr+uYohaS2M
   q2fq1AAq5+G/dXpb8tMwzt+a7RLt+OTuMvNa4WEi2ajw3EigK4+JoevPH
   jxvbQg1zCFlFl1PS2cmw1B6gPffZut3GJuHMuEepeV/0EeqNwuw7k1dCn
   Q==;
X-CSE-ConnectionGUID: Rh8dvWjkRsK0Z3bXTAWKPw==
X-CSE-MsgGUID: nagcHXneSy2Xf93bpUyFBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57110962"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="57110962"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:09:56 -0800
X-CSE-ConnectionGUID: f8WHkkUoTIGzDjZqHdVShA==
X-CSE-MsgGUID: tSVi+0XbTGuD4MSzv1PYdg==
X-ExtLoop1: 1
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:09:55 -0800
Subject: Re: [PATCH v2 06/23] media: i2c: ov01a10: Fix test-pattern disabling
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, Hans de Goede <hansg@kernel.org>,
 mehdi.djait@intel.com
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
 <20260112095949.3851-7-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <419da2e9-1532-a39c-e4e6-dad0141e1002@linux.intel.com>
Date: Tue, 13 Jan 2026 10:59:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260112095949.3851-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari and Hans,

On 1/12/26 5:59 PM, Sakari Ailus wrote:
> From: Hans de Goede <hansg@kernel.org>
> 
> When the test-pattern control gets set to 0 (Disabled) 0 should be written
> to the test-pattern register, rather then doing nothing.
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov01a10.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index dd2b6d381175..3ad516e4d369 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -249,9 +249,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
>  static const char * const ov01a10_test_pattern_menu[] = {
>  	"Disabled",
>  	"Color Bar",
> -	"Top-Bottom Darker Color Bar",
> -	"Right-Left Darker Color Bar",
> -	"Color Bar type 4",
> +	"Left-Right Darker Color Bar",
> +	"Bottom-Top Darker Color Bar",
>  };
>  
>  static const s64 link_freq_menu_items[] = {
> @@ -406,10 +405,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>  
>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>  {
> -	if (!pattern)
> -		return 0;
> -
> -	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> +	if (pattern)
> +		pattern |= OV01A10_TEST_PATTERN_ENABLE;
>

It should be 'pattern - 1', the pattern value for register start as 0.

>  	return ov01a10_write_reg(ov01a10, OV01A10_REG_TEST_PATTERN, 1, pattern);
>  }
> 

-- 
Best regards,
Bingbu Cao

