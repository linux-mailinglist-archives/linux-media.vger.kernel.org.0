Return-Path: <linux-media+bounces-53509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEgZLyhQoGmIiAQAu9opvQ
	(envelope-from <linux-media+bounces-53509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:52:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7ED1A7015
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3D131BE498
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDC62DB7AA;
	Thu, 26 Feb 2026 13:41:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB436E461;
	Thu, 26 Feb 2026 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113271; cv=none; b=As1QW9uK2Ju3XAHSlGSDv7Hebf0fYe9Nc/siYzZERcCmccHK0E49yReenbxnGVgeunsd9QdZB998iJw7CbJ++13CpuHDK0mviYffkrnlTj8TFku3Y7YrPOiUVGNBXpALwkVo7XqVMGg8bC5yOiPuqIt1t8cAX58/F+3sZFILLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113271; c=relaxed/simple;
	bh=4tUFBDNFe36c+mcDJ/TUmnKANKlcvCmSziTeWU5kAHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNz53Bn1vnp6sZsN6OS+P51wnqD4RGOWRY+slr/VCj6AgPBOfA2stdcOeAGD/T4KCRLHigto9pARmSWmCjXDe+6ENEl8rJ1w3Jvoaa9gP7pth6Va+Z02PHbddhWTy8jIvmB9+hNiqx+hxWu/eiZ2FOM+KYcXiVH5kJl3UNpN2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DCC8620151F;
	Thu, 26 Feb 2026 14:41:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CD44920153B;
	Thu, 26 Feb 2026 14:41:07 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 22DA22035B;
	Thu, 26 Feb 2026 14:41:06 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:48 +0200
Subject: [PATCH 9/9] arm64: dts: imx95: Add Neutron node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-9-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=1689;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=4tUFBDNFe36c+mcDJ/TUmnKANKlcvCmSziTeWU5kAHY=;
 b=i4gdK2fWXKlkKm+telHbxNq04X/A+NXwzbBH9AwpDRh87tKHmqQ+L+rNqeCY6UkJFgGxmeDUF
 +rSE8KSbNgBBucn0Qom0GzJhb2QD3OLVA/acP8Se/lmSVTQOpR/ywtv
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53509-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4ab00000:email,nxp.com:mid,nxp.com:email,4e090dc0:email]
X-Rspamd-Queue-Id: 1A7ED1A7015
X-Rspamd-Action: no action

Add the node for Neutron NPU. Also add a reserved memory region
for allocating Neutron buffers, which have a 1MB alignment
constraint.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..7a41bb50d650 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -336,6 +336,19 @@ sram1: sram@204c0000 {
 		#size-cells = <1>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		neutron_pool: neutron-pool {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
@@ -2181,5 +2194,20 @@ ddr-pmu@4e090dc0 {
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		neutron: neutron@4ab00000 {
+			compatible = "nxp,imx95-neutron";
+			reg = <0x0 0x4ab00000 0x0 0x00000400>,
+			      <0x0 0x4ab10000 0x0 0x00010000>,
+			      <0x0 0x4ab08000 0x0 0x00008000>;
+			reg-names = "regs", "itcm", "dtcm";
+			memory-region = <&neutron_pool>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_NPU>,
+				 <&scmi_clk IMX95_CLK_NPUAPB>;
+			clock-names = "npu", "npu_apb";
+			power-domains = <&scmi_devpd IMX95_PD_NPU>;
+			iommus = <&smmu 0xd>;
+		};
 	};
 };

-- 
2.34.1


