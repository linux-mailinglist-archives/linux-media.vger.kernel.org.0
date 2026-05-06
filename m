Return-Path: <linux-media+bounces-60595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIAdB/U7+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:02:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6C4DAAAD
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866AF30293E6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB994657CA;
	Wed,  6 May 2026 12:57:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172D407586
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072241; cv=none; b=pSVp5BxmwnjslJC/bQgzXFO5IL37yNuBCIlguza93WBpnmq41YCqGwzQOFKaX25h3LYtIMRIYZHiH242LD3IgBoFS1M3XyDvzpf7zNPffpXcdxn2E43GiThN64IQNDEs8vfk7u4AGI8XrpzxF/KBJQ76InaXdtk9EDwRNm1g3dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072241; c=relaxed/simple;
	bh=qE5T8UHAQFi1iQufSJHwGyUN0HmUMjsbgTbfwLftTcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usN2MIEB3D2bTvI7102cm5djnVj3efohmaw3p17SyIQns4AjH7xkn7mRxc2XNW7xm5yTL8NyKS12zBqDVg9Ah3fRijY1vq+S8U1oU/katPT7PBmYJdnT4vwQQ46D2ua41S+KZcHRpszxPSqgl9mZIPwgHyKEl3OAuVZpUlNO/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60fa5eb3ee1so2248453137.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072229; x=1778677029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p//fBN7MGJ+c/0tcb2eTApLtD1OnS24t+3fsR1hc76U=;
        b=BjyzbCyML2OSP4NY7POcgfip2Uy0dOr6OBMeYIWl4klxmfEZ7K5hxlgnt1yr4OXgUm
         LOOZxW3BFjbYjza7uTDCPzJdd/eym6Et8APvI88KiRtCdrZRU23xGoJyA7bmCt/pwAkL
         yNuPfn2M8xD/TwQ/niUAKscMwrbAN5MU77+hjcQDbXqDA7xc7RNEWZ/UyIU6HsrL1e1G
         ccsZ9KlKSgjqQ2QPIAAhha9FMVyTkUyBZDNa5k+OvvU5fCdgc4gpzAt50z0RqXGDQ7jV
         KJH7XtCJmh84X9TkDbifSjLRFhKRjjYArFvz0oMOw0F3AURHs5Uid1S9ruPqaBrfYe/C
         axOw==
X-Forwarded-Encrypted: i=1; AFNElJ/1btgbQ+Skp43niGTabGbBXgST+cdrDwEo2uJCgspv1WNKZistFuESoaDOXb4lDwsBlTLpGHrHZz+UsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJ5VtVZJn6MFHlziLiuSvST5QgNPt/6qUphnMY+OLYNt6/TGD
	nemiG26tK4X5LzgNEwdHTe9vCytyhUzQKjrNlawAG3cc16z5o+FMZuCosuJy5V41YJs=
X-Gm-Gg: AeBDievFsgmgHtvSTz0hnAsI/rJjHGKH+OEeFCXnCdgMBvdkjpDFxV6IUNciKXDOYRP
	8r8jyOX4s99+qfF7VHBFYaYpfps+ntl+wSg/GypSYqOuEFm6Ag3pAPRYRCA/RygckmN/DsFKZgy
	kWgNfxYnAgT2sPu8K46Fme8/ypslkKdu4zaL3iFdZPAhfU+WiolMzqHNGdtkXyB6jkioMyD6psT
	Ui7TCfazbXlBD9JemFHUBQbeO1ArTxfAY+2/VhsAY6Pt90rJfkuDpLw0f7zLZdRQH3sCMP4B+WW
	+Why9oI2DzwBu8QB/QWw2TIWd0lK4GqUioEU7nz3HxgmAitfsrz/YP8zibUfEboEEQvnsK5vLXF
	uNJrpZ+VMto6+4coj1x0q6r4iOkuGR0vdoZiiy5ChpzcNiD52b5+9ZgdsFtaIs0B4YCG8YqsUzM
	0RXb3Sr17WMtQK71NobKajt2IcRW3xuzQIM+iTGPT49WQazvrlNlsXREcisuh5EJ4nLgygU6RLn
	58FB654+w==
X-Received: by 2002:a67:e708:0:b0:5ff:e769:44bb with SMTP id ada2fe7eead31-630f92a02a1mr1069684137.30.1778072228860;
        Wed, 06 May 2026 05:57:08 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-630f858f550sm1268681137.3.2026.05.06.05.57.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:57:08 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso1688723241.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oBHIv8Mx4JMoux/5R+o6KU3fhKsFDT1wgNR8Ab5uxsNQlIxZhZNmlFEX71Sh596aQc6MN+U1hwZZlww==@vger.kernel.org
X-Received: by 2002:a67:e102:0:b0:62f:5908:648d with SMTP id
 ada2fe7eead31-630f901cf81mr1045734137.4.1778072227584; Wed, 06 May 2026
 05:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
 <20260506122954.GL683841@ragnatech.se> <afs3U2zudfJEXkY4@zed>
In-Reply-To: <afs3U2zudfJEXkY4@zed>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 14:56:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoWRTgfNMQA5KxiwLhmycCHt+zc66MSpJNVBM7D=kcKg@mail.gmail.com>
X-Gm-Features: AVHnY4L_tSuxiPAO2UV_tD2yH-TbtSGRjrEcWxzzuYbRupR_1lDrgg-HJwPtBvk
Message-ID: <CAMuHMdUoWRTgfNMQA5KxiwLhmycCHt+zc66MSpJNVBM7D=kcKg@mail.gmail.com>
Subject: Re: [v8 00/14] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A9A6C4DAAAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60595-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,ideasonboard.com:email,ragnatech.se:email,mail.gmail.com:mid,linux-m68k.org:email]

Hi Jacopo,

On Wed, 6 May 2026 at 14:49, Jacopo Mondi <jacopo.mondi@ideasonboard.com> w=
rote:
> On Wed, May 06, 2026 at 02:29:54PM +0200, Niklas S=C3=B6derlund wrote:
> > On 2026-05-06 14:19:28 +0200, Geert Uytterhoeven wrote:
> > > On Mon, 4 May 2026 at 03:08, Niklas S=C3=B6derlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > This series adds support for two different devices that together en=
able
> > > > ISP support on Renesas R-Car Gen4 ISP processing. The first driver =
added
> > > > is for Dreamchip RPPX1 ISP, this device purely deals with image
> > > > processing algorithms, statistics and image conversion; but have no=
 DMA
> > > > engines. The second driver is for the R-Car ISP CORE, this device
> > > > deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> > > > interface for the ISP.
> > >
> > > Thanks for your series!
> > >
> > > > This series depends on the ISP extensible statistics definitions
> > > > out-of-tree patches.
> > >
> > > So that is:
> > >   1. "[PATCH v1 00/11] media: Add iMX95 neoisp driver"
> > >      https://lore.kernel.org/20260413160331.2611829-1-antoine.bouyer@=
nxp.com/
> > >      for v4l2_isp_block_header,
> > >   2. Jacopo's reply https://lore.kernel.org/aeHd0G_JDaROMWDd@zed/
> > >      for v4l2_isp_buffer_size.
> > >
> > > However, that still leaves me with undefined struct v4l2_isp_block_ty=
pe_info,
> > > and lore couldn't help in locating the patch series that adds it :-(
>
> This version is based on a preliminary version of the extensible
> statistics. I can provide you the patches in case you're interested.
>
> >
> > As Jacopo have kindly pointed out to me in private, this work was based
> > on an early version of [2] that was not published, but as I found [1] I
> > thought it was.
> >
> > I will rebase this on [2] and address Jacopo's comments and repost.
>
> Don't :)
>
> Please re-base on:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D24772
> which I sent yesterday instead.
>
> If you're using b4 you can simply point the pre-requisites to this
>
> change-id: 20260504-extensible-stats-f2d6befcc1ce

b4 am takes none of the above, but does take
https://lore.kernel.org/20260505-extensible-stats-v1-0-e16f326b8dad@ideason=
board.com/
:-)

OK, I'll disable the driver again in my .config, and will wait for
Niklas' rebase...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

