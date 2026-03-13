Return-Path: <linux-media+bounces-55630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBCsNqnbs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:40:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E44280A69
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58532308C2D6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477572D879F;
	Fri, 13 Mar 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDcyOZuf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1203803D3;
	Fri, 13 Mar 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394834; cv=none; b=m+IbqBPBp53B6QVMvDN2G5CdysOevN+Cp4geY6MM08m303H3MBw2LB52ldJiN0UD/8275E7tBmCYuuwztS/DG7EkmAJQmynUiy7SXA+dx+jRX8Q44gp0ocT12Pcsk2YcbDz2vYNwLAkhF7FaTgkqu25cDDWFdL0FmPRGWhzI79s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394834; c=relaxed/simple;
	bh=PKid/O3nFVSOJKWTwoN29bxeykDQNTfNr4KV8J7XO14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/yZsQYstuWNqHOJJUM8/dnXAmwp/1/XsWfIwjvS8wECR0P7oD8hfPu+ptDf47dnd7lJFlBpgVMasx98glLThFq77IP9IktyVYYWYah+tFZgV499tF9SOHRWx4Y4hh91L6bl96+qp+6BJNwLI6zexXYPy89HSDah+8BhVl4bFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDcyOZuf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773394833; x=1804930833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PKid/O3nFVSOJKWTwoN29bxeykDQNTfNr4KV8J7XO14=;
  b=dDcyOZufxkVnafHxSrOhSdoMW62vuqsQtApqznwUXy1VfDwBGj/2ztpH
   Vvz2IZ1kA1t8ZgaPoGRaaEApt722UrlbvioOErPLRkOhMUL19gNAlw+wN
   3I4QaNnEX2h5wfrf4V3Y0bYmXl2Mp+6XP9l2gqM0DCou32qzBg+XPho+u
   hBYaRf+i2lhHtAeHd/zo3YaWn5dShSW50DvscQ7EpEeAlWqXXC9ye0wjv
   8Zu4ZfcZvHl6gHmKyzBcKzoIkz373LJxSBN0ZRdZdPskKz8d8EsIm6x3P
   tAnlRVrbZBtrPbvdTbTXQ/ktQGfJeLCIZtK+zSoqdSAGa71qKwBaikqUC
   A==;
X-CSE-ConnectionGUID: AtUapy9BQmqT3ZsmftznRg==
X-CSE-MsgGUID: 1qgZiXSJQwug2IJuB95SqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74467752"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74467752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:40:32 -0700
X-CSE-ConnectionGUID: BsR8Df9oQpiRkmtM8ITYeQ==
X-CSE-MsgGUID: dGYP2ohCQWOgeR/QicWjiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="244137826"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:40:30 -0700
Date: Fri, 13 Mar 2026 11:40:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lin YuChen <starpt.official@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: use kmalloc_array() for
 sh_css_blob_info
Message-ID: <abPbjHO5FLvnVIte@ashevche-desk.local>
References: <20260312210801.8416-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312210801.8416-1-starpt.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55630-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43E44280A69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:08:01AM +0800, Lin YuChen wrote:
> Replace the open-coded multiplication in kmalloc() with kmalloc_array()
> to provide overflow protection and improve code readability.

...

> +		sh_css_blob_info =
> +			kmalloc_array((sh_css_num_binaries - NUM_OF_SPS),

Too many parentheses.

> +				      sizeof(*sh_css_blob_info), GFP_KERNEL);
>  		if (!sh_css_blob_info)
>  			return -ENOMEM;

-- 
With Best Regards,
Andy Shevchenko



