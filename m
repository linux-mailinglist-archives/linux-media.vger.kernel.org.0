Return-Path: <linux-media+bounces-52044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BP4F53LgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:06:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D967FCEABB
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54D95305E75E
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958EF37AA9F;
	Mon,  2 Feb 2026 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="orEsDRtU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Um6RrgXR"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE94BA21;
	Mon,  2 Feb 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047970; cv=none; b=dmMW3+asDyCIptjvR4477bq7Gf8ndG3EOSCwZgemLMn85vaaoxIGRg2OzNBuNLZ16ACP3SOFCX2xjA5Uhg0wN9pYo8dJSF+5Xc90Fn9jL1vKgy8Y3UcMzvJSnujFnddTIGUc4MbuXm/TSYEGDMRi7MhQqhy6GnSX9hJm6+NhHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047970; c=relaxed/simple;
	bh=Esc0emZ5Gqh4PnStMKnlzE58d8eJKz/1CwAPqv/F71o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sDLlUJXMQ40VX18mPPc1UgDk+QSQ3PhFHEZVjPLgXC+XdcCHZa6MX8ixIq2S+A7zaNZDXSMnTaeTRGes7eIkC/JkmFcMvf21coeBwTNslufOf1oPfexLSLqKPooFiKNhdBhTnL73sg192sUSlhYgWM3/8mllyAa+Xet3K42vYiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=orEsDRtU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Um6RrgXR; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7E5457A0068;
	Mon,  2 Feb 2026 10:59:27 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770047967;
	 x=1770134367; bh=CFuW6+SYNh7gkCorL0UhMyQbcABqAcuxQVYw4LykYQU=; b=
	orEsDRtU1gDGHSbdC5hdMI8RLoa1hDSnwJ594ntuXcpHjbfSFbvTWWiGYsP7SOW2
	1xJFklUbN9F1reQLTNpRX8WVvy5EOSIqatqlsZ0jbs6TDMB1P7gbwy3+GU7ZSgCH
	bwGcaCDcoChT8wVHuDBBF+RnqKFguVHScgKzuyEgsuAZ3jUfqeTAX366/q85JdoO
	od0CvrJBgLy1TRsBk2Ez2i7csMmBE6iVpiSjeNJvDh7jhleLSpLZxYNnGnfzqvnJ
	KsAdu3NdMoDCYbGaaR23nno1dxDEnaKzbclTuqO5bPKxh5bgtZOM36omeYQLAsfa
	A0cwDZaVYyZSVIWb4lMecg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770047967; x=
	1770134367; bh=CFuW6+SYNh7gkCorL0UhMyQbcABqAcuxQVYw4LykYQU=; b=U
	m6RrgXROEiISQIivZw8LODtYS7lSVOO4jz/w5k2cgunNYxvrORvxkfVX1/Pa9pwV
	DDGtEkDuiT6IY3BnprS0TZcSMHwYl1TCml59W1vwNc16zJxgx+yIjpElQ2qIBNhM
	tmrT3wnQ6Wi0ERg75mY8cWP7YxD4lNlcnDxMWfxk5B6Sp398xPpyqWkYWbBvqPuF
	eg4V8xm7iqhbtjuyD7XUNybNynv+hKXV60sff0Rgw2uVIjtUIMnOMvLT6+4Nw4QE
	zRFuxMgW5V0Czz7f7uER7YrXgWHoaNvxjNFNtOsrt3hKMM96YMFL6WL6ip855KZi
	6YtsjV94hz8TCjkrrzikw==
X-ME-Sender: <xms:3smAaVsA-DXhM0iN7KEj0HUttcdIp49754Nlk3PB_jXz83lQ6uCXnQ>
    <xme:3smAaZS8XOQmdYSdzrV7ZvToN3NJfONYprIUhw_P4aMKOlu2JS3YADOO-k3hyE594
    bvdcVtQpsStjb4R2bu1VQ-o8slAtHRkGLteyJ1xWpHrVLBxqIEbmsid>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeguvghtlhgvvhdrtggrshgrnhhovhgrsegtohhllhgrsghorhgrrd
    gtohhmpdhrtghpthhtohepnhhitgholhgrshdrughufhhrvghsnhgvsegtohhllhgrsgho
    rhgrrdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlh
    esghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtth
    hopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlodgt
    ihhstghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:38mAadPIQbkXVjhXUP6FVvG4qEX1nPzoObNfxbzLSyO6ZtoP8qn6hQ>
    <xmx:38mAacTddcWAcNjiYKqE7C8scRY_xtifCm_6kW6212CPazmRqIFmtA>
    <xmx:38mAad4mExsk0iZ-3UNId6lpI-EVjYRdfv0Uyu8ViW3b2XNE0I7qng>
    <xmx:38mAaW2__12zEA63PN0Lk2eLwD0b3oEdC95Tm2xhB1dXNEHSbwJ-tA>
    <xmx:38mAaV4weXH7dTtfTqrQZdBXEgbLv2B6P6WsCwSk36Z0IwmLu_jeYjcJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DE73E700065; Mon,  2 Feb 2026 10:59:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ad03WE3-YZeR
Date: Mon, 02 Feb 2026 16:59:05 +0100
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
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
In-Reply-To: <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
 <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
 <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
 <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-52044-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[godbolt.org:url,arndb.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,app.fastmail.com:mid,messagingengine.com:dkim]
X-Rspamd-Queue-Id: D967FCEABB
X-Rspamd-Action: no action

On Mon, Feb 2, 2026, at 16:12, Nicolas Dufresne wrote:
> Le lundi 02 f=C3=A9vrier 2026 =C3=A0 15:09 +0100, Arnd Bergmann a =C3=A9=
crit=C2=A0:
>> On Mon, Feb 2, 2026, at 14:42, Nicolas Dufresne wrote:

>> Right, this randconfig build likely got closer to the warning
>> limit because of the inherent overhead in KASAN, but the problem
>> with the unaligned bitfields was something that I could later
>> reproduce without KASAN, on ARMv5 and MIPS32r2.
>>=20
>> This is something we should fix in clang.
>
> All fair comments. I plan to take this into fixes (no changes needed),=
 hopefully
> for rc-2.
>
> Performance wise, this code is to replace read/mask/write into hardware
> registers which was significantly slower for this amount of registers =
(~200
> 32bit integers) and this type of IP (its not sram). This is run once p=
er frame.
> In practice, if we hand code the read/mask/write, the performance shou=
ld
> eventually converge to using bitfield and letting the compiler do this=
 masking,
> I was being optimistic on how the compiler would behave. If performanc=
e of that
> is truly a problem, we can always just prepare the ram register ahead =
of the
> operation queue (instead of doing it in the executor).

I think there are multiple things going on here, some of which are
more relevant than others:

 - The problem I'm addressing with my patch is purely a clang issue
   for CPU architectures with high register pressure when assembling
   the structure in memory. As a first-order approximation, you can
   see the lines in the output being 12.000 with clang, but only
   600 with gcc in the godbolt.org output. The gcc version isn't that
   great either, but it is orders of magnitude fewer instructions.

-  MMIO reads are clearly a performance killer, so assembling the
   structure in memory and using memcpy_toio() to access the
   registers as you appear to  be doing is the right idea.

 - using bitfields for hardware structures is non-portable. In
   particular, the order of the fields within a word depends on
   byteorder (CONFIG_CPU_BIG_ENDIAN), and the alignment depends
   on the architecture, e.g. 'struct { u32 a:16: u32 b: 32; u32 c:16};
   has the second member cross a u32 boundary, which leads to
   padding between a and b, as well as after c on some architectures
   but not others. I would always recommend splitting up bitfields
   on word boundaries and adding explicit padding where necessary.

 - Since most of the fields are exactly 6 bits offset from a word
   boundary, you can try assembling all the  *_field_order_cnt*
   fields in an array first that has all the bits in the correct
   order, but then shift the entire array six bits.

      Arnd

