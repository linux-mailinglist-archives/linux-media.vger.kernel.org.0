Return-Path: <linux-media+bounces-59823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIKNDjB/8GnFUAEAu9opvQ
	(envelope-from <linux-media+bounces-59823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:34:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D280D481840
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E23953019D96
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E5D3C276E;
	Tue, 28 Apr 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nkwznhJb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AB3A9615;
	Tue, 28 Apr 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368844; cv=none; b=GoPIDqtV+mHXZqR87ob/+WBJLCj9pvryWDDuHxoGhZcH5F4fyyMUdVhK8ppUJes6wdZ2IUP9zhYRDKKxkrGAht2rkPqOWIW5fK+8aTcvMSzsuisOAW2PIIsen3a/btFmD9hui6yMxf3YE6zp2L1PmEy4sAfA8u0fQgg6pS1jnp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368844; c=relaxed/simple;
	bh=xpOlGGmOv3cLf9mk9cBcOM7N7/bUyRS/4/CjojbEQBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k42QCqB6RboDefk2sFVAt4FV7xDWQjvT4FCzePiIvDJSTy5Uac5+JGx7pGy1aVakFWDfXNRN+qsq2uAW4Ls3HaGS/mJ1aDXvpbjjOMPmACZ4k7sTJ9yvFAxtNumj8S3rdRPVFN22fYRMT8ZXTpyV2R1UxBbmSHz4VlfYMc8iccQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nkwznhJb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0ECBE91;
	Tue, 28 Apr 2026 11:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777368739;
	bh=xpOlGGmOv3cLf9mk9cBcOM7N7/bUyRS/4/CjojbEQBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkwznhJbKpCWrpKzFrTN79MTOU0JlHeliBVL+h6imNKfs38j2HsFsNFd86N8oKn/D
	 R55BqJEW9n8vpyjpL7Z66IEzjcXSyEtb8SOk8a07GItJ4aswKRioYaju8xF+qedJaY
	 bXHBcIhf6qyzwk/eJzcDnFRz5l3D6yyQDOkhIBG8=
Date: Tue, 28 Apr 2026 12:34:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] Revert "media: renesas: vsp1: brx: Fix format
 propagation"
Message-ID: <20260428093400.GB4076452@killaraus.ideasonboard.com>
References: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
 <CA+V-a8uL7PAkSSvK+Qj3N3Z9LXe_B-nGJdfn9qG9rA6sXo34aQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uL7PAkSSvK+Qj3N3Z9LXe_B-nGJdfn9qG9rA6sXo34aQ@mail.gmail.com>
X-Rspamd-Queue-Id: D280D481840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59823-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,renesas.com:email,killaraus.ideasonboard.com:mid]

On Tue, Apr 28, 2026 at 10:03:00AM +0100, Lad, Prabhakar wrote:
> On Sat, Apr 25, 2026 at 10:50 PM Laurent Pinchart wrote:
> >
> > This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
> >
> > The change to format propagation in the BRx broke configuration of the
> > DRM pipeline. Revert it to fix the regression.
> >
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
> > This is a fix for a v7.1 regression.
> >
> > Prabhakar, I have test this on R-Car Gen3 with
> > kms-test-plane-position.py and it fixes the regression I reproduced. The
> > symptoms were not identical to the ones you reported on RZ/V2H, so I
> > would appreciated if you could confirm that the patch fixes the
> > regression for you too.
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thank you. I however noticed that this revert introduces a vsp-tests
failure :-( I'll post a v2 that reverts a second patch as well.

> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > index b1a2c68e9944..9d93cb8b8e82 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *subdev,
> >                 compose->height = format->height;
> >         }
> >
> > -       /*
> > -        * Propagate the format code to all pads, and the whole format to the
> > -        * source pad.
> > -        */
> > +       /* Propagate the format code to all pads. */
> >         if (fmt->pad == BRX_PAD_SINK(0)) {
> >                 unsigned int i;
> >
> > -               for (i = 0; i < brx->entity.source_pad; ++i) {
> > +               for (i = 0; i <= brx->entity.source_pad; ++i) {
> >                         format = v4l2_subdev_state_get_format(state, i);
> >                         format->code = fmt->format.code;
> >                 }
> > -
> > -               format = v4l2_subdev_state_get_format(state, i);
> > -               *format = fmt->format;
> >         }
> >
> >  done:

-- 
Regards,

Laurent Pinchart

