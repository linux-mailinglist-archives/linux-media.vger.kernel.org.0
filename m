Return-Path: <linux-media+bounces-40074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5BB29917
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 180493A145D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9BE270575;
	Mon, 18 Aug 2025 05:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hRq/r5OQ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97517264602;
	Mon, 18 Aug 2025 05:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496315; cv=pass; b=GQ1TdjOYwcPXALguuEVItqo/RT6Y9LWOgoAWSQaKcv2ZXQZNN+PQfFLLfTvmbUuvaFb7pZeJ52Xt6yLfSo3bxbTivZAqljmzDBohk99mEVTKz+l7lvewuXSd395vgFn83JOUl9VRrfPLd4TL6eotqEzcnJkkc2TTTk8EQeAXZG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496315; c=relaxed/simple;
	bh=h8xxOrjgpeHxkrnsKMrxDIvceyZJvMAn1wgc15ow78w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IBJ4J5YC5GGKjjbXg4cpvlPtKlIGW8XoVLqAaWnVpfhORzgNDUko9am5K20WLU3isv7MDEWaN5i+WxpYMJ1li7ZEmpL0Q8jI/STVDC6gRhqbbwonpBfPlJaEmFBaK5/xKHPi1OhLx80lwXVKl3IwW8NlcL5uxABzE73Asrjb5+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=hRq/r5OQ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EalfFgJbPTX6n9LvtQECSDWpavt7WMReVhQUWI+2ZGawGUTVWnoBpZ7ZoYmdgsJsnJTpdulZHkE3NFDshmx6wDRPedh8zWoA08K7rJpPfXhscI7JoktJYEA6F5I3bxijFtFzy9MwjiIFzYcNFy+7y5ige6E2cNa868xLDfPTPWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496291; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hR2ARozJLRgULsJvoiLBSidAtOxVnB3UNuqCLTscT/s=; 
	b=IDUSDzwCBHU0Zy+M+gnX0MrPa73KE7QD2Kwbw27+Cyi5R8NChUhGR3hrp02Z8rQxr9dJB10BNrI9GGrp9wniojgms83gm+L3gXQstj87tfz21LxxGdNKh5e5ibXN8JQ2M4ehyXaV2nGW9ixyKvXTufDykdDhqpKO5OO4mJ2uueg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496291;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=hR2ARozJLRgULsJvoiLBSidAtOxVnB3UNuqCLTscT/s=;
	b=hRq/r5OQ8pybsV5Zav0YW3g6goRYPSr7F3kIT+ENl2y9VLd2wbO488+pwGC1Hucj
	GCYX2oeA+KjiXazqpoYvNeS+MymuSQSeN0oXcLnWhIz7jIZSRruxTwljrkxNz18snQr
	6mrNNpZfInqaUGbI6qoCcqRf6UYJXYiBYs1j+8DY=
Received: by mx.zohomail.com with SMTPS id 1755496289543523.409879888822;
	Sun, 17 Aug 2025 22:51:29 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/7] rust: add initial v4l2 support
Date: Mon, 18 Aug 2025 02:49:46 -0300
Message-Id: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPq+omgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NT3TKTHCPdNPNECwNjC4vkNHMDJaDSgqLUtMwKsDHRsbW1AEHVOch
 WAAAA
X-Change-ID: 20250815-v4l2-f7a80388cf70
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Hi,

This topic has been discussed in the last two iterations of the Media
Summit and it has been dormant since. In my humble opinion, and owing
to all the progress that Rust in the kernel has seen since my last
attempts ([0], [1]), it is time to try again.

This series reduces the scope of the original attempt considerably. It
adds APIs to register v4l2 and video devices, and just enough to process
a single ioctl (VIDIOC_QUERYCAP), including basic support for v4l2_fh.
It was tested with v4l2-ctl.

It builds upon the platform work from Danilo and others in order to
offer a concise, platform-based driver sample that is currently the only
user of the abstractions. It draws from all the work done for DRM
devices and others and uses patterns that are known to work for other
subsystems.

I hope that we can all agree that there is little that can go wrong
here.

I've also added a separate MAINTAINERS entry, as the topic of
maintaining the Rust abstractions has been a major point of contention
so far. Hopefully this settles this issue in a satisfactory way for all
involved. In other words, no one is forced to contribute or alter their
workflow in any way, while those that want to contribute are invited to
do so. This approach has worked rather well so far.

I've decided to work on this once more after being told by a few people
that they would likely try to play with Rust v4l2 drivers if only they
did not have to write all of the infrastructure themselves. This work
(and subsequent patches) will pave the way for them.

Note: this is v1 and I'm aware that there are a few checkpatch and doc
issues which I will fix later.

[0]: https://lore.kernel.org/rust-for-linux/20230406215615.122099-1-daniel.almeida@collabora.com/
[1]: https://lore.kernel.org/rust-for-linux/20240227215146.46487-1-daniel.almeida@collabora.com/

---
Daniel Almeida (7):
      rust: media: add the media module
      rust: v4l2: add support for v4l2_device
      rust: v4l2: add support for video device nodes
      rust: v4l2: add support for v4l2 file handles
      rust: v4l2: add device capabilities
      rust: v4l2: add basic ioctl support
      rust: samples: add the v4l2 sample driver

 MAINTAINERS                      |   8 ++
 rust/bindings/bindings_helper.h  |   2 +
 rust/helpers/helpers.c           |   1 +
 rust/helpers/v4l2-device.c       |  30 +++++
 rust/kernel/lib.rs               |   2 +
 rust/kernel/media/mod.rs         |   9 ++
 rust/kernel/media/v4l2/caps.rs   | 193 ++++++++++++++++++++++++++++
 rust/kernel/media/v4l2/device.rs | 176 +++++++++++++++++++++++++
 rust/kernel/media/v4l2/file.rs   | 164 ++++++++++++++++++++++++
 rust/kernel/media/v4l2/ioctl.rs  |  92 +++++++++++++
 rust/kernel/media/v4l2/mod.rs    |  20 +++
 rust/kernel/media/v4l2/video.rs  | 269 +++++++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig             |  11 ++
 samples/rust/Makefile            |   1 +
 samples/rust/rust_driver_v4l2.rs | 145 +++++++++++++++++++++
 15 files changed, 1123 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-v4l2-f7a80388cf70

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>


