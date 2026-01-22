Return-Path: <linux-media+bounces-51327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDdQIJPvcWlKZwAAu9opvQ
	(envelope-from <linux-media+bounces-51327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:36:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF87649D4
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D4BD60A6BB
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CCD318EED;
	Thu, 22 Jan 2026 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GPTeYPYC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LVeQmV05"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58F3396F0
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074121; cv=none; b=gdZf08T6NFYhCkK7PR6xaEotDsmcZEme23wgUR6y/zKCtNrEuXddtY3Xs2fRSpFlivvriRvF54FVGlawJyTn37LoiIfoxhmeqO7XTP5tMr2yq4gQi2NHvtl14st09UmK+w+0Ii5YW8/XVtRNBVagvL4ica3Bj3QAgx9ORPQOG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074121; c=relaxed/simple;
	bh=Ob0AFem5n7E+5vmMQa4SY2wRanuro82mh+6w1Fxqs7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjhI7XhU46AdVDx+AycF6Ar7QFPNWn3ck31nVzxbvS0SIvk5dbxz/zTGRAcm9kaPCZ9IcbIC/UxJu+NO4u4brYFtvPOT0HV8dpGO3aUEbXhZ1qY45F2ve60puDMuL4Zxs8CpJ1ZzbPlk/em5WaEYz5+IMKCt6SMA6yKOrwgbHok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GPTeYPYC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LVeQmV05; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 13B89EC01A8;
	Thu, 22 Jan 2026 04:28:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 22 Jan 2026 04:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769074117;
	 x=1769160517; bh=HvNu+yodl3D1m77qwD/Yeb6qXjprJF6ncpU7+PL0T3g=; b=
	GPTeYPYCydsNCJ7XkyT/oAAj/UP+5mFAEEM9/EtIipvaswDT8iFw72+k+SuV/48/
	yN8AtMAgA6EHM/S+gZ23c0DvtDKOa0xgvw8swwfgVf8cVravcry8RRjGUv/i5TXm
	wN2X63CZBcR+29xXVPZbh6Q2O0P5XyQMirU265ZY2uyceUZ8m2AqwIcpQOiP4a0Z
	3vx8nHXBdY0hoNlBT5V0qNsaVLOBToSjOfOfhBZ4pIFYifuhY85xRrJh2uBmH46k
	VeVGZk6v5mI+D8cXAae6l7PMbJMvAoymmJep1XxHc2zYQ8X8HDjW88HrWeXKL06D
	duVejPLb3RVY3DHO216KXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769074117; x=
	1769160517; bh=HvNu+yodl3D1m77qwD/Yeb6qXjprJF6ncpU7+PL0T3g=; b=L
	VeQmV056RdUHbUIw1jGkNtYdfNKVcHtVKeh38PY82zRuJ9kbAiZGvykJ2jLmRYxt
	KdSOpe/UCohMCK+Hq8MDPsIK4Ybyqjf5wTPjsy7JMGSZpt40Vq3WOix8vSYHbwOu
	5VV8SW5lA/HlQDy4bK91o2ZmOBOXob622UEHlmAXAEdW4IsPk+/VJ2g2biMuB9j7
	4STetPvn/mdukmm2QcvNHqTX3s7a7coJSOoYbm/kNwYrM3D8NZbFvYnkMtPMcHCk
	RzWxAZVbLt5GUs6c06rU5dhsmC2yl+gWRZAQG/d8wIGy2QW79MNkpKXdBa1nQXzN
	5YYotwh7EPRgfNshk8akw==
X-ME-Sender: <xms:xO1xaZF7U8w_KV-6Z1aBkUaHa8eYE8ihGDdtr-nH8jYeSb8bwsXGzQ>
    <xme:xO1xaWFmBpHrsPQljUeG-Mpz7Z7iiqmKV_qubucNmKKmX4cAt37Nsg6zaBvDSOTn_
    IcfYf0UskqDXK0cpZlmvLajCrI1s696YMs8vypGxgRrCQ7oNwyoO8E>
X-ME-Received: <xmr:xO1xaeM4gmkGmMrXf0aaW9gcjSxHhpvVHL1CMfJD9J056jbsC1WK8s26GgUDJoPdh-USd3wbsNHWODBE2FgCQ0vMj-ct-1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeehkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvg
    hlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:xO1xadGrY0GheyL-A21qUAZjfhojemK_rNf0R4oA-VAErK9dZQ6Nnw>
    <xmx:xO1xadP3THRek_9r_N_KvQN5jevaq81Qw7IkyI1tKFE2nhK7Da1DWg>
    <xmx:xO1xaW_XH3_cMud1ocCor-ahD8I-F59oxf5TavCnC8hxWZOtHpQwHQ>
    <xmx:xO1xaRSCWgYWeT81xxjV3vmNl13gHTINb8C_sSOsZ002rkLBYjvdTA>
    <xmx:xe1xaSol54CBFtoRttePme4wy9lgXsCohkhdSaHP2eA2yUf7GIXqq_CQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 04:28:36 -0500 (EST)
Date: Thu, 22 Jan 2026 10:28:34 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm,PATCH] Add support for all RAW memory layouts
Message-ID: <20260122092834.GC2316109@ragnatech.se>
References: <20250511154659.778725-1-niklas.soderlund@ragnatech.se>
 <20260122092004.GA239742@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122092004.GA239742@killaraus>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[ragnatech.se,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51327-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]
X-Rspamd-Queue-Id: EEF87649D4
X-Rspamd-Action: no action

Hi Laurent,

On 2026-01-22 11:20:04 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> I know this has been merged already, but it only came to my attention
> now.
> 
> On Sun, May 11, 2025 at 05:46:59PM +0200, Niklas Söderlund wrote:
> > Convert all supported RAW input images to GRBG memory layout before
> > feeding it to the RAW to RGB conversion algorithms. This way all layouts
> > can produced good colors in the output image.
> 
> I don't think the result will be accurate. It does produce better
> colours, but all liens and columns in the output image end up being
> swapped in groups of two. I would have kept printing a warning message.

Thinking about it now, yes having kept or updated the warning message to 
make the user aware of the result not being pixel perfect would likely 
have been a good idea.

> 
> > Limit the conversion to input images that have an even width and height
> > to make the conversion easier.
> > 
> > Images with and uneven width or hight can sill be processed, but will
> > be processed without first being converted to GRBG layout. Such input
> > images will result, just as before this change, in output images with
> > bad colors. The warning message about this have been preserved.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > ---
> >  raw2rgbpnm.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 95 insertions(+), 3 deletions(-)
> > 
> > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > index 5838bc7347e9..b834add4ea6c 100644
> > --- a/raw2rgbpnm.c
> > +++ b/raw2rgbpnm.c
> > @@ -186,6 +186,97 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
> >  	return b;
> >  }
> >  
> > +static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
> > +			      int src_width, int src_height, unsigned int src_stride)
> > +{
> > +	int swap_line = 0;
> > +	int swap_gbrg = 0;
> > +	int dst_x, dst_y;
> > +
> > +	switch (info->fmt) {
> > +	case V4L2_PIX_FMT_SBGGR16:
> > +	case V4L2_PIX_FMT_SBGGR14:
> > +	case V4L2_PIX_FMT_SBGGR12:
> > +	case V4L2_PIX_FMT_SBGGR10:
> > +	case V4L2_PIX_FMT_SBGGR8:
> > +		swap_line = 1; /* BGGR -> GBRG */
> > +		swap_gbrg = 1; /* GBRG -> GRBG */
> > +		break;
> > +	case V4L2_PIX_FMT_SGBRG16:
> > +	case V4L2_PIX_FMT_SGBRG14:
> > +	case V4L2_PIX_FMT_SGBRG12:
> > +	case V4L2_PIX_FMT_SGBRG10:
> > +	case V4L2_PIX_FMT_SGBRG8:
> > +		swap_gbrg = 1; /* GBRG -> GRBG */
> > +		break;
> > +	case V4L2_PIX_FMT_SRGGB16:
> > +	case V4L2_PIX_FMT_SRGGB14:
> > +	case V4L2_PIX_FMT_SRGGB12:
> > +	case V4L2_PIX_FMT_SRGGB10:
> > +	case V4L2_PIX_FMT_SRGGB8:
> > +		swap_line = 1; /* RGGB -> GRBG */
> > +		break;
> > +	case V4L2_PIX_FMT_SGRBG16:
> > +	case V4L2_PIX_FMT_SGRBG14:
> > +	case V4L2_PIX_FMT_SGRBG12:
> > +	case V4L2_PIX_FMT_SGRBG10:
> > +	case V4L2_PIX_FMT_SGRBG8:
> > +		/* No conversion needed. */
> > +		break;
> > +	default:
> > +		return -1;
> > +	}
> > +
> > +	if (src_width % 2 != 0 || src_height % 2 != 0) {
> > +		printf("WARNING: bayer layout conversion not supported for uneven sized images -> expect bad colors\n");
> > +		return 0;
> > +	}
> > +
> > +	if (swap_line) {
> > +		/* Swap pixel pairs on each line AB -> BA. */
> > +		for (dst_y=0; dst_y<src_height; dst_y++) {
> > +			for (dst_x=0; dst_x<src_width; dst_x += 2) {
> > +				if (info->bpp == 8) {
> > +					unsigned char *p1 = &(src[src_stride*dst_y+(dst_x+0)]);
> > +					unsigned char *p2 = &(src[src_stride*dst_y+(dst_x+1)]);
> > +					unsigned char tmp = *p1;
> > +					*p1 = *p2;
> > +					*p2 = tmp;
> > +				} else {
> > +					unsigned short *p1 = (unsigned short *)&(src[src_stride*dst_y+(dst_x+0)*2]);
> > +					unsigned short *p2 = (unsigned short *)&(src[src_stride*dst_y+(dst_x+1)*2]);
> > +					unsigned short tmp = *p1;
> > +					*p1 = *p2;
> > +					*p2 = tmp;
> > +				}
> > +			}
> > +		}
> > +	}
> > +
> > +	if (swap_gbrg) {
> > +		/* Swap R and B components, format is always GBRG at this point. */
> > +		for (dst_y=0; dst_y<src_height; dst_y += 2) {
> > +			for (dst_x=0; dst_x<src_width; dst_x += 2) {
> > +				if (info->bpp == 8) {
> > +					unsigned char *p1 = &(src[src_stride*(dst_y+0)+(dst_x+1)]);
> > +					unsigned char *p2 = &(src[src_stride*(dst_y+1)+(dst_x+0)]);
> > +					unsigned char tmp = *p1;
> > +					*p1 = *p2;
> > +					*p2 = tmp;
> > +				} else {
> > +					unsigned short *p1 = (unsigned short *)&(src[src_stride*(dst_y+0)+(dst_x+1)*2]);
> > +					unsigned short *p2 = (unsigned short *)&(src[src_stride*(dst_y+1)+(dst_x+0)*2]);
> > +					unsigned short tmp = *p1;
> > +					*p1 = *p2;
> > +					*p2 = tmp;
> > +				}
> > +			}
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void raw_to_rgb(const struct format_info *info,
> >  		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
> >  {
> > @@ -480,7 +571,8 @@ static void raw_to_rgb(const struct format_info *info,
> >  	case V4L2_PIX_FMT_SBGGR10:
> >  	case V4L2_PIX_FMT_SGBRG10:
> >  	case V4L2_PIX_FMT_SRGGB10:
> > -		printf("WARNING: bayer phase not supported -> expect bad colors\n");
> > +		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
> > +			error("Can't convert RAW layout to GRBG");
> >  		/* fallthrough */
> >  	case V4L2_PIX_FMT_SGRBG16:
> >  	case V4L2_PIX_FMT_SGRBG14:
> > @@ -523,10 +615,10 @@ static void raw_to_rgb(const struct format_info *info,
> >  	case V4L2_PIX_FMT_SBGGR8:
> >  	case V4L2_PIX_FMT_SGBRG8:
> >  	case V4L2_PIX_FMT_SRGGB8:
> > -		printf("WARNING: bayer phase not supported -> expect bad colors\n");
> > +		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
> > +			error("Can't convert RAW layout to GRBG");
> >  		/* fallthrough */
> >  	case V4L2_PIX_FMT_SGRBG8:
> > -		/* FIXME: only SGRBG8 handled properly: color phase is ignored. */
> >  		buf = malloc(src_width * src_height * 3);
> >  		if (buf==NULL) error("out of memory");
> >  		qc_imag_bay2rgb8(src, src_stride, buf, src_width*3, src_width, src_height, 3);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

