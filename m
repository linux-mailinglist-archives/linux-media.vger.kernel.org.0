Return-Path: <linux-media+bounces-6423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C11871CFB
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 12:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990B61C232B8
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 11:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235C65786A;
	Tue,  5 Mar 2024 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y7wbjCLo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EBD56B65
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636910; cv=none; b=VnufTADryTNIg5tHNuGPUryVdqyKiPVenTeEooxDPuDXPYBuRHVJVLjJYrWkEMyG4BggFEhU9cG90rZHIO0v6fZvcHgHN2zc5ZoST2oS1IY37HFR+QEQFHOEb1IZP31CRSI9Ox4nCQjwQn9X7A2T+gPQyB9Fpzbugs7aKhzjiJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636910; c=relaxed/simple;
	bh=AEoPkt3FD7wIqhqIzLlHWU/Ex7SJaJ7jvu1zQhoBqVo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QLXOQri5khG4Ot6zbOxJjhpulkfJ8lAVeZRSetCUMi0UtPNX7QMV+X9cZHCmzkM3c9WabzRzUsWOk8JwckpFJ64UovegDfbDJZCPPa+HZ6gY1hePea5WbF96rhhB8wEJm502GCw+Ft9keRIVKUKNfZXVy+aaEvnIgP+TarVIITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y7wbjCLo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e1d327595so2339464f8f.2
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709636906; x=1710241706; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2zzbGg5DxMcKg+Wn+y5TMC+EDQP0gtLCqVdY8y5cvlU=;
        b=Y7wbjCLoPoZbQfByDrs0Bri1UM6x/QsS2EC+nVkRS8kYV7bM/fnSP5aV1GlD7/ZPnd
         g/epayJyp83CkPN5lnnpVIl5OrLUMQaZHptdC/qg+6LoBUkb20oy5jePJ1nUUFGu0SZs
         kKtZtce2xWdhvUCoJ5tcp3ngqLZ5HdmXxqQAUl3U+fDdSSZlFaR6soXaNBbSnVvf7GbP
         1pkO/qzrvoZEKlGHaORd99jq1TCrwacMbvZyfiMLH7hVdnsG3H4/Sh4yLbj6JZlry0Ol
         aAoQmVNpVJXhHhXXLa2kI7QaPyn3i3LbfmrHVSYFrhfTfve0G+34ttKEOYZORmXzIZkD
         1m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709636906; x=1710241706;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zzbGg5DxMcKg+Wn+y5TMC+EDQP0gtLCqVdY8y5cvlU=;
        b=Zvs0ezcMgYjK8GbDqAyQ/ldZeht8+kHGW5ekTj0DB67elIKv1E+J2pY4A1WjasprG2
         iyBpUllLh8C4KOq3OAgMkhoMsCkypX86r1G1IdgtCx4YHk1ZE8BC+3hCg5gQIKy3YO8A
         rUfYNpxbK9D7W91Gre3kMFMPFiR5VnEst47xZhHvZHRGUicca3UbrRvFFsn12uXPo9yg
         oYav4M1QX5runJt2hKXfFhwzJBH+CIxAFOtYYln8PK+T5ep/PRdYZRJrdEUVSKbKQ0Yi
         mDBAriPx2NnPxaYwYa/ZWc8UWJ1gMmWKHVyBSR3oSCkeVGdP/2pHYkdgPnCAZ3LU/Pqo
         RwEg==
X-Forwarded-Encrypted: i=1; AJvYcCUZU97GGFjhE40G4BCQiytz/Va/cjVQiisRYqFNmdYKa0hZwUmqcczvH//QsCdpbp2G6URiTUPlBog6ZIRMkeNQu8siewrwpGMNu7A=
X-Gm-Message-State: AOJu0YzQOsVpbR8VjDfApZrBPLn+s3ZpZd+64iiixbBl2pFPYjI+q8ax
	tSic7zP2B8Pk0OQv7GnQ84AxKxsL7y9nnvpW/vcqkvlKKwQ5HLEkAoWndaOcH8s=
X-Google-Smtp-Source: AGHT+IGRxGk+xJyDqCA5anCR8v5jNbheWp9RZkTgBpd6K3gXbnnzru7ijy8eprwWtmMtcK5CTTtdeg==
X-Received: by 2002:adf:a4d3:0:b0:33d:76a9:89ae with SMTP id h19-20020adfa4d3000000b0033d76a989aemr7487876wrb.12.1709636906280;
        Tue, 05 Mar 2024 03:08:26 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d59c7000000b0033e475940fasm2190993wry.66.2024.03.05.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 03:08:25 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v3 0/3] DONOTMERGE: Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Tue, 05 Mar 2024 12:08:17 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACH95mUC/42OwQrCMBBEf0VydjVJa6me/A+RsruNdsWmJZGoS
 P/d1KMH8TjDzJt5qeiCuKh2i5cKLkmUwWdRLBeKO/RnB9Jmray2pba2AOyrDfAY7/BoRyCMwlC
 2VNt6o2sqa5Wb2XVAAT13c/cyope4zvmmR/FX8a5Jeg6OwZ3k8Zk/HLPuJN6G8Py8SWZ2fw8nA
 wa2J00VU4uF0XvC51UouBUPvZqRyf6BsaBBG64YkZGo+sJM0/QG4HMIbCkBAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709636903; l=2299;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=AEoPkt3FD7wIqhqIzLlHWU/Ex7SJaJ7jvu1zQhoBqVo=;
 b=HxivJ2c/NUSganuMDahxATBJ2FV7Y9CCIoAVp5MvVm3vlPH9Vacrjv2erzJ6+5qN+/Lw2SdzG
 zuw41mWGj/2BFnwMRhepdFtJTS+jWgmue6nNtWlca6t9YrxWyNFQEIB
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.
However, additional testing with iperf3 revealed that the performance
is worse while using page pool (that's why a DONOTMERGE tag is added
to this v3). As mentioned in the discussion about v2, with none XDP
traffic:
- Before = without page pool -> 500 MBits/sec
- After = with page pool -> 442 MBits/sec
-> So, ~ 10% worse with page pool here.
Note that the page pool 'dma_dir' parameter is set as DMA_BIDIRECTIONAL
because eth0, for instance, could get an XDP program attached while eth1
would not.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v3:
- Fix a potential issue with TX buffer type, which is now set for each buffer.
- Add benchmark numbers (with VS without page pool) in the commit description.
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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 533 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  36 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 536 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


