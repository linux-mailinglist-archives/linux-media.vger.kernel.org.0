Return-Path: <linux-media+bounces-29670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26FA816EE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CDE94A5BEF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A0255239;
	Tue,  8 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLVCpVsW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5925290F;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144222; cv=none; b=cRCqGA8E/ft6NL/p+tu2LLcdhE/b+WarzgH3G4g7Tgz/sdh/MVA7uP4K3gMNnEmTtTxRa3beDa3jtNSDN0IXHdTAEk6XcrSsY/P/bOp3Jbwl2fC5n/ZozZ9iv818cd6bnDf9cBqVOp1xsdd7OnI5N2Xy0PFopX130kdKqg0yQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144222; c=relaxed/simple;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJ1CjewbM4RTzvi4W7PGTEtCJ1tD9XeTR1wBBwpFKjZ1Dm7pSOI+Bpbm569ZExmwqZ1pWxBdj7LgrYNVz4qZR/0NbrDrGIGpDYaFVUME6yf/tVBvkxX0khnWQbV+FtRq5SlBiYQ5X5hQiSDlRmhzz+ArNG4M8uzu/0dihY0ofUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLVCpVsW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47586C4CEEE;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744144222;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fLVCpVsW1wfMiMs01fFiO967WnKWEN+8eEuGF+SCx2IZCkYVrcLdwJt9yzFc/yKOy
	 /jguohoSRCvw159Cngyb9loBBoB7lFfTSk3t8M0aGot2I4dKEZnuPLcWPz5KTxjI2+
	 bbx1+AF9daJTqmJ+L5OtrC8ZmIVWnZ1NLF1E3+5BdxZB1M+i7uMHtRrBGmkmq5K+KW
	 ZqiowZWhjdQftkVPsPvyRDR4IiEEgY2H0am5T3Rd77R6+taWd6DLFGbLJFoFJvBk8T
	 2/T8MKG2/RzNCDEgOGgRF3ZqZoHO5C9wU512aruw5FNzuFvOZO3KoQQb86hziDz2AW
	 OQr+A2S3wDqTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3795DC36010;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 08 Apr 2025 15:30:00 -0500
Subject: [PATCH v2 3/4] arm64: tegra: Add CEC controller on Tegra210
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-tegra-cec-v2-3-2f004fdf84e8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744144221; l=999;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=bblG65p7/xkPR55OcOIBpt0KSwsSdM49hsWkcsMIg5A=;
 b=zMPf5KPEhsaVb3voU1tLoQ9X3dtuCdlxCuukdRLU+9d0c9gC2ABWYn/XImoXXya0YoeYDN09H
 BjQs5p6m1gRCn60EKnDN5BaDw9zyqs5/6QqJ2ktqcIFJPpOdUqqJRji
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



