Return-Path: <linux-media+bounces-18452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640197E69C
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 09:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F6CF1F22A6B
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 07:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A1978B50;
	Mon, 23 Sep 2024 07:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i5SUXaKE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00544D8C3
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076549; cv=none; b=BT1CfY3vNIVep0aiXDMzHVP8Nwc83LqhrNrddij6fG3Pt4KVRtrDh47W7a2Eny4HaPFvmVu5ZR9H8bXIf3Uf5lbCYG8040oCwcpk+CnJhEDMVck324bLu356PNLTsKJ3+ci6nrjLqxk/aqBMPSVxYdqga2ganYLUFBqlTryLs1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076549; c=relaxed/simple;
	bh=7pQSa4b4GlzE5eupsdIVj8T4K0JRPjHOsUfy9A5rcbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0YfA8DcRZ6L9QpFAQklpm1L98UTxqis7WtwZ+0Y/TL2upuzuJVghxpU4dezmKSaS5AZ2lQ/BpKCZTbedTbCdbqHO22/89Ppl75zbxfsde2uvTN7AqCw7c9gSACjxDthlSw0sFkk5l5Fg/Etu6VxOGOgZCKxTE5JbrCyW4lcRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i5SUXaKE; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7aca8e44e02so61653885a.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076547; x=1727681347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RL+PGx3dSjKZk/vbyi+GiTq1Mgd2XuhjvH7cuwoY2Y=;
        b=i5SUXaKE7ahAJpbz3okTiKUeJnhxcGZvdf+OBrftup38bdybZ8VaIN6xQz1f57SgnC
         kr82aCkJPuFo9C+vGTchbjGf+KMzAZqvhRipe/gc0TZCxaW44plY8762y+G2SzCzuxFY
         /dslwgv2fOzZhyoztXq0+bhKHasNZ65P+VDp0RPWbm0GJjUUhnOhCGFjNkmbp948L/xc
         90QcR3Eq6A6tLXE7BvjrurAc90SbRb/nEZYiKYnL7c/Z0O6H9C14dE0xJfos4BfuFsar
         TCzazSBAFuDMaKKww8Y54nUDHJ0tArbJIcWjwiGwmKpLncR+QFMGC7E8P8yysXkpe2fb
         gQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076547; x=1727681347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RL+PGx3dSjKZk/vbyi+GiTq1Mgd2XuhjvH7cuwoY2Y=;
        b=OIS/mm58AI93d+kCtAAAavVn6knT8sQE5CCcOiF/zY7knwE8AYedx6qQfxKeVf591Q
         57rOei2OoH2hrbNN4rgatEsa8b0eQYPEp0il2U7yISsI+P5Sfj04T0BKIu3LOWG0Gwcr
         TLyJYOmKN5Jx3/iGNmV1Gq1tY4FjuDsGYvwO9mc4EM81IDi+H5eh1XMhcLTwLS3voSG0
         I1NdKB0NNbgm1mFYtTmClMlpofRfar9jjqpVJlIeQ/glRnFBm9IDOBPvXW0DbbNi3C5E
         sp40necoQZqbZ4LzWz+xX4z6K140RAsjHevXjOqQp+o+8kFqoot14nldKadLgYZKGy1R
         CXLA==
X-Forwarded-Encrypted: i=1; AJvYcCWDkcBWbeuuYAymFfERbysJm/1RSKR+FtjB2D0beW+OZFFxqjoRiwdoJ0OvUpBdaqlpU3/4gzUF/8i8FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZ1hqY7ShJZX/058FY2/koj6LhbKYbyZmp9y0u1S/D/deRKol
	UzOqPkDXdZnTSamY6OsFmuCeu8DllO1nq6iPahxTp62IkYRpysbqpezqGLM/klA=
X-Google-Smtp-Source: AGHT+IFMJEJCmxtDtPL9zaXvM7NO/KZlhn5JD2Gs+0qppxE3sGEXoeTBcrfAE3685XamqMzd6fR5+g==
X-Received: by 2002:a05:620a:298b:b0:7a9:a632:df39 with SMTP id af79cd13be357-7acb81e6e54mr731150685a.11.1727076546707;
        Mon, 23 Sep 2024 00:29:06 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:29:06 -0700 (PDT)
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
Subject: [PATCH v2 5/6] arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
Date: Mon, 23 Sep 2024 10:28:26 +0300
Message-ID: <20240923072827.3772504-6-vladimir.zapolskiy@linaro.org>
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
the CAMSS device tree node for sdm845 platform.

Fixes: d48a6698a6b7 ("arm64: dts: qcom: sdm845: Add CAMSS ISP node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 54077549b9da..0a0cef9dfcc4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4326,16 +4326,16 @@ camss: camss@acb3000 {
 				"vfe1",
 				"vfe_lite";
 
-			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid0",
 				"csid1",
 				"csid2",
-- 
2.45.2


