Return-Path: <linux-media+bounces-55668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKXGFe/2s2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:37:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4BC2824EB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE6B2305F520
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB1C37268C;
	Fri, 13 Mar 2026 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KL4PJ99q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625635F616;
	Fri, 13 Mar 2026 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401827; cv=none; b=UcAjgVdVSgd+YiJKS/RtGxrXqXzYlKpDeLFP835hp2QiTGp9W6bOB6yoJpq3vZNcbs/3KzhhSuck5/HDM0n53RZnKb1ovXbUMLNpFe18OujsJ4/Je+8uqjB+vXgmWl57hUmyZabyTVOW6WXBy+AnJnWAkxJII3zdoYxk+Y4Ubi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401827; c=relaxed/simple;
	bh=v+t/YcPItl9BmhKZbd4tDOxUNwcnc1sJiB9izierkCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTYHqZpvSaoCCpaLuL5TXIBv4sJHMuWlRC+lihAmFY0bfU8PmEvFPH2qyXy3kR3+eqPF++AzGq4h/fndmlu9C+/I/Xs7VQy/FBpva49cEe06XOjF0bFt56kvJ80Xg2gNR6vS8VM2Y4k5zAwn703du5M0VukQWfQGlMEIrNNGa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KL4PJ99q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-29-175.net.vodafone.it [5.90.29.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BFFEF52;
	Fri, 13 Mar 2026 12:35:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773401755;
	bh=v+t/YcPItl9BmhKZbd4tDOxUNwcnc1sJiB9izierkCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KL4PJ99qvyaJODrY+7+VkEkI9V16qA9u0cOROtX3a/yjoX4GcaSVx5pYBTU+bg3Ui
	 eUy0+mjj6jelyhDy5QTYYhgsPDt7KHFzENmnM9IVCktMMuItGWkSk9whL0TdYJTToP
	 P2cC4A+7ObzIu00OeJ3REEmSpcvQwZZYGLcDy7/c=
Date: Fri, 13 Mar 2026 12:37:00 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Anthony McGivern <anthony.mcgivern@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nayden Kanchev <Nayden.Kanchev@arm.com>, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/6] media: mali-c55: Fix Iridix bypass macros
Message-ID: <abP2maYiLNmnMFFr@zed>
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v1-4-21805b2b516b@ideasonboard.com>
 <36f2247c-cfd5-46b4-a16d-1afc3a6504d8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36f2247c-cfd5-46b4-a16d-1afc3a6504d8@ideasonboard.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55668-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: DA4BC2824EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, Mar 13, 2026 at 12:15:10PM +0100, Barnabás Pőcze wrote:
> 2026. 03. 13. 11:49 keltezéssel, Jacopo Mondi írta:
> > From: Daniel Scally <dan.scally@ideasonboard.com>
> >
> > The Mali C55 Iridix block has a digital gain function and tone mapping
> > function, whose enablement is controlled by two different bits
> > in the BYPASS_3 register.
> >
> > Unfortunately, the "Gain" and "Tonemap" bypass bit definitions are the
> > wrong way around. Swap them so that the ISP is now operated with the
> > "Iridix Gain" block enabled and default configured at a x1.0 gain and
> > with the "Iridix Tonemap" disabled, as it was originally intended.
>
> As far as I can see the current upstream driver does not bypass either of them,
> so swapping them will have no direct effect.

You're right, I swapped the patch order and in this version I sent out
this comes before the actual iridix bypass

>
>
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 8ec187829a4c ("media: mali-c55: Fix Iridix bypass macros")
>
> Where is this commit? I cannot seem to find it.

Clearly, this doesn't make sense. I generated the fixes tag pointing
it to this patch. I'll fix, thanks.

>
>
> Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
>
>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   drivers/media/platform/arm/mali-c55/mali-c55-registers.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > index f5a148add1c8..f098effde7b4 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > @@ -128,8 +128,8 @@ enum mali_c55_interrupts {
> >   #define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
> >   #define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
> >   #define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
> > -#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
> > -#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
> > +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(5)
> > +#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(6)
> >   #define MALI_C55_REG_BYPASS_4				0x18ec0
> >   #define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
> >   #define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
> >
>

