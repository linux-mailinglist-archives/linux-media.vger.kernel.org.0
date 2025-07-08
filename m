Return-Path: <linux-media+bounces-37139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7ECAFD0F1
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B51F166E19
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE762E5409;
	Tue,  8 Jul 2025 16:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MInj6+0q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M+xlxHEG"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E1E2A1BA;
	Tue,  8 Jul 2025 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992117; cv=none; b=FLbqcVvL/iTC1OjvOqQDWupZ/LrIHhaVXCZgogDIcJYQG6D3z61wlpSrvYJv4yAqw9P9GWKhAE4z46ZVOtR7Y+X/iNhIfA0eglQxUPktM//nqs8XUURtv9iD4QdL2tGAH/hCZIBdswZlLOq16/tJlyWtP+ZN3kKLKXCpOsfXdC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992117; c=relaxed/simple;
	bh=w6wMl1xm8whz4FVlYpYyLCnOKc1n9j2q2icjjjCVQKc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=q+0ut44HKfqKd20gtg9VDpcR+uQ5rbIzhpu85BwXLWttOGa2yNnsoHEgnBsVUzz17dEYTWbHT1nL04Pti5rBxK58nfPrV2m6f61aBDZeT+g3UKgw7DSQx+T/ddMsh+2Tlw/AEqB7h7Pwv7m5EqQPPckIajJUDTiKKufGIhGYIBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MInj6+0q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M+xlxHEG; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 80612EC07CF;
	Tue,  8 Jul 2025 12:28:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 08 Jul 2025 12:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751992114;
	 x=1752078514; bh=yAMMwurFHCZ7tyH4Kbmxgi61UpDu7V0P44pjbcdyPVk=; b=
	MInj6+0qm2VL7fgWYXgUP91tJjHfRaZSvnN4blMHepfQ1m1AUb/eImVY11L/bob9
	dHmRm0x9a9aUSQTGSsRBVn56fzn6mqV2XBe6a/8bq8xp6+Gu7wa87El4JvT5Cfax
	uC1Od66oI7Vef/cz8iz15abeyjSkc//Ld8DFMNMiSpKSv1QrOf6FOkk4MXZ0+2x8
	RxbuuWQxwQksA/R2guQUz+QyoNf7RqEg6tvGhJmfEI15S0Clx4ZIsPrfcpfsYmTp
	T5/x5NGxrIvgGRDNrKtvG5CyenDPezmG0zFDJo1Ht/vz5Uvv14lj0QMrJkYJs5jF
	91Uu7NnavuRQl6kJ2c/FtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751992114; x=
	1752078514; bh=yAMMwurFHCZ7tyH4Kbmxgi61UpDu7V0P44pjbcdyPVk=; b=M
	+xlxHEGvzGSfjuN0uX5h8iCiS7tba+PH6DZgkiGauwWlMGvZgO91NLPs4XzJQbdS
	ZWBmVXrS43Pxt73d3I3hRzxPxZGIekWk+WoZ5wTlpMhCOKicEnsqumjbRAWzeeDl
	OgypS6duUt0iQu6tY8nCMh+0UvBEoa1SlGPGrbDXoDEOUeczLGDZzq4ZZ3PB4bkh
	cEt19VtP1YFlBo/VnZTD59iqIisP6t8XmbEjyQGS2z95t5UJpd5xJHXBmLW3vLHG
	5IqP+4xhYWIYzn1BuUU7gF8wCR0aRBrNOfyHfot+1KDW6SWB3+UOcuhoCoayQiYk
	JshFWeVyQH1tzt4YeYsVA==
X-ME-Sender: <xms:MUdtaJhB5E-ed-iIatglbbBVT2pf9cYKMWdS3Iod_W16pLuMKTt_YQ>
    <xme:MUdtaOCZNKfoQLelOKnGMZPnmEi6Mhy-XIK5_CC4JrLKsNZPcxikOdmzU-Y02UQdh
    GpnGwYW3oJk0h9tUEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheduiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:MUdtaA7MqVOw1heNx-wKigSwNSI9lINkuWNcoF4ZgVf9ydCjEq5moQ>
    <xmx:MUdtaKi51mS1TNKc2jWXk6hZ6vE1W7XzH2cMVxSTRmdRQ1qkl6hmPg>
    <xmx:MUdtaG7P_qdMcq7V0eGqICxClKHdnjgiuQYEDZFsIqYaCl_LNxbG3w>
    <xmx:MUdtaPFADuPYtdPCOqbNrE4qF_ck8VTu8777VTO_8Uj3n-Z84Yrv8w>
    <xmx:MkdtaHwy09m11MOGxm7fxd0EYyWwV6-KsGqmAj80k1LhFAIljpVTDw5t>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CF4FC700070; Tue,  8 Jul 2025 12:28:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfbee3c376bb009bb
Date: Tue, 08 Jul 2025 18:28:12 +0200
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
Message-Id: <04c7c949-d0ac-43c0-91cb-7445cb44a036@app.fastmail.com>
In-Reply-To: <20250708161637.227111-1-mehdi.djait@linux.intel.com>
References: <20250708161637.227111-1-mehdi.djait@linux.intel.com>
Subject: Re: [PATCH] media: i2c: Kconfig: Select COMMON_CLK for ACPI-based systems
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 8, 2025, at 18:16, Mehdi Djait wrote:
> ACPI-based systems are required to create and register a fixed rate clock
> using the new v4l2 helper devm_v4l2_sensor_clk_get() that uses the
> common clk framework.
>
> Ensure that COMMON_CLK is selected.
>
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

You should never 'select' another subsystem or a drvier from
an unrelated subsystem.

What you want here instead is 'depends on COMMON_CLK'.

      Arnd

