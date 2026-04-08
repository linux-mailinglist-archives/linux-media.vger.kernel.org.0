Return-Path: <linux-media+bounces-58234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB8VA2pm1mnIEwgAu9opvQ
	(envelope-from <linux-media+bounces-58234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:30:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05C3BDAA4
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 128AC307C2E3
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 14:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301B33D34A8;
	Wed,  8 Apr 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAnhz8GE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872453D3CE3;
	Wed,  8 Apr 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658341; cv=none; b=QBwo9UeCZNPKFXR0Ofk98DjooBIVN5I8l5OAMuT7bisnZPUqu3qbPDNvY5TMROuoAjwIFNAQ/6AHVCE3vBjI1a0dOWC7FhRGnemo693kmavZTuEtLT8uqo2MzWe/+yEKSvew+/oPqi8x81/59WQ1kFXhVZqDPZFOBbh7MqdhR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658341; c=relaxed/simple;
	bh=HbxdEWpKion2p5tDTBOLL9T1ZjhF2lu+mjn3jIdV7EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOFAeyy6TNYtZ2dK52cGFZ/kH4lhdv5dTPNfNrF7rdfar8Ip1LOkG2CInHgC6J53UjvzrEWP3IgeJH9VCA++a3yKPYVuWooip8c0ViV5xe6OhWn6S7qzQMhfl8LlGXIm9FbreKVsSZVt7YA/5+i7DLpt7imnE7VGwXxdnna8z1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAnhz8GE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775658339; x=1807194339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HbxdEWpKion2p5tDTBOLL9T1ZjhF2lu+mjn3jIdV7EY=;
  b=ZAnhz8GEJjxnApU0ezpTspng71ZHvzTc7Su8CXzNh4iJTp3BFuxIIPVG
   1Rl1DdhEWSl1I9H/0BFMjdP9qWDT8PLJM5AMZuukH6oMWcRIaKLA4RwNq
   gsbQO7tld4Q1Fs+I+gsBVx0uYptZfAl3xTcnj/8S0riUhyY9kB/wqFymG
   OQBUGh0bpQMlS4M3xlpQ301f4OAZfabKE0nxy3BbuzvRP6TLk0D8Z2Mu/
   HsL+Xdb6YtFSY5KGRyq2eFK7wFE9QdeTjictdgVjYz80AxlNObYM4CX/i
   FPcELqZ89vePvAHaqvOYq9pGfOU+IyaLidieA3l8zcxP8RbfjCL+/DOqL
   g==;
X-CSE-ConnectionGUID: vbQgu4p7RaKEjNrJjrbFwQ==
X-CSE-MsgGUID: FQ+PMT7YQqqbMpSbxGYp6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76609124"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76609124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:25:39 -0700
X-CSE-ConnectionGUID: 0wTBwd1AQVefPzOLzvPY4Q==
X-CSE-MsgGUID: rRddO660RQm9agaClvVNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="258906705"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:25:38 -0700
Date: Wed, 8 Apr 2026 17:25:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
Message-ID: <adZlX-5rx0jtIMpD@ashevche-desk.local>
References: <adUeywfiQzZ5JgEd@ashevche-desk.local>
 <20260408134612.1380-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408134612.1380-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58234-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 7A05C3BDAA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 01:46:11PM +0000, Joshua Crofts wrote:
> Since the atomisp driver concerns transferring video
> data, it would probably be better to use an iov_iter
> than copy_to_user calls (scatter-gather i/o and better
> pointer safety). Per yesterday's emails, I'm sending an
> an example of a function in atomisp_cmd.c where I've
> implemented iov_iter usage.
> 
> Note, this isn't a patch, more of a question whether this
> style of changing the copy_to_user calls is valid (or if
> I'm writing garbage code). I'd rather get your opinion
> than submitting a patch first.

...

> -	ret = copy_to_user(config->data, asd->params.s3a_user_stat->data,
> -			   asd->params.s3a_output_bytes);
> -	if (ret) {
> -		dev_err(isp->dev, "copy to user failed: copied %lu bytes\n",
> -			ret);
> +	ret = import_ubuf(ITER_DEST, (void __user *)config->data, asd->params.s3a_output_bytes, &iter);
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_iter(asd->params.s3a_user_stat->data, asd->params.s3a_output_bytes, &iter) != asd->params.s3a_output_bytes)
>  		return -EFAULT;
> -	}

It doesn't change any architectural decision here. Basically you need to have
s3a_output_bytes to be already iov_iter at this point. So, import_ubuf() has to
happen somewhere else.


-- 
With Best Regards,
Andy Shevchenko



