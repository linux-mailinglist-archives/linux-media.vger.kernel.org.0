Return-Path: <linux-media+bounces-66783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yO5kNoXQS2oQawEAu9opvQ
	(envelope-from <linux-media+bounces-66783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:57:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212A712E76
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=h2Vz2KvB;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66783-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66783-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1E433069951
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D8E3F413B;
	Mon,  6 Jul 2026 14:42:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEB39891D;
	Mon,  6 Jul 2026 14:42:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348933; cv=none; b=C4g6NQiI9d4RWxRIWxJdInZs3VVCy1q+9BjzS/uVBrUkxXmlSbCPN8iHeBRAd8HCOgFsP4peS3zB2jZqMYoC1jI8x/6DdUoVkdbVyh+Oy+DDFe6xuUut9T/3lWZ724PjEJatm74uqPet5u+QBR+k2NYrtfhogzQ27pr/qYTm+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348933; c=relaxed/simple;
	bh=0J4ty6XExXuLs6ABjPjmyHfjJX1uMzYkIamd2qVVrAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqeCOQMXX9gcC/JeCj4hK/MGNF61YsP1/SQn17EKKcplV5Ap2BkgeVVf+E1zX+zDvD+yPqni5hcSvr/u4RIAp6Vd2vZJWhCTvmCYJUqtrsVyZ0UxfSqyI+Wo9y9rvnDzXqToUMS/VOgqUuiYW+q2wAwQQSbBRSpOsIVpNmrwG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h2Vz2KvB; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-60-81.net.vodafone.it [109.113.60.81])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 971D633D;
	Mon,  6 Jul 2026 16:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783348879;
	bh=0J4ty6XExXuLs6ABjPjmyHfjJX1uMzYkIamd2qVVrAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2Vz2KvBvnhCM5gVweSWCDLm4HVAeZjs91jdAEN1SyA/m2J8Hl7Yqy+NGjeezrZHB
	 2qiyRWcsLgPRnpnSlvGBfofaQbXPCYiDRnFlXmCdYfWH/P0nSCnIuhB5gpkR+xHqNv
	 RDM9oO8u+PGfWP2H9bBYRiudYhnHVhyrWpvDLfTY=
Date: Mon, 6 Jul 2026 16:42:04 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, David Carlier <devnexen@gmail.com>, dan.scally@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <aku6R_EI0kLUqD8e@zed>
References: <20260702103453.348056-1-devnexen@gmail.com>
 <akd8E5jr722oTm49@zed>
 <20260703221651.41669d55@pumpkin>
 <aks7usxfDajS-W_5@zed>
 <20260706104652.GB66892@killaraus.ideasonboard.com>
 <20260706133956.39a11738@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706133956.39a11738@pumpkin>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66783-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,zed:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6212A712E76

Hi Laurent, David

On Mon, Jul 06, 2026 at 01:39:56PM +0100, David Laight wrote:
> On Mon, 6 Jul 2026 13:46:52 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > On Mon, Jul 06, 2026 at 07:38:58AM +0200, Jacopo Mondi wrote:
> > > On Fri, Jul 03, 2026 at 10:16:51PM +0100, David Laight wrote:
> > > > On Fri, 3 Jul 2026 11:44:31 +0200 Jacopo Mondi wrote:
> > > > > On Thu, Jul 02, 2026 at 11:34:53AM +0100, David Carlier wrote:
> > > > > > mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
> > > > > > into the ISP registers four at a time by casting the zone_weights array
> > > > > > to u32 and dereferencing it. The array sits at offset 10 within the
> > > > > > parameter block, so it is only 2-byte aligned: the u32 access is
> > > > > > unaligned, which is undefined behaviour and can fault on strict-align
> > > > > > configurations or once the loop is auto-vectorised.
> > > > >
> > > > > well, I don't there is a risk of undefined behaviour on ARMv8, it's
> > > > > just less efficient
> > > > >
> > > > > > The cast also reads the four weights in host byte order before they are
> > > > > > written to the little-endian register, so on big-endian hosts the four
> > > > > > weights packed into each register end up in the wrong byte lanes.
> > > > >
> > > > > Also we don't have any endianess issue as the IP is only found on
> > > > > little endian systems
> > > > >
> > > > > > Read the weights with get_unaligned_le32() instead, which is both
> > > > > > alignment-safe and fixes the byte order regardless of host endianness.
> > > > >
> > > > > mmm, I read in Documentation/core-api/unaligned-memory-access.rst
> > > > > that:
> > > > >
> > > > > ------------------------------------------------------------------------------
> > > > > 	u32 value = get_unaligned((u32 *) data);
> > > > >
> > > > > These macros work for memory accesses of any length (not just 32 bits as
> > > > > in the examples above). Be aware that when compared to standard access of
> > > > > aligned memory, using these macros to access unaligned memory can be costly in
> > > > > terms of performance.
> > > > >
> > > > > If use of such macros is not convenient, another option is to use memcpy(),
> > > > > where the source or destination (or both) are of type u8* or unsigned char*.
> > > > > Due to the byte-wise nature of this operation, unaligned accesses are avoided.
> > > > > ------------------------------------------------------------------------------
> > > > >
> > > > > Which seems to suggest, if the issue here is performances, we should
> > > > > aim for something different ? (honest question here, any kind of
> > > > > guidance is appreciated)
> > > > >
> > > > > > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > > > > > Cc: stable@vger.kernel.org
> > > > >
> > > > > If it's only about performances, does this qualifies as a fix ?
> > > > >
> > > > > > Signed-off-by: David Carlier <devnexen@gmail.com>
> > > > > > ---
> > > > > >  drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > > > > index de0e9d898..1aaf64dde 100644
> > > > > > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > > > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >   */
> > > > > >  #include <linux/media/arm/mali-c55-config.h>
> > > > > >  #include <linux/pm_runtime.h>
> > > > > > +#include <linux/unaligned.h>
> > > > > >
> > > > > >  #include <media/media-entity.h>
> > > > > >  #include <media/v4l2-dev.h>
> > > > > > @@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> > > > > >  	 * of overwriting other registers.
> > > > > >  	 */
> > > > > >  	for (unsigned int i = 0; i < 56; i++) {
> > > > > > -		val = ((u32 *)params->zone_weights)[i]
> > > > > > +		val = get_unaligned_le32(&params->zone_weights[i * 4])
> > > > > >  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
> > > >
> > > > On LE with HAVE_EFFICIENT_UNALIGNED_ACCESS the latter generates what you
> > > > expect the former to generate.
> > > > But gcc can unroll loops and use (IIRC) 'rdp' to read two registers at once.
> > > > That will crash and burn.
> > > >
> > > > The best thing would be to have a union of the two arrays with the
> > > > member marked __packed to remove the padding before it.
> > >
> > > I'm not sure I got what are the "two arrays" you mentioned here.
> > >
> > > params->zone_weights[] is uABI, it's hard to change its definition
> > > without really good motivations.
> > >
> > > > > We could do:
> > > > >
> > > > >         memcpy(&val, &params->zone_weights[4 * i], 4);
> > > >
> > > > Some of the KASAN (etc) builds might make a mess of that.
> > > > Without compiler optimisations of memcpy() it is horrid.
> > > >
> > > > >         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > > > >
> > > > >         mali_c55_ctx_write(mali_c55, addr,
> > > > >                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> > > > >
> > > > > Or this could be an alternative:
> > > > >
> > > > >         const u8 *w = &params->zone_weights[4 * i];
> > > > >
> > > > >         val = w[0] | w[1] << 8 | w[2] << 16 | w[3] << 24;
> > > >
> > > > That is a possible implementation of get_unaligned_le32() no point
> > > > doing it explicitly.
> > > >
> > > > A late enough gcc will convert that to a 32bit memory read (with any
> > > > byteswap in the read or after) if unaligned accesses are supported.
> > > > Otherwise you get byte loads, shifts and ors.
> > >
> > > To sum it up: since we can't change uABI easily, the best thing here
> > > is not change anything and drop this patch ?
> >
> > Doesn't the patch fix a real problem ?
> >

Does it ?

I'm still going under the assumption unaligned access on ARMv8 is
supported at the cost of loosing atomicity. Unfortunately, I can't
find any clear answer in

https://developer.arm.com/documentation/ddi0487/mc/-Part-B-The-AArch64-Application-Level-Architecture/-Chapter-B2-The-AArch64-Application-Level-Memory-Model/-B2-10-Memory-types-and-attributes/-B2-10-1-Normal-memory?lang=en

or
https://developer.arm.com/documentation/ddi0487/mc/-Part-B-The-AArch64-Application-Level-Architecture/-Chapter-B2-The-AArch64-Application-Level-Memory-Model/-B2-8-Alignment-support?lang=en

However, looking at HAVE_EFFICIENT_UNALIGNED_ACCESS

arch/Kconfig:config HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/Kconfig-   bool
arch/Kconfig-   help
arch/Kconfig-     Some architectures are unable to perform unaligned accesses
arch/Kconfig-     without the use of get_unaligned/put_unaligned. Others are
arch/Kconfig-     unable to perform such accesses efficiently (e.g. trap on
arch/Kconfig-     unaligned access and require fixing it up in the exception
arch/Kconfig-     handler.)
arch/Kconfig-
arch/Kconfig-     This symbol should be selected by an architecture if it can
arch/Kconfig-     perform unaligned accesses efficiently to allow different
arch/Kconfig-     code paths to be selected for these cases. Some network
arch/Kconfig-     drivers, for example, could opt to not fix up alignment
arch/Kconfig-     problems with received packets if doing so would not help
arch/Kconfig-     much.
arch/Kconfig-
arch/Kconfig-     See Documentation/core-api/unaligned-memory-access.rst for more
arch/Kconfig-     information on the topic of unaligned memory accesses.

which is selected by arm64

$ git grep HAVE_EFFICIENT_UNALIGNED_ACCESS  arch/arm64/Kconfig
arch/arm64/Kconfig:     select HAVE_EFFICIENT_UNALIGNED_ACCESS

The symbol description defers to
Documentation/core-api/unaligned-memory-access.rst which in chapter

Code that causes unaligned access
=================================

seems to clarify this is a non-issue ?


> > Fixing the uABI would be best, but as you mentioned that's more
> > difficult (the faulty structure got merged recently in v6.19 and we
> > most likely control userspace, but still).
>
> It is certainly possible to change how the structure is described without
> changing the binary format.
> eg:
> 	union {
> 		u8 zone_weights[256];
> 		u32 zone_weights_32[64] __attribute__((packed));
> 	};

Maybe I mis-understood your suggestion, but I don't see why this would
change the offset at which zone_weights is placed in the struct which
contains it.

Running this through pahole (note I've s/64/56 as the zone_weights[]
array is 255 bytes)

struct mali_c55_params_aexp_weights {
	struct v4l2_isp_params_block_header header;
	__u8 nodes_used_horiz;
	__u8 nodes_used_vert;
	union {
		__u32 zone_weights_32[56] __attribute__((packed));
		__u8 zone_weights[MALI_C55_MAX_ZONES];
	};
};

I still see zone_weights[] at offset 10 which is not 4 bytes aligned.

struct mali_c55_params_aexp_weights {
	struct v4l2_isp_params_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       nodes_used_horiz;     /*     8     1 */
	__u8                       nodes_used_vert;      /*     9     1 */
	union {
		__u32              zone_weights_32[56];  /*    10   224 */
		__u8               zone_weights[225];    /*    10   225 */
	};                                               /*    10   225 */

	/* size: 240, cachelines: 4, members: 4 */
	/* padding: 5 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));

What have I missed ?

>
> Quite what has to happen on BE is another matter.
>

I don't think BE is an issue for this IP.

Thanks
   j


> 	David
>
> >
> > > > >         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > > > >
> > > > >         mali_c55_ctx_write(mali_c55, addr,
> > > > >                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> > > > >
> > > > > What do you think ?
> > > > >
> > > > > >  		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > > > > >
> >
>

