Return-Path: <linux-media+bounces-30087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F41A873A7
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 21:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500F21892BF9
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 19:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433C91F4623;
	Sun, 13 Apr 2025 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alu5oB6E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802621F3BA8;
	Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572936; cv=none; b=FoFt8++rqUDesO0dHWWgVPhT9N8/Ky9Pt0UuD4d6Gnm8L7wjILrH9WIocbKx9IHQLKU9BzqXzzDW45tX7nlNSnElCkR4agmLZ8mRvAw3X1yeycOl60BWnljxRV/hp1zzyTkgQd+K/7bYYDv/7xk79EwztDGxU/mHZndrwBtaH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572936; c=relaxed/simple;
	bh=SG6l0Nsbs2RYf2lRqMLwcpR1R7LfZrlP/z3CoVkStGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZE2ck6eraKJwWzyLrcw03GCWzGSlPk1LNVH2iy2gkojJeRpWksFb+GK2EPXIjS6ofwRjgC260zMsZkMFAmqyYjoN5l+ANUI3kYrw8WvMKzPwu32xkorQSiLEhPmd8KyP9D9dwKG3Mhy2Z+EvhKjqxAdROuCNJ3wG4hwxZdxzR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alu5oB6E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79FA9C4CEEC;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572936;
	bh=SG6l0Nsbs2RYf2lRqMLwcpR1R7LfZrlP/z3CoVkStGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=alu5oB6EIBkrXhq2um1vLIWVghPrlsQXGhRz8uiA+W3IzvtFCkIe9Jk7535ypH8m7
	 Dec/ALJnbvuV0SiLxIbLAjij+z2ujKZfeol4YUI7CCy5oZUtqKvIgH+RThpgRiag2K
	 3PgIB7FsB6LjZSHtZeUqoH1mZ+p0iHCe4CH4siAik8UooKhj9DKz4SU6OMqhg5+Gp3
	 erYZlb1dqG418VD9698hXnWBKd0MZ+7yt0UV116QFDbOf6p1UxGmjqXOtNGpQmNmH1
	 wyMZEh+o4j1L7Fdovg/CB/CYXf2cKIuJnlGJ5rCE7dg2I1sz/YCLYMtF0cRb6rDknC
	 N7hlXSRh+2X2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CDFC369B4;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 13 Apr 2025 14:35:33 -0500
Subject: [PATCH v4 2/4] arm64: tegra: Add fallback cec compatibles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-tegra-cec-v4-2-b6337b66ccad@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744572933; l=1680;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=WEs9nof5IjWx7LvH6m7ix7zLOBiBSogzTwy1MrVztiY=;
 b=t7uGNnhqtT6Ubj1ynNMH4S5+hU5bHcqnUHcu0pCrTyS3JmPSLBB0QP+bhkDiG7zVGLNYCJAzn
 s7aowYnmD0rBwPgJDo0yLmJHjJFh1D+1AnMFsQgZK3nCQVVicRuoG89
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



