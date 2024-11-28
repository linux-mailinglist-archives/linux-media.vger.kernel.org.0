Return-Path: <linux-media+bounces-22237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D79DBB35
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE7D116488C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66441C1F2E;
	Thu, 28 Nov 2024 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRp4f7M3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720CC1C07C2
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810918; cv=none; b=Nc62KUyd6efEETfTEPQS74URUg4I+9Qup+I6/3oyiQ3pxjQ5d74G2k+WFBQYLALF2s11bcAFfP1AMlKvTmCeS+5egZFMHRYOoPawHP35jSZZEsN9ph8hggZJR35N1wxV0Ro8pxiNZ4t0SrniduwzeHe/cSXj4y8/dTwjDf5dCJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810918; c=relaxed/simple;
	bh=lveT01XJFbPiCHFrg6nSo0zlm6T0yWAAHdtlgddNXio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMyzeKs7o9Ius87q5F8DWqeyCOWahAHDfAFuoABKljKFowas7TNYtKovODALt0pzDiDI6Gz4vJ1NpoMiWNPr8aVXEYYnjZh2ZAY8crLhEcmmKGs2UHmdUI4zveZCvzMssGF6Bzo8tKEYHjJOx1HLXBhiihEgKo/r0YMIJfuz9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRp4f7M3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a2033562so8889095e9.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732810914; x=1733415714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3dDvW0+Cz6kszp6aCIpBOpaxsGIqiTVCAZVfI6Gurs=;
        b=yRp4f7M3xtoptnd4IxwdyyAz8Uw+/vU8Ht4nFHYlfOcIdgWy1U3Aj6h5gPhEXo6TGQ
         Fiom3IVyblar5NyDx5l8BPDwVtRMR8ZT0HSUf4YoR14LI6i+1aonzHYTIcFXfYWzj46w
         NPeTzbz3xFX/rTo7F4LlNhni9l4BGQC6ZUF7pZDI4Vi/nlIVPJSj02StMFLDWsD3dy+N
         PTr4vPWR6RTw0mRk4JsvIdn1Eeg7ABekURgwW7ZmpdxDSYsrJns7KCRxR4EDgYYUlVM/
         kqlGAiOJinrB/NVAnEeL4pj4pOF9e66+XdO+/uIWscEKXuwqiAri4NgGLg2jnwiZwx8S
         UhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810914; x=1733415714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3dDvW0+Cz6kszp6aCIpBOpaxsGIqiTVCAZVfI6Gurs=;
        b=bCq1VqBEdCcWHViZCel33y8ri3UxpMlopLFKenxQ6l13vnest835b8NlfUcB3rQ0gu
         g0KwkAuE8vURQZraYnCF6YWhT18wN0Cf7s/hgsfXS+T56MJa2Z3JqXR5TbehszakSal0
         4YrubRas+VwhJia2w7tiq7KJWB3uXpN6Kcwtv6kb5H2LRXycfAk4Qe3xEgz7kGztkua9
         ON3sk//PFkhRXk2vPZzDhenOXu4OR4rlyAAFfLsJZk5x0Z3Of9WBDkRLbwNFFKL1jlMF
         fE0+dQmSN7lzR3AGX5TtUqJkUw0h29YmCxtIsLsixPmgXqwRwWfSUDNl8IJJsHKgC57p
         wDaA==
X-Forwarded-Encrypted: i=1; AJvYcCUWtweR/SmNOfwB4kjVS7j6Hk5y7pTUKwEBufJB1RVaJI46mZ/STdbjIjFm3sfEfH/n/l9kkYpJOZVXtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyGhjf6QAwCb/7/4ec7i59TiLdvhCSXA+8r+EgfA5d7Y5EaCu
	0puwmbCEVn1ozzUictttAISXLdethVdEYfFDlXWmnOMkQT9RocMvxIES81NH1jQ=
X-Gm-Gg: ASbGncu2rDjzKoCXARLMpaeY7bTvWkQehtTLHj+Y2Jk1fd2hp6X/h8pTPdQ3qLRmuKW
	slViymiSJxzlJcH0MwiE17jtTNwlhxZMXyzwaGuPm/Napvett6bWng75oZoWyxMFwAWV6kLY1Fm
	ousk00shAt95swdbf43Xl1wvIPZSFjDU3EyOr1Hw+SUu/2HjwXPgqV0UbEj+dxojGwZANe571KP
	/AjsUrgQBjm0QnQnfquW4H9dKT0m1Iphn5egvuKoUbumML3T2Bu+BifDP8=
X-Google-Smtp-Source: AGHT+IHxY7oKgFgJZ4sweXccUfXlO3kfxAoksfpsXIIPvc2aGpAbCuTxEbmTKUh3VLkL92Hpd3UGFA==
X-Received: by 2002:a05:600c:458b:b0:434:a924:44e9 with SMTP id 5b1f17b1804b1-434a9dcfedfmr76862525e9.15.1732810913825;
        Thu, 28 Nov 2024 08:21:53 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d9csm27004545e9.38.2024.11.28.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:21:53 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 28 Nov 2024 16:21:51 +0000
Subject: [PATCH v4 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-3-fd062b399374@linaro.org>
References: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
In-Reply-To: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

For the list of yaml files here the video-decoder and video-encoder nodes
provide nothing more than configuration input for the driver. These entries
do not in fact impart hardware specific data and should be deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,msm8916-venus.yaml        | 12 ++----------
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml         | 12 ++----------
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml         | 12 ++----------
 .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml      | 12 ++----------
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 ++----------
 5 files changed, 10 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
index 9410f13ca97c181973c62fe62d0399fc9e82f05d..da140c2e3d3f3c3e886496e3e2303eda1df99bb4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
@@ -45,6 +45,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -57,13 +58,12 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - iommus
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -83,12 +83,4 @@ examples:
         power-domains = <&gcc VENUS_GDSC>;
         iommus = <&apps_iommu 5>;
         memory-region = <&venus_mem>;
-
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 5cec1d077cda77817f6d876109defcb0abbfeb2c..83c4a5d95f020437bd160d6456850bc84a2cf5ff 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -70,6 +70,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -82,14 +83,13 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - power-domain-names
   - iommus
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -114,12 +114,4 @@ examples:
                       "vcodec0_core", "vcodec0_bus";
         iommus = <&apps_smmu 0x0c00 0x60>;
         memory-region = <&venus_mem>;
-
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 10c334e6b3dcf25967fa438f8e6e5035448af1b9..413c5b4ee6504ba1d5fe9f74d5be04ad8c90c318 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -68,6 +68,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -80,14 +81,13 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - power-domain-names
   - iommus
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -125,14 +125,6 @@ examples:
 
         memory-region = <&video_mem>;
 
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
-
         video-firmware {
             iommus = <&apps_smmu 0x21a2 0x0>;
         };
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 6228fd2b324631f3138e128c918266da58f6b544..c839cb1ebc0999e10b865f4bb43ea76ffa2bf46d 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -70,6 +70,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-core1:
@@ -82,14 +83,13 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - power-domain-names
   - iommus
-  - video-core0
-  - video-core1
 
 unevaluatedProperties: false
 
@@ -119,12 +119,4 @@ examples:
         iommus = <&apps_smmu 0x10a0 0x8>,
                  <&apps_smmu 0x10b0 0x0>;
         memory-region = <&venus_mem>;
-
-        video-core0 {
-            compatible = "venus-decoder";
-        };
-
-        video-core1 {
-            compatible = "venus-encoder";
-        };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index f66033ae8b590e7b6f1e344c368994744411aca2..da54493220c9dc90e7d9f5fcfce7590acb241c85 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -73,6 +73,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -85,6 +86,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
@@ -95,8 +97,6 @@ required:
   - iommus
   - resets
   - reset-names
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -132,12 +132,4 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
                  <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
         reset-names = "bus", "core";
-
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
     };

-- 
2.47.1


