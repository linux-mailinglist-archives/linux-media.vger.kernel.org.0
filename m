Return-Path: <linux-media+bounces-25387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270FA21330
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 21:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E779C166570
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 20:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C081E1EEA56;
	Tue, 28 Jan 2025 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvGpkedl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBA1E98E1;
	Tue, 28 Jan 2025 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738096587; cv=none; b=L9+eqV8cdZGl4HT1eZ00rTc8lk1WeswKNSqVO5NasbQ3XRPpaa9jmYEuAd2TltA0zmTVV/8NGZsswRz8Z1ouP3PZP/1fpm2lmJmFClhUBCXTltuZmf8W0lpC+2uHGrmELv5ABZ8GmKUtVIfEpTBu2KsHMsV46GGBhe18+JnJWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738096587; c=relaxed/simple;
	bh=qVTrrQkFDNqvXyLb4nP25mCPoBVYVZ41Pr+y0QNrMso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gcHdLHDdAj32p95VI360bI8VWExvydtZEeDEDkEuItKgm9+5/Lq1F65txq71wXXVmlTMdzCwePlszzjKQr3S26aF8ptv77gx8avl3DvLG7F9o2qDHOwg20dx2M8WVW7L9xRjNr3moN8qvLO9nbSa5bvcspPfbwQIVsoz4b8/KDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvGpkedl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401be44b58so6557292e87.0;
        Tue, 28 Jan 2025 12:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738096583; x=1738701383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8MTyUlPh3gZbGYt+/m2sUV5tFwW7lwH2zL30YhNj3E=;
        b=BvGpkedlxhN3T8I1AJiP9M5U7VQtOv6K6BAbAdWwX2uyfJD/RtegxjQ7jA8wbffrKE
         hfgTzb05tiL3569gMJQQu2ZLLmUdcN/kgu0BnnNgpFGqyHw+L5NYCjFvrxdiQP9z9Nlu
         qV9Q6Pdj/rXWL8O6vg7vr2ot6b/xP1wl77JTb4eIJJKr+Gse9pjlWG4rLX0uF1I8eVXM
         sVa7YG2+sEIqnjJZwuexR97mDGqMhzYsE9bFUzJudVTU4lN0BjqNKswNxkdPVf4IYL5x
         CJtk0rvB6DjvdugTpuoU/sfWO+SrdBhmfQGtpjB33VekG4WlfBiGZHsAV5hIZ0uaapet
         vCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738096583; x=1738701383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8MTyUlPh3gZbGYt+/m2sUV5tFwW7lwH2zL30YhNj3E=;
        b=FIPwd7uxMY3UR+1PVoko6CEBZ6gMu9MJGQch0IIeom9S1MvIFeJZ03tiVrDCzFLv63
         FKZQ0KtDBTPvy9VB08O1LLybzQ1IC85Ni/oqPozkPVQsRg9t92+gO+2QjyepZbILEbOv
         Gavlo7OPHTYAEd/cJ8AYtA/u8KVZg1BsPSGWLvOZ7IHq2GhLcKtJbeVISO9XEzMHHdMb
         EKh3xKQTWLQqEkWcECc1teJOR7t1cVuN3ojR7OI5fz52PCCPcRCyqRqvoT8H6NiMu/fS
         3dDRzZWoFeVb6CEXDWu7J8hltsCPwaFYzAPwKr9S6dykNHafg8cPnsQa9I18xCJ9xP2W
         0LJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7PneG0fqTR6unjt2+Q9C8pZw5LfVerldIFV/WfRCFUtd/+/jQ/NVMzSA09yZfZ2YIuX42dgm7+QoLa/o=@vger.kernel.org, AJvYcCVSbBZKh4Hj19ud/fs95fP9U7YuZZiqmBDOdn43sKtugewRuQTWT4tTwKFk1fu622mrSaHU0s+N@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuUEGL8mDtV5iW8X8xorA3ombYXqisdyhrh4enRZyg+BnhYZH
	9IjTSXMv3kgf2Qa5aQe90JqJyIDIEMlaeKAm8yJQK1J4go0EPo5bqCz1yQPI
X-Gm-Gg: ASbGncuI7423aXzwC+oOSJduqw8hnsU/db9zykyqtzRSEcZNz6D3UwZkv6NCJwGf6wz
	yUDcHlaJFwcvSjN7rY/w81Gj41bVdxl+jWFm8PREuETpTgQwuwH02jIGpsJLPoyRIrSvjkq2l7O
	V+SpeLk6vhuExHDdJGB4mSdVHOSRsu3/NJMIhjjF9iDwlNInj0pVgZQGe3KucIEIJxrXGS0LskM
	2InK1+DuTvB12O1nOVXAasgbZpfhxeCA+NkWqmqPktn2qc7pLnxAQNj+Wp+FkECCPC5OxmOv6dt
	3SPv6DB+YsKABOsejc61JNlZQ1oMLHBij3pNiPlbPSm5vrzbX/uBhJR7pMeLj/4VOPqg/HD2UOa
	09fVVkMNWj/c=
X-Google-Smtp-Source: AGHT+IGXx8ir1+EZxeY6N5v7kjSeoMSS2MCJ9pG/fcIMmWsjx/6j0N5nIJirlOL33zDZIryOayb8uQ==
X-Received: by 2002:ac2:43bb:0:b0:540:1a0c:9bac with SMTP id 2adb3069b0e04-543e4c32548mr129480e87.34.1738096583093;
        Tue, 28 Jan 2025 12:36:23 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fcb0sm1778361e87.55.2025.01.28.12.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:36:21 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Tue, 28 Jan 2025 23:35:51 +0300
Subject: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
commit 129134e5415d ("media: media/v4l2: remove
V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
no-ops, making cache maintenance for non-coherent dmabufs allocated by
dma-contig impossible.

Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
{flush,invalidate}_kernel_vmap_range calls to
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
buffers.

Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28ce0641fe726e63 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -427,6 +427,17 @@ static int
 vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 				   enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
+
 	return 0;
 }
 
@@ -434,6 +445,17 @@ static int
 vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 				 enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
+
 	return 0;
 }
 

-- 
2.47.1


