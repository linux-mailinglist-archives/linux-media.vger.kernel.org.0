Return-Path: <linux-media+bounces-54537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHwEADSeqGmHwAAAu9opvQ
	(envelope-from <linux-media+bounces-54537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:03:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BA207CFF
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7FCA30E6FF1
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 21:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C9639150B;
	Wed,  4 Mar 2026 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eyoxGK4j"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30F388E4F;
	Wed,  4 Mar 2026 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658089; cv=none; b=ulA0Ub9Y5Eap5U5ZRW9zD/N2bFVVDCZcowECnnyF/UuorQAoULPk1gi4OubLzaHLlfZBwSEXyeotNiuEv8ie2pxZUy43zfWYIxl33I4kjGhsKjP6eHt7PZkkLLGaWyVDvdzCWr0BGs6nUS3/55dKhUgK3GlhD1g/c6htWizFA0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658089; c=relaxed/simple;
	bh=7Pu/j2FA1dbN74NgBoJXDOll0xaVUjyO78TNdm4qOyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyVTP4u5UwATz2bqCz68KX7cmCBtiTKPVOH5W6j4JxzX4TQT+corvcmfapPABhfXPHTV1GKaqaWct0Vo47MMjEQ9kjNK9M8pf4aViYp8ctVUUJZFRbkF7ckARqGAjWWKGiFF5qcp7UB513BaKqS0FdVF/2TQTCLx/JtnRrlQgh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eyoxGK4j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658085;
	bh=7Pu/j2FA1dbN74NgBoJXDOll0xaVUjyO78TNdm4qOyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eyoxGK4jaK4/GknPSu/Bfp9WaLDZ/lpe9uRdvOqV5iiQslMZwIMhHnLQNBi3/vzBy
	 DlnyRf/Yy/jha5dRa1DXk3lSNAtX+GgGSSJZLWRvH5AFxPN2ITum3fI4n6dc3idz6O
	 sKjgbTF7bch0ddMaRGSRkNALIG5x+yRrLNzUV0ho2XhFi12/n+6AQ5ad2LZykVK6OV
	 VOlEJ3WVZV/MlN9VuG5PrP54HK48FuJhFLl6P+iUx6j6Ua79ktHwgpQO3Geug7Ml9u
	 pTBAzQzORXrKjWSRf3NIrREsc2nL0oLB8SpaM9Xjf3hB9LnsswJc2WxmVwJFBNwfNk
	 xiHDC9ffTrjiw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9752F17E129E;
	Wed,  4 Mar 2026 22:01:25 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Mar 2026 23:00:43 +0200
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Update vdec register blocks
 order on RK3588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-vdec-reg-order-rk3576-v5-4-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
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
X-Rspamd-Queue-Id: 746BA207CFF
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
	TAGGED_FROM(0.00)[bounces-54537-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,fdbac800:email,fdc38000:email,fdc38700:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fdc40000:email]
X-Rspamd-Action: no action

With the introduction of the RK3588 SoC, three register blocks have been
provided for the video decoder unit instead of just one, which are
further referenced in the vendor's datasheet by 'link table', 'function'
and 'cache'.  The former is present at the top of the listing, starting
at video decoder unit base address, but the binding got this wrong
initially, i.e. the 'function' block got listed before the 'link' one.

Since the video decoder support for the aforementioned SoC in mainline
driver and devicetrees hasn't been released yet (just landed in
v7.0-rc1), address the problem by providing the register blocks for
vdec0 & vdec1 nodes using the 'link,function,cache' listing, which
ensures the unit address points to the primary register range.

This aligns with a similar fix for RK3576, where DTC also complained
about the bus address format.

Fixes: f61731bd6062 ("arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588")
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


