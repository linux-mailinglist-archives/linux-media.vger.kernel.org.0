Return-Path: <linux-media+bounces-15413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E89793EE5C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D655C28242C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D986785C5E;
	Mon, 29 Jul 2024 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TMQkV8Ag";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YADfwGZH"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E906F2F8;
	Mon, 29 Jul 2024 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722237887; cv=none; b=D7hlb/ElWK9u8R5i7yxnrJaT8FK4gItdQ7w9Y8LFVMMmcQTjPLRNx5geYvtxtIZ9zBy+ELc0U/v6BU4Afjg8GZmJTO/2hq5b8wB06+sRjJcXq4xZpaMKV+1/tMJ1nBLDswbnbhgb/SfkX4HPQMzfS7i1syRBL9Y5L6KOX/+ra6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722237887; c=relaxed/simple;
	bh=WoGGOCw7xWleVYZzOoaqWgZlO4EDOO1kJDz368kdDAs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TF/gd3T8fy0RksviN5zhEIbcU2xCFWcjxgVkRZDiRr23XDQXZ1umkPMxmf2GMjKCnJ2/0+qRqopyBhiatYFgk+gTc9rYer8diahCK/4+eW6wYQsZ0E8ZAZAsiCPcYq5O3VMvVvdyT8OMIKnh4OXXL7Jkfl1LOukwZy49weuytTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TMQkV8Ag; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YADfwGZH; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B1BCA1140148;
	Mon, 29 Jul 2024 03:24:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 29 Jul 2024 03:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1722237884; x=1722324284; bh=Ofuu1TCntz
	fikhbeovXRTmmMPX5HR+XZ//nxfXttXOg=; b=TMQkV8AgbkCTaSSndsBfwEHjd2
	1Okrt418o6IVoTD1oWGhAB5di0lzIpmCPjjriYIen6l9+rEPx7S6QYRkTpbSL1hU
	Tchi0PayPrbH79cBjWr4gm/UejTNrRGw4M6vaTIUOZn5A2iKBpxzmT57/gsSDM4Q
	NBwQoG2Hx+vD1tQixbU51kwIDCzrBXXMxrdeqIqbsd6MjXzWM7kBpo/ft361Xz9I
	wyCVMzdjoCKyScBWRbIo5IekOI08G7b4cNfxXhb4Uk39ECV6QeI3dA8IkA7JPxn3
	paqNjjGroFhBM5ijupkPj++ZAjEgg+MzKGsgtZE2lR8+Hn1ol6X/1Szy9tKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722237884; x=1722324284; bh=Ofuu1TCntzfikhbeovXRTmmMPX5H
	R+XZ//nxfXttXOg=; b=YADfwGZHeuiNeO1oDXpN21Eh06KGjs3tVzxMuBbJYqlj
	ZDRB2ooI8phA5m50r9T2j9QxQiRPNxExmSkDzrmt5uqRxgox+GiScOnrVnc4/oIv
	n3S6jrwHd7OAoaDn+QFR9x3YfWbcyQAHhuNZ2Gfzc7/srI2hpUAOaVVhkqx5Xh4J
	+1JZFHMeZwHYywXVZAT3WYX3/4M08u2cDkFRpFMIGQm0U2gKch5EPcCFlOwwF1z8
	vii5+tm7b3fEhMVdjYzObsp0nb4rw/43ZAPk3+4MF7SNUFa5WpKrKUjy0q6w7JcM
	gbtVYyQQd9LRXQED1FyWXRI96+Rtrfq7n2yze3Dd7A==
X-ME-Sender: <xms:vEOnZuhn6FBbdu0yxdGWslKPGUWOSg1jU81sGjJWEsbla8Vh9papsw>
    <xme:vEOnZvDJJIIChZJWueAXVSXKfj-BuEgVTgnbqWp_yAZRrCpkv51F821HgSv4H0H0I
    L5E47-k_nopgQOVbAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjedugdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:vEOnZmHzt7eP4m9B5WLI-6JU84WWYUpGlPVUeqGlny6mEXUePun-6A>
    <xmx:vEOnZnQySz4xiAZTKIv0ciXtoAzv6UbChX5TjAT3qQIEG_SYVJGr4g>
    <xmx:vEOnZrx3jGwdWIAR7a8dmr_BjF9Eqz3pWsIw3xWkUsFnhvTcbHxQzQ>
    <xmx:vEOnZl5_mFXXOLxlKa1f3r48UHH9hE1veFhT7OwrmTHhEgEUOnvHMA>
    <xmx:vEOnZil2PvUhs1M5Bw2qK_0u3M00_InZ4n-l_aCAOAWmvwktR1Za__6P>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2967AB6008D; Mon, 29 Jul 2024 03:24:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c05a72dd-1821-43ba-b3b4-caa9334e4016@app.fastmail.com>
In-Reply-To: <Zqc-tY7LPLdEbZ-9@kekkonen.localdomain>
References: <20240719095403.3607027-1-arnd@kernel.org>
 <Zqc-tY7LPLdEbZ-9@kekkonen.localdomain>
Date: Mon, 29 Jul 2024 09:24:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bingbu Cao" <bingbu.cao@intel.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
 "Andreas Helbech Kleist" <andreaskleist@gmail.com>,
 "Tianshu Qiu" <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: fix ipu6 Kconfig dependencies
Content-Type: text/plain

On Mon, Jul 29, 2024, at 09:03, Sakari Ailus wrote:
>> To make it consistent with the other IPU drivers as well as avoid this warning,
>> change the 'select' into 'depends on'.
>
> Thanks for the patch. I'm not sure how I managed to miss the IPU6 driver...

The driver was only adding in 6.10, so your patch was correct
at the time.

> I think we also need, besides IPU_BRIDGE, || !IPU_BRIDGE, as the IPU_BRIDGE
> has additional dependencies (I2C) compared to VIDEO_INTEL_IPU6. I'll add
> that while applying. Please let me know if you have concerns.

Makes sense, yes. I went with a hard dependency since that stays
close to the current version with the select. I tried build-testing
IPU6 now with IPU_BRIDGE=n and I2C=n/I2C=m, which works fine.

However, the testing showed that IPU6 also missed a 'select AUXILIARY_BUS',
which I had not found in randconfig testing because that usually gets
selected by one of is other 30 users.

Since you are changing my patch already, maybe you can also add
that at the same time. Thanks,

     Arnd

