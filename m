Return-Path: <linux-media+bounces-38124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66508B0BB30
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 05:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446EE16133D
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 03:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF1B1F5852;
	Mon, 21 Jul 2025 03:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bst/akxN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F55231824;
	Mon, 21 Jul 2025 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753066877; cv=none; b=uLv/tlZsUOcd18jDX96ig2CzwjllwO9/YLiTLwRVMezo/G3SQnYdGI5+791tr78sjkMP3zzL2KTVoCCKcOLnN38mQjPsgAnxF76BLPmilVb7XopH2tnFnJYNQ1RvWyNnvg26TPIQ9Ajdyy+wIMh1gU9Gx4y6ZmxQXqqGnPHrNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753066877; c=relaxed/simple;
	bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0FFxn2bybUdP8oYYzdDWUUryHjrliN7qGjbFQeKt1b0cWJvc8mJEN1TNRKvTNnPDUMqypNDKGmTJ331ROrCVo2H0oLtBL52KwCOuxnJBNAfxSmSM9v0rIHXZhF/VrUH+2gcVXvCxr4vrUhi1L+cWvtxu3nBQA4F2sfQSkxvkj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bst/akxN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b440afa7so36127795ad.0;
        Sun, 20 Jul 2025 20:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753066876; x=1753671676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
        b=bst/akxNOEv3sGa+BV9rtJap/qhGGINCZ+ueFC2yFupSdKUx5h2mwA1O+oKFip9ho1
         WTQkjLQqgj+QtBnvtWMa4RqeWiPvW+Tn612Bg4drj7vFqvEilR/GoHr36rLILtErYDJt
         rl4p5xdumtqxI05D+9SyW4X0ZaKAyB+OqnFsMpgyD19x2/2Fj3dJk5POGOaCilfrgva1
         3isMIa31rohc3Rj12C9hEQ0HU3PlGT/GxqKnuDljfrTrzv/q6Z5wcqltL3HMbCn9kaEO
         PDjEJYu4lT8Jy1u7H4T+TOF90b2wDBjb9EOyQisXuO1ejTcKlpveD4tvdJYWgP+7UxdV
         /yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753066876; x=1753671676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
        b=LjeGLkjazoot59UA/vdXm+7XElFUsUu2iHT9AVFSx62oORjzsHtV+eCzYnBUQzrLKL
         +IZp6iUlCl4fNmSEBCFTEsp9KAcFAKbllzIFglw5serT34HObH2cX2XeToBpebWtNABt
         Y7Z3DiIyjeh6FlwkGQk5q0cvQQd62/XpjsTFe6vIIcmhCRJrRr8iABPW1NlOBD2M2wDa
         ARhomKFXZdYfzkla2IaB9MKaPgj8bLNajtW4becQFUtxmIXcBWNxCq4JvRukSfEwQT77
         09OoVqM3cUg4+RM/QxeWV0MArV4V7BqpE7Lmr02C8YjPOU7qhNCNkfKxVeDlxmnkolaS
         6teQ==
X-Forwarded-Encrypted: i=1; AJvYcCVED61IX7UyVBa+NbnCIBBnig4PM+xc1AoKFtI56ymqPGOodT7su78JbOE6ccmSJTbY8w/hyql4N1XGQtU=@vger.kernel.org, AJvYcCXe6GYi2gZoi7Ww7PJPc7HZGT5H1MD/jCj9EuGQm8VWf5+AfewQ4m1vZsQGTF48WDQNR4YBjA5+YSLnStc=@vger.kernel.org
X-Gm-Message-State: AOJu0YybRbYBIZ+qoiaY6lbsctF4daB8bPJbLBQhzuORkWYJo4TJEk20
	AIDyyUyMlEbLY5T51SBSUgUhZh8mmfSSV/xbXt9EiAvcDJrAjkwM9d19
X-Gm-Gg: ASbGncv4bG6W2LYInXnCuQjVrljEnniu/upK0T/+7tpdj/X2OwtFE/oK1Exg87yJVjx
	pwSz6285QsW0v6XpLT1mnlkHokqRewwphnIdwRAqjsDGbU4Ae99bFGLMJAYTj3GviN6zCNoEXf9
	dgR54CaO4BdV6RkVJNoMeYDaijTBcAOCQ96O9OuzWxytAb5UyssBt2VDH17b+1bAdnLVSmK8oWD
	rUUtNxgAmvMxeJn6fwk0FD+Ij4yKggMeJtAsuLO6Ijq/swC0MiQQAm3RMNUBtldEUiDZo+VxAB/
	W3ias/uylAhIL6+x7f+tVX0RvTEgVp0XHeTWbXcKmEl69QL9xWcwhEYv5s5npUUk2Y/VXFtv/cW
	WHp2MhrC+txdFGjLzxGT4RNrwhAomWO2ER2/Wp5Ll3t5JJfi8LNg=
X-Google-Smtp-Source: AGHT+IFP/N6z1VIii8Bp2Fa16eo13Y1LJqN122XUWAoeHZN2w85YjM8rCk1T3sf8CFfVOtmk8beZ4Q==
X-Received: by 2002:a17:903:2f0d:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-23e30338918mr211612585ad.27.1753066875644;
        Sun, 20 Jul 2025 20:01:15 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfdbdsm48264795ad.150.2025.07.20.20.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 20:01:15 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 21 Jul 2025 11:00:48 +0800
Subject: [PATCH v3 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-drm-v3-2-e16c3cee7263@gmail.com>
References: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
In-Reply-To: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753066865; l=2161;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
 b=ouZIEOXAZDz+gDkQdTxx/tKs6+3niY3xZuVKtci609CE7URJ59icO+k/+UP37nLGjQUkfRRj1
 RSqSRsyHgAdBsQBzcDc/NUw9oVrR5L4niFLA7WwZdoiuW/B65NuXf8P
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cd27f8ba5ae1d94660818525b5fa71db98c8acb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mayqueen Pixpaper e-ink display panel
+
+maintainers:
+  - LiangCheng Wang <zaq14760@gmail.com>
+
+description:
+  The Pixpaper is an e-ink display panel controlled via an SPI interface.
+  The panel has a resolution of 122x250 pixels and requires GPIO pins for
+  reset, busy, and data/command control.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: mayqueen,pixpaper
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 1000000
+    default: 1000000
+
+  reset-gpios:
+    maxItems: 1
+
+  busy-gpios:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - busy-gpios
+  - dc-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "mayqueen,pixpaper";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            reset-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+            dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1


