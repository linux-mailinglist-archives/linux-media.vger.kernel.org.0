Return-Path: <linux-media+bounces-29817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E524A83450
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2C511B64005
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15E9221725;
	Wed,  9 Apr 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeSw2vAC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BB21ADC6;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239448; cv=none; b=tmc9hCWtMJZxRtxDfWlwPU0Y9NvjJRCNtt0IPj/2Oi13P5lheDHfW5SNEigp/l4ZD9gxP5CBgxQA2VB5KudgX9Ozk+pdlLYxe5QySLtefQewOi8XAvgttskRHSISk5prQzwiWtvx8r8W1jzyUmIp8Rw3XSJaNpUPkU2ExV4rjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239448; c=relaxed/simple;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiAGZWwNKaRdPA7eCjSuKbE/t0R3tWNB5vYVKMhKE5D1hqhhkGfCkfLA9gVH4z3fYAb56D4bV5Le4CYwoc8/MBFt6VNY9pPrHWlYPxDnuxCGnqQQqe5xfjk//fpNX2iQ17C+8lFeRk+8D08zESnq9q9kxssuH43ips/XFKA+TPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeSw2vAC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A6A1C4CEF1;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744239447;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NeSw2vAClHxTPm5LnKEp+L+bvSDpx6A40E99d9lSPslUsHHKwOQicqBE1GDzbD6g+
	 4hwWHs3lYGQGGuZFKVu1/ccS3k6jN+Xc4dQiC5xA54Ttfvqb4bjDoSvf2+cXJH5WLY
	 rMILwARkz0Cy6saV1HeP0qJI+xB2hDmEiCj6SrE/Hh0ZpF5Lk20BfsKG/Y1sYihbPi
	 Kekb6VQ4O2+pK6NUiauxYYqNyK4S6JBO188mPpZx0wlEc0aU7AyRtmB/+sSZI3InBK
	 KSEGt000FNceBv9KXJgg6X1yMDP15AT1uoOAV81ubo3RrgHz22eQb6fn+ZxlEkU2I+
	 aTuUU4YJLHxMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9CDC369A2;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 17:57:24 -0500
Subject: [PATCH v3 3/4] arm64: tegra: Add CEC controller on Tegra210
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-tegra-cec-v3-3-91640131dfa2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744239446; l=999;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=bblG65p7/xkPR55OcOIBpt0KSwsSdM49hsWkcsMIg5A=;
 b=P3u9NV0614vLxzoqbUnCwqdkboJF+ta7CovsH752XtpwlOyF0mMjlOnGKt2oUB+o6QLdJbdS6
 9tpt+z/QRslD/WJqK4JvuPLIMp9ZUKuIUR9/XoSC2WBteSte4UmIQIm
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



