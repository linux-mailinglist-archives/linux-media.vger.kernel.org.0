Return-Path: <linux-media+bounces-29816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77477A8344D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5AB63B7E71
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC083221712;
	Wed,  9 Apr 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5443VJz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF221ABA0;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239448; cv=none; b=R5BkwE2htD0vkgpuW2tfnZUNoKsPgwLgppic5W0znorz6eZlPHP0Si93SBJvOLTHNKuA3MOkXpS0mXkPE4eAUPIGyVrxu9CiWP8mfmOccqhholfM6rEslpVA3RHfe9U1hoYNt9o274cj3EkpjW7+R/rmTqQZYwqj6uG+Y48LtWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239448; c=relaxed/simple;
	bh=SG6l0Nsbs2RYf2lRqMLwcpR1R7LfZrlP/z3CoVkStGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfx4tj9AuQGoNkG6ZcrSvl9WOLYQIIqIRjGyQ13GCcPPhCR+Tm9TEXLDd+fA7r8V7H8gmJSgk2cleqTG/WbMFM98jqF4OdGHibAzzsgc4MgiwfGwYRJoG7vgP3KDOV/Rf1W1T6NFvoK98M5y+WQ863fCyNTTRJcC6MGxMergeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5443VJz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C8DFC4CEEC;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744239447;
	bh=SG6l0Nsbs2RYf2lRqMLwcpR1R7LfZrlP/z3CoVkStGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S5443VJzT0VL8nGKt1YmsU51kTgW5v2cs3rLYyX3w+hoAnG6Id0aTuhbQ+Tqz9/5f
	 L0qT/ZOJKbbeB8vklHvFC6/kOdrOMmXHtsByXSSIlaDf6Sp0CDj+aEfbwusPBtH8/t
	 QYglhx+4K4aehtwtLqxviu6lvqEbnJt0Sa42Ei4eJsuymoAVROunrffQHzociwM3S8
	 In6bHKWIPhuHofrel4V1BITHNjUwpgTQv7mBOwFV+2Kp9x0E95yeN78d7liD5PmbSl
	 I+fS1BsWIw5XvsCefUeZaVvF/r+m30EHxxQRGTEHby1j6fVtHrMlICbxjnF4+OUaRI
	 nEbhH6YY7/jDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A40C369A6;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 17:57:23 -0500
Subject: [PATCH v3 2/4] arm64: tegra: Add fallback cec compatibles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-tegra-cec-v3-2-91640131dfa2@gmail.com>
References: <20250409-tegra-cec-v3-0-91640131dfa2@gmail.com>
In-Reply-To: <20250409-tegra-cec-v3-0-91640131dfa2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744239446; l=1680;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=WEs9nof5IjWx7LvH6m7ix7zLOBiBSogzTwy1MrVztiY=;
 b=46oavd/oLmV2yU2/kZqH6kwlG9bEs11YLgcY2zhRZW3azrOWUNPjI7S7yWFbPdNhEuSxjNLDK
 d6w6aCmVsN2Dnc8hjUUnDY/LTG/kWAtCrG8zX+b8aBweh8GjV+QyOMh
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



