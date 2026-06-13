Return-Path: <linux-media+bounces-64766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yXByAXxqLWpPgAQAu9opvQ
	(envelope-from <linux-media+bounces-64766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 16:34:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931167ECA1
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 16:34:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SBHqpKC7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64766-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64766-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E5C23028C90
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 14:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E59317147;
	Sat, 13 Jun 2026 14:34:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034C1A6817
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 14:34:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781361259; cv=none; b=Zpx4/8eWhSPsBD15lJAmHQvIwMOFn2RPVFOA6aoDfliysa0iej1EAz98pxX4ImTkpaS6H3YoeD7pl1EvIVKo55JL5GfbaQIBKXiT1e2RHiby+DcGB7OVxG4bwlk1ql9pcoPVl6idI/FXe62PogoTXlAmyyVcwHANTcpjx/NFh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781361259; c=relaxed/simple;
	bh=DQB9eZVmUwCxk+upUfXxnkxbckxPsu3JLjqIaY/Ievk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3AS9JZfk61i5sLJ9qRzvyy/yoNQTXgJ15q6IzwZEZRjwRkKGlgutCPresyX+GXOuFgcsVFGdEiT1Q1A77UPfd5Let6UbAogAtO9OylswvntynYY6TzV8msaQuGey7L7VTtPe6gqMhCEvtXzM9tHhvXG9scFmYpK16Db5LF0a+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBHqpKC7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F011F00A3D
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781361257;
	bh=DQB9eZVmUwCxk+upUfXxnkxbckxPsu3JLjqIaY/Ievk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SBHqpKC7BREORrxBTVx7sACccSGVw8i23QX7+RIK5eckd2TmCZktg+BuSCQ9ZJ3yJ
	 Kue7h6YyzWJ6cBULg+8t0egR8uzypz9mbNx5wzL4NFxcbQ8UVzR/0I3il5ZaLbmAgA
	 6XI+B9N7r6a/A7QQlC/qWONiroFFhzFCSsIQAAJdjirZrH2xEDS3kjMXfmnYg1liH5
	 WiQuomqBJ91IEiWZgyk7qRvIWJFqHdY7UpLHDvFAt7AjIty+cv7LjeO+94kXT0JuyM
	 nlGvFoZeBf2873j+tyl+fdW1buWoPl5nc6cNVqXfr8kp/8pTAbGJRyfaYH2DP1VGd5
	 pql7mT6lEAkeg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso1676442e87.3
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 07:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/t9QFvYFT0xvjz2eLwKXWnT6jXu0AqdXuZ3DRb3hFD8T9ZCxG8JhL38fhtFAsd1b1gGgWJsVQjDxqcsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9cONB99G5gLvX/e6tT9Ioa0/AB3lLNB1jlE8PMUHvgmm38ch
	A1F2fonyU2mbCuizf8G0IiTl5gmZoGaS8en0OPcaYv3qUZwqDwk7brb462m/q5Zk8+/arla/qzh
	5/z3sUJuosG+ifAFDV8/R9RPPeOc9dZ4=
X-Received: by 2002:a05:6512:1596:b0:5aa:6842:7a6a with SMTP id
 2adb3069b0e04-5ad30d703e4mr921898e87.0.1781361255568; Sat, 13 Jun 2026
 07:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 13 Jun 2026 23:34:00 +0900
X-Gmail-Original-Message-ID: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
X-Gm-Features: AVVi8CdvXAQ1C_gR9wE2a9xH-URFH8zH5uSNUhPubBOtyL4bNWe140GF1Ea1p7c
Message-ID: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64766-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jernej.skrabec@gmail.com,m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9931167ECA1

On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skra=
bec@gmail.com> wrote:
> > >
> > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > > The Allwinner H616 SoC has a video engine hardware block like the o=
ne
> > > > found on previous generations such as the H6. In addition to the
> > > > currently supported features of the H6, it is also supposed to incl=
ude
> > >
> > > Remove "supposed".
> >
> > I can't actually verify that, so "supposed" is accurate from my point o=
f
> > view.
>
> Isn't info from manual good enough?

The manual says the SoC supports it. Same was said for the H6. Then
we discovered that the VP9 decoder was a separate Hantro block.

So again, *I* cannot claim in the commit message that the hardware
block supports VP9 decoding, because I have not verified it.

> In the interest of unblocking this, I would be fine with "supposed" too,
> but manual and all my experiments show VP9 is supported.

Please give an ack or reviewed-by with a comment at the end stating
VP9 verified.


Thanks
ChenYu


> Best regards,
> Jernej
>
> >
> > ChenYu
> >
> > > > a VP9 decoder. However software support for this is currently missi=
ng
> > > > and still needs to be reverse engineered from the vendor BSP.
> > > >
> > > > Add the compatible for the H616 variant, using the H6 variant data.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > >
> > > With that:
> > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >
> > > Best regards,
> > > Jernej
> > >
> > >
> >
>
>
>
>
>

