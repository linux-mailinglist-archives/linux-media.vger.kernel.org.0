Return-Path: <linux-media+bounces-35732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1951AE6111
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 218BC7B1355
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA5027AC3C;
	Tue, 24 Jun 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ls0A3AVw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E727B51C
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758188; cv=none; b=srdyN7tuTBUSIHmObL5b3HFjeIZK/Mwzq006qrE+pvxk897jmQZ2L8dzkEKDBn4K8D971B1NppDyly/20NoL9YlxPHxgbsejQvzhPatWRi6NgJja1u7yVWY870uuE1qXM5a8KekkXqokSH3YqZi1cRZ+KSscFQrsSssvYQVJHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758188; c=relaxed/simple;
	bh=cEp7hjd1e8KgRphjljUL2aNAJeprKGSm7bQ14ArLUcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtLX9mRPKvrS7gXLu3IeGiFDOU4dWA/oNjvYaEjqBdn8QB1A8es+3VChEVq3smSeSZ9RcuJhTl8IefxpzCtxftBVCtxnT9WbL3RZXMUQfTKZmDqsVN6OBwMjnTQKDUeDRvA4V317TSic4ccavrcZjGBf6FoC9ofZfOV9ejFMWHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ls0A3AVw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553bd56011dso483578e87.0
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750758185; x=1751362985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OVGMEcWakyku48EvkGswOj50aOc6hGiF/Qrl6mN7bs=;
        b=ls0A3AVw/fmUkp0Jcr8/LLS/W+QDemiWpnLF8C6GCVVMPBlG4NylTlldBOvMfk3xpV
         vnWoSFPMBz3AmgW82SOMZV7d8VW7QlGvqCZ/Pje8SWOI09KL/RW5cfIbWK5abwFx2Zny
         FVZzylN5G/k0p2AfqUb1CPEtSiu7ubd5kW0Pj3Qu4pQHhQiVmdT1O17WJFwYQjpzayfb
         OKTMgAEreqJ/sW9oWqD6QYp+f/nhQ2oiJ6US8a9KkHo6UfcpnLAbBSPe6Tki7CM8DH9l
         cA4jPD+bfpCFUIEYHPX7UYTmwVEzra1kYxA700AVRvxseKYzxjAk23ZDRbtjT7IwSv4e
         wi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758185; x=1751362985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OVGMEcWakyku48EvkGswOj50aOc6hGiF/Qrl6mN7bs=;
        b=sEm3COwjFijJZAzBYa2xNccdiutzKNjsyPq9cQ+gRUoXbju7IN+vNymLy/vePwnrYs
         mJxHIz9O7PhS8Pa8lYdEYEWpWzzTTJuuh2SaAKZoG69l0QHc1NbR/H1Pd7dVFKKHGc76
         IIx3w7LHnLoIL6IToG5JyPKxrAS3XXzzE5dgW1i0w2Zuba0iPD9F796M3OI3CEUjLvOk
         SyQsfDe283uNAdQj/VJOjmdt3PlmfiXpgy1qTCToXycrWkn2ZNsahr8lxWX9a6rheeaB
         K3NIjQJObHJjUmlH7C7Z6yHxcje0hPcxzSFc+fjTHVlTUlDD5IykFEKzhKeqG5fQuYuD
         ktPg==
X-Forwarded-Encrypted: i=1; AJvYcCXy+KC+/gcT40+Od2+TIzZ3AmgWpYlaPzyKLQ2p4kSFfVbEH81EIWONmXASnp8A6rsAHjZlYCXuXDFcmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hbkyq7yU2r4LnXKuFDKlPKmXFG9PSPPaENZM0l5AJyNgzyg/
	wEMS28f7zLlcOExRERWIPhFTwfvrPwuirC7vEiiBNyFyAENCFGZ0Ayajm1gXZ8kD8To=
X-Gm-Gg: ASbGnct7FeK2bh6hKP33lwsy3LsijebNJkKQlF1VVUgOFq2U02uLEPFExcCp6tolpv9
	dRJwKtJ/+8jjstxdoXmm/qajPfvW3Es40oZyarlFoL6BEdPR76gVvKVz7CjWF8PNx9//W5V9O6D
	Bak3PrjRYBtprctQOYvbilsIieboWsK/67OAZFaY5gcj58XW7Z5ioOUWTqiiYMMz16sm4IN03R6
	G8WhaLSE1yKhRQR2X+ZvJKUniNhVoB1mrIKWmmYPoU4EGXbbhwD38h2S2nINzPtg+aESsO+YX4f
	TOkl+FunmafT7KD313DFfXTwDXHSM9yHQQbuHtqiY/AsKmqjHvoOYSBwf37bpMJsw5oZtxeVxdG
	Yh6HlBxxY9dOwUBLCoJAHu3BOL4UiAbITu96iA1AKeJGDhw5nFAoVSSzEXU/MGg==
X-Google-Smtp-Source: AGHT+IHqHk/ZZiXZXbbBTWH8Qo4NZMBX4Q7wBzawrxlzRhgx3lwoLvBJe49A4I60+IIrUDNd5L1hQA==
X-Received: by 2002:a05:6512:1450:10b0:554:f76a:bab8 with SMTP id 2adb3069b0e04-554f76af686mr101315e87.15.1750758184729;
        Tue, 24 Jun 2025 02:43:04 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414445asm1745793e87.12.2025.06.24.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:43:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort interconnects alphabetically
Date: Tue, 24 Jun 2025 12:42:52 +0300
Message-ID: <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the entries of interconnect and interconnect-names lists in the
alphabetical order of values in the latter property.

This is a DT ABI change, however it is supposed to be acceptable,
because there are no users of this device tree binding in the upstream.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a99..b18c7d1794ed 100644
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
@@ -320,15 +320,15 @@ examples:
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


