Return-Path: <linux-media+bounces-41890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF6B46F69
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 569315A2EA4
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFAB2F7444;
	Sat,  6 Sep 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ2ylrLZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0202F619E;
	Sat,  6 Sep 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166852; cv=none; b=gA2s3nN1PjbQBhq9RXQ+FVju7jB1zgP/UR+8Q/HFDy3/YmTLL7JW+KVTUbIR+NUxkPtmxtQCogsipZCAsUm+6f4r0IsMT7we3HcjwWx557Mr9TkCp95fnX/7ZrgrlkDLk+tK6uNXvgGv2FUq3KDeHfXZbawE8rhiozCO/Mio8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166852; c=relaxed/simple;
	bh=Kw42hJWcUttze7xoNnUBx19g9R/4R6ZXUNR2iHGj6no=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvT1jDPLauZ46rK3RkgU8sazT/36iSNqcEtZagLuZVgsmh1u14Y3AG2v+hn/LYFWPanAyjljlmXO9arh9Qe6wubYH7WsQiC+qsIpxwLwbbxC/tXOo1Pnkch5VcowQRklP1t7bWDXwNpq1SVdLb5z01jQwkgq9lP35p+2vd9kXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ2ylrLZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6aef1a7dso3183585e87.0;
        Sat, 06 Sep 2025 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166848; x=1757771648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0PXCyJyHficBngfFi8GxW+R2qBl503JjuvrmcgEKW8=;
        b=dZ2ylrLZJfoAKYpr8QdMnOuUe28HiyHRcnDXpgtLv4pMdXfcG4nou6ympxbt319bt+
         rx0TebVFOiQWWegNhk4XU/4uxvA+Vr5ck/fTx7RCVBvlg0UUxrAVrEP+kTAL2Kv9WJch
         kfB7ZN+CzkDzOCkXq2X/JVOnbwRvPCa1wn2oyvSXRSq4p2UMSVIBV6NLIEaqxk03gE6k
         9GtAVRyhd3VgFnMkvidbSYzR7e07yk97oh0iX32pEZuKIsG1vVe+qgKDTrLGTf7Hszp2
         Aa5B00IiI6OUeOzbUDGbyVExUXG2ADBTWPgRDo7A7BbJhUhDDBODichWn4MDUiPYJFa8
         losA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166848; x=1757771648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0PXCyJyHficBngfFi8GxW+R2qBl503JjuvrmcgEKW8=;
        b=B0WJ2ALQf5CSjgzRwHRy2r5twSfu0c3HGfSkMwnbTUS9QCz9QehIB/HDZdKg47soNy
         80dWc+sMr9+zzhgNu2GZ4QrSCglSLarwFspJaJZSvnnfkRznLqFCo+1J7RhfdwQspGGq
         u32UXxZiZ3yTuQZ5zmHaOYyL0iVHgmH3hGbb1GO/Lpiz3MmPfhenvBvo4Hal7BN2yzqP
         uVe3sLU6lVJivEGlFfwdNnWBIrTLojfQF9MIKt2IX2tD4xZSIFOUC3+1jExWnz3ijHew
         K/MMZe3/GyVR3VCvswJ8kgyydkeK22HG/FN2UZfnJIGadFx67kZI+8QNM9UaXH4nhIPx
         8FfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt7XyNT3V2tBka8faRwyY8jdatlqh0B34+FVdizuwbS/JpXwDGpy8mjmRTK71vvP/XkjGIrkucJBtY@vger.kernel.org, AJvYcCWAYIwvlqR7NpIHZUey/T/UeYtYl0NUSs4P7XuNj99BLaPTb/81gDn0r6cMwd/HdFLQ9Ffka2nMRdFkqr1Y@vger.kernel.org, AJvYcCWHn5wevPXi3x1EegFbmJg3EO10NcOYY0xFfzp17KaO1yOaVkMoPuqkUKgHl2gG/LW2G5bHcJTp9X6sI50=@vger.kernel.org, AJvYcCWqAdB2F7XU8+DJHTJcycHEqP7BzUFbD6YbJK3O6HHwqFMGtq81rvjBqGZCIswI0ov9GMXOwAmBq0Xf@vger.kernel.org, AJvYcCXlWdKwGnPoVBKz0S9Yz9vHN62uDsb4GIfhB0J+kQT7TXui63jc7RJdy/nrZPGOS1cJJtPVTdSxtEsDLTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHn/E40zScroqIg6G8N0aphPAlfQ+LR7AEzNNGQubsBIYND2QZ
	+SOhzSB89RGjGs+6boFhC9geuFGWsS4Ud74950b4LIwM7R9H8H/zfy+a
X-Gm-Gg: ASbGncu5Hd3GCDSeX5NEFSkmheBnAl7qT+VTGWGteOuPpfIa+O8rBaV7iJXLPk1GnYu
	KLu4AefQ9ZIUZ7EnadFLRRLbvSXKvkumTotcFXyLOUCrfr/LqkqcHT7mk34HhzLQjOqtItF3Vkr
	jde8+GnbHgZZNV9l1Q/6iSPlqyGcpmxNaSRvZWY7N54XXqQmAUiz+eRLpzwuxI3PfyeulZgJ4CH
	wRInOR0l+pecRor0Mt3AQOVya2FtCCGfMGk0BnJ5f+FHDVyDTnVeSolgWjlOF35Iw9kDNZYOFaW
	Hiz686xSX5WMeEpXmUKkHMXuCpf+UY/SOXOy7VBjaPgw/ssr3HgQPsBF7qQ9sQQ8KQVOwmYJZGi
	tF4l0qCJ2E9T2UhJ9kfE5IgzT
X-Google-Smtp-Source: AGHT+IGbn7aQus8K4ENY1gefrmkJcMV2ebrlkldnJ2Jl75zObKrAtv/f8+dZEvE9G3LK5RCJdlACuQ==
X-Received: by 2002:a05:6512:1404:b0:560:8484:a920 with SMTP id 2adb3069b0e04-5625ee795f9mr488463e87.2.1757166848427;
        Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Sat,  6 Sep 2025 16:53:25 +0300
Message-ID: <20250906135345.241229-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..c135f1bd98a9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    one0f:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


