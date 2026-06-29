Return-Path: <linux-media+bounces-65978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id McmrE5GIQmo39QkAu9opvQ
	(envelope-from <linux-media+bounces-65978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:00:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A56336DC634
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:00:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=bRl2ewxj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65978-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65978-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1311C3087091
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11903EF644;
	Mon, 29 Jun 2026 14:53:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9243B637C;
	Mon, 29 Jun 2026 14:53:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744808; cv=none; b=AtgpK63xlH7/srJvI7EArxPT1wiPTTz38Rkjc8+X0IT/gnlHdKIBr3cAfXrMoxlHTJqApOhFH9dsDnYbrKKdwvS1+K4+hZt006zyk1S0tmsnQbj6Q4dZCBu7n1L61H4I5HjLDzvS3IiluwXEsYtM4t5eD/latxDKDDYf5n2nHnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744808; c=relaxed/simple;
	bh=QAASA7vVoa8vgutUpkxXK1xcnbnmSWAfDbZBZURSbII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrZhosFduPo+xW1qvk/5fWUOJ2RdwzP9tmKWU0LULhYBu+XTkZRG9tB7dbeWBP8Uodu/N32MVVCWpjBJdnAaOAdMZP4VTPIz5Hla1HBAiWYZzRD+HWO8XNeN9LhpBdGxpVCfa+Dbpbf5M03jqeEbz7LTBJzcqYHy2B0ouStDbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRl2ewxj; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744808; x=1814280808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAASA7vVoa8vgutUpkxXK1xcnbnmSWAfDbZBZURSbII=;
  b=bRl2ewxjNMeQPSYbnFDhdsMyz2q2PlSpgRgGgHvGBn+t2dogv7kd96yY
   RUWvu74wk0rOpFTK4GwtFi+zk9E5fERBaU5IXEcWAeUlZ8ttUZfsOEE2A
   oOPa7xQdjrNbwMool1Y5g5uvs6RQ2BxcOLmVrH1iuSFeoWBVPq6pqJypo
   DEaw6RwO91KiFobMFssLBHg1L1LeeMqEsej56UIAjZ2DaSYPI/4JoiJAX
   Eurg9sNFs7CIz+T5mFN+XeKU7KofpOiTUyCqDyUhZMcMQQ2d4UkiY7KoW
   bB9MlkeT3Sx4vL5bGp494TunXSGjzTohY7sSOj/iCLa9aYjmuUbNI21vf
   Q==;
X-CSE-ConnectionGUID: jrM5mZvrTFSkvMw+UxSjHQ==
X-CSE-MsgGUID: k8b2HKuHTl2CF+3mMbUDTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106229752"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106229752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:53:27 -0700
X-CSE-ConnectionGUID: OIC/MQN+QTG6WUsFabEpEw==
X-CSE-MsgGUID: brbamaLqTdaCoPYw+y8KCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250286574"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:53:25 -0700
Date: Mon, 29 Jun 2026 17:53:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: reject frame dimensions that overflow
 the size calculation
Message-ID: <akKGzfWUgBxnmQ0t@ashevche-desk.local>
References: <20260627110355.27167-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627110355.27167-1-doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65978-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0sec.ai:url,0sec.ai:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A56336DC634

On Sat, Jun 27, 2026 at 01:03:55PM +0200, Doruk Tan Ozturk wrote:
> ia_css_frame_allocate() computes frame->data_bytes (a u32) in the
> frame_init_*_planes() helpers as width/padded_width * height *
> bytes-per-pixel * plane-count, using plain unsigned arithmetic with no
> overflow check, and then hands the result to hmm_alloc().

Translate this from programmer's mess to plain English.

> A large
> width/height pair wraps the u32, so hmm_alloc() returns an undersized

Same, u32 --> 32-bit value

> buffer that a subsequent copy can overflow.
> 
> Reject up front, in ia_css_frame_allocate() (which already returns
> -EINVAL for bad arguments), any dimensions whose worst-case byte count
> cannot be represented in the u32 data_bytes field. The factor 16

Same here, 32-bit field (no need to even mention data_bytes, it gives just
a noise to the reader).

> conservatively bounds the largest per-pixel multiplier across all
> supported formats (up to 6 planes, or 3x RGB planes with up to 4 bytes
> per element).
> 
> The most directly user-influenced caller,
> atomisp_v4l2_framebuffer_to_css_frame() (S_ISP_FPN_TABLE), is currently
> gated off by 2b7eb2c5dc72 ("staging: media: atomisp: Disallow all
> private IOCTLs"), and other callers pass driver-derived dimensions, so
> this is defense-in-depth on the shared allocator rather than a live
> userspace overflow.

> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Intel atomisp
> hardware required).

This paragraph is not anymore required and considered a noise in the commit
message. Comment block is perfectly fine for this...

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Assisted-by: 0sec:claude-opus-4.8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---

...somewhere here.

>  drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 6 ++++++
>  1 file changed, 6 insertions(+)

...

>  	if (!frame || width == 0 || height == 0)
>  		return -EINVAL;
>  
> +	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
> +	    check_mul_overflow(bytes, 16u, &bytes))

What does 'u' give us here?

> +		return -EINVAL;
> +
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>  			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
>  			    width, height, format, padded_width, raw_bit_depth);

Shouldn't we dtrace still the error cases? Wouldn't be helpful in debugging?

-- 
With Best Regards,
Andy Shevchenko



