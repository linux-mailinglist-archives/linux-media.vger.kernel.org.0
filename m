Return-Path: <linux-media+bounces-66021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NRI7HZ3RQmqiDQoAu9opvQ
	(envelope-from <linux-media+bounces-66021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 22:12:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D546DE8F3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 22:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=kgMt+ArE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66021-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66021-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 395FE3037896
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F591343891;
	Mon, 29 Jun 2026 20:11:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014334041F
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 20:11:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763895; cv=none; b=TM41Bu8KgPcyQIlFj9/ynY1eKELcyhpa12ZNbomVLMe9pV30oH6BP7pH4ruypdYlfXii3UJaTseIL3vZYWsux8gy8M9fDv9tsEkNY+2cO3b6PD8lZfUQa4AKWu9kdLdfyncZH1FueHwNL/g9HNKZ9FzLUu2/kovWwRmFrZ5QA9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763895; c=relaxed/simple;
	bh=5zibFaaJ2i9c4VvL04fCwfdst6jKwKQOXsEqL2D8mOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAWtlp+PNygFKou0Oq8ktn7kTN9Cs9V42HPzbdgTtw3kf6KrpoGgqTTF2sCCD+HWAGP1Q62RfnfsJ2N3moAKTIrFndLRFZ9u6QatUtbJMUHikrtkaoqqxqK4gPHnhWL431fntLCXZY2hDxMQt2Fko/F0sIlcirBFhsscRdlmO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kgMt+ArE; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EE128D4;
	Mon, 29 Jun 2026 22:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782763848;
	bh=5zibFaaJ2i9c4VvL04fCwfdst6jKwKQOXsEqL2D8mOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgMt+ArE2IZHAo9SBZdeemfD23FkpRAr/nFozgT/sKwBoJK3N5BDiHzGBm6o9juvS
	 XOXRt0pUqs0oY7yKilK920RyC2vdHl+vuXwG/9yyeCaLFOqGsoxrntQP5UAlROZMCp
	 DTrJDOo75xS/+rfi5FyA+OoYWx1P4zvYFl128m0w=
Date: Mon, 29 Jun 2026 23:11:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>, imx@lists.linux.dev
Subject: Re: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor
 clamping
Message-ID: <20260629201130.GJ3054459@killaraus.ideasonboard.com>
References: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
 <178276171937.2424554.17141585139727533269.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178276171937.2424554.17141585139727533269.b4-ty@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66021-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:linux-media@vger.kernel.org,m:Frank.Li@nxp.com,m:guoniu.zhou@nxp.com,m:aisheng.dong@nxp.com,m:jacopo@jmondi.org,m:imx@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4D546DE8F3

Hi Frank,

On Mon, Jun 29, 2026 at 03:35:27PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> 
> On Wed, 20 May 2026 22:27:38 +0200, Laurent Pinchart wrote:
> > The total scaling factor including bi-linear downscaling and decimation
> > is clamped to 16. The bilinear factor calculation therefore produceds
> > values guaranteed not to exceed the maximum factor of 2.0. The clamping
> > is unneeded, drop it.
> > 
> > Note that the ISI_DOWNSCALE_THRESHOLD value of 0x4000 is incorrect, as
> > that would be a factor of 4.0. This was inconsequential given that the
> > computed factor never exceeded 0x2000.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] media: nxp: imx8-isi: Drop unneeded downscaling factor clamping
>       commit: 5f074ef2f1fa19d8730f5c0329ff2f7633639875

Please note that you are not supposed to push patches to the media
committers tree if you're not listed in the MAINTAINERS file for the
driver (as listed as a Linux media submaintainer for the specific part
of the subsystem).

-- 
Regards,

Laurent Pinchart

