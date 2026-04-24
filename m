Return-Path: <linux-media+bounces-59513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAahE6lF62m4KQAAu9opvQ
	(envelope-from <linux-media+bounces-59513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:27:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A603B45D09E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA53303E4A8
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9B6364049;
	Fri, 24 Apr 2026 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B+mbviNm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EvjUS9vn"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921A342523;
	Fri, 24 Apr 2026 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026069; cv=none; b=DP026haE7XKA0A3VaOv23YaVfyreNJZtvhZyCjoxuNcPjYZBBLBbz8CXh2GlThlOPXLiyl0TjWM/ipmpQ7BofafJ2TKBKqioiY74y1DxUWTt1Ndfeuba3XIwedaSFgLVt30W7JBGY4/HLkmphJeE5so0GhMkh7iqjJ7o6y6TutA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026069; c=relaxed/simple;
	bh=Chv1puRfioyGSJlkLqCT+ehcsCuXmNnR7BpheETrs0Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XwlS+1pGozBb+GHn+iDULyWUq00PDxmJSwH6CguUyUp+aOpTS/cPmpJrDaKO+SVtNvg9/hRpeowN8zaT3DfH+uKHRbf7Py+A9I7CSM/fbmKu6jdVD+KEh5nC67mivQ1sy3NpZr4MjaFOv613lfUDTYoutw5388CuffOAFdOlWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B+mbviNm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EvjUS9vn; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6530A7A0202;
	Fri, 24 Apr 2026 06:21:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 24 Apr 2026 06:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777026065;
	 x=1777112465; bh=w2de/s2AwmjIkqgLfGJWj9+HNtcuQscOiCuhi0QGHvI=; b=
	B+mbviNmF9wq74f8/lvFylh2LL/ywyLUaboT2KdejP8+I+M57VP/d1HUt7AwypMq
	qaeOu1Xppm7uHREC6EuqmB4jQy0BchcaxNRJzQSqU8kMxsMxC8zj+FHAaMZd9HXN
	Le0vS+k4ZeVAPRSBwN+SZznIRJFMcYAjVB/HMnXZbvMBSLMvMXVvgnQ7K6jvCB2W
	1Ov4fAbacwhTJl1nFoXWx1UyViKeYs+/Y0XWxYaPjb8IpWHJBX0u6+irQDiNmSjN
	aVE8gd42KYQEw0HVVVFw3YOsBrotrRTZlrMeoW82y1XGRkVchLLJNDuRxAsFrlUI
	UfN/m7UDmtiXo2GiVmYdyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777026065; x=
	1777112465; bh=w2de/s2AwmjIkqgLfGJWj9+HNtcuQscOiCuhi0QGHvI=; b=E
	vjUS9vnPFGVt0akajaJyWtOEP3igkDnGryoMmKtC+4gJcYWCLkBaL5yF1rrOrgwy
	gXOtiWTIxCSKXYS/M3AFOJHDw4Bs421sbwuxJodC4BVzgIof9uAVXn7P+2tYOaOk
	CFxzWP8DCsGv9Kq58wtYzv39IcRC3z5eImSpwX9IWWZjNAiv19xarXqUMTWdP7c4
	Sjv4AHktsSJksuV9KiNSJrA/lJxTAyjND0zIz0Awgrtq1dmZ5CEyxUFkZuN9R+yu
	HVIfP7GP0FEF3XwDJoJcDXjWPPX9qLIqOzZPKAhTJy5OPIyuyAxQP890sPwvmJKY
	blSL+l+DF2KnTekchZDKg==
X-ME-Sender: <xms:D0Trae19MjTG_za4-q6tI3IYukIc3qi3IM-4gsy0ZI7NA0sIlvhZcQ>
    <xme:D0Trab5frQ6BPQUr6fQGYLUjtZxK2x-yKx1MZiA5iKL4ixvKLGbxrdzmcfoIMR8lQ
    U7W2GMHzzu6UP2SV595C6RuMeS1q1NZzSN5pa75raHKng3oJLedNcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeileejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopegthh
    hrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrse
    hffhiflhhlrdgthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgt
    phhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomhdprh
    gtphhtthhopehmkhgthhgruhhrrghssehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhi
    tghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtth
    hopehnphhighhgihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:EETrabWiu3Q4TKvBFiT-sC4gHXQTtatPtyMUsrhrNVGBzlFu-Yb58w>
    <xmx:EETraW4pyJGCDNQiU_FGAV1NORAvBgkhoz31Kuzm7HZA31Wp9TnvJQ>
    <xmx:EETraTNmbHOygZe1GbvWONAPt3n1uBYwe4Ukor476cerA33kURAYpw>
    <xmx:EETraZj_NAivBLsOtToh9Y2ogcA225k_V99MUmvMXWwNQU7wqhLDbQ>
    <xmx:EUTraRI7sgO1747jdWIkY_dPJ1VToHV6U6hOWdjaLuAyw7okPuTQVZnk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DE31E700069; Fri, 24 Apr 2026 06:21:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADiin7Vigcc3
Date: Fri, 24 Apr 2026 12:20:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Link Mauve" <linkmauve@linkmauve.fr>,
 "David Laight" <david.laight.linux@gmail.com>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Jason Baron" <jbaron@akamai.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, boqun@kernel.org,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, tamird@kernel.org,
 "Nicolas Schier" <nsc@kernel.org>, simona.vetter@ffwll.ch,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A603B45D09E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-59513-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linkmauve.fr,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkmauve.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim,messagingengine.com:dkim,app.fastmail.com:mid]

On Fri, Apr 24, 2026, at 11:43, Link Mauve wrote:
> On Fri, Apr 24, 2026 at 10:14:25AM +0100, David Laight wrote:
>> On Fri, 24 Apr 2026 11:17:40 +0530
>> "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
>>=20
>> > From: Link Mauve <linkmauve@linkmauve.fr>
>> >=20
>> > The core crate currently depends on these two functions for i64/u64/
>> > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t=
 use that in
>> > the kernel so let=E2=80=99s panic if they are ever called.
>>=20
>> Ugg.
>> Surely you can make it a link-time failure?
>> Or change the underlying code to avoid the divide.
>
> This is currently a link-time failure, which means if any of the core
> crate or drm_panic_qr are linked in, the kernel will fail to link.
>
> And since we rely on core, that means no kernel can be built on PowerPC
> without this patch.
>
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite fi=
gure out
> how to do formatting without it, maybe I will just open an issue again=
st
> Rust.

How hard would it be to have a private copy of the parts of the core
crate that the kernel actually needs? Since Linux is neither quite
hosted (using a full libc) nor entirely freestanding (still using
some library interfaces), the C implementation on most architectures
has a small subset of the libgcc that we ship with the kernel.

I assume the core crate is larger than libgcc, but I don't know how
much of it is actually needed here.

       Arnd

