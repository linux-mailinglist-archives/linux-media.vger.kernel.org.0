Return-Path: <linux-media+bounces-38887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E812AB1AD9C
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 07:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97AFC3BE699
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 05:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4A2211A05;
	Tue,  5 Aug 2025 05:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcP3dpQg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1C21ABBB;
	Tue,  5 Aug 2025 05:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754372419; cv=none; b=eMQPX0/L8hEP1BkH8VgrZ1uAs+ZqwRQzFcxWIJVw2F4oonTm6V88Ny2TxbN6DZ4kO+dOKIjdk5GRQYnDfVosrty1n8JEaYddG3/x3N8BizxEbhPqaccNSEiC68t4RUbcP9ACrwBHdYt1bm4sGvWvBXzXSYEoHC0LszysKSkPz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754372419; c=relaxed/simple;
	bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnDWC0fjBfluXnszGUfeK+1YM18QWzNy98Xlx0OLJaSPBf0cVnFwFBAJ1cGXhUXjseOglTq5ABcarPuaJSZ4a3vaZucU1A0jLXc88SxNy9Y+ku6OKjopjj3yNj5gZvm9c9YN48vQBnzK4d0t1qAQ4hWpgWORPGZabzNyt6gctX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcP3dpQg; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76c18568e5eso933919b3a.1;
        Mon, 04 Aug 2025 22:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754372417; x=1754977217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
        b=KcP3dpQgBSn7U+ZiJ0/ka89rfmbUjZyoRATXajgtXyCY3f5i0CYAMAJiwMUThSKuPR
         eeloCXZrPsjTGVTpZBVOuyYvlFMJjAdp590yVxtdDs3R306u2ilXOTOhT7WvnuvJ/LIN
         1B7yM1d0R9+WuVo2LezekpfGFRbEXUw1E1O8zGT5QbgTLmavu00LMPsMWnRjsVuyaIxL
         h7tlH6anlD93VJ710+Z29IXSG48dMmOS5EzNEbi86npYZQCucommZqwQWfHxpg3nMS2Z
         5/mlIUR+o8emDOFGEOY8gNGs1rsiIKkOjYc8F437Q11ekwdnhEPTTgqvN0LBbsl9E6xU
         6riA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754372417; x=1754977217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
        b=aPq8LpqeOUyQm70Bt9pzToelMVmxp/CTdv1p9v9DnLdcT61GwDSv68eSfeswQ/DhsP
         NCYUFjRsKCvdpAs/79Kv7yJQos2OK14zSW2LR6gykLXbOZ4maoP000vjoiDtwe+hDzdk
         YizYXJ2UAbg8vJFgUSd2rZ3mHbC4CQCOf2nnTb6tEpHsjDje3s8KDswaK5ePdcDA4JnB
         Q2NADfkMo9bH/2Zi28fgMk8IRZOFjZbZgjkN7r/1/qrL+uMlNT92J48FjnU9uoUsh04+
         BOyf1Emc45jQFOeQgGcK3fmKP0Ls0v+aP5+lVW/gJQUBUw8jOwgn1NI3fuym2EXeRuaH
         CTyg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiYUYVQS1GABMuYIUclTvjO0o01wEXrQYxVNKgYe5xOuBsPhfyi0/9U1ZmTKHZrcmhHy0D7CCsoAhqSQ=@vger.kernel.org, AJvYcCX/jEX4QIa5obIfyjvVgdDp9peIyBTUq6penc668H9mvMEsp4o/Ut663ujxZwaGJutzPDaYUjNZqc8x+/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFBDVtypmMpdEfvkXpOz8nLoxtApDywBp5pGa4yKXDsLTltGT
	KWoQhl4MKx40/BP3lYCsL8eqSu2poCwZImHWNOGBRoBxxVsEpOGTOmqc
X-Gm-Gg: ASbGncsA2aiNgizvDMYs03fcz/dNkQMsn7CljS9FyjncYw2SUPHCXxAxb3bw5bG3GzC
	DuUSq3VPMEyO1SGRtTWu+3D9NkU1RpbZ33K2Aliz9yh6NcKTR71qJtY0pFahi14nDmLHYAr2ChY
	sKGBqcc/JmxpTTXa+0mMwQrv5IgjR6joUbobHxt0WMS6Oy9C3nt59GjmEK5sK0SiHybjxoAB/We
	3/Rc7/SOrw2crBIFjE/k2MEf1xaAp2WcLqxwLWvoZ0BaPKPYlP/OlsNdGj1bEsn2mXqY4eKn/ic
	D8Qe/pn2DS5+q+CdhHui23rKPr4MwLWacrvhMmUDR/xRtjHluQDHtv3TXV6HqMUI27+HTs1ymsm
	b9Jsf7mp4arIrm6LuqxSN/nwmEHFFSSJkJiNxrt/NzMvAktREyJ0=
X-Google-Smtp-Source: AGHT+IHJ2ev1hiIkqi0lPscUTwNlW4BdK3wS4xNZ6yu04JmyuXeO5mFIaRVVIoYvXA8EgyS74TWiCQ==
X-Received: by 2002:a05:6a00:23d5:b0:749:b41:2976 with SMTP id d2e1a72fcca58-76bec2f1c1amr15959786b3a.3.1754372416945;
        Mon, 04 Aug 2025 22:40:16 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce89125sm11990006b3a.33.2025.08.04.22.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:40:16 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 05 Aug 2025 13:40:06 +0800
Subject: [PATCH v4 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-drm-v4-2-94eaec01598d@gmail.com>
References: <20250805-drm-v4-0-94eaec01598d@gmail.com>
In-Reply-To: <20250805-drm-v4-0-94eaec01598d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754372406; l=2161;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
 b=bydnScpLvOmaxiT2z0GD7P/I1czPiTf65vXBRiX2YCmAZ026JcJNevRr5dNNqMRRWb/dkQLRE
 JY1RBhze6dlBboi1J1gLqya4L1GFxXDZ1TrokUHubQdKfyG28mB9Rfg
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


