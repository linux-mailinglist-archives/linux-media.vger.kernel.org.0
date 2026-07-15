Return-Path: <linux-media+bounces-67687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bWeFIPSUV2q9XQAAu9opvQ
	(envelope-from <linux-media+bounces-67687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:11:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E61CD75F306
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:10:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=UaSfAw47;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67687-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67687-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B98F3022F74
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E5536998A;
	Wed, 15 Jul 2026 14:09:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A2364942
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:09:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124564; cv=pass; b=chvE0306HDMLM7dL+bru60U7Wl6hLRJjfS0f+6SXljsWF3eyuKfG0PxEQf2ea00vmBVesZ6lNHUtdW5yHQYLao1bmx4V4Ac5Y2XxYg4tYqHHNDvJtyNX/qC+O6vsxXrSTjq4u3QiSN7t3zGnoke4bxZ9miTPdOc8HGB/3nf0oXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124564; c=relaxed/simple;
	bh=SNqsn1X2G8kP/+EM1dJk3CmM2TUfgksbckY1LKNvZHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUV6JVTrVdBHFijRbzwPorj+MOEzQ8bpIa7GxknySGL2ChBp/DIeqnadRrdIOaWKthbz7GUoaSRq51TCBtaVYufqFpM5+n16Vam9k88rxRTKK6Wsl3HnyKw1uleh35GXXmYnDmiCKXUCF2yJUfYcCk4o8WPhVhLtXdJ9ao7TvhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UaSfAw47; arc=pass smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b966dd74so21877475e9.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784124561; cv=none;
        d=google.com; s=arc-20260327;
        b=ESO/ZdgJZHM6FH4zzvx+4wlUO12uaWqYdEmMex7idYaNpEwcZ8AJlKTLBaJqJMkNK8
         xXQtiZDe5Kc5TYkQVtUXmmzbQ57jHqSbC1v2WzOySUqHpaXmULftIu/pwZBLkFYWzRXH
         WMp38EUfCk1SztyVLHm2DuaveLipzUPcc/uyq2gCbkIGBiyizeps7gETiG8T7udbofjR
         OSJ8WBVhAnsZAX0VJeQa918t+vpI2rxuFfZJuJd7eRgGo4upx+K/PrmPK9lBmBjhR9s1
         C44ZqW7EpUCMyT9zLWGydsUKbCwfiZcqkPEkvwsWC2+OvCCyVMvhqdokObclcmJa5B+B
         YqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1mcx5kizqsJiWKU3Assktv3idKETuJ14oVMLxFKExzM=;
        fh=vQlLWeZ7rRgnHDkROHqRB2cdA/1o1pfhgkc8w2I9MZk=;
        b=VCa9vKdQXt1OCkpN9aX/pjCTUTNWJC3Sq8DVulEXtfgMdhWKBCo/yHUurGJsHatRx+
         LbEcFZtVSXDtPjN4beIOfABUZuooABBan0rbAhyGMHvfH/6dJuT7yl8+1eB3AEOXeZmF
         beIdiLy6hrifuzXnazEdBgYSUFpcqOnq64VLPERtoxduIVIwvY0/d1zX3bQkKSD0xTCM
         V8pDfDUT8EtUO2J5sORuDMFifKJrGhO4PfzljVWCW1DOEXOytbAvHi8iyxlCbaB39Kiz
         b//nZw2llgS63IaSB7yL4fYtRRwqXCHTVsXdONJXC2Q5tJGMh9xTVhlFTVlYwUdFAFBt
         ACSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784124561; x=1784729361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mcx5kizqsJiWKU3Assktv3idKETuJ14oVMLxFKExzM=;
        b=UaSfAw47mfe2To7mpkFVmc5n0JVKld4Zp9BlmAHPqKKjxaAcOi8Gc53dGuMtjTJkot
         30OkIQx/GnCqe1zn9XcxNT+x5qXde9tenGtZDyE4It6anCRuW/ZjtNCqrLfWi8K/4fnh
         IZXtQsK3I6YA2J1hoa7mLqfndnPAJPLGyJOJMkp/h8KOTYBX6cMrXxXNMT4fdByR6CGN
         BSG6+u7Y733zuJuayhDf4DZiXRLfsEq6m9/ZcPk1pBEPRhEsQ2kfqLapk2yODzQEiVVN
         LpoMEYzQZ4oaZ7Gg8QZuI/uIWZiu9JfYSv2atUROZuUEa9OQZxdVEuXf3eJrDSv7nZJB
         JCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124561; x=1784729361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mcx5kizqsJiWKU3Assktv3idKETuJ14oVMLxFKExzM=;
        b=WxN0hXZ6qxEO+QyEvkSiyzVACreg6cChHx8+TkqCb6B+1OT5P0Dx8f9+CtwoZZJZ4T
         iJaT3MYhIFTVcRr6wTwnapn5ZsDJ7NGpTmHYd+pQUMI9bFyje1Untdediu6Fz6QJ9sAK
         okdpqA9Hp/py7WLdGjBANL7uUA8Tnt5VDoGNvQWAf+RecHqFTcjjgfl7+apSFNooT0fi
         Gz/89/LRJ6mYWrQvxnC3LDzPDzYFj4DLrYrtOumjXzsSly2454NY64MYWwA2mxYM2UK+
         5Hq/6cXm6aDECnlf1vxoXwGf/pqtTvPEnasjvtobS9ba42zI8GsUtbiLZditvfOfIUPQ
         A49w==
X-Forwarded-Encrypted: i=1; AHgh+RpX2+fOQt3vdAidta27C8mM7Og/ZKjVZkyf2/BN6fXsqZC0YzrZCH3Vqz5hXGKOTJ04vdB1shO1dZqh/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYiVyfg0V0JTTOSpqsb1lQrKoX0HIEfjEVqolVlX24X5pci2bQ
	RB0CdV4ZWUWZ78Cf3+fyRvj5YwB4csdXuCmI6xQ4Ffo+paewy2pGZxxLP7VVcCDGVDSO3jqbovU
	6irj0wSjJzdvbPP+baT3yuMtp7OyyqM1ruwyMNZDS
X-Gm-Gg: AfdE7clv5blL+tKaZwVDg9GwLsx+5b4OrZZVqrKTgNYmb8+UHoLIiNZ1XkBgLoqj9nw
	OJ05qAH95KVpDKOWo3hIced3E1L3w3VCx7R653jIILcAxje1qtDsHFErMtvWWsFuQW1eqdVrnrQ
	B3IVZM6NIgqjy/jDPYVYZRuUfwY0dUoWmSG+Blvr9yliCHcHaRvElAYU2bHlgYK4yh+6Vm1s5/G
	5g4Bb4EUnx2/ZK3RvW6fOrRFTnWN0bIfXmxQE1QPEah2C1C7hkePIi1I86GVlUypQmjtDKqT6X5
	k9OvRT3aWiHz5szyRnTTF41TO5k=
X-Received: by 2002:a05:600d:8443:10b0:495:404b:85eb with SMTP id
 5b1f17b1804b1-495404b8636mr4530305e9.26.1784124560869; Wed, 15 Jul 2026
 07:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605133541.22569-1-boqun@kernel.org> <20260605133541.22569-5-boqun@kernel.org>
In-Reply-To: <20260605133541.22569-5-boqun@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jul 2026 16:09:08 +0200
X-Gm-Features: AUfX_myXsOMxqzySIL_c6wjy_KTMgParE-LvwcdXFSkdOBkOsDSHqrVd6QhTOvc
Message-ID: <CAH5fLggHxeDMm1ygYEGPpjCdfRD8nEsgN31WMvjX3mMPs5p5yg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: maple_tree: Add load_rcu()
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67687-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E61CD75F306
X-Rspamd-Action: no action

On Fri, Jun 5, 2026 at 3:35=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote:
>
> From: Alice Ryhl <aliceryhl@google.com>
>
> Now that we have a concept of rcu-safe containers, we may add a
> load_rcu() method to MapleTree that does not take the spinlock.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/maple_tree.rs | 52 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> index 265d6396a78a..1499191b8935 100644
> --- a/rust/kernel/maple_tree.rs
> +++ b/rust/kernel/maple_tree.rs
> @@ -16,6 +16,10 @@
>      alloc::Flags,
>      error::to_result,
>      prelude::*,
> +    sync::rcu::{
> +        self,
> +        ForeignOwnableRcu, //
> +    },
>      types::{ForeignOwnable, Opaque},
>  };
>
> @@ -233,6 +237,54 @@ pub fn erase(&self, index: usize) -> Option<T> {
>          unsafe { T::try_from_foreign(ret) }
>      }
>
> +    /// Load the value at the given index with rcu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read the value under an rcu read lock. Even if the value is remo=
ved, it remains accessible
> +    /// for one rcu grace period.
> +    ///
> +    /// ```ignore
> +    /// use kernel::{
> +    ///     maple_tree::MapleTree,
> +    ///     sync::rcu::{self, RcuBox},
> +    /// };
> +    ///
> +    /// let tree =3D KBox::pin_init(MapleTree::<RcuBox<i32>>::new(), GFP=
_KERNEL)?;
> +    ///
> +    /// let ten =3D RcuBox::new(10, GFP_KERNEL)?;
> +    /// tree.insert(100, ten, GFP_KERNEL)?;
> +    ///
> +    /// let rcu_read_lock =3D rcu::Guard::new();
> +    /// let ten =3D tree.load_rcu(100, &rcu_read_lock);
> +    /// assert_eq!(ten, Some(&10));
> +    ///
> +    /// // Even if the value gets removed, we may continue to access it =
for one rcu grace period.
> +    /// tree.erase(100);
> +    /// assert_eq!(ten, Some(&10));
> +    /// # Ok::<_, Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn load_rcu<'rcu>(
> +        &self,
> +        index: usize,
> +        _rcu: &'rcu rcu::Guard,
> +    ) -> Option<T::RcuBorrowed<'rcu>>
> +    where
> +        T: ForeignOwnableRcu,
> +    {
> +        // SAFETY: `self.tree` contains a valid maple tree.
> +        let ret =3D unsafe { bindings::mtree_load(self.tree.get(), index=
) };

I think this is only legal if MT_FLAGS_USE_RCU is set on the tree. :(

Alice

