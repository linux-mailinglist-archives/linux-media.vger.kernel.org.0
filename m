Return-Path: <linux-media+bounces-53330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFJiJw3pnmk/XwQAu9opvQ
	(envelope-from <linux-media+bounces-53330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:20:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDE197340
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 061043006014
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 12:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A062E3AE714;
	Wed, 25 Feb 2026 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MKcN0WkX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD93AE6FF;
	Wed, 25 Feb 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022007; cv=none; b=lWMuiliqFGR7cML1W6DvVtWyFtRZI+W+ZzQ3fSeSIHJs8gRagk1iwWyX71Xml+TEhCKPaD+jnl/isgMMiQbhoe3cbECZnb0LeBkNiLZFdIu4uWx2tS+OLtzx1bP3KSxrUgpgadPc8JsKgEy4syhMkHLnAePdV04YxgTRpkU0CzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022007; c=relaxed/simple;
	bh=JlJr368Iduqmofj7bAqR0psZwFk+j7JbEHb1QjmEwow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxHXjmHMKnpCRC8YD/S3lKWpUyP0+RC3OT8CyS7z3BTH5Ds1qFjPR8hvp2m/rShw+5XPPq8h6nD/5FSESYlzbKpnF1Z3Bcg9oc7JE9qvLaRRZ2nYcRu/mXNT1fR1QzSbmhdHeCRU5BsA4C1ri6U9IefW9BlNCLVIvwuuMReCJ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MKcN0WkX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022002;
	bh=JlJr368Iduqmofj7bAqR0psZwFk+j7JbEHb1QjmEwow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MKcN0WkXoI1k+XOxeqUivO4w6+eS6CbdalVc9vSRowUuCI19GMXAxIKWV8G7Sa/sl
	 7Fft0mqi7+maC1RaLOsApU5jbz7VfIMaH7QBCY33wnT6sSYOB/tfSq8bif/CwIrVtc
	 WqhxhKkkVs5I3fFvYwY07/uPZP62MEQeeqAIpoHius1byDluGaWZJlb616l7rY4yey
	 vXEWAez+Vo1noZaJxKv72H3oXi876S/+91PoV3cr0xHCxVzXrpqmlhC2VNL6KdJnS/
	 dNs5Dz9t8eHzk6xnfGzQUNMjHwobzN+W5AWq5F4wyQgBJmO4ppXsGnWOv8eQgHDWSg
	 keF1ZB1jtWPkQ==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5861417E04DC;
	Wed, 25 Feb 2026 13:20:02 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Feb 2026 14:19:58 +0200
Subject: [PATCH v3 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-vdec-reg-order-rk3576-v3-2-5a2ebe1b11a8@collabora.com>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
In-Reply-To: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53330-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[1.168.49.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0DDE197340
X-Rspamd-Action: no action

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

Provide the register blocks using the 'link,function,cache' listing,
which follows the address-based ordering and, implicitly, ensures the
unit address points to the first register range.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 49ccdf12ef7e..45eb0d053a6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
 
 		vdec: video-codec@27b00000 {
 			compatible = "rockchip,rk3576-vdec";
-			reg = <0x0 0x27b00100 0x0 0x500>,
-			      <0x0 0x27b00000 0x0 0x100>,
+			reg = <0x0 0x27b00000 0x0 0x100>,
+			      <0x0 0x27b00100 0x0 0x500>,
 			      <0x0 0x27b00600 0x0 0x100>;
-			reg-names = "function", "link", "cache";
+			reg-names = "link", "function", "cache";
 			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
 				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,

-- 
2.52.0


