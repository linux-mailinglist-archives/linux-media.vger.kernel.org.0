Return-Path: <linux-media+bounces-30730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42076A97555
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4F31B62739
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 19:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F42C2989A5;
	Tue, 22 Apr 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiZgtHuX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA861AE875
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349591; cv=none; b=idTD1lhxb7Babp83ZcWTfaZ1V82A1ovDDwdhJxWqRslCkdgXJefMmNNjYNkqmUUhjejoVtprBtPuGwcMfz1CdQZXbAKaETww3nJgr10Ot/VngADOR6ySNo+VYkCNl047VihPQhP/ogw9SXj06vUgTHacg4sFaVR6ki/ObnBGwjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349591; c=relaxed/simple;
	bh=sfBmd1OBbJI2abcZpauJWCnwwx49LFyiSAV6mfejFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWfbou8WH0F9WSvyVKlo9sHx0a54nlVRHV0ODwr3IjRjIAQHwDTqAmGEUibrLExj3juUV0eY4SP27T8iMLYq2nHa4rE8xYxOnE6nxoRCS+/PbjCw+T6jGftHkHlbmk5LBCqlJPLFHRQmqQWczqY7tLX4MYR0gsOe9VdgKe2Jg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiZgtHuX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745349589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
	b=AiZgtHuXKmhHPdg+IxHBFxA9eL3pjXeRFJS98xrxLxTD96GXR3IkYqJqkza+fWr3xhc/+U
	lbKe159Ku1LirNmG2LDnNe35jUALPElhCrCo1WgH4VgXzldkUzd5cAfryWtMcZc/6hy6LX
	am0kjC5/x7ty++fW7Shes/0ObUhMSQs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-chbgsJQRM8irb8ncgyrgDA-1; Tue, 22 Apr 2025 15:19:47 -0400
X-MC-Unique: chbgsJQRM8irb8ncgyrgDA-1
X-Mimecast-MFC-AGG-ID: chbgsJQRM8irb8ncgyrgDA_1745349587
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766e03b92bso110064941cf.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 12:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349587; x=1745954387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
        b=ZFwvRK0egsDPQMQpZ/ODD54IKEGdOHEpdS/rD/iE1BcdFr1MlY/SYzGUcsWAS3SV1b
         vejIknwbFcxWu2oZ3uxFLjViFW2htoZXd1Ggxv6RWKPjuOxSPu/N0Yy07OI3TJ1okOzE
         PWboZMWJUgLQNsmXCN/gOsX5SM9Fgt+f7KMrYLhPcNBNatoqm+AOJbsHsn63TpeKYBKa
         aZiLdQCtP1jmr3H/gT6sscUiIcI4OwNX64E+su9mR+xGcXyqzjxqW8uRfhuxXrTjO7G6
         2YENApHca7ENFzVaS1O2x/4fjmoLY3kwuu22Nh0wTwHoSreCKMRgOUx8quSc7upCxS2I
         +uIA==
X-Forwarded-Encrypted: i=1; AJvYcCUjZm8jx85qJDJeDGTmBU0eqLBGj2lqES/impsVt/+67VJY+KLdwTrPWgBip0juUKXw9KDxz9blwxwH8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJg7tz4D14SvOOl54QlvPZQd0AxPjIzc9XsVaY04DOHjUyNUdf
	PFGja0TVTSbF5hIJRNOtNZzg4EUzQ0u7/+qW/7rD7xxHqmrFA0Hb+4xKFWcdXrQQ/681eSBuprs
	ww2u5O+115hNkR4dzZS5vfIp9M3yzV4jhwsiieE8rAFfnbUJnuRdCZXQqKOHq
X-Gm-Gg: ASbGncvzsSX3uqo8xWKzuX3xaw7ATNsNDeA+8HpGhlomTvaXRY7ItNHRcri/FpYSm//
	lgvoZGznLJht2jztCgv4ByVsjBZP5r6u5ptN0+Rv1LKX4cdRTcmA3X+UyOhw8/ZKKviWOsDsQhM
	QQYHnstWT6vlJdb1W9t82QhneLsOSpEYl8s/loV+FzTJ4TIgtDz8+g0Y3xueu+uP+TRCqeggm1k
	NKHQEDzL2szN7duVIH2K/em6WoFTV3MqpJ2nynBHvo4xgY5EGof8GPdam+wf8rI7MO7V+J9mtr5
	2zKUtjWK3vbLGXKOYi8KyuTW4OrNF77t/D+NFwnXHE8=
X-Received: by 2002:ac8:7f93:0:b0:476:7112:4add with SMTP id d75a77b69052e-47aec3ac014mr303867621cf.18.1745349587301;
        Tue, 22 Apr 2025 12:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyYuKD1qhPJ8ch5NTGQwzuHZqeIg/SkaansDtfBqNfdQ+I0LBmtC0h/nphRC3WEITMYo7yrA==
X-Received: by 2002:ac8:7f93:0:b0:476:7112:4add with SMTP id d75a77b69052e-47aec3ac014mr303867281cf.18.1745349586902;
        Tue, 22 Apr 2025 12:19:46 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:19:46 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 22 Apr 2025 12:19:38 -0700
Message-ID: <20250422191939.555963-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
References: <20250422191939.555963-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

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


