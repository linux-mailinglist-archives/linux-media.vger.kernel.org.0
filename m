Return-Path: <linux-media+bounces-22506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6F9E14A4
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2C4282C3F
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 07:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AD21A4F2F;
	Tue,  3 Dec 2024 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DAbTSFLj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gyyHg26m"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED141BF37;
	Tue,  3 Dec 2024 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212376; cv=none; b=mErk+tLBWod05QJcIyrtRMj3rDNZmHPgfTyiVCGguabVFRuALvA2F1mifhM73YiTPJykjVJEXaSrqs7fJoKj3vy4qagrROFZ5CGtyxt0peMyo+6TNHL3S8heKGHYhXQiek5XnDXnFU7nLU50c2yEq+5tWr7oJGYYP5fCydt/PAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212376; c=relaxed/simple;
	bh=NpGJ3FYp0x/U61oEWQE/B8UhnMCs74sc/jIUD/ic0IA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=THpibp8ZDTkhiYqY2Bc/1MBr7WgqclCuhGpZfFInNmvTJ2jNz8wl2JbDf99Lv67hEYB12wR1GT3a/YMkAM2uYcrz+QbPGf+YtKjLxsWvtxLJQyP7ZA2QamdVnylTDHJGvTsVpPj+PopP/YpLPldgOLcu3F770y/oArs551vpYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DAbTSFLj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gyyHg26m; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id DDE0B138028D;
	Tue,  3 Dec 2024 02:52:53 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 03 Dec 2024 02:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733212373;
	 x=1733298773; bh=F3BqFrUqY/RcjXeMbNxrbNkBD3uFmqchTzbdweVKxKk=; b=
	DAbTSFLjRnjs2KGtrWGQVmrjp5CCqGxFUSz7FNigYSoIv9kf9VVmtn78KLYRhosR
	9a5kGx/8sfuijV1tMFJeV3UsmPhBjO+azHYdsfuXoA8Vf4evC2wRPjwTdVnGgHXe
	B4Bp807AU0gNspXSmET1Gy6eBUyrbQCM06HduXwHUSME/GPTtY/Wo6q1VvsoNvpJ
	61oJcJzlE/bQg/XPC8OloEO8tuG8+skLO/m01OYQ3Z8rBPYfCdQwfPgnWqrS++EZ
	IvVWuqSgOzm2ZI3BH/0dWvIwYogz+2ciT5olfQk0S3VtOptZiQsEfoi9+k21ceUL
	oYSnTpMps7gmbahSViZWDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733212373; x=
	1733298773; bh=F3BqFrUqY/RcjXeMbNxrbNkBD3uFmqchTzbdweVKxKk=; b=g
	yyHg26m4OiWVrJezHOfZnbThrvtieYO3tdLlYSMOSWF0ellB35CKXCTavd4KmOyr
	c1JXwBjGmS1B66YbI+lO4ROHFbiEvtK3745efq5d/15xz0Mi04sx1PSnhwu4E2Dr
	nmtEacccv7vuzLmNlvQjx9+6Y/j+62WLUrQnKhN25irgRdab2iyKM4rCj/OLjyO0
	8zlgxy1If0HYOwwuiPtPhOnkmeOtrbJRdt7wDysZS7/BMJ/mgrNehJqTLPcmCD56
	UOKaGTdYtbNlKiq9stw1WLl7WCHh+vxhcKS83l8J2m2bwZnkfw3XDRRLi8AkMM3y
	vNF4ZIIUlWUldazVAQvAg==
X-ME-Sender: <xms:1bhOZyCGx4FdHoK5fj4WRUGF2L5f82ElMJdKm2QqcHetYU5sWJDj9w>
    <xme:1bhOZ8j36jEL0eRIzpgdlUYNnA8YvoWHUHM6pv7Lp_illDip_Mg6zc6i-Rnz5zQZu
    wFXDVpAeBWOI3aazCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedugdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgvnhhsohhnghgpvddttddtseduke
    elrdgtnhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohephhhvvghrkhhuihhlqdgtihhstghoseigshegrghllhdrnhhl
X-ME-Proxy: <xmx:1bhOZ1mIaS9vwPplJK5-_N2sQsqkJ-DnoIqGWSVNUxur7Mhgbz9poA>
    <xmx:1bhOZwxwXiXzBuglN1HTpX5A4rWQhZPzBbg65A79M2cc_kxn05GLyQ>
    <xmx:1bhOZ3RBNLFQ6oN2Jg8_Bol5X23_omtXaD9O9aXLGp6ZrtfrvspWFA>
    <xmx:1bhOZ7ay5NVwK1rAUS0Fp3OFAAMqWVzv39fHx3szf_ho11CSSQJJMg>
    <xmx:1bhOZ1PYdfWr5c9TL7j2WviyR4EZ4EGRLOA31h3IgZOdiGD7LHIr8I4W>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 402EC2220072; Tue,  3 Dec 2024 02:52:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 08:52:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Song Chen" <chensong_2000@189.cn>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Message-Id: <070175a7-1bea-4dbb-8b5b-9edee06fec79@app.fastmail.com>
In-Reply-To: <f552e0f5-6350-416f-89e5-e1a0e6aa2886@189.cn>
References: <20241203072742.191787-1-chensong_2000@189.cn>
 <9489561e-bc41-481d-b542-07fed1161a03@app.fastmail.com>
 <f552e0f5-6350-416f-89e5-e1a0e6aa2886@189.cn>
Subject: Re: [PATCH] drivers/media/pci/sta2x11: replace legacy GPIO APIs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 3, 2024, at 08:48, Song Chen wrote:
> ok, then remove it.
>
> what about drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c,
> it has the same problem, are you going to remove it as well?

No, that one is likely to stay around for a while. I think it
was actually removed before and brought back because there are
users. That one is just the on-chip component on certain Atom
SoCs.

The sta2x11 platform was never that widely used and I think might
have not been completely upstreamed.

      Arnd

