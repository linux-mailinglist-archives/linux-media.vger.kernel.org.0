Return-Path: <linux-media+bounces-65751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7QuFEaSPmrwIAkAu9opvQ
	(envelope-from <linux-media+bounces-65751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:52:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A88626CE285
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:52:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ZBuDMNU9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65751-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65751-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F30F13022AA7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FE330C154;
	Fri, 26 Jun 2026 14:52:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0E2EEE65;
	Fri, 26 Jun 2026 14:52:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485563; cv=none; b=fkGgfYNvz1AqggnWMuRvgcibVy0EUSFvP+DTa2U9S4YV29oVdtFNS9MrXnq08TjYTXCQFM70fyn3XoAH3JmzcOsDO11nFAkK1syY9I8uFLZnB86txbU4WneQRDfHzp7jY3cEfZMvKll9zC+LrtQyhiafnNcbtCBCADbAFrOMRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485563; c=relaxed/simple;
	bh=r8AC7QirlG6aSw8eEOqKYoL8vpEs5uGipdpHrhN8OSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXEU/eEgwBTly6oG+7TVc1/QKI3YvkboROgOeWHTArvcmku33Cd3AavUy80Ct8eQ907GpBRa+WyxPLspnGCIbpZuBVQ4D/k194Y50PtYrXfo3IUe9i0rv0YZ0f4NvaLgVvunyVAmvVlesAjc8wUMmLumgRA8ec2RSxYcz6LQzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZBuDMNU9; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 017501E6;
	Fri, 26 Jun 2026 16:51:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782485519;
	bh=r8AC7QirlG6aSw8eEOqKYoL8vpEs5uGipdpHrhN8OSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBuDMNU9TUe8BOqJutcrRLnMr7ZxOc3s/HBbyohM4aTYwU8hM0RGceNQOIlLdPL0N
	 gPLohZkJU7Yj17fClWbliqx5JslMI8RZpS+UDnIHp+HSjyiJXQkl0pBYs1yb5UHfE6
	 Qam/IvDhJ6vh/411Tah3YSAZFFH9/R6O5Q4SYd7M=
Date: Fri, 26 Jun 2026 16:52:37 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: arm: mali-c55: Add support for RGB Gamma
Message-ID: <aj6QqZbuN0WJvg2C@zed>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
 <CAD++jL=RmN0HHYOSg68V5OQggN4uCdWdW2d+qA0GWgUv-51Rmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=RmN0HHYOSg68V5OQggN4uCdWdW2d+qA0GWgUv-51Rmg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65751-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A88626CE285

Hi Linus,
  thanks for the review

On Fri, Jun 26, 2026 at 12:53:45AM +0200, Linus Walleij wrote:
> Hi Jacopo,
>
> thanks for your patch!
>
> On Tue, Jun 16, 2026 at 4:36 PM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > Add support for Gamma curve correction for the Mali C55 ISP.
> >
> > Define a new block in the uAPI using the extensible v4l2-isp format and
> > implement support for configuring the RGB Gamma parameters in the
> > mali-c55 parameters handler.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> (...)
>
> > +static void mali_c55_params_gamma(struct mali_c55 *mali_c55,
> > +                                 union mali_c55_params_block block,
> > +                                 __u32 offset, __u32 lut_base)
> > +{
> > +       const struct mali_c55_params_gamma *params = block.gamma;
> > +
> > +       if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +               mali_c55_ctx_update_bits(mali_c55,
> > +                                        MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
> > +                                        MALI_C55_GAMMA_ENABLE_MASK, 0x00);
> > +               return;
> > +       }
> > +
> > +       mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
> > +                                MALI_C55_GAMMA_GAIN_R_MASK, params->gains[0]);
> > +       mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
> > +                                MALI_C55_GAMMA_GAIN_G_MASK,
> > +                                MALI_C55_GAMMA_GAIN_G(params->gains[1]));
>
> It is a bit of confusion for the head when GAINS_1 is indexed to
> gains[0] and gains[1] because the register i split.
>

See below

> > +       /* We cannot apply parameters to DS if it is not fitted. */
> > +       if (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
> > +               return;
>
> I suppose this is a HW synthesis thin? Whether DS is fitted or not?
> (Just curious.)

I presume so ?

>
> > @@ -425,11 +425,13 @@ enum mali_c55_interrupts {
> >  #define MALI_C55_REG_GAMMA_GAINS_1                     0x1c068
> >  #define MALI_C55_GAMMA_GAIN_R_MASK                     GENMASK(11, 0)
> >  #define MALI_C55_GAMMA_GAIN_G_MASK                     GENMASK(27, 16)
>
> Because of my confusion I would rename *GAINS_1
> to *GAINS_RG..
>
> > +#define MALI_C55_GAMMA_GAIN_G(x)                       ((x) << 16)
> >  #define MALI_C55_REG_GAMMA_GAINS_2                     0x1c06c
> >  #define MALI_C55_GAMMA_GAIN_B_MASK                     GENMASK(11, 0)
>
> .. and *GAINS_2 to GAINS_B.
>
> This would make it clear what the registers are for.
>

I can certainly do so

> >  #define MALI_C55_REG_GAMMA_OFFSETS_1                   0x1c070
> >  #define MALI_C55_GAMMA_OFFSET_R_MASK                   GENMASK(11, 0)
> >  #define MALI_C55_GAMMA_OFFSET_G_MASK                   GENMASK(27, 16)
>
> Same here *GAMMA_OFFSETS_RG

Aren't the R and G masks different ?

Or are you suggesting
#define MALI_C55_REG_GAMMA_OFFSETS_RG                   0x1c070

>
> > +#define MALI_C55_GAMMA_OFFSET_G(x)                             ((x) << 16)
> >  #define MALI_C55_REG_GAMMA_OFFSETS_2                   0x1c074
> >  #define MALI_C55_GAMMA_OFFSET_B_MASK                   GENMASK(11, 0)
>
> Etc.
>
> You might have good reasons for this naming that I don't understand

I think there register names were already there before this patch
didn't they ?

> (like they are named like that in some documentation, I checked the
> register map document but it doesn't seem to name the individual registers
> but call them as a group "fr gamma rgb".
> Maybe I'm looking in the wrong place.
> so either way:
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!

>
> Yours,
> Linus Walleij
>

