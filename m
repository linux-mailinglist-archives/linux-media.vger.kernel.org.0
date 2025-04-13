Return-Path: <linux-media+bounces-30084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C896A873A8
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 21:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3783B6FF3
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 19:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A8B1F4616;
	Sun, 13 Apr 2025 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCpA2QXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1B1F3BA4;
	Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572936; cv=none; b=iC3cUp3NjN/J/8jNBOhwLvIwIOyFnoXRmBLGh/yrQd8FUdyfBuEoQZiBRRbJPAmxZrrQgCeJRe5Oi7C4LbqQurrObTQ7IwJgWdZAjBiWweMpmR3AWxt4LR+exR93lqomhk32JyXweP0wC+zhlPyu6898SGyI9E+dD4KR140QIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572936; c=relaxed/simple;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guzqNlvvQuG/CkKz69vMcdtBOtHoZnuifrWmdX86fgdqMGLDX86SsbKkgHncyiDfk+cRzVRtRqQT5kdCQayD41G1cmtZkFyIcNMxAcpRey33Eo5CexaJPjmVclpne8YluD7VXnNxKbDUcqmxKjZxkhiKl4KfJtFSFRIxLNuTaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCpA2QXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A8C1C4CEED;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572936;
	bh=XEKLLzDUwO73lm036APy9wcjIJRYWRNLNEiLDKpC+yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qCpA2QXZbHCWZRyTD3ah96MTimue1GT/Xv3+KyCZce4SizZtFFr41+2tx05l4xcZl
	 HJwfTctGaxRyKBzkYx+FkxtZ4285bw7OgBPJVKOvN+xr97557RHGb18S3CN7N0TIYY
	 hZlg0SxB1GbD8kpkC+jpaVGf502zK29i+KVqG7ioDwy6I227J/o5EfBrpY/JblzbhE
	 HVwZzh00yzkdhJh2jtkXxAC2fQ+SJcdXr4X00pZ4R7f32mob0icLO536ZHpnU2zAOZ
	 AHLprhg7klmtnShS390F3JZzMMitDVFvGEFECMEvKDaWbdYH1UHbJD6ooJiso4eb7o
	 M6I+kxlOApKug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1CCC369AE;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 13 Apr 2025 14:35:34 -0500
Subject: [PATCH v4 3/4] arm64: tegra: Add CEC controller on Tegra210
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-tegra-cec-v4-3-b6337b66ccad@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744572933; l=999;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=bblG65p7/xkPR55OcOIBpt0KSwsSdM49hsWkcsMIg5A=;
 b=A6bvMHGlLxAUDaKkccfI3+OvthSdTrPDoTTWMHmjESNU2kkiaHIBC/72AY0a3eqYeBgNRFki3
 oyC1mejNcEaCpSzecujSE7oNawIMoW4ymxmKi7vZasR03u2cTuth7+5
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



