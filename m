Return-Path: <linux-media+bounces-17702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB696E006
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 18:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE0AB23F84
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECF81A08D7;
	Thu,  5 Sep 2024 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVahjYkW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE141A0705
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554515; cv=none; b=rMsITXq5s2UglXCj7/1lQzyOupat7SEGp4MIHYk04Yno2aITJ8umTje1yFnFQOIPa7Jh0iXz/IeLAFeBtD9ZUX1FUCSgm+jFJEXnGPaqv904yLF9AFZIhmyeqVIdXILsYJKVkWEvsejzUSDOFtgG43hZktAzMRrzTWgUwGW9XGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554515; c=relaxed/simple;
	bh=DsDx5CJ8sVvg0bdNAIchzjjKVMlFDafd7rR1TSjgu4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fq0sxnRGojziJEGqzGSz73m5cJx44Vw9RO7pJHTRRgP5+lK/KlAJ9ah5jBUO+UIyOaKiTrchahFDSaUIviozrncAhBvmrwOCbKCXfKXXXUEDZhiX1X1E7V6ozFvz41z31yREpdjWffQ5YHSMgQeMtL36OCHBKsAaB7OZoyO0AO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVahjYkW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53653c23c3bso122314e87.3
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554512; x=1726159312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10JqAFUlouZwAtz6h65XEPkJS0Kx/qqO/go+RptWyjI=;
        b=SVahjYkWH7RBCU4mwV28wjKoNOW3SepwY+5fxUs3Rv3D20PtYskwUiGhZlapIY3aPC
         nkWIOQBreE1tyyoj7a8+si68B/kRNPlK0+i81+7VELnkAo92RuDAt9Vx/nNgmaVadlhs
         cP+IeAx7XFz57n5Tjj34LvDbVZHJCEohdCw4bxhwgvobfcFMVNvAo9TARdtMJ31ZTrGx
         YS7I8DMHY/SzWnz7Nb/8x/XcA/oOU0PEjMb3cY41CbHEIGlMKM/jMk1p6KoKGPYTkNUa
         PsErOan+ALhFZCvoso82c0eeb96Fj0ycORBHiZkdU2GfnH8LkuIufdqV0Z3A+aY3T9pR
         /B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554512; x=1726159312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10JqAFUlouZwAtz6h65XEPkJS0Kx/qqO/go+RptWyjI=;
        b=Uh+/NZMw4gASc1Gz8RUqfdb+QpZtqnn/LSRCL5bddEaetIQfE2IUqMMHJ6EZkCyf44
         McTNgIfcOdKPuqfDwBTtEyXenTiJ+PEKiLUYFOGKp7OeY1ZkfJ3OeEvAisrTjSBd++h5
         x5NNMaLMUUkjb7JAJZocauvM8kUIULDr/Z/6Tjqkl/nzf/HL2XXfYuIUxZ4Gw/yrd1gt
         pvUL023C1cDyU4vgpPMXMmKdSCJD7pLz14PI2r3uGuo6VNDRsApVvLA6IZHrWzH6iNOk
         6JENGZDaPzxG1vlkSeCQvOcqnqJtLQoopKjK3XAB4q9W8bY24VlhAA6I25XklIcYI1XZ
         EdEA==
X-Forwarded-Encrypted: i=1; AJvYcCW2qdE9kQga0K7L3cX83xlgUwwv3P0RcV+JCywpMbiWRGq3rboRBt9Igh+lCmrmnqaC/3dMmsk1mf0aPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCI9Mrv7bjHRYWEkHAwXDh0yYR+ZnJOSWhUzo4Ta39G3zM3Xv
	omryL4e3lq6GSzB7f9BERhopCrW1NO/j0NHxhGllQZDVSsRpQhzmEqIUj2B14/4=
X-Google-Smtp-Source: AGHT+IGt8M6CLQEy6WXZX44HbR/RsFMp8WjudT1nkvTyWsRTBHGzXmkGDMAkL3OdnsZzIaWzYmgp+Q==
X-Received: by 2002:a05:6512:2314:b0:52f:10b:666c with SMTP id 2adb3069b0e04-53546b4bb15mr8927846e87.5.1725554512123;
        Thu, 05 Sep 2024 09:41:52 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:51 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
Date: Thu,  5 Sep 2024 19:41:38 +0300
Message-ID: <20240905164142.3475873-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the documented example from CAMSS device tree bindings for sdm845.

Fixes: d1d5ce260165 ("media: dt-bindings: media: camss: Add qcom,sdm845-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index ec4380a0a03f..d32daaef1b50 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -296,16 +296,16 @@ examples:
           "vfe_lite_cphy_rx",
           "vfe_lite_src";
 
-        interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 
         interrupt-names = "csid0",
           "csid1",
-- 
2.45.2


