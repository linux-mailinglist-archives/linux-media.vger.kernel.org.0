Return-Path: <linux-media+bounces-63267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDxGJc+QHWpKcQkAu9opvQ
	(envelope-from <linux-media+bounces-63267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:01:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F637620709
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31DDC301453C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F692389115;
	Mon,  1 Jun 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VnPcXJY4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8D3ABD8F
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322056; cv=none; b=gVzR3ehD2+0PBr/nGoyMzBL3ZRIRFqWP2+BfQGuhJkXjppcgPI4swNomQWfS7N05jyf44OaCL0laoKwl/WZYNhIp/+h8MDSS0E173Xk1GGuuRpGoT8g1wHodbhfv6TmwKqncazIwW+JCPGT14YIqhyuvU8m5gemyxaVnG4VXEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322056; c=relaxed/simple;
	bh=SozuT6WFOw5kMRzZFhlGsX7AVdsSgsOAWvEj6qKmblo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SPeTJMhRqUYhO+aAZxIE8WyCs/VQdYaACmYi8zKL+H38ToTGTN2uHJ9/6JN3TfKJo1Oq2ES/pDHWVSFCsVVxr+QR5DXw34pwa+DM33esKOz7aSjl+namJS1Q6posJ9p32kCIkWAx98q9zUG6DBleenXl8DfsdZfTozb52sqageM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VnPcXJY4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-45ef6417092so1698888f8f.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780322053; x=1780926853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SozuT6WFOw5kMRzZFhlGsX7AVdsSgsOAWvEj6qKmblo=;
        b=VnPcXJY40IFl7Tiy8ZE2iai8BXInJSKeOlJ5cGCvxpMB/OqSFACniYxQWJjebYd5XX
         P+QzkR2IbAHIb48N7ZRshb4ecoqJg8cdBDNhxKZceZQrdeK/E418dhs1wOpEIuWjKy8g
         kVSVH2+/WFkQgqZHOKdwgx4iIsLMM/p5dVt+I9c5H9nUTbTHWE2H0XV0tzy/IO7DWej5
         f5AxlqH8LjizrOKy0nPq3w94UT/5sLpAdBI0/1fl/6g/AbusLHaU5EUa1/lHbe/ZgWpk
         d+UwafmYHzDCmtFXaOyanaORJQvzY9PvNOvjY+tv/3hr5hnk5JbA+vXjJ+6mLdO91Bex
         0yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322053; x=1780926853;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SozuT6WFOw5kMRzZFhlGsX7AVdsSgsOAWvEj6qKmblo=;
        b=luX1Mph5onSeFG86bGdgV1si/kE6N7BNObVEXjbPDXsniiG5pXwdxbdXnBOcH2jUf5
         kflKrpDEOFHh1upUVd401vHYD1HXc+22xhIIBW3EXp/R1gAvrS+YYizXX2V9YBWD/YQL
         BjGQMfSRVuJONSascM50vgqQWhcuoGtk63A+LD4BuUuK6bbCGYIkqF/h385JvYr18NPt
         K34Dzj4K5vBNWw5x8NrhVZfc3FPT9KoR4901saWpBMO0ttYzBCgaqt06N8LsOPs7zqTp
         mHRxw5plG6wES3t1TdrJJ28r98VMBItcljDantqLvVcrWduNiQxULzNFmcyhmxWxYx+v
         90xw==
X-Forwarded-Encrypted: i=1; AFNElJ8OvmEIIWJJy5/j02Z9Hx/M5HPZTryPZtCj3+eBKUbmZ9yhcK4CFab1UNTE//gzkyK7OcK4H4sH6FASXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVW9l5o65xfohwXfNQmXF4HhYMoe2X9IYK501UvywgNS/IHev
	CwrrFq+1TTX/0sNbc2uuKEGC2vCxI4Q4EU+rTrgvdrqk/Y1GMzwWwfOKfhS+jH8YOunhkokLvbz
	Jb9ZvKRNaMQHXoHTQ/w==
X-Received: from wmqa18.prod.google.com ([2002:a05:600c:3492:b0:490:538a:ee3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c8:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-490a298ad48mr192916685e9.17.1780322053165;
 Mon, 01 Jun 2026 06:54:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 13:54:11 +0000
In-Reply-To: <88fa86984dbc8a11bb9f4d1af76a1ba0d942136f.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
 <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org> <88fa86984dbc8a11bb9f4d1af76a1ba0d942136f.camel@mailbox.org>
Message-ID: <ah2PAwrIp9kw4p0V@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63267-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Queue-Id: 9F637620709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 03:30:38PM +0200, Philipp Stanner wrote:
> On Mon, 2026-06-01 at 15:14 +0200, Philipp Stanner wrote:
> > +Cc Boris
> >=20
> > On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbo=
x.org> wrote:
> > > >=20
> > > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > > For example, let's say I'm using RcuBox<_> here. Yes, the data yo=
u get
> > > > > from dereferencing the RcuBox will stay alive for a grace period,=
 but
> > > > > IMO once you run the destructor of the box itself, the *pointer* =
becomes
> > > > > immediately unusable.
> > > >=20
> > > > I don't know why you're stressing the pointer?
> > > >=20
> > > > The trick above is simply that drop / dealloc *and* code unloading =
is
> > > > delayed by a grace period.
> > >=20
> > > Sorry let me try to rephrase. I'm not worried about the stuff behind
> > > the pointer. After all, you're using RcuBox to protect that stuff.
> > > What I'm worried about is the pointer itself. You invoked
> > > drop_in_place() on the pointer to the fence context,
> > >=20
> >=20
> > on the pointer to DriverFenceData, which contains a refcount to the
> > FenceCtx, which might then want to drop.
> >=20
> > > =C2=A0so even though
> > > the fence context may be valid for another grace period, the *pointer=
*
> > > to the fence context is not. The pointer could have been zeroed by th=
e
> > > destructor.
> >=20
> > That particular pointer to the DriverFenceData could have been zeroed.
> > But potential other accessors have already crafted themselves a new
> > pointer to the, by the power of RCU, still valid data.
> >=20
>=20
> correction:
> it is refcounting that ensures the memory is still valid.
>=20
> dma_fence_put() in DriverFence::drop() could earliest free the memory.

Hrm, actually I realized that this is not quite Boqun's RcuFreeSafe.
That trait would require the fence allocation itself to remain valid for
one grace period, but you don't require that.

Alice

