Return-Path: <linux-media+bounces-61643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFf7BYvxBmp+pAIAu9opvQ
	(envelope-from <linux-media+bounces-61643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:12:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FE54D17C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D2043144894
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 09:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC65C43D516;
	Fri, 15 May 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG1hPEsW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D443CEEB;
	Fri, 15 May 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838068; cv=none; b=IOlbUysqyPTgkOMp0lE1+lnFY3oalrhZEAke/Avt7rVOdUXEBP1j21J8VKAqSaaUnscvv6qCkL8dFhRjVkztxncDdwSR2zll1jpRby5KGcx08bMfKrMTF6RFX4x7iMF1epdRMmVCFUVGX2pPHPJUs71ivMCUdS/lpI6NeXgyP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838068; c=relaxed/simple;
	bh=jtzP8n1Vr8tjcuiyXDI7a1LkVoMXMwqoeEjfckMwmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8M9fD1Yd2luEBlooAZVLKKkr0V4DIbA5O10J+FQNWG6NiCHZmyZ27si2qHm1hosUBG/FcHR4fZfUJAod3Q05R3XepWWgcOn6ARy32xTYXv/73wW+ABEtYqoF01WFB/f6qA6NlfgFxF4Im+jk+SVglwUt/e8fwJ0AOg0poX6nH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gG1hPEsW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778838067; x=1810374067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jtzP8n1Vr8tjcuiyXDI7a1LkVoMXMwqoeEjfckMwmAk=;
  b=gG1hPEsW+4SDwDJepae4LGxMPvzYRWxdFINOhuteoCzuIiCMsR62FAmf
   aXKk9MdsD6Lt4NTjTBvKZeni/TE7OcgSeo6yY9hBfKbGJGi3MohLDhBNu
   M6u08PzHG8Z8X8zxzwtioGWpsUrWudrvEMVRH5OW4BPA5oLVWJPmLbnaf
   T6gzJbBNT82I1Hauhrt6sYj/T3Jn5kum/m77XBs11Kskx2UluC6NcO96G
   ORpGhj8oEihFe0fZz3Nz0RxH+NsyUh3K/9OUVlvyR5mWp7eW2WJcjdlps
   P3iUnuLytcDJwTgP2zJ6HlydAgRauWTPaVJeHFn9F/COgD46i7B79g+tR
   g==;
X-CSE-ConnectionGUID: PCjpNzFNQiODe+k2MOQU5Q==
X-CSE-MsgGUID: xgW6qQDGQvi4xp7cpAC4pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79820225"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79820225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:41:06 -0700
X-CSE-ConnectionGUID: GuEN3hrTQ6WW4Q+k0SAkcQ==
X-CSE-MsgGUID: lq3SxU1uQW6mmchEyGonDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="234400301"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.89])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:41:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 03E9711F93A;
	Fri, 15 May 2026 12:41:02 +0300 (EEST)
Date: Fri, 15 May 2026 12:41:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <agbqLmzZ5p33N18o@kekkonen.localdomain>
References: <20260514183357.3088564-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514183357.3088564-1-Frank.Li@nxp.com>
X-Rspamd-Queue-Id: 694FE54D17C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61643-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Frank,

Thanks for the update!

On Thu, May 14, 2026 at 02:33:53PM -0400, Frank Li wrote:
> +static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
> +		if (media_bus_fmt_info[i].code == bus_fmt)
> +			return &media_bus_fmt_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +u32 media_bus_fmt_to_csi2_dt(u32 bus_fmt)

I meant to use int and a negative return value here, too.

I'll pick this into my set and change this as well.

> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	if (!info)
> +		return MIPI_CSI2_DT_INVALID;
> +
> +	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
> +	return info->bpp ? info->dt : MIPI_CSI2_DT_INVALID;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +
> +int media_bus_fmt_to_csi2_bpp(u32 bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	return info->bpp ? info->bpp : -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);

-- 
Kind regards,

Sakari Ailus

