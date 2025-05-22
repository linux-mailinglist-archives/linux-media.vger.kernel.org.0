Return-Path: <linux-media+bounces-33217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14BAC1727
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 01:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BF3D189A152
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 23:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE732C1795;
	Thu, 22 May 2025 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MDgSwfd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE62C0313
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 23:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955083; cv=none; b=XvGYP7RQcMCqYQYm4kBLC9j7sNy5MghtrMcBxsCCkvYGyqkjnRATjhc7/73JZB+VmCnijBHiuhBw89K54FdJrxtAK6ys7edaDC6UwKQh/TJco9rrZQm1LVSPKvkyauhNzzxfGolCSbpNYjyo90enrBJ18r7vjQLeKNL2YZitavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955083; c=relaxed/simple;
	bh=3dl2vczrcQV9dSvGLQh4xQBq56q7+ixMsFPkp+1hATE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A54TTxoEd2ZJllkRIxTJeASFYcH+63Hcvj0b2kqSCQyTQuIx7y4AEjNQu3uH0MWtWOur+nGr+4c4v7/to55mWULE8nrlR6pFPNmOmcbLycjvSkfcxUBVYXVXY6jIqc4q5tHi4IVifTKWpE9TzdarR+PTumnDZz2r5OAGgXW/Fws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MDgSwfd; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e810d6901so5596733a91.3
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 16:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747955081; x=1748559881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+t3s6SNOuCRN33iH3dGH+rCenT32waU3wVYkXXbO4I=;
        b=1MDgSwfdzqXmx+a2BmMjvQDf2mSH2tM9f5ZLdcgDVNcmPA5z8ZACmSBH4tesLNS8NY
         0XxL/JDgWWJVBCF7rT9ioSbq1/lGtye572lObiEWMEH4qP1qxU9GO/LbwUa+5hDL2a1H
         RzyjKTriMlMTFZSfW35tE6G1ViykpDoLzcXYh0BTRfDnG+Y+SG5zRhS6J9MgOCCRa+Ju
         e5P0Wo3KmOG3jkZTdWHIKHuP6pSvQ9YhCnRj28B+RpFLWtuCftJL82LSFFj/FJn8qpUU
         aGRyMx4yf2gd78Y8LuugSZ0J3MJAbIPblUtGkcoXOOIdIdZ1W5p9Y97K/3Ya3nBcgecm
         5TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747955081; x=1748559881;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0+t3s6SNOuCRN33iH3dGH+rCenT32waU3wVYkXXbO4I=;
        b=I2HusUFh2S5zkhwxnsOWK8qoIkOgKGWkohik+NmqY4EnymagyK/THk3+Jy20lmWE1r
         ltHwXXb44oNs2M5T62CfkA7dcuzftQ1bUyzwWo3hWyAuHB3R2LVZ2pkVG+2v3dG4ExO+
         vEVIY0uCpfE0ZQzoabX0avWBkFXsRSVPz3RA6dX0LZPCA0pULuHNW/i0m8aRYrdizCLO
         EjTh9kocjgAjpTcXHPIaCOoR0sVlVRJCEn7qX+OdquZYYw8nBCntr7fgfY60UWygVn+U
         fhqoBLhcQkksN9+XlUNF55ZqzEu2Bg5dRKmzEAAs8IffXYneor0or/qSuyTCekmtmNws
         RM/g==
X-Forwarded-Encrypted: i=1; AJvYcCUyMjrMmGq4UaLExgIQ5IrkGmPm9+qH2ukWHjMqd60eIAEA0mT7eNP6F3HfZKcFPIgX+sC2NrXEnPe3Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrWdK3d9pUUQypHouc3AxgHB/NSxRTLKfoFwe5DoU2dH1I59M
	b46mCISOwLHRt6GD+kzMVCzmy3C54s2Pzfq7xW7a5Lg5Yqz5iPuGasO+ihZJfnik9aQJBXrHtPt
	d9ovwMI23XQgMLI8I+A==
X-Google-Smtp-Source: AGHT+IHc8w2C/hVYKlepeDUS+gdP6rU5PYG4tNWHgiwyi8QzNtjOhtc0Nria+4KwgjyX972SMuMRIqaspc+ap+w=
X-Received: from pjd15.prod.google.com ([2002:a17:90b:54cf:b0:308:861f:fddb])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b8c:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-310e96e746bmr1139945a91.19.1747955081045;
 Thu, 22 May 2025 16:04:41 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:25 +0000
In-Reply-To: <20250522230429.941193-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522230429.941193-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-2-tjmercier@google.com>
Subject: [PATCH bpf-next v7 1/5] dma-buf: Rename debugfs symbols
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

Rename the debugfs list and mutex so it's clear they are now usable
without the need for CONFIG_DEBUG_FS. The list will always be populated
to support the creation of a BPF iterator for dmabufs.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/dma-buf/dma-buf.c | 40 +++++++++++++++------------------------
 include/linux/dma-buf.h   |  2 --
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..8d151784e302 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,35 +35,25 @@
=20
 static inline int is_dma_buf_file(struct file *);
=20
-#if IS_ENABLED(CONFIG_DEBUG_FS)
-static DEFINE_MUTEX(debugfs_list_mutex);
-static LIST_HEAD(debugfs_list);
+static DEFINE_MUTEX(dmabuf_list_mutex);
+static LIST_HEAD(dmabuf_list);
=20
-static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
+static void __dma_buf_list_add(struct dma_buf *dmabuf)
 {
-	mutex_lock(&debugfs_list_mutex);
-	list_add(&dmabuf->list_node, &debugfs_list);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_list_mutex);
+	list_add(&dmabuf->list_node, &dmabuf_list);
+	mutex_unlock(&dmabuf_list_mutex);
 }
=20
-static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
+static void __dma_buf_list_del(struct dma_buf *dmabuf)
 {
 	if (!dmabuf)
 		return;
=20
-	mutex_lock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_list_mutex);
 	list_del(&dmabuf->list_node);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_list_mutex);
 }
-#else
-static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
-{
-}
-
-static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
-{
-}
-#endif
=20
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int bufle=
n)
 {
@@ -115,7 +105,7 @@ static int dma_buf_file_release(struct inode *inode, st=
ruct file *file)
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
=20
-	__dma_buf_debugfs_list_del(file->private_data);
+	__dma_buf_list_del(file->private_data);
=20
 	return 0;
 }
@@ -689,7 +679,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 	file->f_path.dentry->d_fsdata =3D dmabuf;
 	dmabuf->file =3D file;
=20
-	__dma_buf_debugfs_list_add(dmabuf);
+	__dma_buf_list_add(dmabuf);
=20
 	return dmabuf;
=20
@@ -1630,7 +1620,7 @@ static int dma_buf_debug_show(struct seq_file *s, voi=
d *unused)
 	size_t size =3D 0;
 	int ret;
=20
-	ret =3D mutex_lock_interruptible(&debugfs_list_mutex);
+	ret =3D mutex_lock_interruptible(&dmabuf_list_mutex);
=20
 	if (ret)
 		return ret;
@@ -1639,7 +1629,7 @@ static int dma_buf_debug_show(struct seq_file *s, voi=
d *unused)
 	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
=20
-	list_for_each_entry(buf_obj, &debugfs_list, list_node) {
+	list_for_each_entry(buf_obj, &dmabuf_list, list_node) {
=20
 		ret =3D dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1676,11 +1666,11 @@ static int dma_buf_debug_show(struct seq_file *s, v=
oid *unused)
=20
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
=20
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_list_mutex);
 	return 0;
=20
 error_unlock:
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_list_mutex);
 	return ret;
 }
=20
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..8ff4add71f88 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -370,10 +370,8 @@ struct dma_buf {
 	 */
 	struct module *owner;
=20
-#if IS_ENABLED(CONFIG_DEBUG_FS)
 	/** @list_node: node for dma_buf accounting and debugging. */
 	struct list_head list_node;
-#endif
=20
 	/** @priv: exporter specific private data for this buffer object. */
 	void *priv;
--=20
2.49.0.1151.ga128411c76-goog


