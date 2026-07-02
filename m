Return-Path: <linux-media+bounces-66377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xX2uDu9uRmrAUwsAu9opvQ
	(envelope-from <linux-media+bounces-66377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:00:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B94896F8A33
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:00:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=VAHLoTLw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66377-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66377-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 736B33018D3C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 14:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B1B4BC038;
	Thu,  2 Jul 2026 14:00:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFCC4BC011
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 14:00:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000808; cv=pass; b=J/4QZYERHCzJqhFDVOH4OXAI9yTK+rflXtQfVjksxorhEVdzTSj8cx6C6FSPzlHJLt0utoKBN+wjO61Dmhktnc98sg9sxY7pd7mAGvvupcum7W3oTBFiMx2CJ99PEHKY+Glrkktw3WFktXcXCK+B11AKSXdGLR17L7jH8J0QX4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000808; c=relaxed/simple;
	bh=utoARpDnvA3c3vaCWBg5H9ujL8C1Fui0A2kGFCJI2Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMybHpnCwFuBx3IR1EkDr2OQQocvMOBZdlC2tkBw8wRcjhYHO9KbybDPcJoHkqa8NUeLDLCsothF2EXolcLaITg1A74Bh0nXDyhUdCavsRpS0i0WqGUaZswIOWSchFIwdqsZypGQMl+2bCvuimIxdUVIepqpl1pfgmUrDQpsD8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VAHLoTLw; arc=pass smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso10426615e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 07:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783000806; cv=none;
        d=google.com; s=arc-20260327;
        b=AM1oOZp60aOzmy4Qf6qAxpczN9ZuExdV3zylO+7TM6qZ2luS6QB8qnVDa0BVnYxWuE
         4yNjwhWTt92xsXgw4i8PPoahSZf19QiE3yttaYOO6asJM6wZkEmPAe97ji34XUiGqiax
         P0O/zsiGpvZvCtUeUDg86ISnD3USYDu6ymVHlBgkNcRgcFOfR4WC2JVZKAMnZs6aa4Ei
         bJviUDpHgwFBRRZ0e1T1289RU7Fx8KZcKmR9ykfW77YS8a5+F2adWdzccrSv0Nen+qfz
         PFbfO8VC2l5JyIE3Cdr0s9iD6BgQCygkCUSPP5Z8F6n7OIiU2ap5yHZE7gyxlrJn5+Cj
         +Hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        fh=TjAtSV6Vz/bNdok8o3Wc38LDWKdS+W+cxXYUSuXoAfU=;
        b=HPCHRXHiiki+JzrI9AaXYwRKLmmpG8qoLyf7ccIe4N2pyfCoXtu+/8nTjEFDrW0vzg
         kwyyPZAVeiftSTURy8Ul9gXSXNpHU6dwAr91mfOVJAlNCVWSPVXPDOGU5c8XOHuftvCm
         8eU/ro3rLs1evtyjsoxexvv9XEqEt/oLe63j95VlgqK0d9jizBEnrimdl4z/T0ck/Ra0
         N5F8/j0sDArD9fJQiQ47kb2fv32nqWSMPjCxZZ7QSM893LypELYs4wuW7PCAQY6jrbWH
         iOPsuhk/gDrxCPwaCzl1cjfm00HQye3W3CZr10gpT9B4Fe1+x2f4Tqf8hXNXe0ObDU+L
         fG3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783000806; x=1783605606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        b=VAHLoTLw1Fzhn0TrxD+uMogXY3CfAE9fVKRujwZ6BRLlJ7WxN/a5fh0fgnx6XgGlab
         dKjrqM3e7hqpnqIUi9rBtqvLvy0hRn3vXkSOGZSQz8mcsr5A/n7ux5uDUAgj1UkvAN7s
         uXfi4jnGR7zWBRo2YO7KzLsuRMoMWAqxem3k//zXA5ZWPHON0ZWa7fw21F2gOIbp8BlI
         D7QOg+G6Mk8HyQMdQpmQGaAUDiPdgiPho/bnAwC/ngBfO/F6OKqVP8AYOrV0nEAyN495
         WzpSwd7BEe8PHaXMNPo1z61EKY01ELqc50QQYXuJNidCfqGFqqDOPPJURBeuH5TbiHnq
         fEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000806; x=1783605606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ad3f158zhv32TxrF7aQY3I8idlfk4/6P43hesQy1Oiw=;
        b=rMcG0BXnUKcqsPu9a2mwhVHoeqaUN0yVH0PHYzUoC+vAnwP4msRdT5AOvSvkiFFNdE
         r1xiDGpxthV1A+XwIsNLBOb8EvUZAP1tPy1u1eT5h7FBgPe2UUfgXH9HNR5n86ypNgx5
         31Xf1pnTQPCNia+3I+hDdRgbES0yhGzrEvIxsHBR7djdAtj2Rhi8dWQK3sOHWYYUVfjx
         sh/ExRGUVvMXt/tn9Ey/xbXGJ1EMSCElGCUB++8ZoH1IKJvYA3Nsklih5f1s3Yas0qjT
         3PGAeYv+knAhc4LYRjpewNLaz3gCrCbGm5GovTJ6V17eKvsGlXmlIcZUcxPexxpfBm2b
         +ZSA==
X-Forwarded-Encrypted: i=1; AFNElJ9pNhu33PTKBom/qT3MFI+uKpTutpMAZ4F2T5xtQXNiyF8SZjY7HStZSMrydYyZmiKbmTLgFOu6w3LPvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPS9e2dYsFOgEDJYJrd2rkB3JCT2vihUOAb6Z3kVsiKmlSb3t8
	avvsgbtoUp2HRfzn9ZIay1aiBU/UebYHEe2SW0WAoHf0hYtl2q72PiGnsi08wILoVkWotJF9rJl
	NXpxdDVLhBPjGmmU76zreV1HT+gCij1l4jAQDf/sd
X-Gm-Gg: AfdE7ckKnl342S8iH2Y6jwIeITwaneDbUgcPDzarAg/lfXsSvHJgjq7hj0jjlFzc5X6
	Ibq3ew+t55kpDDYO5A2/+9/pAlsyyPyF+9i6/+M0kQG5Wj/f3BznWaITsQIa7wsVO2BLQeYcW6J
	iKF88oWj7U6IbKWIXLr7qPJLac1oScIgd7HYHU5XWE7BVcwe9DQKlX0KoJilG/B1y348APHWzkC
	csqFORKNKsZ7ujok4oY9cMf2ZnEHkScCzKmT1F5M66Kh3iJgC1j8ds0NKsKZRN6ttGytaG0PRI0
	Ks37Q5TmN3g6dYZ0J+bOZg3vGU4=
X-Received: by 2002:a05:600c:5296:b0:492:6efc:7c60 with SMTP id
 5b1f17b1804b1-493c2b99781mr85583495e9.28.1783000804786; Thu, 02 Jul 2026
 07:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-idtable-rename-asptr-v1-1-e0927273c71a@google.com> <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
In-Reply-To: <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 2 Jul 2026 15:59:50 +0200
X-Gm-Features: AVVi8CexQdyFEd0R-YBeb950WefW10NhAupPBjQ8CXL2XbC1XoogGwE5GSAY5zY
Message-ID: <CAH5fLgjz_FTzv7rFsxcvt2N-3ehPxa2kHJqUHKDBv56OZw5UVA@mail.gmail.com>
Subject: Re: [PATCH] rust: device_id: rename IdTable::as_ptr to as_raw_id_table()
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Igor Korotin <igor.korotin@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:david.m.ertman@intel.com,m:iweiny@kernel.org,m:leon@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:igor.korotin@linux.dev,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66377-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,intel.com,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,linux.dev,google.com,linaro.org,amd.com,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,garyguo.net:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B94896F8A33

On Thu, Jul 2, 2026 at 3:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Jul 2, 2026 at 1:30 PM BST, Alice Ryhl wrote:
> > The current name of `as_ptr` is very generic, and if you attempt to
> > invoke `foo.as_ptr()` on a type for which this method is missing, then
> > an error along these lines will be printed:
> >
> >       error[E0599]: no method named `as_ptr` found for reference `&DmaB=
uf` in the current scope
> >          --> linux/rust/kernel/dma_buf/buf.rs:54:38
> >           |
> >        54 |         ptr::eq(self.as_ptr(), other.as_ptr())
> >           |                                      ^^^^^^ method not foun=
d in `&DmaBuf`
> >           |
> >           =3D help: items from traits can only be used if the trait is =
implemented and in scope
> >       note: `device_id::IdTable` defines an item `as_ptr`, perhaps you =
need to implement it
> >          --> linux/rust/kernel/device_id.rs:165:1
> >           |
> >       165 | pub trait IdTable<T: RawDeviceId, U> {
> >           | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Suggesting the IdTable trait when an as_ptr() method is missing is not
> > useful. Renaming it to `as_raw_id_table` makes the method name unique t=
o
> > this trait and avoids these bad suggestions.
>
> I think the name is fine. Functions of this sort is named `as_ptr()` and =
I don't
> see why it should differ just because it's on traits.
>
> I'd rather say this is a Rust deficiency. Perhaps there needs to be a
> improvement of `#[diagnostic::do_not_recommend]` so it can be sticked to =
methods
> or traits as well.

I had a similar thought:
https://internals.rust-lang.org/t/do-not-recommend-for-traits-themselves/24=
431

Alice

