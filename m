Return-Path: <linux-media+bounces-53039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEsbIeaTlWn1SQIAu9opvQ
	(envelope-from <linux-media+bounces-53039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:26:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0415565B
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA71C304FA61
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 10:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A90E2D949F;
	Wed, 18 Feb 2026 10:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="blB63dZi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41F145348
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410384; cv=none; b=R75GBjJyCP/2j3ev836ej4OxNQSW3TTv2hxsDt4Z/48MnP1f2j/+atRzH//fjAkE4fGKWtrPkzzcYLMn7nol4UwEqfqQunkhr6SBYKz10AkSRWKdrXbkv8MtQ5Yglij140RgKfZHWXWo98yHzaO+7jyNuk67+Jdp6Gy7uItmt+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410384; c=relaxed/simple;
	bh=NkkpuUNpGhXajDUhUaPuBl7ENGmQRzJqeXT/6QyJQnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oscd5PyqkzZDmpk3zDORKccA0sDhCzRVpyuNY3GpLfDYezg/JzmDWHA2+0F+1XiQYqbG+N9j5JI6CEM2SoizT8+QHqucpw/XrPvbQEalLHuAphvoA/lhAZg/VBZXJsm5F+93XIVISvlbWC9ggTt4u3Mz2hSl5Gt6gZcmq3lOnWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=blB63dZi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (85-76-82-100-nat.elisa-mobile.fi [85.76.82.100])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9A87866B;
	Wed, 18 Feb 2026 11:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771410328;
	bh=NkkpuUNpGhXajDUhUaPuBl7ENGmQRzJqeXT/6QyJQnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blB63dZiKZBDLQ34BfKFfUMdh7PgtOGL6/Ln/fV/CxI51TVll9AEGeuSj7vhkn402
	 E3gRFkL3Bwo9R+Ggbj+Qd99i4oOb4G01/Rl8FLxvPd+a19Aop3q+PtHql5/tQ4RvPO
	 gRdGYInUgrg2GkrG3I1UaqrNKy9bkkcqZik72Xwk=
Date: Wed, 18 Feb 2026 11:26:18 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v3 1/3] Add explicit switch fallthrough
 notation
Message-ID: <20260218102618.GA57525@killaraus.ideasonboard.com>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
 <20260218083424.2432541-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218083424.2432541-2-sakari.ailus@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53039-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 03F0415565B
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:34:22AM +0200, Sakari Ailus wrote:
> Use __attribute__((fallthrough)) instead of a comment this is taking
> place, to make modern GCC happy.

This will require gcc 7 or newer, which I think is fine. You could check
the compiler version at build time and emit an error if the compiler is
not recent enough (and you could use that as an opportunity to switch
from make to meson :-)). This is of course out of scope for this series.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index baeb8efc863a..5df3ff7ab31d 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -362,7 +362,7 @@ static void raw_to_rgb(const struct format_info *info,
>  
>  	case V4L2_PIX_FMT_NV21:
>  		color_pos = 0;
> -		/* fallthrough */
> +		__attribute__((fallthrough));
>  	case V4L2_PIX_FMT_NV12:
>  		src_luma = src;
>  		src_chroma = &src[src_width * src_height];
> @@ -576,7 +576,7 @@ static void raw_to_rgb(const struct format_info *info,
>  	case V4L2_PIX_FMT_SRGGB10:
>  		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
>  			error("Can't convert RAW layout to GRBG");
> -		/* fallthrough */
> +		__attribute__((fallthrough));
>  	case V4L2_PIX_FMT_SGRBG16:
>  	case V4L2_PIX_FMT_SGRBG14:
>  	case V4L2_PIX_FMT_SGRBG12:
> @@ -620,7 +620,7 @@ static void raw_to_rgb(const struct format_info *info,
>  	case V4L2_PIX_FMT_SRGGB8:
>  		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
>  			error("Can't convert RAW layout to GRBG");
> -		/* fallthrough */
> +		__attribute__((fallthrough));
>  	case V4L2_PIX_FMT_SGRBG8:
>  		buf = malloc(src_width * src_height * 3);
>  		if (buf==NULL) error("out of memory");
> @@ -688,7 +688,7 @@ static void raw_to_rgb(const struct format_info *info,
>  
>  	case V4L2_PIX_FMT_BGR24:
>  		swaprb = !swaprb;
> -		/* fallthrough */
> +		__attribute__((fallthrough));
>  	case V4L2_PIX_FMT_RGB24:
>  		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
>  			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {

-- 
Regards,

Laurent Pinchart

