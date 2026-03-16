Return-Path: <linux-media+bounces-55936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIg5DK4auGlYZAEAu9opvQ
	(envelope-from <linux-media+bounces-55936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:58:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F729BE3F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55DC83021737
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3819F7E0E4;
	Mon, 16 Mar 2026 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r1cASz55"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AE42EAD1B
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672639; cv=none; b=SIBnD5rXDzRD5I1Jj/WQ8azEGUbSJcOH3xZH/AKRUw/UGYLxoy70SiM5S2XQ3zU03ZE5/hasLLJFct5uSI28iIDZ/TKzXIY/KRA3ODLWxQjNy7mLKrJIcwrfO8OIWqCol1ahQ7csWLQsnARtv2cCjew8Bi/VPfYqxdIWJlrONS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672639; c=relaxed/simple;
	bh=hGrR0aqSb300NHJ3KqGHPvbYaTwuabR4qgNqpKeWNfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnBJ+5xdYDt6zd9TXk7RLG5Z1AFUqQ/0xlMmAJSa5g17ftwiWJrQmp1U276TfV5u1Fa9Sr3ckYxGKS9Q3VOfnhDvSNFbvHV+yx9/72UKpJyp4LT1/AW9sVCc98GUC3rpqUfeDNxqkZGQMPqgau2GqMiywTRnKbCcKjULW+O07DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r1cASz55; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 57D3BB1A;
	Mon, 16 Mar 2026 15:49:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773672565;
	bh=hGrR0aqSb300NHJ3KqGHPvbYaTwuabR4qgNqpKeWNfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1cASz55JVqqnfpTOuScv+CKXNe+TwBvX+DRjh9HpOt6CCwVQCekbQoP2JMtkeppB
	 hyajFUGWFuDU47ZC+im/sb3nNy1UlL94DH4rKNkusj9sMRKwXtjXBqSDVm8smiRO3m
	 Tna3jLVjqc5UCCWUWwCCHpDBj0OBRUdrySqEPIQ0=
Date: Mon, 16 Mar 2026 16:50:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 08/11] Add --stride (-S) option for setting
 stride
Message-ID: <20260316145035.GJ31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-9-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55936-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9B4F729BE3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:46:14AM +0200, Sakari Ailus wrote:
> Being able to set stride explicitly is useful in some cases.

Definitely.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 0e0a5b1e63e9..9ec9f06de052 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -139,11 +139,11 @@ static const struct format_info *get_format_info(__u32 f)
>  }
>  
>  /* Read and return image data at given width, height and format information. */
> -static unsigned char *read_raw_data(char *filename, int width, int height,
> +static unsigned char *read_raw_data(char *filename, unsigned int width,
> +				    unsigned int height, unsigned int line_length,
>  				    const struct format_info *info)
>  {
>  	/* Get file size */
> -	unsigned int line_length;
>  	unsigned int padding = 0;
>  	unsigned char *b = NULL;
>  	unsigned int i;
> @@ -174,9 +174,9 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
>  	}
>  
>  	/* Read data */
> -	b = xalloc((width*height*bpp+7)/8);
> +	b = xalloc(line_length * height);
>  	if (padding == 0) {
> -		r = fread(b, (width*height*bpp+7)/8, 1, f);
> +		r = fread(b, line_length * height, 1, f);
>  		if (r != 1)
>  			error("fread");
>  	} else {
> @@ -327,10 +327,11 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
>  }
>  
>  static void raw_to_rgb(const struct format_info *info,
> -		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
> +		       unsigned char *src, int src_width, int src_height,
> +		       unsigned int stride, unsigned char *rgb)
>  {
>  	unsigned char *tmp_src = NULL;
> -	unsigned int src_stride = src_width * info->bpp / 8;
> +	unsigned int src_stride = stride ?: src_width * info->bpp / 8;

I assume the rest of the code already validates the stride value to
avoid buffer overflows. Have you checked that it does so in a way that
avoid integer overflows ? If so,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	unsigned int rgb_stride = src_width * 3;
>  	unsigned char *src_luma, *src_chroma;
>  	unsigned char *src_cb, *src_cr;
> @@ -844,6 +845,7 @@ static struct option options[] = {
>  	{ "help", no_argument, NULL, 'h', },
>  	{ "high-bits", no_argument, NULL, 'g', },
>  	{ "size", required_argument, NULL, 's', },
> +	{ "stride", required_argument, NULL, 'S', },
>  	{ "swap-rb", no_argument, NULL, 'w', },
>  	{ 0 },
>  };
> @@ -855,13 +857,14 @@ int main(int argc, char *argv[])
>  	char *file_in = NULL, *file_out = NULL;
>  	int format = V4L2_PIX_FMT_UYVY;
>  	const struct format_info *info;
> +	unsigned int stride = 0;
>  	int r;
>  	char *algorithm_name = NULL;
>  	int height = -1;
>  	int width = -1;
>  
>  	for (;;) {
> -		int c = getopt_long(argc, argv, "a:b:f:ghs:w", options, NULL);
> +		int c = getopt_long(argc, argv, "a:b:f:ghs:S:w", options, NULL);
>  		if (c==-1) break;
>  		switch (c) {
>  		case 'a':
> @@ -920,6 +923,9 @@ int main(int argc, char *argv[])
>  				exit(0);
>  			}
>  			break;
> +		case 'S':
> +			stride = strtoul(optarg, NULL, 10);
> +			break;
>  		case 'w':
>  			swaprb = 1;
>  			break;
> @@ -943,12 +949,12 @@ int main(int argc, char *argv[])
>  	}
>  
>  	/* Read, convert, and save image */
> -	src = read_raw_data(file_in, width, height, info);
> +	src = read_raw_data(file_in, width, height, stride, info);
>  	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
>  	       width, height, info->bpp, info->name);
>  	dst = xalloc(width*height*3);
>  
> -	raw_to_rgb(info, src, width, height, dst);
> +	raw_to_rgb(info, src, width, height, stride, dst);
>  	printf("Writing to file `%s'...\n", file_out);
>  	f = fopen(file_out, "wb");
>  	if (!f) error("file open failed");

-- 
Regards,

Laurent Pinchart

