Return-Path: <linux-media+bounces-8809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E9C89B848
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657F21C21783
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 07:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0644C383AC;
	Mon,  8 Apr 2024 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JC9CWeKy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6442B9BB
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712560825; cv=none; b=Peiyv3UVDpVAlqb/b2k49vegb5h+a/uflYIkmQqx5kKbPhzmPxfbX8QyHnfBJqvb3ULWLFf4DCfHdXrHsRfK+n89xW5nasz6v0yz3DcIDGll/0QdERgEx8NAa5QotojLjgoVfWOXypepXm4S2F02bOKPz7zlCkZ9sLBIOc4PwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712560825; c=relaxed/simple;
	bh=JqK9X2irpyaetN9XKh1gA7fVuUNk/TXTEORE3XbD6OA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWIfoHXG/Q/F2VB7BImWMiKwX5jXoEuC9MetNJ7kDnrLGLAHaA6DZXNEE9lrmj4LjyCAtnwa7Wy9sHUCxT8qymAtZcejKETNF5NpRidYN6ApDWSOCNF+z4E9RmNCZXx0rm/8JduTn6ZJhLdcsWFyQrfuF5Y6FVwYzELTUpwP2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JC9CWeKy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e2ac1c16aso3527253a12.0
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712560821; x=1713165621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McEKzkmjcf11I9OhkP/1LlQGEjlZMSP7VYzBPCvWmZI=;
        b=JC9CWeKyYC4hHLxTlAkLQUAGehclHuac26mie23i/7nT2pbpgeE4IbPeygFCAg/iSO
         Kr8+kehJbxsKQByselk1HEBVhobDzSEkon9BNMcopmSPk8Rp6enuLviNgtugNp+d50W/
         HyQxSOLUm5roi56RzlJasemDe0OkkmMUtei8PE2ygMvZrrPLqfjEN+tzvgR54446kbww
         g2YgiqQ3P9cV61ZTvstEbkGuWFmhP9CRZSM5/Dkzhor5IlRV39NwIM11M7k/9Peg8cHa
         736Uwb1g8t3t5tiD6o682p14uRCsdByn6bTeoqwg10jWqfoHQDLu8Nv4EztDAsZB2Kwq
         rxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712560821; x=1713165621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McEKzkmjcf11I9OhkP/1LlQGEjlZMSP7VYzBPCvWmZI=;
        b=NB0+jDujZxEnplhDtfRJKJphc2GOigfYiQhl4V0eR04y3yXA1VtJQWnvSUtgPUOSSk
         abWc+DYhru1f8icxhYO2XfjJAAj4jHtE+CevEpmglWNTuLGMIo88uKa8iVyJjtcP5/He
         5k+Z0wJsHJ0JnVlxILszLiYwrXztLTBNgw0R/IHvPKPJw4VtB3piFmYWPB+bqGasSCD1
         kvXaizMYt/wU1dE3Ap0iExxgwkIrWVv7UoRZtmQ2jGcVE7guPSRqKTXIPc8onBL6zly/
         SR9lCifOTO3cRD5AS8YvlJ46dIxc8xsXUMTZ7F7FXUnlR4mqRP5bTxZGeLfzpQHPzdur
         dPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwHZjmJFJoHl6XUFpasAcVxby4yMiw7MD+Q+sMCxcY+MwLGH5ST3SoYI7RA0fwGaCyTrYTfAXLQPdDji9wmy91/BjY0j0ya77zhO8=
X-Gm-Message-State: AOJu0Yzj8gXcY8clNRHy1qJ5nqqrxsnGFgscGk+ToqjzUq4VThWp5ZPI
	7n3S9sA4SvLyH3g7FSMgOxkXoOuZNUrG+niR+GrhwVw54pd8vp9kV7aW3ESh3EU=
X-Google-Smtp-Source: AGHT+IH5LcNBBvazaEKssJnMeMAyotZ96eCbr8ZzTbSTlyDpQMPwItgx0NclxJA6qJmSyFP0VT+hUQ==
X-Received: by 2002:a50:8e03:0:b0:56e:2356:bce4 with SMTP id 3-20020a508e03000000b0056e2356bce4mr5481687edw.31.1712560820897;
        Mon, 08 Apr 2024 00:20:20 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id p15-20020a05640243cf00b0056c2d0052c0sm3738769edc.60.2024.04.08.00.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:20:20 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 09:20:06 +0200
Subject: [PATCH net-next v7 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v7-2-c3857c82dadb@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
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
 Naveen Mamindlapalli <naveenm@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712560813; l=3534;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=JqK9X2irpyaetN9XKh1gA7fVuUNk/TXTEORE3XbD6OA=;
 b=V6wsmdiuVtXEhylg4ufuTkzOxoYGkay/Fm0NiYit67m2pLPiRNcrwMO8HUvw8xY2yucDdelut
 n9Cq5N0BRJSC2ZAZYtbeO6SD/aOeGAtGY+3o0zKSVsXBxWtXkHv9QnF
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch introduces a member and the related accessors which can be
used to store descriptor specific additional information. This member
can store, for instance, an ID to differentiate a skb TX buffer type
from a xdpf TX buffer type.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 25 +++++++++++++++++++++++++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 414bcac9dcc6..3c4e576a44db 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
 	size_t			mem_size;
 	size_t			num_desc;
 	struct gen_pool		*gen_pool;
+	void			**desc_infos;
 };
 
 void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
@@ -37,6 +38,8 @@ void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
 		dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 				  pool->dma_addr);
 
+	kfree(pool->desc_infos);
+
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_destroy);
@@ -72,6 +75,14 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 		goto gen_pool_create_fail;
 	}
 
+	pool->desc_infos = kcalloc(pool->num_desc, sizeof(*pool->desc_infos), GFP_KERNEL);
+	if (!pool->desc_infos) {
+		ret = -ENOMEM;
+		dev_err(pool->dev, "pool descriptor infos alloc failed %d\n", ret);
+		kfree_const(pool_name);
+		goto gen_pool_desc_infos_alloc_fail;
+	}
+
 	pool->gen_pool->name = pool_name;
 
 	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
@@ -94,6 +105,8 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 			  pool->dma_addr);
 dma_alloc_fail:
+	kfree(pool->desc_infos);
+gen_pool_desc_infos_alloc_fail:
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 gen_pool_create_fail:
 	devm_kfree(pool->dev, pool);
@@ -144,5 +157,17 @@ void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
 
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info)
+{
+	pool->desc_infos[desc_idx] = info;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
+
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool, int desc_idx)
+{
+	return pool->desc_infos[desc_idx];
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index 3c6aed0bed71..63b96fd53b13 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -28,5 +28,7 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
 size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
 void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info);
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool, int desc_idx);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3


