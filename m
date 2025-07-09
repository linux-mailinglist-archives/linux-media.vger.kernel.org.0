Return-Path: <linux-media+bounces-37185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1B6AFE58E
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A23BE17500A
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9A528C84D;
	Wed,  9 Jul 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ec+K2jcf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IxkBpVS9"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD98288C13;
	Wed,  9 Jul 2025 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056394; cv=none; b=o358oewqhUZ48GEZviBF8TueDQSoglGJIkmzif3A6otIqHJpdGws9YjduXgHXi4wGxT8YI7ke6hEtnBQ4bXIZ1OhIdEWxfAlt3Ixh40H/ov2++Uv8xAqusSOG2N6wxkR56Q86IVw5SqF3chv/GUxyp54nBi5UP/IVfBdCIl0Pug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056394; c=relaxed/simple;
	bh=Pmbe7QLq8vgTRDqW0s0b1vIJt5mAOfFNSKOzHQNXwYA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r3YacUIa0v4BOONadMUEVksKsyGabPPDXkbRVkMMBgqmBT/rY42QoxwQETZZ4rq0UpbQ1ay834E5YLu8SHvooj2prw2t8lSLsfj58mO/BbRlK2fHdJnpIVuJ+WHdayGr5UmhRg0lKC2tfLMnRy82Wa+G3h7KXy42Opgk2fcJERE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ec+K2jcf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IxkBpVS9; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 0877B1D001AD;
	Wed,  9 Jul 2025 06:19:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 09 Jul 2025 06:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752056390;
	 x=1752142790; bh=Pmbe7QLq8vgTRDqW0s0b1vIJt5mAOfFNSKOzHQNXwYA=; b=
	Ec+K2jcfXVmgDA82W6cf5aVDalUaaFvL8imjnyYos/VzQQ7CHVhjP6IPMCtJlXXL
	ntkAFcGPKyVoVXvOFKJ/miofHFLdM3uImP96pzLKgFHwqPyvjxR8sMHjhTB66x/F
	ezwyLukxw22Ad0jN40UUFVFd5Cz0qTETQzJ8FpK98XBCbk9thpeEQbYHvu2jvqWC
	3fzxfvjsOVtb78L8WGXAPDwuQDBV6D/nMjJZUTs4oJVqpIsMIbt38X5NkVOZ5KDP
	UD/NJw8u78lFAm5JG57b7jfT/pT/SaIsj+udpOV8GgAOxlHgM0ciWu0WLvRp+FzT
	T1egJ48Ig2dv8Xmg/N4oYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752056390; x=
	1752142790; bh=Pmbe7QLq8vgTRDqW0s0b1vIJt5mAOfFNSKOzHQNXwYA=; b=I
	xkBpVS9gbXXrK/vL0l3eJKzKmSBGlxBP8Vl5QVtNdrCM2B1K4NEMuZr81H9a2F+8
	9L22W85jC82rqoycn53Hm7pJaUKyvpfE/R40kulrKY+zjW9/iNhJtY04DlGmkxjJ
	d5LjfwmctI8h4LaQsxuevi/uYxgNHT4c6I7sb2ZwAzOxcNmkopsMzi5sVNvpJ099
	aSOEsF04E63aNjbOOl33lpRJCywonnl/Jnv+SRz1QfMrslpQGGXzriR2Yc7ca5bz
	YOY13A/53KzB5TQpkTdmrXUsWsE55mYcBAP7Int2iiGiTv38/LuuXev0YYXeiNb3
	m9JTiX8SzNNJ0BKUG/Iug==
X-ME-Sender: <xms:RkJuaKY7wtAeFKbk1BZeXxNcnAVIgcG_MqTMFomRqWpIXiPjpHbmHA>
    <xme:RkJuaNalSJ14bVJATX95aoPOrS458wSMTvcqwq5ymKlEWHpeGY7-pqLn2RihDMK-l
    bC-e9nYbUkQAWklM5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtg
    homhdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghhgrmhesihguvggrshhonhgsohgr
    rhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehmvghhughirdgujhgrihhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RkJuaKzzNH8kU5-by0ASpsplKiPjFsOOzpKo3nEAydIF9x1qE8C5-w>
    <xmx:RkJuaO6LVn4iAhCYEKAD_8thVMEEQzrzCf_xDGGRT9KRcl2Ss7smGg>
    <xmx:RkJuaDw73ua7voLOgsEaC8ZAiCZmMMO90jAhWOKV-OxDBEuw7F-s3A>
    <xmx:RkJuaKc78miwZqPW30bcLYIV14UbWFU9-9nqPcX4M3RT0BlcEkWNqA>
    <xmx:RkJuaII9GFxZS02QQNlC6kIgrAkFtj7aLlRGv5kpyvH_M51pqqlELShV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 48A16700068; Wed,  9 Jul 2025 06:19:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc8565d759ea2a34a
Date: Wed, 09 Jul 2025 12:19:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mehdi Djait" <mehdi.djait@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,
 "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans de Goede" <hdegoede@redhat.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <d75bfbfe-29c0-4005-90ce-5bb8e193b932@app.fastmail.com>
In-Reply-To: <20250709101114.22185-1-mehdi.djait@linux.intel.com>
References: <20250709101114.22185-1-mehdi.djait@linux.intel.com>
Subject: Re: [PATCH V2] media: i2c: Kconfig: Ensure a dependency on COMMON_CLK for
 VIDEO_CAMERA_SENSOR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 9, 2025, at 12:11, Mehdi Djait wrote:
> Both ACPI and DT-based systems are required to obtain the external
> camera sensor clock using the new devm_v4l2_sensor_clk_get() helper
> function.
>
> Ensure a dependency on COMMON_CLK when config VIDEO_CAMERA_SENSOR is
> enabled.
>
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

