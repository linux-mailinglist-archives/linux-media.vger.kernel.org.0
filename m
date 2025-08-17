Return-Path: <linux-media+bounces-40038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF0B29327
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 15:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD861B239EE
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 13:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E696B28506E;
	Sun, 17 Aug 2025 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="mfUsreZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7920D4F9
	for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755435967; cv=none; b=d8GOzAxv3T2TIs2w4t9RLywZR5QvyUNoRgUoIcP6y8ZwhGKxL+2sy5ED3BvcaNEKWR+qa9w8F+UYloC8ZeB3zj7ogHjyAIDouwX2I1AAHbVxFJLdqzHl5brKD94dNyj8qen7rzXOAUng3bZwYxdprKwKvdhSvNpZaaS4y2NFCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755435967; c=relaxed/simple;
	bh=3PVQz1Npck8Dwovy/OX7P/UR/4Jfxuhm/zBlVDMlZZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WCgLpaSleDyvlqhGizgeL8t+89nocLyIjv5evt9DGACI+YljJpDeCBn+uNjJTQRD0MzHI1WnAme0bbeR1vjHhGmiBJbBi2x0QIVDtwn8rtRULRtf3GNFxpshhKnnuDKcObBVIHRGiSOSen4hP/Stc6frt39MbqI3bMiM2yda4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=mfUsreZ8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso2296035f8f.1
        for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1755435962; x=1756040762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+00MvInGtT/2ob9Rq8Xm3oOT1gPpF55RwkoNwuBCzSg=;
        b=mfUsreZ8VrW7YFhDwKFrIaVQdi++g2JN4tAf7o3zqt6SOm/CmMxhuc+PlPCXDWjQP8
         RiSP05NKSZTKkfVdLf2Sc8DpxVGNhMuOCBhxMARo/dN4EJDga9oMQale8LYZZtWdH4kV
         Tv+4Ni3UZ+Zt8wm1WaF2TI2WBvGwVkgTGQXztGJEEWbcn6pkRqtgT0lBgC+gMitaGWSN
         cstWN6WLZifJrYLYUflw+Wdq8IyoyesAhdiCRUx5UhakpqWZ/zCqbJ2h05Stolx83Aqg
         p2z5k1j2Gab8I9ZG9gGbKffMfq8Fxe1/ZdrYkXbXIIVtDUCd22vCE/at1FqbL1ruTfEw
         Zc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755435962; x=1756040762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+00MvInGtT/2ob9Rq8Xm3oOT1gPpF55RwkoNwuBCzSg=;
        b=BxwP/QlLyXZpdg2WStlrgwZ/jDyaQ0OZXTTEaiWW+6Qz8MFp3f88oEtrzVdJMzn4LQ
         RfcbsopqP2VmfIBHbl3iLZgI/1cmEFiHRTQ8GQg4nMMYg2cB8V/v9fvd6E/Jn9ZMtF8X
         T6U4/2Gntlj92kk5DNiGu5p2l6oBTzXINH9hsluX4VxU3vt+GXSIBQUs3q11vrVzmEfG
         Pj0OtsxlUeeRGkWGjKLFROPtgIs0R3TaFbcOxXubvcQW1asm1pCnZsjz5X7ehgSiKCoS
         3LSRGQXP9lePP9eFHw9csOqdBZKFUSqopkIXYjrFPwFJ57MpXyrLVo/G8rEbnIKIz3yw
         1d3A==
X-Forwarded-Encrypted: i=1; AJvYcCUH4Dvu3R1bCuiuGWRgk9/E+RwXveuwGEKF6kI2LTBAnaGYT8R52kL6M84qB2rBkx0JN18/e4URAICuHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWZtRj4Yo+RSlaYNh/fpoxyp1J8y11RM9IhRDjPBh+CfZZqqJ
	H/CQBQBjLWihTR+M0td+8EiII3YFqaiXTEDfmDKM8DWTDr29AeoHKdlDht7qVpHN6Vs=
X-Gm-Gg: ASbGncvxdAw8yWSXjaZx4cs3VtpDPMT5ZP2xgDsbfjDaIwRME3wdAcaCRoQL8obz9IJ
	+SeYlptSNCwP2bozMu4VMXRgYhtrKN+gz5FNvPyiW/8NIdBrUg6VjEj8BFT4F1yotLiYmQRMiex
	y5jgrEGnDncbiMG6y2Efr7D9LY3zsb5S1ZaiAv4OASWu0Ji8OIje/z+DXioGujZABypQ+cdxjog
	STib0c11p0wqrbZRJN7pxJ/wB3+UjuSjgM83ncClTT0MetnvjgBdQFgxOtGkKfIjcJ5GqOqxDGd
	hzNrEGP+i3vdFGZv9kifeNfD7JAEkkcuV0D+evgwkvY/Tk9LHupZ4sD3yPrqgLHVW7ee3W+R5uG
	loionTjvlDrBQxFpAIQuzdf6QTvl6eVR7i6I3
X-Google-Smtp-Source: AGHT+IEBquoYzqH1BGvf/UZy7kHktiJyWv/AzngI7aknei31lWrO45ZcaBJaFyvTvIKsx0U0NI0g2A==
X-Received: by 2002:a05:6000:4287:b0:3b9:16e5:bd1c with SMTP id ffacd0b85a97d-3bc6a55e8bfmr4038608f8f.31.1755435961484;
        Sun, 17 Aug 2025 06:06:01 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:b4c0:f0fd:db4c:31dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb93862fe7sm9235729f8f.64.2025.08.17.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 06:06:01 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: [PATCH v3 0/2] Pinefeat cef168 lens control board driver
Date: Sun, 17 Aug 2025 14:05:47 +0100
Message-Id: <20250817130549.7766-1-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Pinefeat adapter, which interfaces
Canon EF and EF-S lenses to non-Canon camera bodies. The cef168 circuit
control board provides an I2C interface for electronic focus and aperture
control. The driver integrates with the V4L2 sub-device API.

For more information about the product, see:
https://github.com/pinefeat/cef168

Changes in v3:
 - removed vcc-supply property and example
 - fixed incorrect type in assignment
 - fixed cast to restricted
 - removed unreachable code
 - changed comparison to NULL
 - fixed indent in commit message

Link to v2: https://lore.kernel.org/all/20250811213102.15703-1-aliaksandr.smirnou@gmail.com/

Patches:
  dt-bindings: Pinefeat cef168 lens control board
  media: i2c: Pinefeat cef168 lens control board driver

 .../bindings/media/i2c/pinefeat,cef168.yaml   |  48 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |   8 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cef168.c                    | 335 ++++++++++++++++++
 drivers/media/i2c/cef168.h                    |  51 +++
 7 files changed, 453 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
 create mode 100644 drivers/media/i2c/cef168.c
 create mode 100644 drivers/media/i2c/cef168.h


base-commit: 2b38afce25c4e1b8f943ff4f0a2b51d6c40f2ed2
-- 
2.34.1


