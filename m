Return-Path: <linux-media+bounces-7775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603B88AB42
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F691FA034C
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92B657883;
	Mon, 25 Mar 2024 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F4DiX7MJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076394EB2E
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711382451; cv=none; b=gEw3kltpDcNX6ZiJL2Dz5nelXLiH6nhY9mcUfxT3G6swIhL1DSf9qMEwQvwP3ALo8GFNho4h5RUYX8IaqP04NT0HfhxpP3fpXd88j2LfTkeFuseDTjf5v98V4Pm7EtRhw3UUelFF1Y6/TNzAFcbTqLVm3xjujYxE7dSyab22zrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711382451; c=relaxed/simple;
	bh=wqQe2DJZDzzMYImWv6Ki1IImWaVqSXITlgGJEpik5FA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ULmO3JzDaNQBfWUMOQUdfBp/Eet8heeOye72opSsgDNlDsTrp9lHcv6mVo7X64Iw4VbnBwuYa4l8kRBZAmuBE+yKfwhQZ8+esldNZbLGenM2WzfiQEJSAyKW0BGW7+gsi2Hfnnpe7Y9Xn1fy1tDxHxvIVKj3nhusgZCHQZaGcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F4DiX7MJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34175878e3cso3216475f8f.0
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711382447; x=1711987247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
        b=F4DiX7MJqyVEHpWldAiPsZtv6b3WfYNZD0xT7ypua34yOhi0UI6Q7CVUok+CLSUhlu
         HA5p2jb04ilhNXD/Yk264dQ8YAMZ3lhrMpG3v+/yY6S60NQjBMG09mf0S3g1Oqxhztkk
         2/ewEBjMfEWQs31rpZ70mYQQxG//XWEEeEalc3V+rogq25pHTz3Fhu2xCNkDyzIDq4J0
         ZAeKy5cr+sqpRg9GNClvtb+tGX7LcYQTfkoPHlMx2Gb9Y2vLWGpL13uYF7qCgQc6yf8y
         RwthqhhfdK1DC9Wz1xxpJ5AWLEFCvaKfom2+9BmXcSIWQB3+rGLNUpf3vt2v6Ap1WpAZ
         FWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382447; x=1711987247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
        b=atUTgczYdLU6aZ55UKxoAce9qH+2BmkLrq9lOu1UWOErFuIoabpnyrCEzTZ2sob5/6
         ppLphff28zuDD32qgqwaW6DrXXV4TT3toqZ+ksCdXDO7ywa30bCGdDgC6aniQmovnsC6
         2052lxrkoXbfx7/ygUP7lfqCT6a8BxFVEJ/r+WSJNZ5tTz30KzQaozlpC4v2TSXJGCUi
         EvjOpJQzLXdOG02Uy1zr8IFt4VMPDlIFkL9R3G1BqzD0d9Panq9UdIY0iXkqoM4B6WaP
         d8GVZUI7NotoFNUBptySxCDO9h3CgYENAjwYVvq/tncUO+TDPJwsLsg9wh/suwFF1XPQ
         VPHA==
X-Forwarded-Encrypted: i=1; AJvYcCU+iQY/WysvmBGu1mDxpdceKKCDMLrDzfFZgHkpgOK8ctHW/l1ertQICo/qjwNRTUvxUi/CVc2uPtJY3BZW1OChSQEALRPJYZiwuEo=
X-Gm-Message-State: AOJu0Yy5pqi6IApPIiqntICBtsXyjNO9bRHXStiHkXKYBFTqF3/+cocz
	LfgNdl23jL55Z3OV1KmwcCL3zqJwX9i/XWSZbscLGOv8dRijQSy1zov+zwanWkA=
X-Google-Smtp-Source: AGHT+IHAQQRHljpHUkf1aqxlBTu/wdvUc6/R03vZ10abjHEyq0wyR/SvNz2BJXeAO3tvcYuIXdvPCA==
X-Received: by 2002:a5d:51d1:0:b0:33e:34b7:895f with SMTP id n17-20020a5d51d1000000b0033e34b7895fmr5048233wrv.24.1711382447213;
        Mon, 25 Mar 2024 09:00:47 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r17-20020adff711000000b0033b6e26f0f9sm9839361wrp.42.2024.03.25.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:00:46 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v4 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Mon, 25 Mar 2024 17:00:34 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKfAWYC/42OzWrDMBCEXyXo3G31ZyHn1PcoIexKSq0Sy0Yyj
 kPwu1fxsYTi4+zMfDsPVkKOobDj4cFymGOJQ6pCvx2Y6zB9B4i+aia51FxKBdibBtxYbrD4EQh
 LdKA9WWkbbklbVpv1GoAyJtc9uz8jplg+av7cY0zXmMJ55s/gmMMlLtv7L5bCBCksEztVp4tlG
 vJ92zWLzf93wixAQHvhZBx5VIJ/Et6vkXJ4d0O/IWe5AyOBAxfOOESHROYFRu3AqIppfKs1tt5
 qfLVG78DoilFWGYFGobb0B7Ou6y/0kPBSwQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711382445; l=2133;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=wqQe2DJZDzzMYImWv6Ki1IImWaVqSXITlgGJEpik5FA=;
 b=P1yzfio0eDcxAyUAY/a+nfJisXG0eTNG56agA256QD3aW0IbWjpNBGzvns98Nsg9Qqsm9+Nq5
 4QVR/fm2KNpAOWGfAES1MKvawg2+uGBn3Y7SBGyJB+8SciyAJxTQ5R3
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


