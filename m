Return-Path: <linux-media+bounces-8076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EFE88FB62
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 10:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96D051C21429
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 09:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B017BAFB;
	Thu, 28 Mar 2024 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aaU0zX3J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E991E57895
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618014; cv=none; b=koqO/Wy8fJNLtNRI0k738GBLIeI3Sh998G0Dktf5lYaMYkSGYSlXzKMLsntSBSQrf/ff4QDc7XBclQdP1S/Y6SXt3huj1oL2Dy7fy1CtSCSWjFnFOqvHeBd42v9zzla4rW+hw0ecBvdt4aJ3zi10nF0b9MyJWD9nGcIWYDHwExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618014; c=relaxed/simple;
	bh=jlmDA8j5BPsGTQCQEi11/ZrPzSbTV7KDqXuvMXnrWBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AiBo6qSJnkd6W4F70EKXFlmJSxOBoyAQERk+x/D+g5b73ZapfffNBC7ff6HX/rDJswJsnGXNDd196F9IFgnjLKugciX2LdNicmy3Y833vwhtjkvFGHXUZd2UXV4kRE4KK6m1d3C8OVCDhRgqm4kx+UmrtS/pXP2SVsRESO8Mjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aaU0zX3J; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4150cd01febso5102155e9.2
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711618010; x=1712222810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
        b=aaU0zX3JWGUS1Az17VyjnGrFVQn3u4TEqx/hkcCRa0+x5Sb8+EehhQbM+rrJ2ZN7lf
         cYCvP5b7yn7SC+u1ub4ZqkvgquvpfRYY7YcSjK4YpMA2DMOmAi1o2wHmpIlt56w2SmIF
         0N2lbqlTadx0xGhUlC2dPzu1ZE5u2VTz5XpyfkqaTzD2yMhDLKNatVFBHNQ7EHrgLDFN
         NjPN4Ix3xChlpf517rhauIPjJw7dknJ1pTsIZiG47BowpdzTb8WQRAFIbZoSZZekkqYb
         EVftbEB1FlH1H9VdcPuc+IZU+f7gLaFC+YVv6vRXp09khB58aczMRFhdtzYxNZdIjw6D
         kPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618010; x=1712222810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
        b=iPHnl4qJRdAgfBK5M6SIipRgHvUierjaa7zC1+pZyQDIG20VH6J/LikLoyv0Pdrpwm
         /+/RTAHnsyCEOgLSxpggE5zg3cyJVjO7GVHYnuIl4Hmz90NfJKSKYlU371l5WI9m5N42
         L7z6Zu8o8H6A1puqkfl5fakFhj0MrZt3XNlsDxfR/9p322nRzPXxfqksKhLwcJMPvGjJ
         D4VZgQINNYCS1YTr+kXerjAl1MFrIZTY5dRi4fcHHC95H73v/bjOja5rHgywhUOxJO5b
         F1vuF8PbRpPQjDhqd/FPwUi874WkGDwtdNteJdpCvN0hpbf3Bpq16wjgR/FS4X3YayOv
         C0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXTsOcn+f14xa4dSxvGzkuSoD0M+KsiaUwa6Wczrhlq/t7iQwdycv++K2KMGg/LQtVVFZi4f4lX920Anhkpsq0WWI7LHiygt4SMjdM=
X-Gm-Message-State: AOJu0YwK+gWz0gG8ns+qs3g8GbRIra0r4FkyyyG3kgVCy8uxwH9CxqzY
	KbAdjtmO6DrfQJKZXGCy6Qs16M6c24YpHM9YugiCjy1teSIC5YDSKFb34IEXGxM=
X-Google-Smtp-Source: AGHT+IECjUgDa2k5UJylRjoSYSZ/eL8Rc0qvDSUr6znA15Wk0chOgtuTksxOram+qKPcSmAtYopzIw==
X-Received: by 2002:a05:600c:1c22:b0:415:456c:a17f with SMTP id j34-20020a05600c1c2200b00415456ca17fmr740302wms.25.1711618010528;
        Thu, 28 Mar 2024 02:26:50 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bd17-20020a05600c1f1100b0041493615585sm1673414wmb.39.2024.03.28.02.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 02:26:49 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Thu, 28 Mar 2024 10:26:40 +0100
Subject: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v5-1-bc1739170bc6@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711618007; l=1852;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=jlmDA8j5BPsGTQCQEi11/ZrPzSbTV7KDqXuvMXnrWBo=;
 b=4EO5M/QaSlfy71TX2T3KVkjA4QfRBdI4jxi2392RsNefCveULSjjFyy1hcKDNfud58SeMzlmm
 4oAew9FdeG+ATsP7Gv8bowf1UYRB0QwYtNNMn1BRDMYC17kQteIfwZ0
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
index 05cc7aab1ec8..fe8203c05731 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -132,5 +132,17 @@ size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_avail);
 
+size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool)
+{
+	return pool->desc_size;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_size);
+
+void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool)
+{
+	return pool->cpumem;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index a7e3fa5e7b62..149d5579a5e2 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -26,5 +26,7 @@ k3_cppi_desc_pool_dma2virt(struct k3_cppi_desc_pool *pool, dma_addr_t dma);
 void *k3_cppi_desc_pool_alloc(struct k3_cppi_desc_pool *pool);
 void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
+size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool);
+void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3


