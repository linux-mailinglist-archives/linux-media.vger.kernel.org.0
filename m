Return-Path: <linux-media+bounces-52352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8eo1AHuUiGmRrgQAu9opvQ
	(envelope-from <linux-media+bounces-52352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 14:49:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67220108D03
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 14:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED1CD301186C
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 13:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA36528851F;
	Sun,  8 Feb 2026 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TT5U8wUn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B318A6DB;
	Sun,  8 Feb 2026 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770558576; cv=none; b=ikWa1YWLCiHm4NO8udFFaJDtFB6oMxPYWp6IOBPKucxbi4c2GMd5dmUzSg1+hKQSCjZvkK9Xh9MgX3m3+8gdVgAYIqGFJsfrqXEtQbxg9ju9EGt6sOiMZ1dwRP29I7VKJWu4uAxMSBW/iLHFp39BSgK7xRXWXUvOqb+Al0EMR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770558576; c=relaxed/simple;
	bh=z/lRDSF6u/nv1GpO0eNxbNS7Odte0yOWZIoOE3ErYVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSZbfQuYLCIR6Yo8E0BypK7qgvQ0jv58cUbxNjCFqeLYdBbuDojJYCtYa97d+AVOfA9SMhAVL9KQ7KrGiJUpZ9fQsAhBRKfyRkuMlSpWddwuyIldIPqZF6V79v3dleIAATyQmdcqwNFulSFp/J/TJLP3uvHnkcf12he/Uk4xf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TT5U8wUn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65A8BC6C;
	Sun,  8 Feb 2026 14:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770558528;
	bh=z/lRDSF6u/nv1GpO0eNxbNS7Odte0yOWZIoOE3ErYVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT5U8wUnGnMs1tSLoKcUcpw4Xu0x2o3KKrkwdM/5HKgtzyyjsVReCFVyH6FqvDIWw
	 5uezApC6zS62IAlZPaA5gMwQIIR3Oab1zh62ulvzgRO0yWl/o/5X/yg/54TyF5dTIe
	 wShPFFP5tXe1oK3Mxy3C3JCti0aOTjWEk80S+mnU=
Date: Sun, 8 Feb 2026 15:49:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Fix possible ERR_PTR deference
Message-ID: <20260208134932.GP1376807@killaraus.ideasonboard.com>
References: <20260207094841.603932-1-alperyasinak1@gmail.com>
 <20260207212723.GN1376807@killaraus.ideasonboard.com>
 <CAGpma=7O5Uy1U-ePSixiyoWJremYk=x_L=oR19_VptgNAjen=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGpma=7O5Uy1U-ePSixiyoWJremYk=x_L=oR19_VptgNAjen=A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52352-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 67220108D03
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 02:07:48PM +0300, Alper Ak wrote:
> > Have you seen this happening ?
> 
> No, I haven't seen this happen in practice. This was reported by
> static analysis tool. Since the function explicitly documents these
> error cases, it seemed appropriate to add defensive error checking to
> avoid potential ERR_PTR dereference.

It's a false positive, this can't happen in practice due to the
MEDIA_PAD_FL_MUST_CONNECT flag being set on the RZG2L_CRU_IP_SINK pad.

In the future, please disclose usage of static analysis tools when you
submit patches.

> Laurent Pinchart, 8 Şub 2026 Paz, 00:27 tarihinde şunu yazdı:
> > On Sat, Feb 07, 2026 at 12:48:39PM +0300, Alper Ak wrote:
> > > The media_pad_remote_pad_unique() can return ERR_PTR() on failure
> > > (-ENOTUNIQ or -ENOLINK), but the code was dereferencing the return
> > > value without checking for errors. Add IS_ERR() check before
> > > dereferencing the pointer.
> >
> > Have you seen this happening ?
> >
> > > Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel information")
> > > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 162e2ace6931..a34c2188df1a 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -411,6 +411,12 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > >       int ret;
> > >
> > >       remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> > > +     if (IS_ERR(remote_pad)) {
> > > +             ret = PTR_ERR(remote_pad);
> > > +             dev_err(cru->dev, "Failed to get remote source pad: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > >       ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
> > >       if (ret < 0 && ret != -ENOIOCTLCMD) {
> > >               dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");

-- 
Regards,

Laurent Pinchart

