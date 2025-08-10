Return-Path: <linux-media+bounces-39366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862BB1FC9D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 00:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C7871895D48
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 22:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4CB2BE620;
	Sun, 10 Aug 2025 22:10:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233E20D4FF;
	Sun, 10 Aug 2025 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863818; cv=none; b=rgZs/56KPI9fbHTxUmEA5p1MS5MpZhd+a6WkUmnbGV4+qHe+MgoIQAiB+dyERX7P0vxItwhLTmENscFNrfqPaI2LjxC3u1s8GPJrcJ9Q30r6Af9fcrMzGLVuMSuC4LvmTLci0lTWdtO3a6vsfkUW1UE7s/liazr5c0nGetW4ES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863818; c=relaxed/simple;
	bh=G68wyTteo9VmNABQsUfjg4kswoq72FPmt818iSFyXn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XbnxXyZv6fQp+0Og7ZRVDoXjPzzgLo88mvJpYFGl6xvNhwp3+LZqEnU9klCdu3jRcMEDPEYOc+rfS8YVM5sD2ZUwKX80tqUcCMgVHoh4PgbFD6XypL0vxoAMh8Q9TsdP6bq86IXqu5Ckq28328wcGsLJ6PWnZREKBo/kyXT0WPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31f255eb191so3841358a91.0;
        Sun, 10 Aug 2025 15:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863815; x=1755468615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3krEn/9cYqN/fDovrUoLGh2cVwyrKoWU5FC2Hs4k76k=;
        b=dPvqUc6U20kXJENEoDYsxANz8fvFCKIqdcYOk1bEY8xj9uIdvdAwMcJYYT02ZsLGmU
         STx0DiSkZ3N0vV5ELRTyp3Og03UlPLkCXwGnkkDf6uYSzLd/gSLzxNTmxpn0Swy9Sh3G
         K9170Da1oW6VS3pTtOXm4cWf7gAEWGnXYh0NMfRFC2DvOCYxAZjftQE62Yx4ApUspq8x
         JRNiiVLEAY26N5AjhTWfS0HwMO8l13lAjMO9CkGhrhF4+qqqv5booA7LdESryDFVr6Md
         qk18ujaTYajh4vsVAHayKOa2ExXEHpFtOE8B7/wVQO7UTYyTtBMt1wulvVbvwkq3HPO4
         szIw==
X-Forwarded-Encrypted: i=1; AJvYcCVN36hzWHr/iAFl9nWuIaB1tXbl75YJ5hupl6iFRLSmr1YVXO//w1tH5t52bolpGAwP3Hdc0SC3I/9w@vger.kernel.org, AJvYcCXhxJzuQ9tzfxVJkMvHZTUaU/IBXV69fctJlzmEaIe0ITJRhKZ4AFxmoUB/qjvKLfy27sn+pJo68WgF8gLl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NOMQ7XNUlAtsViA7uJ9N/4ybxrPFkkVAwgGa9+y8rUXOP+UV
	2gldJTXbh+2zyd43DohKXRsbNKjAtl3FEYTEph+POAndScyzA70HjM0p
X-Gm-Gg: ASbGncuWye8hSHryf0bf7d3lCnVydGpihy1MCEa6Hcvd8eCeF+iALs0h99LgW7yPJC9
	urMz6jCr+fv0anhw04SlUILSaC4e1EUtvYnfrXmb+/ri3zot6yqKch22HdyLDUJoHMJ4nE44BaL
	LYQ+rYcUh169NJ3SfvkCe2Idz238EjF0UZM/L2cDJZHt/Cdc2+odgikT7PB3IyrRe0Q3caZ9+bX
	5h5Iw/wPuf0GHc7JUiaEKMZs8S2AMHx0VsoHWy577PTz3iXVFNjmI7L911jmB6WikfF4FyIzJro
	ubJdW/XBJjXj6A+cUvyjEfUlV9ymcSRBrAUWAIJCnY3mvhxgNhSxi6lbKQt8ODEOSH53PlCYesl
	+YmhWx3OmWc4JixPOXMbIUjd2UPiu+39RbzshP/cq6hocDKHu33F6r4i4YxR9t4V0zz8=
X-Google-Smtp-Source: AGHT+IHVycpFEKek2S7JEZFXfX7JB07ZOO+8JCByaPzFT/J+gWDvifbNtQBaW8W0P+dVEavhKLSSvw==
X-Received: by 2002:a17:90b:50ce:b0:321:7528:ab43 with SMTP id 98e67ed59e1d1-32183c482fbmr17371641a91.24.1754863814883;
        Sun, 10 Aug 2025 15:10:14 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:14 -0700 (PDT)
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
Subject: [PATCH v2 4/4] media: docs: Add userspace-API guide for the IMX585 driver
Date: Sun, 10 Aug 2025 23:09:21 +0100
Message-Id: <20250810220921.14307-5-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new IMX585 V4L2 sub-device driver introduces several
driver-specific controls for configuring Clear-HDR blending,
gradation compression thresholds, and HCG enabling.  This patch adds
an rst document under Documentation/userspace-api/media/drivers/
that details each control, allowed values, and their effects.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |   1 +
 MAINTAINERS                                   |   1 +
 3 files changed, 124 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst

diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Documentation/userspace-api/media/drivers/imx585.rst
new file mode 100644
index 000000000..9f7c16f30
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/imx585.rst
@@ -0,0 +1,122 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Sony IMX585 driver
+==================
+
+The IMX585 image-sensor driver provides the following *driver-specific*
+V4L2 controls.  They are visible only when the IMX585 driver is loaded
+and sit in the sensor-private control class.
+
+HDR data blending
+-----------------
+
+``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
+    Lower/upper **thresholds** (0 – 4095) that decide which exposure is
+    chosen—or blended—for each pixel in Clear-HDR mode.
+
+``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
+    **Blending ratio** between the long-gain (LG) and
+    high-gain (HG) read-outs.
+
+    .. flat-table::
+       :stub-columns: 0
+       :widths: 1 5
+
+       * - ``0``
+         - HG ½, LG ½
+       * - ``1``
+         - HG ¾, LG ¼
+       * - ``2``     # duplicate ratio present in the datasheet
+         - HG ½, LG ½
+       * - ``3``
+         - HG ⅞, LG ⅛
+       * - ``4``
+         - HG 15⁄16, LG 1⁄16
+       * - ``5``     # second 50/50 entry as documented
+         - **2ⁿᵈ** HG ½, LG ½
+       * - ``6``
+         - HG 1⁄16, LG 15⁄16
+       * - ``7``
+         - HG ⅛, LG ⅞
+       * - ``8``
+         - HG ¼, LG ¾
+
+Gradation compression
+---------------------
+
+``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
+    17-bit **break-points** (0 – 0x1ffff) that shape the 16-bit
+    gradation-compression curve.
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
+    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
+    **Compression ratios** below the first break-point and between the
+    two break-points, respectively.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 4
+
+        * - ``0``
+          - 1 : 1
+        * - ``1``
+          - 1 : 2
+        * - ``2``
+          - 1 : 4   *(default for COMP_L)*
+        * - ``3``
+          - 1 : 8
+        * - ``4``
+          - 1 : 16
+        * - ``5``
+          - 1 : 32
+        * - ``6``
+          - 1 : 64  *(default for COMP_H)*
+        * - ``7``
+          - 1 : 128
+        * - ``8``
+          - 1 : 256
+        * - ``9``
+          - 1 : 512
+        * - ``10``
+          - 1 : 1024
+        * - ``11``
+          - 1 : 2048
+
+Gain settings
+-------------
+
+``V4L2_CID_IMX585_HDR_GAIN``  (menu)
+    **Additional gain** (in dB) applied to the high-gain path when
+    Clear-HDR is active.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 3
+
+        * - ``0``
+          - +0 dB
+        * - ``1``
+          - +6 dB
+        * - ``2``
+          - +12 dB *(default)*
+        * - ``3``
+          - +18 dB
+        * - ``4``
+          - +24 dB
+        * - ``5``
+          - +29.1 dB
+
+``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
+    Toggle **High-Conversion-Gain** mode.
+
+    *0 = LCG (default), 1 = HCG.*
+
+Notes
+-----
+
+* Controls are writable while streaming; changes take effect from the
+  next frame.
+* HDR-specific controls are hidden when HDR is disabled.
+* Inter-control dependencies are enforced by the driver.
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b..87912acfb 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx2341x-uapi
 	dw100
 	imx-uapi
+	imx585
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/MAINTAINERS b/MAINTAINERS
index 175f5236a..42e32b6ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,7 @@ M:	Will Whang <will@willwhang.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	Documentation/userspace-api/media/drivers/imx585.rst
 F:	drivers/media/i2c/imx585.c
 F:	include/uapi/linux/imx585.h
 
-- 
2.39.5


