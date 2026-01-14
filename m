Return-Path: <linux-media+bounces-50675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C80D1DF40
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0466330A77F8
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9453393DF6;
	Wed, 14 Jan 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VNnafiZc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC373921C0;
	Wed, 14 Jan 2026 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385375; cv=none; b=TEnBfoB+B3tEX1X0Hi4BYqT20bvANFY7ZceLcIAcCkvOWgWjWNHRjC7dyxD5QJKnSONRGtXRhtEXrNjBrN9NZkx3uidQb3Mv4udWLJbkCfYSOX7nZBhafdY6smxg0dL3uF2KaTFRcU1NGAQmHH9lQPuMLa7UpMjT/XzPclxSgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385375; c=relaxed/simple;
	bh=dFDb+uXCI5iHJKzZgaeokj2YXCnxjmhPbpePbOplK+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dA5Y2L8rh1dPr64KjOmpRjxZxGkzSMwRqbZy2/v0aN5OW6XXwNLsw/Ee8HCcDNzlMGcJoJexi7bPFxA1MIipxuF74TjOkEY2rNND9Yp499KKeK329eSoRfLzeYRWZeIrE1IrGfSa3lJJO3h/MwsCLC6jJfpP48f3LX9umfiRkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VNnafiZc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385370;
	bh=dFDb+uXCI5iHJKzZgaeokj2YXCnxjmhPbpePbOplK+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNnafiZc99K6ZNICeG40UuCzvf8FzKR+bMOOX0Wja65WmiSBxZmAUC4mfl1XSkzDn
	 cx9DFKtWMjYdqXAa853ZJazIabL96iZHt8HmHygfBmYHeonqQjgkdb+1pJNOfObEFW
	 tc25wZgqtMnQsgge88Eb4lXBMgJV0MWx0C+oWkDgPFvKThdPokq2XsKqLjD0t21JV7
	 tk7nvzrS9kb/UWBnpTmf4vF8g+xqN+mJaVgCc/ut4okefF79sj7gE2pksAoFPPiSZA
	 NHz7YVQcAOC5lOUz4LGb+i14QYAF1qoFq8GRkn/WB5VTNjE6Z01B8uje6h6AFDrK/L
	 xtQ3NfamTP2Kg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 677A617E1523;
	Wed, 14 Jan 2026 11:09:30 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v12 5/6] arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
Date: Wed, 14 Jan 2026 11:09:17 +0100
Message-ID: <20260114100922.149187-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the Verisilicon IOMMU present
in the RK3588 SoC.
This IOMMU handles address translation for the VPU hardware blocks.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 2a7921793020..acff8bb3a612 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1364,6 +1364,17 @@ av1d: video-codec@fdc70000 {
 		clock-names = "aclk", "hclk";
 		power-domains = <&power RK3588_PD_AV1>;
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
+		iommus = <&av1d_mmu>;
+	};
+
+	av1d_mmu: iommu@fdca0000 {
+		compatible = "rockchip,rk3588-av1-iommu", "verisilicon,iommu-1.2";
+		reg = <0x0 0xfdca0000 0x0 0x600>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
+		clock-names = "core", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_AV1>;
 	};
 
 	vop: vop@fdd90000 {
-- 
2.43.0


