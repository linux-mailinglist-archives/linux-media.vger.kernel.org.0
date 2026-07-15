Return-Path: <linux-media+bounces-67631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YqKyOgdCV2r3IAEAu9opvQ
	(envelope-from <linux-media+bounces-67631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:17:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543475BCAB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:17:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kui8HmbB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67631-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67631-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9EB53079C43
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E517F3CAE70;
	Wed, 15 Jul 2026 08:14:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE223C9EE0;
	Wed, 15 Jul 2026 08:14:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103279; cv=none; b=u6QIYxosl+jU7YqYvoiyAEsJ8NsmSdrIj9XYG9F/SFJX5tCLkpvFGXheRNpbiWGD4peILZK9+Ya3KPpOvAKkJD+4HJkxJ2LJvwRi5BiLvAH3GIArOP5Y4jx0SV0PmCzS34j++vtYC9s8Y8/NVJtmU9QZQ3+Vn7yWEwM6WA1pl/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103279; c=relaxed/simple;
	bh=SGZRKFLPL4buFDSvbQrZbClcb6qmBX75UscPvIVfZrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGZAF7bLqeq267LhVyBCFG00Ml50mZ9Yzbv1ObSlhWAZjTiP2K8d+q1PQICC0doy3jdRiuFxSSJEzFSpufxNC1JJ0z6PYbFnJKtynNXElEpJe3ClP0NFnjtXqtOFYJwUDvvOWeIgl/e+P/9HDd+HXgwmOPBUmo44lTDgePv6at0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kui8HmbB; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784103277; x=1815639277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGZRKFLPL4buFDSvbQrZbClcb6qmBX75UscPvIVfZrA=;
  b=kui8HmbB9NGKXiwlvm2CATPGeaTCRwCIQYUbXLwTqd76UgK4HTuXRFCl
   ckeNLfS1k6URPv5xStuZVJYpYgwiMZCO33UJ9gz0ZE7XK+nX5DMb0xNCz
   GNb3YUKM7/ExZHTr64udNsjURLBSSjkPNH5SmC/qDbtireqvlgzZBx0c0
   8nDQXKn3NFznFKZZ7Pvhti12IBfXZTJqtexDz8IQwaimlxTf6/wrSe/67
   U4nGSAjpHW42f/M3Q8SEcHzgP2T1VAAPLUVWiK8xqYC9wB6TDoNr0ndc5
   SDderbmj2qae7NncYDNAftAaJQtz4Lw65wo9jOJ1iKL55307cPdYbpmz2
   g==;
X-CSE-ConnectionGUID: c/D9dyWbQUuPPEgeZV9pjw==
X-CSE-MsgGUID: k2Xwy4c3TciPJDU+QcaG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95334584"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95334584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:14:35 -0700
X-CSE-ConnectionGUID: nHuJPQdRR2aDNpxjp0iZ/w==
X-CSE-MsgGUID: 1ro5MBmTTEKkwgpKaFteyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="254361982"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:14:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7CAC111FA5C;
	Wed, 15 Jul 2026 11:14:32 +0300 (EEST)
Date: Wed, 15 Jul 2026 11:14:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: imx412: Convert to CCI register
 access helpers
Message-ID: <aldBaC46Ahf2zCSw@kekkonen.localdomain>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
 <20260316090059.121605-2-elgin.perumbilly@siliconsignals.io>
 <alXzKeKnDPk99Y5m@kekkonen.localdomain>
 <MA0P287MB21789AF2D9584C75F4D7D5E388F92@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB21789AF2D9584C75F4D7D5E388F92@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67631-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:linux-media@vger.kernel.org,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:xiaolei.wang@windriver.com,m:laurent.pinchart@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,foss.st.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5543475BCAB

On Tue, Jul 14, 2026 at 10:23:06AM +0000, Elgin Perumbilly wrote:
> Hi Sakari,
> 
> >Hi Elgin,
> >
> >On Mon, Mar 16, 2026 at 02:30:54PM +0530, Elgin Perumbilly wrote:
> >> @@ -543,29 +445,25 @@ static int imx412_update_controls(struct imx412 *imx412,
> >>  static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
> >>  {
> >>  	u32 lpfr;
> >> -	int ret;
> >> +	int ret = 0;
> >> +	int ret_hold;
> >>
> >>  	lpfr = imx412->vblank + imx412->cur_mode->height;
> >>
> >>  	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",
> >>  		exposure, gain, lpfr);
> >>
> >> -	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
> >> -	if (ret)
> >> -		return ret;
> >> +	cci_write(imx412->cci, IMX412_REG_HOLD, 1, &ret);
> >>
> >> -	ret = imx412_write_reg(imx412, IMX412_REG_LPFR, 2, lpfr);
> >> -	if (ret)
> >> -		goto error_release_group_hold;
> >> +	cci_write(imx412->cci, IMX412_REG_LPFR, lpfr, &ret);
> >>
> >> -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
> >> -	if (ret)
> >> -		goto error_release_group_hold;
> >> +	cci_write(imx412->cci, IMX412_REG_EXPOSURE_CIT, exposure, &ret);
> >>
> >> -	ret = imx412_write_reg(imx412, IMX412_REG_AGAIN, 2, gain);
> >> +	cci_write(imx412->cci, IMX412_REG_AGAIN, gain, &ret);
> >>
> >> -error_release_group_hold:
> >> -	imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);
> >> +	ret_hold = cci_write(imx412->cci, IMX412_REG_HOLD, 0, NULL);
> >
> >	return cci_write(...);
> >
> >I'll fix it while applying.
> >
> 
> Thanks for the review.

Oops, I missed there were indeed two values. Please ignore the comment;
I'll apply the patch as-is.

Thanks.

-- 
Sakari Ailus

