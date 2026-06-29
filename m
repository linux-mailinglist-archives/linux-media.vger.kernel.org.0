Return-Path: <linux-media+bounces-65872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hq9WJ34uQmqe1QkAu9opvQ
	(envelope-from <linux-media+bounces-65872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B506D78BE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:36:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DuMM4zeD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65872-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65872-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5EC43041AA2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0013F5BF1;
	Mon, 29 Jun 2026 08:32:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46863F58DF
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 08:32:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721933; cv=none; b=NjdB1eslYQhw67E3wQUyGYMwNYMqFIjKW4pndvBdgtyutJ4zjJ38ooZIVM2eED/rOzVde970vKkAVtVrLdmXD/HTXIJo7DgDw73dNdEWkourabV8fz56O6OJOiKRM9/KjLQstzh66UE5z8vMQX9C6kc8fRVtxG5W5FgwKxqCoRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721933; c=relaxed/simple;
	bh=tUuN591Y6fPtcNAmuZEe8Av3aatfOQw1bSLMTeoh7UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/iJ9jK7K1F8Uq9dOsFadvOn8W4A50XTFzWt/F0l3PjHGXPhQS17Os86N9ZxGYQo7HzRzufxHSbE/gg4jIUHhuFttKOtt2AYOEfmcK8j3BbV3tY/Ahw62l6uDl2+ClgZao2w+KbiN1Oryh9FR1RNCNg7lhdbo9R9e8ZXBxMWeZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuMM4zeD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6B51F00A3E
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 08:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782721932;
	bh=tUuN591Y6fPtcNAmuZEe8Av3aatfOQw1bSLMTeoh7UI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DuMM4zeDirHLDXbGO0dvNYyCS1KEFK/bqfKODIPJf1ksB28atCJWMSU85HvG67HTk
	 roI5WF7SsRqbv7RRkfW+umO2Xz41tGfPAmEleNpPWFeqNxtT64LjWj7dByPsr7b79d
	 1m/XQUnE4QGWwZFqvmPqqiIVPB8ANm45+L5DM3pj+xo//4M5HUd78e12yvtn8pMjOQ
	 1t1UK/WuYq/xVAPYf6Q9Z4TTmvh8DGQ0xoLCstzTqUEZPg4ceQLbOadJagU82+mEUu
	 OWld2aR0aRTpCL+i9mUPJ8exAgW9WVdhoy1DsLadZNFvWy8JblhmmdAMUneypncW1Y
	 lbZjnoPlja59Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b1026e171so5102041fa.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 01:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3vZwq9VxlHHhX3U4piZeFlAUMK84Yu0hpS7vfZhE6Btjf6/KsqEWIQmLdXAfuSvUWuTvgJOj8ABRVsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4PTQfILmjEe1U3Mm3tjI0p39gcCyd+/hs9RZs2DVlms1nA5p
	l63xTtSh5qPkslMCz5KVfkiNiB21u73g3O4lHkZWkKER/o7tuRqDd2bLCdnUO44zGxiuzQrYCxQ
	eVLfubwx12RDJPIPYK5zCZsb3qQs60ro=
X-Received: by 2002:ac2:5de5:0:b0:5aa:8823:e311 with SMTP id
 2adb3069b0e04-5aea1f55e73mr2561045e87.47.1782721931064; Mon, 29 Jun 2026
 01:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618195254.139712-1-devnexen@gmail.com>
In-Reply-To: <20260618195254.139712-1-devnexen@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Jun 2026 10:31:57 +0200
X-Gmail-Original-Message-ID: <CAD++jLnukur1VqeSurPgCTEQn9BQmgBVOD1Zivsaa1BDnE6Lyw@mail.gmail.com>
X-Gm-Features: AVVi8Cf2Zm9cQlf0-6MUONGs-3PVu60eg84J8Jx2A_aHPmENqBIdJmOC0tvxgVY
Message-ID: <CAD++jLnukur1VqeSurPgCTEQn9BQmgBVOD1Zivsaa1BDnE6Lyw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mali-c55: Fix scaler factor overflow for large
 crop sizes
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65872-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19B506D78BE

On Thu, Jun 18, 2026 at 9:53=E2=80=AFPM David Carlier <devnexen@gmail.com> =
wrote:

> The horizontal and vertical scaling factors multiply the crop dimensions
> by MALI_C55_RSZ_SCALER_FACTOR, a Q4.20 factor of (1 << 20). Both operands
> are 32-bit, so the multiplication wraps before the result is stored in
> the u64 scale variables. For any crop dimension of 4096 or more (the
> maximum is 8192) the value overflows; an 8192 to 4096 downscale yields a
> TINC of zero, so the scaler never advances and the output is corrupted.
>
> Define MALI_C55_RSZ_SCALER_FACTOR as a 64-bit constant so the
> multiplication is performed in 64-bit.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

