Return-Path: <linux-media+bounces-62699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIyXE7/wE2pJHwcAu9opvQ
	(envelope-from <linux-media+bounces-62699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:48:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E535C6B93
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99409300D6A4
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 06:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CB4231829;
	Mon, 25 May 2026 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRBlGGd9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9503AA1BA;
	Mon, 25 May 2026 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691677; cv=none; b=btSzLAIi3BiwUL4XeOGRw2Z62iX7s+oOTpyxCkz1PL22IzP1hlKC/RvahxWV6/g5iOJe6GAfQhhuLawmOE/nu9FWWiYuoNjL9+KC4M+1I1C6WtomBhLcQC27sCx1iawPGEvxx8vO42tgQJ5mX2n+e908uWQegUTVh0lhjKBFs5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691677; c=relaxed/simple;
	bh=rQtWtz9PaBC5kO/YmeSFs1AL2c5xXsa62gy6hOf0BC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEGXa49M1KGZskqD9cymDOEFUl7vRhJAtWhZQebgMvoc3oPUbNWwcg5buhBVYyVHGKRZUN6vC6oyD45wBuhOWQq2kpMaVgNwlTKVaA13hEOSRgnUgPRi3HDMRafyMlTP0R798/aMPt4cvi7TTkSNp+bzaL6jwKSHNt5FliihGx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRBlGGd9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C58C2BCC7;
	Mon, 25 May 2026 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779691676;
	bh=rQtWtz9PaBC5kO/YmeSFs1AL2c5xXsa62gy6hOf0BC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RRBlGGd926Pbz+gVLIdJH4aGYLYZwwKI7u8T3BTGNle1QfFTLqka6n4G2dsp7L8mx
	 hpZsA4p28dw687ygsK42fuR/qdNpFMO44tD9Uiyp4+hk0JDUcK7tToDVkEYlXo1H1Z
	 RXrruj6o07PvEGWpLeCuJsK4MDUubpcIXQttrQsjcl6+nUSq+YHtM/U4lcXv2sfBax
	 GLhYtvvvhMTdPL2PuB2fpVDgnohZ1FXbVuP12iuHwSbhLyWXJDSKprrxH7yYfY7RVr
	 VMRNo9ZtBAdFejzhKSoSUPKTe4GZ1HUM4aO5aD3PSnKS+G9/LTAbgXt1A3ZFerT5LV
	 nOJ6iNGfTNQ9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44221CD5BCE;
	Mon, 25 May 2026 06:47:56 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 25 May 2026 01:47:45 -0500
Subject: [PATCH v2 2/2] arm64: tegra: Enable DMA Support on Tegra194 QSPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
References: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com>
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 devicetree@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779691675; l=1118;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=KjSbPkVlCYH0lmqUb9TdWBRiwbc5n5A4wUaKdi0Q4ak=;
 b=PBjXCsxlPIs64wXAC3rv9Jl/iDRaXY0pG7TZaawi+0P9HpR2fOtGfRnlvlgqjKFs1D5MLuduh
 dV+Gq/kPkXYA63Uajrq8p3bL7jiD7BePTNcpBzrltxNxMjBOVFAbTfp
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62699-lists,linux-media=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.49.229.112:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_PROHIBIT(0.00)[0.50.90.160:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F2E535C6B93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Aaron Kling <webgeek1234@gmail.com>

Without dma enabled pio mode is used and flash storage such as the one
on the p3668 module times out and cannot complete any transfers. In some
cases, these timeouts cause hangs and cbb faults.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 1d659454a6f9fe..e2ddbc6715d5e8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -923,6 +923,8 @@ spi@3270000 {
 				 <&bpmp TEGRA194_CLK_QSPI0_PM>;
 			clock-names = "qspi", "qspi_out";
 			resets = <&bpmp TEGRA194_RESET_QSPI0>;
+			dmas = <&gpcdma 5>, <&gpcdma 5>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -1013,6 +1015,8 @@ spi@3300000 {
 				 <&bpmp TEGRA194_CLK_QSPI1_PM>;
 			clock-names = "qspi", "qspi_out";
 			resets = <&bpmp TEGRA194_RESET_QSPI1>;
+			dmas = <&gpcdma 6>, <&gpcdma 6>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 

-- 
2.53.0



