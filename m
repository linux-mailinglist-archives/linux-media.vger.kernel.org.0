Return-Path: <linux-media+bounces-28791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3CA719CC
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 16:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190F7840A7A
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 15:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531D71A5BA0;
	Wed, 26 Mar 2025 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yd9ZfB9n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387453D6F
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743001282; cv=none; b=Rx12NTXBlv7Mu0Eb1UIDEViGbYG3baVrNPqivcq45tHHbV+adY6llEwuQRwfZdV2QT3RskzdM7H0otURvL1melM7RF2Zew4cy73RGOx0HvWvIvhVMCTaAUw2iaDhXIPL7a/5PeyKYa5+0rlON0kj3luZp6M6Au9KC/AFwlIF1t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743001282; c=relaxed/simple;
	bh=dEEHMCaZuBhSVR8548s7dYibu0O+KizI9ENpYjHaHN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT2DQ7XM1md2pZOmw7vyxQoBj4DYaNxOtqdGkI6fZPjt0z/ZiKuuaO21W4UN8m8ZSfpEFc487x8/R/wOkeWy3lwGGQ/COkh+jPBnrrfgBBwSNrRBi3R54p6O+f7KnRmuWE+FsruKgxDVXNXHyg0W6IAwqimACDXSBXFYX+EA2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yd9ZfB9n; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912baafc58so5544403f8f.1
        for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743001278; x=1743606078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUwLKknfTenPDH0/Fy4kPfAbwbk8wFgm9qaIXqrjO4M=;
        b=yd9ZfB9nTXF5wq5BzojMmTUBfYVcZPSydrXn7BZwepclNK+VO5sbw55NN/oYckfGps
         FcftaAjLax/y/mPc667QZphb0UvPocLrCqBlaYAAuCs3gB/WwDd7ActX5PVi08vCbxyq
         pRmOY+DuiPQSiZJIPT+xWUxbw3beMHrpzZaOZq3aLH9P20GHPG3ls4gqwag0gkw/m6ye
         QP/Wq2bIhwBBgr48+bCmXWHxQgyKCRv4knNPwekULsHkWZieukrHL1IWGNED6KdWMzu/
         GiuX8Iybqu6+aZMr7VsNQAoE54X3k9ggve472s06VagRgU3yvtzVP57vbMZiLtmeLjmp
         dttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743001278; x=1743606078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUwLKknfTenPDH0/Fy4kPfAbwbk8wFgm9qaIXqrjO4M=;
        b=k/+qT+gokaYnbeTxf0rmnxpK3junFDoGk1sFXEg7xnqQyuqNW9mdmAQJ1FE4RO7WZo
         Z+TQQt63KLoESRjYKri8cje/j33R4jvqQaYJ+xtD155P43rnJCeN89y0uNls0qgkZNyP
         rX+0uI+fcSzF2e2kq+h5v0GsDSD8BPb3Yo6ULE8sszX7e0AUc/WC0OZPHfPJf9Sro2t8
         ID+z/3q13V86Jcb4AnfXfumd3lmRadCt7SNfitESGkcjnphrfCVw27Huu8yIN6bwdRQB
         sxMl7edWX2AsaJBEOSUrVYydih9BO6QTIDmrRoSdmeHLtsFZiEJs4rnDmCN7ShSqf5dM
         NqmQ==
X-Gm-Message-State: AOJu0YyShTf4GZRUCPkHJs0gD+0BSy/tz+U1nY64yo45r9l3bdh9dW/W
	XF6f2/eMNddOtFsv5tPUoySOzHlxKNW89YVrf1JROXIGfc1Or4ZbgOKyfJ9wcsQ=
X-Gm-Gg: ASbGnctwusOC2p+D7lK5auP7MXNXlgqTa7TAFJuLjd8lwGWGz7/P+1jmSg/7QlThX0w
	wDpCQDKgNW4KxERJNc4DjTedIlT9LKRBzw57GY4V+dHsWTz5dt8WbYAz4C2VwbwUoFUjM3/FniR
	d0pZypA3yImL+gme4WUUArGY86lTfbFNSg3FpULBY8i0FMBMxRVxEGx5l+3Bb0qHwrXMS8ckBKJ
	s6R8oqfwTpr0foPFvzJ2D5wbTOhG3gHKjus3KZ68rVvKmRaKvOeiUDl646VpjaF2X/V8Aql2Ykz
	SCriV5Pv5CkAC0GjD5ZMa07+NcfHWhfQ/gbPtw8OT+uePv6CuGtk6/rGi4pwpoYH8Hjnz3UGDU9
	q21btzMI14no+OLrY2CRlCc49
X-Google-Smtp-Source: AGHT+IFwJbRy2F6SHfurVSyLZ4rU1yis69Di0l4fXOHSEYK7xg2ZdnkrHcG3ZwZ/nzU4Utk7RDBoaw==
X-Received: by 2002:a5d:5f8b:0:b0:38f:231a:635e with SMTP id ffacd0b85a97d-3997f912722mr19224217f8f.25.1743001277560;
        Wed, 26 Mar 2025 08:01:17 -0700 (PDT)
Received: from inspiron14p-linux.ht.home (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f81sm17408125f8f.35.2025.03.26.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 08:01:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robh@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bod@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] media: dt-bindings: Add OmniVision OV02C10
Date: Wed, 26 Mar 2025 15:01:14 +0000
Message-ID: <20250326150114.71401-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324171508.GA668235-robh@kernel.org>
References: <20250324171508.GA668235-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for OVO2C10 a two megapixel 1080p RGB sensor.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov02c10.yaml      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
new file mode 100644
index 000000000000..8cd174075d52
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov02c10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV02C10 CMOS Sensor
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  The Omnivision OV02C10 is a 2 megapixel, CMOS image sensor which supports:
+  - Automatic black level calibration (ABLC)
+  - Programmable controls for frame rate, mirror and flip, binning, cropping
+    and windowing
+  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
+  - 2-lane MIPI D-PHY TX @ 800 Mbps per lane
+  - 1-lane MIPI D-PHY TX @ 1.5 Gbps per lane
+  - Dynamic defect pixel cancellation
+  - Standard SCCB command interface
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov02c10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            items:
+              - const: 1
+              - const: 2
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov02c10: camera@36 {
+            compatible = "ovti,ov02c10";
+            reg = <0x36>;
+
+            reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_rgb_defaultt>;
+
+            clocks = <&ov02c10_clk>;
+
+            assigned-clocks = <&ov02c10_clk>;
+            assigned-clock-parents = <&ov02c10_clk_parent>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_l7b_2p8>;
+            dvdd-supply = <&vreg_l7b_1p8>;
+            dovdd-supply = <&vreg_l3m_1p8>;
+
+            port {
+                ov02c10_ep: endpoint {
+                    remote-endpoint = <&csiphy4_ep>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.49.0


