Return-Path: <linux-media+bounces-67583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lpqAD1l/Vmr17QAAu9opvQ
	(envelope-from <linux-media+bounces-67583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 20:26:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D5757D45
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 20:26:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QQB1NvnQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67583-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67583-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C69A3041B9B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 18:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B1943F4BE;
	Tue, 14 Jul 2026 18:26:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD34156F5
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 18:26:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053581; cv=pass; b=gO/gHJ3935HnPqCE0sNSTON4G3Wi23B2szqT030BbOfz+u9JPgxFm3aAdzbfnRmPBcWBQGxLU9OAKaRgzYfpIKuIaX8Hxuqja29/VWSsLQdWt/Z9NmqvYzi5MpDVGKd+rKSw1vAM7kU0gR7zBQHC4ulkHyBVoEBQEOayip8B438=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053581; c=relaxed/simple;
	bh=CWq1ibkcj9NeNh3SlSdPZImkJeUrte+X5SZJ2CDVQ0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcufGUaM3NI+tl/CkBiE6f8aanIAOu5h4m13YtNadYPj9QRu+WuZjtkVkwmGfTmErLZJRaq29EeE3QvU7JwGkcLbaB3B2W2Zr+AaasQK1lf979V6DdiS/S36khCsn7L4j6nSJAa6rtxyEGo43vXjIelSoy/4MQCa9HPss6zOVGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQB1NvnQ; arc=pass smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384c94c9423so449878a91.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 11:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784053578; cv=none;
        d=google.com; s=arc-20260327;
        b=XGxszPsxaUcIsHKcwap0hpvG2QiI5usAEIE1gw5BzuapDsSBZI1KdkrTrpQoXE9GdW
         hXWR5CDL17ERDcQ+nMSMX6LBco6uf/GKP/ULCCNB40TSiDNThnk242CIBzKLF1bKcGEe
         RzRxiECZzMDfDkr8YREo1lH6oa2fpXlEHdBhyU+pzInXnVoXC/N4fw4QOJxV7/qxVDzj
         i5WbSq13vrewWmoOvKeSMwgTsffw8nE6UzujsWYvu/4KaSI4upkL6XfApuM7v+3eepyf
         krq5IbH3rEYvuLsxpSHwHmbbUoVqs3kb+C+aErJJQTnfkTpeZ4N976XjjVuYgHwOPF8U
         3mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        fh=HTswuuEoJEwYqYbp5P6DYd7FqSQbV0KQY4U7mAhsETc=;
        b=dUln9zBHOxf6522pyW0BRayjf08xTNqWwnXw0SdIGGmBFEoFeWagf/9LWgbQFo0HNb
         dGgE+vXylaw2Os63AzKMSXG28ArfQJtjXgDKMClvsRVYxeScR60vhkn9hba8qIZZwp57
         92teyneLoS0T8W0xyGTUUvuONtb6CZyjNXAnXOF7qFfoWLtWHNLNsRwpwwEZrdfWkErh
         j78Rrf1J2Y7xInF9atW4NKhLA1kxa7kkNoDGt93K7Kh56QaNjjZXi6wNsZ0UrxykOvIO
         hH8KOZ/uRhG2nisWYOj0xn09MMVZ4U8xC3gFJlH2tQp2m/rm+yY1E9MzlWvL27KmlRCm
         v7kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053578; x=1784658378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        b=QQB1NvnQWvdbgi0UvEE7cRhOhcNhdmTpbpPaPej1CMzbRBCApW9+vuZYpTIgnuoLpm
         ZXf68huGVIIlynGNN1f7ddRhhTu2NwH6yvwRbe3EllcBkpFXVGR/QrPj7FhFAg/wHNl0
         /9LGWKzytVSm+6zhnkhldnMNsIW7/LB08YaFA2JrskCgp/ePqVLSq61f4XTpAmlAl1ey
         LPqmBEHSUwpSq/c/H8z1soR/AR0xy+nRkaGxqj23r1CSLQyDI/i3eh/ChGSlrFz88iuT
         XQ6VhVppO3zlMkgRsoT582J28buRblJGemfiCRLRlm5o0gvEKiSYH5w9W16qelSTFCbH
         4hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053578; x=1784658378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        b=Yj82xdwrsRQMCm/viZV7LcTbunijX60rkmqHOzr4eJqps4p/X836AVbZ7XQF1J5bdf
         73ynj16SRO9jRNdeuuEGshxtWQJJeWEv8QT8NLLWBVORR0pN4j+P/OJ9EKagqoSCkfEg
         8RkSCt50kplkvBq+X4lgKJu/dTrOtxEb3Ra7KoovgSbqt1YFs2ctJBMe3jnPkKCzJ4Mc
         wnI17Hd3Wnt0pj9EtSwtr2wK3i7nV9iOEjsvOX9qXy2Opze+uYmzSBZ6EBUahj1VyYGC
         e0MzZPSGi6jPT0AmhraS/RoIUojZp0ZpMjqj7I/jJ/DGPr3FQ0pWFUCqlLhY6NxpsOqe
         8kXA==
X-Forwarded-Encrypted: i=1; AHgh+RosLi4/RJlJOmmwr45GerCubBFofL//GLVRNrw4sZMfgjUpoPbon8GU+6svwNBww1564ur8r3CbX9P1ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCZXbMZSyKCSWX784b7KxauXrT10VkaqCc3VAMfe4Rx0QHXjO
	mXWO50ViaFU5y01HEYHJ3B7V++L6yd+R1S7NupVXW6P1Fx6ZmSEmryPCaPAtJXvhb3HvbxMVDnL
	T6dQWsaBuS6WYVmghggUIgZXYko+Ngms=
X-Gm-Gg: AfdE7ckAc5shfWqcv7sib3cb1NsRUaCjPBVqsNjrS5YGxMUrnsOUfC68du9m0g8ZqBO
	qqNb9hEMKXB4f6BsqD54YzS7bH2N4kmq5/vdqyil+Wtmx1M5Cf4LaGh6p04sqOnBBioRW4iY5fb
	LCqr9IFq16sDNewjvR7AVeyYiYEVdBpIejW1QdSfcmOBlZj/6gkI/Yf+ZFdOjOarYbFYlVWrXoM
	/nNA0HqAeB1dMDwltcoa7/BRMQW0lyKPW6u3sEN4riFHip3csmxF1x6j7/un+J24ZAqMjZmNcZM
	vec+YV3bPDs9Zs/5FCzskFqq6Ycr+zYew0/8CTaQazWd1pKQW3rxawuO/fl0IXpMUX7h8u4hE7/
	D9Hhh009f3BTs
X-Received: by 2002:a17:90a:d408:b0:381:2d9a:447b with SMTP id
 98e67ed59e1d1-38dc7b31c40mr11110380a91.4.1784053577592; Tue, 14 Jul 2026
 11:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com> <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon> <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com> <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
In-Reply-To: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 20:26:03 +0200
X-Gm-Features: AUfX_mz_aRz7cY4MbeNoQZxVf8UF06_0oMEjEGVSK_wjJBa5PsYJvfIZ139w0Fw
Message-ID: <CANiq72khD4Uj69eVd2eGUYnhdEVyka6g7kQgv7-CfMTyv4a9DQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint abstractions
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Danilo Krummrich <dakr@kernel.org>, Oliver Neukum <oneukum@suse.com>, 
	Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	Colin Braun <colin.braun.cl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stern@rowland.harvard.edu,m:dakr@kernel.org,m:oneukum@suse.com,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67583-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,gmail.com,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,harvard.edu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C7D5757D45

On Tue, Jul 14, 2026 at 6:26=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> I'm aware that Rust has separate types for pointers that may be NULL and
> pointers that cannot be NULL.  Putting that into the language helps
> prevent a lot of bugs.  How would making the language be aware of
> whether a device is bound to a driver be similarly useful?

Generally speaking, different types can implement different methods,
which allows one to restrict what functions can be called in certain
cases, which prevents bugs.

Similarly, having different types allow one to put different
invariants on them, like the non-NULL you mention [*]. In turn, that
allows one to design APIs that require callers to pass the proof they
have the right type.

That is, even if something may be exactly the same underlying data
structure, the types being different allows to disambiguate this.

Otherwise, you may need to check or assume those facts, without
compiler support. In some cases, if those facts could lead to UB, then
it means one's API may need to be `unsafe` instead of a safe
abstraction, which make them more cumbersome and "dangerous" to use
for callers.

So, for instance,

  https://rust.docs.kernel.org/kernel/device/struct.Bound.html

says

  Some APIs, such as `dma::Coherent` or `Devres` rely on the `Device`
to be bound, which can be proven with the `Bound` device context.

And indeed there are methods that require such a `&Device<Bound>` like:

  https://rust.docs.kernel.org/kernel/devres/struct.Devres.html#method.new

Then the person implementing a safe abstraction can actually rely on
the fact that it knows those facts to argue certain things -- the
compiler will check it. For instance, that a call to the C side will
not introduce UB. But you can use this to argue for other things,
unrelated to UB, like making correctness arguments.

I hope that clarifies a bit and serves as context for the rest of the
discussion.

[*] By the way, Rust's references guarantee way more than just not
being NULL! Not being NULL is just the "easy case" which ones can
dynamically check in other languages anyway.

Cheers,
Miguel

