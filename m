Return-Path: <linux-media+bounces-29570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB07A7F3BB
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76C6177B34
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C821825F981;
	Tue,  8 Apr 2025 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7RmFrvN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE5B35973;
	Tue,  8 Apr 2025 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087205; cv=none; b=MjN7GD/cxZzCP2yOVa77I0uKRNZhbfnvjXD2qUX6vSxBfGftsr6Xl4A4EJmOhnTJSNZSixDtSCIg2XeU0Tqqy+u7UUrfZUoCD9q+ZapfFfA9vFISKDXz1pDTriVHRzXtc5kgGTOOfpOZmi/Fbbvk5kq5R29+1owop432jtqKMTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087205; c=relaxed/simple;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dgi8XdvVEb+u/1mvyJxWeZZ6UCPpNwk4OusN67Hcgzh+t/nNvjOR7f9UoYliotB+Dri9sUyKNobd4RLEQqS8HB2p+VwzIOjx1qKDzKZpzOBiXd08YukAVQ1u5leaJCTKiEvqC/4sI113ZBwcMiEppaTYLFxM4+qyGSLISRmo6Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7RmFrvN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0B2FC4CEEC;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744087204;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a7RmFrvN0gOaI+VeEyVWumDDev/zJNUxJlyhvZBHG7jSSHPMTMe4kVg2JcHoLx/0s
	 M3wQOt43jEXEVxYGzhTJjH8Y+1exmHIPus/+Fr2CEZ6dib0QRf60buuKHK+2WWD+2f
	 B0VhMMeX1bhtuXDgHE7HwPBpElF+0u//0Capx83QhP1djfG2fOPEJjmmewU82xUY0U
	 vBbxa4KEkPfVxwXOTiGj8snRJ9tPsJGPufNOqLPL68Y7A21+0CWQfOS6u6ayJm852w
	 Wy1HaB8R0aIda5wiWnb1khPC0RkZXFysHgoa88FoblLdENlCHRqPnSxaMWAtJWDt30
	 p1aLPJFdVifpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B022BC369A2;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 07 Apr 2025 23:39:50 -0500
Subject: [PATCH 3/4] arm64: tegra: Add CEC controller on Tegra210
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tegra-cec-v1-3-e25dd9577b5f@gmail.com>
References: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
In-Reply-To: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744087203; l=999;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=bblG65p7/xkPR55OcOIBpt0KSwsSdM49hsWkcsMIg5A=;
 b=zNgg7owY5OUtcXF0vHQva73Lmo6DNe1GsIsbF8GS6qjP+D7aNxMxSAimzlQ9v78JVjXfxT7MT
 qD49K/NfYCFAPX0w5HhHDj/65rODLOkqyOkLa38SUvdTHhxqlYBsoCE
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The CEC controller found on Tegra210 can be used to control consumer
devices using the HDMI CEC pin.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index b6c84d195c0ef9ae90721fada09ffd46a9c11fa3..402b0ede1472af625d9d9e811f5af306d436cc98 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -959,6 +959,15 @@ fuse@7000f800 {
 		reset-names = "fuse";
 	};
 
+	cec@70015000 {
+		compatible = "nvidia,tegra210-cec";
+		reg = <0x0 0x070015000 0x0 0x1000>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_CEC>;
+		clock-names = "cec";
+		status = "disabled";
+	};
+
 	mc: memory-controller@70019000 {
 		compatible = "nvidia,tegra210-mc";
 		reg = <0x0 0x70019000 0x0 0x1000>;

-- 
2.48.1



