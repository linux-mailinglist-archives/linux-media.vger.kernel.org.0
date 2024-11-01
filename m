Return-Path: <linux-media+bounces-20676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE89B8DC2
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 368461C20B46
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC57A1586C8;
	Fri,  1 Nov 2024 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sqx/TmKk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RwalSVN0"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE7C154C17;
	Fri,  1 Nov 2024 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452981; cv=none; b=SF+SrqW2MkTxKNimkZbbg7mRP/ZFbVmu7Y3m033TNOkcdOyMPq3ZMcBZJKA9C/mKSCKgceEB8o6AEuOJmG4PVQA+KNMUNyg382E4MJ7QEk3EB0gEFVdjygrTS5ohLBCxWO1jcI63JAW4FBTad5pXbV8EXLO1NoyneyEP+cx2jRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452981; c=relaxed/simple;
	bh=MUiDuyJ+MlELg7lT9hPPazjnUfTgX6bjLE6DVpJ+qF4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Axd96EJUX38CPhA6aRT48m0WZiVPRv9xIclXbiKaLJPIxz0NxilyIvAts4/CE5Cszovto0zfT+NK0kT7f37dMDuBHUm82xgURr4fO8XW0z67JVUR61+14KlghOur+IO7uEO6MdpIwZ7O6CAftJgP8g/ySDV/crGepW+N57HOy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sqx/TmKk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RwalSVN0; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id E0FA611400C7;
	Fri,  1 Nov 2024 05:22:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 01 Nov 2024 05:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730452977;
	 x=1730539377; bh=/f+ob6/0cs0oAQjTndC8UAIk7DAav3CEmLAxLiR/ZgA=; b=
	sqx/TmKkrbFlbpIh2Er3egpdCCyhzsQAoBY21kEt9b/TWCscIH0VzLujadP6g7Lq
	81SUkJ8DCPAtAK4muYBOYg1sUgigAWR2oR8fxq7kw3qiS9C6t4UnRU187E103oSR
	BgRRP4gxrSyJwxAfs2VVG1z++vlBfkA6zbSPHifvbX8am6dQe91TeBQwA9GjDzhe
	4HHNyLC/f2u6nxlEhcwWLe8q2AH6PD4Ibyv1sfFydp5WvZbzKUlKSoyOCmcoDhkq
	tD4XdUwphm4Dytsz3vme812b0BIBifnELQPbxpsih30YChZgEyXmC1C4aB4eBAG0
	t+lcuQ6JqRtsHjvAFsKKtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730452977; x=
	1730539377; bh=/f+ob6/0cs0oAQjTndC8UAIk7DAav3CEmLAxLiR/ZgA=; b=R
	walSVN0B0tyKKv6K4DPnkzJmD0wHebmbjswUDltqAxO1jiNVsUhPnBEXnw1K9dTp
	4CjHMhtjyDmw7BVi/Kl9EuRpq+CL8KcDL5lbVGDtZfXSQ+3cba5UakEtSzaSsQBL
	+M78jRqvrv+90ycXWtzgFL7cm/EN0XqGgxNOjnRpAn8EIMUoREaVYgyN8RyQagvF
	QP0wT5cpESJX8BYzSlEIYS/iSvZ3T4WoVlX3awG9jHTgzBqMkzXBk8mABczuSAzO
	1qzuxrbk62IuQzeBP4r3JEtlghltfORUSqnclsBdHKiWBg7CqVteHI80DbYOSNQ6
	tSBNNZryIpBnKfwrcIMtg==
X-ME-Sender: <xms:8Z0kZ32hrZ15aXsK9-0uULTHRaEQJDONV7ovxYe2SBCH4x_hNuskhQ>
    <xme:8Z0kZ2EsNq9mC9QTLkE0fz4fi3FiLxNm8n-TJOeRjn7mR3YdWLwEgpl8hZKlnVdNp
    XP3GNbGtEpVfilCHAc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghnuggvrhhsrdhrohigvghllheslhhinhgrrhhordhorhhg
    pdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtg
    hpthhtohepnhgrrhgvshhhrdhkrghmsghojhhusehlihhnrghrohdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehlkhhfthdqthhrihgrghgvsehlihhsthhsrdhlihhnrghr
    ohdrohhrghdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:8Z0kZ35jvESavaTssiskGB6M21sPWi1QP_P6WX_TceMbd_X1m9yTpQ>
    <xmx:8Z0kZ838pMaEln6ii3f8okK2xXZbe6PbfsKIAgjCpKW2RAuwnnW36w>
    <xmx:8Z0kZ6GVn97Jf1N9k5rVxKCaY0WV5xXorVLoHVUyB5AYWlQTtrtUXw>
    <xmx:8Z0kZ9_3sznYY6gBTjpOCzlhYqcbDJCmzBoDA6wEg_8PvNSrM6r5-Q>
    <xmx:8Z0kZ4YnY3lvL39ec8boZoYcKxEdDyUS05Q1FCSiHJTSzMO3SHcMk-4T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6DB8E2220071; Fri,  1 Nov 2024 05:22:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 10:22:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>
Cc: "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "Linux Regressions" <regressions@lists.linux.dev>,
 lkft-triage@lists.linaro.org, "Anders Roxell" <anders.roxell@linaro.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Linux Media Mailing List" <linux-media@vger.kernel.org>
Message-Id: <e9971f03-e542-43ed-a8b5-8d79127f4693@app.fastmail.com>
In-Reply-To: <d3903c31-21ae-4ffe-9969-6faa7e430cb5@stanley.mountain>
References: 
 <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
 <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
 <d3903c31-21ae-4ffe-9969-6faa7e430cb5@stanley.mountain>
Subject: Re: next-20241028: gcc-8-defconfig : ERROR: modpost: "__aeabi_uldivmod"
 [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 31, 2024, at 12:27, Dan Carpenter wrote:
> Arnd, can you take a look at this?
>
> diff --git a/drivers/media/dvb-frontends/cxd2841er.c 
> b/drivers/media/dvb-frontends/cxd2841er.c
> index d925ca24183b..e3131f5c6708 100644
> --- a/drivers/media/dvb-frontends/cxd2841er.c
> +++ b/drivers/media/dvb-frontends/cxd2841er.c
> @@ -314,7 +314,7 @@ static u32 cxd2841er_calc_iffreq_xtal(enum 
> cxd2841er_xtal xtal, u32 ifhz)
>  	u64 tmp;
> 
>  	tmp = (u64) ifhz * 16777216;
> -	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
> +//	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
> 
>  	return (u32) tmp;
>  }

Not sure what is happening exactly, probably something where
__builtin_constant_p() is inconclusive. The patch below seems
to address it without impairing readability.

      Arnd

--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -311,12 +311,8 @@ static int cxd2841er_set_reg_bits(struct cxd2841er_priv *priv,
 
 static u32 cxd2841er_calc_iffreq_xtal(enum cxd2841er_xtal xtal, u32 ifhz)
 {
-       u64 tmp;
-
-       tmp = (u64) ifhz * 16777216;
-       do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
-
-       return (u32) tmp;
+       return div_u64(ifhz * 16777216ull,
+                       (xtal == SONY_XTAL_24000) ? 48000000 : 41000000);
 }
 
 static u32 cxd2841er_calc_iffreq(u32 ifhz)

