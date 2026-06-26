Return-Path: <linux-media+bounces-65679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +VEfDDzDPWoe6QgAu9opvQ
	(envelope-from <linux-media+bounces-65679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 02:09:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156F6C93A4
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 02:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icloud.com header.s=1a1hai header.b=L69HB4MC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65679-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65679-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=icloud.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDF333045821
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 00:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476361FF1B5;
	Fri, 26 Jun 2026 00:09:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2003d-snip4-11.eps.apple.com [57.103.91.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3481419A4
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 00:09:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432557; cv=none; b=CnJboeIpCX69mEM/rSkTfAjPNHG7nJmISkhDJ6MdC5r8hf+1pjolH1SIzWBR4FdX/JimPtDpE5QZmN4hy158KF1zqjYGsmkG91k5ixd0Hi82nt5SnqCLvmcjEmLoisSh1Xv+g/AsWylZJCx0aKgfZfalAaKgEkog7ArujGcckLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432557; c=relaxed/simple;
	bh=pGwrsUgMSkXZxQz72F5yUOXaGG2M8gkrFehdMYYfvWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B87CGIBXh8SG5m7e+pnGRmkCo5r/0r6eMviqCs1gO9NHZrYwxMS5UjyGKqijhbU5+9PWRYyZIlRS2c26KO20fDAkiGprQn3DdmN4XsL3lHed/YwL0HdYUyvMp59pToDkXDxUoYN0BimY3qte4UE0BFHMoRQuKX0hJWeRDq+RddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=L69HB4MC; arc=none smtp.client-ip=57.103.91.171
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 3FC281800B08;
	Fri, 26 Jun 2026 00:09:12 +0000 (UTC)
X-ICL-RepId: 019f0142-54d8-7cc3-9bf6-c6bc3c533f8e
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0UZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9FFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432555; x=1785024555; bh=WfQwuydOeK6V1CoXII0HfYiJOqqMtVXHj9rKHdfI+eg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=L69HB4MCg0HDPreoq2LHPf0xAJ+dfR1uzlRAVLK4LD3n8ef6YRgK6apKDl/HPxKNaBZPhUIlO2znat5lGJVqiD9eTqxSTb7joiABBqKvp1aBKoeCgaUVR+CQQibKFbrTanpvEAFpdMTLJ81KTjTLQYVXpFtbvmyp9klnzOnHVrUVBwLVysRN8ksp/J5JiAOfL+aUTIWrGHbkY4u37GmEQnL+rk0jycgZxiDgF+yMDXmFOSWAsSAIfzzzsdMrEtEiZe5J1oS/hXXGnV3yrfvGVoRtgD46H8ZkQdw0ZkbxRoO7DVtTPLMpqLh6Wgtd/sy35YQ/kYIx1NXzZh6CuGBReg==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id C80A01800297;
	Fri, 26 Jun 2026 00:09:10 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev
Subject: [PATCH RFC 4/4] arm64: dts: imx8mq-librem5: Add rear camera
Date: Thu, 25 Jun 2026 20:07:00 -0400
Message-ID: <20260626000715.1111803-5-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2VvdWmrPWZdVNub0KeMOgqvRQKO-UmiH
X-Proofpoint-ORIG-GUID: 2VvdWmrPWZdVNub0KeMOgqvRQKO-UmiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfX30fSeoAsy88h
 z+ommw0lPDcP7hqzDJybEmAMMSjEGEBPrqEdZqjjChFRVijo4CJ+dxakwKlT/Fy9wXUStcHuXRS
 bPqEmHiKavWmrYqIBt5h6ohtJ/ydrjOrp/1aV9nDSXXBEkSvMBnK29zxQ/nivIVPxeYDWCfdit1
 QHiXtCrVlw4n/dGiir537bW2bPpFGcJpY6yhYRYBwo5ADth3jPucnsIndhFiclJ+0olLIh7tvm2
 9GlW2uXCZlsL8iwpAUwZfT9NJo/Rz7coiv99ZXBZMS6tUWYVsQkv3GpqmT8x5iGuG77ewqqHVBn
 DqCNXzqlD5o7h5zC3V/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65679-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[vincent.cloutier@icloud.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,puri.sm,cloutier.co,kernel.org,pengutronix.de,gmail.com,lists.linux.dev];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:kernel@puri.sm,m:vincent@cloutier.co,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincent.cloutier@icloud.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icloud.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloutier.co:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,icloud.com:dkim,icloud.com:mid,icloud.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0156F6C93A4

From: Vincent Cloutier <vincent@cloutier.co>

Add the Librem 5 rear camera sensor node and enable the second CSI-2
capture path that receives data from it.

Describe the Samsung S5K3L6 sensor with the upstream binding property
names, including reset-gpios and the link frequencies used by the initial
two-lane RAW8/RAW10 driver modes.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..12d5fb3440c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -318,6 +318,10 @@ &csi1 {
 	status = "okay";
 };
 
+&csi2 {
+	status = "okay";
+};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 	status = "okay";
@@ -434,6 +438,13 @@ MX8MQ_IOMUXC_ENET_RXC_GPIO1_IO25	0x83
 		>;
 	};
 
+	pinctrl_csi2: csi2grp {
+		fsl,pins = <
+			/* CSI2_NRST */
+			MX8MQ_IOMUXC_ENET_RD0_GPIO1_IO26	0x83
+		>;
+	};
+
 	pinctrl_charger_in: chargeringrp {
 		fsl,pins = <
 			/* CHRG_INT */
@@ -1175,6 +1186,31 @@ vcm@c {
 		vcc-supply = <&reg_csi_1v8>;
 	};
 
+	camera_rear: camera@2d {
+		compatible = "samsung,s5k3l6";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_csi2>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-rates = <25000000>;
+		reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+		vdda-supply = <&reg_vcam_2v8>;
+		vddd-supply = <&reg_vcam_1v2>;
+		vddio-supply = <&reg_csi_1v8>;
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			camera2_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64
+					<537500000 600000000 625000000>;
+				remote-endpoint = <&mipi2_sensor_ep>;
+			};
+		};
+	};
+
 	bat: fuel-gauge@36 {
 		compatible = "maxim,max17055";
 		reg = <0x36>;
@@ -1226,6 +1262,21 @@ mipi1_sensor_ep: endpoint {
 	};
 };
 
+&mipi_csi2 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi2_sensor_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.53.0

