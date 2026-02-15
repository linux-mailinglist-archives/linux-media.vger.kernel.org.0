Return-Path: <linux-media+bounces-52833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HfClNWZKkmnmsgEAu9opvQ
	(envelope-from <linux-media+bounces-52833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 23:36:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C213FE81
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 23:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBD703032997
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 22:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FFF2248A5;
	Sun, 15 Feb 2026 22:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Au2sf2Po"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A017736
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771194976; cv=none; b=n/8/cEuYBitxYx98nZTQeEpF/Gd8fFzSjZxmhzkDt04xr61gpwOfobmmJu/v4ITxhwy70jK+b6O2VVe10mNmkoojWzzoHy1om1m1rg8jcXZZjVUuBXL7scWQc5CsEIWpx1eXl18pgpHXPIvs4uoQKkouNT5JpkAB4cZNwx/GXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771194976; c=relaxed/simple;
	bh=T7DRwGhYIWfC/K1CXljB9ZfUBZthCEw094gyvxbNofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhREmUHJeSJ3cLbDEfbdT7cRAvfXKIaMokykgdXpTs1uqjMyUwS+B7s26YqQtiD5vyRlv5nDcLGcl+koU80mE1I2qYJRLnXzdeMkuKfbrTTFOlUfoAsD3n63D1Xap5ufm+Yy8OkTz1JpmpZrKear4NEUC+0cwOutTo326eEEMnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Au2sf2Po; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a02:a03f:a440:2900:9751:ae5e:a777:a318])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0B3E1FE;
	Sun, 15 Feb 2026 23:35:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771194922;
	bh=T7DRwGhYIWfC/K1CXljB9ZfUBZthCEw094gyvxbNofM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Au2sf2PoFEsFQ08+ct8T+s3Kfy/zt41gIpzTgCT3zDpcV6zhLus6StfuPHRnkvySi
	 eEIkVRgvYgqf6Rmmyo8XUOcXMwcWN03I4E9Eks9x03tYXIVhzZGMvFp7hQBP+Dzly+
	 11VLon0vexRrNn0QQ4M8BRn9Jn27lOxvPNZZVyPU=
Date: Sun, 15 Feb 2026 23:36:13 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm,PATCHv2] Add warning for incorrect bayer layout
 conversions
Message-ID: <20260215223613.GA3761340@killaraus.ideasonboard.com>
References: <20260215080651.555939-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215080651.555939-1-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52833-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email]
X-Rspamd-Queue-Id: 2A4C213FE81
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 09:06:51AM +0100, Niklas Söderlund wrote:
> Not all bayer layouts are correctly converted, add a warning to
> highlight this to users.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> * Changes since v1
> - Rewrite warning and commit message to be less benign.
> ---
>  raw2rgbpnm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index b834add4ea6c..baeb8efc863a 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -201,6 +201,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  	case V4L2_PIX_FMT_SBGGR8:
>  		swap_line = 1; /* BGGR -> GBRG */
>  		swap_gbrg = 1; /* GBRG -> GRBG */
> +		printf("WARNING: bayer layout BGGR not correctly supported, expect conversion artifacts\n");
>  		break;
>  	case V4L2_PIX_FMT_SGBRG16:
>  	case V4L2_PIX_FMT_SGBRG14:
> @@ -208,6 +209,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  	case V4L2_PIX_FMT_SGBRG10:
>  	case V4L2_PIX_FMT_SGBRG8:
>  		swap_gbrg = 1; /* GBRG -> GRBG */
> +		printf("WARNING: bayer layout GBRG not correctly supported, expect conversion artifacts\n");
>  		break;
>  	case V4L2_PIX_FMT_SRGGB16:
>  	case V4L2_PIX_FMT_SRGGB14:
> @@ -215,6 +217,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  	case V4L2_PIX_FMT_SRGGB10:
>  	case V4L2_PIX_FMT_SRGGB8:
>  		swap_line = 1; /* RGGB -> GRBG */
> +		printf("WARNING: bayer layout RGGB not correctly supported, expect conversion artifacts\n");
>  		break;
>  	case V4L2_PIX_FMT_SGRBG16:
>  	case V4L2_PIX_FMT_SGRBG14:

-- 
Regards,

Laurent Pinchart

