Return-Path: <linux-media+bounces-18380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A697B9C9
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C520287993
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4C5177999;
	Wed, 18 Sep 2024 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs4DEm+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B345BEC;
	Wed, 18 Sep 2024 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650196; cv=none; b=skvkdtjSvWsWyWpaOc/AJrU+94N9J9wDvWNuLXc2VQgJ6bM1ESattfzrHgTochntrPYy5pWO691v0Ovr7AujPbDlsYlrfyCD4JCLZVbptnYNRmucHrjQKC5vPHbSV9tF3wcYh3k+4BupekNYTBQ3bsF2uaqAbL+L5xmeqLiO8aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650196; c=relaxed/simple;
	bh=erM4sHapK1IHnY+8jT0BHoYKAQtzgNE9wr5UMg47Ur8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rzGHC8prlKH1Q4QD75B5lnQpAcpGd0/m0PeYVfI8xkFNRL9Z1tHwRLFrsX8uSpZ3IQruOMLBTBz64/6wrdNmL2YpPmvf+m1wprTN399JfA3Xfe5wBFcBJSvMUFISPTrvWNQjISAngLeZxysDTksUMikwCvK6YasP2/6CZV2SQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs4DEm+4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2053616fa36so80062305ad.0;
        Wed, 18 Sep 2024 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726650194; x=1727254994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtpllJHNUz1+PFWJNLO9JzEhzmqZygXKijwiaiZ1tHY=;
        b=Rs4DEm+4mLVaMpVBCRLuwBVMDAL8HGfh976WYzLoMdfBws3d79Bm8yoA5UPnqIkAGm
         Vhf5+mmCi6Nn18H27+QbBJ6qoFpY9QFUqBbQEfLvMfVZd+rmYQrp+3a387WvgQ2KM79J
         8HqyUJxkZWyYRtwJ5bWRYWZ7bzqd06A3E3nvCdx+5rpcXPQDodjzxQEJELCyFovH1cZP
         c+oNb4PXONxIZoDYEVRjWlSVYaj29ljKvPLquPwkA1XwFOnI2v9YUit4HpX7fkeg9Wpk
         zvhZ4YN/cjoZe4b1VCWjb+6C9cdYvV5z7Yci02VEFn/ACFoWj2hXRd9tiv4eP/CQHItf
         539w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726650194; x=1727254994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtpllJHNUz1+PFWJNLO9JzEhzmqZygXKijwiaiZ1tHY=;
        b=lz8bADwusNOebpIvTBnuaAu6GVGoXALry+GxCVYcTyuTQSpotL+ubQ39hEWsYfoiiM
         wzGYIpvKATRqiALj1A5iqtGpUJGtxzD00JXr8BM3x8VaLqzNOub1/3bWH1NSWFl27MDv
         Vgp47nIEsp6HCEFAg9sHuQPImjwCvFLXWO1UHk3CE7l4RyudE6qMxQ4OfUf+uivSUgTN
         JJkDzy3Erg0FiJPA1Kp/cz07rE+KiVgno05gtJQn2SHdfBRyXZQd3JViHyGLPCPvlpZx
         OI+hcQeZRRV3MV38bG/Y/pZsGh2rz0FYcuDXAA+aD0O1Vjf+o2mXmMMPaDSznVB9KQQM
         mzZg==
X-Forwarded-Encrypted: i=1; AJvYcCVS52h1avv4NDCLf709UKE4NzN1UX4idPi5Pk/Vy960WiAJj1MM2V/5YrQUDa2C5+IqmEDsIbXxrHdh@vger.kernel.org, AJvYcCWSXRMjX+lH83zsumkz52n0vVBtCHy4oNVA+wrSZynvYF+z8Hn/9tyR20p7j2byt1E0uRaDLRCKG+RnCpuW@vger.kernel.org, AJvYcCXnL8uO0bIKtJdIxem5NIt778f4Lye1REPXWjm1+1KuyVH4P5owMzOqD8Z84XE9pk3r7PRiBDEwQs9LR94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgtFKVKXXO2a+pmhRRRq3PpdLwTpIvRV+5+GJTjfQDG9r+NJe
	O0hWUJuZkrVDDPZjDBpX8+iOQgAOfokr27rTLJpxvH+KK1KyRw9Y
X-Google-Smtp-Source: AGHT+IEgKeGF0I2bdpp/cgx+mruhYWLhI+QOokE5lajRXPVK3arbWkJ4oOi07uUO/2JQxL6qVPiYpQ==
X-Received: by 2002:a17:902:e812:b0:206:c75a:29d9 with SMTP id d9443c01a7336-2076e3eb0cbmr345072275ad.42.1726650193788;
        Wed, 18 Sep 2024 02:03:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946010f9sm61021875ad.84.2024.09.18.02.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 02:03:13 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v4 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 18 Sep 2024 09:03:06 +0000
Message-Id: <20240918090308.292617-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v4:
  - Update nuvoton,ma35d1-nand.yaml
    - rename 'nuvoton,ma35d1-nand' to 'nuvoton,ma35d1-nand-controller'.
  - Update ma35d1 mtd nand driver
    - Rewrite the NAND driver using the exec_op API.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |  93 ++
 drivers/mtd/nand/raw/Kconfig                  |   8 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 935 ++++++++++++++++++
 4 files changed, 1037 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


