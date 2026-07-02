Return-Path: <linux-media+bounces-66326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W6GkFZkwRmqyLQsAu9opvQ
	(envelope-from <linux-media+bounces-66326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:34:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 289CB6F54E6
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:34:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=hOQnhu3g;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66326-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66326-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DC61307AC68
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 09:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEB447886A;
	Thu,  2 Jul 2026 09:11:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4E477E39;
	Thu,  2 Jul 2026 09:11:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983493; cv=none; b=odR9vHPPpmradeYfyB7Le79ZauhD5nV01kYnGmXsHfdXN9uMU0TjV9M7hUc7WY4LPFjk4K1WDcUQsXMOZ/J5QSK/Ye/TI+qv72R5qx7TXLFoz0e3I3KaYQRmgNqM52sZgEPasErij+wyRTy2Tged0NLWMWmbMf8sNhZmFVNvK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983493; c=relaxed/simple;
	bh=+6+2Gtv3J7twi+rS0zG/CqH3gWpYxv3wEpI2S3XVscg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbvybAqBHljLQCKhruXwleBMY/COqOo+WF1iQnBYtizlyKrvB7AsywBjPJ7gTq1GIMSvyDlxx5BCmrkwZaJ8iFfezeFp7W28p+SJaY+fKApOW0nTZDAnVJJFeEx6/qySmwJMbR4ontF3HdzHbRFHbkLV1Smum+HwIq0BrElYflk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOQnhu3g; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782983492; x=1814519492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+6+2Gtv3J7twi+rS0zG/CqH3gWpYxv3wEpI2S3XVscg=;
  b=hOQnhu3gtHVWkghmjG4UXYmyzFlZKtxuOOwHoCXx8ilZ5veqQWnKevhL
   2omHkXaiH0wDFbNKXa1VwORCMUDzfJLtwLpLsKo+w8IYHE079PSTxmlFH
   Jc9aWExPBWkDxNTcljiB0TJ3gqNXMCjOzZuN2wputSXmErutOV/8Op30H
   KYMhuGaxoyqSBX2n3LHmc1YYwOUGH87YF3OMupoWGqIxRCG8SDj1pc4Rw
   Zlh0V9mN/sZ4G/LImB/xuKO377kPe758HNU9saZhPET+B6L/W6v5TBImi
   G77M8CVaqYeGLS4BUNoDclBFJST8Y8KwpLiUomVvDygGuv6AbytjAWs8o
   g==;
X-CSE-ConnectionGUID: zzjD11w/SAmcqZpd0uvuPw==
X-CSE-MsgGUID: N/mIIrtlQsSwR85c/pV3AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="86274180"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="86274180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:11:31 -0700
X-CSE-ConnectionGUID: XPQUzaVDT1q8OI0Rwts8EA==
X-CSE-MsgGUID: j27zpbaLQm6b1iriI7tHrA==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:11:28 -0700
Date: Thu, 2 Jul 2026 12:11:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, matt@mattwardle.net,
	error27@gmail.com, mugrinphoto@gmail.com
Subject: Re: [PATCH] staging: media: atomisp: refactor pipe graph dump stage
 formatting
Message-ID: <akYrPsbQnjPfAPkq@ashevche-desk.local>
References: <20260701161534.31152-1-nealpatalay0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701161534.31152-1-nealpatalay0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66326-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nealpatalay0@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:matt@mattwardle.net,m:error27@gmail.com,m:mugrinphoto@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,mattwardle.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 289CB6F54E6

On Wed, Jul 01, 2026 at 09:15:34AM -0700, Neal Patalay wrote:
> The original implementation of ia_css_debug_pipe_graph_dump_stage()
> includes an off-by-one error where the original strscpy size dropped

strscpy()

> characters immediately before newlines. It also allocates over 600
> bytes across multiple buffers on the stack. Address these shortcomings
> and reduce stack usage with a single 256 byte buffer via a new helper
> function, ia_css_debug_build_info().

Thanks, this is useful! See my comments below.

> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

Nope. Find the actual commit in the history.

...

> +static void ia_css_debug_build_info(char *info, size_t info_size, int *offset, bool flag,
> +				    const char *flag_str, size_t flag_str_size, int *line_len)
> +{
> +	if (flag) {

So, this makes code much better if

	if (!flag)
		return;

BUT, the usual way of such functions is to make check in the caller(s) and drop
this "flag" completely.

> +		/* If new line length exceeds max line length, replace the last ',' with a "\\n" */

The media subsystem is quite strict about 80 character limit, this line way
too long.

> +		if (*line_len > 0 && info_size - *offset >= 2 &&
> +		    *line_len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> +			info[*offset - 1] = '\\';
> +			info[*offset] = 'n';
> +			*offset += 1;
> +			*line_len = 0;
> +		}
> +
> +		int len_written = scnprintf(info + *offset, info_size - *offset, "%s,", flag_str);
> +		*offset += len_written;
> +		*line_len += len_written;
> +	}
> +}

...

> +#define ADD_INFO(flag, flag_str) ia_css_debug_build_info(enable_info, sizeof(enable_info), \
> +		&offset, bi->enable.flag, flag_str, sizeof(flag_str), &line_len)


Use logical split and make this all to be shorter.

> +		/* Build string in enable_info buffer */
> +		ADD_INFO(reduced_pipe, "rp");
> +		ADD_INFO(vf_veceven, "vfve");
> +		ADD_INFO(dis, "dis");
> +		ADD_INFO(dvs_envelope, "dvse");
> +		ADD_INFO(uds, "uds");
> +		ADD_INFO(dvs_6axis, "dvs6");
> +		ADD_INFO(block_output, "bo");
> +		ADD_INFO(ds, "ds");
> +		ADD_INFO(bayer_fir_6db, "bf6");
> +		ADD_INFO(raw_binning, "rawb");
> +		ADD_INFO(continuous, "cont");
> +		ADD_INFO(s3a, "s3a");
> +		ADD_INFO(fpnr, "fpnr");
> +		ADD_INFO(sc, "sc");
> +		ADD_INFO(macc, "macc");
> +		ADD_INFO(output, "outp");
> +		ADD_INFO(ref_frame, "reff");
> +		ADD_INFO(tnr, "tnr");
> +		ADD_INFO(xnr, "xnr");
> +		ADD_INFO(params, "par");
> +		ADD_INFO(ca_gdc, "cagdc");
> +		ADD_INFO(isp_addresses, "ispa");
> +		ADD_INFO(in_frame, "inf");
> +		ADD_INFO(out_frame, "outf");
> +		ADD_INFO(high_speed, "hs");
> +
> +#undef ADD_INFO

Instead of doing this way, consider making an string literal array and just
loop over it. This might need to reconsider representation of those flags
as well. Yet, don't come to the conclusion, you need to try and see which
one is better. The current approach is okay if my suggestion will look less
readable.

-- 
With Best Regards,
Andy Shevchenko



