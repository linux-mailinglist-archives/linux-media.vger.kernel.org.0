Return-Path: <linux-media+bounces-52026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNzGNduwgGn6AQMAu9opvQ
	(envelope-from <linux-media+bounces-52026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:12:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188ECD30F
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C739F3006202
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 14:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558AA36A03D;
	Mon,  2 Feb 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BdKTyM9F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N/1rYOKe"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17D19DFAB;
	Mon,  2 Feb 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041378; cv=none; b=i+IBQYUtwbdKYZ6BBdOnCOZgP2y5sHLg3ol1M9vtIc9Btu01+qTgoEdGfbNjT54P4/per1S43idwUp/tlsVkwUwBnNx+azXYt5ztBlFDPxWabiuUPNkPhADf2mWVnQPAW44Vmb3U8IJDlG0hu0NmSntTjmbapH9mCTFkYZGKVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041378; c=relaxed/simple;
	bh=Nrbev6MrXTTOMZ6WHWCANIm+ZOJm9clFto/GtCIIZmE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Mg0JcfYrVHhFD9ASKpZFE2RrCJdVOYYchWCB+B1kZx+MKJb+ThCxcfxWlo8wBWcs0dal9qarhLNE/lZE8rBt3VrtZFDSBK9ZlXmV/7dHHSiWrKMYHfkIKxZr+e60jb5e3RiH6xxY/3GEK3OeqU/KRNLqyJgb8w1RHkta0d5S99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BdKTyM9F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N/1rYOKe; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 10F171D000A0;
	Mon,  2 Feb 2026 09:09:34 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 09:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770041374;
	 x=1770127774; bh=RBoismynB60LLwwoMkedKjwF2LAh/OXyt9rYS+d1H6U=; b=
	BdKTyM9FOy3kpBMxH25ZRVPtJYe4n7zOgFX02Ew7DVrdTjZa7gZMuk/6T3fzAcvr
	Mq18oV0QO2yKpmXSUJE0m9d8Wy9I+WVQpkMvmPozdkbX4/SBpZ/+E5NdhcPXzvmQ
	cjDUd7CCzmVk0xxxBIq3JGv3Rw1rp7bJJ/HYq8D7qzpNK1UpVN3Qr1QQmgee1kcT
	LZ1kbgyDBHzkyjm7I+gnkukAlDSR/jUJE5vJCOMvGEH6CufTpa6L0jIUGbwW2Ymf
	sat40+3mQz9RuZLauIpnB1wFZ6HtHCFGP0zqJ+S4FfaSEYZDdidT2wIbzbuccTcT
	bh9N26PmNhrwi2McIECKsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770041374; x=
	1770127774; bh=RBoismynB60LLwwoMkedKjwF2LAh/OXyt9rYS+d1H6U=; b=N
	/1rYOKepF09/IuoqxfYRV3dV/zC/5jA8CZYFmhF90XiFmPvg9TTP7fpFux4suFuR
	FPMlE5wwchXnm+DyJkmYPJJtCFEbTKx2jW8S1Jq9rtQd8owLPVBAS9kR9DcqDcYh
	b5jG4nvCzl/kOmrcbnCLMOF39oBtkcWji0H659zogoWxiZ59pmewfoB7NMOmG25/
	1No6XmORBf6ZG/kTbvSuVrDkthHaralWhmxv/RIJ7lPEK7G9n66CEeGgl0zKhNA+
	rSJhlqWOAWP7TS4UmsXB1BnmWjLrJU7FaoktaL6d+a3/NWNxdQOvWdG5VYi9qVDc
	lEvFT57Lm+YFItQrfVESg==
X-ME-Sender: <xms:HrCAaY3mUCjnPG_gHmmxZhkHjJefUm729qdIwPOtpgt8mnN3ppkcZA>
    <xme:HrCAad6rH4Urj-UNeT4hEclXyd9XpPs4Zvww-XTPjKEJtAwzla7KtMbx8uD8Hc8im
    vXwsthOsrVKh-rPwMdt10NZj7fBDSoA41mGCsNgCCj7zLN25Kr6AUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepteekteeuudegheejjefhleehheehudekuefggeetkeevueeghfevgeduteevtefg
    necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
    nhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvg
    htlhgvvhdrtggrshgrnhhovhgrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohep
    nhhitgholhgrshdrughufhhrvghsnhgvsegtohhllhgrsghorhgrrdgtohhmpdhrtghpth
    htohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlodgtihhstghosehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HrCAabVKYPCDd5wTV9GUcv1BQnYI01S0aSMcc4qKaaZ9Nep53LLEfQ>
    <xmx:HrCAaf42fF5ngcPG-xsg2abAHd-JD5n_2EKb8aFgrCvUi8FzEnplzA>
    <xmx:HrCAaZBAaYTs6mI4ctuT-Z5YHvkgT-PjThRjSgck4AeELCkPdivpaA>
    <xmx:HrCAaTec1p7Kxiwf_aEoxbcZmPezFrnygnncZvSBZ-cc_KzW-j8MUg>
    <xmx:HrCAaVhiSYwd7RIMWurMrNCzNwNcpKuIlN8tGfl_mRnUodmMGmQvzI81>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F359700065; Mon,  2 Feb 2026 09:09:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ad03WE3-YZeR
Date: Mon, 02 Feb 2026 15:09:14 +0100
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
Message-Id: <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
In-Reply-To: <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
 <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-52026-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	SURBL_MULTI_FAIL(0.00)[arndb.de:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:email,arndb.de:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 3188ECD30F
X-Rspamd-Action: no action

On Mon, Feb 2, 2026, at 14:42, Nicolas Dufresne wrote:
> Le lundi 02 f=C3=A9vrier 2026 =C3=A0 10:47 +0100, Arnd Bergmann a =C3=A9=
crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The rkvdec_pps had a large set of bitfields, all of which
>> as misaligned. This causes clang-21 and likely other versions to
>> produce absolutely awful object code and a warning about very
>> large stack usage, on targets without unaligned access:
>>=20
>> drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: st=
ack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werro=
r,-Wframe-larger-than]
>
> We had already addressed and validated that on clang-21, which indicat=
es me that
> we likely are missing an architecture (or a config) in our CI. Can you=
 document
> which architecture, configuration and flags was affected so we can add=
 it on our
> side ?
>
> Our media pipeline before sending to Linus and the clang builds trace =
are in the
> following link, in case it matters.
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/pipeline=
s/1588731
> https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/916=
04655

The configuration that hit this for me was an ARMv7-M NOMMU build. I'm
doing 'randconfig' builds here, so I inevitably hit some corner cases
that all deterministic CI systems miss. I don't think that you should
add ARMv7-M here, since that would take up useful build resources
from something more important. There are no drviers/media/ actual
users on ARMv7-M, and next time it is going to be something else.

>> Part of the problem here is how all the bitfield accesses are
>> inlined into a function that already has large structures on
>> the stack.
>
> Another observation is that you had to enable ASAN to make it miss-beh=
ave on for
> loop unrolling (with complex bitfield writes).  All I've obtained by v=
isiting
> the Link: is that its armv7-a architecture.

Right, this randconfig build likely got closer to the warning
limit because of the inherent overhead in KASAN, but the problem
with the unaligned bitfields was something that I could later
reproduce without KASAN, on ARMv5 and MIPS32r2.

This is something we should fix in clang.
=20
>> Mark set_field_order_cnt() as noinline_for_stack, and split out
>> the following accesses in assemble_hw_pps() into another noinline
>> function, both of which now using around 800 bytes of stack in the
>> same configuration.
>>=20
>> There is clearly still something wrong with clang here, but
>> splitting it into multiple functions reduces the risk of stack
>> overflow.
>
> We've tried really hard to avoid this noninline_for_stack just because=
 compilers
> are buggy. I'll have a look again in case I find some ideas, but meanw=
hile, with
> failing architecture in the commit message:
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thanks!

     Arnd

