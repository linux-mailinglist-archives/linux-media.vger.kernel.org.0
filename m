Return-Path: <linux-media+bounces-60175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IdVA/229WkbOQIAu9opvQ
	(envelope-from <linux-media+bounces-60175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 10:34:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 636B04B174B
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 10:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C24D3301ECD9
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 08:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC933090D5;
	Sat,  2 May 2026 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzXlBRxT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705E13E02A;
	Sat,  2 May 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777710829; cv=none; b=mM9cqkipYy0E7i8Z/2ghJxMtCEojArJPyDJKmhNXqYPwYcj2HIJVtdzxURMd1WfU9tA89opWOPvpjVpw643plBKn5JLjE2XQl+2rl8jIPjDWFSuj/SDC4kUKPbGZmK1aqQnD+y7OIzEyiIur/xa1yw6sppY4VtRT/j30rMcWKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777710829; c=relaxed/simple;
	bh=VB19/zkvBY4xE5+EFo2uc+xPeEKE+LR6F/7J/kXudpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URCE3qoUfPYJCg5s4kB97hLuNoJj40e2pN+9iCWEOcY8I6CqeY5eShqPIMDXWm4xt22zdnohFB8hLk1yonZZrSbrAqivU1DXrL1u0Zp2C5hSP3rMHzLKR3f49ddi5YZRIy1gMJdw8M/ro15+kAt5IXailPqPAok6g9B7pZlQe8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzXlBRxT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777710828; x=1809246828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VB19/zkvBY4xE5+EFo2uc+xPeEKE+LR6F/7J/kXudpQ=;
  b=DzXlBRxTBcllEb7i2u1F2jYRoOGvgbxXoc5dG4InOm796RIxpBxdwbug
   CK69tn3s8QWtw0zTw/nlnS/Xl9gMvhX3yn9TCMaR/EAfbjKRJgbHaMcQG
   UGDPy3sLx3sL6sOMHV59xjLunEdAqeqowbGYmqmtbEywi9PAkogdfB+e8
   7KdZI+m9D091ICwQV0blqb1lPME6CAC47HMyLOQ5MGUOeIjwsMoseyenS
   EX1Nb/DA4wOwiAVTvhZkqb09WYV3y1GooGwS7mrHwR2feFJxE0o/4J0QI
   /Hokka1vfQCMSjhrUi2K0oMugtJpfONvmSq/Mnro+xm4akjfjioYhP7qc
   Q==;
X-CSE-ConnectionGUID: ykPRgR90Svuy5vmixU6CaQ==
X-CSE-MsgGUID: 1+Yu20EMR0G2y7HkxShd3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="90118303"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="90118303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 01:33:47 -0700
X-CSE-ConnectionGUID: vRDo2F4lQWyYv5MGV7zEDA==
X-CSE-MsgGUID: dFphSG4bQcezPYqRcEa+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="273163945"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.18])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 01:33:45 -0700
Date: Sat, 2 May 2026 11:33:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shirin Kaul <shirin.kaul11@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: isp: xnr 3.0 fix whitespace issue
Message-ID: <afW25ktg74Xfae-B@ashevche-desk.local>
References: <20260502082516.16302-1-shirin.kaul11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502082516.16302-1-shirin.kaul11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 636B04B174B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60175-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

On Sat, May 02, 2026 at 08:25:16AM +0000, Shirin Kaul wrote:
> Fix spaces by replacing them with tabs in function calls to comply
> with kernel coding style.

...

>  static const s16 a[XNR3_LOOK_UP_TABLE_POINTS] = {
>  	-7213, -5580, -4371, -3421, -2722, -2159, -6950, -5585,
> -	    -4529, -3697, -3010, -2485, -2070, -1727, -1428, 0
> -    };
> +	-4529, -3697, -3010, -2485, -2070, -1727, -1428, 0

Leave trailing comma, as it's not a sign that this array has a terminator.

> +	};

Wrong indentation.

...

>  void
>  ia_css_xnr3_encode(
> -    struct sh_css_isp_xnr3_params *to,
> -    const struct ia_css_xnr3_config *from,
> -    unsigned int size)
> +	struct sh_css_isp_xnr3_params *to,
> +	const struct ia_css_xnr3_config *from,
> +	unsigned int size)

It's half-baked solution. Moreover there were handful of patches (better than
this one) to address the same, please, study preexisting work (linux-media
mailing list archives is for your help).

-- 
With Best Regards,
Andy Shevchenko



