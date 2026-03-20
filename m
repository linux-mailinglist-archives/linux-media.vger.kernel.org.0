Return-Path: <linux-media+bounces-56541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPk/EHxxvWnk9wIAu9opvQ
	(envelope-from <linux-media+bounces-56541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:10:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31E2DD19F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C58C23081B2A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3F63BAD96;
	Fri, 20 Mar 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wc10DcwA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D593CE48C
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022922; cv=none; b=ivlPK2tvhQphP+Dv/3HfOJFtO/gM8F8IYKj/p4K7JzUrLyXrNWbkNAHKjkaw0eK2wmaK+R+3Obuo7ZqqVfdI8dlhzLZGLR1r9TWNeGfih7bmWjlc/x1Pi8rosfhA9SUT30URl/boulz9hLQ8k9VZW3gZYk0DJEAxskG3BNqqudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022922; c=relaxed/simple;
	bh=XUmjxiTs2bIlSFXMWUx0wXAStM3lUYmp8iN8+KzcPzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iHUIgN2FIxSjRM0FIB/rqCQf9B0rvgP0KfEe1XXQ6xR52cjt2dQJ8WLp9UeCK1Kl9QkxYAiq37XdyXeRtZ3avaKpp4XFtzUp8C3aUf4hcTg2vEo0hGJHa25xJyH6ZAkg4RbYuVdnCc9pwhDVE5gcVJf6H2aC4SiTcRlmCpZumzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wc10DcwA; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48531e8ae62so5107995e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022919; x=1774627719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BAV0UN0oxOpyXD+zO9adlHObupqiFm/cwhTS5hHbNM=;
        b=Wc10DcwA/uN5kvqM/E7H+2h5OQAJf6uMiH0OBLGp2t+ndpIfa9+f3aqpfaKHWvdjY8
         VurVnCVuANwVptrvkPflCWRc4o12i2M9/XRlq63NnodHla/5Hu/1y9mnn4L/aNh15Dzc
         LsC4xUhCqVg8KDOjsuYrYW6FJOGOTBJCvgUShQdvA+eSIUJkrnMo8jLw1zkhR/AhKZPF
         LkK5V9znpoizgXRh6VEoDQ9ywNPMVLas0Qfa3eVlydumAFxmvyxue/070e0XsNhS+xRA
         K8mdkQ/4XfSEs1Y4xrA6P2EzIyplB+0dX3YmVc/Yj/4IQo3fV/d7hGSj9P0Q+1aFogHK
         s0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022919; x=1774627719;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/BAV0UN0oxOpyXD+zO9adlHObupqiFm/cwhTS5hHbNM=;
        b=B85Y4NEbURXoondHX9EucDXHNh5EZzCMDYTEXmDKU8dFbFXYtTAYFpWBobR4znWx3f
         yPPjTI9C9mie7w07ZOBXCYDaFznvzReWIBwKQ37Z10xj7BZjrRxSWivd4wce5eBuf3RY
         EW/n50CVOy50Rk25qJ9HLTV5EIDOoCHVWke06J7T+/Q7/CpycBAkIfX2Sm5LDzk1f/Da
         lhh0QfpU+paovS1dGOsJsY16+xjcJo2Etwg2II1IeW/VuB2Rs0xEjOtK3tqAl3s/p++l
         cZIFALu+j/PGc18EnO/awQfNse5vVgUMKz1qlzYp8WyHevuxcXHZTON6x32UFtxXyIaT
         XJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5FcqHfU6WSNxCJSvbsQS/UI0+FTfQu2ZbNxFQiIC3FnCuIlBvZOwBSl42ZnbEwceCjGIhtovDS7GJEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznw1TwK5MxDDt22XqZGpxKxIPYxc5dewOMryhzWuuQw2hnmnCZ
	ZteTvA5FX6puqsoB7PDsh8i3afLQcm1SvmepcpRtU9BDEXeBWUImGbxdcAChLsiz6kFolPVrLKr
	QyeqjmIgVdxFNRGgXqg==
X-Received: from wmej19.prod.google.com ([2002:a05:600c:42d3:b0:485:4f4a:bd87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5291:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-486ff04d6afmr53214535e9.32.1774022919337;
 Fri, 20 Mar 2026 09:08:39 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:26 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9MaSYeQMVsO/xbbV7cBT0cy87FW81cANB6QK+J3LWZk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXEClNe6r8Fk87JnvEfKv8OUplzwJoPGzIoGr
 3cMu7WCI+6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RhH/D/9TrPthCru1C4LRuKvU6ahTZweO8txlFbO6CbGuDachWky66rslljqV7IqQsMd0y+JrJ1G
 SgzuIT2lcF/BLpHi5xsHV55YemywXjL5hcw8qd/XirPkt/fK+Jk6AqjGBUGOmp8RJOvCbhvLyEn
 8H33yDXFid4QqQC59tU2miqHhb3ZLyWEu7LHQCeMGXWAhIJ18viTkhaKczyBRLAw6FTFkVOTVcs
 nWqP2jVMg6Ma4BMbd1kHM9iTMG4HdLW1ruYoYQDGESlFUsnCBJod73ZZOwUIi03SMZL2oi8PUQs
 cE6lYtphUfeRwjGkW+ghdy0XtvBQRD31bdThgJ//Akx6uxPh06E4pS+iKPyRj/ZTP+ABgQNPOQx
 8/vps2cnyJ9iTPGdeb47dOlrzEWxMW5uRK83h+hem3XKhoiimoeQwBRkWU2ZomsaIrw22wRoVHd
 /jr1ndvB1s53AtyJzCasjJ/kIM0+pqaG+l5mWL+v+ZjvknmPbj1U4pdciQprcHOroOLPG6scQQZ
 /L5LcOdowEj2115j0LTMFuoIIQA3SCMHuE3ixpv6jJYq5UkxIVh121kF3jwDKWg1B0xkVqlZuz3
 8XKsd/AGdZsssHMwAIiziHdUi8fDRymqF1m5MvIE9tsNwcMXz5Ulq81v1FeWXV3joAc4hJIDod0 SelsXQkWve0JR5A==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-2-76fd44f17a87@google.com>
Subject: [PATCH v5 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56541-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-0.942];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,jannau.net:email,asahilina.net:email,amd.com:email,linaro.org:email,collabora.com:email]
X-Rspamd-Queue-Id: BC31E2DD19F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Asahi Lina <lina+kernel@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Taken from:
https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
with __rust_helper and MAINTAINERS file added.
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 14 ++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b40923a18066..5d013a36f46f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7534,6 +7534,7 @@ F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
 F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
+F:	rust/helpers/dma-resv.c
 K:	\bdma_(?:buf|fence|resv)\b
=20
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index ef0f010c268b..47279e993934 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,7 @@
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-resv.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
new file mode 100644
index 000000000000..71914d8241e2
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+__rust_helper
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx =
*ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+__rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a83060f8500c..fa56d62c9014 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -28,6 +28,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"

--=20
2.53.0.959.g497ff81fa9-goog


