Return-Path: <linux-media+bounces-66656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EMFRDJM/S2rdOAEAu9opvQ
	(envelope-from <linux-media+bounces-66656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:39:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320C70CA93
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 07:39:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=DZIofuqG;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66656-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66656-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94B51301A521
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 05:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8299D3BE644;
	Mon,  6 Jul 2026 05:39:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA263AEF36;
	Mon,  6 Jul 2026 05:39:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316348; cv=none; b=BqOdK82evYud5i6/tWzkofE1VNODiAjN1cmFT+Dm21K4L5L9zRtSgQUekeCI2YUfDV5UKcqxLf/DQGJCBX0iAWKgfiKT4G/FqkiRhRlLVbTZRAx+AHT7QLKqJ0Q4L/D6XTiGWkKgx0WRRqY0jLgreMrdTidfTln73SY4odtutL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316348; c=relaxed/simple;
	bh=QoBk2MJt5q5R2u0f27bQBWEiEBvkGW/NVJ/zWtTl7uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPnLyWIfPiW0LAyjbwtIw8+YdrRMttMuajt1bL1SeWitFojAcSHBJw06nVlKae7TpSvZcK2IkU4pYPqv6ukxMLKwsZIBZ6FEvzEMLXx4KyMuix7bn+Nxo4P5EGy+ipFxZyMztMCJuyCJivjTRq7V0HQt9M1pxHKvmqS0jE2oB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DZIofuqG; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-60-81.net.vodafone.it [109.113.60.81])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB062524;
	Mon,  6 Jul 2026 07:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783316296;
	bh=QoBk2MJt5q5R2u0f27bQBWEiEBvkGW/NVJ/zWtTl7uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZIofuqGTgmVRCs2r0RqpDUtxpc3QUJZv600xzY9pXgX6HZ0FrlUYHY3KxCWahlJi
	 15+L/fQLkplnsC6Dwoch4b5vWzBO2ldrna68RmL+k+P1lD2LEj0F2vwrYKCdyPydJn
	 mZ9lMXlgA0ZuHs3J1A7DZzDu2pUftp1dxY/9QvOU=
Date: Mon, 6 Jul 2026 07:38:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	David Carlier <devnexen@gmail.com>, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <aks7usxfDajS-W_5@zed>
References: <20260702103453.348056-1-devnexen@gmail.com>
 <akd8E5jr722oTm49@zed>
 <20260703221651.41669d55@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703221651.41669d55@pumpkin>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66656-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:jacopo.mondi@ideasonboard.com,m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zed:mid,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9320C70CA93

Hi David

On Fri, Jul 03, 2026 at 10:16:51PM +0100, David Laight wrote:
> On Fri, 3 Jul 2026 11:44:31 +0200
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> > Hi David,
> >    thanks for sending a patch to address this issue
> >
> > On Thu, Jul 02, 2026 at 11:34:53AM +0100, David Carlier wrote:
> > > mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
> > > into the ISP registers four at a time by casting the zone_weights array
> > > to u32 and dereferencing it. The array sits at offset 10 within the
> > > parameter block, so it is only 2-byte aligned: the u32 access is
> > > unaligned, which is undefined behaviour and can fault on strict-align
> > > configurations or once the loop is auto-vectorised.
> >
> > well, I don't there is a risk of undefined behaviour on ARMv8, it's
> > just less efficient
> >
> > >
> > > The cast also reads the four weights in host byte order before they are
> > > written to the little-endian register, so on big-endian hosts the four
> > > weights packed into each register end up in the wrong byte lanes.
> >
> > Also we don't have any endianess issue as the IP is only found on
> > little endian systems
> >
> > >
> > > Read the weights with get_unaligned_le32() instead, which is both
> > > alignment-safe and fixes the byte order regardless of host endianness.
> > >
> >
> > mmm, I read in Documentation/core-api/unaligned-memory-access.rst
> > that:
> >
> > ------------------------------------------------------------------------------
> > 	u32 value = get_unaligned((u32 *) data);
> >
> > These macros work for memory accesses of any length (not just 32 bits as
> > in the examples above). Be aware that when compared to standard access of
> > aligned memory, using these macros to access unaligned memory can be costly in
> > terms of performance.
> >
> > If use of such macros is not convenient, another option is to use memcpy(),
> > where the source or destination (or both) are of type u8* or unsigned char*.
> > Due to the byte-wise nature of this operation, unaligned accesses are avoided.
> > ------------------------------------------------------------------------------
> >
> > Which seems to suggest, if the issue here is performances, we should
> > aim for something different ? (honest question here, any kind of
> > guidance is appreciated)
> >
> > > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > > Cc: stable@vger.kernel.org
> >
> > If it's only about performances, does this qualifies as a fix ?
> >
> > > Signed-off-by: David Carlier <devnexen@gmail.com>
> > > ---
> > >  drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > index de0e9d898..1aaf64dde 100644
> > > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >  #include <linux/media/arm/mali-c55-config.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/unaligned.h>
> > >
> > >  #include <media/media-entity.h>
> > >  #include <media/v4l2-dev.h>
> > > @@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> > >  	 * of overwriting other registers.
> > >  	 */
> > >  	for (unsigned int i = 0; i < 56; i++) {
> > > -		val = ((u32 *)params->zone_weights)[i]
> > > +		val = get_unaligned_le32(&params->zone_weights[i * 4])
> > >  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
>
> On LE with HAVE_EFFICIENT_UNALIGNED_ACCESS the latter generates what you
> expect the former to generate.
> But gcc can unroll loops and use (IIRC) 'rdp' to read two registers at once.
> That will crash and burn.
>
> The best thing would be to have a union of the two arrays with the
> member marked __packed to remove the padding before it.
>

I'm not sure I got what are the "two arrays" you mentioned here.

params->zone_weights[] is uABI, it's hard to change its definition
without really good motivations.

> >
> >
> > We could do:
> >
> >         memcpy(&val, &params->zone_weights[4 * i], 4);
>
> Some of the KASAN (etc) builds might make a mess of that.
> Without compiler optimisations of memcpy() it is horrid.
>
> >         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> >
> >         mali_c55_ctx_write(mali_c55, addr,
> >                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> >
> > Or this could be an alternative:
> >
> >         const u8 *w = &params->zone_weights[4 * i];
> >
> >         val = w[0] | w[1] << 8 | w[2] << 16 | w[3] << 24;
>
> That is a possible implementation of get_unaligned_le32() no point
> doing it explicitly.
>
> A late enough gcc will convert that to a 32bit memory read (with any
> byteswap in the read or after) if unaligned accesses are supported.
> Otherwise you get byte loads, shifts and ors.
>

To sum it up: since we can't change uABI easily, the best thing here
is not change anything and drop this patch ?


> 	David
>
> >         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> >
> >         mali_c55_ctx_write(mali_c55, addr,
> >                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> >
> > What do you think ?
> >
> > >  		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > >
> > > --
> > > 2.53.0
> > >
> > >
> >
>

