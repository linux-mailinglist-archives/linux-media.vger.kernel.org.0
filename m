Return-Path: <linux-media+bounces-8808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9942789B842
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 09:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0E61C21AF5
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 07:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC162B9D6;
	Mon,  8 Apr 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ut/CwcMO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5E28DDF
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712560822; cv=none; b=bf1L0e5bBKtftwiTH7sp3R2vSqm3KOilMyVfLgxWJe6mmgj1+8a57b+nmQIzkf47wz/VClNcbceot/jPiDUWwpFLMZRirypTKAz1/Ymi7oQGZwmbfBHtIHILtO2TGxuyuii2PE0BSvfoLmPKUJ9TPXG5kHefRxH50UwAQwvrMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712560822; c=relaxed/simple;
	bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HYa7UaTpxpdtn7iPQqHuKhs6aSEEMWkMykaAqIkpr4As+wVgtgkFQ2VFtP1sdmbpJnpB2zzVaMN1rNasYDTsHyNIYi4SmyzmMu+J+6Lcmm1Q2ucSqIvLGAn84Hb7tiSwziSKVjm1rQ8kDITVKjZVgfK8BrISsfv7FaUyQonTQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ut/CwcMO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e6646d78bso275848a12.1
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712560819; x=1713165619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
        b=ut/CwcMOQnmONrYe1Pu4368W7pLJ7ZoddYMjS8TU5yBet+hi0e04c/DQMNMF+RdyC2
         EDRHaaqeJuruLqRDl0dlhQMivbc38km5A/iA7KvODFb7e5qxVDXzV3A9lzVEg+bTx2XO
         boKmKVZ7RW7VggakYQB0ybw1Wt8y7egwboB52KNwB6H4bGO/iI2CAZl3Vqnw2Gb28uGF
         AIGHWQow6EYUIFbpL0xB2MwqpMBCLQ+t0YWkTLgD7qmmGWKj2FbQib7PRw5hi9R1avrf
         j5Ankz6Ch/t0SusoKENl7Flv0/n3HXKRiGZZJPYYnrYnO6iCr8gKZeRrLkrNzgskaVwb
         8v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712560819; x=1713165619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
        b=vaImuNOUQ0K/mIKiDQycP36hXfi4eM9We/zy4F0YKw51hIPXM+Xk5AZbfAclYh7iL7
         2AXVXiHraaj01g1KRowjXNW1qVxwrnyLKipUUIZ24QoOHAZfNCfdHvg71+KnDJ3+8S6g
         fSwJGiRD56ohJXVpYCKyy2NoXDFUbleREKIt9fM258N+EStwdTw0VX3XDzDZNT5dzyKk
         D2syninF2TXkseyYqdt1nwABO9bOEEqXP7dqXkBaHAfTtJ7eykD8JzGQ7/aTB5J9QdFM
         GmnrdOq7Fz5N7uuOP3u0IcLhQld+odvxOOOEys49wLvMaBU/g8G2MCvZj+6ylujUskxe
         wsWA==
X-Forwarded-Encrypted: i=1; AJvYcCWKZgoxLOmI+kCNreBJ1gnGKYlKUzDoPh9mBhVBGfSnWjpOvu3ZLKT9xwrbfMrJYyz4TNvltjrvhT8jAfwhQIP1+IBxVmHS5cL65xI=
X-Gm-Message-State: AOJu0YxMU+HHLzp9sJMCq9/inHClSKuwyFH8H1AMn8toSNKgn3/Iw5Hr
	cjFuaqTn9PBUr68FGdAwnJXFWZJyXtk5AEN801pfF5AqixCTaMZAx6nHTV5n9Jw=
X-Google-Smtp-Source: AGHT+IF0kh6f4LCoO8XaUxxoMZyMhA9PrnS9MID4gtkTb8ja52z7juPl2lmmQOBdb0ujdAdjIVDLIw==
X-Received: by 2002:a50:d518:0:b0:56a:2b6b:42cd with SMTP id u24-20020a50d518000000b0056a2b6b42cdmr5269399edi.3.1712560818422;
        Mon, 08 Apr 2024 00:20:18 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id p15-20020a05640243cf00b0056c2d0052c0sm3738769edc.60.2024.04.08.00.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:20:18 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 09:20:05 +0200
Subject: [PATCH net-next v7 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v7-1-c3857c82dadb@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712560813; l=1876;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
 b=xyDc7MTGUEAiiYPE4m1bVVBppYmQmR1WgbLv1snsJflqVNJtqVunkK5hV0iToiU7ahHYzrO48
 fSjkcOPhdOmAXTO4/jw+T3v5wAPHTIgTAkDGZngmQWsiLLk+7iUkS4y
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


