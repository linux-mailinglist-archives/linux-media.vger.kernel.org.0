Return-Path: <linux-media+bounces-9201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D08A32AC
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 17:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7044D287D1D
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 15:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5CA148844;
	Fri, 12 Apr 2024 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="au4W21XD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FC1487CC
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936335; cv=none; b=KD5Rlo1Sipp7xEw6cKSK6CtwGCqgJcBgdgi+GzO3ZQw9qF358bJ1NB1NhViV0Vtqp5fw0aZ0OsX+oSJ8cSylqgpmHgd4+0UHsZuMMLtXnzW49sx113VoK5U6q+fAqgfS0M3FwJhhzQet3faaedfQ0I418HR881zqsDV0XpFFys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936335; c=relaxed/simple;
	bh=D70tecQdxEFhN2T90LYAjmlmzEPD00PhK6njTdKkNcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfWL2kvjCoNeeDtnZ3vxOcFfTyhEMi5utBQYubSf/HDLmsKLhQJxEWmWt7A7qUb8s+ON94fmxdtc1THUVx2OWCLW9TwLs1EFzwuqGpdIuQLlITPC++SXijNtENJjzGWVFkH/BmOj6T1qQAihEDKlvFutJ24FjIG+qCCOz3iRfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=au4W21XD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343c7fae6e4so782848f8f.1
        for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712936331; x=1713541131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlychnL65xg4rRD6rFMEjcsL9jG7kDN0jMkphCm2a5k=;
        b=au4W21XDyzU4kJh4/PlpR1xIQ2eQOKouWXn21H1Q60U1g+IH8x5pN+b7XeL+LNoSvq
         irg+ZNVT2goETRziXoq7874Ti8dLLJHfUDeQf/Qa4uUDlBnQwAiJkaQgk5Rcx8BK+rDu
         0bDsWdlJXvJ4ZrLHWbYmjz3gyPeWh0o+BizeIcio1lSksQ/q5gaokAVgD6C2EA1b6L9Q
         QxfsJhrfzfI/2pymBkZcuRSXrhMvCDLfi/o0JujbkdZEKNTLU7NnUYk5FzXeDS9XKKGO
         RHpaYLPhlBv82YIA84b3zqR9ZvD39mKBBBzePUcauSnCKCOBWvq7/rZmtK5ueu/cUjlu
         62qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712936331; x=1713541131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlychnL65xg4rRD6rFMEjcsL9jG7kDN0jMkphCm2a5k=;
        b=D/J66zNIbboiZuLu6OrEdJFsh0gZyCKEnE2DXVm9Pu7KjD2ynDjYubAGRmsvA5ttV8
         YUsYSCVLN5/AUMw3VDZmP2xSu34TX5TArQkKdnUJCkm8QnP/9JtJcMkvSGKVIfxwrXzh
         qh/tvh/BES4bYkpCH3f5q8NGFfq6AJXBBnYPneyM3isQRdIiOQNMQuuqjCckuiLrEg2X
         S8HSPXUTbDw2EZU+Yw+87MJ4OgRSv/t5uLCenrLraU9T5M2+4WtVN0ouCZRggkCrKNGr
         OQ3qJpsn7uORGfybRUcy87g3M4RzY5GxlcvvPnny+zS5lUY2cfy9Ga7AxA7+X+HRhdnR
         rbzg==
X-Forwarded-Encrypted: i=1; AJvYcCWtqxwsjiJnn5xlcAPr08BGUqrLHZBSv8t1M4W1n3cWTlC51rlKmCuwZO3SbAefJ2CIut2PVHXnogbAvz1y+WXLZmygECXAbRlKO38=
X-Gm-Message-State: AOJu0Yy2UvluBn2DqiD9b68qwJ3xnQYRKvB1Sh1o5BHIRRYYsgWrWRfn
	tBdeUWMMGwTj+RkQDXwXwJlAf436WLn8od6qzlutD9rZP/wrX8yRBJunGMUn+RmVZLLtNaY2oGW
	e
X-Google-Smtp-Source: AGHT+IFb2+KL5iLIOly5x0hIiJjAVufAzhuUpYpTYTPnK0Gg201imseBOxf7BnR6QWHdfgeK8CMFCA==
X-Received: by 2002:adf:fa8b:0:b0:343:b686:89a0 with SMTP id h11-20020adffa8b000000b00343b68689a0mr1969349wrr.13.1712936331591;
        Fri, 12 Apr 2024 08:38:51 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id k9-20020adff289000000b0033e45930f35sm4545791wro.6.2024.04.12.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 08:38:51 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 12 Apr 2024 17:38:33 +0200
Subject: [PATCH net-next v9 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v9-2-2c194217e325@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>, 
 Naveen Mamindlapalli <naveenm@marvell.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712936324; l=4285;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=D70tecQdxEFhN2T90LYAjmlmzEPD00PhK6njTdKkNcg=;
 b=3nuWtDIz2tUECi5ze87zSnbefuWdEDPrkEy2/SGn48lAXiiZmrSq3rq+Se67PfmmmSqf5PT6q
 B8987UN2Q6pBRQXgQ2Dn7tnD6yeeM2qV3o19vKvsCGg7rr9+VjD3NgH
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch introduces a member and the related accessors which can be
used to store descriptor specific additional information. This member
can store, for instance, an ID to differentiate a skb TX buffer type
from a xdpf TX buffer type.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 34 ++++++++++++++++++++++++-----
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  4 ++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 414bcac9dcc6..739bae8e11ee 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
 	size_t			mem_size;
 	size_t			num_desc;
 	struct gen_pool		*gen_pool;
+	void			**desc_infos;
 };
 
 void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
@@ -37,7 +38,11 @@ void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
 		dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 				  pool->dma_addr);
 
+	kfree(pool->desc_infos);
+
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
+
+	kfree(pool);
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_destroy);
 
@@ -50,7 +55,7 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	const char *pool_name = NULL;
 	int ret = -ENOMEM;
 
-	pool = devm_kzalloc(dev, sizeof(*pool), GFP_KERNEL);
+	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
 	if (!pool)
 		return ERR_PTR(ret);
 
@@ -62,18 +67,21 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	pool_name = kstrdup_const(name ? name : dev_name(pool->dev),
 				  GFP_KERNEL);
 	if (!pool_name)
-		return ERR_PTR(-ENOMEM);
+		goto gen_pool_create_fail;
 
 	pool->gen_pool = gen_pool_create(ilog2(pool->desc_size), -1);
 	if (!pool->gen_pool) {
-		ret = -ENOMEM;
-		dev_err(pool->dev, "pool create failed %d\n", ret);
 		kfree_const(pool_name);
 		goto gen_pool_create_fail;
 	}
 
 	pool->gen_pool->name = pool_name;
 
+	pool->desc_infos = kcalloc(pool->num_desc,
+				   sizeof(*pool->desc_infos), GFP_KERNEL);
+	if (!pool->desc_infos)
+		goto gen_pool_desc_infos_alloc_fail;
+
 	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
 					  &pool->dma_addr, GFP_KERNEL);
 
@@ -94,9 +102,11 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 			  pool->dma_addr);
 dma_alloc_fail:
+	kfree(pool->desc_infos);
+gen_pool_desc_infos_alloc_fail:
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 gen_pool_create_fail:
-	devm_kfree(pool->dev, pool);
+	kfree(pool);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_create_name);
@@ -144,5 +154,19 @@ void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
 
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool,
+				     int desc_idx, void *info)
+{
+	pool->desc_infos[desc_idx] = info;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
+
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool,
+				  int desc_idx)
+{
+	return pool->desc_infos[desc_idx];
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index 3c6aed0bed71..851d352b338b 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -28,5 +28,9 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
 size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
 void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool,
+				     int desc_idx, void *info);
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool,
+				  int desc_idx);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3


