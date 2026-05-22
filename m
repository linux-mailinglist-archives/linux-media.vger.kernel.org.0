Return-Path: <linux-media+bounces-62567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BArGpgTEGpFTQYAu9opvQ
	(envelope-from <linux-media+bounces-62567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:28:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F45B0916
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E8D73021595
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7853A782F;
	Fri, 22 May 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRn84S8G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1092F3A759D;
	Fri, 22 May 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438339; cv=none; b=ArNDaEAE74/BXUrVJDb6jo5WFLmltw+MEik+N9BUV1o5R6prPXJrAq6qYds3V9/DE6O47HqtCB2fPCxiwmH1RaoTMKpc6M972128AIKGeMERuEDr+6HJTJkYNW+c9CMhv7U7okZs4yoP89gvbdX+IY5noaYYhsNYkutGygWUDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438339; c=relaxed/simple;
	bh=Wig18oMoF2h7CU1hfyPk9X2nSxt/aprardkBIspwbSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA8ihxpjYPo0uivUlgRHWKtTcbtsN68SWoL0rvrDqIVnfGTn33EX4wvSFet67d6Mlfr7azQ1ZL2njrM9hT/m5JK/RW+ql/xkqhCcRJUhgMDdCnXj9PGbNtHRELmDId017mvo7FjC+w9P19RjIkl+ijQgf5jMoOZQoK2MP5Ctz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRn84S8G; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779438337; x=1810974337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wig18oMoF2h7CU1hfyPk9X2nSxt/aprardkBIspwbSA=;
  b=MRn84S8GEHS+8PiK6kJeXPcnMmkpYpFtoJZ/ub929GsA/iIFosOUOeVN
   7omh9gt9MK403qum8Mf1loYPlq7SI9jrvymHmaWLnn/KGCUSbGHqHupfq
   bpPekMekPj8NgImyir1JvCHrVQV5WACBMljuyR1F8f69Kk15fQjevv7xc
   fcJFxITIUo1S3rJuFwbDGnBtpdGIXtN8hRIyP4qzxYwFa/blTuO+8i/4l
   5KUddZgk8iRUzqRAQIieOi/+/OGoPnDLJAkjcDALUkSpY8hyaZhi3GhRK
   B8JT5WONH3i0jkbyniOsCWlcXcftdHEfTwCuAdw+HyjBbyD+nxSDSwgTy
   g==;
X-CSE-ConnectionGUID: mbXKEWJPTzi2TMpjSr/Rdg==
X-CSE-MsgGUID: AcBTqcPjSHOsE0nxbvB6ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90664134"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="90664134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 01:25:36 -0700
X-CSE-ConnectionGUID: 24HI4OtNRwaIvNcadNz6UA==
X-CSE-MsgGUID: OtKb06yyTouwMKypEtH3Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="278964990"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 01:25:34 -0700
Date: Fri, 22 May 2026 10:25:25 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: michael.riesch@collabora.com, mchehab@kernel.org, heiko@sntech.de, 
	hverkuil+cisco@kernel.org, gerald.loacker@wolfvision.net, bryan.odonoghue@linaro.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Fix error handling for
 media_entity_remote_source_pad_unique()
Message-ID: <ahAR0-zm1Jue6pGl@mdjait-mobl>
References: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522065548.2438545-1-nichen@iscas.ac.cn>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62567-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,intel.com:dkim,iscas.ac.cn:email]
X-Rspamd-Queue-Id: DD4F45B0916
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Chen,

Thank you for the patch.

I see this issue in the rpi cfe driver also.

On Fri, May 22, 2026 at 02:55:48PM +0800, Chen Ni wrote:
> The media_entity_remote_source_pad_unique() function returns an error
> pointer on failure, not NULL. Fix the check to use IS_ERR() and return
> PTR_ERR() to correctly handle allocation failures.
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..542aa877919d 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  	struct rkcif_stream *stream = to_rkcif_stream(vdev);
>  	int ret = -EINVAL;
>  
> -	if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
>  		return -ENOTCONN;
>  
>  	sd = media_entity_to_v4l2_subdev(link->source->entity);

--
Kind Regards
Mehdi Djait

