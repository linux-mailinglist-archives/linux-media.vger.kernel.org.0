Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0D6395407
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 04:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhEaCyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 22:54:11 -0400
Received: from mail-vi1eur05on2059.outbound.protection.outlook.com ([40.107.21.59]:54529
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230083AbhEaCyA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 22:54:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV+6r1aNvD5A/3c7Qq+/bSYY53R75YFeXSgjTfX8/Pz7XLox3V/OhDNue57IcLS5PZieSWOKzw4lDg4VJHr/5lFiuGG6ax0hla7W4cg9C8OwNJ8GykEXdmPTPtIoTesm3bb7UZCXWZOFK6j+e9jqYHQd+pZD8ybpZ2ai+OArWpzIlWzgbxWkdANLs1bwlvE/EYhLAZE9ysJmRt6wcfMx+qVgve8znyl7ABQP0diH2ykaMF8zYD4S8R7gfr3c7hmwLbA2fElsvvq5xPF0QkkcSQhqLKrdUYrA8Ek8dXs3Vn4sr3ApefArffA5TT3hFAUKmET/fEf4oZRbjWnqQSrCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6DAY7aLMxuGV9sNtpoFKQOs/Z9bMQ+hE0dCB4uEMuA=;
 b=OaovvhsM6YIfP4Iub1amevkHinYR67Y5t8ZWVFo50BNU2OqKoEz4E4tu5a+3vfO1U/I+hCFF/Y6j/LM/Q29N/tvW/ghoUhcGVOmTT8reLwPCkImGpmP3fhkIoWKxvOT5o+xwmhIASotSNk9dcV/ZNI0oTP+pEbCgDD+dFZ3z5W5B3MfmDPAJjQ0oEyZ3JEiLcovNm9XAiD/eOF4Enl6hmXKktZnRv7rXcYz+iDeRXXksF52a5g9QWBuX5stxj4FTZhvZ3Oi107XW7CKUlgSRyaX0+4OnbC32xhkmQwxdjUJoc8Q3Zae/JE1BtbJEu627M+EgLDN+cnO2T4ZOFZIl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6DAY7aLMxuGV9sNtpoFKQOs/Z9bMQ+hE0dCB4uEMuA=;
 b=OaEM3o7DwvlSrZlJ9k8QDW0dPxHw4JIjRO0xv3rKLY19Mk3wZl6AmBHda3m6LdXj13kbHtmiZsCfyCA1CLEu8dtwrAYr8krzIjO7JC6Rqd33PpdPMgYdUcdX0CDMHXExjVKUfHiaH4bRDtoJMq7acmAHHuk/PIlDzj1HJfVTR50=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2546.eurprd04.prod.outlook.com (2603:10a6:203:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 02:52:18 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 02:52:18 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] ARM64: dts: freescale: imx8q: add imx vpu codec entries
Date:   Mon, 31 May 2021 10:51:12 +0800
Message-Id: <c902977e0f3687ba77bd3290248de5e053c86baf.1622429026.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622429025.git.ming.qian@nxp.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 02:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14620825-b3de-45c0-5ead-08d923df1ad2
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB25460B5990359423C3CE96E4E73F9@AM5PR0401MB2546.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wt4O8faBpOUKTvMNg0PPMxcEM8V7gHIJk37lmXmlmdKFcNSfNeVfqfIACWLzJOKS8naAvZo3g40LmzSPZSzBr7VTr0Wq3CfEXQr/MltCspxH8GkLLPC4J6ajj3syu32ZqMvsdbDMrEqiZQQob5BODWSKIXhYWomdQgYN05GjTDZJxb4sIvdYBn7ds5kzHJ2p480Y5DxeyTIzoPLFPC8ueDmmtqtHy/MmNUDfcdvrwJ02vk/oHTqa7Ct5eOsBV5rXVCAd6b3n9BGSYIm7hFwiCvTZbpdWG6FZzBw2ycgvTj4DUKsC+rZE/nHhZudocjdZEAUw006cjb7Fc1VDN0//QEtYUpdTYqYrx3K1jUYd1sFloaIHY+HvUPEGB1SplHp/HiUFxXcuSVi1VVx/pB1rEnj3VFw3Zd87wPxAmIBERu2u37l3fhzGPmpAfELQqIeNe20BKoul3acQrSzLuXqeMhw8PDhYrFylHbdfdk6fCCGQfClt/XYo7/3dSRBOaYCXAqsVOV5uwHe5pd1KBL0si9paaJm7ynYgb5I1XYICfog4J2Xy/JvpfCSt8pEOlbK1JRyPouKzY9xxkxFzO9MbbHWytn6n+SWHlQ/yNYUHarJc4v4ehnu6j+LGW9FV7UTasVRVyHnHh+/rqVNkAz41XM5GZdq6LQMRcYmkOLvBb0TU31+uDvP9sDSgb4PtyvrDB+6YyTbINNQV5lZsWZx4bHkmsFp1qDKPz6243j6gZkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(5660300002)(4326008)(83380400001)(36756003)(16526019)(66946007)(66476007)(66556008)(38350700002)(86362001)(38100700002)(44832011)(186003)(7696005)(2616005)(478600001)(8676002)(6486002)(316002)(956004)(2906002)(26005)(7416002)(8936002)(52116002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ac5OvsklTmYki63RpMDiaNe/Fgu874wlU0UtcCrBXG57n3gMoszlc4joHMAA?=
 =?us-ascii?Q?A5cE6qvb8D9onP8U2eRE7PJUL+buZxPa6q8tJjkxlV/8BspmzqDq/kMuWr7d?=
 =?us-ascii?Q?tqMcMmpFR1hIqD1syfzSdFo77L9yzEtzxH6GY4euH+TOUslwPhQSchvqtriu?=
 =?us-ascii?Q?DnkYA4CV4bouIkqVPFwyxAouG6ZdHUK6u0PAMl6XZE0HDicR8T7L6mEvJJsE?=
 =?us-ascii?Q?Ae5BaAGXDI9US/a4iaV5Kdh9dReQYS5kjdtFlgm8MiY73wKSF7KKiFW+AWg9?=
 =?us-ascii?Q?vBAJoJZRlxfDubRkYq+2ZGIJ4aUpGJa92TukHXLJuYLlhlGgdYx7h05FyeLs?=
 =?us-ascii?Q?HuvVSZi+svwoAHHrd0MLtxA0BV+/+pK0P6AWKabO1gkhrsBhd5Uic1uTNYlO?=
 =?us-ascii?Q?tJ6MDcmVmVC6IPKwVaPMx1PwKgBdbCbbCIbjhholkKfeo+WNSYG1gQhtHVZq?=
 =?us-ascii?Q?0gJMm+Szl7HaGmv244QgmGKlQf4JwVPKQw5ejkoznxwQJr7PVkP7SD1l5i/R?=
 =?us-ascii?Q?tsv0JhSmdYZetvwQSMg5F7KCaOXQmapnEGWOQDGh2GUorU3ZkL6J4rMG8zCj?=
 =?us-ascii?Q?Kz0PqZ9aHEK0SiGkHXXS78Se2wivKGSL8sE+tF1eWnnwT3Vu30lFNgnQU5ew?=
 =?us-ascii?Q?+Ceah901S24YZB6KRbljeTZ5VgRrKWylDuorijto8Kx7ui7T3JvgSqekTEn7?=
 =?us-ascii?Q?BL9NP5IKf2OLIK9ft+GPc9z7mE6Lb22pk6cr0BhQU0D36a3b69qtmNqWgLui?=
 =?us-ascii?Q?5N4L3QqsIT8bdIpKb6+OjMb4SI018BDs5lPM+5q0cAzVzki2gTqdcXvl4Ps7?=
 =?us-ascii?Q?eVZ3kwuiijqqsHZNMBoBOaNM8pub7OScJdyhcQrfeodUFo59A2+TkSYqDPoa?=
 =?us-ascii?Q?igdb6ftUtymrYdBZ45wtzJpU+V51abvqobK6MKlOC1nY3NTSamF1jHJFRR2t?=
 =?us-ascii?Q?BMsGJd5PhoQin2roeT6P4ipB9z4uHqu1wR3uDby/GLaSQhxsZkLVWsy3bjQF?=
 =?us-ascii?Q?7i6vsB8CJjQu3LA2Zyg/FmuPXyCjJzEiE1p+ko99jtoZvj911yFaMKCpB735?=
 =?us-ascii?Q?0J5J/lkgjvIgUHexFVm3mufd862xr7CuXfetVoBO+Zmb1cQWcLsRImbMf6Nd?=
 =?us-ascii?Q?LLvUyo0N3ufK2KIepstrcjBuuwi8Y9VPDiazTDKoLVcdY17sxE/8CkEgQJha?=
 =?us-ascii?Q?UPKolcYjDtU7Qd6Fo6zhHUXp9tLj24jh7+vWXMdZB1jrpsEbTRc+1/pCgiyl?=
 =?us-ascii?Q?zZcHrBsjVnVlcN6sxslrMHesUzSs4FcJzyfjCo3GBbuYIGFF79hTrCLYuWLk?=
 =?us-ascii?Q?hts4XFrdSmwojT8/0Dqx0iR5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14620825-b3de-45c0-5ead-08d923df1ad2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 02:52:18.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO+n8XCSIrZXtOtAWa+8L8yW09t9VY41F1xHeV8DInBYnrwr1y397Zr/a+Zaqk2pNmXDxtfdvDvikpyw8bXMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the Video Processing Unit node for IMX8Q SoC.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi | 76 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 22 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 27 +++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
new file mode 100644
index 000000000000..6e9437f11817
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+vpu: vpu-bus@2c000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x2c000000 0x0 0x2c000000 0x2000000>;
+	reg = <0 0x2c000000 0 0x1000000>;
+	power-domains = <&pd IMX_SC_R_VPU>;
+	status = "disabled";
+
+	mu_m0: mailbox@2d000000 {
+		compatible = "fsl,imx6sx-mu";
+		reg = <0x2d000000 0x20000>;
+		interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_VPU_MU_0>;
+		status = "okay";
+	};
+
+	mu1_m0: mailbox@2d020000 {
+		compatible = "fsl,imx6sx-mu";
+		reg = <0x2d020000 0x20000>;
+		interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_VPU_MU_1>;
+		status = "okay";
+	};
+
+	mu2_m0: mailbox@2d040000 {
+		compatible = "fsl,imx6sx-mu";
+		reg = <0x2d040000 0x20000>;
+		interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_VPU_MU_2>;
+		status = "disabled";
+	};
+
+	vpu_core0: vpu_decoder@2d080000 {
+		reg = <0x2d080000 0x10000>;
+		compatible = "nxp,imx8q-vpu-decoder";
+		power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu_m0 0 0
+			&mu_m0 0 1
+			&mu_m0 1 0>;
+		id = <0>;
+		status = "disabled";
+	};
+	vpu_core1: vpu_encoder@2d090000 {
+		reg = <0x2d090000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu1_m0 0 0
+			&mu1_m0 0 1
+			&mu1_m0 1 0>;
+		id = <1>;
+		status = "disabled";
+	};
+	vpu_core2: vpu_encoder@2d0a0000 {
+		reg = <0x2d0a0000 0x10000>;
+		compatible = "nxp,imx8q-vpu-encoder";
+		power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
+		mbox-names = "tx0", "tx1", "rx";
+		mboxes = <&mu2_m0 0 0
+			&mu2_m0 0 1
+			&mu2_m0 1 0>;
+		id = <2>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 46437d3c7a04..d79eaa0a28ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -196,6 +196,28 @@ &usdhc2 {
 	status = "okay";
 };
 
+&vpu {
+	compatible = "nxp,imx8qxp-vpu", "simple-bus";
+	memory-region = <&vpu_reserved>;
+	status = "okay";
+};
+
+&vpu_core0 {
+	reg = <0x2d040000 0x10000>;
+	boot-region = <&decoder_boot>;
+	rpc-region = <&decoder_rpc>;
+	print-offset = <0x180000>;
+	status = "okay";
+};
+
+&vpu_core1 {
+	reg = <0x2d050000 0x10000>;
+	boot-region = <&encoder_boot>;
+	rpc-region = <&encoder_rpc>;
+	print-offset = <0x80000>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac1fe71..74900686ec37 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -133,10 +133,34 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		decoder_boot: decoder-boot@84000000 {
+			reg = <0 0x84000000 0 0x2000000>;
+			no-map;
+		};
+
+		encoder_boot: encoder-boot@86000000 {
+			reg = <0 0x86000000 0 0x200000>;
+			no-map;
+		};
+
+		decoder_rpc: decoder-rpc@0x92000000 {
+			reg = <0 0x92000000 0 0x200000>;
+			no-map;
+		};
+
+		encoder_rpc: encoder-rpc@0x92200000 {
+			reg = <0 0x92200000 0 0x100000>;
+			no-map;
+		};
 		dsp_reserved: dsp@92400000 {
 			reg = <0 0x92400000 0 0x2000000>;
 			no-map;
 		};
+		vpu_reserved: vpu_reserved@94400000 {
+			compatible = "shared-dma-pool";
+			no-map;
+			reg = <0 0x94400000 0 0x800000>;
+		};
 	};
 
 	pmu {
@@ -629,4 +653,7 @@ map0 {
 			};
 		};
 	};
+
+	/* sorted in register address */
+	#include "imx8-ss-vpu.dtsi"
 };
-- 
2.31.1

