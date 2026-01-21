Return-Path: <linux-media+bounces-51220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEXGBWeucGkgZAAAu9opvQ
	(envelope-from <linux-media+bounces-51220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:45:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88455705
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A5C5F52A48C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D9947AF75;
	Wed, 21 Jan 2026 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCMwyh1o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201703B8D56;
	Wed, 21 Jan 2026 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991480; cv=none; b=nYWmpUKBDfctpBS7CdFAjks30N/pJxmIGwWLYJKDIG+ot+BjQ8gPlUMtYDLZzidN6dM5X/kg95PXb91hylccZxdMxKJYpGt21/ck+FAWkdQPXYMqn+jZDy2IvJGy4nfjbaEv/BToL4xbZz6DUqN/k/ntd/4dBz66ImIzbym40BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991480; c=relaxed/simple;
	bh=Zy41UwtVc78Y7hlHNkNvuMf7hnbnIw6ZTXc0eFogMko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQow2z2JEAe8EpMkT5G0nNKQmm64xtgl7HKlJmUdbpeHL+y3oaIBl9/561wiMJc0m869yJfzHZYL29uNJSM5xfV2VUCcX4KV2Fd1oENHD7e7Q9tQEZpKQB/w9nisqmRtyhnqB8QyA9ZI1N8DwhtQNYYJnUSMhP1QJSXD53Q+tPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCMwyh1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1E3BC19425;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768991478;
	bh=Zy41UwtVc78Y7hlHNkNvuMf7hnbnIw6ZTXc0eFogMko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FCMwyh1o7SWaoHVIGii+6tVQpFDHAxDN8dx2u4A6PXKYNbzewqIj6RxYq8LYMsbbf
	 1wD5u37qIFYvLKXmWEoeoSpo+CsjuColYqF0b9clu/24KJg5JlBkchVGfo1i7KNz8M
	 SCophZVXnXCfPn20P2mKu8t3NCCxdxOQFSWfhW1TLCkvCIdioJriHwFwOHiKDLyyFG
	 x1kPvbeg3tkgrPMDF1EL/ple/BTPc474tnkmh4RDNMKl3V5E2XKsMbN9rKQK39CJQJ
	 NWke5z/MYK7QH4qOy5p1wsXD1D9w9HX4C63tAae8LyR2Ot3xRzPZiJVxiCHC8An/zV
	 NGt2FIWpF5i1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5F3C44501;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 21 Jan 2026 18:30:41 +0800
Subject: [PATCH RFC v3 3/4] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-s4-vdec-upstream-v3-3-4496aec3d79e@amlogic.com>
References: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
In-Reply-To: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768991475; l=1534;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=IzNXt2+VyFRVs1Y87t2pUqlUvtHK8Yc5ii/YgU+Xf3g=;
 b=xx4IFR50dTvR+IhoaSdyB9ewHO/ihu8C/le7zGIqU9cauI5USp2V62XmZWrQG6Xyn6pDqCTaP
 dN6f7CPzI+OATv8nm6k8GloH5TIl4kfEPREWeVr7nZvAcdz0mqLPX2i
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51220-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:email,amlogic.com:replyto,amlogic.com:mid,fe320000:email,fe036048:email,fe08c000:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CA88455705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index dfc0a30a6e61..b8355e41d550 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -862,5 +862,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vcodec-dec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			amlogic,canvas = <&canvas>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "vdec",
+				      "clk_vdec_mux",
+				      "clk_hevcf_mux";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+			resets = <&reset RESET_DOS>;
+		};
 	};
 };

-- 
2.42.0



