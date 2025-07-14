Return-Path: <linux-media+bounces-37584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06519B034B9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 05:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51DAC176C07
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 03:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AE71F4176;
	Mon, 14 Jul 2025 03:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgJOKz9K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4691F03F3;
	Mon, 14 Jul 2025 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752462012; cv=none; b=T5hEmT6X910cYrgrhGdnBz9USAdWvuwZmuVEV4G0O+gUuWK6LCQ7QdyAWipguCkJFfi5+etez4v/dophPCC9y/XRTfsAt2YBXwBKJxmcav2vBnE8lopgtZbzPkx6GWECAEs6/cfhlHt1BPBrFKYcTyI45T0dl6q4xgtqO99h/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752462012; c=relaxed/simple;
	bh=e/Pd6vA+VmaF2zukYk9DBDpw0E2bjx0yWVQX/BqXoL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1gEmyPVhuNOoj3lNZgyLEAfx8kGb9U2yZXzCNLoXhqljlPLMnwV7PWkdIuDvj73a5WpfXF50Zkd91Qa3oi9ATsgAYtk5DoyqtmXjeNdHh7PuwelSwYumlRr+L0fV8vHdQETK1O1X2UrgmZP6OpqqiuhW+qGQmv9JOb+3Uvl2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgJOKz9K; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74264d1832eso4881557b3a.0;
        Sun, 13 Jul 2025 20:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752462010; x=1753066810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
        b=fgJOKz9KsmNP6RZhN0SfFDgvc94uggJipZ1Phzr5QOwxBC6VUdwOtNALh7Zb7N3stB
         PLBhFAmElaVdsPmsby8maQjJ4QYrxKXqU39v0jy1jPmG+rJcreryiAzUOyEedZ9VW8fS
         i/KHw+64GVR1K4JY4FGP9GfoA5zU4EamPJhtce0OYVcMYxvv8eaT6wzQ/3OySJAjz1le
         0VOzSuJT3qB1P1N3bEGmyEXbS8qqmv2kl+ueuWJFw/RjzYohBA6xUeoOgAbtdHDiYptz
         5UsOvc7Pt3oFDJBbYp7Qw5Iob4kYwgkKl9Ss1pleTnDDsIuyb8fL5t4rZtxzb+WgnFdQ
         SLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752462010; x=1753066810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
        b=IDkNhC/saEPqrLZaUox6b5TldPbn6glhXcUnxujhKlTegiKfHHcowqE83OEHdOBoaT
         gALKg1HrykUajQwOn0aX5m5SKNUNWPQ+4utqUtdeXq9Hx9Rw6DbE0BPmELAQo9vdGFU+
         P3FbYroCJWye/VLKuZym3El9NWyeBvQh6dS6HlimtOXb1svWBHGk1LHLSskoC2IQDQT1
         TOZFToUbOGvROzd0HuVFEX0cgG3qF7+Q4uKHkG460tM916G/d90UNPDZcMlU8LdCPnzn
         LCMTuc5bAccRMqz9WPsgDibkI0NfXE2kGRjVp0+XjXlZS5BsaU3T2W89Qs5/C5SW3u6z
         thHA==
X-Forwarded-Encrypted: i=1; AJvYcCV09d6MJOQIO7WaOw17re0yHD1NHvokSotJvwSOWZRpg8FRTbrQ6V64lll0y4MS9MtkAaeXlXbdYmdzLaI=@vger.kernel.org, AJvYcCVrKj8CEAPfCmADzgFb8/zDm8qKtfBq864qCQ6Ya34RdUfRokkNOKShwSC9sYIm/0L2qv3Ge/3Mu/pMyZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3f2irYxdES2wYMzmNxJSHUuqJeTWQcgxtrDJUd72Isf53lDlJ
	I9Mw7RpbxMMHwWJmrBdvAAymUxDOfbl0eLhtFPRcsSvQKdCBrv026Zdp
X-Gm-Gg: ASbGncvnhZxMAFhnMkF1n7kSBGp2vfcS8Ya0bVHAEHmuSJu4Qg6GsRzGs/SgSjq8aJa
	cfkPblLjz2LHWpu0zWC90Ks2l88zvfzjMXUjwFI5229rR4WtTbRQlzs8l2uE0f4Mjc1/4eyw8at
	peMW56Y4E9P1tERJbFF6I0N9H4IVqcXAYyUd/inwaGeSshwqULLjXXbnnUXNfFKb9hgWOUKG9eG
	Bw+6gBDRsNr4O22V4q0VP/6asGXSa8cj+480TjcDV88tfrPOZyh11/dTwU+81reDbHKofu7KPLF
	lGExNyN+NrjzZ0x5BY1V0ZDCusn4XnkTkQhj1uCU5r7tMowyGTBES8OX0uq7RMxgY3stw5ZJ7B/
	yRRnO66CN6LdMpdufyGAKvRthmsFgzZwe+GxtFm7YbCb6PLKjwqg=
X-Google-Smtp-Source: AGHT+IEDWy/nL9ZFpPp/YZcABCz9sEOblud/9MGZab8eFY7pNur4XOUyYl3wfL5rwPVWTbt8UwN85w==
X-Received: by 2002:a05:6a20:d50a:b0:220:1af3:d98f with SMTP id adf61e73a8af0-23137e8e31emr17008690637.26.1752462009819;
        Sun, 13 Jul 2025 20:00:09 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4af33sm9034577b3a.122.2025.07.13.20.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 20:00:09 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 14 Jul 2025 10:59:40 +0800
Subject: [PATCH v2 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-drm-v2-2-5d1a2e12796c@gmail.com>
References: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
In-Reply-To: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462000; l=2111;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=e/Pd6vA+VmaF2zukYk9DBDpw0E2bjx0yWVQX/BqXoL4=;
 b=vl6UO4L2OtbB4leUxXYIMhNLmHTUQnSI6TBUze0Iux6My824R550/+iRDMA69xb3GaVPw+W5A
 U8Un+Cor5MAAkiif7mr0JLL1q6XsrJ4Uo96C7kXzHMPx2M/AhShHwau
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
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


