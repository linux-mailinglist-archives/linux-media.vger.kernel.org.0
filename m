Return-Path: <linux-media+bounces-40075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651EB29918
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 978603B8EA7
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522B9271469;
	Mon, 18 Aug 2025 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="aptH7mzs"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C727144A;
	Mon, 18 Aug 2025 05:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496319; cv=pass; b=sgJmuNTPyb7Bc91CrjDQOzQCa9sHOvvAl+U0PnwyNHK7b9p4rYiafnza2Z0yyZH2HZqKE4dEoSFJaeGFmaBz5apQx5RlQHoi2uTailk4aYXhe/EqLczkWPB2MJNccqgp8mxnlEKqwnMz32/DZ9H6Waxsz5KjUghKN57WSxd0T5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496319; c=relaxed/simple;
	bh=4pRM8qsAkeqCRW3ktTfw7X+/A4zn15K5CjxlSidgUzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtJIOLRMCi/g43phhufbLm3p4NHeuzyC6qCcwXmOsqfbPNL8zGeaJ4/vgSe9nK68mnR3qdEspjcU+u3uFTwTtbPe1v9/SVQDpEEVwYxiO4V6OvsqLWsHExnDJZT0F/8Yl248aAXUW/WpM0jDHaPiH/D1QzKtzU/bnv1r+WSsPMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=aptH7mzs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LLwhjtk2OAlHbgKBvtF9uhUVebolmqLXZSxfnuAcC9H+4sz84QcHkIM6lvEeaYvM4QpMwVMmEvPOT/unUX+UJQkM7bhrR1XRXt1owTwDX/vGpJHyKg0CdN49aWgzvD+tRtxcaG90aR31sdby1OHhVA1i54zR2vD1tkFDoGaverE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496297; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WlET7ORMtBj8k242wjZ7qO6EjSEsUmE1q7rAL2+VxKE=; 
	b=XFhX3h1hnx5/oTsRZNd1q+FLrQrgC0y75oZpbBBJ8ykZANGPLoQuOLm3FwyqXet0Hjv+zUsmCr7+yee0ZJDqO69Ae95cg0yalLQeEAwDbz/fOtQEl0nAPUkDLjAS5sFnLepL6bL4VWdICv6avNdZQv/hW251bcnQlNzAP1oENFw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496297;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WlET7ORMtBj8k242wjZ7qO6EjSEsUmE1q7rAL2+VxKE=;
	b=aptH7mzs2kaEwf57D4KL/mGhN8hfqqqVpMpugyCyNUDJr4gQrLnMarABRTsgeVyQ
	l4FHGS8RH1ZEeHizc3ZTVb6im8ZuBlJkokHyG2j8nj0RxuE6C517UDsvpxrSxS2bz1U
	eOFgZmDUOXIQezPX1LZTCwTqT2SiHjspipIyv27Y=
Received: by mx.zohomail.com with SMTPS id 1755496294138625.560871847908;
	Sun, 17 Aug 2025 22:51:34 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 18 Aug 2025 02:49:47 -0300
Subject: [PATCH 1/7] rust: media: add the media module
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-v4l2-v1-1-6887e772aac2@collabora.com>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
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

In preparation for future commits that add support for Rust abstractions
like v4l2_device, video_device, v4l2_fh and others, add the media module
in lib.rs and a corresponding MAINTAINERS entry.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 MAINTAINERS              | 7 +++++++
 rust/kernel/lib.rs       | 2 ++
 rust/kernel/media/mod.rs | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..6fc5d57950e474d73d5d65271a0394efc5a8960b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15434,6 +15434,13 @@ F:	include/uapi/linux/uvcvideo.h
 F:	include/uapi/linux/v4l2-*
 F:	include/uapi/linux/videodev2.h
 
+MEDIA RUST INFRASTRUCTURE
+M:	Daniel Almeida <daniel.almeida@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+F:	rust/media
+
 MEDIATEK BLUETOOTH DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-bluetooth@vger.kernel.org
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ed53169e795c0badf548025a57f946fa18bc73e3..34b9e1497b2a7f70c957bff31855aeac6039cf2b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -96,6 +96,8 @@
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;
+#[cfg(CONFIG_MEDIA_SUPPORT)]
+pub mod media;
 pub mod miscdevice;
 pub mod mm;
 #[cfg(CONFIG_NET)]
diff --git a/rust/kernel/media/mod.rs b/rust/kernel/media/mod.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e4a28be7b484888a02965d0e8b5fd5d3c969840a
--- /dev/null
+++ b/rust/kernel/media/mod.rs
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
+
+//! Media infrastructure support.
+//!
+//! Reference: <https://www.kernel.org/doc/html/latest/driver-api/media/index.html>
\ No newline at end of file

-- 
2.50.1


