Return-Path: <linux-media+bounces-40124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11432B29F21
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC5BC18860FF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6825822068F;
	Mon, 18 Aug 2025 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="njMF4Ayz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b2npdcsj"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B52C2359;
	Mon, 18 Aug 2025 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755512939; cv=none; b=aRO1SxaN3bpKOwkafplMNFCWc+6yN8mSspg3rHcGto6CpG3uvwns4k2VIkz1oKfkNKAdicAiQTVzo5k8bQ9Sdo6910ysINp0USEfJp/2Xz3PiZSTN/Tf+uMjRpgcLA/THWUcw4ARximmUj5hlC7j8jf5jBscyTDl45qlIIWPItE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755512939; c=relaxed/simple;
	bh=yCKZDQ0ebJCdtoPmauTl2kjoBQ7o8+xnwfUwXQeGf3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmNodpm5/evPva6qRTpGxoNFxfH4torjPwL9EelbysH5wH+wLx3JBP4PIZPtVvHlGGioE7wuVGna7XkvaBg4jO2BwPRUj5DDq4GTO3PTqiRmkqzp0XCle/QWE2us6V8uCK5GguaELGVEvrkSlEqOBCaMAuInFNv3zx/0clNsbG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=njMF4Ayz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b2npdcsj; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 24AB71D000B1;
	Mon, 18 Aug 2025 06:28:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 18 Aug 2025 06:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755512934; x=1755599334; bh=X6lCGaK8HY
	0fkpxKrhly2flxfAhmWK+GWj9YTNy9AB4=; b=njMF4Ayzka0QvHH0SPjcThtm/4
	RG/H7SGYFspfZy1Wz79eM1ca3/7Cyc+WruxjU7U3TifhSX6SjmW88vtnktaFuSmW
	Wz7Ml4IDTsVYMRqrczoxXeybGMULXr0nZPO9S9Bv1SLkr5rPUe9ZRYM8MAzuBpgn
	kh7talxuaKqG7OEbt/CZGdDoFWnmNLc777AarwzAMSgZFbHTZSJIjYOZI3mgoAqh
	IYToO/OdoD4bzgGUvMEZWnOgwoDVoP35DI1Q5mCNm/BA1KdW3S6JE4R+5VF/5hnv
	VSZo9ysE914ZnqPLZ6OioFp2pBeV75tEeFGmXN9VPWpSkm2vmx/IjQw9J9IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755512934; x=1755599334; bh=X6lCGaK8HY0fkpxKrhly2flxfAhmWK+GWj9
	YTNy9AB4=; b=b2npdcsjiUO5gpO5skQlYQjedtQaMY6EjcEEoieUn6D1mDC8TgV
	pa254IlczCtIOKgN/BUH3P4dkXykBIK4JcvaO4Lqcd61mLMg8sLnNk6pazAFGfpP
	aHorSZquQr3b4KJv2PANw9VrHWa+zAWAFuZOCIF4j/8dufCxiDkg6RyLMXCKJnmi
	T3sTbo4g9loi0jECXOcpVirZTK0IZkEKS0THwnVTTQ9k7LvYHrfi5GyZH3HgfAMj
	1w3MeBTbvJoe+iHn9b/Zoh/ZqNsqnsF7v+NVwUggIDkEBLn35nbkP1OZNS+vqafU
	UEcaX0Un7476LIL05sSJIl5m9wlrcxyfdDA==
X-ME-Sender: <xms:ZgCjaAvv0fsNn3Debd7NgZyZRAFB8WLLwz1rx470RkJhBHOr-bHPZw>
    <xme:ZgCjaJQxnNFNJgK2oYWijGtuPwWAW-oBxCnqfbGIO7ZgYlARyXh2Kb6ZF-6U8ORQ_
    jExKLExofm0xbG16iA>
X-ME-Received: <xmr:ZgCjaBRSAoC0WAz7wA5arIUPsjcyTK76FGbbk1lz8hDM1x59O8ZsqdB2oDqQ4os-c2KCvBJY8vAAhS6Bh5OsGhkqvWYSXJ46tKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtph
    htthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgr
    hihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghp
    thhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoh
    eplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhm
X-ME-Proxy: <xmx:ZgCjaFoGJw88GPDyKNAXgFIlOQW3SyRiOdXzTyzsJ_SiOJ96_0Kjmw>
    <xmx:ZgCjaBDcsDt6FkMii1wT7qjqKP0sUPen06svrv4ckCm0623-LvgWyQ>
    <xmx:ZgCjaKtQw95G5grboE4wKjkVpQbelh4ZM0b8JLT4CbRqT3jBH4_WaQ>
    <xmx:ZgCjaAZ5fzf25OQAXQPDR2MlCWKFshF0RcP1zhGhlvNIVwmKXKRk0A>
    <xmx:ZgCjaGFWlNMqURoWFQCtpEQ0ciN6kGe7MhrUzdCXl1-ExY8xNax0eGod>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Aug 2025 06:28:53 -0400 (EDT)
Date: Mon, 18 Aug 2025 12:28:52 +0200
From: Janne Grunau <j@jannau.net>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	kernel@collabora.com, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/7] rust: media: add the media module
Message-ID: <20250818102852.GA1270980@robin.jannau.net>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <20250818-v4l2-v1-1-6887e772aac2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-v4l2-v1-1-6887e772aac2@collabora.com>

On Mon, Aug 18, 2025 at 02:49:47AM -0300, Daniel Almeida wrote:
> In preparation for future commits that add support for Rust abstractions
> like v4l2_device, video_device, v4l2_fh and others, add the media module
> in lib.rs and a corresponding MAINTAINERS entry.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  MAINTAINERS              | 7 +++++++
>  rust/kernel/lib.rs       | 2 ++
>  rust/kernel/media/mod.rs | 6 ++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa45799dfe07de2f54de6d6a1ce0615..6fc5d57950e474d73d5d65271a0394efc5a8960b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15434,6 +15434,13 @@ F:	include/uapi/linux/uvcvideo.h
>  F:	include/uapi/linux/v4l2-*
>  F:	include/uapi/linux/videodev2.h
>  
> +MEDIA RUST INFRASTRUCTURE
> +M:	Daniel Almeida <daniel.almeida@collabora.com>
> +L:	linux-media@vger.kernel.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Supported
> +F:	rust/media

You probably mean rust/kernel/media/

Janne

