Return-Path: <linux-media+bounces-61572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF7NCZKDBWo5XwIAu9opvQ
	(envelope-from <linux-media+bounces-61572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:10:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6E53F18B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B95A301A526
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489EC3D88EC;
	Thu, 14 May 2026 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cFwnWLGM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908B18872A;
	Thu, 14 May 2026 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746254; cv=none; b=RNtQdFcq+Qs5i7M2BWNPnA769CrV8U5bv7W4M+3AGRRkkhDsbeil3W3eB2Qop2XYieo5TAL3t1vyby78wv+PA4uRQXdBWJaghsU4cdk3VHFKKj00l09xXeruR9xt0Q+KC7CLWqnp6G3iPJRdXUkMLz7yaxls9xI5SsQ8v/iQWIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746254; c=relaxed/simple;
	bh=excU94TPAflMzDlEA+ZzmjzNe8/hTfQW8RfitdCkX9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6opWDSY24Y3fLPdElJPbm3da50TMeIwohIqHPxp7LTmCDTX5AsvkeIIslBjValH7vZIDCqnasCJSTSsdZ0vsQFO5ziQW5QggxoedUP1rcd3jnoJnoiZ3q9kP7OLPo8NdUCvGUqECond62A14B+B8nab8JkOY65raE8iHy6nNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cFwnWLGM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9A688E0;
	Thu, 14 May 2026 10:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778746243;
	bh=excU94TPAflMzDlEA+ZzmjzNe8/hTfQW8RfitdCkX9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFwnWLGMiuPPY/FvhNYZXM+E5qRtpAm3w0f7lbUSSQQVqhSWVH9CEwephqeRQsTJA
	 flP6o2kgYVU4v0hBoQCOLmgmd/CSQUXFd9qddHriIKvqUty7X6uKbkuuEhE+pDEG+g
	 rmvzoe3059NI5HkDqRv5TkCK4ChRfiXiMD5ZOoc8=
Date: Thu, 14 May 2026 10:10:48 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] media: i2c: ov5640: Remove unsupported bayer orders
Message-ID: <agWDRd0oOBsNfyy_@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-5-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-5-0869a7802a33@ideasonboard.com>
X-Rspamd-Queue-Id: 8BA6E53F18B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61572-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Kieran

On Fri, May 01, 2026 at 04:39:07PM +0100, Kieran Bingham wrote:
> The OV5640 only outputs SBGGR8. Remove the incorrectly advertised
> alternatives which allow a misconfigured pipeline to be established.

Do you have any idea why the datasheet mentions all the RGGB
permutations as valid outputs ?

>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 244c341d0e77..e1e253730206 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -309,27 +309,6 @@ static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
>  		.bpp		= 8,
>  		.ctrl00		= 0x00,
>  		.mux		= OV5640_FMT_MUX_RAW_DPC,
> -	}, {
> -		/* Raw bayer, GBGB... / RGRG... */
> -		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> -		.bpp		= 8,
> -		.ctrl00		= 0x01,
> -		.mux		= OV5640_FMT_MUX_RAW_DPC,
> -	}, {
> -		/* Raw bayer, GRGR... / BGBG... */
> -		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> -		.bpp		= 8,
> -		.ctrl00		= 0x02,
> -		.mux		= OV5640_FMT_MUX_RAW_DPC,
> -	}, {
> -		/* Raw bayer, RGRG... / GBGB... */
> -		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> -		.bpp		= 8,
> -		.ctrl00		= 0x03,
> -		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	},

Seems like you've missed the same entries in the ov5640_dvp_formats[]
table.

>  	{ /* sentinel */ }
>  };
>
> --
> 2.52.0
>
>

