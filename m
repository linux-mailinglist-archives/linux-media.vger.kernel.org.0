Return-Path: <linux-media+bounces-41361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA5B3C49B
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 00:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264971CC2981
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 22:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F347278753;
	Fri, 29 Aug 2025 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LSRvNmZ3"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5337E33F9;
	Fri, 29 Aug 2025 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756505007; cv=none; b=dhHh4cxowMzTVrNIS1HHtsTgppbL0pILMQuqWkFXMPvtSIJCsM6Bxbxmxtdxr3xTtaUI9r6Ysun8vS3mjO+pTEQdYycM3on2OXgCTVbhdw3ien9T9+RBERtU3nxXkIFp9QRXOv5gKi2nfbv4IMrHh2NI1SsxaAYQTDETNfzBZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756505007; c=relaxed/simple;
	bh=7gdmsmp6l4eR0zEoZ6bT1pLgDb6DxpmMwn7stRexQhw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jnIWjWufPKO9lcgLq/QZLGYuYqHkDkwMt0rk6K7FYDEzV04+21bBCZ2/0pWtPPz5SWOR8sIrxcVCelsWYKi0duucj2vullLGsVk388l73zq+v8R2zxdbldwM5i82bmo3VP06hhlZPHm+MoPhhbAyZyK0TkIM9fg0xgBlYSzkoyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LSRvNmZ3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 547E740AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756505001; bh=7gdmsmp6l4eR0zEoZ6bT1pLgDb6DxpmMwn7stRexQhw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LSRvNmZ3vhkiKnL0ZTw9EXH1jUB0VEHZu4j7sA6GfYG4jySaGxgda20S/K7k+pD5q
	 0gPdgmsmV9LsZ6N0lsJ08KU9UYNNNb531B08icZwZ3E9XS+cCFvgPciJqJrO2+Rz2c
	 fC04jB8t25hkrkEKOeNH/NE2ZUdwR/Je7kmzMxZD19+41Le2UoznvsRCkdju60Oqt9
	 TrgzXuDObP3hGc+4kIiatNawOEgt4dqcHtNLrZpQCa6FFwQfdpjUU/1eSnJCN26yl4
	 VSm9d7/V0hcv/EW22HbQMLOsbfOKREB7bWfX+A1aV7Zm177NCwQOSbLPqyNh2jLK60
	 9unMugouE5jOg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 547E740AE2;
	Fri, 29 Aug 2025 22:03:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Alice
 Ryhl <aliceryhl@google.com>, Andreas Hindborg <mchehab+huawei@kernel.org>,
 Benno Lossin <mchehab+huawei@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Danilo Krummrich <mchehab+huawei@kernel.org>, Gary
 Guo <gary@garyguo.net>, Miguel Ojeda <mchehab+huawei@kernel.org>, Sean
 Young <sean@mess.org>, Trevor Gross <tmgross@umich.edu>,
 linux-media@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 00/24] better handle media headers
In-Reply-To: <cover.1755872208.git.mchehab+huawei@kernel.org>
References: <cover.1755872208.git.mchehab+huawei@kernel.org>
Date: Fri, 29 Aug 2025 16:03:20 -0600
Message-ID: <87cy8d4wgn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> Sorry for resending this big series. The content is almost identical
> to the first version, but this one can be applied directly on the top
> of docs/next, without requiring the sphinx-build-wrapper series.
>
> I'm opting for this approach, in order to avoid adding 42 lines to
> sphinx-build-wrapper just to be removed at the v1 of this series.

OK, I've applied this series, thanks.

jon

