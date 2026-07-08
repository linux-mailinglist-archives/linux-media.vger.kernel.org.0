Return-Path: <linux-media+bounces-66956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTqFL80HTmrQBwIAu9opvQ
	(envelope-from <linux-media+bounces-66956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:18:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93772311D
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:18:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jkqlp96H;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66956-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66956-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD8A5300E004
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 08:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B1400E1A;
	Wed,  8 Jul 2026 08:18:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343563ECBC6;
	Wed,  8 Jul 2026 08:18:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498695; cv=none; b=PrfmKA0ibEbA+IGkdwhUo5N4KX3HeRTkMzY4kvZM7XBQqZq02/Iiyendy+KW9zy571Vp1N9q3ByuRXCHzZCIEpLzSODT7KhAtCCZxVQNFTm3vdKi09J2/dNfACAqO9GBu7qeU1e70eYFbxsYIVVAMDs0zAgYiPwHdCuZHHGEKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498695; c=relaxed/simple;
	bh=Or/qpVvlD5mQVE4IFRgzqkEQZSayRWp9+AzaZSC53Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku7WSHynmGHGOWIJFCXs5JQ4sVQUncAt16yDbOWJh3yAcjMRHptjfqH0ipZ65xHNWwQwS8/beyNjCwg0pFzBnS4vJ0SHCdz2+CAtS7gdVF8fu6RunbItErY6/TSeTZk+8GHeA37tLvdXIVtyjCAqD9AmU5V+3gynSv/u/4dBUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkqlp96H; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783498694; x=1815034694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Or/qpVvlD5mQVE4IFRgzqkEQZSayRWp9+AzaZSC53Us=;
  b=jkqlp96HCR39ZGdGes2WvJMl98j5jlbFHdq7Fegp+sVQBHrRP7SciVEg
   f/g+iUKiQQIbCbfnOPcfxTesUoNmuecdy27jog6GOctb2ORlBZ0eiD/nf
   aW2icy3xEWrXkmXDE9p+mO4bBBx1gjAciKzUu6TDIKtJhn0BklKsnBtTO
   I6cpSYh9JNCHBUPdBZZad3wSf8Qns3vZ2RFoFAyeyo5EAPVGviFMA+Nwx
   Q0JQStApBtZ9590gVm0r4P+vSurpTHlfLXAARCxwCQK5TOSihB/mMl8LU
   wIgrynB0Ki0ElzZrMPrzlU048bjm69j7MF9Ua+Xa0MJpX73MM1k7WEiOM
   w==;
X-CSE-ConnectionGUID: CdhZwnD4QZifqxTsFLAQGw==
X-CSE-MsgGUID: 8Is8YtN/TNi1UFWezkfMWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84273933"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84273933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:18:13 -0700
X-CSE-ConnectionGUID: DUeos/4SQ5+NlqviXahFhg==
X-CSE-MsgGUID: 1zA3n5HIR4qjnzbRAm4h9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278602383"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:18:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A10D711FB4A;
	Wed, 08 Jul 2026 11:18:12 +0300 (EEST)
Date: Wed, 8 Jul 2026 11:18:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: mt9p031: fix endpoint parsing use-after-free
Message-ID: <ak4HxM2nG7ppCLon@kekkonen.localdomain>
References: <20260613084849.57897-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613084849.57897-1-birenpandya@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66956-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F93772311D

Hi Biren,

On Sat, Jun 13, 2026 at 02:18:49PM +0530, Biren Pandya wrote:
> The mt9p031_probe() function calls fwnode_handle_put(np) immediately
> after parsing the endpoint. However, it subsequently calls
> fwnode_property_read_u32() twice using the same 'np' handle, leading
> to a potential use-after-free.
> 
> Fix this by moving fwnode_handle_put(np) to the end of the endpoint
> property reading block, and adding it to the error path of
> v4l2_fwnode_endpoint_parse().
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/mt9p031.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d..04c17cb 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1075,15 +1075,18 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
>  		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
> -	fwnode_handle_put(np);
> -	if (ret)
> +	if (ret) {
> +		fwnode_handle_put(np);
>  		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
> +	}
>  
>  	fwnode_property_read_u32(np, "input-clock-frequency",
>  				 &mt9p031->ext_freq);
>  	fwnode_property_read_u32(np, "pixel-clock-frequency",
>  				 &mt9p031->target_freq);

Same comment on this one -- just move these before
v4l2_fwnode_endpoint_parse().

>  
> +	fwnode_handle_put(np);
> +
>  	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
>  				 V4L2_MBUS_PCLK_SAMPLE_RISING);
>  

-- 
Regards,

Sakari Ailus

