Return-Path: <linux-media+bounces-30202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF0A88F9D
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 00:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC6553ABE8A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 22:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028631F8BC8;
	Mon, 14 Apr 2025 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SklbZV4g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7758E1E571A
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671191; cv=none; b=l8HzfRj+fbg73S/hRnKY1y+Hpb52Xpf9Y9Enx84bHuoLLXP0W+XIU9O6CU5WAepLZGPgH7ERDcyyFPDuMDMtxX8pc79j/VF2FJ4wz0Y37SG//qNy8zPOEiw6BxypQj8BDrB+Tuan61zOL1zwrUYx1iGozdWjSVrRexlUNdsv1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671191; c=relaxed/simple;
	bh=WYeXy+tllN1VU6WwnEoa/FU8RUn9Cnkj8ed0fmXLgVY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yd6/1vWhybw9+6iP4dAdiLF51I/XEnCmA2cD31zm/FXG3L5X8j60RgeWZH62ewq2T4wVnjhnShiuxUtZgSo994EnHx5z6NWBC6vZdbEQoywRq8lc8dmVfu2AImtzJwi1ZKYcXDTJXQOc5NkRMEBr7O2y0JtYm88OJOKF6p+MBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SklbZV4g; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-306e76c04f4so4100985a91.0
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744671188; x=1745275988; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Te3lUbwZ2e402n8prt5NUot7zPEUxb8izsCNx6llZ0U=;
        b=SklbZV4grF++rC+uL1sQhBAHpj0ZzV//40+QGlP6g3DRvXWpdtl0eYIqThjYM6aolH
         zhbMNgGeJLIGVKdINSlWM/UwLNtGU2PBFVs3F/KICNIP1A/x0NQ9yM6EHoiTOdhLqlwW
         X0m6+6W5Iq26uf6tWgjNethc0odWYvCyc0t4Nf1biymrlT/tdI1AAUOpCxPQEsH/LwPu
         2DrTwwpCLWJ4rtUF0nX9g7dvCIqXUgUJCJTWZrBbiQ0xMx2NA61o4FCQKYVGvfPYnC8P
         vRZo/e17PBKGNr6xHqD7+GXRGKO8DIdEtoC1Pd5vOl1d4w59qxdFPiAlIBPEooHhqpKj
         wTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744671188; x=1745275988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te3lUbwZ2e402n8prt5NUot7zPEUxb8izsCNx6llZ0U=;
        b=B5h/xHuglJ0MbwcVdv9HXuGpi+bInZcPM3UQvCHALkM63CbGBSihNIMbJv2tbAsVeW
         r/nKnjNEtrbDrMq9TOd2rzjPuYkJyCLLZ+uSAWmSK77qybopYZfNoUuZxvbfY0Iu1KMo
         BxJiHCpZhVwTtVsV3AdbWY2GfBs/MNmrAbTQqjWMllTdMa+jsPlnYHF0nBz91B96Zw/t
         daEZSygnKq5s7Wm+q6YhySd64TSej9wvd1G0DG0bGGPjkzKqmQwygHQSZbqiLmAuT2iJ
         wbaE9mC1oRl01QbB6WsVLfdWx1bucZi4O9NRKN5R0uWvO8i6HMu8XGKllvnrxXnAIFh/
         /EMg==
X-Forwarded-Encrypted: i=1; AJvYcCWV0NO7RTDKmZVzXsGYAzAWZZ3jDibl8QOOcbqvnezARdrUr3y0q+x4lrleADnlRRAfBFEMuOku+LOQgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJRNRgFIYLy0odUXUrJ2YA7jL4/V4qYpCgDe+UA7Sb+/gk62l
	8NIvhVs4mfigDx6N9SB7XuRKF3Gpv/ydAtHC7XrX+Qt5mhTUos9aXYOjOZ4aE4gI93oiYzG0UV1
	/o2mxzXULgS9sDg==
X-Google-Smtp-Source: AGHT+IFby0+3fZ+dlbvnlnn/PuiXCtm12W3q3xJ1huaS9epNl9xvSzvIQXz19TFGLLtbJ8r7RNzWm6OwL70SRho=
X-Received: from pjvf15.prod.google.com ([2002:a17:90a:da8f:b0:2fc:2c9c:880])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d64e:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-30823672e78mr19733269a91.27.1744671187842;
 Mon, 14 Apr 2025 15:53:07 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:52:25 +0000
In-Reply-To: <20250414225227.3642618-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414225227.3642618-3-tjmercier@google.com>
Subject: [PATCH 2/4] bpf: Add dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
	corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

The dmabuf iterator traverses the list of all DMA buffers. The list is
maintained only when CONFIG_DEBUG_FS is enabled.

DMA buffers are refcounted through their associated struct file. A
reference is taken on each buffer as the list is iterated to ensure each
buffer persists for the duration of the bpf program execution without
holding the list mutex.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 include/linux/btf_ids.h  |   1 +
 kernel/bpf/Makefile      |   3 +
 kernel/bpf/dmabuf_iter.c | 130 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 kernel/bpf/dmabuf_iter.c

diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
index 139bdececdcf..899ead57d89d 100644
--- a/include/linux/btf_ids.h
+++ b/include/linux/btf_ids.h
@@ -284,5 +284,6 @@ extern u32 bpf_cgroup_btf_id[];
 extern u32 bpf_local_storage_map_btf_id[];
 extern u32 btf_bpf_map_id[];
 extern u32 bpf_kmem_cache_btf_id[];
+extern u32 bpf_dmabuf_btf_id[];
 
 #endif
diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index 70502f038b92..5b30d37ef055 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) += relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) += btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) += btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) += kmem_cache_iter.o
+ifeq ($(CONFIG_DEBUG_FS),y)
+obj-$(CONFIG_BPF_SYSCALL) += dmabuf_iter.o
+endif
 
 CFLAGS_REMOVE_percpu_freelist.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_bpf_lru_list.o = $(CC_FLAGS_FTRACE)
diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
new file mode 100644
index 000000000000..b4b8be1d6aa4
--- /dev/null
+++ b/kernel/bpf/dmabuf_iter.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025 Google LLC */
+#include <linux/bpf.h>
+#include <linux/btf_ids.h>
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/seq_file.h>
+
+BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
+DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf *dmabuf)
+
+static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
+{
+	struct dma_buf *dmabuf, *ret = NULL;
+
+	if (*pos) {
+		*pos = 0;
+		return NULL;
+	}
+	/* Look for the first buffer we can obtain a reference to.
+	 * The list mutex does not protect a dmabuf's refcount, so it can be
+	 * zeroed while we are iterating. Therefore we cannot call get_dma_buf()
+	 * since the caller of this program may not already own a reference to
+	 * the buffer.
+	 */
+	mutex_lock(&dmabuf_debugfs_list_mutex);
+	list_for_each_entry(dmabuf, &dmabuf_debugfs_list, list_node) {
+		if (file_ref_get(&dmabuf->file->f_ref)) {
+			ret = dmabuf;
+			break;
+		}
+	}
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
+
+	return ret;
+}
+
+static void *dmabuf_iter_seq_next(struct seq_file *seq, void *v, loff_t *pos)
+{
+	struct dma_buf *dmabuf = v, *ret = NULL;
+
+	++*pos;
+
+	mutex_lock(&dmabuf_debugfs_list_mutex);
+	dma_buf_put(dmabuf);
+	while (!list_is_last(&dmabuf->list_node, &dmabuf_debugfs_list)) {
+		dmabuf = list_next_entry(dmabuf, list_node);
+		if (file_ref_get(&dmabuf->file->f_ref)) {
+			ret = dmabuf;
+			break;
+		}
+	}
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
+
+	return ret;
+}
+
+struct bpf_iter__dmabuf {
+	__bpf_md_ptr(struct bpf_iter_meta *, meta);
+	__bpf_md_ptr(struct dma_buf *, dmabuf);
+};
+
+static int __dmabuf_seq_show(struct seq_file *seq, void *v, bool in_stop)
+{
+	struct bpf_iter_meta meta = {
+		.seq = seq,
+	};
+	struct bpf_iter__dmabuf ctx = {
+		.meta = &meta,
+		.dmabuf = v,
+	};
+	struct bpf_prog *prog = bpf_iter_get_info(&meta, in_stop);
+
+	if (prog)
+		return bpf_iter_run_prog(prog, &ctx);
+
+	return 0;
+}
+
+static int dmabuf_iter_seq_show(struct seq_file *seq, void *v)
+{
+	return __dmabuf_seq_show(seq, v, false);
+}
+
+static void dmabuf_iter_seq_stop(struct seq_file *seq, void *v)
+{
+	struct dma_buf *dmabuf = v;
+
+	if (dmabuf)
+		dma_buf_put(dmabuf);
+}
+
+static const struct seq_operations dmabuf_iter_seq_ops = {
+	.start	= dmabuf_iter_seq_start,
+	.next	= dmabuf_iter_seq_next,
+	.stop	= dmabuf_iter_seq_stop,
+	.show	= dmabuf_iter_seq_show,
+};
+
+static void bpf_iter_dmabuf_show_fdinfo(const struct bpf_iter_aux_info *aux,
+					struct seq_file *seq)
+{
+	seq_puts(seq, "dmabuf iter\n");
+}
+
+static const struct bpf_iter_seq_info dmabuf_iter_seq_info = {
+	.seq_ops		= &dmabuf_iter_seq_ops,
+	.init_seq_private	= NULL,
+	.fini_seq_private	= NULL,
+	.seq_priv_size		= 0,
+};
+
+static struct bpf_iter_reg bpf_dmabuf_reg_info = {
+	.target			= "dmabuf",
+	.show_fdinfo		= bpf_iter_dmabuf_show_fdinfo,
+	.ctx_arg_info_size	= 1,
+	.ctx_arg_info		= {
+		{ offsetof(struct bpf_iter__dmabuf, dmabuf),
+		  PTR_TO_BTF_ID_OR_NULL },
+	},
+	.seq_info		= &dmabuf_iter_seq_info,
+};
+
+static int __init dmabuf_iter_init(void)
+{
+	bpf_dmabuf_reg_info.ctx_arg_info[0].btf_id = bpf_dmabuf_btf_id[0];
+	return bpf_iter_reg_target(&bpf_dmabuf_reg_info);
+}
+
+late_initcall(dmabuf_iter_init);
-- 
2.49.0.604.gff1f9ca942-goog


