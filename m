Return-Path: <linux-media+bounces-34618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C6AD7061
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98551888468
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77A8221F20;
	Thu, 12 Jun 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SCX3sMQw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A2xKgE7U"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5281CF7AF;
	Thu, 12 Jun 2025 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731283; cv=none; b=kL4DsjLUiMJ8ozLrqmO89RURIzWiJoXaKQOFijzY4J0KT+jOdC4hpYgL8uWM1QRdvilQBMiIu5esFJBq+5Lu48ugEXEO7fe1tBkGKWThCJut1ADaM+f6ehHWTnWQHqHusx9E7q1FwBRPELAaMCmtHBsEht+uJveTcaxcV0Iwbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731283; c=relaxed/simple;
	bh=YU6Ox4W77478qgbh3pM1vnre5o5uDKUtIGKmE6dHSYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB14VkzdTexfsZz7ovVSNP1NK7Cv5U6moWmoCtXDgwbAB/UPWs/MeoRo1lDkfJ2PBU4c/LeisHdYSek6IItYbuxp2Z3p027x3avh5fEE3fZY+ZSIC6h6nHR8q97xJOD6WAkpjyW1OBfUhwn1jIbg0D2/2+zGyoQi8hyQNvzMefc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SCX3sMQw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A2xKgE7U; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 463392540219;
	Thu, 12 Jun 2025 08:28:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 12 Jun 2025 08:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749731280;
	 x=1749817680; bh=3LsKoMAEKlm456MsDzZAgEgu0Hoh75/jYRI1T3hAzmY=; b=
	SCX3sMQwpGJYP2lvzNTeVAVB0ztKdE98XG04V4qb6M1GAblnRB0GjgmdoUgS35r8
	LBIYYqix2Mf7FG7eubAuul+aX0/UWsVLANsxE9Hw76/D9qLhcnKozOgxCJ6B//Me
	9FzMjFZ/5OwcSSt5XIQ3T5f24dYRTQ/NfELYbF6Wmc0XnWR/dB6NaLNAqY9kNmJ2
	1JM7hMRFVW3PHBDh5ugQkbWEz7j/hDdWfb126hpp7egEjIX78ESm+L8oORseXbCR
	2Ii+LoZapaS0Zjho2kodhXVkas+99PFwKDk2xqI2vw09hyXP9ElSaMmMLFYjhKLW
	t2y8xpR3Jm6LIfYA8BkPww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749731280; x=
	1749817680; bh=3LsKoMAEKlm456MsDzZAgEgu0Hoh75/jYRI1T3hAzmY=; b=A
	2xKgE7UkcCw8wn4bGbso6COGMttdekKBXunchz9802c5Nviwv77AJrnUpJMUkU4f
	xDSshhjemskyemZSVeuLrFFIHYZseGWdwMZ8zJHaPC7eZqi2DjBPmGWejB0Nl8mV
	udICysPPdvZQLbwyhJlZJb95yL3pSVTud7nFr3lsSVd/Eghigpdx+6SlmXpg5tBf
	q44YLWiFnTe9uKePNwVsq4jFSRjYcD/Khgw/jzXlFQ9g3N6noAzV6Oyo60Z5YwvE
	J3VteB+PGo204UAg+r2Mfo0nxKUcSoIRemb4vS68x6sGjySj+bewSfiUylPWQ5m9
	QxH0XWTt35Oc4lTbIv3yw==
X-ME-Sender: <xms:z8dKaAL2umrFM3fqZzDN4IPrVNQ6dZnuSKw2h2FUO3rYLLyX8clgMg>
    <xme:z8dKaAKnbjhD9r_pwWEexkT9EypOYHBxY_Cr0UmuK8gikqpP9VdltKrd1D9SxbHuX
    l06Pa9-EK0Zl8G8Bf0>
X-ME-Received: <xmr:z8dKaAtAYRobvV6NrY0BgWe5zDWcTOxdWJi_NXvix5xlDVGDnavScbvFcXs1cozOHbMfMhdd7jxlitz99JakpMdYshJKBvIhkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehm
    tghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvg
    hsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvg
    hnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:z8dKaNaS-XO5FPe7PJQTu1H46Wfiyq-UBTDqYhYDpPnEOXdIMj42Og>
    <xmx:z8dKaHaNu8icjAmukuVd_2qVDLtERQJOLTHA--R1eSebLBaQX6CYew>
    <xmx:z8dKaJDboTbYTnC10nnAa4apIi6lYofWOMHn-3th3aYM1dsy6LS3sw>
    <xmx:z8dKaNZti2lMcVj47iICw9TdKV9GV-v8ZM677e2Srb4LcEOQhUc5Cw>
    <xmx:0MdKaFNC54E6hSxZfFRlYT0md9tg50EFWfg3rIfstOc0Xf6oDGikYTvt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 08:27:59 -0400 (EDT)
Date: Thu, 12 Jun 2025 14:27:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: rcar-csi2: Add D-PHY support for V4H
Message-ID: <20250612122757.GI330732@ragnatech.se>
References: <20250611154445.123412-1-niklas.soderlund+renesas@ragnatech.se>
 <20250611154445.123412-5-niklas.soderlund+renesas@ragnatech.se>
 <20250611230412.GO24465@pendragon.ideasonboard.com>
 <20250612100112.GH330732@ragnatech.se>
 <CAMuHMdVueS4Dhu0e5DJSEDD1Pt-3Ay3tmjs5Jm-5Z2xQXr4XVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVueS4Dhu0e5DJSEDD1Pt-3Ay3tmjs5Jm-5Z2xQXr4XVQ@mail.gmail.com>

On 2025-06-12 13:19:45 +0200, Geert Uytterhoeven wrote:
> On Thu, 12 Jun 2025 at 12:01, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2025-06-12 02:04:12 +0300, Laurent Pinchart wrote:
> > > > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > > > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > > > +   if (mbps >= 80) {
> > > > +           if (mbps >= 2560)
> > > > +                   val = 6;
> > > > +           else if (mbps >= 1280)
> > > > +                   val = 5;
> > > > +           else if (mbps >= 640)
> > > > +                   val = 4;
> > > > +           else if (mbps >= 320)
> > > > +                   val = 3;
> > > > +           else if (mbps >= 160)
> > > > +                   val = 2;
> > > > +           else if (mbps >= 80)
> > > > +                   val = 1;
> > >
> > > You could possibly replace this with
> > >
> > >               val = ilog2(mbps / 80) + 1;
> > >
> > > Up to you.
> >
> > I opted to keep it as is to make it easier to match with the datasheet.
> > The ilog2() is clever but I will never remember why it was used ;-)
> 
> +1 for ilog2() ;-)

When you two agree it's likely a good idea, I surrender ;-) Will use 
ilog2() in next version. Thanks for your feedback.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

