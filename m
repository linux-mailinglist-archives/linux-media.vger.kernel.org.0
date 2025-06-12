Return-Path: <linux-media+bounces-34566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CDAD650D
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B819B3ACDE3
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3773718132A;
	Thu, 12 Jun 2025 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9psXQZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C970155C87
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690959; cv=none; b=TBl23kIdCBBL0jJF5wc6mZCsiJE232kFrxXymLHzam8tn49pWvt2e5TzEF/kvw9et/PvgxK6LE9oSxYzE530a4jg0bmj2w5F5TQ1w48OoLN9Rqs9S4emNmlYlEhzaYzBqaHWFSpTJYoooBIDmBd+ac+2IJkK6Bl3KV/xsYQK26s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690959; c=relaxed/simple;
	bh=lRmpab9D7U7Xj9Gg2kKMV8W8QS5flFvrcHN5YkABJeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oivNrmdg83sX2QhSlk4Jw+aXSFgr4iOD5RSnIPGVOnVhA75o2RMSqTmjw75/KQVUMyP2xFO5MAZKHNiQWQsixzVzY1bDBb5SryIqkRd1tPlrDgf/BHdX2YD8wxUyEkqyN3rrRmIjFz6TMSR23g1j7rI00/znzK9BbHlR6QpicV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9psXQZ0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32a6a607465so635701fa.3
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690956; x=1750295756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0iMkhzgEkgnzNz7VpgQGchMjTI01cfv7nEZTNImKIA=;
        b=K9psXQZ02X3RMtr2K1xrRUDPgchcMIla3HHmz8pgvDjpNouEInPDvXMsq7MOIuGQal
         LxswlFnOdpelfJEnXlaintvbtleAHzn+1X9/4wYF3+FFjcM/eW51qt+gY7gQDcSfhCid
         1ad/30+6INPBZKmoqoFGy1KvNUSiIH51eU7FbMeuBdp4GZg/C7KtNoDNP18wHQf5u36R
         a69cJK+nqpc25GT7CXJSytIXEFbn9ux3/YeiyRO8kt6sUVHUg3iYfBZA+6ki+A69WpYf
         0C9wlU+YmXw/9hvTg6uGuqi0CfpTZuTEa/bniRYQfxPdNOPBfparSvHvLPio/jHlQVdE
         NUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690956; x=1750295756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0iMkhzgEkgnzNz7VpgQGchMjTI01cfv7nEZTNImKIA=;
        b=b64hRZt/c5xFU3/XSMGd0oh5DKljy/yUQ12eeFrqrFEH8NgEIYxJfkQkEISc1K+/3e
         +Cqz19XW3uwdhorHY4uz5Ewlw7xRAQcJcSqdHGI2X/65HwtQx3oyQeR+2AY5adZSe2UF
         TBCZ/udXbkSPjPzNzJ8O6UFitt0o/MxdtEoAsUgLBOe0xYx2DK5W0brLUBWPaQjjB43w
         JphA8o5Kwv1zZSKViTI2Atap3xyItrQs6M9u9CIrOjR0OKeVYX8aWt0e7hnZFnrL8+5R
         OAXl/glQw8gxR3xcn9vlODkIA9INXtnOw6hWcy20Wr9jV/XYMeR/acAV3LUtnJtjM2VZ
         MgaA==
X-Forwarded-Encrypted: i=1; AJvYcCU2j/Mzp/qLyIQV3j/ANosgLTWQl8u4mCRzEgATaeNehgnb0RDENHki81xWU0qvYozLZfasd2TDBKZfPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIFLIe2dLhAabjcDkJ+oWEKAT1ysixogB0tUXDS849SybrhSc
	qwAdkrMaZk0Tu5EBTDOJjw1Bwkrn9WVn6mK2tN9JqhKWPyzipNs2D3Njxv6cXypEGik=
X-Gm-Gg: ASbGncs8sx2J91q1HIYjv2neMVy34i+Uw+nz/ndK11B4qGN7ch6An0ctXZY6SgCo+xK
	eH/F3oc4zNd3dQQSFUX5Y5PyOR50ELksd+d+Nk5Aa9p+3BHbHgCMQJMgbLOqG3F2VrBcTAVQ/ZJ
	9cxW2eMLOfJiZQQGfVtx1XpMAU4DG5jO+ZQ5HBjbPQT+T6/i+a9wHbd4gBY4E7MxXU4NwFafpMJ
	w76PzHS7WSDqhs68SHtkKpOFBb9LNk0aQj7fMh3FXS19p2pkdxrHX/boaCVjiYtk5r5mwiQoQqv
	fRUeffTqKpjXsfs3saK7fWxrzOR8CPrri62QoKLRL1CeB9+0mym5NAaFGsRurDGxI46YezJFJU1
	3V6iRez8e1H47bay6YOkx6LbcYqeTMomkyjkPtHsl4FFqalcK8BU=
X-Google-Smtp-Source: AGHT+IH2ZVcSy/XT+P2sjhcrkyYbmgicFFUm992Rw/xmvLwsvTHEafUlWtKGMTeH3cdMFAbAsWhVRA==
X-Received: by 2002:a05:6512:2206:b0:553:297b:3d41 with SMTP id 2adb3069b0e04-5539c140937mr563611e87.8.1749690956123;
        Wed, 11 Jun 2025 18:15:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:55 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with new CSIPHY subdevices
Date: Thu, 12 Jun 2025 04:15:30 +0300
Message-ID: <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the new device tree bindings for CAMSS IPs introduce csiphy2
device tree node under SM8250 CAMSS, which allows to perform camera
tests of the model on an RB5 board with an attached vision mezzanine.

Note that the optional 'phys' property is deliberately not added.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
For testing only, do not merge.

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f0d18fd37aaf..401a32679580 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
 					     "cam_sf_0_mnoc",
 					     "cam_sf_icp_mnoc";
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -4641,6 +4645,16 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			csiphy2: phy@ac6e000 {
+				compatible = "qcom,csiphy";
+				reg = <0 0x0ac6e000 0 0x1000>;
+				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+				clock-names = "csiphy", "csiphy_timer";
+				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+				#phy-cells = <0>;
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.49.0


