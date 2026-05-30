Return-Path: <linux-media+bounces-63132-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CASDFmX2Gmp4+AgAu9opvQ
	(envelope-from <linux-media+bounces-63132-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:38:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AB160D843
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A776303C7C3
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E422DF13A;
	Sat, 30 May 2026 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuUNbr4g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29EC15C;
	Sat, 30 May 2026 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780151774; cv=none; b=fnKYgAlQQK3yDc9C7ZtAasdN1me5y9HA8wreHbebeMF5zSliSoDHg0UviGb1b8s8PsML8YN5smtP6Ty44+3CsoOqh0qi5LPAlv1IwuSEHLhuafNMSITZwU5YufikX5X4LLRkz1jQbLAOt/toQ3+l8c3v5NBNAvUpNstCeyWPa98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780151774; c=relaxed/simple;
	bh=kWdFGXaIdTqSIXR1N4ZXJu3yyoPEhmdsXSJR/tKNIhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QXuOhEz3nUydv6h2ZrHRy8093a4DrzgYxhg1kVuN5cCWynldGwb63Wu+2nzzpL/sXQTcgs9XsXZwESJkMsh0MKhq64VqPSHzIcpuwgIzXLOwwLWZoye69o1ESrioWRRrHNYS3AnoSDRalz2G5/ciPfKYtfVk/pvt3dDmU5oT88c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuUNbr4g; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2A91F00893;
	Sat, 30 May 2026 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780151773;
	bh=xz9gQQhI8Lkkj85ZF10THg+XrwAiifLzonLHj9O4ez8=;
	h=From:To:Cc:Subject:Date;
	b=KuUNbr4gBLFewAbSoKvU4Sn6LwubCf4meWBq/sC1Kldjx+uqF1Sm/MGZtX83s0/dz
	 094NqiBWjEddTVeAGXvkz/whF2v+lvOrj2Vjnkuva4KYPTPJAXDK8kg0SZX41sKmRb
	 3777EhJG9dJQ6JhEEm5rOchcHXIWjcOpNJuMHXRIldbGlHeP4mHFuznkALLsCQGcQk
	 gNaGPqoMZb9DH/TFw5IwXHggXPcWOo+3ChQTRT3ufsUKe22tpUipEsZdsTOe4o+t2A
	 IyCOu4dmSX9ZrLxbLSKLR0Z5avuKZRbXbGzCQNFocfUlPma7Mly7Y/xdYjQHkpoyk/
	 4db50WjYoqMPw==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rcu@vger.kernel.org
Subject: [PATCH 0/4] rust / dma_buf: Add abstractions for dma_fence
Date: Sat, 30 May 2026 16:35:08 +0200
Message-ID: <20260530143541.229628-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63132-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C6AB160D843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since the RFC:
  - Include support for ForeignOwnable for ARef, so that a Fence can be
    stuffed into an XArray et al. (Code by Danilo)
  - Implement ForeignOwnable (with new borrow type) for DriverFence, so
    that it can be stuffed into an XArray.
  - Include the rcu::RcuBox data type to defer dropping data with RCU
    (Cody by Alice)
  - Port DmaFence to RcuBox to make UAF bugs through later, new dma_fence
    callbacks (backend_ops) impossible.
  - Force users to pass their fence data in an RcuBox (or have it not
    need drop()) through a Sealed trait.
  - Document the rules for the user's DriverFence::data's drop
    implementation very clearly (deadlock danger).
  - rustfmt, Clippy.
  - Various style suggestions, safety comments, etc. (Önur)
  - Add __rust_helper prefix to helper functions. (Önur)

Changes in RFC v3:
  - Omit JobQueue patches for now
  - Completely redesign the memory layout: Instead of a Fence
    refcounting a DriverFence, both now live in the same allocation to
    allow for future support the dma_fence backend_ops callbacks which
    need to do container_of. (mostly Boris's feedback)
  - Allow for pre-allocating fences to avoid deadlocks when submitting
    jobs to a GPU. (Boris)
  - Simultaneously, allow for pre-preparing fence callback objects, so
    the driver can allocate them when it sees fit. (code largely stolen
    and inspired by Daniel).
  - Signal fences on drop, ensure synchronization.
  - Force users to set an error code when signalling.
  - Write more documentation
  - A ton of minor other changes.

Alright, so since the last RFCs did not reveal significant design
issues, I decided to transition this series to a v1 and hope that we can
get it upstream.

This now includes code for more common infrastructure that dma_fence
needs, contributed by Danilo and Alice.

---

Old cover letter for RFC:

So, this is the spiritual successor of the first / second RFC [1]. v2
also contained code for drm::JobQueue, but mostly to show how the fence
code would be used. JobQueue is under heavy rework right now, so I don't
want to bother your eyes with it. The docstring examples should show how
Rust fences are supposed to be used, though.

This v3 contains a huge amount of highly valuable feedback from a
variety of people, notably Boris, but also from Alice, Gary and Danilo.

There are some TODOs open (a better trait for fence backend_ops and RCU
support), but my hope is that this effort is now finally approaching its
end.

I would greatly appreciate feedback and especially more information
about what might be missing to make this usable, which is obviously
where Daniel's and Boris's feedback will be valuable once more.

Please regard this patch just as what it's titled: an RFC, to discuss a
bit more and to inform a broader community about what the current state
is and where this is heading at.

Many regards,
Philipp

[1] https://lore.kernel.org/rust-for-linux/20260203081403.68733-2-phasta@kernel.org/

Alice Ryhl (1):
  rust: rcu: add RcuBox type

Danilo Krummrich (1):
  rust: types: implement ForeignOwnable for ARef<T>

Philipp Stanner (2):
  rust: Add dma_fence abstractions
  MAINTAINERS: Add entry for Rust dma-buf

 MAINTAINERS                      |   2 +
 rust/bindings/bindings_helper.h  |   2 +
 rust/helpers/dma_fence.c         |  48 ++
 rust/helpers/helpers.c           |   1 +
 rust/kernel/dma_buf/dma_fence.rs | 821 +++++++++++++++++++++++++++++++
 rust/kernel/dma_buf/mod.rs       |  13 +
 rust/kernel/lib.rs               |   1 +
 rust/kernel/sync/aref.rs         |  39 ++
 rust/kernel/sync/rcu.rs          |  31 +-
 rust/kernel/sync/rcu/rcu_box.rs  | 145 ++++++
 10 files changed, 1102 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/dma_buf/dma_fence.rs
 create mode 100644 rust/kernel/dma_buf/mod.rs
 create mode 100644 rust/kernel/sync/rcu/rcu_box.rs

-- 
2.54.0


