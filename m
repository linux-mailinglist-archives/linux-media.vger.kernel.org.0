Return-Path: <linux-media+bounces-55929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDXoLpgWuGl/YwEAu9opvQ
	(envelope-from <linux-media+bounces-55929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:41:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8F629B90D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29FFA3054218
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B8527A904;
	Mon, 16 Mar 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G+mNo+n0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1A2C324C
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671915; cv=none; b=rMHogz9CwN3S61xU2Y2v/sK2YDApJXX8Ipcxl0Vc551G8PA/Deln4hq11ShA8wo2/JGcru+sFrloI/LXpX4XhXlQ3ed45KeGbY2q6YVAvE2cieUO8pA2xqc6BKt7A4/TOTDblFR4zIIe9JbUAkTPh5tHSdZknRInsArz2d+SNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671915; c=relaxed/simple;
	bh=B1hXvwnOnrw1VF8Y75ptZvjV6e2fnmLKT+eeenkS4lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogY9nqHOlxdVRIN3Ng/Q88BwLZcq3guC2HC/OUYgT8IKlkBJSudyufxeV65EOy9X2snVnci97EsjpVr1yi2WE3bH/477hCHStTUu2PZmFkwCRb376YeOZlSNDlsQ3pjwinCezOK3Yy6YA8l9MA4w7XC+7uO8tApuHEp48kUZN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G+mNo+n0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B64BAB1A;
	Mon, 16 Mar 2026 15:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773671840;
	bh=B1hXvwnOnrw1VF8Y75ptZvjV6e2fnmLKT+eeenkS4lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+mNo+n0B73HOK91/d0b0rHqQSK1huIHevfIhFgjEzAAYhDjRz+2F04z026/7A2eU
	 8VyXUKOScWAhcHqIk2MxAb/9i8WpCHxArN3sexsvPJ+HMODl29DcF0cVF3+d9mKGzS
	 nHmfYC4hDP53ygLay9GmD7jOJyqYxpFX1vpg9v0o=
Date: Mon, 16 Mar 2026 16:38:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 03/11] Add 10-bit CSI-2 packed format
 support
Message-ID: <20260316143830.GE31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-4-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55929-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3D8F629B90D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:46:09AM +0200, Sakari Ailus wrote:
> Add support for the 10-bit CSI-2 packed raw formats.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 5df3ff7ab31d..14cfa7e7a46c 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -25,6 +25,7 @@
>  
>  #include <ctype.h>
>  #include <stdio.h>
> +#include <stdint.h>

You nearly got the alphabetic order right :-)

>  #include <stdlib.h>
>  #include <unistd.h>
>  #include <string.h>
> @@ -56,6 +57,7 @@ static const struct format_info {
>  	unsigned int cb_pos;
>  	unsigned int cr_pos;
>  	unsigned int planes;
> +	__u32 compat_fmt;
>  } v4l2_pix_fmt_str[] = {
>  	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0, 1 },
>  	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0, 1 },
> @@ -98,6 +100,10 @@ static const struct format_info {
>  	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0, 1 },
>  	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0, 1 },
>  	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0, 1 },
> +	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, 1, V4L2_PIX_FMT_SBGGR10 },
> +	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGBRG10 },
> +	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGRBG10 },
> +	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, 1, V4L2_PIX_FMT_SRGGB10 },
>  	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0, 1 },
>  	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0, 1 },
>  	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0, 1 },
> @@ -186,6 +192,45 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
>  	return b;
>  }
>  
> +static inline uint16_t raw_get(uint8_t bpp, unsigned char *ptr,
> +			       unsigned int stride, unsigned int x,
> +			       unsigned int y)
> +{
> +	switch (bpp) {
> +	case 10: {
> +		unsigned char *base = ptr + y * stride + x / 4 * 5;
> +		unsigned int idx = x & 3U;
> +
> +		return (base[idx] << 2) | ((base[4] >> (idx << 1)) & 3U);
> +	}
> +	default:
> +		error("getting raw %u not supported", bpp);
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void raw_put(uint8_t bpp, unsigned char *ptr, unsigned int stride,
> +			   unsigned int x, unsigned int y, uint16_t value)
> +{
> +	switch (bpp) {
> +	case 10: {
> +		unsigned char *base = ptr + y * stride + x / 4 * 5;
> +		unsigned int idx = x & 3U;
> +
> +		base[idx] = value >> 2;
> +		base[4] &= ~(3U << (idx << 1));
> +		base[4] |= (value & 3U) << (idx << 1);
> +		break;
> +	}

I assume you'll need this later in the series, it's not used here.

> +	case 16:
> +		*(uint16_t *)&ptr[y * stride + x * 2] = value;
> +		break;
> +	default:
> +		error("putting raw %u not supported", bpp);
> +	}
> +}
> +
>  static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
>  			      int src_width, int src_height, unsigned int src_stride)
>  {
> @@ -283,6 +328,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  static void raw_to_rgb(const struct format_info *info,
>  		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
>  {
> +	unsigned char *tmp_src = NULL;
>  	unsigned int src_stride = src_width * info->bpp / 8;
>  	unsigned int rgb_stride = src_width * 3;
>  	unsigned char *src_luma, *src_chroma;
> @@ -298,6 +344,40 @@ static void raw_to_rgb(const struct format_info *info,
>  	int cr_pos;
>  	int shift;
>  
> +	switch (info->fmt) {
> +	case V4L2_PIX_FMT_SBGGR10P:
> +	case V4L2_PIX_FMT_SGBRG10P:
> +	case V4L2_PIX_FMT_SRGGB10P:
> +	case V4L2_PIX_FMT_SGRBG10P: {
> +		const struct format_info *old_info = info;
> +		unsigned int new_stride = src_width * 2;

I'd call this unpacked_stride. It's a bit longer, but clearer.

> +
> +		tmp_src = malloc(new_stride * src_height);
> +		if (!tmp_src)

"tmp" isn't very descriptive either.

> +			error("can't allocate memory for the temporary buffer");
> +
> +		for (src_y = 0; src_y < src_height; src_y++)
> +			for (src_x = 0; src_x < src_width; src_x++)
> +				raw_put(16, tmp_src, new_stride, src_x, src_y,
> +					raw_get(info->bpp, src, src_stride,
> +						src_x, src_y));
> +
> +		src_stride = new_stride;
> +		src = tmp_src;
> +
> +		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
> +			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
> +				info = &v4l2_pix_fmt_str[i];
> +				break;
> +			}
> +		}
> +
> +		if (info == old_info)
> +			error("no supported format found for %s",
> +			      old_info->name);

Maybe you could do this before handling the conversion.

> +	}
> +	}
> +
>  	switch (info->fmt) {
>  	case V4L2_PIX_FMT_VYUY:
>  	case V4L2_PIX_FMT_YVYU:
> @@ -734,6 +814,8 @@ static void raw_to_rgb(const struct format_info *info,
>  		}
>  		break;
>  	}
> +
> +	free(tmp_src);

This makes me which the kernel's __free() macro could be used here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static int parse_format(const char *p, int *w, int *h)

-- 
Regards,

Laurent Pinchart

