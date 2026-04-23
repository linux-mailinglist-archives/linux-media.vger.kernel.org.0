Return-Path: <linux-media+bounces-59441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDsGHnSJ6mk00gIAu9opvQ
	(envelope-from <linux-media+bounces-59441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 23:04:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EB457A0D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 23:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 671473007A53
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF79D3537DB;
	Thu, 23 Apr 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLp9srzv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1602241139;
	Thu, 23 Apr 2026 21:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978283; cv=none; b=tI1sEjVgx8wh0ptzHKoeQ73U2FbYmdbLuwEMFqnimKZR2h04DjJfE9X7voDn2Cb2L5sfIxA0IBYh1b4FiwaUIiS3MgBShntSzAeXtL6kqd5GiMWoyfyHgF2RDpJyeNEF/aoK2+XfQvcxkqsvhmlvq4IbeqXQALCoR26gwdGGdwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978283; c=relaxed/simple;
	bh=jaKzKyt6SRXWq4CcK47RKdPToKtw6RuCE7nYx5/rsZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfP8qtdMNMYAb6n9RaK+kUQQ/ub5jttnaQYRhW17PFVnEEXulFaNVh3pshOYa3hjCnobY7St7kYVKtq+PUrPF50ezi8gWeBN9ucNvbcLbEz8oyUM2/hH5EqQ46Il4Bi5KtlWYFs7vmXoILawxKiI6oziJUQhQdu8pAfKWGnTDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLp9srzv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776978281; x=1808514281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jaKzKyt6SRXWq4CcK47RKdPToKtw6RuCE7nYx5/rsZQ=;
  b=BLp9srzvtjnk2/AjEsyTiNaWUiqcPpg+4r+5rT12K83rWCr0HRtqmDHG
   VtA/rf4MW2z4lfbRcN+/5yb0KlqLelcovSEmPZNcmhH8+2RMZ/enYjlYC
   KeBg0FyYD6jHyk7WkcYvXfgQnG/MuE7f3RVNAU37G1ASfaVsFcHVknDi0
   c+Sq0SkZL2PMguQKREHz/Q45VxgUmcaqyirNS551ywNPI6Yfy7of8Iewy
   Sw8UouCKqEA1vC8i4a+S6qhUQ07k5UF8ZwHJ5rxoyoEeN7A6qgW6KGdE4
   xiN0cVI47wFaYDeCE5SXaScwBNnZFggbVNDBFnD1sCl8WWvKQXxzmLqxl
   Q==;
X-CSE-ConnectionGUID: CZTfdJGQR/G9+A9aW6ZYYA==
X-CSE-MsgGUID: LZumcn79TXWJTtmTWCmUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77868663"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77868663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:04:40 -0700
X-CSE-ConnectionGUID: D28YbYwdR9Cb7TzLnyStNA==
X-CSE-MsgGUID: ANd5gV++T4+zyAhzXwqq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="234545627"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:04:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2BA8411F94F;
	Fri, 24 Apr 2026 00:04:38 +0300 (EEST)
Date: Fri, 24 Apr 2026 00:04:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johts <johatanrlima@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, regkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: media: atomisp: pci: runtime: debug: src:
 remove curly braces for single line if
Message-ID: <aeqJZljd2ACrsIcb@kekkonen.localdomain>
References: <20260423184543.109954-1-johatanrlima@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423184543.109954-1-johatanrlima@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59441-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 766EB457A0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Johts,

On Thu, Apr 23, 2026 at 03:45:40PM -0300, Johts wrote:
> Fix checkpath error "WARNING: braces {} are not necessary for single statement blocks" in sh_css_params.c:1931
> 
> Signed-off-by: Johts <johatanrlima@gmail.com>

We need a more specific name here.

> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index fcebace11daf..31426001864e 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -1928,10 +1928,8 @@ sh_css_set_per_frame_isp_config_on_pipe(
>  	params = stream->per_frame_isp_params_configs;
>  
>  	/* update new ISP params object with the new config */
> -	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
> -		err1 = -EINVAL;
> -	}
> -
> +	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))	err1 = -EINVAL;

Please run checkpatch.pl on this.

> +	
>  	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
>  
>  	if (per_frame_config_created) {

-- 
Regards,

Sakari Ailus

