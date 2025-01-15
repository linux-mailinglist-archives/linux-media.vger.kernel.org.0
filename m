Return-Path: <linux-media+bounces-24805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0F1A129CD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 18:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F72A188ADB0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 17:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9C01D5141;
	Wed, 15 Jan 2025 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lluBnIVU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A41A76C7;
	Wed, 15 Jan 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961935; cv=none; b=kuBSB1bENmeKhpahAlll7BwlSgNUsROnpdIOrTylTYUuKPHOhioVkyfKV82odVJSotW8owfjrkUdx5OiPLRnG6fFT3e1v0sGgnTKG9Pv9BUjqoutMwyc/1PWhuHWhKAJ0yL1HFc+QZjlj4kUuNN82dk92VuIi+OqlmD/B+nutr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961935; c=relaxed/simple;
	bh=mlYRc6C2JKLmWHattYXyz8UKfy+cpS8lvLrsjq/bJT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgQMDbxcxH5lAQo47NGkFRaOCcY5gGIN8lYttwikU/dYkeZV+oDNkYmqC0p0CJJ9gU+gS7GwvMLsQ0jNRW1v6SwUPA6aNukvDOzWKlRY5N3V550CxqlAqcbFH19gCli/AGGxJvrF0fny4gdTtaZqQyfmisauvQiWTSe5Lln89o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lluBnIVU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e384e3481so27183e87.2;
        Wed, 15 Jan 2025 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961931; x=1737566731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HYJB0bgtbTOpoerPY9z51D+wj9so15vlFQsgiuWCBU=;
        b=lluBnIVURjsrlETMFBLK2BKcPDWWPFWkWrSkJqBtGmCAqUMLoFAUV54sW6PHzHb4m0
         es1xJhWhclmEKpJXZhJFcF52cFHWkMnKF8DZRLwEBxsntRJUshj3qomLoh8kmivpCFht
         4A2+xals5hsdTxqzgKSNKQGinKVGrGBouHdYQn3SoGIt+1DanrIVsrNnkCKDDR/tZD+C
         nQINkeM747OB1vrA8w7L3P8z2YwD3VNniiL9hkWNSfg/tA2hTpHfpJOkogjS43SmA4BI
         lncqoI7Cd4sAQoiYV9uS2Nv9oABX6WJvQZbP0m076OHAQq7IepKO80RWat1FuY8WUXPj
         NYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961931; x=1737566731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HYJB0bgtbTOpoerPY9z51D+wj9so15vlFQsgiuWCBU=;
        b=PxvjYq5qEFvlpBPt5Kxm9SWY8sv+tW5Yophd7cLWKXu4kOSapWBoI8bZRQ7Npvttjs
         +w0mhM5vhuy+9KHKQgebkTsDdg4GomR/3cAqc0/7onDAnUPi6hTZLYTxSe0qW1aS/wM8
         2Ms6FnExFxB2nY/mQVkyVJ3/B9gSvDrBvjaoDr1G5JE0esx21uA/+QJBXD82htRgKWsP
         KzbBy8wqkApVn1bYlhCVuClBAyif5osqHVGbScNWxs8TyeyJ3ZNydydLUZlDGZ6Iluq+
         7DeapaCf37BKVq961jZEA/bZCNbjo334Tg87/HuShiM3lL2gk4w7SSyoCUYLFj54jQPI
         ucfA==
X-Forwarded-Encrypted: i=1; AJvYcCW/zQxXHugBtlTL6Z5XH0NGoUQZJcN0jWwTDtbeHYfvXAe+sXx7Nwswx/0ZyOrgxWAC9DXojovy5mPEsrQ=@vger.kernel.org, AJvYcCWFcajDiAnVqv3BR8mzSL5jreOwD9BpGH31VzLzaHiBIbf32iAMUilB2hCvw8saw/LFx8/FPFLA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz411F+ZrHKs/8jHMN99eaDPrEakHvNZFkVXt9n65aL4n9xTqXk
	iAAjK3uwyBd1OiDAdZNJXbdgOmAIjumcRb0D+FDqW3xgaKBNHiKC
X-Gm-Gg: ASbGncvkJgrkszlsemvWfd7428wRGjuyidjSYOwnNAcH9EYfj0tSk9vNkiNLM36n4gm
	A1mCvd5BgGAno00yHjFGd4GdWKQNAEapUQ+6LS3/+rZIxO04ApJ0lTNYCQp6tmIdHg5c/dqCJSp
	O2Kn1Fn2/RFcqNTEfzUrJAImyc3+DFZUevET9c+o6RwPkwsYxfbJpV+o6JsstCmu5o9G+iL7tjy
	qYXQGBczNBc+VNtJ7Qk6+OniSjh+KcbTqWszOiYv1VcW6/IKEqR3CDirRGqNp+HHQe4HQ49v3ta
	d8lRBcmQySymkU230Z73OwmRUSZ+MF0GfUQKXcgPQoEdcEvQpPSE
X-Google-Smtp-Source: AGHT+IFhReerzg0C0GMOuDmee4BEEqa7ojvFKpwemJ7g9blemjVU9cqitdDPgbWYVTUhloDx1iqr8Q==
X-Received: by 2002:a05:6512:1188:b0:540:1a0c:9bac with SMTP id 2adb3069b0e04-542845d61d7mr10635824e87.34.1736961931138;
        Wed, 15 Jan 2025 09:25:31 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6778sm2105360e87.131.2025.01.15.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:25:30 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Wed, 15 Jan 2025 20:25:05 +0300
Subject: [PATCH v2 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
In-Reply-To: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
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

Fix this by reintroducing dma_sync_sg_for_{cpu,device} calls to
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
buffers.

Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..889d6c11e15ab5cd4b4c317e865f1fef92df4b66 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -427,6 +427,13 @@ static int
 vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 				   enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_finish)
+		return 0;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
 	return 0;
 }
 
@@ -434,6 +441,13 @@ static int
 vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 				 enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_prepare)
+		return 0;
+
+	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
 	return 0;
 }
 

-- 
2.47.1


