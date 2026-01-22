Return-Path: <linux-media+bounces-51326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLupHoPtcWlKZwAAu9opvQ
	(envelope-from <linux-media+bounces-51326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:27:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2464838
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD5338241AE
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B0530FF36;
	Thu, 22 Jan 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lM3h76mH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3528834403D
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073612; cv=none; b=JpZnFynnvIHvuCEvVc4Lrq2sEOVqpNLL3n4KzzY63S6GxbAu4npbNrXfpas772rIqT9f16/vH+kBaYH9mKvvxxZZ9JXiCPMqsCtAtgIpry0UbkT20EBnVXImOm16wYnLMdiPvQfKgfXXtkKFufcWammGB+ejIksDKinKegcjkmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073612; c=relaxed/simple;
	bh=/7HI1DqCEICmZx87yyNgR0waHuo/tAPqke6IGRgKIs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHkajNKxx8tvKj/g7X0llFIblPFGqwpOa0HmNs3W922YvCLffoDIbsT0PQ9duCiU2/jq3tNzyM4rsz9gOVqdt4S3LYkDW2NDSQ6DIu7gQqEnEeOpE+R1yXM3maRf5h67kVWD5L4qODtRGMYIoZGEBgQZCLBovqzaIMW+z8hovxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lM3h76mH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 32AC12DD;
	Thu, 22 Jan 2026 10:19:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769073573;
	bh=/7HI1DqCEICmZx87yyNgR0waHuo/tAPqke6IGRgKIs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM3h76mHK4Pmf9ml6HwYPQWoUf4eufbZ3bToqAX5louWjdUQOXjOZRhSF7H6jGDHm
	 1BBECEx35FSdR4bpikfKhXfNbNeL7yrvd053mFISS9U4H1IpF4yTdlB+bXr2hm2LEZ
	 4R6ROYsdUE5NZmxuzzsUwc9eIlQVrpsiCbfMfTeA=
Date: Thu, 22 Jan 2026 11:20:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm,PATCH] Add support for all RAW memory layouts
Message-ID: <20260122092004.GA239742@killaraus>
References: <20250511154659.778725-1-niklas.soderlund@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511154659.778725-1-niklas.soderlund@ragnatech.se>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51326-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: E1F2464838
X-Rspamd-Action: no action

Hi Niklas,

I know this has been merged already, but it only came to my attention
now.

On Sun, May 11, 2025 at 05:46:59PM +0200, Niklas Söderlund wrote:
> Convert all supported RAW input images to GRBG memory layout before
> feeding it to the RAW to RGB conversion algorithms. This way all layouts
> can produced good colors in the output image.

I don't think the result will be accurate. It does produce better
colours, but all liens and columns in the output image end up being
swapped in groups of two. I would have kept printing a warning message.

> Limit the conversion to input images that have an even width and height
> to make the conversion easier.
> 
> Images with and uneven width or hight can sill be processed, but will
> be processed without first being converted to GRBG layout. Such input
> images will result, just as before this change, in output images with
> bad colors. The warning message about this have been preserved.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
>  raw2rgbpnm.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 5838bc7347e9..b834add4ea6c 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -186,6 +186,97 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
>  	return b;
>  }
>  
> +static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
> +			      int src_width, int src_height, unsigned int src_stride)
> +{
> +	int swap_line = 0;
> +	int swap_gbrg = 0;
> +	int dst_x, dst_y;
> +
> +	switch (info->fmt) {
> +	case V4L2_PIX_FMT_SBGGR16:
> +	case V4L2_PIX_FMT_SBGGR14:
> +	case V4L2_PIX_FMT_SBGGR12:
> +	case V4L2_PIX_FMT_SBGGR10:
> +	case V4L2_PIX_FMT_SBGGR8:
> +		swap_line = 1; /* BGGR -> GBRG */
> +		swap_gbrg = 1; /* GBRG -> GRBG */
> +		break;
> +	case V4L2_PIX_FMT_SGBRG16:
> +	case V4L2_PIX_FMT_SGBRG14:
> +	case V4L2_PIX_FMT_SGBRG12:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SGBRG8:
> +		swap_gbrg = 1; /* GBRG -> GRBG */
> +		break;
> +	case V4L2_PIX_FMT_SRGGB16:
> +	case V4L2_PIX_FMT_SRGGB14:
> +	case V4L2_PIX_FMT_SRGGB12:
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SRGGB8:
> +		swap_line = 1; /* RGGB -> GRBG */
> +		break;
> +	case V4L2_PIX_FMT_SGRBG16:
> +	case V4L2_PIX_FMT_SGRBG14:
> +	case V4L2_PIX_FMT_SGRBG12:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGRBG8:
> +		/* No conversion needed. */
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	if (src_width % 2 != 0 || src_height % 2 != 0) {
> +		printf("WARNING: bayer layout conversion not supported for uneven sized images -> expect bad colors\n");
> +		return 0;
> +	}
> +
> +	if (swap_line) {
> +		/* Swap pixel pairs on each line AB -> BA. */
> +		for (dst_y=0; dst_y<src_height; dst_y++) {
> +			for (dst_x=0; dst_x<src_width; dst_x += 2) {
> +				if (info->bpp == 8) {
> +					unsigned char *p1 = &(src[src_stride*dst_y+(dst_x+0)]);
> +					unsigned char *p2 = &(src[src_stride*dst_y+(dst_x+1)]);
> +					unsigned char tmp = *p1;
> +					*p1 = *p2;
> +					*p2 = tmp;
> +				} else {
> +					unsigned short *p1 = (unsigned short *)&(src[src_stride*dst_y+(dst_x+0)*2]);
> +					unsigned short *p2 = (unsigned short *)&(src[src_stride*dst_y+(dst_x+1)*2]);
> +					unsigned short tmp = *p1;
> +					*p1 = *p2;
> +					*p2 = tmp;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (swap_gbrg) {
> +		/* Swap R and B components, format is always GBRG at this point. */
> +		for (dst_y=0; dst_y<src_height; dst_y += 2) {
> +			for (dst_x=0; dst_x<src_width; dst_x += 2) {
> +				if (info->bpp == 8) {
> +					unsigned char *p1 = &(src[src_stride*(dst_y+0)+(dst_x+1)]);
> +					unsigned char *p2 = &(src[src_stride*(dst_y+1)+(dst_x+0)]);
> +					unsigned char tmp = *p1;
> +					*p1 = *p2;
> +					*p2 = tmp;
> +				} else {
> +					unsigned short *p1 = (unsigned short *)&(src[src_stride*(dst_y+0)+(dst_x+1)*2]);
> +					unsigned short *p2 = (unsigned short *)&(src[src_stride*(dst_y+1)+(dst_x+0)*2]);
> +					unsigned short tmp = *p1;
> +					*p1 = *p2;
> +					*p2 = tmp;
> +				}
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static void raw_to_rgb(const struct format_info *info,
>  		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
>  {
> @@ -480,7 +571,8 @@ static void raw_to_rgb(const struct format_info *info,
>  	case V4L2_PIX_FMT_SBGGR10:
>  	case V4L2_PIX_FMT_SGBRG10:
>  	case V4L2_PIX_FMT_SRGGB10:
> -		printf("WARNING: bayer phase not supported -> expect bad colors\n");
> +		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
> +			error("Can't convert RAW layout to GRBG");
>  		/* fallthrough */
>  	case V4L2_PIX_FMT_SGRBG16:
>  	case V4L2_PIX_FMT_SGRBG14:
> @@ -523,10 +615,10 @@ static void raw_to_rgb(const struct format_info *info,
>  	case V4L2_PIX_FMT_SBGGR8:
>  	case V4L2_PIX_FMT_SGBRG8:
>  	case V4L2_PIX_FMT_SRGGB8:
> -		printf("WARNING: bayer phase not supported -> expect bad colors\n");
> +		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
> +			error("Can't convert RAW layout to GRBG");
>  		/* fallthrough */
>  	case V4L2_PIX_FMT_SGRBG8:
> -		/* FIXME: only SGRBG8 handled properly: color phase is ignored. */
>  		buf = malloc(src_width * src_height * 3);
>  		if (buf==NULL) error("out of memory");
>  		qc_imag_bay2rgb8(src, src_stride, buf, src_width*3, src_width, src_height, 3);

-- 
Regards,

Laurent Pinchart

