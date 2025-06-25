Return-Path: <linux-media+bounces-35874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D77AE8570
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8862817C6BB
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 14:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6757C263C91;
	Wed, 25 Jun 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="A7CUg6ry";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q8FzRIey"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD01547EE;
	Wed, 25 Jun 2025 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860072; cv=none; b=dmDoBvJArvSMMtO6OOmv9IKtdBsZDl/eRR9Rl+GauzinIhWVlX2SY1ajdwagoVYfWJinvi4TA4ZX3G29bOblX8OCTydXU7+US1Uf6ITzOC2Wjkwa9wX/bZ2hB8cuYpyAZcU4bi+Qjy8tWwG1gFBiIX3PDL7OSL9ay0EgWZN+1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860072; c=relaxed/simple;
	bh=aS9c5tLL5YG8hp1k8m/B7YKnlrJBd9F8wiXt1BcV83s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nH+y4gLQZW9JoMHJapzV6KUofdsXub/OP0xxt333S88e2sgOvkg1RludscIq0t2OIfQK7JPXY5PtjCnRyjIlub82GhkWs4jugOWN93yNzSrIMwAc6XauLhmMq0sswbCzKHbxjJC+sEFi0ReID7T6e8by4dqr1lGXJvUDqLIZsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=A7CUg6ry; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q8FzRIey; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A7576EC01DC;
	Wed, 25 Jun 2025 10:01:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 25 Jun 2025 10:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750860069;
	 x=1750946469; bh=ZMcPJ3ozkd+3BquaXmzs3MqrsXbGlPtCpBaTsQs67uQ=; b=
	A7CUg6ryJXdH3EIhej46ThrxQQOzq0ulu+23IAg+jXEj4DdZBJJejm0U6p5SHLfm
	mn9O8XWSE+iKy8tjegW1ITn2On+wdZokEpQYtPUzhLQ5Bp+sED85AhhxVVYKKu2c
	siiGFjtPIewv8CrnwQcS9SXB2La9EHZ9Lbee8KLXCdpKgSZg/E5syFfbM0D+6R3J
	x/iOlNVkdDhOfEdI6D18+VWdeEEt97UjZhNo+4PG4/0WD7T4MvgcB1Q9PHrdhLil
	sAE0ot0CYytZq0OeTcimpDGLsjL8NGpjjr8TV7IdBA4AINsgnQZpLflqiw62M6Xo
	Y9HyVQPM/EeWaAB8D/+Yyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750860069; x=
	1750946469; bh=ZMcPJ3ozkd+3BquaXmzs3MqrsXbGlPtCpBaTsQs67uQ=; b=Q
	8FzRIey4FNaf/hNoCz5lne7CrbDGgn1hXqItVc0g1PIrn6LXHDr7ym1NI80Xlo1E
	yl9/JEsBZ9Ec3JqtJj3oOaNq5/oNo4woavf7VavMC1nYQxQCqA2eYzpRWnuxDXZX
	aBmWwrvvmxR4adWZG4thBK35n9fya1XibG/3uTZsu/l47q+6Siolg1sFjIP+3DOQ
	Sy16IsJzTxBBAAqaZyvaCGZB0x2c8pLU2YlFnnl/qaJjZcrpFfB9c+68v12mGu//
	KqiyZKkLOWY0V+xMiBk+hgWvHtj3Xu6RqK2RjiX4LQuqOT99fJHhlEgax65ZOyiO
	/MNmXtCx9A61U8v+Ts0MA==
X-ME-Sender: <xms:JQFcaFAgfrHOsUFbsyESqkUo1aC5p_ut1w_qHh5yKG1SCxHH8mMhjg>
    <xme:JQFcaDi-cVXSId0TgrUMKjEPLPoU5yspcI9Ntx6q7mNUcCTybGmq6fo2D-8OzEn_9
    UwBDEX9qkpDo2lWzVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidr
    tgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinh
    hugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JQFcaAmmVHWHLbqVlfIpptd-Yu3La3fG-d4YyLk8o8lcJoIeV7DOsA>
    <xmx:JQFcaPwzZiWc-N4LrEBK6cueQYFDgEwIWEb2RduNnII2rB3QPIV5bA>
    <xmx:JQFcaKROzG-kuLyy3nBt8wEgQb0spQG8Zwu0phxNQAUfyvmF4cU0CQ>
    <xmx:JQFcaCZwu2CR-mnPWlUHc1JHIoOHL-5xyqpqJ3iWQzsnDTKGwN9vGg>
    <xmx:JQFcaAqpL5qqNed75Eu2dbnB-7Ox2HOtN50GvQeTHXbcTfgN1kMez7wS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B29C700063; Wed, 25 Jun 2025 10:01:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7036233562d286cd
Date: Wed, 25 Jun 2025 16:00:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: linux <linux@treblig.org>, "Lee Jones" <lee@kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, lgirdwood@gmail.com,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 tiwai@suse.com
Cc: linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <cf3f3522-a3c8-43db-baad-198b9498d18c@app.fastmail.com>
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>
References: <20250625133258.78133-1-linux@treblig.org>
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jun 25, 2025, at 15:32, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> I noticed that the wl1273 radio had an unused symbol, but then noticed
> it is on Arnd's unused driver list:
>   
> https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
>
> So, delete it.
> The components seem pretty separable, except for Kconfig dependencies.
>
> That lore URL is over 75 chars, which checkpatch warns about,
> suggestions welcome.

Acked-by: Arnd Bergmann <arnd@arndb.de>

For reference, the driver was added in 2010 with commit 383268a8e282
("[media] MFD: WL1273 FM Radio: MFD driver for the FM radio"). It
requires platform_data to be defined in a board file, but we never
had any such board files doing this upstream.

The chip is apparently the Bluetooth/Wifi combo chip on the Nokia N9
and others, and is supported for those subsystems by the wlcore
driver. Clearly nobody cared enough about FM radio functionality
for the past 15 years to add the missing bits.

The author was last active on the mailing list in 2012.

      Arnd

