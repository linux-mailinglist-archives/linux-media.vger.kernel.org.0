Return-Path: <linux-media+bounces-29667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 382BFA816F4
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 608741B87F54
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716EF25522B;
	Tue,  8 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIkn9fV3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938CE245024;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144222; cv=none; b=aoDltkvdwB5ZoVqpbywBxYwAkSxKvzIZsbx8t7mhws3SuP9SELT6GrNqOzQZNHXXC39+rogU+JKkjDct1K5cPlNplFkFdmdYBU8QdG9ZSp/m90MRq7EAayZZVIQRiwp5nJRnoexz6AYCSeOrxHbztJCe4GBwV3ynp4lWqNj5ubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144222; c=relaxed/simple;
	bh=SG6l0Nsbs2RYf2lRqMLwcpR1R7LfZrlP/z3CoVkStGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaeEHiaDLe13YV1BYGtb2g/z7RcHwtchyrJ3xAnMwGsSYsGi1toAur7y36YiITsu60smuQZfmPCi5vMyjxFB5tlRv0KHKNEffHtrgKO/uKE9q5Tayei2VlnzlB558x0xJGwqlwCmqxAuo9KOBcTPn/nR7E6E9i0J/0AwBB1cJWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIkn9fV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 315F8C4CEED;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744144222;
	bh=SG6l0Nsbs2RYf2lRqMLwcpR1R7LfZrlP/z3CoVkStGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jIkn9fV30w2ZKdjBgwvNTRWvn0mG353RHBPct8+K0fgG6HhCzgGOCDNFNHXUWtbvS
	 kCDw2++owrXqVLfHkFBc7aqcvTQxyTLH/jUhOdk/wEQf2awivWXg54ycK5CSD15mUW
	 JgyNSOX9VpAMl8gbf8CPHKDnFz3gRk0PlhHIO4IRUBn7kSuzMnZ4eWUKbFdW8aZTLi
	 GpGH4UHbKjd4TNWBqZGjOwI4MMU5BJ8J+uF4BfFFeHtanfBkW4kRpufFaatPBClnkZ
	 PkaFJw+4VhtPQH2ljFHVVZl6UMnnOpjKv9x9EqQlvXkUZLkEKbTePpY7g/P0anOJBS
	 INqZh9aqvVBPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26780C369A5;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 08 Apr 2025 15:29:59 -0500
Subject: [PATCH v2 2/4] arm64: tegra: Add fallback cec compatibles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-tegra-cec-v2-2-2f004fdf84e8@gmail.com>
References: <20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com>
In-Reply-To: <20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744144221; l=1680;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=WEs9nof5IjWx7LvH6m7ix7zLOBiBSogzTwy1MrVztiY=;
 b=V7gl3QUk3L3iRi5LK+UwJzwTHB6hrs0UHRpplr7TZVLl5e16rA9SyMgpSQuWWOKO8kmijnSFa
 ZWApXiqEzOiDH3iXl81sCWXuGsUsK1W/3wfAQ/ZtH3769ZVmOF+zP2i
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The tegra_cec driver only declares support up to Tegra210 and will not
declare support for Tegra186 or Tegra194. Thus list a fallback
compatible for these archs to tegra210-cec as they work as-is with the
existing driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..7f76c81d744ac72fd117b82f4b799322d2a11b82 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1183,7 +1183,7 @@ gic: interrupt-controller@3881000 {
 	};
 
 	cec@3960000 {
-		compatible = "nvidia,tegra186-cec";
+		compatible = "nvidia,tegra186-cec", "nvidia,tegra210-cec";
 		reg = <0x0 0x03960000 0x0 0x10000>;
 		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_CEC>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 33f92b77cd9d9e530eae87a4bb8ba61993ceffeb..9b39bc126381b78efe067df790614d74b24897ce 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1339,7 +1339,7 @@ gic: interrupt-controller@3881000 {
 		};
 
 		cec@3960000 {
-			compatible = "nvidia,tegra194-cec";
+			compatible = "nvidia,tegra194-cec", "nvidia,tegra210-cec";
 			reg = <0x0 0x03960000 0x0 0x10000>;
 			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_CEC>;

-- 
2.48.1



