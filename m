Return-Path: <linux-media+bounces-65232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HSjlHI9DNGo4TQYAu9opvQ
	(envelope-from <linux-media+bounces-65232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:14:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D16A2506
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:14:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KRnGqaZi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65232-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65232-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F56A300D4D6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 19:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DE2348C61;
	Thu, 18 Jun 2026 19:14:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B43115B8
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 19:14:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810060; cv=pass; b=ciHrWShrrfMCOU9Sl6b2cVyNQA6cF3Mno5nSZDb1x/ME8zqUWAgr0KYI2Le+VqpFLsbvZcnJTwshFFEdOm008KKYvuT1lHjCVr5CR1WbHtFS6ro0QlHSIbmf51TaOVUeBk43NAA/X8lIICqIWHtQbhLwf7/1g24A68yUws5UUJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810060; c=relaxed/simple;
	bh=sQ5mCIzXypfBlvbJeyAdboq0LWSgsgg7sji1eZMZSnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6RtixxnMfex0BCfs2Q6yJGahc5lF3cE4HWaflISQJW2NWTRRn2YEqFtaFfQchEoVf7lCah8KOc5SsIKUAqs+AoRCdBRVcHHGGhPT/cipzcp/RRSRApdK8znZ3HBbTA+QlcDBmzSNS+8xjgl14qt3eqv7hREnyav7h+yk35Dy2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRnGqaZi; arc=pass smtp.client-ip=74.125.82.51
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137fe3c973cso36020c88.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781810058; cv=none;
        d=google.com; s=arc-20240605;
        b=OAE2krCCkX62DAU7YU+uUurS03Ph5A2VN2Q8EP1cg+x1Hk+jkstE60CrRvjlno/lUI
         yOFvd0qeCXecgWQbThV283GsTXIP5PUeOAgkEJJ+AIEWIvHha74hxT3JjeBaZ1zJJ6v5
         Pr/hdtGNYHnOqgXvG+VOZGKbOBzTIQt96xzfZqfiVVSaqQVwZ8Yu4DDTNC0iKsF6gjsk
         jr1mxlqthkB+MxnbrC7hhy1attmUBOX04nJEDT26RzC+LEeVGpp0DB1zC+7HXXRoAqzN
         AsyOFZUqAESJVVO3RKNn12zzTKArlAj7GfxHxN3jbsZkvpI/ZyHm7N/y3U6Kbng385C6
         6JUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3gIhj8csyUjzimg3goW3Pzqun4T3ZR1YGiH42Uwliks=;
        fh=cQYVPWl1qi5/GCblrxjwAP/5cZH/xAgjZziJjNL3XBw=;
        b=KUcjy4TlWq2P19jcBUZ+QwDzTKCpTgj6HFoCNQcounDIRUpJZU1AUobafphsDdsz17
         pDxilIb3/9ZBMdgrDVbajESWeSII9zJ9x9nka3odMdp57fcv8TjcjMZqT69zchHimc1t
         /mXtni6zTNig/tQR3HhmlZQQyUaiVIR10eS0Nc+C4wcLAfBrE4BsywPsNfFwYz1OIkkT
         atsKYGcPlS6k2S7S0IuYsWu6ui4WtzmyUkXXauLf/U0CFyPE1N2C6c1FDHJAAlP269ih
         4RWYXOFN1IrtuiMsR0g3M2vmfadSBAdtKFGXawEHg8ZpvOJnmOPRt0zXunOjrKb6LYcC
         eEIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781810058; x=1782414858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gIhj8csyUjzimg3goW3Pzqun4T3ZR1YGiH42Uwliks=;
        b=KRnGqaZiH3SMfI8GqOnMdfnCq0OYZBNMuoMiHtHIIxBVbM6Uhgm0iTQZa7I5OHAfbf
         BURnZ5d4gLFtXUxk+a+CjEVq/93fG4aEuGeq8ut5Xd3InAogUdwGpILmcEbes2S2U+Dm
         4xOMOkfOCOPL0i3Ey5cou91+8ebPUWNmIEE46OIhhNZgjIUviSAmH5ZQI1J8TXdVJaPC
         64fMeVtQ14FsxCw+rPPm2KkBoBHXgZyfC30hbakkR1/5d2Di5GkTOxZ4/lJF1sTOGW2L
         MtIn/cEBAAc/Z1v+VO8XYVVuV0oJPej22IcERSnDD1awj/tMMKzV5CTC9vm0mg0mq+Pu
         zhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781810058; x=1782414858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3gIhj8csyUjzimg3goW3Pzqun4T3ZR1YGiH42Uwliks=;
        b=aF9Zx/oSxISxbSkhmMSpT54oB120PfnASTyARSdsw9uCpqoZRmKJb5IYKA5HNyu7wG
         bGBYz6zZgajq9gcT3x3Ob0PVziGzQpsVQUUovnjEY2U5/zBrIG6FRJMwjDu4GHkFXEiK
         KT9MvI3/M+hvr0iYULndwbQtx9jlXOR1IOMmxRxND/tRXbEQw89uPdVbNhdIPjzjaJuK
         JUj2/0c4gi58JfQ/xj4n384ffNomT2cxnl3RvMsIIu8SHSmS2zf+1u3hBu81/ewuuhau
         335ptfUUYAwCPniPrjbU8tfbhl7q3e4ib/1QvakqvmiNK+lfGOXu0kR228BddxOVgC8i
         MG7A==
X-Forwarded-Encrypted: i=1; AFNElJ+ZTjLwYoB08DsNztRc/g0uAC/MVLxsqt41NOLDW4aTfMLoMgtUSJy6YUakMp0BX0imuEFkRQg7MvnpSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Lz6f6wYAWXPNpmCl71pX9+tZiomsg+2uaOcslvxPP+oI69Ui
	+K3WV8DdbWFPr3CBvlvVzIO1iyrNl5ySTl8lEjBAsUbX5QcHbMXOGrcOmSQm9K+ZkHpKkhKSK+F
	Zp7pr+Nhk5kw2dkb1CGH1GJtbPB0gBGU=
X-Gm-Gg: AfdE7ckTI8gTRaodx6YGmMXPP3TPkmEa2sNFXGAkQZYG8yu9SnxEQ/dwUqT4sq273tR
	b3TPDqYoYj7akSkZKhnfiGUPO9UT22sWPM2K/QmZ3fmwKTNLW2zXCozsUNgJ6iw0n5bFlC+aA+C
	Vz3Nwa3asD4B1fULwWpoZhoeMdD5JMpseE4XaKpd+DFHRKxuwP+QQy0raDvTiVbuBvUlfK2iS93
	tCWI2EFATZ7oovr3juyEJO41UZxGpEozJPVCg7ENV+xqX+54BWYP3vmsLKPb1KiLBKbs843dq1X
	7eYhcFAEN91iikMpIg1RzjYm0vFptSxeqzhwtKi/rk3IHCxEChT2bFStlBdOq2PQDrkMcaQxnAH
	Gw24/ZmoxYUHl
X-Received: by 2002:a05:7300:230b:b0:30b:e4a6:1aab with SMTP id
 5a478bee46e88-30c074f8c21mr216868eec.8.1781810058121; Thu, 18 Jun 2026
 12:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618132628.3811068-2-phasta@kernel.org> <20260618132628.3811068-4-phasta@kernel.org>
In-Reply-To: <20260618132628.3811068-4-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 21:14:05 +0200
X-Gm-Features: AVVi8CeC-ql5SLxnogYN7t_D3e3IE25SNmVufxe0bxI6l-UhWmyMsdwZiyoyB5w
Message-ID: <CANiq72ke2pfkhHB-_x0dTKUbktkTvLsu7z5eCFYVyL1CH=O0Cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rust: error: Add ECANCELED error code
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Matthew Maurer <mmaurer@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Burak Emir <bqe@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eliot Courtney <ecourtney@nvidia.com>, Mirko Adzic <adzicmirko97@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:acourbot@nvidia.com,m:lina+kernel@asahilina.net,m:mmaurer@google.com,m:ljs@kernel.org,m:joelagnelf@nvidia.com,m:bqe@google.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:tamird@kernel.org,m:work@onurozkan.dev,m:ecourtney@nvidia.com,m:adzicmirko97@gmail.com,m:alistair.francis@wdc.com,m:shankari.ak0208@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:lina@asahilina.net,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65232-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,collabora.com,linuxfoundation.org,nvidia.com,asahilina.net,gmail.com,onurozkan.dev,wdc.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 114D16A2506

On Thu, Jun 18, 2026 at 3:27=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> +    declare_err!(ECANCELED, "Request has been canceled.");

Please place it after `ETIMEDOUT` (these are meant to be sorted the
same way as in the C side -- we had a patch at some point to make it
more obvious, perhaps someone can resurrect it).

Cheers,
Miguel

