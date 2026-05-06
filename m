Return-Path: <linux-media+bounces-60593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAUmFAI6+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:54:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4B4DA912
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14FE8306B110
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87B401A11;
	Wed,  6 May 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ptno7vSD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C03FA5FF;
	Wed,  6 May 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071764; cv=none; b=qjPvGR9BkuZaH1YIw6w7v0KN9Jg0azazMzRLpR1hxDyov0lMQx+fX/bFEwHBFC+hLYN3K9ly8Z2/Aww8j7PXbSZefatY1AjdKTJEUSIr5U7f8lOOOc5CtzGynde/8MGq05epmvvlo/OTgPX7VxgA0S6X7B8lIdbw1OL3gYCHEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071764; c=relaxed/simple;
	bh=DuKkAM8zgu3C6odRXS0BgAJ9k5Xa+l28U9H+xIGpQRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVh+L7P0zSZn6FPjAcYF+CWTmgcu+k+lhhggOhoTMwy3MJw5SfeFdYw1uFFh/fIesJjBjLbYKphkncNIZQSKmmr1UrfCMfbefRsKifXN3XnX9q9B1J7gOLT06IeKfjFkAG4nt8zVAzWy1gnOOKz0dIJUYktO0K55L0E5T92laWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ptno7vSD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D72B63D;
	Wed,  6 May 2026 14:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778071757;
	bh=DuKkAM8zgu3C6odRXS0BgAJ9k5Xa+l28U9H+xIGpQRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ptno7vSDnOfojk8eyP2rF5O9ERRrAUPacwU2ITOE4q70HDQzITXVd8pJf+l+nyJAG
	 6rdSlfSMUah/cKd3/7arIOjGBwATBxMSmGTH1tPCeBYysaTe2GmR/uJISdRFi0R0J+
	 E55aowcLpoijqQKYYwX2pA2ex3KFAvOrpxZgm3yo=
Date: Wed, 6 May 2026 14:49:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [v8 00/14] media: Add support for R-Car ISP using Dreamchip
 RPPX1 ISP
Message-ID: <afs3U2zudfJEXkY4@zed>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
 <20260506122954.GL683841@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506122954.GL683841@ragnatech.se>
X-Rspamd-Queue-Id: D3D4B4DA912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60593-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,linuxtv.org:url,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]

Hello,

On Wed, May 06, 2026 at 02:29:54PM +0200, Niklas Söderlund wrote:
> Hi Geert,
>
> On 2026-05-06 14:19:28 +0200, Geert Uytterhoeven wrote:
> > Hi Niklas,
> >
> > On Mon, 4 May 2026 at 03:08, Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > This series adds support for two different devices that together enable
> > > ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
> > > is for Dreamchip RPPX1 ISP, this device purely deals with image
> > > processing algorithms, statistics and image conversion; but have no DMA
> > > engines. The second driver is for the R-Car ISP CORE, this device
> > > deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> > > interface for the ISP.
> >
> > Thanks for your series!
> >
> > > This series depends on the ISP extensible statistics definitions
> > > out-of-tree patches.
> >
> > So that is:
> >   1. "[PATCH v1 00/11] media: Add iMX95 neoisp driver"
> >      https://lore.kernel.org/20260413160331.2611829-1-antoine.bouyer@nxp.com/
> >      for v4l2_isp_block_header,
> >   2. Jacopo's reply https://lore.kernel.org/aeHd0G_JDaROMWDd@zed/
> >      for v4l2_isp_buffer_size.
> >
> > However, that still leaves me with undefined struct v4l2_isp_block_type_info,
> > and lore couldn't help in locating the patch series that adds it :-(

This version is based on a preliminary version of the extensible
statistics. I can provide you the patches in case you're interested.

>
> As Jacopo have kindly pointed out to me in private, this work was based
> on an early version of [2] that was not published, but as I found [1] I
> thought it was.
>
> I will rebase this on [2] and address Jacopo's comments and repost.

Don't :)

Please re-base on:
https://patchwork.linuxtv.org/project/linux-media/list/?series=24772
which I sent yesterday instead.

If you're using b4 you can simply point the pre-requisites to this

change-id: 20260504-extensible-stats-f2d6befcc1ce

Thanks
  j

>
> >
> > Where can I find it? Thanks!
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
>
> --
> Kind Regards,
> Niklas Söderlund

