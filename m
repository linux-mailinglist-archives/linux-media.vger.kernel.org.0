Return-Path: <linux-media+bounces-34441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E55AD38D1
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49911887376
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BDB29B79B;
	Tue, 10 Jun 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+vb77v1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E029B205
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561174; cv=none; b=Hfu0jpYyalM8PN6EVsmfUlUlCfXeQ23wJqw/LoPA060by/SpXawOM6Y6b8ZSQLMwwzuwd1C/U7QdktOlCW1ya5eB02KbSWjx/yAwPIEn5YRXhNkdiOBim9Zdky0uLCV6vWDxGvavbLCUO91YoVxSdwR5catAb+tuUsH74NHKd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561174; c=relaxed/simple;
	bh=g2hxjQIwU4XI9nVj4pbjHKw5DlPbghUsMwq8TZIMC2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aB5UNYiUkceGglTkjVIZEOj5Ugjsmx3dKx6QfEmaB9ggZ6fhVKSePvBIlQJpp06SVdZHtYDiumk3gYipsc958ajGGndr0PtKqez1iUPL5K6R/6DfWk8IiBXynCdoh4FrKWbXAafX5n3a7ZoxsXI8/E642043o96JJkR/xdgf4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+vb77v1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lW5Zu8Mwjs06+WvYwa96tsCt+Qd1PG+1Iig01KCwGYs=;
	b=V+vb77v1jTNqX16G1DrF9vimeLrUIEqoTNCVAr8cCoa1YBWo5ccDgP73CjaHpbjG9Q+/Xy
	ZjTABgEUnI5+1YCnjff0Ac1B47y5Qm9S83xlzbr9Ht4m/yMK0hxybix3UHWPY7uGsAkOAn
	XB1ocxd0VzFXuSrEEQS73Wufpjl3Va8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-E1Kr-oP4PiCbgU69_1k1qg-1; Tue, 10 Jun 2025 09:12:50 -0400
X-MC-Unique: E1Kr-oP4PiCbgU69_1k1qg-1
X-Mimecast-MFC-AGG-ID: E1Kr-oP4PiCbgU69_1k1qg_1749561170
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad1f7f175so92251926d6.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561170; x=1750165970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW5Zu8Mwjs06+WvYwa96tsCt+Qd1PG+1Iig01KCwGYs=;
        b=eHkCl/7JjnHrzEfn5TbT9hOta1FodzCvG1QGBMpqYKtLQ/0DbOs7KCNT4w+vZxoRBu
         hbkCehi0LsKfuV8heWnSjvv0oMtxuc1Zj1UQwlYk9alr20LctRmk1SyxE5TBZm7pot5k
         F73mZe4fz3/UPVs638791Howtg71k9FFB2cxBwbnnqO6G8jqv6F9OlKYvH07LG1CctID
         81SdiR0hKcutTdt+JZKceThIdCdbOgc/WlWQl+B48WjwQJZ/P4FBHxOei/4XqWyLN1yW
         snr3bJA42ATG/BFBAQoft2p+4dcFR7VXl9ONmstyOYGgVH0UpEAkwhxwmmh9nkZ4kIC/
         GSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX09L+aNpXFydh9d1QtoEoO2LYLNlpBN+orX2OAI7ORj0AbqgtwWt0KT+nXgBixHKZ3E8GGqKpZccdXwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKo77qk/5/uziyYboPSrVVCfbK1AZkFqboBLmf9V3v3VszIV7e
	ss7ZTvFu5PewH3oftezt3zgMAoqyRRkefB5FFUyk1Mh1lurcFPRTcWZa32GSF/k2u6G8ivFWfpg
	YcbnfIGPhxiRlxi2jVzS6RuqGGlzyoyTwBlIjM2371V7ZFaz266vHA6u9r+xET1Vl
X-Gm-Gg: ASbGnct0vmXeRvmESC0LpLgrQcrqr1WjuMPrIZ85q81W0cxuyWUgc4F3wVp897sl+sc
	EakAOK+sV1PQKBlTsJ1Z5Y7FOT8aE7sSySLwtlPUlN4StYPwENmAL8r1MPlPD+MdCWEy4dvz2U4
	8QqeLJDjecwtZiVMXlUiQIfyzXAlOO0mqr7NgIgE+kxTlSCtjWEvJSioQ0bVYdCPyU+VVdS6DLe
	pHBslJ0YhDu31VGQso0DKwJ+Na/K+Nz3Qa+V1NotEmkDsIM2HXdDwgrPwGAXzEG80k5c/Gw0xFo
	AqKPp6ds+p9UJjOIeOf+AMQAfD7VVH4mwCIkq2tlEbx3FmDoVSkcrA==
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id 6a1803df08f44-6fb23985764mr50853026d6.17.1749561170085;
        Tue, 10 Jun 2025 06:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWpUl5UmfIgKGDaJZjXVnPslFU8IB+su1QpZ8kf5RQSpb3U7fmC4kUy6BTQuOtse6w0v5xhg==
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id 6a1803df08f44-6fb23985764mr50852596d6.17.1749561169668;
        Tue, 10 Jun 2025 06:12:49 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:49 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 2/3] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 10 Jun 2025 06:12:30 -0700
Message-ID: <20250610131231.1724627-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0


