Return-Path: <linux-media+bounces-39470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB68B21770
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 827827ABCC7
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8248C2E2F1C;
	Mon, 11 Aug 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="fHPznUfg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B352E2F02
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947902; cv=none; b=VJG6TExvEZYD9ZxB/4zD6mDPqFdXrUV7gQv/cx8NA7tOBSybyBI3q27ra2k9furE7EXk+Chu8OY3XYx85OQFh4qcKvWtV2/r5kysZJfzNpVGM9Y9TyVbVt+Pf0O3YZ9Ma4/3c6es/XwUQ1MVezx9LGxhaV4OEGftg5shU7chZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947902; c=relaxed/simple;
	bh=mH1KMnGR+XUrI8L0FCKy07QnW+kkqMzlPl8BlW5s7Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rh5ew/EN/Lb68+qPQrwpsU5B0nl18zZyzploeMoSGYsd2QDl3h5ZZ0VlZP6r2eZcO4UnoXtGzF98+luLnzEyK4vuRDdVCkpkse3C56i1SH4OUPrM0K/RdW311cE81UD7+0hUZIiiSPajTgY+vo0+A/ci4pSfA76uzheYrxHhFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=fHPznUfg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-458ba079338so37485345e9.1
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 14:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1754947899; x=1755552699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhHE/8QAww8bZTkCasgOGL4wfh1aWV6rClxlRHnPYl4=;
        b=fHPznUfg087tFX79GvSm5ACDcYxGtLVV7priFLc6SLndYaww0u8EyApYltyac7/RZK
         Spi1aawtayyELb+pgt1DLm8QVpXS4KbFZPujmXQhCm9IZSClCkAjImQ/QBS6j98AMthk
         H+lqmSi8V7BzUlVTbKZjbawKaK9CGKlOP3Gdlm3ui0IokAUiiPR03PG6EnnV3MhOWZd/
         PpO8yDnF2+/Woz0Go3WHOpd0CIO7cru2CL0sAoqB7Sjo7TRkMfCCVst37NDqpzuLR7Ry
         hMwHmX7J8zP3mkYdSvLlmBF2Ypgww9p8N8EiffZe1ApfTZeKnKtnveWI1QDLhxpwcKYd
         fJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754947899; x=1755552699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhHE/8QAww8bZTkCasgOGL4wfh1aWV6rClxlRHnPYl4=;
        b=lGiPHDhGqoDDpYnAec4zy++T+ILS+Tni+JPmufFgeqqtifpLcWU/TzR3Td5xOQR32H
         HB+OsemgutgiDSiICwPi8lizyDJ0lFiiqrVSmmEzhkMSkZ3B6BIQMXrG0ohEFTzVUWa+
         sFOLGg+gjuUu+kBthsCRl+D/ImZOrTIPEr8E1PqMtrcMv2SSEv4VL8/ZfaAVqzfLDBxw
         qoB+xZkL/khkHGn51d4Swf5lHapJDi4WTFV75SdOk4RhVBdd+dn5YHIu4u0cdHfs6BOL
         13ZxPhfS2hgxvE10v1+HRd6rbNYihq9VIkQR+77zhDHLnLO0CCn3XXjYqfa4WUTMIB58
         7bDA==
X-Forwarded-Encrypted: i=1; AJvYcCUl93QGmCJznVf0XnV3oukXJu3b/OvnHkU7WKhs0VARxcRip9XHizks9IizAVZhMrnshGJ3EwiHbYHsVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7jjABld55HYFV0RX4+KdbhLtQiirRwsP2NE6FSSRPrtBAv4C
	c1VM1LA+eRwHg08HBSUNZUTFVWhcH68FMTa/I9ALt1wD23gz2/Bv2VaV7LwbuHOyTc4=
X-Gm-Gg: ASbGncvfMKXtkHsrjFqMuOA6LveCt8ZhOa/NR6RXoq9OQKdKqkndeuHs3fpzlfVu9Dq
	SVNkJ3ddP/m9x4Pc2wBlvVpYh1UUgPaDGNGJYRo91IJ6lrGlKOqFH61UJkQlvdJ3haPOfqhJSRD
	HqcHTeNb/wNktQNbTFInhwoBsIeFBcCBg5oYvbiXMF9Fed41rlDPiQBYtAahfFlUEMiSSSY1lcE
	EHJiYDpWtTtUnBIdzmb3QasFw6T61f5NBearqsQMqGDAGCiQU3BKNKZ3AdrJeut50qJG2Zk5ROQ
	miSDg3OsfKzobeuyytjI7o80xnZ/aRwin/KzOQfCQZ36u/+MYr5OoyG7az+Q6W0EqE+R1Svbyyd
	TTQQxVg7eXLQqZtEzfLJMbOt40gTOZQfShsUzNfCl1BtaaIGTAFw8lYF8Nes=
X-Google-Smtp-Source: AGHT+IF3sgOQh/DoU/bwRIxmb6kfg2ojWEPdxg5wHP7MJpFbD2YwAp8jeRfHrHkI1kRvJtz4JYjjSQ==
X-Received: by 2002:a05:600c:47d4:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-45a10dd53ebmr5752515e9.13.1754947898989;
        Mon, 11 Aug 2025 14:31:38 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:f8cb:3493:2eed:8d11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c485444sm42397387f8f.66.2025.08.11.14.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 14:31:38 -0700 (PDT)
From: Alexander Smirnov <asmirnou@pinefeat.co.uk>
X-Google-Original-From: Alexander Smirnov <aliaksandr.smirnou@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: [PATCH v2 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Mon, 11 Aug 2025 22:31:01 +0100
Message-Id: <20250811213102.15703-2-aliaksandr.smirnou@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811213102.15703-1-aliaksandr.smirnou@gmail.com>
References: <20250811213102.15703-1-aliaksandr.smirnou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliaksandr Smirnou <support@pinefeat.co.uk>

Add the Device Tree schema and examples for the Pinefeat cef168 lens
 control board. This board interfaces Canon EF & EF-S lenses with
 non-Canon camera bodies, enabling electronic control of focus and
 aperture via V4L2.

Signed-off-by: Aliaksandr Smirnou <support@pinefeat.co.uk>
---
 .../bindings/media/i2c/pinefeat,cef168.yaml   | 52 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
new file mode 100644
index 000000000000..3563fb1d46db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 Pinefeat LLP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinefeat cef168 lens driver
+
+maintainers:
+  - Aliaksandr Smirnou <support@pinefeat.co.uk>
+
+description: |
+  Pinefeat produces an adapter designed to interface between
+  Canon EF & EF-S lenses and non-Canon camera bodies, incorporating
+  features for electronic focus and aperture adjustment. The cef168
+  circuit board, included with the adapter, provides a software
+  programming interface that allows control of lens focus and
+  aperture positions. This driver enables controlling the lens
+  focus and aperture via the V4L2 (Video4Linux2) API.
+
+properties:
+  compatible:
+    enum:
+      - pinefeat,cef168
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: VDD 3v3 power supply
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-lens@d {
+            compatible = "pinefeat,cef168";
+            reg = <0x0d>;
+            vcc-supply = <&vdd_3v3_reg>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54..dab27f769b0a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1195,6 +1195,8 @@ patternProperties:
     description: Picochip Ltd
   "^pine64,.*":
     description: Pine64
+  "^pinefeat,.*":
+    description: Pinefeat LLP
   "^pineriver,.*":
     description: Shenzhen PineRiver Designs Co., Ltd.
   "^pixcir,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..811c6a150029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19985,6 +19985,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
 F:	drivers/input/keyboard/pinephone-keyboard.c
 
+PINEFEAT CEF168 LENS DRIVER
+M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
+
 PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.34.1


