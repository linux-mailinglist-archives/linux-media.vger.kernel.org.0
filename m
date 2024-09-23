Return-Path: <linux-media+bounces-18451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04C97E698
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 09:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2865F1C20ECD
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 07:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914AD4D8A7;
	Mon, 23 Sep 2024 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqgQID5n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BD3E49E
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076546; cv=none; b=ac1cY98coQo/Gka7rlJs+5Ey0H7HZAwt/NQ7UpmJzsD1LXSwef56AMb4pHX9/VMelWw5Vcf4iNzMknIIpfm6tsalH1Yr5fb8B14W/S2EAqFidUK7xJy9yo+1FCAYuBOdoxP/69DiOHbLqJU3I8oK0nxh0nvLeMwSzSrUY7xx+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076546; c=relaxed/simple;
	bh=6gogXktloc+A7c0Gk43BjST4g0xqpDAnzPJP5DTwyPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tn0GNzMRxp4dZhciUstZ/jYi/HlXsFx3vzHNYzh00zOaulMfy3UOvQkuQEiu6xmE206CNSjC/Dz+PZaZ8H0lA5AJWfC1oeymaYi64l+3hC7iWaNj9aDN8JJIJpZz7G+BSHq1kWbSxJHInPyH0331BtAFtCxOuI8JjlNTHdEhRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JqgQID5n; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7ac8e6c459cso17285585a.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 00:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076542; x=1727681342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGac5qdU+wbl4yrBThl8jiZiUBigbuo0tAnkaC1iFVk=;
        b=JqgQID5nl7dsIqd8uI6zgiuJEw4nkZl825FWwzYpxB6gZfIEyUJb4LJL3nHNhVcEDt
         R3hD4jV1Ca7cWwUBtvBPs5vsco28OpbisVoC58ZRCA6J7pPB52BOE1EGvGdCiIeIY3s/
         0tGRoBuKBnveqvshZNJtr16Xx4gbW9u8+0AiIp1TnlhfJNxceNdx2QXndmsqAmFN6iZy
         xUkEqSAlbrOwfRj8BGTh0gZ8ep0+7M2ML5du7TpYH/TWUuqI+r6cWO7uKaNPwUV/3cLU
         fYkX7iWrfQDBPJAZ4BXjD1nbfYhXoVWh/pMJ+e9mIeiUQEL1S5Qx1xFMdb7DqkH2R98r
         4rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076542; x=1727681342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGac5qdU+wbl4yrBThl8jiZiUBigbuo0tAnkaC1iFVk=;
        b=JwKMwdk9gmTGiYRNvX579XBHgV+PRVRkSBp1DVuXDpdcscchXlBO9ecP/nAusL9ksa
         YNvAgrHBgYLOo643YEdIk3QwjUR45nJKjylQmp8P+iq04M3udczAnJ08tJPeOHwVpHsb
         fWX85hw4wAeG9j/KbUrUMoTEPzFzSooYcl7r1Gmzfm7yAxGlyTNQw5WILIagnpwd8/vy
         lkUYHJWWo075HejT91DE4eHzJicWtbVpJccdDxG97gZeNuD0jJbvyoBPunuWw+y1PiNL
         cwWpinrN1dZHapElel9nM+K3xu1zTN5qlNs9lkWJGjHn4t2AjiUhlZ9Pb2x84jKrQdut
         PZAg==
X-Forwarded-Encrypted: i=1; AJvYcCWNx0XmNWtq9mBsMHExc9peH0YVaWrJXyaS+sggTv538LXVvRnSkCIkzUHgxN3uwhS57V/8Jzv6HXOe4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6WPl7xrr3zoPYQ18b6Gc6m6di7BN2ak/Aymlf65UjMG96vAm
	IhAYTNY3TApo3c37gFGoKQ9xD9Ac+b8gf75zEuKPARuzrh+yCpUgu0O6C5rADd0=
X-Google-Smtp-Source: AGHT+IGxqOQ6UYTw2+U+aFUi5a+DJwWT8IyjurC8lVj6OIrfNXo38/uYpZyuaCmzglRYc3OFNXYzBw==
X-Received: by 2002:a05:620a:4721:b0:7a9:a632:fc85 with SMTP id af79cd13be357-7acb822568amr799308685a.13.1727076542345;
        Mon, 23 Sep 2024 00:29:02 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:29:01 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
Date: Mon, 23 Sep 2024 10:28:25 +0300
Message-ID: <20240923072827.3772504-5-vladimir.zapolskiy@linaro.org>
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
the CAMSS device tree node for sc8280xp platform.

Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 +++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 80a57aa22839..aa2678eb3bcd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3882,26 +3882,26 @@ camss: camss@ac5a000 {
 				    "vfe3",
 				    "csid3";
 
-			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid1_lite",
 					  "vfe_lite1",
 					  "csiphy3",
-- 
2.45.2


