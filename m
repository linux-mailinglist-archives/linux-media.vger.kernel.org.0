Return-Path: <linux-media+bounces-33064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B81ABFE7C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 22:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C2377BA1C7
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 20:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B7C2BD59F;
	Wed, 21 May 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LYD44Y1B"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6928F955
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860452; cv=none; b=uIT4vrwwvQWHBU/Wc8eEDS8RPBdhHy3WctBu/lwdUsi/LofmPiLs/mZPgbi4nev9+/FW7asZU+Vd5GRyqvs4Lcgxcr4U2T7i99FqfEEIuG/jMs998BfLT/tyv/gwBuacVt+F6AheYf6WU4xeCslhY+sBsVU1nRNBHKn3zvJY0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860452; c=relaxed/simple;
	bh=1wSa76uvekgQE01+MQeWukvMp4xVzsb72HGt4+9lMdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkD94Do4x0Jnx5lKPQof5QEcMJoCVjTSD0erXSEB3HCVfjeULYn6DGCmosfTJo5VYNqSm4hXXUlPwxHAvF27aTmxHQMzamkQNUtJEF1G24Dv4gGAGyCi4AwR1hLckZy2uqnaspRj6Bhm5ptcXphsFosOoMRIWgK2+MhgacnMLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LYD44Y1B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmeIsR+A9CWCGJ6MrpGMC5fCHJO5oO+SAH4nW/MP2Dw=;
	b=LYD44Y1BFtKFkVBI7m8Q5Gj744zyiu/Km97eZogWDeUcYlZX9dLCj2Gr+4pX7YKXu1gqxI
	Y4n9ODtl+7kA+NiJKlc64/mki45WX29Agv4D9uTT1GNmox8vDmTEthoxllcYMvv3FSIia2
	yLpVB/bljg5wxPgXv2+Lr4ERfpkCr84=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-woAIiBBtP0-c_UXCoodg9Q-1; Wed,
 21 May 2025 16:47:26 -0400
X-MC-Unique: woAIiBBtP0-c_UXCoodg9Q-1
X-Mimecast-MFC-AGG-ID: woAIiBBtP0-c_UXCoodg9Q_1747860443
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D828195608E;
	Wed, 21 May 2025 20:47:23 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3040019560B7;
	Wed, 21 May 2025 20:47:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 01/12] rust: helpers: Add bindings/wrappers for dma_resv_lock
Date: Wed, 21 May 2025 16:29:08 -0400
Message-ID: <20250521204654.1610607-2-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

From: Asahi Lina <lina@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 13 +++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 15 insertions(+)
 create mode 100644 rust/helpers/dma-resv.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 31369b7b23884..409e9a595e051 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -18,6 +18,7 @@
 #include <linux/blkdev.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
+#include <linux/dma-resv.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-direction.h>
diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
new file mode 100644
index 0000000000000..05501cb814513
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 20a4ee59acd89..3ba1652899c2b 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -15,6 +15,7 @@
 #include "cpumask.c"
 #include "cred.c"
 #include "device.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "err.c"
 #include "fs.c"
-- 
2.49.0


