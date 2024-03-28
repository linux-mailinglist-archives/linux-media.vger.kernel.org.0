Return-Path: <linux-media+bounces-6903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9D879503
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 14:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 840511C21B61
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 13:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD61F7A704;
	Tue, 12 Mar 2024 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NLIvukKn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963179DD0
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710249777; cv=none; b=Mx9/xHGFEAtrhkNLQd5AZ0o58ofPsm8zL0InoeZAv25IIX1a3L7Y0ZmWXngWy1S0CJ1qftHHOKvnvbVp0dbrTgQcNLq+YDQB/Q/0FdPBPRM791hrY2H0NlzuZp+r06/wgwbhQxTuIQt1VKciJjBIICrXeGP4+aVMOzkcTt2gUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710249777; c=relaxed/simple;
	bh=wqQe2DJZDzzMYImWv6Ki1IImWaVqSXITlgGJEpik5FA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nL1r+tIFilUQMckGIe5ZreGQPPE2QQv4bARBkDZNAhIhGAUtTkBA3j5hqQB9z/isf+Hi2ZZE+T9kvg4ygvn1GwLu7as4IM8v/lKscoivU/wCnODB7FW8+XjJ43QGw9mYrlC4obZton/0GO4sJLGKf9+pBBRhDcbdmt+l/Vhr810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NLIvukKn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412e784060cso38500455e9.1
        for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710249773; x=1710854573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
        b=NLIvukKnWo9W/tbwGD7lUP9O/LitrDMHKSjR1ch+NCQPgcLUu9JzwwH3g/7Vgjhnph
         Q8rgs9YOvwsUuPH40z/40bayig7VzDuz9EJHwd+D1q3i4CteHW2njkfmHk9vZB/lagt8
         5ZG0Vf6A7tZazTE610SPOxSeONLOURHaQOQUf5E1DQETICI9ayGHNbK0QIIeKSo5Wbtx
         J2VpEp5VnAPjiirfpEM88uFn086UOENevm+HM2OmOR3gek1jDiHrXT93mrwpxOOIxToL
         vxVMufdNur1bb+7BfRRWVjEz+tjAwcNbXmqss5UfmZVC7KSwhiaA3kUdeK3yrtvZBafq
         gRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249773; x=1710854573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
        b=b90+w0pq/4bbDU+bPHKc0Y0QEj3lZ7LhVtBXkDIiVllUWSjRD49+BUe2nyEwpPQ13r
         zS7rNdy+2h0RdGowcd6sB/T/xMU9a4RqEejmR5lcM6fU/wOBRprB6WexwilypYaGCScE
         rExTG6bDqUW3ruNoCMgjqqkqntWAUCEEt2RSehKnbXO1h/DzojrQcv8DjHP7FlYSiHp+
         M2+QIlxaWnG80VvXzx3dE7zms9XtB2ksIUZSwo+17EnoQu72W4rbL2Bkaen8bD9KeMJa
         kx5yua6m5oZl0dwTDX6A8jiGuU5VflL4WAVHCO/18Hgdzc53rGzlaE665Br5GY/Pxtjj
         AO4w==
X-Forwarded-Encrypted: i=1; AJvYcCUb4VmPQkqtB24TiooJ/8E0g1L0BrL1jUQu3i8tLaF8Zfdu04+YPfX7zwA06iUeYdrHWbaVTlWFqXRy2xx4NlI11lem98Zp5wWJ3tI=
X-Gm-Message-State: AOJu0YwRpjHjnA1/SwRNr+m6IoBNaxnzTyi3QGm+R4SA/t1Da4/RtwYh
	OqlsEh1czPFSe5HoPuLtuewwON6Mc6egvIMBJYfuHejq9J1to17vl5NMYvn3GeU=
X-Google-Smtp-Source: AGHT+IEFEOnsskmi8fJKjEHWQFqnqg32ZRzKau2ZUnrv1se7UxcgZ+VfM9jul+nu6p2zo1WC/Cdhcg==
X-Received: by 2002:adf:a38c:0:b0:33e:5970:e045 with SMTP id l12-20020adfa38c000000b0033e5970e045mr8556122wrb.21.1710249772871;
        Tue, 12 Mar 2024 06:22:52 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id r13-20020adff10d000000b0033b278cf5fesm8980167wro.102.2024.03.12.06.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:22:52 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v4 0/3] Add minimal XDP support to TI AM65 CPSW Ethernet
 driver
Date: Tue, 12 Mar 2024 14:22:39 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-0-38361a63a48b@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9X8GUC/42OwW7CMBBEfwX53AXbcSKHU/+jQmjXNmQr4kQ2c
 kEo/16HI6oqjjOaeTMPkUPikMV+8xApFM48xSrMx0a4AeM5APuqhZbaSK0bwLFrwc35B25+BsL
 MDownq20rLRkrarO6AShhdMPa/Z4xct7V/HFEjheO4VjkGpxTOPHtOf91qHrgfJ3S/fmmqNX9f
 7goUNCfJHWOPDZKfhLeL0wpbN00ihVZ9BsYDRKkcp1DdEjU/YFp3sA0FdP63hjsvTX4+mZZll9
 hpGJ2cAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710249771; l=2133;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=wqQe2DJZDzzMYImWv6Ki1IImWaVqSXITlgGJEpik5FA=;
 b=HmUezjz9lmpONlJhbBP6IRegsF/dgO1FNHWsEtwF4sZ1ZCh/yXfBCwi9V5pCb3ZDGJ4JUJx8N
 gPsTooMTbBtD/k6ajbTUJNmWqxhKmfSLPAn8IeIi5FZnZWjDyzW2E9r
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
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
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  36 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 539 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


