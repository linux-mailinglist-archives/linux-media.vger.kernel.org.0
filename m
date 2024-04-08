Return-Path: <linux-media+bounces-8824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC989BBEB
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 11:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3494D1C2210D
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 09:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF75C4D9EA;
	Mon,  8 Apr 2024 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NPb9VrVM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B428482E1
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712569096; cv=none; b=ZzOBJdpko1WGzJmrbFaUc+OQkk0K7cMeA4N9pDnQgu9Bz39TrmFqUXpr/W1HJduQ04aObp8z2/2fWLWY0NFmTlRH04+WwRajg19/2AllKoVj4XN7x9eK8zExlxWn3qjGMrZG46VkBOdUaQ0WgMWTPYWk7gHabV0roQsktaAxoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712569096; c=relaxed/simple;
	bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auJnvSWCAnvQHzvWemreHvWOFF39+qwT9t8I56Cdw3PAz1SXO4hSVBvgXwQ5HWYfOlwR5UUgNS1PdXt+AZnRW5eYTTciQYfH0C0W2VYrLuU4vP4SDidvwRj58VHsM/I8KgfRke/1YwPaWFpcCYnLfair9LBa3tNaAYIRa1jbm3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NPb9VrVM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so1221207a12.0
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712569093; x=1713173893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
        b=NPb9VrVMYxbdremlmpcBoFxfPDFw5gTLF2QTwhQaH8Xi6Ph56PcSYWKoLeBe59uo3E
         Kz7WFjk5eTJrf5E3b/6OltU2gvTrpbY0ROyQJHA+pkA2zcDetGvFdpbgQVX83PZ5/N0A
         JRIe19DGWw0hP+vZJuGMEXnN/L2bvySp3ZaFpS/TecKHswcUrTVjlL3z0uqRpBCKM6QK
         UmDdmoinCRlfuR05mH0mVRvJYFSOSzdBABh3ww7J8gWpsYCjo9Piwkz3MAgxyf1mDI5v
         JSBz7/SLhc9UwVSnWq7KyKx/R2OWTzW5w49+PiOnmU731cyGQaulp0iDqDPiKfkQoosP
         VG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712569093; x=1713173893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
        b=bXdal62jtG+a1cbt0ezVO3Yn4hFTP5RQ4ETUf3cAU0u58eg6ACFsgN4Iyk+xHLlTji
         vzGk5aMEtK0e4TWvZ6EWYO9GoqeRap9hq+dgIBGejbWXqZOINRwUbKtSKeeDlq0K6VBz
         35pTlH+QRL6sgil1S6E/MCLwNqmHYmhAGU/wARB6WcM0feZtc7EdNcoeDHfn0o+rVh+n
         kgh0/UdJ9sYDjMekY/X0SJqNlJU1hxtVVw4LD4ywXm+lbfiau9mjJNhfOSwRMAdaCqpw
         623qvwT0/WWj4AcsI/g1eE2PHLbyr+KCHbPF3wL5C6u2iYDH3diAGHcVXWQlo1RtztHO
         RKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9LBRyzG3OHKjLEO1xXw76ltbo27+YIHMkyHyY+6JLXPmabb1mMB08b96MF+1Fqcdpj325Ua6yP0EkraI6B57wo5lLjL1Z2XP2yg8=
X-Gm-Message-State: AOJu0YwYnm1+M+yCmdEndAS2G2TzzQoR7tRE26ERgnsNNIlHLV89MXkk
	IFGkwVmA1CFd5dEuc2DHRw1xs5anVvv4F/aAhVyXKLAVxSETJDTuwXdIsrOXTdlVc8tI0HAcbgN
	+
X-Google-Smtp-Source: AGHT+IEYUxmFx883FdaPSd6GReaIHMgqz54jpNmxo/069Pc1WV+2FfwQmDbrYRFO0OGtj7S/xf4JHw==
X-Received: by 2002:a17:906:53d6:b0:a4e:8f73:6d5f with SMTP id p22-20020a17090653d600b00a4e8f736d5fmr4562108ejo.66.1712569092719;
        Mon, 08 Apr 2024 02:38:12 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id ne6-20020a1709077b8600b00a4e5a6b57a2sm4175803ejc.163.2024.04.08.02.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:38:12 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 11:38:02 +0200
Subject: [PATCH net-next v8 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v8-1-f3421b58da09@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
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
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712569087; l=1876;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
 b=4WAESX8DEdgb0LHBGuXuYqy64h3h9/4ecp+e+9P4Pv/WoeQSh43Dcrr0OIqVYtl+8ywfstiNK
 3HM2D23qidDBgm9m1M1r9ppXZpD07onXSmxFAwvZvl8YqJHO9eSzosu
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds accessors for desc_size and cpumem members. They may be
used, for instance, to compute a descriptor index.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 12 ++++++++++++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 05cc7aab1ec8..414bcac9dcc6 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -132,5 +132,17 @@ size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_avail);
 
+size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool)
+{
+	return pool->desc_size;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_size);
+
+void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
+{
+	return pool->cpumem;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index a7e3fa5e7b62..3c6aed0bed71 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -26,5 +26,7 @@ k3_cppi_desc_pool_dma2virt(struct k3_cppi_desc_pool *pool, dma_addr_t dma);
 void *k3_cppi_desc_pool_alloc(struct k3_cppi_desc_pool *pool);
 void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
+size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
+void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3


