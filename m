Return-Path: <linux-media+bounces-57649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM0XE6KZymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:41:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E300535E105
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E49F0300D749
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9AD36CE1B;
	Mon, 30 Mar 2026 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gBmQdObi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D52366560;
	Mon, 30 Mar 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885274; cv=none; b=DDQQDAK9aJV/X69PzZ2d1BwnTLAzoG2512xTqMM4mwUIWENoVrHLa2T1X303NuWLXAgFruOUAsMBrY0Y8yz2ERnbHfaV+BICo8uAZtiEsSDTk/LK5sY4jTHpDZLS/s/lg0OvTY2RXufqBwI+2KP+lxE4bXBM6WHTaXvhjohi/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885274; c=relaxed/simple;
	bh=xaSzERUuJy7JnMaBD/nIS0H/EorknSGHlGyyizgShTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH+cn7xmUp7GreBvphHfLeqTZajXFjdp2EzSkpUUnX0UkfUzbzan5B/nNMUp3AAZckqTn1UB96Kumx4Je169liaYGWtvJ5u9VUWAGFlf3Dp+2WiJhH7o+lI7DHK+mH0tK+vblnBXiVv7NZHLzpaeLpQU6LxYvkkXRMitBH9Uu1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gBmQdObi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A47D531A5;
	Mon, 30 Mar 2026 17:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774885188;
	bh=xaSzERUuJy7JnMaBD/nIS0H/EorknSGHlGyyizgShTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBmQdObiOv+SX86h/cuGNczYimXJ0Ys04bDSLeRJh3T2swF2aHoGM8977Pt4B3Qv8
	 F3625fJu76fV1+RsPBqPFldv82Ln7N7IcWf6mLMiFy0ayHBXlcygaMuo1+mVA6Hzat
	 c5kxGCczqW3UWqxOFe+co76cof8gR3GzjesY91+o=
Date: Mon, 30 Mar 2026 18:41:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: David Carlier <devnexen@gmail.com>, mchehab@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, jacopo@jmondi.org,
	aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
Message-ID: <20260330154108.GA3389518@killaraus.ideasonboard.com>
References: <20260327222711.268132-1-devnexen@gmail.com>
 <acqM06YySijL1VpU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acqM06YySijL1VpU@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57649-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,jmondi.org,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: E300535E105
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:46:43AM -0400, Frank Li wrote:
> On Fri, Mar 27, 2026 at 10:27:11PM +0000, David Carlier wrote:
> > mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> > frees it on any probe failure path or in mxc_isi_remove(), leaking the
> > allocation on every failed probe and every normal unbind.
> >
> > Additionally, when mxc_isi_pipe_init() fails partway through the
> > channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> > pipes are not cleaned up — their media entities and mutexes are leaked.
> >
> > Fix both by adding kfree(isi->pipes) to all probe error paths and to
> > mxc_isi_remove(), and cleaning up already-initialized pipes in the
> > err_xbar error path.
> >
> > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISP Channel driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> 
> I think provide a helper function, devm_kzalloc_objs(), or using old
> devm_kzalloc is better fix method.

I quite agree. Kees said he's planning to introduce devm_kzalloc_objs().
I assume this will come in the next kernel version. I think we can wait
for that to fix this leak as it's a really minor issue.

> >  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 4bf8570e1b9e..ab32c5b6ac9c 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >
> >  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > -	if (isi->num_clks < 0)
> > +	if (isi->num_clks < 0) {
> > +		kfree(isi->pipes);
> >  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> > +	}
> >
> >

-- 
Regards,

Laurent Pinchart

