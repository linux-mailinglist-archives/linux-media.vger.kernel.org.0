Return-Path: <linux-media+bounces-33162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF4AC0F55
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39732188685B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7F928D823;
	Thu, 22 May 2025 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Mgs3MbYH"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B4935977;
	Thu, 22 May 2025 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926277; cv=pass; b=gMS/QecaJ+3l+Ax3Af4Zsl8XwWuWbeEggbDVH61p55npRmWorm3ugJY7PJlCpfZbdBaU52OWYSx4kqnS7shj9gg4SpCgITWvCiQ52ZGzGnPiRssRCk6KbcsYppkMygWdVUaa2EHs3l13HmFKty/A7wKM0UHUOyHFg2MSwMswXy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926277; c=relaxed/simple;
	bh=y1QZHCVzfxwbLKbffCkbbTuzNdwB0qlTI7Ka0fWBIBc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NulGZL+hWHoP4t145HAbNIa6UAcq8YnA1Qx8kxiC5nYqHXEIIBKh97S8Qk81Y9KRRV4DgnnpD+PRfASSMINKnNz80Un7YuUZKb18k2Yn2PD7THsYt2zh1aneP+PeaeKXKThTN4GhwWm6Js7VUtR2yOeK4LxGv69p7ugFMVcpbHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Mgs3MbYH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1747926226; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VaT0+rMMISfANLEhrx1eJeDw3XEdDuO0H1+K3rgnnBDqIhYyPwBvEIb4HnAuAHld5i/OkBw8g+VA9uKWADhzCXZfnA2lpBpMb5jGpgGFugvuuHPiPtxWzmeKgtYsh9LHcfhnGkKtC3Q6H6lhLtHfzMiufoR8/wEOIzNHr0K5aLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747926226; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y1QZHCVzfxwbLKbffCkbbTuzNdwB0qlTI7Ka0fWBIBc=; 
	b=gMpBT9qIfc/XFVFWHYwam0lFFmgvEiiNypO+KQcTDDVcRS9aBiQJcBt6jY56hZGpN4FI8cMeG2a48TniWiea5cHULyqfXkUBMtFDf7mI1EpOFdogjXlBhq3X8j7gHZY4XaDc9HULJqkABKXByJ6GOfyNrs5YgLlHszF1+FUHnmA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747926226;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=y1QZHCVzfxwbLKbffCkbbTuzNdwB0qlTI7Ka0fWBIBc=;
	b=Mgs3MbYHIxOzfkKPolz5IJUMnnuNafNkYVitKYXys0UNAyR4GHJanrBMy4XvsHm5
	opbJkiwT7CEaSZv8wfHbWnY8eSWB5JDW8sN4VjVeU0VoKaZr9vLBb59OOkUjrsRDd5H
	UEpcGnyY2QiJCi4vSI+hJJMujGz/TGg25Bj+KE98=
Received: by mx.zohomail.com with SMTPS id 1747926224476523.4321217431499;
	Thu, 22 May 2025 08:03:44 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v2 01/12] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ab32a3ea-84a0-484c-a07b-85aecf99ae00@amd.com>
Date: Thu, 22 May 2025 12:03:27 -0300
Cc: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <56CCCD08-01BB-40F0-B7BA-CD7DAE2C23D3@collabora.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
 <20250521204654.1610607-2-lyude@redhat.com>
 <ab32a3ea-84a0-484c-a07b-85aecf99ae00@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Christian

> On 22 May 2025, at 05:44, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
> On 5/21/25 22:29, Lyude Paul wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>=20
>> This is just for basic usage in the DRM shmem abstractions for =
implied
>> locking, not intended as a full DMA Reservation abstraction yet.
>=20
> Looks good in general, but my question is if it wouldn't be better to =
export the higher level drm_exec component instead?
>=20
> The drm_exec component implements the necessary loop if you want to =
lock multiple GEM objects at the same time. As well as makes sure that =
those GEM objects can't be released while working with them.
>=20
> Regtards,
> Christian.
>=20

I guess Danilo is the right person to ask, but IIRC the plan was to =
expose the
exec logic as part of the GPUVM abstraction, which is currently work in
progress.

=E2=80=94 Daniel=

