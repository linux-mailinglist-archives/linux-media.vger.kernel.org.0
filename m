Return-Path: <linux-media+bounces-63710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ayh5DtPLIGr97wAAu9opvQ
	(envelope-from <linux-media+bounces-63710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:50:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BA63C1D1
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ov1dSpPH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63710-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63710-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098FE30BEE83
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E500220687;
	Thu,  4 Jun 2026 00:43:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E71FDE31
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:43:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533811; cv=none; b=XMn8NI/WY4s9D19AiLm9+GsqysD/IQMeFujVtBAzfy79wdDBMPRgrq+g3pmw9f3dwhezMV7x/ODU8vvSR5lcpbdCm0jc3oQ1/Mrx239kAAeobLvomwxAjtdOJ6a2hPI+ZnBW4v3SN7ZJCWb7l1QqpE6K7+rF7XAyH7JwPikq7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533811; c=relaxed/simple;
	bh=gj4bcJ8tjxayhWwgX9WJSdtsCrztau9lrcqdIlpVaDk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dMIJGY6CbWPD5c+WgkzCtezS2CBZz+T1IOekGLwNNE5GPth4fVcX9h/u21sfwJ/lARPRX3C6+EvSAGwH7B+RaEfINrrhbvqJUdlnXEdHnqffsFpuPkzUoFW5KjS/BiPagz0EaVJpCTe7T3vwr1uwiUPKr8DoHKTss0Rkv3t5Aso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov1dSpPH; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59f967189e7so43627e0c.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533809; x=1781138609; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rym8UMbIPSnQ16D68tiaqUk5iYRBwLoCnDZwF31rnjM=;
        b=Ov1dSpPHl1JK3m11++irJKd/Vz+ipI+0hxhIEo2ZDuVmhi69EZqxC3nzSTJWIIONEc
         BgNukYkbh72tOkVI+wm1wobJyxkUrMu5/nr3kaiJ/YDsN8HAxorWKZbtJ4UCTqnjS+gB
         bfq7a7fiQvrCDqUBumCtR2KNWLusLXj1uhGcTK7QIdE8J6G92AiqwNkJsXwdlm62nQI/
         e/bgRAXhZQePDEr3MGz18qCOGkrTiXo0aNBhgdQhRC0C4qQOqcxYRHTw/quDlVDI2Fbi
         94OlBiqggMXR9tNG3gdbhy634DH0luSsT6YIP5IMcXL4659Sm9QMLd8zcHwrUZaZ5sbz
         Q1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533809; x=1781138609;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rym8UMbIPSnQ16D68tiaqUk5iYRBwLoCnDZwF31rnjM=;
        b=sta5X9byHG7gzyOr+lw9F64993L+0wc8l5j9DsBPvisgQ90kqIET/FF85YqIykCQdh
         33B2eRbfdPljqN4uk51Tgudx7O5FC8IBTXtkk2NxjwkgDw1o2nwy3ub6WzcaqbQ4R23q
         hVgHBCfH0Mzm4qlQo1Tx2+HSQ3Y0vy6SzYmAsf/yN7xf8zbi8LXIUMNkgy59sXwst7ZF
         Tr4fcT20EeXmnqIYbxPwRZqdMQB1B+4AybLPCuqjOKatoATU58l6eT/3yTmwdQjtGg25
         NkCBUH8vxk9xkYy1LO473wP0l0j9GGFQ2Xn45Nns1g+AIEa+14w8TTsSuDV02xrynQH/
         ZSKg==
X-Forwarded-Encrypted: i=1; AFNElJ/FVnVPOGI/EzUVPN8Eavq+9Q3vk8JM10CI11xAD8IBfuzlX/xICjjuDmMOerwGp+5V7sFdMiWtwP1s9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4DN/4JCJDKYQ2AUHl7f/bUpsXSz2Pkdc2DfrhNDar59+KDvSZ
	ntMpfNJmFxnfXbjNU9jnbslcdd/y9uPORPQ9/h5Pm321HZKylW79QwZF
X-Gm-Gg: Acq92OE4GWrcZiQqPfsna1gMhraOqc0/SIKF8kcXH7qy23HSgEvLbmRuCeTq8Rs/e3l
	MeXjbrma3fnwLms32aCnNQTD8vtlYf8fHQ69fDipCY7DgvAglVghciwCcgji2D0Ut3u3E4d+0Qh
	Ns5ukjqfIuuLm/YU1ZNKZLRX/6yDwLvIAT8tXlMPlMZQyNprpkPrzlA1YgXvSmjryBecDNY8twq
	FqB3IlNHShBnFaGfDfJ8RD4HpS2Zf1cpzToIvVfjP+1vdcjfvwJtjiAM+sEOVdBWxOQPOYvw52A
	99rPNEyIVAm7lP4bn2xAgHuZ9aK13J4TMXxmfKcMx5l+sv+wnVD2xJ5GGANEM5wuU9DeXhYgBJs
	39wwzfPexIpfz2y233HZgpBndHk0+DqWgg4yfAcfe9zzHwn8YAVYacbUW8JLG6Dz5YULXvvqqh3
	abj6y1SArzoyUGfp73BYUzQXcN4o/qFNp1NyoS8KKWoO/JLRzlvlKf
X-Received: by 2002:a05:6122:e250:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5a6e20460f6mr4443168e0c.1.1780533809510;
        Wed, 03 Jun 2026 17:43:29 -0700 (PDT)
Received: from smtpclient.apple ([179.165.169.30])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6dc3d3fsm4139948e0c.5.2026.06.03.17.43.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2026 17:43:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <20260603191405.4c75badb@fedora-2.home>
Date: Wed, 3 Jun 2026 21:43:05 -0300
Cc: Philipp Stanner <phasta@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 rcu@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-5-phasta@kernel.org>
 <4F8E8E04-5AB5-4E6B-9194-5FC467E2313F@collabora.com>
 <20260603191405.4c75badb@fedora-2.home>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63710-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:boris.brezillon@collabora.com,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:
 lists@lfdr.de];
	FORGED_SENDER(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 844BA63C1D1



> On 3 Jun 2026, at 14:14, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> On Wed, 3 Jun 2026 13:41:02 -0300
> Daniel Almeida <dwlsalmeida@gmail.com> wrote:
>=20
>>> +    /// Called when the fence is signaled.
>>> +    ///
>>> +    /// This is called from the fence signaling path, which may be =
in interrupt
>>> +    /// context or with locks held, which is why `self` is only =
borrowed, so that
>>> +    /// it cannot drop. Implementations must not sleep or perform
>>> +    /// long-running operations.
>>> +    ///
>>> +    /// An implementation likely wants to inform itself (e.g., =
through a work item)
>>> +    /// within this callback that the associated =
[`FenceCbRegistration`] can now be
>>> +    /// dropped.
>>> +    fn called(&mut self); =20
>>=20
>> This is a central point. We ideally would want this to consume self, =
because we
>> may want to move things out of the callback. =20
>=20
> This one comes from me. The rationale being that ::called() is called
> from an atomic context, and the resources attached to the callback =
data
> might require acquiring other sleeping locks to be released, and
> sometimes you don't even notice immediately because said resources are
> refcounted, and the lock is only acquired when you happen to be the
> last owner. Yes, those can be caught at runtime if the C side is
> properly annotated with might_sleep(), but that's not always the case.
>=20
> If we defer the drop of the data only when the FenceCb is
> dropped/recycled, we're at least not constrained by this "runs in
> atomic context" thing.
>=20

This design does not solve it, because one can quite trivially get =
around this
restriction using Option<T> as I said. If your point is =E2=80=9Cdon=E2=80=
=99t run any drop() here=E2=80=9D,
then &mut self doesn=E2=80=99t do it.

>>=20
>> Consider a fence design where signal() consumes self. Now consider =
this:
>>=20
>> ```
>> impl FenceCb for MyCallback {
>> fn called(&mut self) {
>>   // Can't move the fence out, so we have to put an Option<T> just to =
be able
>>   // to move.
>>   if let Some(f) =3D self.some_fence.take() {
>>     f.signal();
>>   }
>> }
>> ```
>>=20
>> This used to be the case when our version of the job queue used the =
"proxy
>> fence" design:
>>=20
>>=20
>> ```
>> // Callback on the hw fence
>> impl FenceCb for MyCallback {
>> fn called(&mut self) {
>>   if let Some(f) =3D self.submit_fence.take() {
>>     f.signal();
>>   }
>=20
> I'm pretty sure lockdep won't like it anyway, because this is nested
> locking of the same lock class. For such proxies, we'll need to teach
> lockdep about the nesting like has been recently done on
> dma_fence_array & co. But I'm digressing.

Yeah, but this is more about resource transfer in general, not
this pattern specifically.

I agree that this has issues, and yes, lockdep complained back
then :)

>=20
>> }
>> ```
>>=20
>> Although this is not the case anymore, since we phased out this =
design given
>> Christian's recent work. Still, we should ideally not require =
Option<T> here in
>> general just to make resource transfer possible.
>=20
> I see. OTOH, don't we need to make this inner data movable if we want
> to cancel the FenceCb before the fence is signaled anyway? And that's
> most certainly a case we have in the teardown path.

Can you expand a bit on what you mean here?=

