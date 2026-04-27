Return-Path: <linux-media+bounces-59689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JzSBquN72mhCwEAu9opvQ
	(envelope-from <linux-media+bounces-59689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 18:24:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C274764E3
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 18:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7E173045E89
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 16:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5E334D3BE;
	Mon, 27 Apr 2026 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LM+1WQZb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rcp5e0Yz"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865DB3385AC;
	Mon, 27 Apr 2026 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305926; cv=none; b=hSFOSDkHantZUXnGOvEhVvsyfqxz3+8GbUdk1sJFDFOSlKWDqCwi0mY5ySmpSw9sIl/1jahUZRk88s2BZDVL82k1kKoddjuJ0qWDFjRAdNsm5CCgRMBXQ6s5Usoj/jLz/m+YwnyCTqPpY/eU5I5acNmp2xrIc7qE9EwG+nJkumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305926; c=relaxed/simple;
	bh=vbZdqbw7FzAtu+e+zkTmT9zpbxiygvDKDe8SFC5BI+Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LDlb0Wlgt63BgSF9Avw7B9cinJPqMGAEhdHh0LOCXGsQyuPyDqGHpy8R7gd5SjSgvWADcwcdxmwJeyHFn6ZuP5qlHP/5uzyu23x01o6ZSF5M07vJtg7hijtJd8IOfB1oZ93MKdz798ts5izHwtMDM2Z5bylIVha3ZgU464YHcME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LM+1WQZb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rcp5e0Yz; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D7ECAEC0FC1;
	Mon, 27 Apr 2026 12:05:24 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 12:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777305924;
	 x=1777392324; bh=ZCtou/cEXXCW2EAHTSeZgopr0M/VLaS4+NUan7nzjpo=; b=
	LM+1WQZbjg5FBMii6wK/sxZP2lOaFxRnk3u5Y3RPRDCzwUmZITJVrJYqecL2ip3a
	4zzSTLCelWjFhL013m4iJHoxS6Qryrlltr0l0KcnCsF0zd8QPA8q6pUln4acYa8M
	54nuREiojIbbaBaMFMLGNK8a5NR9/kuocofwyDkZm5DW7GuZ/jmqkNE5M3f46zKo
	5QaTkvQGYhoJdysVmGamXRQKrpuIz7P+dDEeMSCkxebmSIF11REtmkrF47cpziZe
	zenSKG9DiD44E7jJxT04sOGvo0Hmconj/mNLbJlmwwqDLCfLgJ3JyiScecfLsZYk
	HjdD77kIDYfokvaUaH6FTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777305924; x=
	1777392324; bh=ZCtou/cEXXCW2EAHTSeZgopr0M/VLaS4+NUan7nzjpo=; b=r
	cp5e0YzGwabDnLbX/xXlbtzzv9e8OX0XRwm69dlgxbBAO3PGQDnv+gLQ9iNaw41t
	wiog0CQMhPF+ACfM6DLMRENiyAYiJeJm1+ICJB+8quz+E31tQ6nPNQPc/XBiA0pw
	n/cJg9b/IcMhSBopBJbLrEhhxyEQYKBBRMOIyStsB49kW1o929ihCOJ9oxPJS4yR
	mklaN+1vMJ3XdBzCPiiHtUvU0bqlp9z4Q7AZjFEMVRW4SXSTRkvgkYb2ToIN4omR
	5t/JFUxGzDJDq0qYmldtbIqsLrBi89KCkPrVSmT1gzvgREkXP55VsmGOAjNpoHa2
	dL7fdzim8Bm97btgfIZ5Q==
X-ME-Sender: <xms:Q4nvabvgD-Y0-q21rj0xIevp3vYtWZ1cxKFvIuxKRHMaTtQTxjGz5A>
    <xme:Q4nvaXSFnWpwpLdH3gTHczIdKeqNIYEdHjDNHzryu4ch2F0apyFIXLg61RMHMZ-b3
    304p_cMmvtBQBKrtHOzNpIgGPl-vyiY4uum6i7My8pPO5wY649nPVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejleduvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Q4nvacXMD2rgkFYfQT6xRfjCHHzuIur5ewWkYvLB3s1CPfPeONk9Yg>
    <xmx:Q4nvaY2Is8kGpnqdtzP_bEIxpw2iOsohNjjdyy0uXHi_Xq7T0TrmMg>
    <xmx:Q4nvaeM0ht2htEmAr3ZLvSR44Fg_2_9W52RbXTZcjuamGIomTUJOMg>
    <xmx:Q4nvaQS7xdW9MU6arMT9qKha7QhqS-7qn5T0fzYzrfcy_Nars0aFfg>
    <xmx:RInvaRzrTfYEHKqKGtWlisXUYFSpPribsTZQ5DAa5owond2lsXUold8G>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B6AE700065; Mon, 27 Apr 2026 12:05:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADiin7Vigcc3
Date: Mon, 27 Apr 2026 18:05:01 +0200
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
Message-Id: <21348763-ff78-46c6-b0eb-eedce69a839a@app.fastmail.com>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna>
Subject: Re: [Linaro-mm-sig] Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3()
 panic
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 22C274764E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-59689-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,linkmauve.fr:email,app.fastmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim]

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

I think you just need to rewrite the patch description, it appears
that everyone misunderstands what you are doing in the patch:

Like on arm32, normal kernel code will continue to cause
a link failure the same way in Rust as it does in C, and your
patch does not change that. When you (or Link Mauve) "let's panic",
I assume this is was just a mistake in summarizing the logic
that turns the unreachable code from the Rust core crate
into a runtime assertion since it would be impossible to link
the kernel otherwise.

Silently turning a 64-bit division into a panic() for normal
code would of course be unacceptable, but that's not what
you are doing here.

    Arnd

