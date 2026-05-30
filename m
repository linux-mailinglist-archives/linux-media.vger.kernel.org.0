Return-Path: <linux-media+bounces-63146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPnXBNIUG2pV/AgAu9opvQ
	(envelope-from <linux-media+bounces-63146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 18:48:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2360E6B5
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 18:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85B4E3063834
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D6439B4A6;
	Sat, 30 May 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qtjxk4cT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585233F590
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159401; cv=none; b=RoI9VN/+phshZdSon7w3+3M+mOetYoO1zJ585hf0JDonwU8mBJLYA5BtLjSZTms+7JHyEeZqHK27yZemXd1d2bb3nSHeJjugS7h0rIvYeOXcW9Qg4DtR78ekOCK7lKu/KxzF0eHob9ucVDAqaxZi4mpsq8OjcOTwPDF3PuhS6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159401; c=relaxed/simple;
	bh=wXrTrHg7jThfvHpbPuI4wb8lylFg+0R9kOLuU7injEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K62TMRwTQ8lzBz3xhMT0rXffw6rnTih26rKsTq+C+GXnumn82pgKlntmeTOG6FBZehlMDT23tbKFsrQiNAyYbSI71/NchwnYn/yF4OzW6xc1S8QeN08Wt2A2k8WdFWjlnUqqHg0YSPu4uwbXPMH4s7VKcrGBcQIKtsCtn5x6WUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qtjxk4cT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33C81F008A2
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780159398;
	bh=wXrTrHg7jThfvHpbPuI4wb8lylFg+0R9kOLuU7injEI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Qtjxk4cTmrxuyYwRg0Gn/54Zo7PflF3XoWSNhJqxxeEtgel+rF9QJydQjc/Gyy8/Y
	 6UkFPGzspzkdMKLOBH/k1c0T5DyaW9JxWEkEeG7gUz2ctFS8oo2JwJJbEBMKl5n/pV
	 JegRUzdxEElfST3kpdXdyi0/ZoPS3Zo1XmRmJBRoam1hX8ajz1BIiKKJA8SdSJ+PW0
	 9rUUUvbLFl6l/hFnHSE7Ck5KMbsS5B9u94sAoU8T0dWR+CNGqovTthKJYdpbMNWO7O
	 puSXtHwRa5FHLCUYaq7kj3TSIYssDZk1MBoo43FU6gCALFJPo5M5KFAX4Q4GLZvAqd
	 /Ib1a1urHIM0w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3967724bed1so285491fa.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9l8hnK8YgVPGQM1pw8pz3siY1XteEKPFRPo7li2FhA39iyR3CLd9Q5xd0+b79rrwm2ZUf2SQ8485YlpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrLUDLOhhCUZdolv91OlWRRZXT+RfZ8kOUlhbz46kEvKAJzPW
	ESmDKJVk4CQrv/5QyybazWPh59m52uLveqiQcp8edxLn/B+9bYYjg+pgC7NlsagDd0XaIlmDR3x
	cCYfT4bh+iwahFUxtjUqriVhG2z+xBec=
X-Received: by 2002:a05:651c:20dc:20b0:396:5731:db22 with SMTP id
 38308e7fff4ca-39664edbde0mr9068591fa.23.1780159397154; Sat, 30 May 2026
 09:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <20260505134812.408316-5-wens@kernel.org>
 <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 30 May 2026 19:43:05 +0300
X-Gmail-Original-Message-ID: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
X-Gm-Features: AVHnY4JPf-OCVxDr7xF6UmPyet8eqBpmFwZfdZsz7_1mZVTdUTpZyn83IUGk-ro
Message-ID: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63146-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A5E2360E6B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> > The Allwinner H616 SoC has a video engine hardware block like the one
> > found on previous generations such as the H6. In addition to the
> > currently supported features of the H6, it is also supposed to include
>
> Remove "supposed".

I can't actually verify that, so "supposed" is accurate from my point of
view.

ChenYu

> > a VP9 decoder. However software support for this is currently missing
> > and still needs to be reverse engineered from the vendor BSP.
> >
> > Add the compatible for the H616 variant, using the H6 variant data.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> With that:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
>

