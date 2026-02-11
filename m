Return-Path: <linux-media+bounces-52570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCeXLqQ5jGlZjgAAu9opvQ
	(envelope-from <linux-media+bounces-52570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:11:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE35122178
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D2FF303983A
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 08:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5707234FF71;
	Wed, 11 Feb 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpqvuFzV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70AA26F288
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797470; cv=none; b=tq3MA6HlH/43viubDlFam+7xS/IvqbqL9MqSeyFd24vfiYAS61M95MN7Fh/Y7JljMiV3Zi8C1FGYVobDvCXrJ7aDWpnB+R/2atPXAGqHHf102pY3JOWDkYREnabvqVV1L+j2qEosMXS2ldHWWr4LCA2aZz3146FOPyTYE79W8/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797470; c=relaxed/simple;
	bh=vEWtSjI7oE3dEQMS8DNtczztK7/1TVIR72DOtPCM4x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEnaUnrJY+bzDt1AEeEqh3Llr7G2nqBU4lyDeX8rOoKslXzLVTXwmKnqltSqmHho53jdjr9D1IYrEiMTuiChMZZjAvTVPpjmcD76FuJjggr7/bXCCKzNbyXTBrHqTnOW4NRb7Jl4m5Z6Eq/ezdotGRdUb/W7KADtbxvD5BKOVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpqvuFzV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770797469; x=1802333469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vEWtSjI7oE3dEQMS8DNtczztK7/1TVIR72DOtPCM4x4=;
  b=fpqvuFzVPy9eYWA9+jl/UNjzU0HjIXvvvOdMMCAQT/1FVy5J4s9C+8KQ
   zkCrp6/bK2ALGFW55kt702WN4669v+Cpds/ZDgqMfb6pxbsT6bpAiwFfG
   o5/n70NLd+slWOQoSCXG6PCHTF8ATJ5RO6d4fxZ38kYE4+v4blJY1TrCy
   YUZCmZ0Cf25S0ZLZrxpvRUNjAqEb+Sy9BjiKu9hFK+l+W4JG2UvF4R+hg
   96pdd8/YnK436+4vfHRww4Z3lXWwE0S1Tu1y792aTxWCO/oh1vQNvBfq8
   fFfbnhWq9KWbWQVEHQhX5CswTTx+gXTAFsA/1uxPM8Ay9x8E1cVrRwdZv
   w==;
X-CSE-ConnectionGUID: 1iS8jpXFTRiPMLfHhURRZQ==
X-CSE-MsgGUID: sMIqW4x+SJilJsKgCurf3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75563961"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75563961"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:11:09 -0800
X-CSE-ConnectionGUID: OhKjo5noQY6SfyiMwvqpzQ==
X-CSE-MsgGUID: Oxr2ZQwTRBqg550PGPWlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212264951"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:11:08 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F1009121D36;
	Wed, 11 Feb 2026 10:11:23 +0200 (EET)
Date: Wed, 11 Feb 2026 10:11:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: soufianeda@tutanota.com, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYt-vrc7h7CJOmSu@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52570-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 1FE35122178
X-Rspamd-Action: no action

Hi Dan, Soufiane,

On Tue, Feb 10, 2026 at 09:53:50PM +0300, Dan Carpenter wrote:
> On Tue, Feb 10, 2026 at 04:26:31PM +0100, Soufiane via B4 Relay wrote:
> > From: Soufiane <soufianeda@tutanota.com>
> > 
> > Validate sizeimage against the allocated frame buffer size before
> > hmm_store() to prevent out-of-bounds write.
> > 
> > Signed-off-by: Soufiane <soufianeda@tutanota.com>
> 
> We need a Fixes tag if the bug is real.
> 
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > index 3a4eb4f6d3be..ca7ffc7855ac 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > @@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
> >  		goto err;
> >  	}
> >  
> 
> There is some sketchy stuff happening in this code but I'm not sure I
> understand the issue.  The code looks like this:
> 
>   3317          /* Note: the padded width on an ia_css_frame is in elements, not in
>   3318             bytes. The RAW frame we use here should always be a 16bit RAW
>   3319             frame. This is why we bytesperline/2 is equal to the padded with */
>   3320          if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
>   3321                                         sh_format, padded_width, 0)) {
> 
> This allocates res.  Why would it allocate something smaller than
> arg->fmt.sizeimage?  How did you find this bug?  By testing or reading
> the code?  Do you have a reproducer?
> 
>   3322                  ret = -ENOMEM;
>   3323                  goto err;
>   3324          }
> 
> > +	if (arg->fmt.sizeimage > res->data_bytes) {
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> 
>   3325  
>   3326          tmp_buf = vmalloc(arg->fmt.sizeimage);
>   3327          if (!tmp_buf) {
>   3328                  ret = -ENOMEM;
>   3329                  goto err;
>   3330          }
>   3331          if (copy_from_user(tmp_buf, (void __user __force *)arg->base,
>   3332                             arg->fmt.sizeimage)) {
>   3333                  ret = -EFAULT;
>   3334                  goto err;
>   3335          }
>   3336  
>   3337          if (hmm_store(res->data, tmp_buf, arg->fmt.sizeimage)) {
>                               ^^^^^^^^^
> The worry is that the buffer this references is too small.  I would
> prefer instead if there were some bounds checking before the memcpy()
> calls in hmm_store().  They would use a different, smaller limit if
> only part of the buffer could be used.  I don't know if that bounds
> checking is really required though...

Indeed. Beyond that, even I have to admit I have little idea what this
IOCTL is supposed to be doing. Possibly feed in a raw frame for processing?
But that's not supposed to be implemented like this... The TODO file
contains an entry that says "Remove/disable private IOCTLs" -- we should
move to use parameter buffers instead.

I'm not sure anyone depends on these IOCTLs at the moment, but definitely
some obviously are associated with some risk.

The world looked different when this code was written.

I'd disable all private IOCTLs in the driver, with the possible exception
of ATOMISP_IOC_S_ISP_PARM, which is close to the parameter buffer approach
already.

Also cc LMML, Greg and Andy.

-- 
Kind regards,

Sakari Ailus

