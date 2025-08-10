Return-Path: <linux-media+bounces-39363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C99B1FC95
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 00:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C453B89D6
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 22:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629D12BD03F;
	Sun, 10 Aug 2025 22:10:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F5E262FC5;
	Sun, 10 Aug 2025 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863812; cv=none; b=ZZN9dtkUUsAALj5NWeFT4CinivjwXtnJtehHGZS0URGZjJ+M5oB1o7PVTB7K77QjroGUgSX4yDY8tVMR1xFIWm3O0x0sWjydDBzNg0wm3UMVcAWTY45QfPdEPwEhez+RnGAKDn8wPSdkOAsAV2G7VAiChilF0M/rt4IGc8nqJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863812; c=relaxed/simple;
	bh=N8fBcBXmtwQEhSoTEhd14xL4MKGzTEpsEM4hoyFwqe4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NMjOfnzov0Ytrh5g51GbWIDZBetifL7cHKzMyq2u5BNYyVyu4fcLuLKzObt1Tvp3ZRB4yrvSUsg40rNiog505pUTAzOGtDKIzolEpti2X37oAbWemLTx6Bqh2OhPuCpi7amkOkoa0KAxQovRRFn9a40tCv8RKjvl9Qr1bQwWI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31f325c1bc1so3281864a91.1;
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863810; x=1755468610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTvufXihPkQWxsCzNlViO5S18/a/xN0mVbfR50DxXrg=;
        b=AzuaoT6QD9mG0GyBqaOrFnSAW87MYA3kDB/9BqIbp9rk7LefnCsuk4XC0gNSiVjceH
         7ixVeGus2leJKBH1xIR239KF5NVzmenfYdUvreVuAMDARN/A4DTPpqHmWNH/+MYPMkXC
         fcbhlD9TuXxOgsm11izlYGKRGGY7c+CtCxKoBA7GXfHF2ca+BUiuWo7vKzhYigq7XYYc
         aJFOQ49QFdK+X9x1HmX4XLmAU8b+mHTiQXLDsmpmi9YbaWl8kSs0n7ZW2fLKrsbmZ07n
         qv71M+koN7livI/4+FKj2uVp6zZq7ucrji/I88qA6z+ZaDPRJkOyHtlCOlsgZcLSzg8y
         CX/w==
X-Forwarded-Encrypted: i=1; AJvYcCUkP9xYyMUL3aIVahMhGaVD2dK7QDuA7TGEQIVItcHR9IgsRXDzMcSMV9AIYxqcW4qSuA/VHHJcOhjY@vger.kernel.org, AJvYcCV5ZH1B9lxmFR8V6NNWLtrd79r+/WRj1dKV3o19HkU6qvYg//sdZofLmFKLGc+8TG0tcxnx0uCEyUeZcPgo@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWy9qnSHS/KkHoI9ldjjOnlAS2uofPZAUO3bAAfBPRbl4Ntyn
	64UuMeciG7QUfG9x8xraEI5N2VobIrR7/vA2CfjLcj6lLRlzlj7cRF0m
X-Gm-Gg: ASbGncsEiCSvJ2RJxeyKNzBwdUUKnbKPON0gmL+byZi51F2FBapOONav8YSTMslfCnk
	DN/5j9qkgDAqbz6oTysOzWxX9jM5l5vr9QvAwwA8Q0xqWYvq8MSpKJ+jICZiP+LZL0kYWiCdVXc
	+OiNRs8a8fd16VApCp8awCtyLUUtNBwe8/7aMExqTZSeenj7FpydNbTdGnn9iwR97dZuOmsJqeg
	kOxFvxCkS7MCtlxIs4dseLuA00sHoz1PtBawalNRc2GNFWaG1dCpACBL1H74XkVT6lWsxpgVpNK
	3WsXjTz1m8oTeuktNe7L65LxXn6zi9SYFfT1DLYxcCHUAOJVpY057jeFcj+fjMz8Src2rl42sgV
	2NUFecWKoXGckDFNIrz3PhySni2oBznNojffBZBFU6W3Zza3ybd/jUhosxiFEhQ2RFHE=
X-Google-Smtp-Source: AGHT+IFazFKcYUWG6jSvxekQQq+aNyqACCfmdDeYCyWCL/tzLKLiOHWFEewxmiV48lSL8BmFoshC3Q==
X-Received: by 2002:a17:90b:4f47:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-321838a61fdmr17485662a91.0.1754863809549;
        Sun, 10 Aug 2025 15:10:09 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:09 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] media: Add Sony IMX585 image sensor support
Date: Sun, 10 Aug 2025 23:09:17 +0100
Message-Id: <20250810220921.14307-1-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This is v2 of the IMX585 series. It adds ClearHDR controls, fixes mono
format handling, and ensures HCG can’t be enabled while HDR is active.

Changes in v2:
  - Move to V4L2 active State API.
  - Shift the I2C registers read/write to v4l2-cci.
  - Remove IR Filter switch support.
  - Various log/trace noise trimmed or moved to debug print.
  - Lock/ignore HCG when HDR is enabled; mark control inactive.
  - Using compatible string for mono sensor.
  - dt-bindings: drop redundant maxItems/minItems/names,
    add "sony,imx585-mono", fix quoted string lint.

Features
==========
  * 4-lane or 2-lane MIPI-CSI-2 up to 2079 Mbps/lane
  * 4 K @ 60 fps 12-bit linear, 4 K @ 30 fps 16-bit Clear-HDR,
    4 K @ 30 fps 12-bit gradient compression Clear-HDR
    1080p binning mode, mono hardware variant, HCG support.
  * New Sensor Dependent V4L2 controls for
    HDR blending, grad-compression, HCG enable and Enable ClearHDR.
  * Blacklevel adjustments through V4L2_CID_BRIGHTNESS.
  * Multi Camera synchronization mode support.

Testing
==========
  - Platform: Raspberry Pi 5, 4 lanes
  - Formats: Y12/Y16 (mono), SRGGB12/SRGGB16 (color)
  - Verified HDR on/off toggling updates ranges (exposure/gain/HMAX/VMAX)
  - HCG is inactive and ignored when HDR=1; active in normal mode

Series layout
=============
  1. **dt-bindings: media: Add Sony IMX585 CMOS image sensor**
  2. **media: uapi: Add custom IMX585 control IDs**
  3. **media: i2c: imx585: Add Sony IMX585 image-sensor driver**
  4. **media: docs: Add userspace-API guide for the IMX585 driver**

Link to v1: https://lore.kernel.org/linux-media/20250702063836.3984-1-will@willwhang.com/

Thanks for reviewing!

Signed-off-by: Will Whang <will@willwhang.com>

Will Whang (4):
  dt-bindings: media: Add Sony IMX585 CMOS image sensor
  media: uapi: Add custom IMX585 control IDs
  media: i2c: imx585: Add Sony IMX585 image-sensor driver
  media: docs: Add userspace-API guide for the IMX585 driver

 .../bindings/media/i2c/sony,imx585.yaml       |  116 ++
 .../userspace-api/media/drivers/imx585.rst    |  122 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx585.c                    | 1768 +++++++++++++++++
 include/uapi/linux/imx585.h                   |   20 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2052 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
 create mode 100644 drivers/media/i2c/imx585.c
 create mode 100644 include/uapi/linux/imx585.h

-- 
2.39.5


