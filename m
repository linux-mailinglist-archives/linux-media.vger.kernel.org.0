Return-Path: <linux-media+bounces-58235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKlSKEBn1mnIEwgAu9opvQ
	(envelope-from <linux-media+bounces-58235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:33:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1042D3BDB31
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A6B73032F78
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC82B1FC0EA;
	Wed,  8 Apr 2026 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ginFHfTD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8D3A8744;
	Wed,  8 Apr 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658591; cv=none; b=OgeJnhtht6dGGsm0dlXeMZFgPUeFhu/mgO3Kil+uUzxIOL8HEKsK/JYAZIE0GMtUZBrDu+TNUAn1xSyKQMtO5AV0h8WnXDJg2Ma3jituKOpge9sDJL7FR0sr/qR03O3nNmJPabB+7Ih834eBzcok6MGNYHSFZ0cyDkfHWcsBZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658591; c=relaxed/simple;
	bh=GAP/DMpZr8A4ie5pXw4wqMwLJbxOUwnvPgOfhYRCVg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPtbLFaF22T7g/zpW2N/qg+sdN24parb890XFkS4jRrZdiiHzDBFDOCraMzgUeZxmz6tfTIAfcqyVzeYl+IYEE0dlW3k8ddByzvw34S5Wpni/S3opjTfBBRp1kLA2Wpiq/kwyjl5ASphsiO9h7uUgRi5bYWz7q1xERVH4MzobrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ginFHfTD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775658589; x=1807194589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GAP/DMpZr8A4ie5pXw4wqMwLJbxOUwnvPgOfhYRCVg0=;
  b=ginFHfTDxHRr9vSfW87PGcVjUwsV7po2fkZTZvjduf15rYijVgnKHCOu
   ilJfUdHKrry1cAW5wZV3u65D9DFJ8ZzWvrbFtPblIjc0LwNbBcMphbKM0
   nLOwKTrJ+kEzpieG7uOLuCN81fedCUVSFWjijrMDpFLtvbTrzATYS+OcE
   Ajqp0ajXsvp8CJ7MyHX/rY7JzCQK7bUGtM1KSdM18Cux+g6I0CdsL2vpV
   7LbqmisQbUXkKGc9V2ErTcbcAgriN6466KjNd0EzWHffvOWU9If1NVKab
   c4dYiVtmervPuOPh/O4TSzTNwZ1yBJG092+DjI1plyIfh1g6xQp4zDgo0
   A==;
X-CSE-ConnectionGUID: +nRRIe6CQpONyVNQ7MHdSg==
X-CSE-MsgGUID: HLA/qIDTTziQsyjabASfGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76716903"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76716903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:29:49 -0700
X-CSE-ConnectionGUID: 3M4FIUerR8eqJHP3ra24fA==
X-CSE-MsgGUID: GcSX3ng7S5KHCwbnaBXDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="266470038"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:29:48 -0700
Date: Wed, 8 Apr 2026 17:29:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
Message-ID: <adZmWZ0SXRhHPyQ9@ashevche-desk.local>
References: <adUeywfiQzZ5JgEd@ashevche-desk.local>
 <20260408134612.1380-1-joshua.crofts1@gmail.com>
 <adZlX-5rx0jtIMpD@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adZlX-5rx0jtIMpD@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58235-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 1042D3BDB31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 05:25:39PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 08, 2026 at 01:46:11PM +0000, Joshua Crofts wrote:
> > Since the atomisp driver concerns transferring video
> > data, it would probably be better to use an iov_iter
> > than copy_to_user calls (scatter-gather i/o and better
> > pointer safety). Per yesterday's emails, I'm sending an
> > an example of a function in atomisp_cmd.c where I've
> > implemented iov_iter usage.
> > 
> > Note, this isn't a patch, more of a question whether this
> > style of changing the copy_to_user calls is valid (or if
> > I'm writing garbage code). I'd rather get your opinion
> > than submitting a patch first.

Sure, see below.

...

> > -	ret = copy_to_user(config->data, asd->params.s3a_user_stat->data,
> > -			   asd->params.s3a_output_bytes);
> > -	if (ret) {
> > -		dev_err(isp->dev, "copy to user failed: copied %lu bytes\n",
> > -			ret);
> > +	ret = import_ubuf(ITER_DEST, (void __user *)config->data, asd->params.s3a_output_bytes, &iter);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (copy_to_iter(asd->params.s3a_user_stat->data, asd->params.s3a_output_bytes, &iter) != asd->params.s3a_output_bytes)
> >  		return -EFAULT;
> > -	}
> 
> It doesn't change any architectural decision here. Basically you need to have
> s3a_output_bytes to be already iov_iter at this point. So, import_ubuf() has to
> happen somewhere else.

Brief grepping shows this

        /*
         * Intermediate buffers used to communicate data between
         * CSS and user space.
         */
        struct ia_css_3a_statistics *s3a_user_stat;

which suggests that iov_iter should be somewhere here, in the struct
atomisp_subdev_params. But you need to read much more code and get familiar
with this. I wouldn't expect any meaningful change by a few days, maybe by
a few weeks as this driver is quite complicated.

In any case, thanks into trying with this, will be very appreciated
when the task is logically finished.

-- 
With Best Regards,
Andy Shevchenko



