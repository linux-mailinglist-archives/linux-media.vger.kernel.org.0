Return-Path: <linux-media+bounces-36504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31979AF0BC2
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA5C1BC641B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B07224B01;
	Wed,  2 Jul 2025 06:38:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E65B4C98;
	Wed,  2 Jul 2025 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438329; cv=none; b=VFagoESz+w5IR0oCTzZr80ajC7IcsDA7qWiqD8ESM2hs9WuPer9xMDMT6EyL6HgfwNqM+biREdZ3nja+z2jF6kb3AZBf58dCfEsmszRkioy9PunqsBv7wSqZnup2hIFVK8m/0PWTqhrWIyDJFuEnPn+rkKeXdwKYiUDT3NNRm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438329; c=relaxed/simple;
	bh=Cf3l06xHvHtNnLb0KdSSZDQ+C93CQDr1YKJxP72iPzQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=QNIcmFIYfybDGpEXA/QyqID7EWAEJhqWxJkoNWzR441oe12EDqIwrcNx+GUk1eRiP96R1nyxkRDlr6TO+qdQIy+gOsdiu8dl1iOJv6cj09xDE1mGpVAyTiiBFtDoL5LAINBas7lPORTUHdbHZzLsSyXC3tnKHskRCjLtzxAfwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748e63d4b05so2698576b3a.2;
        Tue, 01 Jul 2025 23:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438328; x=1752043128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aF+x884e7po8uJiTEdxxj0MJKFysogBgcedgVoopug=;
        b=Dyl1LRnLZL2p/ofMk0kpVXKJdunCnAiVPgzPHCEZW8L2wdhG1UuNzlM0feXYt58S+I
         tfSDLGk4S+hEtERWOfArr6Dxzp5xRmgqz/cF+TIF0KOcGJiDYksL63JWqNgqTWa3fyYz
         pNnJbcQYvgo2O4DmYdzmO7vmyDBqxA9GTLV17tALktSy1hztPLEeYXlfu/n8VL1ipbDR
         qPNWvnm/dZFLNbWrX3mAnmBu4x3fjC68/2ploxC2I3+/mv8aBh/42q3XlmQMr08+kpNQ
         OX5kktgpmQVYO138kyUF+6GQIsV7UNLB1yw7rwJuHc6GO2ufyvX5QKsMUaCGREOfWyMH
         KQfw==
X-Forwarded-Encrypted: i=1; AJvYcCVlmoGjfnkJ2EVaL6XHLYEUphnfBfYuOPiFDbQxiKRh1R88/uFJsLnbiZELGVyIws6IdoBuCesuA8SVGD7D@vger.kernel.org, AJvYcCWBt+9ciAH/ELcIdyC2uLGDkrxPpo+hJ74BMY1Ho9uBEm3pLsL0doYrEB9onxWLeVHWGkTQSVAcTh1x@vger.kernel.org, AJvYcCWiF143gqxMHw/CdC/WL51Bg2Wgz/r6IGdRHo1U5qpJoPTtgv1UAoUy6ZF+DzOJToRfSxp1DzlY00K+y4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQ+ni0BQPyiDJ5Vh+zyiyIEu/LnsP/aiOqb9rzl3YsckBxjWV
	bSwYB+8Mt+R1n85fkASi+Z53M++adCbxpFppYNUP1tZGonByRWljSaoU
X-Gm-Gg: ASbGncu2M3NzG8+D9e/NlqBi7DN9oO3JG4HerOt2F/Q6BzovzzuoMGLkoXs3T4pd1ba
	7W28u+IdCHrH6FNDwhTkWOtp8byr5NdeL6GgqXa+AcpbDFE483FT1Cid1OL160GVc8wTH4ZB0N3
	vpWNcaTcqCKUvcNcNg0HfOvRZ2yVnt85NoyWCBHDpLFBUmy2Y4vWoG/qWQI1AtVqZFCxf8vn9d4
	ZH3sS/ix5+rjqul2rcrqEMODP0WD4sTmTqpuUITz6UvythDCswAG6og7QEBmBOjitqAm6IV2MCA
	YYsTHwqiZHob9p+2IroDbgRuCxSaD3CTD73K1Gs+BoL1jV43HnUaS7gt80gQil/8hsrdAYwgsFu
	QTUA0DLxTgcpfwUSLtMLYPKR3N5j35w==
X-Google-Smtp-Source: AGHT+IF7l9eDVq7s4+Ly+sarfvaf4sApavVOT+Vk3RN3qImFJb19SlYtMSU7h2Fk8oqh98QDVDt04A==
X-Received: by 2002:a05:6a21:7a47:b0:220:689c:315c with SMTP id adf61e73a8af0-222d7dc4f50mr3536922637.3.1751438327580;
        Tue, 01 Jul 2025 23:38:47 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd0fsm13044966b3a.40.2025.07.01.23.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:38:46 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org (open list:SONY IMX585 SENSOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v1 0/4] media: Add Sony IMX585 image sensor support
Date: Wed,  2 Jul 2025 07:38:32 +0100
Message-Id: <20250702063836.3984-1-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following 4-patch series adds upstream support for the Sony
IMX585 CMOS image-sensor.

Features
==========
  * 4-lane or 2-lane MIPI-CSI-2 up to 2079 Mbps/lane
  * 4 K @ 60 fps 12-bit linear, 4 K @ 30 fps 16-bit Clear-HDR,
    4 K @ 30 fps 12-bit gradient compression Clear-HDR
    1080p binning mode, mono hardware variant, HCG support.
  * New Sensor Dependent V4L2 controls for
    HDR blending, grad-compression, HCG enable and Enable ClearHDR.
  * Additional IRCut filter support through V4L2_CID_BAND_STOP_FILTER.
  * Blacklevel adjustments through V4L2_CID_BRIGHTNESS.
  * Multi Camera synchronization mode support.

The driver has been validated on Raspberry Pi 4 B and Pi 5 using libcamera
with a 24 MHz master clock.

Series layout
=============

  1. **dt-bindings: media: Add Sony IMX585 CMOS image sensor**
  2. **media: uapi: Add custom IMX585 control IDs**
  3. **media: i2c: imx585: Add Sony IMX585 image-sensor driver**
  4. **media: docs: Add userspace-API guide for the IMX585 driver**

Feedback is welcome, in particular on the private-control API.
Thanks in advance for your review!

v1:
 - initial posting

Regards,
Will

Will Whang (4):
  dt-bindings: media: Add Sony IMX585 CMOS image sensor
  media: uapi: Add custom IMX585 control IDs
  media: i2c: imx585: Add Sony IMX585 image-sensor driver
  media: docs: Add userspace-API guide for the IMX585 driver

 .../bindings/media/i2c/sony,imx585.yaml       |  120 +
 .../userspace-api/media/drivers/imx585.rst    |   95 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx585.c                    | 2466 +++++++++++++++++
 include/uapi/linux/imx585.h                   |   20 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 8 files changed, 2725 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
 create mode 100644 drivers/media/i2c/imx585.c
 create mode 100644 include/uapi/linux/imx585.h

-- 
2.39.5


