Return-Path: <linux-media+bounces-65672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bWtbGl6tPWoN5ggAu9opvQ
	(envelope-from <linux-media+bounces-65672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 00:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED36C8FCB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 00:36:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="H7nwy/lP";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65672-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65672-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D75D300C3AA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794CA3B774B;
	Thu, 25 Jun 2026 22:36:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FA274FD1
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 22:36:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426962; cv=none; b=glJNZnmBsXsJZYPG/PvwnOfVVjBz5LqqHbkZ3ZvqAwmiUK0fjlfYIegIPzhPto+6B1h+SUXd0/2frF3noOswGSOpFjiejjnB3XZxNOKXf+QOIU3SrthIwFpA8qcR3BNg/Ii0MeXKOyoXyu6oGXct9CJI/cPtMvffjySaGJbAuT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426962; c=relaxed/simple;
	bh=ODkL4mJt24SS/99HdooKqc5YmWWihZ+Pe9SKoBzYDUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvtRrwMgT4Cw4hvyoq8niweTpQPgISNbd/PqAbKgBMUXcvP+HLpOozBVTV2vN/hvV5YakZGhKJGDrIiBKd8v4sg7YT+1zJ6gcwnSRh5fYTZ2dFfhCo4+CXTxbM/AffMxDgz5Y6Vyu+3eYNJeI5xTQB43BQrpezWzgzEjd9a7ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7nwy/lP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75621F00A3F
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 22:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782426960;
	bh=ODkL4mJt24SS/99HdooKqc5YmWWihZ+Pe9SKoBzYDUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H7nwy/lPvxwItL0VTLwgD/7r3nrI0qZ6ZenlKwhp+kyaOvwtZFpWZRkGqBnAkeouB
	 hvz7HOsVn4xyDqEZ2ivHJYlyEamc7jh08Sdb069TenY8pK8H2mUxlDxdT1RomKJK4m
	 8IAQyHg1QgwJhogtb+6aUKCLVYoDgYfqAdht6XwCXPIrF/4QWLTD4jWTrkWmYxlSr5
	 5iDtLfwFukJ9lqtbTRiGlVYuTtPIi3L3TGU/uAMif205X0bQ//8lPPs4tLIRQJWtdo
	 DXuwDdQe4b7tA4sjp53zQ1okwOWNaOtnJvBlCeuanqyJjNkUMCjGbexbyvFavCUwHx
	 pJMneD7zQfI7w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ad522bddceso247054e87.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 15:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr5NB9rYtq849H+kOXfAYRUWNju+5E8Y/s4B8ei00PfwrPyXardgh5l335spmVANDoBq05Utyjpn4+KgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3suKqJd735uDyu8jQ38awFAVo5aShsi0KnNchdAkeJFXSIVOW
	gnhUiC1mFg6NtIpGuJmdKl6QrLnsMZ+L8qs6D1ut9NZ/e+04EEZdJSp8gipxFNR2BKBErnx89Un
	i2n0U6PQsHpi6DacKZ2RilMwcWoIawD0=
X-Received: by 2002:a05:6512:220d:b0:5aa:100a:8315 with SMTP id
 2adb3069b0e04-5aea1f68bd6mr1680701e87.45.1782426959507; Thu, 25 Jun 2026
 15:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com> <20260616-mali-c55-ccm-gamma-v2-1-0f93e9a95d98@ideasonboard.com>
In-Reply-To: <20260616-mali-c55-ccm-gamma-v2-1-0f93e9a95d98@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 00:35:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnjdk-uPu4C33VQ=ZKML2EX_DSnG5QOkG7w6dfVFD9SpQ@mail.gmail.com>
X-Gm-Features: AVVi8CewcMtWoHWg0NSZAsiubRT0Oa-0u3LtUynbm3FsDY9Pf2EAI1Z-mbbYpis
Message-ID: <CAD++jLnjdk-uPu4C33VQ=ZKML2EX_DSnG5QOkG7w6dfVFD9SpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: arm: mali-c55: Add support for CCM
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65672-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BED36C8FCB

Hi Jacopo,

thanks for your patch, and sorry for taking so long to review it. I
was reading up
on data sheets.

On Tue, Jun 16, 2026 at 4:36=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> Add support for the CCM (Color Correction Matrix) for the Mali C55 ISP.
>
> Define a new block in the uAPI using the extensible v4l2-isp format and
> implement support for configuring the CCM parameters in the mali-c55
> ISP driver.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

I compared the code to the C55 TRM and it checks out.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

