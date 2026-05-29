Return-Path: <linux-media+bounces-63025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACoKEp5rGWrGwQgAu9opvQ
	(envelope-from <linux-media+bounces-63025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 12:34:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D387D600E46
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 12:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E233314E14E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6963B3C3C00;
	Fri, 29 May 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KU3zG31W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C99C3C7DF1;
	Fri, 29 May 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050645; cv=none; b=LTKRW+i/Xz25GYCjpSa0UiXwI7gHRYsWglVW98nSuzkfMZWbLzK4BGWEk6zMaAwwMiQAi6t4c9sZJC8HfrBvBwhNS80hkNeoXD+K6r5j4bBxDoIMGHf9Z1DVFR41aWMJTrK3SdEpmT2PdJX10fYa6fXBJoMf3PfvksKcwZAkiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050645; c=relaxed/simple;
	bh=NdIG7Ww5G0F8LZX380aJn8V319Vfxe4XWWMwSLvoH8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF3QqszJUn0UFeFy8neQRgRQf95UjvMD3OCBZFC6qOSGxmqCLRMKoabhdyDaTFZ4GT7zotfKQNdxMkJWepesjWLfo/ixHWHIGXGG1TizFmjLndhRCJcVdBAE1T4CgKNcgi1NzHAT2gwNlqol6rmJkp9j1/t4VbC2ULhf8ijNrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KU3zG31W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (184.31.0.109.rev.sfr.net [109.0.31.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10CFB741;
	Fri, 29 May 2026 12:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780050623;
	bh=NdIG7Ww5G0F8LZX380aJn8V319Vfxe4XWWMwSLvoH8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU3zG31WChpN6/Uwk7EOnE90REjap9ximnKtS6PqoKZs4MzmqucMfDPKLu6GO73I/
	 gwdahIgWHTitHJg652lJhsOM+JZyDXzSlb4B+Z4tdxsxDm3PrTLm20JADiemyDj3ar
	 V51D931fwwofA5wK35bLB6BLdgPxG9JtIf9Ukbk4=
Date: Fri, 29 May 2026 12:30:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/2] Revert "media: renesas: vsp1: brx: Fix format
 propagation"
Message-ID: <20260529103042.GA680101@killaraus.ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
 <0977c2c0-79ea-4435-9e1c-f54ca5e18342@leemhuis.info>
 <20260527074817.GA468138@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527074817.GA468138@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-63025-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,renesas.com:email,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D387D600E46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 09:48:17AM +0200, Laurent Pinchart wrote:
> On Wed, May 27, 2026 at 09:35:03AM +0200, Thorsten Leemhuis wrote:
> > On 5/6/26 23:56, Laurent Pinchart wrote:
> > > This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
> > > 
> > > The change to format propagation in the BRx broke configuration of the
> > > DRM pipeline. Revert it to fix the regression.
> > 
> > Laurent, is this still on your radar? From the outside it looks like
> > this fix for the 7.1 regression should ideally go to Linus this week, as
> > he ideally wants all known regression fixed by -rc6.
> > 
> > But it's easy to miss things from the outside, so if this is not a
> > proper regression, the revert obsolete, or something like that, just
> > mention it.
> 
> Thank you for the reminder. Hans, Mauro, this series seems to not have
> been merged in the media fixes branch. Could you pick it up ?

I have sent a pull request:

https://lore.kernel.org/linux-media/20260529102955.GA675012@killaraus.ideasonboard.com

> > > The original commit was meant to fix a v4l2-compliance failure, with no
> > > known userspace applications being affected beside test tools. Reverting
> > > is the simplest option, a more comprehensive fix can be developed (and
> > > tested more thoroughly) later.
> > > 
> > > Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
> > > Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagation")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
> > >  1 file changed, 2 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > index b1a2c68e9944..9d93cb8b8e82 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *subdev,
> > >  		compose->height = format->height;
> > >  	}
> > >  
> > > -	/*
> > > -	 * Propagate the format code to all pads, and the whole format to the
> > > -	 * source pad.
> > > -	 */
> > > +	/* Propagate the format code to all pads. */
> > >  	if (fmt->pad == BRX_PAD_SINK(0)) {
> > >  		unsigned int i;
> > >  
> > > -		for (i = 0; i < brx->entity.source_pad; ++i) {
> > > +		for (i = 0; i <= brx->entity.source_pad; ++i) {
> > >  			format = v4l2_subdev_state_get_format(state, i);
> > >  			format->code = fmt->format.code;
> > >  		}
> > > -
> > > -		format = v4l2_subdev_state_get_format(state, i);
> > > -		*format = fmt->format;
> > >  	}
> > >  
> > >  done:

-- 
Regards,

Laurent Pinchart

