Return-Path: <linux-media+bounces-23822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A519F819B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70B5416F6F7
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109421A705C;
	Thu, 19 Dec 2024 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lheJY7d0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o+uzEG3i"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25519DFA5;
	Thu, 19 Dec 2024 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628482; cv=none; b=YvkjfMZfb6ogA9Or5M6/RcIZ+1xPpMZ17Xsh78YcnG9HIrWUaDKf4mRFKWjsZSfYJANJZU4eD2xVjnRHIxqT/J2R05B8W+M0iXULl27bV4g3n118HdHpphn0iiwUVzgV36yLvQdmZTnTDSReZDQmhU0Zt31Foh1bXilx3yvjKfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628482; c=relaxed/simple;
	bh=Xg1C2iJ4K5oZh9M/EIDIU50ffNdbmFoAr94V3xtyUvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j54i8mJnPq6/f3n3yGXEmvf6BRagDw9Ckb3qc4OJFelXfIWz2W/JSk4vtYTXWvegS9B3X3Z9txQUdXLpulwx8YnaaTitpLTAewZDzzTt3Xxjg+bdXEegjbblZ4Zp6/F1NlIUWv87xHxmoyaHjXMoikLv/pN8Jz+heQPkkVYz0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lheJY7d0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o+uzEG3i; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C398325400C9;
	Thu, 19 Dec 2024 12:14:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 19 Dec 2024 12:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734628479;
	 x=1734714879; bh=aIyekHhCawgtcmQatCUbCPUrM/1cHIrTjIbSKG+/RAk=; b=
	lheJY7d0smDVnxj1rta8/JEnetVM4Wf0T4lgJN5M8yq8o7l2o6hGPCcu//djIQmY
	qymdpwlkRWmkuqLhRnjWqYrpxQXD3YWpcNj1zTa2QzNL4Znaj3BN0Vp0vWgBH/Wy
	i7l4V6UM1KmwjU/rmBSCVJ+cRkFhlqG0nVrEBotU316oIfrzJsFMQOnhmJM11rT4
	jLKZQa57ppzKIqJJ0vjVdAb/4RefM2x+CekwAYcnpueARCSdNgvcyFghw7zM6Gp6
	iQy/w1cE4MKhISjP+auasI8T+vJRTcqVTSyBzkqhCGaUImxldKWucikpVKeUU3k/
	r6OGx5AKxp3mC+YoCYcWhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734628479; x=
	1734714879; bh=aIyekHhCawgtcmQatCUbCPUrM/1cHIrTjIbSKG+/RAk=; b=o
	+uzEG3iciBD6imlhaiK8qiCEEhe4iJzD+8AWbIIZ2CO37GgvC//tJIlDOBvDFRrw
	11+thtJ2WO5qvdVA/bdyBomb63qa9TzAbYeEdN8qRK239epXEELe5rZGT/a604OJ
	qZCENaEkOgtk4c64fpCED/H3jNRN7OXQJQp8QmqLsAYzPgF2yj5n6LbNUmf6yFXS
	Tyw2t4owColZgdcct9K5IUCNA73euuO7sLUTEV4vn1E3tRIUWfWa6UBvDE4kAnlC
	eWEUsnkcRf71/9kCm30+O4kjchYTVG64LE0bojpJul41RI0kWAaOTNT8UijlXwMd
	v8WhcRwxvkswBsCfzhfZw==
X-ME-Sender: <xms:f1RkZ8H_78j5GhVtAdagE52UUJyfxE0iXCR1VmhpOXEeay0H9WjA5Q>
    <xme:f1RkZ1Vn2ZlT5nkVko29Y90x91NWSCql-5XhZXxZw3jVbBowYQqny1ucsoxaaHR3M
    RWn1WFamYVuzjs1ETE>
X-ME-Received: <xmr:f1RkZ2K1I8Q1FbCD9NclFKwCzNI4VIqsD3Pw3zq4xqQpLGc7YRCw8RoZKNWpKVPbPiZapbujT41-U9Qr7C9K6R1cLamRFCW1Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedtgfeu
    gfdtfedvkeffvdevheeuteffvefgvedvieduueegheetgffhvdfhtdeggfenucffohhmrg
    hinheprghnrghlohhgrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtg
    hhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhgruhhrvghnthhiuhdrphgrlhgtuhesohhsshdrnhigphdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhhes
    lhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvg
    guihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshht
    rghgihhngheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:f1RkZ-GyZQ9t4N6Y8V4PqnZ21tAdmc72i22nLwTlqyWVHD_tlHev1A>
    <xmx:f1RkZyUUsy6nWHp7GyIMTs5KRbnvQWY_S35ZdgXLY7FPPlP469qFZQ>
    <xmx:f1RkZxNuW-9DL9m1RvRtU6xo6Nguhoe_EOYyNOGhkZLUJXKiMibVYw>
    <xmx:f1RkZ52B9HR2RkhjqNDOowhHvi3hObAg1Ko2iNU7sv4e2nWgpz5ghQ>
    <xmx:f1RkZ0LX0NPEjyoWpu7LR9QlDXReM4_uubtZnk8KvpyuQVwuuILS7m7P>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 12:14:38 -0500 (EST)
Date: Thu, 19 Dec 2024 18:14:37 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: media: max96712: a few, mainly cosmetic,
 changes
Message-ID: <20241219171437.GE3377144@ragnatech.se>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>

Hello Laurentiu,

On 2024-12-19 17:06:40 +0200, Laurentiu Palcu wrote:
> Hi,
> 
> This is in preparation for bringing our downstream max96724 work into
> the max96712 driver. The changes in this patch-set are mainly cosmetic
> to increase readability, with one exception related to the PCLK debug
> register which appears to exist in MAX96724 as well(see VPG section in
> users guide [1]).
> 
> Unfortunately, I couldn't find any max96712 reference manual anywhere to
> make sure the registers match between the 2 chips, nor I have a max96712
> to test with.

I have tested this series with both MAX96712 and MAX96724 and I can 
capture the test patterns correctly. For the series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> However, since the max96724 compatible was added here, according to the
> commit
> 
> 6c872b782ae ("media: staging: max96712: Add support for MAX96724")
> 
> the chips are "almost identical". So, I used max96724 register and
> field descriptions instead. Someone with a max96712 RM may want to
> double-check though.
> 
> Thanks,
> Laurentiu
> 
> [1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf
> 
> Laurentiu Palcu (3):
>   staging: media: max96712: fix typo
>   staging: media: max96712: enable extra debug register for max96724
>   staging: media: max96712: add some register and field definitions
> 
>  drivers/staging/media/max96712/max96712.c | 210 +++++++++++++++++-----
>  1 file changed, 165 insertions(+), 45 deletions(-)
> 
> -- 
> 2.44.1
> 

-- 
Kind Regards,
Niklas Söderlund

