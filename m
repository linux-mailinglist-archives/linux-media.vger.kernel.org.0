Return-Path: <linux-media+bounces-65771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B+PJDlq3PmqxKgkAu9opvQ
	(envelope-from <linux-media+bounces-65771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 19:31:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFB6CF6CE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 19:31:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="PumI/Ke5";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65771-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65771-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11343304E65E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B0C400DFA;
	Fri, 26 Jun 2026 17:30:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7635C183
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 17:30:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782495055; cv=none; b=rcLuxqHXAfCWXVMWYtMHjVxgM5D1TxaZYbxU/qos6tbf6QVEP+eI8h/eWDyEGTeroHs+i1y7hqupEhlV0lqZKOLWtbls+vh7sjLayTotmXXATsTv6y/eq58hiRfRAjOOsUi2SjyHpeLeiRF7lY/0ry9+EyQ1R0t55X9138xermE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782495055; c=relaxed/simple;
	bh=gwSzXwh0HoI00AkrS/CpPJOnyWqmAsUpCZMEyyadXBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFOeGXW9EWsMC3sSzYLmyyWr3V6V30xYhfjdivMFDLc6Rg0HttUyq1upsYSI8s5BdL6Blqj/1RvNyXr84Im2cF+Xx/P7aFLZzG5nRWXh/QGVbkzCLZk9A9mhQyETaOEAJHSLnQcUCnL648k52C6B18qOk8Ai0fDVeVUSuhDCv38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PumI/Ke5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8B81F00A3E
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782495054;
	bh=UChKy8m5X6FfuHqzk1SQASlFD1km8ud5MSQJDfpy8NA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PumI/Ke5gnlFjsZfRHNBgKTP1Lst9wWQx/JKmBvBIslSmpEP3D9vNKT3YlJxKgBrd
	 x6X5bRoh6Qo8Kmx7PEqeHxJO66vb/Uk5x8AbP6leY91cplWCbXwF+vp21ZidoQRSKm
	 uAKjN554VWAOvmUn7mMqFTaCCJwxDyrxbzgMHDqxlUB9/C0SjEhZZ/DY5WnW8eQxGn
	 lfHPSzUscK2xg5KMa3MThNOYiPfeFRwMvdFGskiW0ZNm82786Az24KhXZ/HoK86uli
	 TAx4FlhXl367zayhqea2Vpze/BTq51RsNWdp8vNYxvxIp4eNR9PeIgneznzpJ7fqOM
	 mfydyJjDd+8CA==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9483cd614so1155010a34.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 10:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9OxJU0b+E1EkAQmCrrth4b5gteSxztVUkn/O/L74qP5rc3rsXgSEw+NMCtRzjOti1MWNl2euFX3tdRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtPBTwxMxA/nd8EEYurCw1lShs50/yuo6mDxwULNZFjG9g3WA
	qnnJhNpBcpgGsNpCcPqPkPkYaUFf9oVKWYNVJ1c6v8dyTMckYnO2uSkeVFkXYGJwIMnLdFJQPsI
	wLHdt/eVydHj0UgNrcVhvXMtmMsBrHsU=
X-Received: by 2002:a05:6830:63ca:b0:7e9:b4ea:2ef6 with SMTP id
 46e09a7af769-7e9b4ea3173mr808165a34.16.1782495053924; Fri, 26 Jun 2026
 10:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
 <CAD++jL=RmN0HHYOSg68V5OQggN4uCdWdW2d+qA0GWgUv-51Rmg@mail.gmail.com> <aj6QqZbuN0WJvg2C@zed>
In-Reply-To: <aj6QqZbuN0WJvg2C@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 19:30:42 +0200
X-Gmail-Original-Message-ID: <CAD++jL=UNADvRzPfpbpSb8bHAZGvZ0M8yyw0MbQGFHmaEyTvvg@mail.gmail.com>
X-Gm-Features: AVVi8Ce618KXnqz5pxV7QoavsUpMKnimSmL-2XkTCw0_XV1Evys54hKvIFr2Oqw
Message-ID: <CAD++jL=UNADvRzPfpbpSb8bHAZGvZ0M8yyw0MbQGFHmaEyTvvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: arm: mali-c55: Add support for RGB Gamma
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65771-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99AFB6CF6CE

Hi Jacopo,

On Fri, Jun 26, 2026 at 4:52=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> > >  #define MALI_C55_REG_GAMMA_OFFSETS_1                   0x1c070
> > >  #define MALI_C55_GAMMA_OFFSET_R_MASK                   GENMASK(11, 0=
)
> > >  #define MALI_C55_GAMMA_OFFSET_G_MASK                   GENMASK(27, 1=
6)
> >
> > Same here *GAMMA_OFFSETS_RG
>
> Aren't the R and G masks different ?
>
> Or are you suggesting
> #define MALI_C55_REG_GAMMA_OFFSETS_RG                   0x1c070

Yes, exactly, then when reading I know "aha that register contains
R and G gamma".

Yours,
Linus Walleij

