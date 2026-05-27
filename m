Return-Path: <linux-media+bounces-62850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJc5Fg6iFmqBnwcAu9opvQ
	(envelope-from <linux-media+bounces-62850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:49:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F635E09F9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F014300EF43
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2823CBE95;
	Wed, 27 May 2026 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c+uRvcLT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE439B949;
	Wed, 27 May 2026 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868105; cv=none; b=KH+kppgPoNEteL1+6yT9bjvLveBmwmsonvtfmEPTn+LVuKJA4wQupEBjDPd7eQIrTRBcEHosP0VDUmuGWxM5CHCyJkoPuqqOAbLnexEoAs08xxCWZFeoh59cOXHJHkcqUbAAomxEkdqWMjirdwk9ddHKeyujWVjZGkv8scuhS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868105; c=relaxed/simple;
	bh=tMPQ8gRw1l2kxM7BJtqHRx/Gs89K25JdPZuV9UiK7Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0sUQHyMg5bDQEkzLdkV9k0o2XtUjoY6iXvqCXO37892zqFlwmYWoAqpV+RQQNBjv9TzLCjk0ABHBYmONrVYhK9NHna6gtUOaXAc5Tj+zJD4JJh++41DRF0eYiC9wZGOExmVW5hrrSusLfLfIyurm1+2canO7k44d/Eq2eKzmSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c+uRvcLT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (62-193-63-110.as16211.net [62.193.63.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66FCD55;
	Wed, 27 May 2026 09:48:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779868081;
	bh=tMPQ8gRw1l2kxM7BJtqHRx/Gs89K25JdPZuV9UiK7Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+uRvcLTPMULSnB1WDUNYogb9UkGUTr6ZzQdeAFZiu/G6etu+W1vMuj1Kq/AxL6Qy
	 I++qKxJnUbiPgYpTJe0MGU581aOgvCepf8ZOC4FfQkYY2VgqDxV1Vi2fuStGpBm+g2
	 ReYFjqAEJzFGjwtV5uIANwR23Ye3Y8hXg5R0m6dM=
Date: Wed, 27 May 2026 09:48:17 +0200
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
Message-ID: <20260527074817.GA468138@killaraus.ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
 <0977c2c0-79ea-4435-9e1c-f54ca5e18342@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0977c2c0-79ea-4435-9e1c-f54ca5e18342@leemhuis.info>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-62850-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,ideasonboard.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: E7F635E09F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thorsten,

On Wed, May 27, 2026 at 09:35:03AM +0200, Thorsten Leemhuis wrote:
> On 5/6/26 23:56, Laurent Pinchart wrote:
> > This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
> > 
> > The change to format propagation in the BRx broke configuration of the
> > DRM pipeline. Revert it to fix the regression.
> 
> Laurent, is this still on your radar? From the outside it looks like
> this fix for the 7.1 regression should ideally go to Linus this week, as
> he ideally wants all known regression fixed by -rc6.
> 
> But it's easy to miss things from the outside, so if this is not a
> proper regression, the revert obsolete, or something like that, just
> mention it.

Thank you for the reminder. Hans, Mauro, this series seems to not have
been merged in the media fixes branch. Could you pick it up ?

> > The original commit was meant to fix a v4l2-compliance failure, with no
> > known userspace applications being affected beside test tools. Reverting
> > is the simplest option, a more comprehensive fix can be developed (and
> > tested more thoroughly) later.
> > 
> > Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
> > Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagation")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > index b1a2c68e9944..9d93cb8b8e82 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *subdev,
> >  		compose->height = format->height;
> >  	}
> >  
> > -	/*
> > -	 * Propagate the format code to all pads, and the whole format to the
> > -	 * source pad.
> > -	 */
> > +	/* Propagate the format code to all pads. */
> >  	if (fmt->pad == BRX_PAD_SINK(0)) {
> >  		unsigned int i;
> >  
> > -		for (i = 0; i < brx->entity.source_pad; ++i) {
> > +		for (i = 0; i <= brx->entity.source_pad; ++i) {
> >  			format = v4l2_subdev_state_get_format(state, i);
> >  			format->code = fmt->format.code;
> >  		}
> > -
> > -		format = v4l2_subdev_state_get_format(state, i);
> > -		*format = fmt->format;
> >  	}
> >  
> >  done:

-- 
Regards,

Laurent Pinchart

