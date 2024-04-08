Return-Path: <linux-media+bounces-8807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C308B89B83C
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 09:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6A5F1C21B4F
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966F625570;
	Mon,  8 Apr 2024 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g/14daJE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E653428DD1
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712560821; cv=none; b=VhD5UwH0gmcxlsS0USNwLjFvc09kMzAamc/0YuWdIs8juOOAMQOXC4jWBSIa/aH8K9fInu3eefOkRuhNCMfQlqFYnfudivC+hQ22DJdGHTb/g2kp1IphCe1efYUhGAJRWo4a25vdR75bXfxiU0taOMmPTDBIfIxP845HXNzwznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712560821; c=relaxed/simple;
	bh=i1uSsLXWtkljlVD9K5i4/KkLIjH9N0qPb5HbIu0GR0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j1zOVmir1UNgPvgHK1NeZjJiWXrVCw8MqCJrI9Mq/24nEGEKkodZZ9jwm4WQd+XLp3XivSrlY/NhiNENLDEYBvzp9Ecw9MXu70nSj4Ib/d/GLQzNlt6oxJGouuioLsgRJbFIvlTtAYTQt7/GF1Y0qKqN7s6QNZJ2uWl+d57oZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g/14daJE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e32b439c5so670410a12.1
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712560816; x=1713165616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NgflAqowUAu0egVNgXe8ugQun7X39r3CL2uIz1gu4c=;
        b=g/14daJEtIj2AoOLznUn2oKAAJ7MoiWbCohMWwP3tYo0YPSar+L8xnZj/MBSc8fvmC
         Z8ZasBgxjvwc8zXHHaW1+ou/1/0+zFcv9f1b1Wt7vyEE4q7DtylMQsaoO838VKfAbpsP
         GycpHa7sOmakFTRo3k9YqAnYiaxZs303oj1gaLirQItR5Gn6HrFx+dQSryUAgsiDH+0w
         n8EWxLIeXNuuS4yvVIDZFalinjxhrLhbHIV0pC7ge7MEnv/hjPOM/HYFMsC+yhyH4aTs
         k3hukKcdPeXhBRIsDwxte5tCjoYk/3jY/hKlUtKQ+KzkGbS1J6eEyyHBKmLOx0AxbIhP
         6syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712560816; x=1713165616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NgflAqowUAu0egVNgXe8ugQun7X39r3CL2uIz1gu4c=;
        b=CVco7g/9H06CD1yiowiHG1xnlEmyOvN59fHXr2AUVU73zc6rnISwVkcIOCtbgkJ9Qt
         pXV4OF8alDaLwmgV3HNMjk2t5BGyEpgNzGjcgxdFJsg3S7agEMiJov3sgfAgSPbRZ/GX
         SqsMfWgpFoOPaA2gH33+AS9tS0+wX1MAIb/7AQ4gpLTazG2Jpcd9FXJNZNoaVYm/Vpa3
         RGGHErbVaB6ur2Z7We8y5Nxl4Jvld0m9qOUvALIZiQTTwS1vBvQtD3CL+P13pMnHnYut
         uis6s9v0Nj7+ojSdns2x1mXHvVvjaC72zP0AugH3RJmBkKYpxY7sr39t2AT0q/vJ4tjZ
         g1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVbaq/TesHr0Jz2AAog2u5j3FzZPwvIAJip2MNiFQKMpMajXkW5nZU4sSc6zlYBOXcpGrIpmrbFuhwkMI9l4EvM8ATM8JZciX0AE4g=
X-Gm-Message-State: AOJu0YwbYwbgVQkYjEqlKy93PxsCqEqaAeFNfT4XDraUqBTlT6oGHadB
	rj1/tWMEL9WCWelbP1WjHL9vcY5RMpYWmbLFGzubd/2NwWsmLCoJ0/R8bhx1Dxo=
X-Google-Smtp-Source: AGHT+IELXUjkW+4uwxz09qQEfbszOo10hIajayl+cqGuPVmiHqNhtXuxaaAtecBt9WYaxZy/VQf6Rw==
X-Received: by 2002:a50:aad0:0:b0:56e:57f9:8c83 with SMTP id r16-20020a50aad0000000b0056e57f98c83mr2481000edc.19.1712560816205;
        Mon, 08 Apr 2024 00:20:16 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id p15-20020a05640243cf00b0056c2d0052c0sm3738769edc.60.2024.04.08.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:20:15 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v7 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Mon, 08 Apr 2024 09:20:04 +0200
Message-Id: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSaE2YC/42Qy2rDMBBFfyVoHbV6R86q/1FKmJHGjUqsGCu4D
 sH/XsW7FlO8nMc9c5gHKzQkKuy4e7CBxlTSNdfisN+xcIb8STzFWjMllBFKaQ6dszz05ZtPsec
 IJQVuInrlrfBoPKvJ2iWOA+Rwfma/esipvNb9UwcpX1Km0yiei/1AbZqW8+8s041nmm7so07Oq
 dyuw33xGuUy/1dhlFzyphXoAkbQUrwh3C8JB3oJ125BjmoDRnHBhQwuAARAdCsYvQGjK8bGxhh
 oojewZmM2YEzFaK+dBKfBePyN2e82xBUZSzZSEMavWNgNFrZiMMiDbuRBYFj7iduAcU8bqYja1
 mK07R/MPM8/c23pw44CAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712560813; l=2836;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=i1uSsLXWtkljlVD9K5i4/KkLIjH9N0qPb5HbIu0GR0c=;
 b=MUTibm7kGyAuDtUjnh2ZeNRI/50rwE91Xv2jEKDUpbBOwINm0U9jwGiMHhr5rpzav9qb6avay
 RtcRt/bl/EPBbB0r315Etc3lZuucZjmBRI6ix+LVq29ARmq9sJhRypb
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v7:
- Move xdp_do_flush() function call in am65_cpsw_nuss_rx_poll().
- Link to v6: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com

Changes in v6:
- In k3_cppi_*() functions, use const qualifier when the content of
pool is not modified.
- Add allow_direct bool parameter to am65_cpsw_alloc_skb() function
for direct use by page_pool_put_full_page().
- Link to v5: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com

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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 547 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  37 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 550 insertions(+), 51 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


