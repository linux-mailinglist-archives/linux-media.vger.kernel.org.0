Return-Path: <linux-media+bounces-58858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLXEArKY4GlMkAAAu9opvQ
	(envelope-from <linux-media+bounces-58858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:07:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E2B40B530
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12D5F30142A7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8EB38D6A4;
	Thu, 16 Apr 2026 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQnvF0+Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0BD379996;
	Thu, 16 Apr 2026 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326825; cv=none; b=bAsxW9FoWk0c1sqZtkugPJgZl3XhMzzKVCYr7UpshtmTHVR3wPsBoH6+CsvXonc1NWtWY9YERHOQ8Du96MOj7IJBsYH2v2e/4ijXVURiHZuEaEMarA+KkuLRt0RUvqCgPhPksb5+/pAv3hNsf3/lzRRdQ+gqg+3ygmUnwG6GMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326825; c=relaxed/simple;
	bh=pezVG2mLXqKfjCCLMLroYv/ECTsZBOaIgobPes3w94c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSLB2cuI1/Sa/phfK6GtT4o5QSqUIbDccD49zqi9gdJpha9bhcamFrNkgcxFT57r3Yhwm58QxVvz4Hn6yvXYOykmNGgQxeZzsMAHH3gDaT7JRDqKqnpmvkRWGwX1x57lucekeeTU0aHgAlO2X+YltOzQomF70z0CMoyxpBhESc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQnvF0+Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776326824; x=1807862824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pezVG2mLXqKfjCCLMLroYv/ECTsZBOaIgobPes3w94c=;
  b=AQnvF0+QxOpKflmLAEKLFiy6XJZsdJsa4B2cZAM7v+uekmh/udllB7I2
   ggI6HspS0XbTW9JUXZKhEoFb7goaX5MFDsC/LM9n9NCcIjbV3KiEMNpKv
   tOQ9k+erfB+X+ofmqRJylHL+s/68lQnn9H9jLd1yKb81xqtpBTkcEyEVV
   ut9ulS57NHZkrAStnaF0uygoAnRlDoiVLA2BiwDOwvavwkg7yHnWPBRCH
   JVAUB1/09iNfiiczXwZHmRbxIX2ZIbRTl98lLmc/9wzQ0DpIP3U/ou2ae
   cWgw90yF9SFugX+SV5QzAt85oaRey2OFPkyZBCquGaNBpp2jGTXoHECIx
   w==;
X-CSE-ConnectionGUID: 1hH/6SfvSlqpb+IbxdMG1w==
X-CSE-MsgGUID: XfSnaMD0Q8CdWv946Ix4rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77193966"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77193966"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:07:03 -0700
X-CSE-ConnectionGUID: VKFpzGFlTHW4U/1UJ2h4Tw==
X-CSE-MsgGUID: 1et1Df5GRsW2AgC6uDefPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="229830265"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.173])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:06:59 -0700
Date: Thu, 16 Apr 2026 11:06:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of
 raw_black_frame
Message-ID: <aeCYoC0le9P0dnkT@ashevche-desk.local>
References: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-58858-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: F2E2B40B530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 02:30:58PM +0800, Huihui Huang wrote:
> Our code analyzer reported a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_cmd.c.
> 
> In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
> atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
> fails, the function returns -ENOMEM directly without freeing
> raw_black_frame. The allocated memory is only freed on the success
> path.
> 
> My patch adds the missing ia_css_frame_free() call before the error

s/My patch adds/Add/

> return, to free raw_black_frame when sh_css_set_black_frame() fails.

...

>  	if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
> -				   raw_black_frame) != 0)
> +				   raw_black_frame) != 0) {
> +		ia_css_frame_free(raw_black_frame);
>  		return -ENOMEM;
> +	}
>  
>  	ia_css_frame_free(raw_black_frame);
>  	return ret;

This is unneeded complication. What you need to do is just replacing if
conditional completely.

	ret = sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
				     raw_black_frame);

-- 
With Best Regards,
Andy Shevchenko



