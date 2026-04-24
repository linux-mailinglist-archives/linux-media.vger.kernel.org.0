Return-Path: <linux-media+bounces-59504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH6QJ2cx62lfJwAAu9opvQ
	(envelope-from <linux-media+bounces-59504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:01:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14C45BD1C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F7AA30315DE
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E23837B00F;
	Fri, 24 Apr 2026 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VAwtGBDd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DQKHbfZw"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2935DA77;
	Fri, 24 Apr 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021192; cv=none; b=VHgDVG8Dr16PwQ8qJlsfSynhVB0iqgzvaoVlLm+r9KHMWQAo2RfcKw2dUJUhXIdsm5da7YcMNCXkrdsu94/fU/QjPmYebnNXNwFQgcyexzM60qcLzpLs5KYH+1S9lsPNzUhBPUDirkUP5F+sfT+AcLyAe5pHGNVCx/J5U36exHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021192; c=relaxed/simple;
	bh=6R3Z/KG+r3Yr92hT6KC2UXQzybp6LR5jGaDq1W/CrZY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=d6GGIBI3kK03La8ID7naG42DvtRxLfBkK1i3VwUmx5PkApVfg4+l34KLyymLxVR7r+wKWLOW+KoZP9Hv8i+rHiJ6xNJMAqgnj2dHl15T2lsEWrRlrmyyYpIc9YTt+2pmXBW7DfDHkzycipb9EQ0Bd7lZpOYPvO9fn0+TjtV8Hvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VAwtGBDd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DQKHbfZw; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 92E997A025F;
	Fri, 24 Apr 2026 04:59:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 24 Apr 2026 04:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777021189;
	 x=1777107589; bh=mlomHPrruE4T+ys87B/weKxrB+OMcheSKA7ybwHe8Os=; b=
	VAwtGBDdupJVNcGs4MDYlHN/jcjRLczK3kvxLgWoQdqSNpidCbOM34UZdtC47lPI
	3mzLU0zrlTFvKZ4ByH4LX9Kc74D/yZouVzPWdHMwcRR2I1feKTWewWA7tTWI+ZJn
	PrCivp8NoY5n6WX3mrTswbFq4VmW/SNE7TH8ixsNpRyhFWyWMFTL1KmtdlIq+YV4
	Kqd5RjvlVW8dM6YHO4uaay2H+g3/Hiwvkb+D9ydasIbOygdMJBl45LE1dQLMPNks
	e6uubMuXLbwSb53dOAF6N0Z68dFgeLj6Sr8wJEC5GhRXlY6SxMikVtgDQeLDHKcT
	a6xtaaVwbYWaDHF/GgPeYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777021189; x=
	1777107589; bh=mlomHPrruE4T+ys87B/weKxrB+OMcheSKA7ybwHe8Os=; b=D
	QKHbfZw7Q2sK5fyHnbXqxbgWESxL1nXYGxwluPhFn04CPG0ZBoNwIGyTlE2bmVOx
	AdU+JrNbqccmxNUNuf1Unuo3Y9MufNOoEOQUHzy/Dt0Fd1EUMAWkUy8g7wYkzTZk
	tHj6S0blQgtMsWFUzUXtS4X7Zb/ocS8a8QF/iF4O4Ff1YZL5wyy6+pWnRWUMD/qt
	6RslSA1fTW4t8AVYcxkj3Q1GOVC79Od4yVRo3O1HtUx0w7zq8/HWNi0pcd1fSOhr
	zPwSZ8Jr8MoCjwPosyG48F3HQ7x+w8nWRA6wOb4l1R5vVbrgunuKZd/1BLg5Y/O/
	PAZfYZ88A0es7wYw41N1w==
X-ME-Sender: <xms:AzHraaywWnncYS8tNhxu63w-pdBByhF1khzcFj2QqdnD_7zXkakFWg>
    <xme:AzHraRGVdgiwkNe1nvTP1k6zaX_wJ8ZkyqgdKXya6mgkEbVD7yti8eiOP4J83Qde8
    hva1xiaUorg-yfUdfieO-6I8coGh6k11H7kKx3As8c6Wb13HojPbxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeileeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopegthh
    hrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrse
    hffhiflhhlrdgthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgt
    phhtthhopehmkhgthhgruhhrrghssehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitg
    hkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthho
    pehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesgh
    hoohgumhhishdrohhrgh
X-ME-Proxy: <xmx:AzHraU8PAM-pOR819TPN7Sy12OwyJa_bV3rrivQ1T8WeNaru67PLBQ>
    <xmx:AzHraYGd2u2SgOhQCAvkyX46Rn0Y5ChJvYTIHhv9DEn4DxxVWJHpyg>
    <xmx:AzHraTb8M-1Ggg45Cjrw2tGk-khaiCVKwHOQcW9e1jDzIcTeHgAb5w>
    <xmx:AzHracMu7nyMcdKc_oWpxYP_L21uEHKH1knniB8yVyBMOxpxXlfuYg>
    <xmx:BTHrafRJhrCm9AgwqxWvjH44g0NYZQpqxnlIVz9LfEM3RmBfYtPHuybK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BE908700065; Fri, 24 Apr 2026 04:59:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADiin7Vigcc3
Date: Fri, 24 Apr 2026 10:59:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
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
Cc: "Link Mauve" <linkmauve@linkmauve.fr>
Message-Id: <b5e7c099-3a5a-44dc-bc7b-42429abe3aec@app.fastmail.com>
In-Reply-To: <20260424054742.45832-6-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BF14C45BD1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-59504-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid]

On Fri, Apr 24, 2026, at 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
>
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi=
3 when
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the ke=
rnel
> build on PPC32.

It looks like the problem is commit 9af8f2b469c0 ("drm/panic: Add a
u64 divide by 10 for arm32") describing this as an arm32 specific
issue rather than something common for any 32-bit architecture.

You can probably add a rust version of div_u64() and use that
there.

     Arnd

