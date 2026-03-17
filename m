Return-Path: <linux-media+bounces-56039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNcNINwyuWnsuQEAu9opvQ
	(envelope-from <linux-media+bounces-56039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:54:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6A2A84F6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BC32305DD0E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC4B37648B;
	Tue, 17 Mar 2026 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CbFPQwUF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261B279DB3
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744844; cv=none; b=b9qrO2x2D9O/IW8A8uc8zWZYtL6m1YKfhUeAT30R5knizjqzFKiZyVZ5X57M1C7rl66VTNeN+czC2gmWiLI8+bDSRML49n4L1aV4IUA25MfBJRvsb/b5B2V5hyEa9EOL+mIAmFCUA1bJFz6aa3pGkXZXENuLMrkKVqr/2RvYdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744844; c=relaxed/simple;
	bh=TjUn1BDV8bk6YAN3NubictXkaul8q7RePklyxYFOqWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxNWNPdGwBJ2BCeWQlPOUCSeSbUPtFmvu4MyxjOeh3Y34UvzVeCgs905/WFtGaF7frWnKvw7W/YtiL+STbZN2sN4wEm/qZWF3z5yyX/mBoeUn1LtCItXt3EEwe8UrID+rrIcf2qIJOCEDlZ8o1xLRts2aktnBZ/gL8zH+BxJnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CbFPQwUF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0D789593;
	Tue, 17 Mar 2026 11:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744770;
	bh=TjUn1BDV8bk6YAN3NubictXkaul8q7RePklyxYFOqWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbFPQwUFiyEr2C89R6Y6o4a4of4bRLfjMW++e0jBR1+cc+cqOX1KqzoPqd1/4ZaQC
	 pP/4ZBaApaxwdDlZApDtQLG4bphxkrCDUvNtsn9EI893IMxDK715YoyFX9N2eOaLd7
	 lno/ZjU/Ay1SvY8zyUFotyMEZG4RdlqDg93iGCIc=
Date: Tue, 17 Mar 2026 12:54:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 2/7] Check we have a supported format first before
 allocating memory
Message-ID: <20260317105400.GC302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-3-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56039-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 12A6A2A84F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:57:57AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 121f0e0272e4..8aa7258218ad 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -370,20 +370,7 @@ static void raw_to_rgb(const struct format_info *info,
>  		src_width &= ~3;
>  
>  		const struct format_info *old_info = info;
> -		unsigned int new_stride = src_width * 2;
> -
> -		tmp_src = malloc(new_stride * src_height);
> -		if (!tmp_src)
> -			error("can't allocate memory for the temporary buffer");
> -
> -		for (src_y = 0; src_y < src_height; src_y++)
> -			for (src_x = 0; src_x < src_width; src_x++)
> -				raw_put(16, tmp_src, new_stride, src_x, src_y,
> -					raw_get(info->bpp, src, src_stride,
> -						src_x, src_y));
> -
> -		src_stride = new_stride;
> -		src = tmp_src;
> +		unsigned int unpacked_stride = src_width * 2;
>  
>  		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
>  			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
> @@ -395,6 +382,19 @@ static void raw_to_rgb(const struct format_info *info,
>  		if (info == old_info)
>  			error("no supported format found for %s",
>  			      old_info->name);
> +
> +		tmp_src = malloc(unpacked_stride * src_height);
> +		if (!tmp_src)
> +			error("can't allocate memory for the temporary buffer");
> +
> +		for (src_y = 0; src_y < src_height; src_y++)
> +			for (src_x = 0; src_x < src_width; src_x++)
> +				raw_put(16, tmp_src, unpacked_stride, src_x, src_y,
> +					raw_get(info->bpp, src, src_stride,

info now points to the format_info for the compat format. I think you
should now use old_info->bpp here.

> +						src_x, src_y));
> +
> +		src_stride = unpacked_stride;
> +		src = tmp_src;
>  	}
>  	}
>  

-- 
Regards,

Laurent Pinchart

