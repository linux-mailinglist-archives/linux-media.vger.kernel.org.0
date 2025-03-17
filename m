Return-Path: <linux-media+bounces-28363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD59A64E60
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 13:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09C027A4BA6
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6543C238169;
	Mon, 17 Mar 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UFHMKudI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nN/Dembt"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329C198A08;
	Mon, 17 Mar 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213769; cv=none; b=ZEbHQhsuV9vmD3MlDiAHhQmpCtI7wZpzRUHNXeHZCc1RyT/Xdf5dw4+jHwA+y//FJRxL7S9k4VhDN4mbav70vcKjulxiG+23GoYvN+pR/6GhFmlu4C3ifPRJNdkp1mMI9R3RqFmW4YT3DDIfmbavaDYhw/B99yo4tTYuMJKD4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213769; c=relaxed/simple;
	bh=qbpYp2IF2/zO18LSHebvXP1qzB+sbYp7X6zTXraFqFA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=I7pckTbG5qSwZknAnrNeb/h4GXtx+rgtTmCG0DTdi3WCcsHsta1q4GdNKd2G4ndguctbNFVYL3YsGXrwXNtjeb8bZVlYBMJ2S852hXQIxs4EbcW/4sgv5LDqtB+S668XLdhkn9w6rDVtxpbm0KgDEJe32waa+2yydon9G5n6/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UFHMKudI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nN/Dembt; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 8A611114015E;
	Mon, 17 Mar 2025 08:16:06 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 17 Mar 2025 08:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742213766;
	 x=1742300166; bh=7zbfZRDSjUREIaZm/zoU8HIsunTmGDJGKaYJ0MgX7WE=; b=
	UFHMKudIncskhcTAYPVVjW9h2ez0Af9DF6GPq6UpqwZ1dj7hJjYtbp115K7pQftR
	9eX811EZpg3v1z+jYuiv9GXYcznLTlpWjnwl/AzoByykm8KJcyucWKpCDILqTsVs
	J/IISj5X51sq2eDKUKy0f4C6dtf0kLZrvvj6VNFOl5x6fMzwlehdrtGOlLFqfzAF
	Ie3Uez3PGF0QpBF6fAl6iAtGgWimkSqx+XXpeVRBJNunKfUbUTZUrGC/AwMIyrzn
	wMPjjkVdfUOto36CgaAIewaXy/3pbiUPmXwWZ0thuDvSoH+hDstySEi4t4KHpd7o
	M7tpd0XyL6FqlGVMVtw2Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742213766; x=
	1742300166; bh=7zbfZRDSjUREIaZm/zoU8HIsunTmGDJGKaYJ0MgX7WE=; b=n
	N/Dembtr/a3BJth9bspmChYTMFOpkZtcpPHhaCj8VLy1761p2yaRKdDsGlXwkEVP
	vN/gS/uxC+UEZ1AyC/4nI6hXdQ0azxgw1NE8yDP7wUdcVal+FXMM1NGc81GWWDEE
	teuX2d1M9TGL49TAB2QyQxiwfbHsNcj1fMG1VpdTP/KKnKwW50bY5nPjxgNlivKK
	PTLT5zDN7Myh7RF5HLYcJRipCweJ27/uQzkoDm0WP+1cvrM2bg5JmohLLADrT03i
	lAAMIegY3NGU7gzMIw4fUEeeSjmCmlBilTUcAfyUzXrSeiwWBObpzV8v7fmh6Shm
	v5u905asuS88xrLb19D4Q==
X-ME-Sender: <xms:hhLYZ_Iom-niy58z5TaYua0YS3vf0S__JrcXnNO7s-lM3eYFYvMz8Q>
    <xme:hhLYZzL358AV-jCYTOTLSvhxJuTerYEksn5SMH-qFCgzhHPydWsewL2Lfdpve5mKn
    WjLSFFH0G6q0mJGsUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhisggrlhgurgestghhrhhomh
    hiuhhmrdhorhhgpdhrtghpthhtohepshhrohhsvghksehgohhoghhlvgdrtghomhdprhgt
    phhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegrlhhl
    rdhnlh
X-ME-Proxy: <xmx:hhLYZ3uEU8DCn6c-fHS5cvwgZ6E605LoeCh4OwmYqjK_OT7Ian_mNA>
    <xmx:hhLYZ4ZW3fwSFqmJTZMDXNJV31Z4kcy1FUIa8QVtddqn5COuRGzbBQ>
    <xmx:hhLYZ2b_xbk54WcWIpgnAY-rgEiUeluSWfWyKJQYL0vEQw8bej5abw>
    <xmx:hhLYZ8D-sWNNz-Uo88tKMNqTyGl_fHxhHz0zTUx7SlT3jrWnNfqIgQ>
    <xmx:hhLYZ7OuzH-pxfMd1mEiD42WIoDDpHM7TylgO7OKcYPU0rntQC6ebCGT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 094F92220072; Mon, 17 Mar 2025 08:16:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Mar 2025 13:15:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ricardo Ribalda" <ribalda@chromium.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Slawomir Rosek" <srosek@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <f2742c8b-0dac-495e-a072-3d136329f116@app.fastmail.com>
In-Reply-To: 
 <CANiDSCuqdy2UrhZ8_erFO4kjXwt_bvQgmrqmPZmrw4xaRwJBrA@mail.gmail.com>
References: <20250314213859.3543936-1-arnd@kernel.org>
 <CANiDSCuqdy2UrhZ8_erFO4kjXwt_bvQgmrqmPZmrw4xaRwJBrA@mail.gmail.com>
Subject: Re: [PATCH] media: vivid: fix FB dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025, at 13:08, Ricardo Ribalda wrote:
> Thanks for the patch!
>
> Just out of curiosity, how did you found this? make randconfig?
>

Yes, I do a lot of randconfig builds.

     Arnd

