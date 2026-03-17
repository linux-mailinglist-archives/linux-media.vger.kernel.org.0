Return-Path: <linux-media+bounces-56089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDl8IHlYuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:34:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4982AAF4C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4275030314F6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D7A3CCA0E;
	Tue, 17 Mar 2026 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myIFe9i+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014D3CBE92;
	Tue, 17 Mar 2026 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754116; cv=none; b=iugc46Z/gUT6BQ8xTTunVJsAe6vmiVPnTZwJILGa+kwyzWKqwFMoRS9w//lI2UPqfMRwFomM7bDN5i0Gc6WjZnbTuL6xYC0hFqyVYfObDz8PObYgyk77TdUO45nIPBhLck04iwCtgc2qHcfbGRkU1wGrNDlmDOgBiJ2vtNTQll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754116; c=relaxed/simple;
	bh=5deYAWnk5PjnJBSj7gYUmK+FXdv106euB1I/XmQwMW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNIfPVe8KSPnb/R/u+SwhhTaFoETEBuaUvPi5d2r0STcC2s60aB9ecYALf6R6L633b4qGkTAdnruGz8fOVyjUQp8MeF13aeoc9I9dCB7IqLO4UZQDviAI0YfmUwtTLEF9RxvQi0w5bvt7uz4c7bAj0PFRu1+N0wYNtgRSAuTk/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myIFe9i+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773754115; x=1805290115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5deYAWnk5PjnJBSj7gYUmK+FXdv106euB1I/XmQwMW4=;
  b=myIFe9i+Y6rx5bTg8R+UMoUkfeRMohQnGQqW7NKTpnGpPL1/+Q7bTy42
   RXg2+rseuxQ0jfiVBYtHrJ2t9j7zNvAnkpo1DaJsp/wPLm7MEqiI8sAnR
   HJHVvHKJXwXhWuN4YE0UO2wfJIdGNDRtseOieEGO1t96HrRHCfP5ddXfR
   GBLxIsO83jbNLdNhcPsytJI2y5fgmEU9/Xelac8G0BsoF/WsZ2aqrjLIW
   mhKGIq+L2IsINqVwLcNB+aETdhogbTGfmAGXSmPgLISv81hq6w+8TJWKQ
   WrVpN46C5OyWf6P/PJy6eEO9q91sfakO49R9baZW5vmKvnTCZaw4Tg6ca
   Q==;
X-CSE-ConnectionGUID: CE9Aq6spS/S6qGf80AZQSw==
X-CSE-MsgGUID: 4I5Jwh8CRqSwwK5xuTdlMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85412101"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85412101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:28:34 -0700
X-CSE-ConnectionGUID: 91XVWifeTBGqTq3vc/kSJQ==
X-CSE-MsgGUID: 7+2RRmQVRtqZFCzALNf9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226736160"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:28:29 -0700
Date: Tue, 17 Mar 2026 14:28:22 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
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
Message-ID: <ablWdjlrPLGhDJi4@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
 <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56089-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD4982AAF4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On Tue, Mar 17, 2026 at 02:21:20PM +0100, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 3/17/26 14:08, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > Thank you for this nice patch!
> > 
> > On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> >> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> >> for this variant to the rkcif driver and enable the MIPI CSI-2
> >> capture interfaces.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > 
> > [...]
> > 
> >>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
> >>  					      unsigned int index)
> >>  {
> >> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
> >>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
> >>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
> >>  
> >> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
> >> +
> > 
> > while this is the correct solution for rk3588, for the rk3568 vicap this
> > will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.
> 
> nice catch ;-) However, the TRM (at least my version) claims that this
> bit has a reset value of 0x1, so the bit in question should be already
> set in the first place. Thus I decided to *not* make variant specific
> code paths.

Yes, the reset value is indeed 0x1

> 
> Do you see problems in your setup?
> 

No problems, it works as expected, I was just confused to see the
mipi capture enable added with this rk3588 patch and not before.

I just find it a bit confusing but if a nicer solution is too much
hassle we can leave it like this.

--
Kind Regards
Mehdi Djait

