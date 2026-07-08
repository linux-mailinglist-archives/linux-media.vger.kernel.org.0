Return-Path: <linux-media+bounces-66955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dti0IUQITmrvBwIAu9opvQ
	(envelope-from <linux-media+bounces-66955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:20:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FEF723163
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:20:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FpUrTgVg;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66955-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66955-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 764B7301AB76
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 08:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F44400DFC;
	Wed,  8 Jul 2026 08:16:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD53AB5B8;
	Wed,  8 Jul 2026 08:16:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498606; cv=none; b=lb6WBGtG2d8nlH4xucxq83h4brrMMXB619VUj1CLpR9IYA62OgOEAvLQo2Q4Wygs45rfZQ/LewNUHClawJRAjlrNS1Tfh7LssjER3sXeKtQzlXpvygdl08j+zG/NdVjlOCFl2YJTN0b13gSua+G/Z2c7wK6E2gGJQBs3HF6IZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498606; c=relaxed/simple;
	bh=X/cYY3AA3gHaHvAOMoeg86Tl80Q/WTJusXG3gpSB01I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fauHtvQEa+BDzhc3I+fukJKc+XLBQZmr4OW1yufqJYXo6IhnW4u1/ITp+Oa4BxF8sME+N85ZUW1kAAVqg3q2w0eoQbryJ2BU1yw6fRosyRf55+fDEI/aJf2b0z2FRUZbI3N0OS3pGx32bbJeIJARbiHrKpHpmoUoh/ZqFFUv8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpUrTgVg; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783498605; x=1815034605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/cYY3AA3gHaHvAOMoeg86Tl80Q/WTJusXG3gpSB01I=;
  b=FpUrTgVgavLuw07cUf07zj2lQKBR24T9P33bGgIW8XzRRUIcRzrtksJQ
   sJt0C560Q2EHgljNZwI/mHWlxd/tY7lfuOryH+gkzOP1FP9YxsKhFLHcK
   C20U2CAuyUdN89nDHVbO4oAbBdDoUnbLhjieeV/igXglLQ3VE0xsVt4KW
   M+1idHpIkaqJcFj4NMmqtp56mJ6oIF1v7Wa0SkUeSUVwj+4t/2v3vjAdB
   zSDsiUcf4IVc4xLaDX7+gzN6raHNG2ihmcZ9yWIejg0vjGsVCZLeMUze9
   ZFqEARIf8ftlR6WMWl8Mmu/yA+KC69uDex+EGO2cP9u2V0UMgck2w5TCQ
   Q==;
X-CSE-ConnectionGUID: +nT72pbqT5iwPfBv8uDMtw==
X-CSE-MsgGUID: ZhMZNFV0QR+dCkqpzDwciA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84253612"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84253612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:16:45 -0700
X-CSE-ConnectionGUID: svCkcXDtRBGvemsFuAwGhQ==
X-CSE-MsgGUID: soPEVB6cR4yvlRbqsQ6LSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284331876"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:16:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7826911FB4A;
	Wed, 08 Jul 2026 11:16:23 +0300 (EEST)
Date: Wed, 8 Jul 2026 11:16:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	dongchun.zhu@mediatek.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov02a10: fix endpoint parsing use-after-free
 and error leak
Message-ID: <ak4HV9dN5GadUeLj@kekkonen.localdomain>
References: <20260613083235.57363-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613083235.57363-1-birenpandya@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:dongchun.zhu@mediatek.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66955-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5FEF723163

Hi Biren,

Thanks for the patch.

On Sat, Jun 13, 2026 at 02:02:35PM +0530, Biren Pandya wrote:
> The ov02a10_check_hwcfg() function calls fwnode_handle_put(ep)
> immediately after allocating and parsing the endpoint. However, it
> subsequently calls fwnode_property_read_u32() using the same 'ep'
> handle, leading to a potential use-after-free.
> 
> Additionally, reading the optional 'ovti,mipi-clock-voltage' property
> used to overwrite the 'ret' variable. If the property was missing,
> 'ret' would become negative, and this failure code would be incorrectly
> returned at the end of the function, causing probe to fail entirely.
> 
> Fix the use-after-free by moving fwnode_handle_put(ep) to the end of
> the endpoint property reading block, and adding it to the error path of
> v4l2_fwnode_endpoint_alloc_parse().
> 
> Fix the error leak by avoiding assigning the result of
> fwnode_property_read_u32() to 'ret'.
> 
> Fixes: cf10e09b9a4b ("media: i2c: Add OV02A10 image sensor driver")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/ov02a10.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> index 143dcfe..53ff86b 100644
> --- a/drivers/media/i2c/ov02a10.c
> +++ b/drivers/media/i2c/ov02a10.c
> @@ -821,9 +821,10 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
>  		return -ENXIO;
>  
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> -	fwnode_handle_put(ep);
> -	if (ret)
> +	if (ret) {
> +		fwnode_handle_put(ep);
>  		return ret;
> +	}
>  
>  	/* Optional indication of MIPI clock voltage unit */
>  	ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
> @@ -832,6 +833,8 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
>  	if (!ret)
>  		ov02a10->mipi_clock_voltage = clk_volt;
>  
> +	fwnode_handle_put(ep);
> +
>  	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
>  		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
>  			if (link_freq_menu_items[i] ==

I'd fix this by moving the fwnode_property_read_u32() before finding the
endpoint. That doesn't involve complicating the error handling.

-- 
Regards.

Sakari Ailus

