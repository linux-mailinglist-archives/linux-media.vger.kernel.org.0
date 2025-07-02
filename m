Return-Path: <linux-media+bounces-36508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A54AF0BD0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C97C7AC804
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7AF230BC2;
	Wed,  2 Jul 2025 06:39:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78962236F3;
	Wed,  2 Jul 2025 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438340; cv=none; b=fb/Yg1kSsgWNoG63O1AP+IN5NG9OvzvPW7nKK3g351lNpH63fOUJCFVXuiu5yreDZxYI+zglQ52xjzS3vf1njQVEZuhRP7WbwcTEXBz8FSvX38HIXzcjkr6k6Ugrk4FRma/NrrIUYVFNCM2H6Sk9W9An+Fk7uN4oK6oPcx0IH8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438340; c=relaxed/simple;
	bh=pL0ZMotY71CP45hBo02QTexa6+MqXmOEhp0hVHal67Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UmkDrpLCBJlsn8A9fEyykp4oC5pVP4zB/AqedU/5/ftHr63pwDcUVkpsVCdNVXKrSITs8dB86dHbvYXGZ5Bug9LjQXD+qcXv+GVFVtWpD38PQ5Okd1v6ELEmFnE2k/ved7oz1056rj+cOMftobgWNeJRx5D6LzaitrWm8uAOLI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c44e014so6588697b3a.3;
        Tue, 01 Jul 2025 23:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438337; x=1752043137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXwezkP7c8pGscSKlBvamtKez7/0qfT6TtR30gL2C34=;
        b=TrbcNwrKPqY+lklj25d9czk2tXL4DS9mj6/cRp4ZbGgH3pyMpKGS+yuSs4/QWNjyG3
         1j5JNLQ3ikY3IwrpydRPGj+2dWM9g61Rnmi2r7ztjL1cnWYLjtfGbIl5NIAt0EUbqnIM
         2lRuNccXizYXNlNiAtk6WSeGa1+zqQiPMPjqk/1PmgNW4bP0onUR04lN3Upsil83vzu3
         9A0zYBENO5oFlYKW3560FFFkTixjoHiaXbr/jlD7bHl6WuzJqKUubeF1ldCbnceL6Qpl
         KF6PXCepNTytx4X7IBEsPsHv8uSscYAcgz1vdj9CerIq13Z7ba8+6jA9lMPxomKK1x/M
         DI7A==
X-Forwarded-Encrypted: i=1; AJvYcCXP6znjVQwd9ePWZ0I/0pZPp7uVbT6MjGSSfkP7KEI7VssDWRGFE1TOSx1R84X4QDzphjbUe1g3jQa61T4=@vger.kernel.org, AJvYcCXXshEbibhaKk3lyZSfyvolaLd+zq1aB3uk3ZM9QTdhtQ4lzHfqMraFiJwZZrKMQ2LOAfe6qq/j4VTvUFN5@vger.kernel.org, AJvYcCXatJmz6ndIr8G+QQF8QvfCyjsLp3pYVYe3uHk8uOfP4X85PA4ErzTG4CvcqCyqhnWbAyOmH0QfKdKw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0HuXnaVph3JnXcV0wtWpvAbnVWSfPUJsqVUx2mC41LGl9HsKA
	lf9jeOoNXCQhq3YOp4dVFDI8r9Ec21jZ4Zsyfec5k6Uhs0M0+cxQ5S2k
X-Gm-Gg: ASbGncvgVYBmXbpLux6n4fcgv+I17UovONpKxAuoHeMcSD253avFoDSECAcBFHwZriV
	rW3psI9uz1JxGWGaXwJAYY8yrfV6BGsVFLHG64wS1MG6MTYRHYWZt4OnY3njHC8/QiQZqn+asQp
	ObFZV7kMMYnY8H5O0dLnGkGM2Mpvd7Iv0JR0I0W0onjcOkPthuQlalqi4ADtB7kvzA3e5env3Bn
	P3M9CXxVNPIMg5XpNsAIIu8Py3ho15FFrVohu9Ykki4l4A9sFp1E+EPi6p4eR9CLQHJ+aX9rUjr
	brBFV5Yvoutom3K9DwUWJEfakDNBYaZCZ1c2X9670LkNm+smIl7LDGtibfsYzSUswc24WM11OQm
	EHbdeqdgTnPBOnEfcNPcnjQ8IDMazXw==
X-Google-Smtp-Source: AGHT+IEuZYwGM2AS0Kzh5zxNMXbQXDcl00Lu716BusQDkwurQQA7D5GDryC+Vasxb2gvxpSwIi3/6Q==
X-Received: by 2002:a05:6a00:1253:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-74b50f54180mr2680527b3a.18.1751438337114;
        Tue, 01 Jul 2025 23:38:57 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd0fsm13044966b3a.40.2025.07.01.23.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:38:55 -0700 (PDT)
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
Subject: [PATCH v1 4/4] media: docs: Add userspace-API guide for the IMX585 driver
Date: Wed,  2 Jul 2025 07:38:36 +0100
Message-Id: <20250702063836.3984-5-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702063836.3984-1-will@willwhang.com>
References: <20250702063836.3984-1-will@willwhang.com>
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
that details each control, allowed values, and their effect

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../userspace-api/media/drivers/imx585.rst    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst

diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Documentation/userspace-api/media/drivers/imx585.rst
new file mode 100644
index 000000000..bb08afa93
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/imx585.rst
@@ -0,0 +1,95 @@
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
+        :stub-columns: 0
+        :widths: 1 5
+
+        * - ``0``  - HG ½, LG ½
+        * - ``1``  - HG ¾, LG ¼
+        * - ``2``  - HG ½, LG ½  *(duplicate ratio present in the
+          datasheet)*
+        * - ``3``  - HG ⅞, LG ⅛
+        * - ``4``  - HG 15⁄16, LG 1⁄16
+        * - ``5``  - **2ⁿᵈ** HG ½, LG ½  *(second 50 %-50 % entry as
+          documented)*
+        * - ``6``  - HG 1⁄16, LG 15⁄16
+        * - ``7``  - HG ⅛, LG ⅞
+        * - ``8``  - HG ¼, LG ¾
+
+Gradation compression
+---------------------
+
+``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
+    17-bit **break-points** (0 – 0x1ffff) that shape the 16-bit
+    gradation-compression curve.
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
+``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
+    **Compression ratios** below the first break-point and between the
+    two break-points, respectively.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 4
+
+        * - ``0``  - 1 : 1
+        * - ``1``  - 1 : 2
+        * - ``2``  - 1 : 4   *(default for COMP_L)*
+        * - ``3``  - 1 : 8
+        * - ``4``  - 1 : 16
+        * - ``5``  - 1 : 32
+        * - ``6``  - 1 : 64  *(default for COMP_H)*
+        * - ``7``  - 1 : 128
+        * - ``8``  - 1 : 256
+        * - ``9``  - 1 : 512
+        * - ``10`` - 1 : 1024
+        * - ``11`` - 1 : 2048
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
+        * - ``0``  - +0 dB
+        * - ``1``  - +6 dB
+        * - ``2``  - +12 dB *(default)*
+        * - ``3``  - +18 dB
+        * - ``4``  - +24 dB
+        * - ``5``  - +29.1 dB
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
-- 
2.39.5


