Return-Path: <linux-media+bounces-17706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9496E010
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 18:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A81D1F25D73
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 16:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236911A257F;
	Thu,  5 Sep 2024 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngMFSPB2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3971A00F0
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554521; cv=none; b=gbljtv2aavT54ES2e67BgTwGyA6wUa0koBBdb33NVMJqHg8Vl2HSlUOecM/+bbu4gvFuiwhfO841G3U43WfugQRUmo+XyRYzsctyhOpo/0Qyvi6tiryG1unR9mRzJAwB/LNCEfjBPgwk+JqWocLSOKVV5anAkL5j9OELW1LbgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554521; c=relaxed/simple;
	bh=bZqTUzHVaDU4z2945szciZArKwGaVZx4L53bE96zPk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTtJqbnUmNGU4OycaQdoNhKm3LqrpK7cNK/ILGTyTEeFuBzmCq2C4CJqfohl9bq+TPpc4dvmSZqIEY74Q3MJ7AnI/XePNjvqmwMJf0JoKcTPyQUj0K+DixihDNWakOuBEP+vxsFJchb4y1t8B1lMC3bH9+FTGfHANXVM66vbVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngMFSPB2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3aced81ebso1053441fa.2
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554518; x=1726159318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CZsoyx5pAZF1TVY/oRkF4UW+jAYypgRZZCBJ43Oqws=;
        b=ngMFSPB2sbXqIc1NWlWf57Il6juCw/w0N9SpjZHP2RJU9Ng7Qg4mpfRZxnSAQlnCxX
         SQ450LgbIps17+odsPDTMBCaRZFtjpd90+eQITRlR5GpPpyDOVzsRAsN5Wb/eQZG97AV
         mjWhx2Du1+QqQUCwZ1IYSpe2qgpHE6gGj199rT9BLG5veEGAqSno5XMN6I6R66xEff6k
         icT4KHB2uW8imvhHppH6CfAkNYl0WpVwqz0seb+P4sh0vdOyrIT/GV+4D5zBUNjeMYQz
         qU9hs2KMAgNcr4moyIPlSg1bNrdOH56CuyVZVKofUV74bT70biMYN/JO+gZogZ9L+FPI
         pkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554518; x=1726159318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CZsoyx5pAZF1TVY/oRkF4UW+jAYypgRZZCBJ43Oqws=;
        b=XTlHHgXVTqdQGGqXiaHz28LCXZLXkdTpnmOUt/s6iXiFbEya/vQR4WLmv7C2Csb6o7
         6tQoyqqKZeGxKYV9q9umRpYTyXnNdAIk+oQAm35PO/JbyIFZpzUoeruZa86MlGQ4dOuI
         f6QntHvayHqNwkLPyu7jg/cRtYgCyHQ2DUieh+EGNqJpvSQqgpogkrL9/YvPiQQvt/mu
         bUIq1rEqUPFJTzOYOgXKRJ8DnUirOfF2ziqHmMhSxVcvzymkWF3qa9b/VlI9WzpNl2Qr
         iuGSWJA89PfxB3fwpGPCQdwEAWFt/uBLEWeZW+tAV8n9KYLh8TlpS8BkWXxshBTUY/oU
         3nHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa5tLOFlcycD5+ALDXNudvzJGuDX2OTYzHj9dPYir2MHaCCyfr9F+W6EBGaPewWTIV1NR6CkJotqfTAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPypovC+6DCMToctUDgVHgzKg5e5rXCt418HJE8UcaEQhiAa+Q
	Jd9LJbpDf1bA+b80M4/8hBAQijASHSQ/j5ylrML6tj3phQiFqXcqPJJULH1lmPM=
X-Google-Smtp-Source: AGHT+IGsGhahX9KXK8hqwaSEmtEzSk3nAz8AAkdF0O7nJJRcwuurhlZ/D92MQJH2A+rjFPdqauZCrw==
X-Received: by 2002:a05:6512:3510:b0:536:554c:619f with SMTP id 2adb3069b0e04-536554c639emr440673e87.10.1725554517877;
        Thu, 05 Sep 2024 09:41:57 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:57 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
Date: Thu,  5 Sep 2024 19:41:42 +0300
Message-ID: <20240905164142.3475873-7-vladimir.zapolskiy@linaro.org>
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
the CAMSS device tree node for sm8250 platform.

Fixes: 30325603b910 ("arm64: dts: qcom: sm8250: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 9d6c97d1fd9d..bd73ff97739c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4504,20 +4504,20 @@ camss: camss@ac6a000 {
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


