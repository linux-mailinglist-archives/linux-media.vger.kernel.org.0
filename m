Return-Path: <linux-media+bounces-52354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KtiEOOdiGlLsQQAu9opvQ
	(envelope-from <linux-media+bounces-52354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 15:29:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995D108E6E
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 15:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24E773011BFF
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 14:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D353596E5;
	Sun,  8 Feb 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="adMHB37V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CC228725B
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770560989; cv=none; b=ujMY25CH+ZJRDNPxe9AVUWtpOymHUMmoqR7q+w/rDma8K913K3tOoNg7QzqmJ6k2aIxv6ki//VMqBUFTk3Fc7SZ14AhFTw/1ANdYXaldcrycDiEp4a+OWyMsMCKRuW38jaB7P8ZeQSDv720P9mhul1BGu0RClGkeRTGFf70B1BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770560989; c=relaxed/simple;
	bh=/aa9ogLbZtWjE2Rnzm4XFFc48d0LRoIrR+9o+XovCdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2F/7StsQkUFGfaA2WmJ7g22ft+Xv96VlSmSIC8SWPqRhkQsVy7q/peu1byJfsFywrMy8LI60acoasGmTyHRUJACbShKLI+FngccQb9APF7heZyfSh7vEvZ3f+TRS5YdzJqBjfJRTCXr8PktFaHPyqJPxqh3uBsB4/w7FTrmRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=adMHB37V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1459EC78;
	Sun,  8 Feb 2026 15:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770560942;
	bh=/aa9ogLbZtWjE2Rnzm4XFFc48d0LRoIrR+9o+XovCdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adMHB37Vt1mgyUspp6IKU+9jQfUpU1ShpYwX3yI57oTuk+mPtqB9AMUc9La5Qax10
	 xHCixZfnEdew9duzBCcMDpR0Puk5rnOCvWuWltecJRpjBxvFdh0gX9S8ijjS4e/By7
	 ZXpxMR4+IQ74Geizuv0t6LrxW/q5RRHppUWtSZng=
Date: Sun, 8 Feb 2026 16:29:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm,PATCH] Add warning for non-pixel perfect bayer
 layout conversions
Message-ID: <20260208142945.GR1376807@killaraus.ideasonboard.com>
References: <20260208122045.3175375-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260208122045.3175375-1-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52354-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.956];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ntu.edu.tw:url,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 6995D108E6E
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 01:20:45PM +0100, Niklas Söderlund wrote:
> While adding support to convert all bayer layout conversion to GRBG
> before passing the raw data along to the rgb converter, which only
> supports GRBG raw data, corrects the output image colors.

-ENOPARSE

> The conversion
> is not a pixel-perfect conversion of the input image as the input pixels
> are swapped in groups of two bore being converted.

s/bore/before/

> 
> Add a warning to highlight this to users.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  raw2rgbpnm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index b834add4ea6c..59fc4123ebbf 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -201,6 +201,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  	case V4L2_PIX_FMT_SBGGR8:
>  		swap_line = 1; /* BGGR -> GBRG */
>  		swap_gbrg = 1; /* GBRG -> GRBG */
> +		printf("WARNING: bayer layout conversion from BGGR to GRBG is not pixel perfect\n");

"not pixel perfect" sounds a bit too benign. I'd write

		printf("WARNING: bayer layout BGGR not correctly supported, expect conversion artifacts\n");

or something similar.

It would be nice to fix this properly, but I don't expect anyone to have
time and motivation to extensively refactor the code base. I'd recommend
https://github.com/tomba/pixutils if it wasn't for the fact it requires
Python, may have worse performance (to be checked), and only implements
a basic interpolation method (while raw2rgbpnm implements for instance
https://scholars.lib.ntu.edu.tw/server/api/core/bitstreams/fff3ed0d-e383-48a0-a915-188a8581e84a/content).

>  		break;
>  	case V4L2_PIX_FMT_SGBRG16:
>  	case V4L2_PIX_FMT_SGBRG14:
> @@ -208,6 +209,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  	case V4L2_PIX_FMT_SGBRG10:
>  	case V4L2_PIX_FMT_SGBRG8:
>  		swap_gbrg = 1; /* GBRG -> GRBG */
> +		printf("WARNING: bayer layout conversion from GBRG to GRBG is not pixel perfect\n");
>  		break;
>  	case V4L2_PIX_FMT_SRGGB16:
>  	case V4L2_PIX_FMT_SRGGB14:
> @@ -215,6 +217,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  	case V4L2_PIX_FMT_SRGGB10:
>  	case V4L2_PIX_FMT_SRGGB8:
>  		swap_line = 1; /* RGGB -> GRBG */
> +		printf("WARNING: bayer layout conversion from RGGB to GRBG is not pixel perfect\n");
>  		break;
>  	case V4L2_PIX_FMT_SGRBG16:
>  	case V4L2_PIX_FMT_SGRBG14:

-- 
Regards,

Laurent Pinchart

