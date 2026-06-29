Return-Path: <linux-media+bounces-66026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n0mMFEbnQmpaHgoAu9opvQ
	(envelope-from <linux-media+bounces-66026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:44:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC516DEEE5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:44:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=CRF0dSDM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66026-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66026-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E29623019F18
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1B33CAA5F;
	Mon, 29 Jun 2026 21:44:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B43B6356;
	Mon, 29 Jun 2026 21:44:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769467; cv=none; b=f0cGxCCmuVX0PavjuD0HpkGJPCRdaaBnhhuOySYxUj3JcL/EDR8RjWhfSjFph5PyTNc6pphndylW8CFRx5ptmeN6r69HT86zmc3SXE/WQuTFd0WKNvHcdP7LcDbBMmTBmIW5P2X+1J1WqnYk2IsILdD1s0bl1MKZJzf4pJ6C3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769467; c=relaxed/simple;
	bh=VntRchsGHa8Az/Gx57FacHavsecp170VwT//tMcTGWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeHMeol+eRgHxxMJ8k/f1ubc7CW+UjZS1NGrqiZFLrmL/GfbllzMarg5K2boEY4Qwq3Q8PwQpybbzJpwjgwOEX3cFLVjXG12ArmzbakPspOYzkowHujsf7IM39x/QptfiHHFpPZCCu8bDMGtqcN3Hcg7YAblFXoBEwb3CzXEkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CRF0dSDM; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F8291044;
	Mon, 29 Jun 2026 23:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782769420;
	bh=VntRchsGHa8Az/Gx57FacHavsecp170VwT//tMcTGWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRF0dSDMKACmjvhJsBtuszXwY0SnqO5fI8YG7BlRYs6KFhU3+lAOJZDKlTErECGtM
	 8KoWAvRZ9FJGbnTfMrZfLxBgKcV7uPHGN6KEe/UYqQ4UZtYrhAxLFs4e6CyvKQf+Bw
	 cEuJ3n+04o3gxKKauHUwYWiKG6CYhuwMzXhbXnPY=
Date: Tue, 30 Jun 2026 00:44:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Message-ID: <20260629214422.GL3054459@killaraus.ideasonboard.com>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
 <aiBqGVR11AZ-QI26@lizhi-Precision-Tower-5810>
 <aiCDwpd9rsPf1FxR@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiCDwpd9rsPf1FxR@lizhi-Precision-Tower-5810>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66026-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:bod@kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,vger.kernel.org:from_smtp,posteo.de:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC516DEEE5

On Wed, Jun 03, 2026 at 03:42:58PM -0400, Frank Li wrote:
> On Wed, Jun 03, 2026 at 01:53:29PM -0400, Frank Li wrote:
> > On Wed, Jun 03, 2026 at 12:15:40AM +0100, Bryan O'Donoghue wrote:
> > > At the media summit in Nice this year we discussed that cross reviewing
> > > from different people on LKML was lacking and desirable. Laurent suggested
> > > NXP/Qcom do some cross pollination.
> > >
> > > Happy to read and review NXP stuff in that spirit.
> > >
> > > Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> > > ---
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Laurent and Bryan O'Donoghue,
> 
> 	which qcom part I can help review, I can add myself as reviewer also.

Bryan, could you please reply to this ?

> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index efbf808063e50..8436428865aac 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
> > >  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
> > >  R:	Rui Miguel Silva <rmfrfs@gmail.com>
> > >  R:	Purism Kernel Team <kernel@puri.sm>
> > > +R:	Bryan O'Donoghue <bod@kernel.org>
> > >  L:	imx@lists.linux.dev
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained

-- 
Regards,

Laurent Pinchart

