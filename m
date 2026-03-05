Return-Path: <linux-media+bounces-54666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKRhG5i5qWlEDAEAu9opvQ
	(envelope-from <linux-media+bounces-54666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 18:12:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE3215F03
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 18:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DDCC3030860
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 17:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB193E3D89;
	Thu,  5 Mar 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="P8WGtwp7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X4Rcymrp"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C93E51E4;
	Thu,  5 Mar 2026 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730630; cv=none; b=f5bPCI+vnuIRS3vitY5s3GnaHRFIfqVW51HYYlgfmSllFF+0pPKsyczAtE3glpvFXnVtwrnDBkrAwt0vanPkq47yQO4UyxybNXRp7jDuS1xvzBTqjWdjikaNkOt9K1z5u2jguLLdVOIcNJRnDknZu917Cmo/utwcrIuTN7GUwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730630; c=relaxed/simple;
	bh=iRupPu8NCBRBEV/8b0pmdYMoD/Br3+NKj2MsluaxQZQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MeMsPNFdw4qo2T4nSaY11HbioWj980wwbk/uf799JTDE+Zy68961DfBDUWFVMTlk7qxBRY1AHHhaL/v3av4abHMZfEaUSmB10fyVEC1rIrBbmpJh1DKOvUA0Lz7J7YZfE2uMuKxx1C0YsKdROzJ9r2RGLnErFZPMY3l0HPooaxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=P8WGtwp7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X4Rcymrp; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 630911400206;
	Thu,  5 Mar 2026 12:10:28 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 05 Mar 2026 12:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772730628;
	 x=1772817028; bh=2YKLoA2IsMyTZEip4KGxzGcQ7ltn5puWK4jv6MRs+MY=; b=
	P8WGtwp7/r9ecL8ojq0bCFXSAb2bhnspxmBcRm5Lc6wWdrOiGSpET36q4taVtN6e
	szAQqifYwuybpDdqTagrlAusetiB8SzWuckaIxuh7M/CEw6al2vwwQpB648np4xf
	wAf/TTl0pfqq7QbFrxsX/VM7YY7iuvjiZ9YrXZcga2nzVbWCzSKkiCRrQYqo9GbU
	A08fys5olDwWaIQxZiJoVOKktDPTsj1dHQ3YdwaBzMdiznyQ4YouWR7DPnziijWw
	H3QJldkZsWDI0TS8jgt/rUgAg5s10pvMbm8l2nc2/y7o5OauQBmrnyNHgaLuwUJe
	CXtVoumyPmSs2RFKqmpV+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772730628; x=
	1772817028; bh=2YKLoA2IsMyTZEip4KGxzGcQ7ltn5puWK4jv6MRs+MY=; b=X
	4Rcymrp9oHYxlfcXIC7+z/4IIn9T6NUKsS5CxxlKyN9L8omcwKRuF6y0E0g0rNav
	0lxN/SLlffca2W0F99Djyz6Bdx2vWevbKOIDrubzZ75tDuUXMlNTQRFgm66YuO8O
	WYyeps1v+5umVNyUIbNgo/N655+kJO83BkmtlY60HcrK1kacWamKGp1IU+4cO5Os
	dziOnMYaIsajTJPg0oJjTXHYsrLDUwAlzpRmI9dvQGCLpVfKbAZspvnVcsoNwMyl
	95jJ+VNFrpA0ksgNMEBouLFiMcNcP8G4oJ2ng83EMgGvuiZRugONBupl8kPKWrkG
	Wyv3VA4dN10GIx6pvhpTg==
X-ME-Sender: <xms:A7mpaYN9pitvwkGxHyqmSyxgRER8PgRRC3rI47vIgx2K6tFj9Db73g>
    <xme:A7mpaZz2-VQApGDRdpT-u83lBiPb0o0pf4aU0H-T0M1bZX_odwHNSiyve67OBxQ3p
    tsKDN7jB2rgva5Msgr02BTzM1-R27QMNCPjPq3XvDmZAE_H1-AWwII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeileegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepheelteetueehudelgeejhefgieeigfetvefgudduledthfegjeekleeuheefteeu
    necuffhomhgrihhnpehlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghr
    tghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghtlhgvvh
    drtggrshgrnhhovhgrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhhitgho
    lhgrshdrughufhhrvghsnhgvsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnh
    hitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphht
    thhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmoh
    hrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohephhhvvghrkhhuihhlodgtihhstghosehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgv
    hhgrsgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:A7mpaZw2A0swRreIUfNUbkJ-KM0TyDHXf5aF9ETg-pzrZVQVs-ge3w>
    <xmx:A7mpaSAEZxCAXlZMphEwNfHJ7Ld-ylDRCFhl5Edpsjfmdqy__vo3Kw>
    <xmx:A7mpaSChsGG1x8lH_xhwF7G2c1V2RWemoPGaPsqLiIIDR1kTrmCwgQ>
    <xmx:A7mpad7xkfTA3dpIDyfi5NRqeUtR1Q1My_ZvpEti-YKAR3VcYo4skg>
    <xmx:BLmpaU2-yg903Rc8Bnm0rbyb3LtfMggq61VMKVlCGmH54KUoOdEqYWl1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0DBA700065; Thu,  5 Mar 2026 12:10:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlPWkszDc-o7
Date: Thu, 05 Mar 2026 18:10:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Kees Cook" <kees@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <e907e900-073f-4aa6-b4fe-36b87e312f62@app.fastmail.com>
In-Reply-To: <1621b56864cb186f1e5433b73b56afc00aa83452.camel@collabora.com>
References: <20260305152644.791897-1-arnd@kernel.org>
 <1621b56864cb186f1e5433b73b56afc00aa83452.camel@collabora.com>
Subject: Re: [PATCH 1/2] [RESEND] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8BEE3215F03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-54666-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,messagingengine.com:dkim,arndb.de:dkim,arndb.de:email,app.fastmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026, at 17:37, Nicolas Dufresne wrote:
>
> Le jeudi 05 mars 2026 =C3=A0 16:26 +0100, Arnd Bergmann a =C3=A9crit=C2=
=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The rkvdec_pps had a large set of bitfields, all of which
>> as misaligned. This causes clang-21 and likely other versions to
>> produce absolutely awful object code and a warning about very
>> large stack usage, on targets without unaligned access:
>
> I'm a bit surprised you felt the need for resend. Perhaps you can help=
 us
> understand what made you think your patch wasn't being processed ?

I updated the second patch today after I found a corner case that
wasn't addressed by the first version. As I had sent both as a series
a month ago, and neither was in linux-next yet, it seemed more helpful
to send an updated series rather than replace only one of the two.

> My PR:
> https://patchwork.linuxtv.org/project/linux-media/patch/2074ba5a5d05e2=
39f432d176eb051105f7e692f9.camel@collabora.com/
>
> And Hans/Mauro did logistic on the #linux-maint IRC channel this morni=
ng. I
> believe I've marked all the relevant patches on patchwork our of "New"=
 state and
> you have my Rb. What else would help you ?

That's fine then, I did not mean to seem impatient. I assume
the original patches will be in linux-next then, and [v2 2/2]
will conflict. I'll let you review that one first, but can
send a rebased version if you think we should merge it on top.

      Arnd

