Return-Path: <linux-media+bounces-56071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PmCIsZTuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:14:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310C2AAA3A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E14A6303CB2C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7513C1413;
	Tue, 17 Mar 2026 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoX8iVip"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DFE3ACA70;
	Tue, 17 Mar 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752927; cv=none; b=aZByL4WwNjRXE4g4IQq9bUz24XkjvHf94QjMOmZnlu75oOLbEEJR2nauSPKAP3LSWqHnUYrpdMwoJB1588XsAasHZIGBiy0L39HG70BFG3PF+vqpi+gkIyP14CWGQMJ/fi1i8FRkc7gTQcDJ9f62cuh0KXO06W50ydMxvwVWFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752927; c=relaxed/simple;
	bh=Ib+EHay5TwScbqjSQEom9TotQYBqbPZY5UE1lmP2yCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPJWZpLYCioH4zWqUXUfVtmNwm/OtEm2Fd0lEPwmWn5oMxRPd408DKYwCdjRE2Db/Tr49QA8bPsxRPhkVNNMN6z01KsyO3UalZNmH+ayBewGh8cB8ImV72Y28FWXv/FJXsAumAfQJK9iP4CvJqcuHuD6Dhk8dBulrNAaIVAqj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoX8iVip; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752926; x=1805288926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ib+EHay5TwScbqjSQEom9TotQYBqbPZY5UE1lmP2yCM=;
  b=UoX8iVip1xPUOKu4f8kY8d6I9jEbYGgze+wvTsjFtddmGRT6UllgDBlC
   bEvSmi05hOc3RLeoHJSuBfQj+hnxtS9gBjN6QFbsRm4ax6l+X7lvetYJn
   Ebg/uF8GRLIkmxELC8PuDK+XpQVH4TOaX65HmFGky7iVbP6jCnc8r1ANv
   qLlf/HjKDUM7mrgQXXUrvHTkZy39LvS2XzqeZCGQQCriWAvWoyrBOkCIJ
   Ib9+0Kyh/J8Arpj0BL5jK7l2FhH8BioEDEFeahi5NJ2G1w08qvKCyrLi/
   CVddxJrOwTWWdJUax5M+wnqJVusf5/UQ+a3e+zfoQp6FVlYhnydqOj4NG
   w==;
X-CSE-ConnectionGUID: SWyqqed+SgWcjMRz1d+sTw==
X-CSE-MsgGUID: SjjLwtl3T5C4xwIpjSkVjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74669406"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74669406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:08:46 -0700
X-CSE-ConnectionGUID: b8XqIg+6TLOZoB8v4Ra2Zw==
X-CSE-MsgGUID: V7YGtNTNRBS500EvoE7Sgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218407842"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:08:41 -0700
Date: Tue, 17 Mar 2026 14:08:33 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
Message-ID: <ablRBViDR996euua@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56071-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,linux.intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 3310C2AAA3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

Thank you for this nice patch!

On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> for this variant to the rkcif driver and enable the MIPI CSI-2
> capture interfaces.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[...]

>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>  					      unsigned int index)
>  {
> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>  
> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
> +

while this is the correct solution for rk3588, for the rk3568 vicap this
will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.

--
Kind Regards
Mehdi Djait

