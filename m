Return-Path: <linux-media+bounces-8075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DFE88FB5D
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 10:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1351F272AE
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 09:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B4F651B1;
	Thu, 28 Mar 2024 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TUKHQUch"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41F43ADA
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618013; cv=none; b=odWyxNHtTw+Dc0F41kSbUoxWNaOTldIA8lVBHmaQpLTvf9YSOBUqtnbsxot6Es63X2XA0LzJPtaef3h5sUXOvd2V8D5kjJdFeSpDGPyI3eEVu0ncTM7tP6B/A24r8TXgKrMJ3IOoDMK1WrdUEBudyrieDQdJxKpnCvuQJQJ1G1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618013; c=relaxed/simple;
	bh=mxI3dtUqp9zmMAmwAry/PSUUjVo2cudQ7Rm8VoOQs1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YGMNSL9MW3Fedis+t4TjqwJaf6bCZ1+F5rj4mQMAYi3FakGeMeDs91tOl/BNxlvqb3BOGxYPmiKbymq4geFMsfD7e/dUS0eZv2/wWMXoBkQTgdZB6a8UmKHLXE3hV/iblwsg81dcCd8X3OJ+dgFjcHoZddgawQuBrW/zQEraZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TUKHQUch; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4148c6132b4so10399185e9.1
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711618009; x=1712222809; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=037yUICN8Zj6LjDic8LC2UDwvIudLoxg0PS899BrnwU=;
        b=TUKHQUchjhoO0nR/bEkcRvFBBLcQ+v73egJvFiDoFfZt63yLIM0MLcnqFDztLUhrmH
         6aT2E1IaMWlooJovSlDuz1qsNHVyxp/Y4KCciYPXOUE5Prwic6+MEsyfaIVBfmPk/GVF
         mvrKYJXIII+UKz2z2Ks2KUJPdKiB5AOSq0kwG48rOiSHCZmWI784qHlG/MBltGvU1Lsa
         Gc3KJ8Bpd+iXdYuFhWXm/vpGaK/xX9GbqUWFHIYXT8GkX0jnVX33V8woR96MrV6N+ll3
         p34r2+Ou7atLn2Zeo6MtjEL1xHJQ8JsPplmuv3t2vsq6+x6QPVopFiYLpiD8SUzSzuMH
         HCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618009; x=1712222809;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=037yUICN8Zj6LjDic8LC2UDwvIudLoxg0PS899BrnwU=;
        b=pzRIN0p/a3NVwmUkNoDB5X91iYyxWH4l3VfGRPb/J+Qg2ouijOGRsb4xmWtYFv3zeC
         kJA1Eub5Ha55EXlMyR0Ql3VwvIp2uPRGlGBuT6LhJORK9TlZCmx9YejTwx0zAcxJ2yM4
         SNC/DQ89Xe4yuyWqxVSj4yHHVdAqB9MobRD8qu7PNObUnSrjiyNAn6Jsq16+S6Ci3GGi
         DZMpj+XPVXBEDdh56hmrcUj0Rcf7HAI7OBcFS82VfTEHcxOYChWY/PcVHUYYptz6Vmh0
         WZqTAsapixRsKcewGSSlZT2zODaMtPtS4cWkTCesnmIe3ljgi7kqP8IL18OQPdHC5dnn
         lUZg==
X-Forwarded-Encrypted: i=1; AJvYcCXbYH6QDDnPlcrMa2W6o8067vAmpWN8o/4tzeH2HjgouCQRfz7ii2i9ZEqlQXvbELpKD8vDcVgpFAcFPtyHr22bE3KJF3a3bXGzwho=
X-Gm-Message-State: AOJu0YxuLKjLlnMmXqu7HI+7XcoGH9x10gzTJI7+qi4CajltiEdzHBzG
	IzQu4Qh6joHwwRRUGsKXdAoETW36rAVNB/V7riUnsz/qXiv3k8JdPLFdGiBuZkw=
X-Google-Smtp-Source: AGHT+IHLaIIbZsEZxQrLnlbH1qW6VXrNaf2xZGc7tS9bHD/eGEFPYn/1xJdx7j9BXHFyl+/lKz2TvQ==
X-Received: by 2002:a05:600c:4ec9:b0:413:4299:ec9f with SMTP id g9-20020a05600c4ec900b004134299ec9fmr1547318wmq.5.1711618009022;
        Thu, 28 Mar 2024 02:26:49 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bd17-20020a05600c1f1100b0041493615585sm1673414wmb.39.2024.03.28.02.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 02:26:48 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v5 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Thu, 28 Mar 2024 10:26:39 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM83BWYC/42OzWrDMBCEX8XonG31Z6Hk1PcoJaykTa0Sy0Yyr
 kPwu1fxrSUUH2dn5tu5s0I5UmGn5s4yzbHEIVXRHhrmO0yfBDFUzSSXmkupAHvTgh/LNyxhBIc
 letDBWWlbbp22rDbrlcBlTL57dL9GTLG81vy5x5iuMdF55o/gmOkSl+39O0s0QaJlYh/V6WKZh
 nzbds1i8/+dMAsQcLxwZ7wLqAR/c3i7RpfpxQ/9hpzlDowEDlx44xE9OmeeYNQOjKqYNhy1xmO
 wGp+t0TswumKUVUagUait+405NDvqknRLbSDPtf2zYl3XHyFW71IAAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711618007; l=2325;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=mxI3dtUqp9zmMAmwAry/PSUUjVo2cudQ7Rm8VoOQs1o=;
 b=pjxRZGc0ZNpjhrrYX6GeGUAvpeXEIOE/nsO2hVShrS5g59uZ1sRp2gLtRwpsGynFeMC9ZhpZa
 6vct8jvI5BHCfrrVXO25rVE271WkqGcmgRGQbW51w0gjb7g5yqOrSao
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v5:
- In k3_cppi_desc_pool_destroy(), free memory allocated for desc_infos.
- Link to v4: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com

Changes in v4:
- Add skb_mark_for_recycle() in am65_cpsw_nuss_rx_packets() function.
- Specify napi page pool parameter in am65_cpsw_create_xdp_rxqs() function.
- Add benchmark numbers (with VS without page pool) in the commit description.
- Add xdp_do_flush() in am65_cpsw_run_xdp() function for XDP_REDIRECT case.
- Link to v3: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com

Changes in v3:
- Fix a potential issue with TX buffer type, which is now set for each buffer.
- Link to v2: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com

Changes in v2:
- Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
- In am65_cpsw_alloc_skb(), release reference on the page pool page
in case of error returned by build_skb().
- [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
- [nit] Arrange local variables in reverse xmas tree order.
- Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com

---
Julien Panis (3):
      net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
      net: ethernet: ti: Add desc_infos member to struct k3_cppi_desc_pool
      net: ethernet: ti: am65-cpsw: Add minimal XDP support

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 536 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  37 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 540 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


