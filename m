Return-Path: <linux-media+bounces-65206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id krk3GqPzM2q+JgYAu9opvQ
	(envelope-from <linux-media+bounces-65206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:33:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07D6A095E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:33:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LxCHJVZs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65206-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65206-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3DE13064022
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D058C3F4DEE;
	Thu, 18 Jun 2026 13:28:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F33EFFC5
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 13:28:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789309; cv=none; b=dXJ6AbNdry+FsR5pGdNDVP3bQzFlgXerR7XWYrhG9/B1u91N0TleWp9LdAgrWwxADMKOVb5efqzhaiCICWxlEudplPjtM0qHCxsH2wXqtYglzi3QWOiYxuSie7GbDzvDFHgqFOXYtVK649jyzw7FVzgHM1GQDeWS7Y+nzJw9dAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789309; c=relaxed/simple;
	bh=XBaZo+dHf2RVAFP8BDAXfuGTkWHlVWMXh1XFQ+sXDrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAfH5YXeQZ1y1p6wOwjY2hU9U/RB0UqCUCEdqINQFC5mlHWj2yDI3l/l8xNqCrFrZvlXMNRswVa4lapuIznB8RNG7sm2ydL0/F9XDesAKiUCPR/S21DvOJgjy2Sl2nWylQK8pkXMleujYRD5D/ekwK3BBUhYSCKAM4dJmVyiYAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxCHJVZs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3AB1F000E9
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789308;
	bh=XBaZo+dHf2RVAFP8BDAXfuGTkWHlVWMXh1XFQ+sXDrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LxCHJVZsvd6Mop2L0z4m3yL6jpswq+AydvP9Z53w41MlZTWvs5RD3g4LaCRzs47Do
	 YSAsOZo//RFOkT9+18LeloFLkTVSw/aw+32rbGgofcrP1X24pWK4fp/V2PCUbs8rcL
	 4wMqG3SmiEXyQffn3nbfxyefHuyEEt0++Kcj06f9TWex3fLo9XNC2L2KCaubJfce9f
	 KKWUZY9aPNj399L74KP1VYA5bnmDCXbNXiLIXrSAwr5Ft/mAHyVd+woMkOk9wuWk1S
	 3+1yyN6zrMWvTNajYTSmXSnzPjGoo7aRGGnwxVd7rw81YekWOHGZClcmjVMoOd92tl
	 5tz9NcEiuC58Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so1072117e87.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 06:28:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8RXHrYmQdiaOvNzs8nERGgib/+rcpeF8yAm9nB8uxhgJrdAifj/fwv/ujz6XmH9jA4gybLiQUEtwWSSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPRAODvEFKOBRNr+SOmJLZbI7zCzVmRlXsjFiQLaa3LNUxomn
	P6YB9uIkhWWzwdMIjEowlpHw5QmenqQIRripN8jnbo5fiAvII4o/f/NgWDoqQOGZRDTv2LOXOYn
	EiO2F1wuAbgaWo/qm6VV28AjhbVP+0h4=
X-Received: by 2002:a05:6512:608b:b0:5aa:6b8b:8c92 with SMTP id
 2adb3069b0e04-5ad509fbcc7mr736509e87.33.1781789307086; Thu, 18 Jun 2026
 06:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
In-Reply-To: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:28:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
X-Gm-Features: AVVi8Cd72zqG8CU_PxJBjQpm7FdwndY1ygmGr9606biJi3skgK790b3LWaI8Rp0
Message-ID: <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] media: mali-c55: Add support for CCM and Gamma
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65206-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:konstantin@linuxfoundation.org,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF07D6A095E

On Tue, Jun 16, 2026 at 4:36=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-=
174fe4fedea3@ideasonboard.com

Odd changes :D

Honestly, I think this is not your fault, b4 should not allow this.

Konstantin (Ryabitsev): could we make b4 just refuse to send patch series i=
f
this changelog contains EDITME entries?

Yours,
Linus Walleij

