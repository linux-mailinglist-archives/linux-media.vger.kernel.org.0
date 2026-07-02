Return-Path: <linux-media+bounces-66380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QfmbAKZ9RmoIXQsAu9opvQ
	(envelope-from <linux-media+bounces-66380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 17:03:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D376F9288
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 17:02:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZcqAnyJH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66380-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66380-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C3BB304C922
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 15:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73F2353A75;
	Thu,  2 Jul 2026 15:01:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F71433E98;
	Thu,  2 Jul 2026 15:01:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004468; cv=none; b=l76Fu8yX0tjc1hKJga217s79TF3O/b0ORxtTg5jEzLG4ndr/IT/oAtXyqYtnMZDUaYHv2vSCBhZriMmA8bpdeggr5uAj22dnnBAqPnUP132hee4pAxTA43aF37VfwVN+GvGhlVr8szIBQMHaTOsGQuat1cUF6sxst4DLRSqRMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004468; c=relaxed/simple;
	bh=OMKqaZ6Eh4UWQYJUiyURJ0V49KQirB6VdXk4WVoFC18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsRQfM7SFdUA6O8FGpqYFqRVNzOVz0RRcITU9KsRTgZtEK2w+IW1P7PF9SGa14lDtS30GRJFpOxWG6l/J2qY/bz17X+TETXkpUysJ6lZ83keltS4nNVJl5dMtxz6U0J7KkplFIvB02mrO6OOI33POS/cqD6IjQ9HT0J1ifdkqOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcqAnyJH; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783004467; x=1814540467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OMKqaZ6Eh4UWQYJUiyURJ0V49KQirB6VdXk4WVoFC18=;
  b=ZcqAnyJHR2bwttPzyxuWpUzxuZnZrBItnoNni1bthKBgHWlyvMzXULeC
   pWq9CBp8KkW+Fbv4Dqjts7du/HEmP1h/+QwkkNNeFy0sqOrm1nVQcGFt2
   LVBBonBtstUxx+I/9IQrUZbgKkfl+yC6e+YR/nchKcWA+EJK64zig2pSZ
   FLCXKtu9uxYbrHJw90VGnus6cFBas4P89zLwSsV+CqEnnogiNUnEgECrq
   JLy7dkFHTZ5DlYT000lViF5oUvCGIoh19fNIgoUU5hkq0xuEVQhNS36W1
   3sHPRdA7kZmQgoiDdJMBHgSua0uJkeknLpeYP5yxum/tpHDUp4KjRyenq
   Q==;
X-CSE-ConnectionGUID: K8QyUJfUTdSMPlz0xFKCjA==
X-CSE-MsgGUID: duNHAEh4RISZAqimzFuEJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71282422"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="71282422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 08:01:06 -0700
X-CSE-ConnectionGUID: ffjaiZRLTZ2ZBwgo/smGzw==
X-CSE-MsgGUID: QLeNMjs/TO2JQAtyJ7Yz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251820476"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 08:01:04 -0700
Date: Thu, 2 Jul 2026 17:00:55 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] media: i2c: os05b10: add 12-bit RAW mode support
Message-ID: <akZ7Gl2w0dg0b9ZR@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-9-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-9-tarang.raval@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66380-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[linux.intel.com:query timed out,mdjait-mobl:query timed out];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2D376F9288

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:54PM +0530, Tarang Raval wrote:

[..]

> -static u32 os05b10_get_format_code(struct os05b10 *os05b10)
> +static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)
>  {
> -	static const u32 codes[2][2] = {
> +	static const u32 codes_12[2][2] = {
> +		{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12, },
> +		{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12, },
> +	};
> +
> +	static const u32 codes_10[2][2] = {
>  		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
>  		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
>  	};
>  
> +	const u32 (*codes)[2] = (bpp == 12) ? codes_12 : codes_10;
> +

I don't know about the code above..

How about one array:

        static const u32 codes[2][2][2] = {
                {
                        { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
                        { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
                }, {
                        { MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12, },
                        { MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12, },
                },
        };

And the first index will be dependent on the bpp == 12 or not.

or
        static const u32 codes[4][2];

and have an offset of 2. I think the first is cleaner.

>  	u32 code = codes[os05b10->vflip->val][os05b10->hflip->val];
>  
>  	return code;
> @@ -654,8 +676,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
>  		return -EINVAL;
>  
> -	code->code = os05b10_get_format_code(os05b10);
> -
> +	code->code = os05b10_get_format_code(os05b10,
> +					     (code->index == 1) ? 12 : 10);
>  	return 0;
>  }
>  
> @@ -684,15 +706,42 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
>  					OS05B10_EXPOSURE_STEP, mode->exp);
>  }
>  
> +static inline void get_mode_table(unsigned int code,
> +				  const struct os05b10_mode **mode_list,
> +				  unsigned int *num_modes)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +		*mode_list = supported_modes_12bit;
> +		*num_modes = ARRAY_SIZE(supported_modes_12bit);
> +		break;
> +
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +		*mode_list = supported_modes_10bit;
> +		*num_modes = ARRAY_SIZE(supported_modes_10bit);
> +		break;
> +	default:
> +		*mode_list = NULL;
> +		*num_modes = 0;
> +		break;
> +	}
> +}
> +
>  static int os05b10_set_pad_format(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_format *fmt)
>  {
> -	const struct os05b10_mode *mode = &supported_modes_10bit[0];
>  	struct os05b10 *os05b10 = to_os05b10(sd);
> +	const struct os05b10_mode *mode_list;
>  	struct v4l2_mbus_framefmt *format;
> +	const struct os05b10_mode *mode;
> +	unsigned int num_modes;
>  	int ret;
>  
> +	get_mode_table(fmt->format.code, &mode_list, &num_modes);
> +	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +				      fmt->format.width, fmt->format.height);
> +

What would happen here if get_mode_table returns NULL and 0 for
mode_list and num_modes ?

>  	fmt->format.width = mode->width;

Will this cause a kernel panic ?

>  	fmt->format.height = mode->height;
>  	fmt->format.field = V4L2_FIELD_NONE;
> @@ -735,12 +784,17 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_frame_size_enum *fse)
> +	const struct os05b10_mode *mode_list;
> +	unsigned int num_modes;
> +
> +	get_mode_table(fse->code, &mode_list, &num_modes);
> +
> +	if (fse->index >= num_modes)
>  		return -EINVAL;
>  
> -	fse->min_width = supported_modes_10bit[fse->index].width;
> +	fse->min_width = mode_list[fse->index].width;
>  	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes_10bit[fse->index].height;
> +	fse->min_height = mode_list[fse->index].height;
>  	fse->max_height = fse->min_height;
>  
>  	return 0;

--
Kind Regards
Mehdi Djait

