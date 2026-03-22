Return-Path: <linux-media+bounces-56642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s8a8KadwwGlQHwQAu9opvQ
	(envelope-from <linux-media+bounces-56642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:43:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B842EB0D4
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21D8300BC9F
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA3D37F013;
	Sun, 22 Mar 2026 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kw4VZ/BN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EF175A7B;
	Sun, 22 Mar 2026 22:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774219417; cv=none; b=jsDiew5F3q59+LGwoqfPc3u83scBomWPgqcTsiUwhmCvuSDRm2kcJIBuhHhYkHG6e2peJJPVFGwbY7HKUFJC3YBr0O3rkYz8aKsUbg4/roEtqo8B4O23meKUkw8vN2y+r6vs0Ar3E+GbP+AmwL5K3xIhWTtRq4msHaR4rbVVrEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774219417; c=relaxed/simple;
	bh=3NZS5IKaiiJmkOdFlkI0Zn/GcmqR6JP2ihKg3WoO1Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0qb6h4iB4Y3XQsURiW6PxPsOGRqGkkk8Q3gz+Ko1YAMh2gNSiv2KEdEDeSO1JfhHDSFXT+EJ7UDkOzUxrjJOM3DTKhcF52Z+DM1x0xWqAtijPua1QLPsX9m72Ayi2uQPfdmv2JzVFgyAEv69gk+5KXHFjM1ZeWj1yr2ys40zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kw4VZ/BN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774219415; x=1805755415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3NZS5IKaiiJmkOdFlkI0Zn/GcmqR6JP2ihKg3WoO1Lk=;
  b=kw4VZ/BNaLsmw/cixU+sViLIc4FY2IhhEOUNEknOluqEzc5ScoLPYWWH
   VtvSmVdbdy0oib0kzm0rCcyrSC+FMVm/1o8LmkXj9qd45Lr9M/O38mFHu
   0BsWCvPwIEWQb8JaubcgA5R3fGsd98jnN8MCiqU0oMLWJlDcHd8Z8d3xN
   g12L77biw+18vkTtA/3pMLnytvFtKNxoqbV+lPeiZHLI63fHpstY2Ita2
   oN5CxkxEOP8l94YZW4/7XHfQBOi9ibAD7EuFmbpJhOubzjTN9h51D7pye
   260IWDOpu+zpY0iAn/EYZ8s0u9Pmqef8NsMFhugZGsO8Wx48y82hggHmH
   A==;
X-CSE-ConnectionGUID: BGOhrx/jRzKDcNaH+vm3sA==
X-CSE-MsgGUID: dLayzm6dQ5eNGt7jh0T4JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75417498"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75417498"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:43:35 -0700
X-CSE-ConnectionGUID: Ag5YyxPeRF2Dw09UHCjyKA==
X-CSE-MsgGUID: TM4GzjZwTFCChROFttKvXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="224065153"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.240])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:43:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2C0E3121CFA;
	Mon, 23 Mar 2026 00:43:36 +0200 (EET)
Date: Mon, 23 Mar 2026 00:43:36 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: handle V4L2_CID_LINK_FREQ in s_ctrl
Message-ID: <acBwmJVtZHtqGEq9@kekkonen.localdomain>
References: <20260322135348.11339-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322135348.11339-1-surajsonawane0215@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56642-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 37B842EB0D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Suraj,

Thanks for the patch.

On Sun, Mar 22, 2026 at 07:23:48PM +0530, Suraj Sonawane wrote:
> Handle V4L2_CID_LINK_FREQ in ov5647_s_ctrl().
> 
> Currently this control is defined but not handled in s_ctrl(),
> so V4L2 falls back to estimating link frequency from pixel rate
> and prints warning like:
> 
>   v4l2_get_link_freq: Link frequency estimated using pixel rate: 
>   result might be inaccurate
>   v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ
>   in the transmitter driver
> 
> Handle it as no-op since link frequency is fixed per mode and
> not meant to be changed at runtime.
> 
> Avoid these warnings when control is queried.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  drivers/media/i2c/ov5647.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 6a46ef723..a5a9cff5a 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -999,6 +999,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_write(sensor->regmap, OV5647_REG_HTS,
>  				sensor->mode->format.width + ctrl->val, &ret);
>  		break;
> +	case V4L2_CID_LINK_FREQ:
> +		ret = 0;
> +		break;
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
>  				ov5647_test_pattern_val[ctrl->val], NULL);

Can you instead turn the first if () in the function into a switch and
handle this there, too, returning zero on the LINK_FREQ control?

-- 
Regards,

Sakari Ailus

