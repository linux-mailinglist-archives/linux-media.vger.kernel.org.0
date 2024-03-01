Return-Path: <linux-media+bounces-6241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925E86E3EB
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 16:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90218B22631
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 15:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD66B2B9B5;
	Fri,  1 Mar 2024 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V9vrugDG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766D20E3
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709305397; cv=none; b=pGzyB5VCtr3yaxm1npjTXppXlQFkNVokUpqhdnHcpFZp12PFPiwEZPhtRY1FPkKmvHCXdYlEekDM2HjFWmos++zDxq7+BBCwmeTd6rQEywbbZXt2uoc0xtYW+yDPLd1Oqd6gQnx38YCv5TbfHnB+kKL2B5VtyneXV60PrVlNVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709305397; c=relaxed/simple;
	bh=fRkAAAy6okiH74c3wMlw7w5JWLn9Ut8v1qmSnkw5Lrs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HQhT9U68nzx2PEDxB+Vr7n5d9E+tPqSLgauONG3fu11XNiVTDQ1i95J/xFyWdtH7UmM1eaoi9NT22h5TFTbKxMpQySxeE73JkyYrzX4nxZuEybYJKDQfKX0lty7X+BYl5jpDIOTstLzAw9AjxVGut0F8/qnSa6gBzQsTcKifshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V9vrugDG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412cd58dd71so1318805e9.1
        for <linux-media@vger.kernel.org>; Fri, 01 Mar 2024 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709305392; x=1709910192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1U/Yh0ZYoALW1PvQIgQzS6FWbyOjgsal3MOiembAaI=;
        b=V9vrugDGP0sGVUCfNO+cll3TjuafJDczg1awZY7JzztDclr5p+SII/MPzDXNibaC++
         8Ppea+mex8p5OPKuMCgA2OxShI6atK8hEYESCW2n1PsmeKbpDhOJDh033dfT1T4u51gu
         yfwsfmQTPpxxdSOfFMV4JABZb/yS+3QzQXXiXK2er7FL8kwHWwChSm7nTIR6pRojPw0l
         wtHCqcI50P7lB2w2C5i4fFZOQwnCKYE418/lliMBDndfWduHsP0vDaHk4DAqS9o9TuNQ
         TSuzHbmjm2XY4KMrjlduBLtJdOmSDJQXJxJJlJBn2yoj/JiOVNMh7dmD9dt8vIPGDExB
         l4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709305392; x=1709910192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1U/Yh0ZYoALW1PvQIgQzS6FWbyOjgsal3MOiembAaI=;
        b=pD6oVpTPidyFhstwLMpt1N3uFv4yEHf/tEWRTnhCiKu9ALi+5Raxv9SQ6vZqpzs7o7
         UwMDtyw7B0rpwaLEG0ZeWeEIu0+TeW0egceCNeHLNgAXNeVfKNlBsjuazSp9w1Yz4rMD
         81Wso2mtqbcpF5HhalgOnyJcd32MJNaoyi21pYuTpK3iIv1HFdmnDFvAPncDGV1dU0sx
         o/MAVZhEWQvi1UahVmBd4d5Ik0m/ymi01P7C61WBRPHiOzd/59LOwQQl5mdLIUP+p6E9
         cTkXG1h4qYc9nzi0++lx4gy5X1obcGnBIWST76lLmuIEjF2Yg6mJA3rOT3Is1Nq/QG2j
         F/ow==
X-Forwarded-Encrypted: i=1; AJvYcCWOtuuUIOarEoYD8bE/RTb45taMaKnc33p9puUApp8eLKjXX5hWd8f23QEsdFORsa2PGVQQ/vUjpd/6gXpieNPdAASAIknJZQHPMXM=
X-Gm-Message-State: AOJu0YxhUouqHNbV35oKj0lmiwqYB/W6y5CONdAdAf0bdsgUe9m2j1Zu
	7uJS3apCpjPqlAf0sNqavB/GrOL9GF3gwhUfLNpZw96cq5WoXTvSwgUdR+0W9eE=
X-Google-Smtp-Source: AGHT+IFJ6EDFfqF9vpV6mLyjcVAx2M+lhHhrjha/wKSECKiDLQOvk0u8xjYf4eXwll1Rc1/gfadqqQ==
X-Received: by 2002:a05:600c:19cf:b0:412:c219:6206 with SMTP id u15-20020a05600c19cf00b00412c2196206mr1572398wmq.39.1709305392202;
        Fri, 01 Mar 2024 07:03:12 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c1c1400b00412bca49a5bsm5666875wms.42.2024.03.01.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:03:11 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v2 0/2] Add minimal XDP support to TI AM65 CPSW Ethernet
 driver
Date: Fri, 01 Mar 2024 16:02:51 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvu4WUC/32OWw6CMBREt2L67dW2PFL9ch+GkL6Qa6A0rakQw
 t4tLMDPM5mTmZVEG9BGcj+tJNiEESeXgZ9PRPfSvSygyUw45SXlvAA51hVoH78wGw9KRtRQGiW
 4qKhQpSDZzKkFFaTT/e6+vXQYr7nfjhLdgM62ie5FH2yH8zH/bDL3GD9TWI43ie3p/+HEgMGto
 6rWysiC0YeSy4Aq2IueRtJs2/YDfCUG+OIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709305390; l=1433;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fRkAAAy6okiH74c3wMlw7w5JWLn9Ut8v1qmSnkw5Lrs=;
 b=6wZLBkoqcQ01o76sru4VFM780fXr3UvKTOCDR2ORKqd6i7DJR9tMN+n73vBTVTfREkGPhle3R
 SF53bKdxho/B+eztrnC29ov7izoOhD/b3akA2VrJ1bl1Vd8UrvyHtsv
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v2:
- Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
- In am65_cpsw_alloc_skb(), release reference on the page pool page
in case of error returned by build_skb().
- [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
- [nit] Arrange local variables in reverse xmas tree order.
- Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com

---
Julien Panis (2):
      net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
      net: ethernet: ti: am65-cpsw: Add minimal XDP support

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 490 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  12 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   2 +
 4 files changed, 469 insertions(+), 48 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


