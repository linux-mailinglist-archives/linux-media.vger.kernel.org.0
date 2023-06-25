Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAEB73CF2E
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbjFYIF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjFYIFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:05:23 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A900E7D;
        Sun, 25 Jun 2023 01:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBJ2YFjou2RxlrbUeRgmREFDs7jsg8rSo+OE3uM8nO6QPDoAIimx7S49WpX4BUSQshpnZzs6dkKKiQzSyjsYGriivtO8xl2aprJ//BuJ/VW/b1KnQQPhSTADbfMmY0m6Icn6MNptTvj3MX0qZowlF1PXj+qn/7c889vvAxCGXlEGy/t3WFt36YzEtGSdc8zAT71ASmJMiJKbp9tXU6EZ0SkPTu1rIx9bA/jQo2HRz9jnzDjto5GiIe7poxLKfQ2o4OO2a8rhqVHTsURGYlrXgNr39JEZZlfuJlWa5c2yiWNQAf7uLDFFeR9BlymXo0rp6HLOl/3+5Sg1fGG+EPcIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxH4e+XyIYF1wjKSnh1vBIRWOvFN2csyO1T/Cy1wg78=;
 b=R0q4WER+kBbR4nZ+HP48Op0A8i+4E8e4430Muhz3LTesT/jcPYgvXVtbOQDZfhorGHQtLoZea0su2T1ukEb6E6f83C7+vITx/dPW5nkNnqumW36frFfINktdD1uHdOm0Ku2DvUd5sHUpSSz7Y3Hb8GABFVR8Q845GJYcYHgevKvSpvOWph1yG0sf6AtDgaBSaLki0/z8dpY6lcAFb6uoDbcd5SCfHEOfEFDVIS53qRamVFBBCO8NAPUpZRv+jY2BB16OFQlzGHQ72Aw3JDxzLxEZ6oEb9bgQzZCYwSeEd2dp3q2fSfKo6iMQ+tkQLkpY+0Ky2Z5PFPlX4qsYxFT46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxH4e+XyIYF1wjKSnh1vBIRWOvFN2csyO1T/Cy1wg78=;
 b=c4fFaGj8QvJsLSXnsNFQAdLnY9uPiXTW/TyiWCrMXVilRsfk9Xm/QY5Qs/EAPP39pmSY/FL/Wg7AsU2JKUgT1iupOCke4am26SpaEc98Yks/pTwYW6/tpnKQS+HFpD2BkrEFvwwAP8D17nxmY3ozzvLxcTbTH9i/bRCISYtbvHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9279.eurprd04.prod.outlook.com (2603:10a6:102:2b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:05:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:05:17 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH 2/4] media: nxp: rename imx8-isi to imx-isi and remove reference to i.MX8
Date:   Sun, 25 Jun 2023 16:09:14 +0800
Message-Id: <20230625080916.3553621-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fef639-c104-412e-3583-08db7552e9ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKCrUKIV5XUUCeeJd+S1qFcEt/wtRba3V2m3M94MMK8ZX3uDUImWGdRmzs0JTAzS+hnnpJTnC2aIIn9lHJoeu+N/smb6iRalKcCvIFx8NbAjvSJYtzWCwS8O8pLdJlq1dDCstgfpbcR2c8HgV+kMqbZv6+9NzwO26TLDZYC9g/y4y7KlF2d12Tn2eP8u+nzXN1HvNBzFe2neBPtPcHHvJL49DBTcnjGsOiC0cfRvEK6GDrESO8MyDzzivG6zFquHfzeAPNM9V5s0AQYU6FMz7Q6i4kd/igVmzXRhd/kl+YVTVPijmvMEKw7HvP0I0aHP9STvIbgKlNI/F93Er+AqsWizCpFP9RGNXUf8vZ9mSj4Vfw6RipxpP+Bz6oENZ1aANWuYFd17Bu3fSSOqO3e3QEMnsWKm1NMM/4HWyrAPRowAqTU8VlGbfLDjh4rSlXKRswB4fAYAPJERc9YWI+X0AFhSbNKNNCjiXbHk3KbTnaQ6MN/1lpih10eU8TMFRddpWCrYbBP0uMmgdCo1N6/Y1mJ5qD5MfbXjjWyriW5q8j1XKi/jG2BF8j71cSuCd9i5pQ+QJ4DExKnto2jWOefXs/ntFyKKOt6jb3GSJ9q5z2QFs1SBR4Xro5zqQEgHKYtc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(8676002)(8936002)(66946007)(66556008)(41300700001)(66476007)(316002)(4326008)(6506007)(1076003)(26005)(6512007)(9686003)(186003)(2616005)(478600001)(6666004)(52116002)(6486002)(2906002)(5660300002)(30864003)(7416002)(38100700002)(38350700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZFesYeYw6EH4yVSig2vd7zsmU+llUSu/DuM4RaQrxJUQOKSW8ZDEkfUfukQV?=
 =?us-ascii?Q?55Su9MvUQNoHLTGOU1CD2cj+48sFsUz1n9/z0kkKnujMb1Z7heCHazFFLPlT?=
 =?us-ascii?Q?fPmUmQSjRrfIPFxWRF1no2BZwVXkmOWbx/NwIHrB9X3AJv5Z7fJO7gtmRDPb?=
 =?us-ascii?Q?qpCiqMykXLNhBzsYrBiS5gorGHhndFTuoxbGqzIGBPJ3XfZlQZxFa0UpyAEU?=
 =?us-ascii?Q?kmRYdqEdMPxypxOYeDOwr9I2gNuI3xm1QJXwqp9+RiMfICxz+3rfGJeQOt8f?=
 =?us-ascii?Q?G3qLEjCq2MlT/WOYFp/LNLCyV00xpNXVNtgmmwodyW9ojiNW4rcgVInxAZvs?=
 =?us-ascii?Q?LHDBEd8dl8G+KtQBjk737PpwPYMO+GV2toSWGx9+bkpm0HbZu8Wc1A7mc25C?=
 =?us-ascii?Q?62d38ub30IuF+fej8FLXOR91rFJU0Q/9fCtiAC/U3WXN0L8+cTBDelHtJFVi?=
 =?us-ascii?Q?EsY8ykg8S5MEcfIp+w+iYGXnY/IzJ7gUZUmqjU1qQxTSvVnV/l6CQFqUwQe1?=
 =?us-ascii?Q?7vzgcEsGW9ZJ/RDrA6+CzF1PtYye2FbveCEXcAvUH5YUa8aHy48F1jkwKD2B?=
 =?us-ascii?Q?J/MOZIBpHq73UItXZlAfyfYZuMyT3me0GXZ16rV40nUqET/vyubUMHlqdjYH?=
 =?us-ascii?Q?V9TQ+rtP7z8OrjDO1qroIL7nPgB7DfElED85zA5zO+QeGz8T3+Kc1aXGwewC?=
 =?us-ascii?Q?qlozGredVOgK5szMN9Yu6ThjKhpVayGFqaTP6XGncvmGj4MamKodpUZqO/Le?=
 =?us-ascii?Q?WM1bFdCf5oKdzHHFKTtocRD1tRPGpyacoocElWSiEtJVd90H5LLmC8My7tEY?=
 =?us-ascii?Q?pz1Vap6jXkcDVZdH1vWK9k4tSuSyy9VtRPiFSi909YMx2Uin4TpIBVP3F2vM?=
 =?us-ascii?Q?XBTSDaiI+7zCfALGDJj2QFLfQc+heO22cJu1A7XVOfBIcIQ4hwDpIeiudvfb?=
 =?us-ascii?Q?XECNItJBf/Hd/VPyvUxx9EbIk0zNfZOrKQgRbAmiTZ9TZYYoVt89YsFDe2YB?=
 =?us-ascii?Q?3x+ZjZ1URwUNEewFGV0sRKi+2ZBGfuRpv7EMh6PcX+vB89v3axWviVXgAsTV?=
 =?us-ascii?Q?zQO3qgKD6QpTJP6WXtI82TYEomb6kpxFyNlvATBbCbb7tEm2AnLbkVie/x2/?=
 =?us-ascii?Q?Wd+XawYdnduiGWj0gpjjhoIdGCtxZ8cWiAg5DdiXccxLC2LNuo9rw8/NfiM8?=
 =?us-ascii?Q?+3ivEs1RDsbXL0dy1pahwfMKKT5EHHnG2gNpGkqYcuZhKc7c6kljPlRIsfGj?=
 =?us-ascii?Q?/vexxV70ZRmI4Wsa+kGqqI24WZMZthahov+djIH1j70Uj5cVpo6kIuKIYpOD?=
 =?us-ascii?Q?dGnnunSE7K7tcdG1M4Qr0b8Ta76vUC+b6R2zHFO38aavGrFhSaPTahFpAPsd?=
 =?us-ascii?Q?pfV1oeuH4wEXCQ/BAAudc469AGdFENr9nWWrhSbj9G8i9EW5GfDgNJ2m7BEB?=
 =?us-ascii?Q?fLWa/RBSIRmykZoWZUe3A5du+y/Sl9UaTBQ4FVIGS9UprQ/2FkQ2O1MbX2DT?=
 =?us-ascii?Q?PJv8Gv/gENSL8QUO3nhmbdj8oZau+4hAG4Vm6ekeOMnaaGzw7PGoe7HAijs0?=
 =?us-ascii?Q?1k0HnCwmsi0gIDS8+Rmh1A+i4QdWQzwmVfT6HU1C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fef639-c104-412e-3583-08db7552e9ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 08:05:17.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbW18tp13Mni3vrX7N4n3p+mIiOEp2p2QhgjsKpM72GsX9tUCGLJ7xxVq5hRJf48pLB5mgfABYh+mqLX1BT7pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9279
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

ISI is used both in i.MX8 and i.MX9 SoC, so do not specify a SoC
version number in the driver name and header file.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 MAINTAINERS                                        |  6 +++---
 drivers/media/platform/nxp/Kconfig                 |  2 +-
 drivers/media/platform/nxp/Makefile                |  2 +-
 .../platform/nxp/{imx8-isi => imx-isi}/Kconfig     | 14 +++++++-------
 drivers/media/platform/nxp/imx-isi/Makefile        |  8 ++++++++
 .../imx8-isi-core.c => imx-isi/imx-isi-core.c}     |  4 ++--
 .../imx8-isi-core.h => imx-isi/imx-isi-core.h}     |  2 +-
 .../imx-isi-crossbar.c}                            |  4 ++--
 .../imx8-isi-debug.c => imx-isi/imx-isi-debug.c}   |  4 ++--
 .../imx8-isi-hw.c => imx-isi/imx-isi-hw.c}         |  4 ++--
 .../imx8-isi-m2m.c => imx-isi/imx-isi-m2m.c}       |  2 +-
 .../imx8-isi-pipe.c => imx-isi/imx-isi-pipe.c}     |  4 ++--
 .../imx8-isi-regs.h => imx-isi/imx-isi-regs.h}     |  6 +++---
 .../imx8-isi-video.c => imx-isi/imx-isi-video.c}   |  8 ++++----
 drivers/media/platform/nxp/imx8-isi/Makefile       |  8 --------
 15 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c83475103a25..2e2fc3c2b338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15081,12 +15081,12 @@ F:	drivers/iio/adc/imx7d_adc.c
 F:	drivers/iio/adc/imx93_adc.c
 F:	drivers/iio/adc/vf610_adc.c
 
-NXP i.MX 8M ISI DRIVER
+NXP i.MX ISI DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
-F:	drivers/media/platform/nxp/imx8-isi/
+F:	Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
+F:	drivers/media/platform/nxp/imx-isi/
 
 NXP i.MX 8MP DW100 V4L2 DRIVER
 M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index a0ca6b297fb8..55ce6a44b3fd 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,7 +28,7 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
-source "drivers/media/platform/nxp/imx8-isi/Kconfig"
+source "drivers/media/platform/nxp/imx-isi/Kconfig"
 
 # mem2mem drivers
 
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index b8e672b75fed..c95d23f1f521 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -2,7 +2,7 @@
 
 obj-y += dw100/
 obj-y += imx-jpeg/
-obj-y += imx8-isi/
+obj-y += imx-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
diff --git a/drivers/media/platform/nxp/imx8-isi/Kconfig b/drivers/media/platform/nxp/imx-isi/Kconfig
similarity index 60%
rename from drivers/media/platform/nxp/imx8-isi/Kconfig
rename to drivers/media/platform/nxp/imx-isi/Kconfig
index fcff33fc2630..ce222fa67a2f 100644
--- a/drivers/media/platform/nxp/imx8-isi/Kconfig
+++ b/drivers/media/platform/nxp/imx-isi/Kconfig
@@ -1,22 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config VIDEO_IMX8_ISI
-	tristate "i.MX8 Image Sensor Interface (ISI) driver"
+config VIDEO_IMX_ISI
+	tristate "i.MX Image Sensor Interface (ISI) driver"
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA && PM
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
-	select V4L2_MEM2MEM_DEV if VIDEO_IMX8_ISI_M2M
+	select V4L2_MEM2MEM_DEV if VIDEO_IMX_ISI_M2M
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  V4L2 driver for the Image Sensor Interface (ISI) found in various
-	  i.MX8 SoCs.
+	  i.MX SoCs.
 
-config VIDEO_IMX8_ISI_M2M
-	bool "i.MX8 Image Sensor Interface (ISI) memory-to-memory support"
-	depends on VIDEO_IMX8_ISI
+config VIDEO_IMX_ISI_M2M
+	bool "i.MX Image Sensor Interface (ISI) memory-to-memory support"
+	depends on VIDEO_IMX_ISI
 	help
 	  Select 'yes' here to enable support for memory-to-memory processing
 	  in the ISI driver.
diff --git a/drivers/media/platform/nxp/imx-isi/Makefile b/drivers/media/platform/nxp/imx-isi/Makefile
new file mode 100644
index 000000000000..f72e0ce8f17d
--- /dev/null
+++ b/drivers/media/platform/nxp/imx-isi/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+imx-isi-y := imx-isi-core.o imx-isi-crossbar.o imx-isi-hw.o \
+	imx-isi-pipe.o imx-isi-video.o
+imx-isi-$(CONFIG_DEBUG_FS) += imx-isi-debug.o
+imx-isi-$(CONFIG_VIDEO_IMX_ISI_M2M) += imx-isi-m2m.o
+
+obj-$(CONFIG_VIDEO_IMX_ISI) += imx-isi.o
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx-isi/imx-isi-core.c
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-core.c
index 253e77189b69..cd5678139ddf 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-core.c
@@ -23,7 +23,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-mc.h>
 
-#include "imx8-isi-core.h"
+#include "imx-isi-core.h"
 
 /* -----------------------------------------------------------------------------
  * V4L2 async subdevs
@@ -535,5 +535,5 @@ module_platform_driver(mxc_isi_driver);
 
 MODULE_ALIAS("ISI");
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
-MODULE_DESCRIPTION("IMX8 Image Sensing Interface driver");
+MODULE_DESCRIPTION("IMX Image Sensing Interface driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx-isi/imx-isi-core.h
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
rename to drivers/media/platform/nxp/imx-isi/imx-isi-core.h
index e469788a9e6c..2cb0caf44c42 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-core.h
@@ -327,7 +327,7 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 				 const struct mxc_isi_format_info *info,
 				 const struct v4l2_pix_format_mplane *pix);
 
-#ifdef CONFIG_VIDEO_IMX8_ISI_M2M
+#ifdef CONFIG_VIDEO_IMX_ISI_M2M
 int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
 int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
 #else
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c
index f7447b2f4d77..f3e3ed080b07 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-crossbar.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * i.MX8 ISI - Input crossbar switch
+ * i.MX ISI - Input crossbar switch
  *
  * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
@@ -18,7 +18,7 @@
 #include <media/mipi-csi2.h>
 #include <media/v4l2-subdev.h>
 
-#include "imx8-isi-core.h"
+#include "imx-isi-core.h"
 
 static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c b/drivers/media/platform/nxp/imx-isi/imx-isi-debug.c
similarity index 98%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-debug.c
index 6709ab7ea1f3..302bfbd527ea 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-debug.c
@@ -11,8 +11,8 @@
 #include <linux/seq_file.h>
 #include <linux/types.h>
 
-#include "imx8-isi-core.h"
-#include "imx8-isi-regs.h"
+#include "imx-isi-core.h"
+#include "imx-isi-regs.h"
 
 static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx-isi/imx-isi-hw.c
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-hw.c
index 19e80b95ffea..3803ea1d4073 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-hw.c
@@ -8,8 +8,8 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
-#include "imx8-isi-core.h"
-#include "imx8-isi-regs.h"
+#include "imx-isi-core.h"
+#include "imx-isi-regs.h"
 
 #define	ISI_DOWNSCALE_THRESHOLD		0x4000
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx-isi/imx-isi-m2m.c
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-m2m.c
index 9745d6219a16..5138524ed1d3 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-m2m.c
@@ -32,7 +32,7 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "imx8-isi-core.h"
+#include "imx-isi-core.h"
 
 struct mxc_isi_m2m_buffer {
 	struct v4l2_m2m_buffer buf;
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx-isi/imx-isi-pipe.c
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-pipe.c
index c4454aa1cb34..7c1ba4e45f5d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-pipe.c
@@ -23,8 +23,8 @@
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "imx8-isi-core.h"
-#include "imx8-isi-regs.h"
+#include "imx-isi-core.h"
+#include "imx-isi-regs.h"
 
 /*
  * While the ISI receives data from the gasket on a 3x12-bit bus, the pipeline
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx-isi/imx-isi-regs.h
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
rename to drivers/media/platform/nxp/imx-isi/imx-isi-regs.h
index 1b65eccdf0da..2b4f8248b761 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-regs.h
@@ -3,8 +3,8 @@
  * Copyright 2019-2020 NXP
  */
 
-#ifndef __IMX8_ISI_REGS_H__
-#define __IMX8_ISI_REGS_H__
+#ifndef __IMX_ISI_REGS_H__
+#define __IMX_ISI_REGS_H__
 
 #include <linux/bits.h>
 
@@ -415,4 +415,4 @@
 /* Channel Input Buffer Extended Address Bits */
 #define CHNL_IN_BUF_XTND_ADDR					0x00b8
 
-#endif /* __IMX8_ISI_REGS_H__ */
+#endif /* __IMX_ISI_REGS_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx-isi/imx-isi-video.c
similarity index 99%
rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
rename to drivers/media/platform/nxp/imx-isi/imx-isi-video.c
index 10840c9a0912..0b5cc7c08332 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx-isi/imx-isi-video.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * V4L2 Capture ISI subdev driver for i.MX8QXP/QM platform
+ * V4L2 Capture ISI subdev driver for i.MX platform
  *
- * ISI is a Image Sensor Interface of i.MX8QXP/QM platform, which
+ * ISI is a Image Sensor Interface of i.MX platform, which
  * used to process image from camera sensor to memory or DC
  *
  * Copyright (c) 2019 NXP Semiconductor
@@ -30,8 +30,8 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "imx8-isi-core.h"
-#include "imx8-isi-regs.h"
+#include "imx-isi-core.h"
+#include "imx-isi-regs.h"
 
 /* Keep the first entry matching MXC_ISI_DEF_PIXEL_FORMAT */
 static const struct mxc_isi_format_info mxc_isi_formats[] = {
diff --git a/drivers/media/platform/nxp/imx8-isi/Makefile b/drivers/media/platform/nxp/imx8-isi/Makefile
deleted file mode 100644
index 9bff9297686d..000000000000
--- a/drivers/media/platform/nxp/imx8-isi/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-hw.o \
-	imx8-isi-pipe.o imx8-isi-video.o
-imx8-isi-$(CONFIG_DEBUG_FS) += imx8-isi-debug.o
-imx8-isi-$(CONFIG_VIDEO_IMX8_ISI_M2M) += imx8-isi-m2m.o
-
-obj-$(CONFIG_VIDEO_IMX8_ISI) += imx8-isi.o
-- 
2.37.1

