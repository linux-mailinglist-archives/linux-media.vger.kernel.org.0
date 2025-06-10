Return-Path: <linux-media+bounces-34394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C5AD3079
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 10:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822833A47FE
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44B9220F24;
	Tue, 10 Jun 2025 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYU5t4n3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F9A21FF57
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544415; cv=none; b=lxegm3XKKKs+XtRiYy8WBcSFdnXN7Tdxoj5MhkXPI8yQgAFTDjrA4Sov36ukglwCNQUAIHSr3xNnHQDkyBqHuzJtNdoVsEiKsIoY2RpXjqiGYf9UTibe4kKAEzLmaL9VHUcL2rQJfs+yZ+PlVUII2XbPKbaoiKq393Yuag0Veew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544415; c=relaxed/simple;
	bh=7gdpRdONGfcDNIZ0vaKZOJ4Az5/CP7KpNF4sBX4i8XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNZv7iE9UoibLc3NtqZARxY/3LlLZ7oYt/G8P6U0V5JSYo8kCBsJaw5bKUb+ARsRw8X7wkShmEIOUB91sohbX56j4OwGhtdGcO4+Wl/n2Qz20WYDx5eaILNeCgqhTf/3OdPDja7DNLbKcNmvGmeRIP4YKhY4A8xn4OeXuCteuao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYU5t4n3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55328ae0473so738540e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544411; x=1750149211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi0ojJKfM0jr71LRLkz0UQwhMRaHPQF19YuTp/guCV4=;
        b=AYU5t4n3MfmYp98sDVIElNMtQEPPKwwN2oQScQHdd1IlgR9+ABcu04PXKF5y/mcCvo
         0PWq/AjZ6IMWnS+7DQrD0OST5ryd7Nb2/6GTgdREYWu3HtDgENTSJLHn9ZA7GIqK6FsL
         JJGocRBMYUfxU4q0yh3w72KbyVYAUP7Q2xB80AhLYfZthdNOz/6dN6g/fakftFMTY3IR
         Y32unT1U0HiaOc3B+zAwoqBdOz//be5TJn0G3yyiPmflHWRHT8eQCi5dJb5+W9pVfEM+
         HnnLhCLZXWIb0vxCQXmE5Bu/YIi7bwGXQwH2h2p287eV5EyT9HYZeUOn4gNhRj4yBKZb
         hZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544411; x=1750149211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi0ojJKfM0jr71LRLkz0UQwhMRaHPQF19YuTp/guCV4=;
        b=uFFhDDkz1jsH2JAn6T7JmsCbqMfY46vzKUu+yp2jVggc0ERMT3xWBvbmtnWdtOavi2
         rNuAgFTHVhkTMidVewOTi4IgMzFWoHCy/XNj0ck3aoQI8kAa4vTwdF8ZhIkbYJsK5v+E
         nuicsdU1X9utSFD9C4cK2WC0saa3q/LCxdJpGZ8tkKpOb4ewR7mvDrDQVuPLWfIIWpXA
         StoFgzovKqGk7BLgvk+4j2BGKRSVtjZqekJrs3aB2wo5+31iyeGH7vJxkVK/LLhUM6kP
         DHS2ImHSTBlaB3F/BlYN2RFxKrGVDa11J77z6zNEJM5TYH8dJwRwBzreK+Z9of4MLS61
         iY9g==
X-Forwarded-Encrypted: i=1; AJvYcCXyJnpE0ZBcBLpJDg19ZDlpTKkPJU6a8VJkHwHdSh2iMI/MvX9oLNVxOqaorwU1LK88c3iCg9ZdTVfeJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPduGT2sKbipxcmnzDN6MwghIC24T8pIvTr0BvXzGFINdr9+51
	N6SQTugiuyOlmTHeXfaAKl88F82mPH89do09GjES1ddcRlGy2N/g7ZOWDBM3oe9km4s=
X-Gm-Gg: ASbGnctRMyrd4tWV/096yjcq/LtjaazO1o/iwfef8gSjN4QJVzL2Z9nXo0o1fX1WiH6
	xqhKWDdFGkIKsRaNqV9+RLww5fEozc6gFthN+ELYU8b0CWFErlOInjL/OQJZbOt/WhCURTr3ABh
	aZQRZPtL5zLBMnVtFRc6/W5BfAG6mN9YjWMYQ8iqc3va1SLc6fczVYElN1L+aI/YLLmCgSCykDk
	zAO/ldoC7tklmWqyKMXZrWclJE+ejVIUhfG9KuTWu0KsEcR42tS4lPN/6LeUTelmO2p7DEoRL0j
	0swkZ9TbK+lWT+WClxKUJGz/yF8FgTijtWZ86RbOgK7p18pkOsDZ1HzNEkaAI7Jt0bBLrVNCvhn
	hSEDIBcCeNTdWXKUX7BHS9ZGdb4PBIyXvAZdjiuKZlbvlJY5Su6o=
X-Google-Smtp-Source: AGHT+IHWMbam7GseB/gXW6bNFdLASWBzQkSU8Rt+97yCDitdCvOv672MUUq+tKYnaqIioglQAVtlWA==
X-Received: by 2002:a2e:bea6:0:b0:32a:7e2f:3df2 with SMTP id 38308e7fff4ca-32ae3243f27mr12713331fa.5.1749544411337;
        Tue, 10 Jun 2025 01:33:31 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b351fcsm14167241fa.35.2025.06.10.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:33:31 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort interconnect alphabetically
Date: Tue, 10 Jun 2025 11:33:17 +0300
Message-ID: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the entries of interconnect and interconnect-names lists in
alphabetical order.

Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index c101e42f22ac..7d4e6ef57bf8 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -100,8 +100,8 @@ properties:
     items:
       - const: ahb
       - const: hf_mnoc
-      - const: sf_mnoc
       - const: sf_icp_mnoc
+      - const: sf_mnoc
 
   iommus:
     maxItems: 8
@@ -321,15 +321,15 @@ examples:
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
-                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
                             <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 
             interconnect-names = "ahb",
                                  "hf_mnoc",
-                                 "sf_mnoc",
-                                 "sf_icp_mnoc";
+                                 "sf_icp_mnoc",
+                                 "sf_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-- 
2.49.0


