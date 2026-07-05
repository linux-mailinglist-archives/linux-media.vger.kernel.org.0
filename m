Return-Path: <linux-media+bounces-66617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWGvF8n7SWr59AAAu9opvQ
	(envelope-from <linux-media+bounces-66617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 08:38:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D777092A1
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 08:38:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Mi7IP7mb;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66617-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66617-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A843012D37
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 06:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F983101A0;
	Sun,  5 Jul 2026 06:37:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05716F27F;
	Sun,  5 Jul 2026 06:37:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783233459; cv=none; b=JIcV8VBZ7AdrjN/UHLE4Dwuh7Phx4EbqFOwAAleILNNcqURQiGfZjVYtWjLJFLeLOqR3Rmme5nni7vpANjGFQYLiyQA7FXLVhFvIRB2C0uYk6jXkiWmXyGVop4HTb3KxcamDoAc7CKwHFncYWGVV0kj59wrNVF2Lyc4TQx5Nf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783233459; c=relaxed/simple;
	bh=4vuzAAxkPHQbadfCupg+Gmf6KCz6n9/sa/42MxG25nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF9ilbOKaI8XPq+5q9cqPdTW/y1NnQ1Z0j3sgQND6H4nqioYp5MJltpLhBHN3ZX6Blxt82vnDZ6nPWsvavNBzZ31I3HAnzWXAm2chkw+yZsO6rJYFmYCpJvzybwotxHb4PC1C2/51FhdvznLJFXfIcM0BxHZ3KhwV3++UR4Iw38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mi7IP7mb; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783233458; x=1814769458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4vuzAAxkPHQbadfCupg+Gmf6KCz6n9/sa/42MxG25nU=;
  b=Mi7IP7mbum2KqLhuRCLSOdoC5sl4/CXdDqvswYrqTzA6qneF77bEKeta
   ax3Y+ObR+2iUOU4zCB33UIDbk0LJWXdemaUdTNZT44JzJ4qjdBJaP8wNb
   bkzHvMXXHZHBLOWgOWjiDYFX7exLmVFGiSRmGvlpoEGDHF0PUKDUhlL+/
   KSUYlBQZjtoPxi/oXCDoeDvzPqxEAoS5Kg2nrt5zNdCRexjOT7e14rLjz
   /jpT961yWm/TfHn/B0HPKv9+NUgVtuBrwjJtuiNWtweDJLG3FZPwjmsq/
   h0h4RnbTtDsyA+23tuxh3IsG8FOKNwNp+oiOvL0TbrSHQF2TU6qY5YOPM
   A==;
X-CSE-ConnectionGUID: 2ul1SpveT3OcEZqRr+FldA==
X-CSE-MsgGUID: h5CebFSTRjehD+3sZR2Xdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="84092351"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="84092351"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:37:37 -0700
X-CSE-ConnectionGUID: pN7CQ+ctRRu3fdJKv2NgSw==
X-CSE-MsgGUID: xpFbnbdOTo2e73OTQz//9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="257000520"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:37:35 -0700
Date: Sun, 5 Jul 2026 09:37:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com,
	matt@mattwardle.net
Subject: Re: [PATCH v2] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <akn7rISgJJeFbOWS@ashevche-desk.local>
References: <20260705043920.105252-1-nealpatalay0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705043920.105252-1-nealpatalay0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66617-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nealpatalay0@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2D777092A1

On Sat, Jul 04, 2026 at 09:39:20PM -0700, Neal Patalay wrote:
> The original implementation of ia_css_debug_pipe_graph_dump_stage()
> includes an off-by-one error where the original strscpy() size dropped
> characters immediately before newlines. It also allocates over 600
> bytes across multiple buffers on the stack. Address these shortcomings
> and reduce stack usage with a single 256 byte buffer via a new helper
> function, ia_css_debug_build_info().

...

> +static void ia_css_debug_build_info(char *info, size_t info_size,
> +				    int *offset,
> +				    const char *flag_str, size_t flag_str_size,
> +				    int *line_len)
> +{
> +	/*
> +	 * If new line length exceeds max line length,
> +	 * replace the last ',' with a "\\n"
> +	 */
> +	if (*line_len > 0 && info_size - *offset >= 2 &&
> +	    *line_len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> +		info[*offset - 1] = '\\';
> +		info[*offset] = 'n';
> +		*offset += 1;
> +		*line_len = 0;
> +	}

> +	int len_written = scnprintf(info + *offset, info_size - *offset,
> +				    "%s,", flag_str);

The definition should go to the top of the function, there are only a few
exceptions and none is for this case.

Also for the sake of better layering, introduce local variables to track values
of offset and line_len and only assign them at the end.

> +	*offset += len_written;
> +	*line_len += len_written;

So this will become

	int len = *line_len;
	int off = *offset;
	int len_written;
	... // here use only off and len
	*offset = off + len_written;
	*line_len = len + len_written;

> +}

...

> +#define ADD_INFO(flag, flag_str)						\
> +		do {								\
> +			if (bi->enable.flag)					\
> +				ia_css_debug_build_info(enable_info,		\
> +							sizeof(enable_info),	\
> +							&offset,		\
> +							flag_str,		\
> +							sizeof(flag_str),	\
> +							&line_len);		\
> +		} while (0)

There is no need to have do {} while (0) as there is conditional already and the
macro doesn't return anything. Also it's wrongly indented.

The below should work.

#define ADD_INFO(flag, flag_str)						\
	if (bi->enable.flag)							\
		ia_css_debug_build_info(enable_info, sizeof(enable_info),	\
					&offset,				\
					flag_str, sizeof(flag_str),		\
					&line_len);				\

-- 
With Best Regards,
Andy Shevchenko



