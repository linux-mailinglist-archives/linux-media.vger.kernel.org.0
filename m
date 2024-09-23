Return-Path: <linux-media+bounces-18453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCEB97E6A0
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 09:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 952561F22AC9
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 07:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698A7DA9C;
	Mon, 23 Sep 2024 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEKULfIi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE26482E4
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 07:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076554; cv=none; b=lRyLVg7gEoGSZ3k9XuN5Uh/a9MIHK+uMa3sY5feCHBMhItTco8FtaLGATt+k2jtiTP98H4QlSA+BflMTAxFQOytJ9swlK95nq4zfJ6d/UOf2EU4rHeMEDLXPGVKd3TK0yJ1KQk0yuO+HrjXkZVTxrOdmSQpQ91Qc6Jr9WnEJNUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076554; c=relaxed/simple;
	bh=tFaw6KXY86hMbQIbcttzfO6lDEyEEwPkoBMlSyvbiT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzF7pLhHChTV9veI6jPkLf4M/Vo1/2C05rwUGvPFUqkQaDNdfvPFideTKyb79ujBQvXXzyTcN7SuZrhnHqdfQ7x7muN0+Xc2J8tM1Byg63Echj41rHBwFcyMsWTsFNHtML3X3FxB7+yls6Hac2jtkp2iUhwy3RW/btz4HEUuw2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEKULfIi; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a9dd6ebb80so40756085a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076551; x=1727681351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wgNnXvrg8o8t4zipfSpiHUqyxHJSbujSn+QNon+tTo=;
        b=uEKULfIihSsVCeiWTM7Q3LKQvAvmWljaKPoEKQCj/L5el+YY+8TSG6385rmE13HUCJ
         DUitIHtbtqI7ANxpTOFTCPsCRPLKJMzWxDv+SPbL6JVUL40Km+KXpLPH0GQggd5BfFIH
         DYxqjG6hYc6tycV56Zr+jW4ZnArm0sJJnWVAskBo/Q+gI3o56LEvE+KosVIh662E5oAO
         edz7yx5Am6XA7HEh5FyFBfVwC7zuMTTy1qgoLbLwWTm5I+XL+05/SqgsaqfGbQgdswrj
         Frxwr4eHj9P+NlDXRlEVsFk9J7v12opQB+bLFTHKrJLODe6E09ssC9LE5r4eR+WTNs03
         BYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076551; x=1727681351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wgNnXvrg8o8t4zipfSpiHUqyxHJSbujSn+QNon+tTo=;
        b=fKPkETS9V+UIyuiSSjX12wVOfde67VbtQDvaQekZ8qA/hfQU1jchK3r1BS9Z+lPpr8
         U6GaUy5fdnG58OtXGoXkFlKZIlKe05A/w74/mOPs+DKWTXDL5rwzNOBc53TEQuudu2XU
         PTxl/vycKCIthYSVOTB6o5xOGrIIJb2Bqr3drcq/hvlcQ1P+A3p3xpcEjq69x1VNv61j
         bN7r+K82kirfzEtxP7k8en9+60SVlYHNAr870Sm71+uHKDdtaM6jT0ZQ9mpkUsW7LGmu
         Ywe+rkLYDedfpHGJTZjl6tk/OWzhID6NVyxe5OdrOS8sKEiy5hpoz3iG22AkWg0/vLXB
         IWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxVNHgJPaRwM3gzmZcxJuptV9AMyhBEfghoQb8y8D8+Cx+ggd3lJ8Uu1dRneqQEJoFSv4sMR7P4hvwQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+XQFGEnD31PABXGK1mrxsUy4rzACO5BU6KosgpwxdZNu+vGh
	9f72jxqReTez7jcwclQTntI2ijlpnTvkQkN6zKqQ7qI6GFhzgEMWG5VHVIx7dbs=
X-Google-Smtp-Source: AGHT+IHJQDI2HwwKhdUbGM+FNmKSDKzmgVx1HpZfzhq3R43koi3JjFK6uE92zPiu953Z8nKxzWmf4g==
X-Received: by 2002:a05:620a:1a16:b0:7a7:fa37:d43e with SMTP id af79cd13be357-7acb81faadcmr753473585a.9.1727076550884;
        Mon, 23 Sep 2024 00:29:10 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:29:10 -0700 (PDT)
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
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
Date: Mon, 23 Sep 2024 10:28:27 +0300
Message-ID: <20240923072827.3772504-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the CAMSS device tree node for sm8250 platform.

Fixes: 30325603b910 ("arm64: dts: qcom: sm8250: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 630f4eff20bf..f4b00cac5fcd 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4481,20 +4481,20 @@ camss: camss@ac6a000 {
 				    "vfe_lite0",
 				    "vfe_lite1";
 
-			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csiphy0",
 					  "csiphy1",
 					  "csiphy2",
-- 
2.45.2


