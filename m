Return-Path: <linux-media+bounces-32419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A315AB5A39
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 18:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6B4A4A76FA
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D682BF99E;
	Tue, 13 May 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z/vy5tHF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68F2C0879
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154182; cv=none; b=c1PSv5NUssakKsSikcuvsv+vj5y9Oq//ypmBYS7wIoT+uOoANmUm40y/laZmWKUGMnJzTchpInsaAQEtwOqUEcEYezHi0YtrYrFXCggxejgh12KZXPLQx5NwFp1gIweRI0Mcjz3XqgfNINGd2WAYMJPiFEYgEeygYb9ALDWT3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154182; c=relaxed/simple;
	bh=LoopqmbJs5Vnk3r2GqCH3tKa+epZcqS8UrpFqFIMmhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RM6GFNPX0runrO6B0PYffQU/75QAiJrzULOJxFO3P3KCZ945O0anIl2RS71hFUqlHBfRs14rXNIZkJqrlbSvxc9+oZPz4myTvf5Wp7a1P/1BL7oQjG2fC9/CNgArn/ODRjxV7W+H6xreiEx1p4frvdlsT8LocvuiOESUTLH3fhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z/vy5tHF; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso3566659a12.0
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154180; x=1747758980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
        b=z/vy5tHFGC1CehjEgU9xjzB9kp8AzjItB6bs+/E16fN6RR2xz4P+VKHRZYpMOEoQHl
         +dXTU9sQCeDbXnSo7QAMyuVIlUJNe6AfbVDJyQ6ndkJVBwujoKpGQVdyPOeIufR+51AZ
         o034Tjj7wwexOlhKcwhB/Q9dhRA6VuX9kkNqS7TIlsqz/bvAUyK7Swt/eAmY75jKCe1w
         rEoPLB2yWv7IoPvH73GGGM6foANQRDfrOB1vOZ1sBKjOkCqf6sGaoQ4+FngQ6wEuGLF8
         JXXRqi3F7QLqFxNrcsNDcU0iczJcWYZj3HnHxH5tB2T03AcJdi+yjn7H+aih9h7SM0jc
         YTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154180; x=1747758980;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
        b=qyMOGmyDk/M9xqsuIUQS+h80b7SarmgUgstG3kTlIqiYd2K5DrsCehvOSzR4Fyu1Mm
         kVnjIV5db8mJ14sscowLVNmuMN2c9a3XJNUld6PAz0UjhrVNgXwblC5nxQrGdfHsVKVv
         bDCVtt2ZFSLTMQsIzp7axds1/wobkolaIMAdIzZGSABzoMsKOBJ6nbzqF/Qha0lQzZkO
         GCh4OCS8Yi393WZsxRM4j6GW2yHGtX6/mlLdqYfaVB3gWGDktmprKv2p6Ee3KTV7KonR
         MpCdvRnKGGbxxNdvN/jZmxERI558cJKnTAE++PIzvm73/4gPftRb+bHMmnbJJ58QoHur
         3Glg==
X-Forwarded-Encrypted: i=1; AJvYcCUe7AhM8S4PIuwVqNrqnjSgQwJ8IfMAB3sUfjlzbMxJlCJV7pH+MfbRTbIQ4S90FmRaQfyRKGDsnU6jsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCuemobr/rCYGSXIFqypkeCjri9QYD0c9RRW+L/fXqOhXrSbo7
	XIqS/hquK04O8GqKE9ryKMB4OaKi77NFxi1+MhG67/xadeGG7X3N2wJnOMRtVjEkL5AOjpo+9qu
	xjyHCZgDkuIpA6Q==
X-Google-Smtp-Source: AGHT+IGNBh3t4ciLN6BTi9rDoJf0eB2VzLVSDG8EDfVIskybqOSTvm6Sm7/M8V1wG/5e//CdmDmAFqSBHvaalCQ=
X-Received: from pjbsj5.prod.google.com ([2002:a17:90b:2d85:b0:2f4:465d:5c61])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:288b:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-30e2e639b4cmr297905a91.31.1747154180487;
 Tue, 13 May 2025 09:36:20 -0700 (PDT)
Date: Tue, 13 May 2025 16:35:59 +0000
In-Reply-To: <20250513163601.812317-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163601.812317-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513163601.812317-4-tjmercier@google.com>
Subject: [PATCH bpf-next v6 3/5] bpf: Add open coded dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org, song@kernel.org, 
	"T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This open coded iterator allows for more flexibility when creating BPF
programs. It can support output in formats other than text. With an open
coded iterator, a single BPF program can traverse multiple kernel data
structures (now including dmabufs), allowing for more efficient analysis
of kernel data compared to multiple reads from procfs, sysfs, or
multiple traditional BPF iterator invocations.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 kernel/bpf/dmabuf_iter.c | 48 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 53 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 83ef54d78b62..4dd7ef7c145c 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -100,3 +100,51 @@ static int __init dmabuf_iter_init(void)
 }
=20
 late_initcall(dmabuf_iter_init);
+
+struct bpf_iter_dmabuf {
+	/*
+	 * opaque iterator state; having __u64 here allows to preserve correct
+	 * alignment requirements in vmlinux.h, generated from BTF
+	 */
+	__u64 __opaque[1];
+} __aligned(8);
+
+/* Non-opaque version of bpf_iter_dmabuf */
+struct bpf_iter_dmabuf_kern {
+	struct dma_buf *dmabuf;
+} __aligned(8);
+
+__bpf_kfunc_start_defs();
+
+__bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
+	BUILD_BUG_ON(__alignof__(*kit) !=3D __alignof__(*it));
+
+	kit->dmabuf =3D NULL;
+	return 0;
+}
+
+__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *i=
t)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
+	else
+		kit->dmabuf =3D dma_buf_iter_begin();
+
+	return kit->dmabuf;
+}
+
+__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		dma_buf_put(kit->dmabuf);
+}
+
+__bpf_kfunc_end_defs();
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 78cefb41266a..39fe63016868 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3346,6 +3346,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER=
_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEP=
ABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+#ifdef CONFIG_DMA_SHARED_BUFFER
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_new, KF_ITER_NEW | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_next, KF_ITER_NEXT | KF_RET_NULL | KF_S=
LEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_destroy, KF_ITER_DESTROY | KF_SLEEPABLE=
)
+#endif
 BTF_KFUNCS_END(common_btf_ids)
=20
 static const struct btf_kfunc_id_set common_kfunc_set =3D {
--=20
2.49.0.1045.g170613ef41-goog


