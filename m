Return-Path: <linux-media+bounces-9199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F798A32A2
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 17:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93A001C22476
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 15:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694061487F4;
	Fri, 12 Apr 2024 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O1xMdSjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EAB1487CD
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936331; cv=none; b=OJ8feVLV6mdBRCcJmGkm9+1BMLHocL/mGYoA9V1s0NxyLiN28NfxFG/tzLBNSu/PRaal/+yIv1Fqw/zZJ3T8Ggupbg93qudtXJNzDETAQNbW2bcdYTWyJPMUw5N92YUX9FUKrWg2t/9+iA8PXilLynZZNmjMLAVKbsiRQNm8XAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936331; c=relaxed/simple;
	bh=FKKMgqvHByKA4tvc3eA5ffKwH9FrWfmfSY8lLNIiWog=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SfoPt6N4rp1HhZSux2pGLtrZ1poRFUtCw1MAXHjg8W9Cf5lOrwu9wCoXSD/N6rqzAFpxPLp34QIuvjwvL45rT3vyTopTt60xATVt1GCsYxL5XoRWKxIvgpL0/sVp7KMGH8w4VQ07NLU/N0WsQyICwY7FLl4lzYBzeixvuyx9MPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O1xMdSjQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3465921600dso845290f8f.3
        for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712936327; x=1713541127; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6PZpErhXoFLSgcwKLydiKCIqyrzv/osbJWkwgwT5Ay0=;
        b=O1xMdSjQwoUHvRW1ydPKWZqHpGO7AFro/nxnv0Ztanz5XcHzWmzb3KujO+CO7KcfEE
         2fqQAh2pdC/PYCWUVjjMNeguYH33VAJYArT3MGR3/+6D3m8EtalFyrJlg7rdx0HY2TT8
         Y4suxBITFQHxYbXucrfrmcnnFLOabNsSTU3RtSjZoZJiMgjRJneXc0bTnQ46d3k1yt4a
         f74wU3mqFXz/aQUKvEe39hl8wtbRz687KjrWsFN2nIIvb3gQNdv1AHSIDrJ7JVplbA0B
         aG539MzeCL/fMcwxqcrinI3hNGFTrLLjyiJTGb+G3b5VE5cFzqpGGjMVspO82NTkINF0
         TNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712936327; x=1713541127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PZpErhXoFLSgcwKLydiKCIqyrzv/osbJWkwgwT5Ay0=;
        b=ZcvYLxTi2vn19v3muH43NTpNKBMPH+VeYCmuV8YiiCSYmBHCaOBFa16AgyPTbT/3cv
         t48Y103YeQiADqcR/0eXkMgqojvWhI+7jby4UuPdphR1klBlRGJHRyyE8Q00oA0zf5VU
         rh8JVmT2NVoBDchMlN9RcLIFfvgexc5WQ1donGzvgeSyNRjF9IntwXze+0WPTKBGN+UK
         nitqrVtUg6MzSuoVmal03xb0LBZTlxJNO+Acjjv+x0QEqrDWedSCJLGg0oHQFjb96gFV
         5I5PYwR1MHAVJMZEWtNUSoPZjHPxACTZ3ylq5l/8SsgBZXxN9urV55jJ/J64o5l81ffG
         /URg==
X-Forwarded-Encrypted: i=1; AJvYcCXNRK5BRHnGyU+Yo4qQsi2D+5eVm+ZV1dUBGopEWtfUfH2uTXpcLcG1hsrj7V/g9EYxZ9hso7tbR2aDAqywcoJq/EJxgRS0eZ73PK8=
X-Gm-Message-State: AOJu0YwRqWpsMpLY72IhzgJyrv7UpVWmacynNgKd6mhfVVs8EUpDHKhX
	dxF++cVkxuRGSlNg9OEcdFoCaOip+8icmyg5mJptIiRCsIJ1e7eAB8Lx22mU/CSqAgJKMcSa2vK
	C
X-Google-Smtp-Source: AGHT+IFvHJ+ngcqc9RhfIXSS90heNPGSCkUVEJnwKOCeh0icy2zvFyQwZwEFve7IGLGy1/ZjqkhBHw==
X-Received: by 2002:a5d:6082:0:b0:341:c589:8aea with SMTP id w2-20020a5d6082000000b00341c5898aeamr1589834wrt.63.1712936326779;
        Fri, 12 Apr 2024 08:38:46 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id k9-20020adff289000000b0033e45930f35sm4545791wro.6.2024.04.12.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 08:38:46 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Fri, 12 Apr 2024 17:38:31 +0200
Message-Id: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdVGWYC/43QzW7CMAwH8FdBOZMt30057T2mCdmJOzJBqBrUg
 RDvvtDbpmrK0bH9y1++s0JTosJ2mzubaE4lnXMt+u2GhQPkT+Ip1popoYxQSnM4OcvDWL75NY4
 coaTATUSvvBUejWd1s74SxwlyODx3v0bIqbzW+f0JUj6mTPtZPAfHiYZ0Xb5/Z5kuPNP1wj5q5
 5DK5TzdllyzXPr/Rpgll7wfBLqAEbQUbwi3Y8KJXsL5tJCzamAUF1zI4AJAAES3wugGRlfGxt4
 Y6KM3sJbGNDCmMtprJ8FpMB5/M9tNw7oiY8lGCsL4lRS2IYWtDAbZ6V52AsPaTVwD455ppCIaB
 ovRDitM18B0lQna2y54FSHiCuMbGF+ZQRsl0foIov/DPB6PH37djukcAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712936324; l=3692;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=FKKMgqvHByKA4tvc3eA5ffKwH9FrWfmfSY8lLNIiWog=;
 b=kwII0V9/2FbZDaTT8w+6oNfTEwAwUdOycaJSWRYmzp5yES3hHPlZUB8rpnxgLZj6mscBbWIPZ
 z+FRe6YDvzgDTx5m8F8cVA6A+X+ILKW6dCkIu4bWnfCN8UUKFssa5lV
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v9:
- In k3_cppi_desc_pool_destroy(), free memory allocated for pool.
- In k3_cppi_desc_pool_create_name() function, remove unnecessary
error messages on mem alloc failures.
- In k3_cppi_desc_pool_create_name() function, move desc_infos alloc
forward to leverage pool_name freeing in gen_pool_destroy().
- In k3_cppi_desc_pool_create_name() function, remove unnecessary
'ret = -ENOMEM' since ret is already initialized with -ENOMEM value.
- For rx, do not build the skb upfront any more, Instead, give the page
to the HW then build the skb once HW sends a completion.
- Link to v8: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com

Changes in v8:
- Fix some warnings reported by patchwork.
- Link to v7: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com

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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 659 ++++++++++++++++++++++++----
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  46 +-
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   6 +
 4 files changed, 623 insertions(+), 101 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


