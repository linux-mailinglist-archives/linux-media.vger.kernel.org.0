Return-Path: <linux-media+bounces-53484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CDhFwMmoGkDfwQAu9opvQ
	(envelope-from <linux-media+bounces-53484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:52:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94EA1A49A2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30B8317EC1D
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA7F329C79;
	Thu, 26 Feb 2026 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FaVEoMU5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59831961B;
	Thu, 26 Feb 2026 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102826; cv=none; b=EHxKCZ4vy3zYeXg3Xk9t/m/JyqPEolZoNkympiQdraznSHYyOiHWkXFaOfxBY3CmblUS4nkC1yZjAkPsIyWt7TqsnnarZEw4wpOKiZg5x3R4OHbqOYEk7f32OJLnD8AZ0+yeagwVvD7bE10HTOKeyfoz45GwuuP2YwA9g7EmWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102826; c=relaxed/simple;
	bh=fWQKaJ3KVVTMepHRQE9cVCUJU/NMZyu4U07A0PswQIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+5/cmR7peDeH61zC8BmQ3kEA9LFQ9w/upVjpFoTUyUyB/6d+q8r27bm8N0My0bwmN8W9FuWNR/OBsXxWvBZZBAPP8XrdsKTq1tNSJ3QNaPb1hkrMlA3Urf1CDKW6uv+i20QsPeb3W7XgSsFmG5yZeFaW8Wk/Z96BxLzjZO4o2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FaVEoMU5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102822;
	bh=fWQKaJ3KVVTMepHRQE9cVCUJU/NMZyu4U07A0PswQIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FaVEoMU5JblM+IP7PbzUZJIk4S6+eTzoE5mbvJODDyg0EXbiefhFxjlcdfoxmUjI2
	 haCFSP3+r2Yw+31niF2Ab++VdI5anXEn2B81+TsJXgzekGzg2FsD/bcsOkLbY+AXp7
	 ltH9fVpZnHO44grqEts+YdDvkSlzjYjD3kLkD0ekS7cyNCuyXNBstEDIWQ0K3ihPoP
	 Dfp/FqKWgTA/QMKOw9x2KjjZ8JUcK6OUBz1z5V/4oeBXIHaeZ2v0QpM0uK5cDOL+b3
	 XM+R8/hPYkcztEmbD/5b0YxoWpsG0ZcCBQDnAcv/R94oh9g6oVO151ILDYNjQ9R+oX
	 cfIHjS+8cdBiw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4E4217E0E91;
	Thu, 26 Feb 2026 11:47:02 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 26 Feb 2026 12:46:55 +0200
Subject: [PATCH v4 3/3] arm64: dts: rockchip: Update vdec register blocks
 order on RK3588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vdec-reg-order-rk3576-v4-3-b8d72dc75250@collabora.com>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53484-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fdc38000:email,fdbac800:email,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: B94EA1A49A2
X-Rspamd-Action: no action

Provide the register blocks for RK3588 vdec0 & vdec1 nodes using the
'link,function,cache' listing, which follows the address-based ordering
and, implicitly, ensures the unit address points to the first register
range.

This aligns with a similar fix for RK3576 where DTC complained about the
bus address format.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593d8c19..b95129f85aba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1355,10 +1355,10 @@ vepu121_3_mmu: iommu@fdbac800 {
 
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
-		reg = <0x0 0xfdc38100 0x0 0x500>,
-		      <0x0 0xfdc38000 0x0 0x100>,
+		reg = <0x0 0xfdc38000 0x0 0x100>,
+		      <0x0 0xfdc38100 0x0 0x500>,
 		      <0x0 0xfdc38600 0x0 0x100>;
-		reg-names = "function", "link", "cache";
+		reg-names = "link", "function", "cache";
 		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
 			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
@@ -1387,10 +1387,10 @@ vdec0_mmu: iommu@fdc38700 {
 
 	vdec1: video-codec@fdc40000 {
 		compatible = "rockchip,rk3588-vdec";
-		reg = <0x0 0xfdc40100 0x0 0x500>,
-		      <0x0 0xfdc40000 0x0 0x100>,
+		reg = <0x0 0xfdc40000 0x0 0x100>,
+		      <0x0 0xfdc40100 0x0 0x500>,
 		      <0x0 0xfdc40600 0x0 0x100>;
-		reg-names = "function", "link", "cache";
+		reg-names = "link", "function", "cache";
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
 			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;

-- 
2.52.0


