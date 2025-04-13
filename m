Return-Path: <linux-media+bounces-30083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB5A873A0
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 21:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53993B6EB3
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3751F4171;
	Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm6FQBEx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222BB1DEFE1;
	Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572936; cv=none; b=CZxsoOIyXbmxc6DDGHeODG3PC0kcN/PfdQKJwppM/CiKUtvIRXqMYnJmdmqicLnJYVNbVv41b6Czv6/FZzHGDT2hxgVhIM4VA2RjABFzzcwEvsc7MnqpWNPq0KasgtlFkfUBFh17PIcDu9qEvytJGAs8FLt1vj9jrTJuAWuipJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572936; c=relaxed/simple;
	bh=VLSMlFX8MHlSUtQUTu5mk0CYrZpnr3KFN4CqZqLwFhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6+G0T+IhXv86HHv5LTbdFccZsMIOZTPRRgT9452pn3LBawctTzEvw4JjE5rVWufkSPyOFOpjVmVGvzpr5w1lkW1C3eaEpe4DgCLnS/MxykX0B4hTxDHWexMTZU9hp8aMjhY9dx6/LrMSoOqOTpvpta17mzKOXyVblnoe1wJR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm6FQBEx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A267DC4AF09;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572936;
	bh=VLSMlFX8MHlSUtQUTu5mk0CYrZpnr3KFN4CqZqLwFhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mm6FQBExFjcEMVEXw332L8z6dencg2txYQWk6nI3Id+qlXlTiRURVwP2ujqTZmIZJ
	 JROvCEQMOw4n0R6xbmSIFRk/hcq84cQ/MHBmyBk2QF85zMTNkvWWzmeKxwqHzitQ4p
	 uy3wbifi1qRcI+rA4pahAz1Mo1twlKel0rZAM5LEPKfH3ZilaxjYUo7ozsnRQnKziE
	 l+ST7PljuOKYUYvKbTM5lmqVKgIA31HZsl6MQiHSOHcTSAWL+pa0nIK/tavxJsfw5o
	 amQT5AQQ6zsOIOxjC+qz5ow4jdm4ObS395xt7/1PZAHC+TdNCXYKEk8YN+ZT3Ua7y2
	 vr0TST9fCNRJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED4DC369B7;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 13 Apr 2025 14:35:35 -0500
Subject: [PATCH v4 4/4] arm64: tegra: Wire up cec to devkits
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-tegra-cec-v4-4-b6337b66ccad@gmail.com>
References: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
In-Reply-To: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744572933; l=4050;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=/KKv/TYqLGMeib4RLCtBAkuSb2lVtoCy1X50R5bg7FY=;
 b=Uexyi3o309WD9eQ/0aJvKa0CavS2qH7yjjWfDPCINGJF7tfJNyL5GAim8c0wFkW5gz4rsIbeo
 1X1DZs4gj7kAC1eHTi1PqfNQbjPpeI6/UHPm+bYnFI1DbrW93wyM5Ko
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This enables hdmi cec and routes it to the hdmi port on all supported
Tegra210, Tegra186, and Tegra194 devkits.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts            | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts            | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi           | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts            | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts            | 6 ++++++
 6 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 15aa49fc450399c7bd525adcdb6e92a27a185805..90155e4ff1feb609f79416a410c3666ebef8b634 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -2394,6 +2394,12 @@ usb@3550000 {
 		phy-names = "usb2-0";
 	};
 
+	cec@3960000 {
+		status = "okay";
+
+		hdmi-phandle = <&sor1>;
+	};
+
 	i2c@c250000 {
 		/* carrier board ID EEPROM */
 		eeprom@57 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 26f71651933d1d8ef32bbd1645cac1820bd2e104..a6d7fec2e84fb917018aff843845b02c34fede33 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -712,6 +712,12 @@ usb@3550000 {
 		phy-names = "usb2-0";
 	};
 
+	cec@3960000 {
+		status = "okay";
+
+		hdmi-phandle = <&sor1>;
+	};
+
 	hsp@3c00000 {
 		status = "okay";
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index c32876699a43e9f57b3888c5bc0f5da73c5b95b5..ea6f397a27926e3dcd54002177f68749bc1cc309 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2121,6 +2121,12 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-3", "usb3-0", "usb3-2", "usb3-3";
 		};
 
+		cec@3960000 {
+			status = "okay";
+
+			hdmi-phandle = <&sor2>;
+		};
+
 		i2c@c240000 {
 			typec@8 {
 				compatible = "cypress,cypd4226";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 4a17ea5e40fd034c6f4acb023cd7908d6800f710..16cf4414de599baea96362b494be40c800a8197f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -2174,6 +2174,12 @@ usb@3610000 {
 			phy-names = "usb2-1", "usb2-2", "usb3-2";
 		};
 
+		cec@3960000 {
+			status = "okay";
+
+			hdmi-phandle = <&sor1>;
+		};
+
 		host1x@13e00000 {
 			display-hub@15200000 {
 				status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index a6a58e51822d90f8815df880ea7e668caff1b1ec..627abf51a5a472ddcc42fdc1d783876b0a03da47 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -90,6 +90,12 @@ eeprom@57 {
 		};
 	};
 
+	cec@70015000 {
+		status = "okay";
+
+		hdmi-phandle = <&sor1>;
+	};
+
 	clock@70110000 {
 		status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..ec0e84cb83ef9bf8f0e52e2958db33666813917c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -419,6 +419,12 @@ pmc@7000e400 {
 		nvidia,sys-clock-req-active-high;
 	};
 
+	cec@70015000 {
+		status = "okay";
+
+		hdmi-phandle = <&sor1>;
+	};
+
 	hda@70030000 {
 		nvidia,model = "NVIDIA Jetson Nano HDA";
 

-- 
2.48.1



