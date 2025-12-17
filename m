Return-Path: <linux-media+bounces-48995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E70CC8496
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 15:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A8230FCB99
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 14:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACDC34DB65;
	Wed, 17 Dec 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="C46RhLWd"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A05329E5B;
	Wed, 17 Dec 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982177; cv=pass; b=gMUQjztwAYvtHud0y8nsgnN2PFjtnqBFARCNYHN3fdPMiFDXpHp+25xREDW8CgLsAmeZahqTd1MdXEvZ7N3vgdG0gKacmYPLk3l50jCUkdK+6zV8GNsK5bVNX2uiFAt/vaUvM6Gazuz+ZyRNxSJoQIr482s/XliUqtP4tGy74cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982177; c=relaxed/simple;
	bh=DX6kNnfQbEd7BrGBK1A3Q22yvFC8DPnMtl8zaRhkKTM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Fm1f78joLIRkbJMUw9XSnPTjv8nNa/OJZADIKJtSIf5cFYAXnElbELxri/DfOtJSwrQJBzkwE+W8A36vGGRLDLc/JUjIls0e1z1LiphbXmUZtnoUkEFZ/sqXXRCWMn6KVx3Cmpia+1g0+optSKDjjxbv/eqo8TrUBZTGmlTpqtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=C46RhLWd; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765982144; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lHEc5mqPnT5iBfZ6Tn1+8VWYB1ONRR4eUuGctDr6dTfRo1oons1h6GWg9WCbB3h06TFR1uJ/yAOuza7KDF0DAWotZI2HfXSxFhka+e1GjSfTpEm1DenTQ0K+0GMLpUzqGEIxwF9EAHOkxEv/8qLasaFoAm9a3zYlYj32N7EE0iw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765982144; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DX6kNnfQbEd7BrGBK1A3Q22yvFC8DPnMtl8zaRhkKTM=; 
	b=bw9dNMdT9HQP+3QWdH1gl8yeywFwXkkZS7TSLusNJ7JVqI2wzI4oAjdAgL+E9W9xStHNeYaqdOU2vHi338ZYepYbxLuahrXC6xmMZntu7BArt2p2XBfB3SCCSSnxM+E7XLtvYz0ObgQV+9S7REXW0MLu3lV/tVKEEd5VCXTbXi0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765982144;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=DX6kNnfQbEd7BrGBK1A3Q22yvFC8DPnMtl8zaRhkKTM=;
	b=C46RhLWd25I1Q2UQjGUJUFaaRDBtoqlkOwVvsUga7e0s6cqeHbKGFfTw6+bvuZwH
	nbn77IONaNT6erISj/IR31yA144owmhVF4bvhV/6A4iF4arxiTf8aZJ7fCIrnusJZkK
	puDdKAQKarRtJNEhek451AdRGJxfN0ETTqACjKvU=
Received: by mx.zohomail.com with SMTPS id 1765982141681839.0572788741113;
	Wed, 17 Dec 2025 06:35:41 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/7] rust: add initial v4l2 support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <266b9b35-aed1-4c2f-9fd1-4da349876ac5@gmail.com>
Date: Wed, 17 Dec 2025 11:35:24 -0300
Cc: a.hindborg@kernel.org,
 acourbot@nvidia.com,
 alex.gaynor@gmail.com,
 aliceryhl@google.com,
 bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com,
 dakr@kernel.org,
 gary@garyguo.net,
 kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 lossin@kernel.org,
 ojeda@kernel.org,
 rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <73B8194B-4E21-4E5D-99AA-54CD273858B4@collabora.com>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <266b9b35-aed1-4c2f-9fd1-4da349876ac5@gmail.com>
To: Frederic Laing <frederic.laing.development@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Frederic,

> On 16 Dec 2025, at 14:03, Frederic Laing =
<frederic.laing.development@gmail.com> wrote:
>=20
> Hi all,
>=20
> I=E2=80=99m new to contributing to the kernel and was reading through =
this thread. I would like to ask about the current status of this patch =
set. Is anyone still actively working on it?
>=20
> If it=E2=80=99s unmaintained at the moment, I=E2=80=99d be happy to =
take over and work on addressing the review comments and resubmitting an =
updated version.
>=20
> In case you're wondering why I am interested; I am currently working =
on camera software that utilizes the Microsoft Kinect 360 and V2 camera =
variants. Luckily there is already `drivers/media/usb/gspca/kinect.c` =
but it has some errors (like reporting invalid frame rates for color =
data) and design flaws that makes it impossible to stream depth and =
color data from a single device at the same time. I already got a new =
user space driver working in rust and would like to upstream it to the =
kernel to replace the older kinect driver written in C.
>=20
> Thanks for your time,
> Frederic Laing

I did not hear anything from the media people so far.

Mauro, Hans?

=E2=80=94 Daniel=

