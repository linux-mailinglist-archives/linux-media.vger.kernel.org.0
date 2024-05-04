Return-Path: <linux-media+bounces-10771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DBA8BBD3B
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 18:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 410AC1C203BF
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 16:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7C45A4C0;
	Sat,  4 May 2024 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVFrVotn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27C59167;
	Sat,  4 May 2024 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840912; cv=none; b=jATVVXTPYaTeCoBmMzFYhTnogHyZFqGqK0nbwLLOlAAaOlkZ0g4Kv22OngaakEzId886EjqyMjLVOcU+Fr+a5uEjSTOBCCpPFHQWf0GyxztyS0vRa2dZGn3NswRw5c6aOYvmSrL50NtgzL+W3f1FWgpYoCzIxBSjZwHlZgaZviM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840912; c=relaxed/simple;
	bh=vIsSLGDNtUSIiU6tl1KOY8sKDArMa+47j5IPg6SrZSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbl2kbPTjlfV7n+t499j8OZKy2efhp/SFk6mdLM3Unw0ovMPwmB3U/t7QnZ1lekHPoMQq4wRq+3svxbA8/lAuUYA4Yqh6eaRCoKOyyl5vRPDy/SieQMPfI6BqN6gPBmm3fo0/itHLuoH0zwTPjp4Ze83whAiShMSfWjBuYQ1kAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVFrVotn; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f60817e34so672412e87.2;
        Sat, 04 May 2024 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714840909; x=1715445709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5JGI2+oNzQGJrEAe98nuh6vyQ6RUCgO7wKW8s1KZo0=;
        b=AVFrVotnqz+slXnpUbjakJeM9NETfgD5d6sEyplDQlYdAnqKtRxMDaQ1TlTagNroys
         DiatoRpmftqYCzMsY8leIO7LQPKKKN+nxAHoWh+aG71I2BmyAYRLBygoy1mCk+pGgEth
         YTXF1wHk4rgWjTGF8707T+S8y89KXzoZNh1KDfka7N7ELp9hUTgRK5qxE3MiCd4obV8f
         3THL6A/gS+RL2BFOn8R1OSUfhhrzokkQ1jIR7uEnAkvGjmnHnyR6DMQvX3cR+EZP5+Qd
         qylUr0XP9k9DJAhLNgoQLv4dgs4Xu3FNN3eYUNF6WyY5Y1gy4jf2SC8rUaUsL/igWA/X
         rA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714840909; x=1715445709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5JGI2+oNzQGJrEAe98nuh6vyQ6RUCgO7wKW8s1KZo0=;
        b=MEYhL9R+E0hJYozrBpO4fzRYhD34AD+qqebPRu6fZBpTq+RKkd3Uk+8PqjnjrnN1eX
         /NDzlvX6D2Xzsnb0AVKkAE91ni2GTaVwzflONMj5Mt5aKlEUMOAebWzsgT4vXQViVCwS
         F1w/JKxl0pKgno3ZcJJVRThud7Uuo2wqojN7qC/XLGK0oyev7zdHONzO85lxx4qbqZXR
         z9rsAnHEbwFC/gMXq4Q74LgJJoAd3Z1E8FGoGhXqaDVAH5W2PSkonqJ5tiL2RgKpHXaP
         wlYusfgSxwB2yZc73rSO6YXatI2vl3o2T+HEGjQlY0koHWCttRV3L/CkkwCLvv3AGdOW
         IoBA==
X-Forwarded-Encrypted: i=1; AJvYcCUl4YzK+BrealDpDoEps5TkbL3ZHrMEnE8JRcqwHmhra2rxvtxFRS5R79uBPpHnIj7qkE/7+7VIaHa7dy91JihatFONKKLi4fhXlLYCmgaaLhsLX2rnT31/MQ3tgGqGvRJOEk6CLj6C12k9gBXOpQL7/mHUwtQ3RK7MWlHdJQ9kh9R3mk2J
X-Gm-Message-State: AOJu0YwzfjfifCv8GGNShVhhUoUSgH0maG7iI4IjlU2V5lZPqLThE0D/
	erMGmnmjXlS26sbEerFW/YF8ROjEWIen+mWHhFb2RQKLYN/3zICd
X-Google-Smtp-Source: AGHT+IF4NeqLRiV0k4KXttJQyZ/HtosurhH6DC0m96+d6PU9bdkTdnn0Xb56WYP4sEj6kYlQeXCNLg==
X-Received: by 2002:a05:6512:3146:b0:51d:7d5a:af05 with SMTP id s6-20020a056512314600b0051d7d5aaf05mr3520824lfi.32.1714840909060;
        Sat, 04 May 2024 09:41:49 -0700 (PDT)
Received: from localhost.localdomain ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id q14-20020ac246ee000000b0051d2075cacbsm938267lfo.82.2024.05.04.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 09:41:48 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: add galaxycore,gc2145 DVP bus support
Date: Sat,  4 May 2024 19:41:14 +0300
Message-ID: <20240504164115.64603-2-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
References: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/galaxycore,gc2145.yaml | 65 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
index 1726ecca4c77..3ca5bb94502d 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -61,8 +61,38 @@ properties:
         properties:
           link-frequencies: true
 
+          bus-type:
+            enum:
+              - 4 # CSI-2 D-PHY
+              - 5 # Parallel
+            default: 4
+
+          bus-width:
+            const: 8
+
+          hsync-active:
+            enum: [0, 1]
+            default: 1
+
+          vsync-active:
+            enum: [0, 1]
+            default: 1
+
+          pclk-sample:
+            enum: [0, 1]
+            default: 1
+
         required:
-          - link-frequencies
+          - bus-type
+
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 4
+            then:
+              required:
+                - link-frequencies
 
     required:
       - endpoint
@@ -84,6 +114,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/media/video-interfaces.h>
     #include <dt-bindings/gpio/gpio.h>
 
     i2c {
@@ -103,6 +134,7 @@ examples:
             port {
                 endpoint {
                     remote-endpoint = <&mipid02_0>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                     data-lanes = <1 2>;
                     link-frequencies = /bits/ 64 <120000000 192000000 240000000>;
                 };
@@ -110,4 +142,35 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "galaxycore,gc2145";
+            reg = <0x3c>;
+            clocks = <&clk_ext_camera>;
+            iovdd-supply = <&scmi_v3v3_sw>;
+            avdd-supply = <&scmi_v3v3_sw>;
+            dvdd-supply = <&scmi_v3v3_sw>;
+            powerdown-gpios = <&mcp23017 3 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+            reset-gpios = <&mcp23017 4 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&parallel_from_gc2145>;
+                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                    bus-width = <8>;
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    pclk-sample = <1>;
+                };
+            };
+        };
+    };
+
 ...
-- 
2.43.0


