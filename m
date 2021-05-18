Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2177B38750E
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 11:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347861AbhERJ2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 05:28:30 -0400
Received: from mail-dm6nam10on2077.outbound.protection.outlook.com ([40.107.93.77]:11361
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240552AbhERJ23 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 05:28:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kyr0raGAtWOH3wQqn+Dv3lmX9RS1r98uUV1kbRoKDEXmWr+UcAdIxlLbPObgBDaDUZPL9BTCVE1+WmqCU2U8nuxCy2wmu1MSdqGWq4l7o5Vhih8c6PiWzTsV2w743ROLn2Pp6ofmyX577j0PrhF/agSxabgqVHxqb0GDiz/YE07S3Vb0RQhy5zd9wK2v+RPpzNTvqz2dFp5Dgg9CMH9RiGOfz7BRsqq2rmTtE6EVolMxCNJ9bTdEp3olU8mQ+KE6+oEtLqcNwWfQLj6SgbjKBsdskB4cvnMOPGSb90R4v3LyrpLSaXy+F0yw1wmqGhGzYQiBoximjt0dcAbn2FNl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi4/G03RHwzNKwEGIyO866pOrucivg5NiY8CYI5Aafg=;
 b=kVA+Ew97n/jXRClObqkxM85a6nk5lkDY0wZf0zm86z4VaAi6cLXBtCtebyV9tuP1v2pFPi3/kTi1n6zdONNhEQs/XpYUgMr3vbsJRDuZ0ffwvNRkjLyN6XUaEPj4nZzdjElVK+AN/UnOpp8REl13y79s4SBNjF+TEbVHTTy4Bg1+VTKnyuamGe2JmuyVCN1lCVSsiFilWog1ZHmMFuQEbAubR6VMUP+bZ3+G3TrTsCujqQf4xGz9y+snJUrttXJiVmo793vfn7LHl32cWPpyQdGZOuNcRV7iyz9EF6vxNx110f5kr/WRu/fM4oqsplXdM0VMi1TS3EiuLLVH1ONcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi4/G03RHwzNKwEGIyO866pOrucivg5NiY8CYI5Aafg=;
 b=FzkoeuTxbbW4KraIf3aed6hphQPcVakXEEwxbyqD+V73AA06eov3UCXJpt+9Cvb/1aG26t40scYmmM/gKXPVyIl9QVQegiOGMsuf2o87MyprII1/O3WC+uEpUYDkWyaVBUnQVBw0hjVYCP5xKinsCy158p2ANQTmFTJc2CM14v4=
Received: from DM6PR02MB5802.namprd02.prod.outlook.com (2603:10b6:5:151::14)
 by DM6PR02MB6713.namprd02.prod.outlook.com (2603:10b6:5:21b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Tue, 18 May
 2021 09:27:08 +0000
Received: from DM6PR02MB5802.namprd02.prod.outlook.com
 ([fe80::90c9:4c6f:b1e8:cb39]) by DM6PR02MB5802.namprd02.prod.outlook.com
 ([fe80::90c9:4c6f:b1e8:cb39%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 09:27:08 +0000
From:   Anil Kumar Mamidala <amamidal@xilinx.com>
To:     Anil Kumar Mamidala <amamidal@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>
Subject: RE: [PATCH 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Thread-Topic: [PATCH 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Thread-Index: AQHXHz32AI+dRdJPZU+vWZwLpp5XH6rpT+og
Date:   Tue, 18 May 2021 09:27:08 +0000
Message-ID: <DM6PR02MB58023154E0A05DFF912B1146B72C9@DM6PR02MB5802.namprd02.prod.outlook.com>
References: <1616432793-1994-1-git-send-email-anil.mamidala@xilinx.com>
In-Reply-To: <1616432793-1994-1-git-send-email-anil.mamidala@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d72d870c-dcb2-49af-80f5-08d919df1c0f
x-ms-traffictypediagnostic: DM6PR02MB6713:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB6713BAF907121A2B2BAD3ECDB72C9@DM6PR02MB6713.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:110;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VI2Frisl5e9XDU7lpBAFj8B/V6ekN1Dlq4ccvEl2NWKaT2LatNmfaHgYlmy0B6Ly3sGYugK0AeO+BX9SXMMFeMCQQ/0Vbqja3sr2XJfeRq/VgTIS1l8dxs4zk9mXE8mFe1DJ7Ylpt3SMpgWYkkaPA6urrUt+xF4Ny6YXnlfpeDxWujS9qB/75UFlKvqNs8BHOFrfJxdcT0XH3DcZ/hQyULR9hOKqXYbpBow9F823x/mRmhUJtX7IRCPe7vqMpdPy4JfyKAisE6EX+Fkq3WZTp7Casw+W3Wl8Pjtfjsg9ngXGSP1mjGAXnTEbxSKQAMIfxcHp3q5KnQ/wGv74OPZU1t5c2lBaKHwPS5vf+Dq5sshdf2bUq+ghyFXCbgZGrDuLhloEpVqJhOkSCmjC4Coxl2UgjRLLnLtbWnoGuN3Y5BOadoQkQRgOEvrnDGj/CLwh8EEbItH6MLRWaOcDwz9Nv/jkxOGpw2mqh0wrz7lrCVj5+Qw7LVbi2709sXWuazNOw6BiwJ51C39/rGQ/p8PytPlvTyYUJOYYMMk6IfAvUlU6OwBOEclpdYBtk8J93lAxNDtKNJWZt/V2hZ1OlTBOtAiuv60t/GiXGYzfwCpEyYw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5802.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(71200400001)(53546011)(316002)(2906002)(26005)(38100700002)(54906003)(478600001)(8676002)(8936002)(110136005)(122000001)(33656002)(4326008)(30864003)(83380400001)(5660300002)(9686003)(86362001)(66946007)(66476007)(66446008)(66556008)(64756008)(76116006)(55016002)(52536014)(7696005)(6506007)(186003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1T/6GEIVmNAyzEc8UuKGMVDGGAyeuHgA/XvymjQHjfGNC6mV0T/5YVNCWy7q?=
 =?us-ascii?Q?V+gxSOv5r09Oy1CWbuF3jMvF0OYd67AjQnXjDSQq7iizVnH9ao+HWBm0UXgk?=
 =?us-ascii?Q?sZUVvfcwZBGa45c3t93qv0VcbTuoQcGc1SY6h2+hlQX/qrZiGDR3RvKiHjfG?=
 =?us-ascii?Q?87MoMEDA8oJIIBOSD1BSqkeBNL0KiLc/arDC+w5uUGhF5F5drgY5zTwmPsYM?=
 =?us-ascii?Q?/dihERdMicr2X3BaPCn0jcA857wB8ozo39uMuCWoLzXmc/NzftIgE0g3REzp?=
 =?us-ascii?Q?kM9uCJV8LnnKuGozsG1z8HSz5EVIJ+aJS0aes9KuJRSXwDMJ8z7+rj0XHyHt?=
 =?us-ascii?Q?C9+6hExlYlOynmBGkBrdafqD9KJrqFnvNOiyi4npQCCkUQ68obZHkTzP+24D?=
 =?us-ascii?Q?kjl23oSGxlhMVcnvVxavLamppXARIiwbgnACT9sabShlK+ymPrwdRA5CJeNa?=
 =?us-ascii?Q?mnAdYvq4+v7nMOvQC0lWDkF0GV3f7N2+RwCiHPj6ju7bU/yjugSGIupS5Zui?=
 =?us-ascii?Q?d0cnlY2nz7+F6bf31quezpCWce14nnpofV376Ixpq3ByrHOidWVprLSRUBVo?=
 =?us-ascii?Q?6elMA0ncBdxXZiLRNLCqRAX+bMcLgV/DkgGiNUbYxfc/bhrx2CdQKR72+LoJ?=
 =?us-ascii?Q?9HljbWwDnrAmTYobYJeOCkFcQUHmDN7Wee6b2dJ5L2xZdtEGVcjmlBkCeFYe?=
 =?us-ascii?Q?judo7vPOfrLbbF7c8R1P74r0XVhjRTP0EI7n+TqEpV/GtjVZPSTxdqF8qBxV?=
 =?us-ascii?Q?sROlZElHmMeJ76thCQkTxoW6k86/LV7hlt9bbipkzaRG70P0Dj1lttOypvTe?=
 =?us-ascii?Q?rNb/d6adf4TVd2aQfadfbt0B2NG8il1qLZBpW6ck2chD/1y/qsMdoZ0SoB1m?=
 =?us-ascii?Q?tRbJVoKJ0KNE3zUz1+QIfXXqfDRklwXexLoUp+vSEbmU5x7g09gdklE5eX2L?=
 =?us-ascii?Q?WKUM0d7LC3hY0tGqvZkhI8v0Sr16hqvh3X6eQubfc7XyDfdn4jztQq2rolyw?=
 =?us-ascii?Q?6YLiWggEYb4Cxoa7ZxvvPqz9lZFn0gVBrhOiIjfALfuuPIA/banzmtJ4vs7D?=
 =?us-ascii?Q?koKGfjwy+D6QTBzYi7He2ti/nklYn+cQLPmQbQ0+mad694eyy8tt29RHJmtW?=
 =?us-ascii?Q?Ir9A7Clh+SLoJRdMSxj6UkrJIBLFxMz8i1T3CsGL+/4B3uIEn/H9voQzlOQV?=
 =?us-ascii?Q?vE1+0yKnmEHjqynKhG9J9caxxbKiqG8wPVZRa1e38jvxsNAh89tOhDsGD/Vn?=
 =?us-ascii?Q?606s4JKDPwb3oq5GPYAsoStWAgG4sO32oXPzYuNdc5rn1cXfcUKRZIm4gris?=
 =?us-ascii?Q?dAV5bzej6JPLBjJCfR+5ejaW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72d870c-dcb2-49af-80f5-08d919df1c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 09:27:08.7336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32lfgOC0SCpxdEzmQg4UBUGVLyt4fRSInMEW5HX0hdRaRL6uBOwN3eW1A10ELYrYbgi3lhmTazLzTECAtRWR5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6713
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari/Hans,

Can you please review the patches which I have submitted some time back to =
linux media community for adding AP1302 ISP driver.=20

Please provide your valuable feedback to get them merged into open source m=
edia community.

Thanks and regards,
Anil.

-----Original Message-----
From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>=20
Sent: Monday, March 22, 2021 10:37 PM
To: linux-media@vger.kernel.org
Cc: Naveen Kumar Gaddipati <naveenku@xilinx.com>; Anil Kumar Mamidala <amam=
idal@xilinx.com>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Ste=
fan Hladnik <stefan.hladnik@gmail.com>; Florian Rebaudo <frebaudo@witekio.c=
om>
Subject: [PATCH 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver

The AP1302 is a standalone ISP for ON Semiconductor sensors.
AP1302 ISP supports single and dual sensor inputs. The driver
code supports AR1335, AR0144 and AR0330 sensors with single and
dual mode by loading the corresponding firmware.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
---
 MAINTAINERS                |    9 +
 drivers/media/i2c/Kconfig  |   12 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ap1302.c | 2632 ++++++++++++++++++++++++++++++++++++++++=
++++
 4 files changed, 2654 insertions(+)
 create mode 100644 drivers/media/i2c/ap1302.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 16ada1a..2017614 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1206,6 +1206,15 @@ L:	alsa-devel@alsa-project.org (moderated for non-su=
bscribers)
 S:	Maintained
 F:	sound/aoa/
=20
+AP1302 ON SEMICONDUCTOR CAMERA ISP
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Anil Kumar Mamidala <anil.mamidala@xilinx.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
+F:	drivers/media/i2c/ap1302.c
+
 APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
 M:	William Breathitt Gray <vilhelm.gray@gmail.com>
 L:	linux-iio@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 462c0e0..b8f671f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -627,6 +627,18 @@ config VIDEO_UPD64083
=20
 	  To compile this driver as a module, choose M here: the
 	  module will be called upd64083.
+
+config VIDEO_AP1302
+	tristate "ON Semiconductor AP1302 support"
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor-level driver for the ON Semiconductor
+	  AP1302 ISP.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ap1302.
+
 endmenu
=20
 menu "Audio/Video compression chips"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 0c067be..8c74024 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) +=3D vp27smpx.o
 obj-$(CONFIG_VIDEO_SONY_BTF_MPX) +=3D sony-btf-mpx.o
 obj-$(CONFIG_VIDEO_UPD64031A) +=3D upd64031a.o
 obj-$(CONFIG_VIDEO_UPD64083) +=3D upd64083.o
+obj-$(CONFIG_VIDEO_AP1302) +=3D ap1302.o
 obj-$(CONFIG_VIDEO_OV02A10) +=3D ov02a10.o
 obj-$(CONFIG_VIDEO_OV2640) +=3D ov2640.o
 obj-$(CONFIG_VIDEO_OV2680) +=3D ov2680.o
diff --git a/drivers/media/i2c/ap1302.c b/drivers/media/i2c/ap1302.c
new file mode 100644
index 0000000..271ec8f
--- /dev/null
+++ b/drivers/media/i2c/ap1302.c
@@ -0,0 +1,2632 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for the AP1302 external camera ISP from ON Semiconductor
+ *
+ * Copyright (C) 2021, Witekio, Inc.
+ * Copyright (C) 2021, Xilinx, Inc.
+ * Copyright (C) 2021, Laurent Pinchart <laurent.pinchart@ideasonboard.com=
>
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/media.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define DRIVER_NAME "ap1302"
+
+#define AP1302_FW_WINDOW_SIZE			0x2000
+#define AP1302_FW_WINDOW_OFFSET			0x8000
+
+#define AP1302_MIN_WIDTH			24U
+#define AP1302_MIN_HEIGHT			16U
+#define AP1302_MAX_WIDTH			4224U
+#define AP1302_MAX_HEIGHT			4092U
+
+#define AP1302_REG_16BIT(n)			((2 << 24) | (n))
+#define AP1302_REG_32BIT(n)			((4 << 24) | (n))
+#define AP1302_REG_SIZE(n)			((n) >> 24)
+#define AP1302_REG_ADDR(n)			((n) & 0x0000ffff)
+#define AP1302_REG_PAGE(n)			((n) & 0x00ff0000)
+#define AP1302_REG_PAGE_MASK			0x00ff0000
+
+/* Info Registers */
+#define AP1302_CHIP_VERSION			AP1302_REG_16BIT(0x0000)
+#define AP1302_CHIP_ID				0x0265
+#define AP1302_FRAME_CNT			AP1302_REG_16BIT(0x0002)
+#define AP1302_ERROR				AP1302_REG_16BIT(0x0006)
+#define AP1302_ERR_FILE				AP1302_REG_32BIT(0x0008)
+#define AP1302_ERR_LINE				AP1302_REG_16BIT(0x000c)
+#define AP1302_SIPM_ERR_0			AP1302_REG_16BIT(0x0014)
+#define AP1302_SIPM_ERR_1			AP1302_REG_16BIT(0x0016)
+#define AP1302_CHIP_REV				AP1302_REG_16BIT(0x0050)
+#define AP1302_CON_BUF(n)			AP1302_REG_16BIT(0x0a2c + (n))
+#define AP1302_CON_BUF_SIZE			512
+
+/* Control Registers */
+#define AP1302_DZ_TGT_FCT			AP1302_REG_16BIT(0x1010)
+#define AP1302_SFX_MODE				AP1302_REG_16BIT(0x1016)
+#define AP1302_SFX_MODE_SFX_NORMAL		(0U << 0)
+#define AP1302_SFX_MODE_SFX_ALIEN		(1U << 0)
+#define AP1302_SFX_MODE_SFX_ANTIQUE		(2U << 0)
+#define AP1302_SFX_MODE_SFX_BW			(3U << 0)
+#define AP1302_SFX_MODE_SFX_EMBOSS		(4U << 0)
+#define AP1302_SFX_MODE_SFX_EMBOSS_COLORED	(5U << 0)
+#define AP1302_SFX_MODE_SFX_GRAYSCALE		(6U << 0)
+#define AP1302_SFX_MODE_SFX_NEGATIVE		(7U << 0)
+#define AP1302_SFX_MODE_SFX_BLUISH		(8U << 0)
+#define AP1302_SFX_MODE_SFX_GREENISH		(9U << 0)
+#define AP1302_SFX_MODE_SFX_REDISH		(10U << 0)
+#define AP1302_SFX_MODE_SFX_POSTERIZE1		(11U << 0)
+#define AP1302_SFX_MODE_SFX_POSTERIZE2		(12U << 0)
+#define AP1302_SFX_MODE_SFX_SEPIA1		(13U << 0)
+#define AP1302_SFX_MODE_SFX_SEPIA2		(14U << 0)
+#define AP1302_SFX_MODE_SFX_SKETCH		(15U << 0)
+#define AP1302_SFX_MODE_SFX_SOLARIZE		(16U << 0)
+#define AP1302_SFX_MODE_SFX_FOGGY		(17U << 0)
+#define AP1302_BUBBLE_OUT_FMT			AP1302_REG_16BIT(0x1164)
+#define AP1302_BUBBLE_OUT_FMT_FT_YUV		(3U << 4)
+#define AP1302_BUBBLE_OUT_FMT_FT_RGB		(4U << 4)
+#define AP1302_BUBBLE_OUT_FMT_FT_YUV_JFIF	(5U << 4)
+#define AP1302_BUBBLE_OUT_FMT_FST_RGB_888	(0U << 0)
+#define AP1302_BUBBLE_OUT_FMT_FST_RGB_565	(1U << 0)
+#define AP1302_BUBBLE_OUT_FMT_FST_RGB_555M	(2U << 0)
+#define AP1302_BUBBLE_OUT_FMT_FST_RGB_555L	(3U << 0)
+#define AP1302_BUBBLE_OUT_FMT_FST_YUV_422	(0U << 0)
+#define AP1302_BUBBLE_OUT_FMT_FST_YUV_420	(1U << 0)
+#define AP1302_BUBBLE_OUT_FMT_FST_YUV_400	(2U << 0)
+#define AP1302_ATOMIC				AP1302_REG_16BIT(0x1184)
+#define AP1302_ATOMIC_MODE			BIT(2)
+#define AP1302_ATOMIC_FINISH			BIT(1)
+#define AP1302_ATOMIC_RECORD			BIT(0)
+
+/*
+ * Preview Context Registers (preview_*). AP1302 supports 3 "contexts"
+ * (Preview, Snapshot, Video). These can be programmed for different size,
+ * format, FPS, etc. There is no functional difference between the context=
s,
+ * so the only potential benefit of using them is reduced number of regist=
er
+ * writes when switching output modes (if your concern is atomicity, see
+ * "atomic" register).
+ * So there's virtually no benefit in using contexts for this driver and i=
t
+ * would significantly increase complexity. Let's use preview context only=
.
+ */
+#define AP1302_PREVIEW_WIDTH			AP1302_REG_16BIT(0x2000)
+#define AP1302_PREVIEW_HEIGHT			AP1302_REG_16BIT(0x2002)
+#define AP1302_PREVIEW_ROI_X0			AP1302_REG_16BIT(0x2004)
+#define AP1302_PREVIEW_ROI_Y0			AP1302_REG_16BIT(0x2006)
+#define AP1302_PREVIEW_ROI_X1			AP1302_REG_16BIT(0x2008)
+#define AP1302_PREVIEW_ROI_Y1			AP1302_REG_16BIT(0x200a)
+#define AP1302_PREVIEW_OUT_FMT			AP1302_REG_16BIT(0x2012)
+#define AP1302_PREVIEW_OUT_FMT_IPIPE_BYPASS	BIT(13)
+#define AP1302_PREVIEW_OUT_FMT_SS		BIT(12)
+#define AP1302_PREVIEW_OUT_FMT_FAKE_EN		BIT(11)
+#define AP1302_PREVIEW_OUT_FMT_ST_EN		BIT(10)
+#define AP1302_PREVIEW_OUT_FMT_IIS_NONE		(0U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_POST_VIEW	(1U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_VIDEO	(2U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_BUBBLE	(3U << 8)
+#define AP1302_PREVIEW_OUT_FMT_FT_JPEG_422	(0U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_JPEG_420	(1U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_YUV		(3U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RGB		(4U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF	(5U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW8		(8U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW10		(9U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW12		(10U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW16		(11U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG8		(12U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG10		(13U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG12		(14U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG16		(15U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_ROTATE	BIT(2)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_SCAN	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_JFIF	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_EXIF	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_888	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_565	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_555M	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_555L	(3U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_422	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_420	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_400	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_SENSOR	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CAPTURE	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CP	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_BPC	(3U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_IHDR	(4U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_PP	(5U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_DENSH	(6U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_PM	(7U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_GC	(8U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CURVE	(9U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CCONV	(10U << 0)
+#define AP1302_PREVIEW_S1_SENSOR_MODE		AP1302_REG_16BIT(0x202e)
+#define AP1302_PREVIEW_HINF_CTRL		AP1302_REG_16BIT(0x2030)
+#define AP1302_PREVIEW_HINF_CTRL_BT656_LE	BIT(15)
+#define AP1302_PREVIEW_HINF_CTRL_BT656_16BIT	BIT(14)
+#define AP1302_PREVIEW_HINF_CTRL_MUX_DELAY(n)	((n) << 8)
+#define AP1302_PREVIEW_HINF_CTRL_LV_POL		BIT(7)
+#define AP1302_PREVIEW_HINF_CTRL_FV_POL		BIT(6)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_CONT_CLK	BIT(5)
+#define AP1302_PREVIEW_HINF_CTRL_SPOOF		BIT(4)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_MODE	BIT(3)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_LANES(n)	((n) << 0)
+
+/* IQ Registers */
+#define AP1302_AE_BV_OFF			AP1302_REG_16BIT(0x5014)
+#define AP1302_AWB_CTRL				AP1302_REG_16BIT(0x5100)
+#define AP1302_AWB_CTRL_RECALC			BIT(13)
+#define AP1302_AWB_CTRL_POSTGAIN		BIT(12)
+#define AP1302_AWB_CTRL_UNGAIN			BIT(11)
+#define AP1302_AWB_CTRL_CLIP			BIT(10)
+#define AP1302_AWB_CTRL_SKY			BIT(9)
+#define AP1302_AWB_CTRL_FLASH			BIT(8)
+#define AP1302_AWB_CTRL_FACE_OFF		(0U << 6)
+#define AP1302_AWB_CTRL_FACE_IGNORE		(1U << 6)
+#define AP1302_AWB_CTRL_FACE_CONSTRAINED	(2U << 6)
+#define AP1302_AWB_CTRL_FACE_ONLY		(3U << 6)
+#define AP1302_AWB_CTRL_IMM			BIT(5)
+#define AP1302_AWB_CTRL_IMM1			BIT(4)
+#define AP1302_AWB_CTRL_MODE_OFF		(0U << 0)
+#define AP1302_AWB_CTRL_MODE_HORIZON		(1U << 0)
+#define AP1302_AWB_CTRL_MODE_A			(2U << 0)
+#define AP1302_AWB_CTRL_MODE_CWF		(3U << 0)
+#define AP1302_AWB_CTRL_MODE_D50		(4U << 0)
+#define AP1302_AWB_CTRL_MODE_D65		(5U << 0)
+#define AP1302_AWB_CTRL_MODE_D75		(6U << 0)
+#define AP1302_AWB_CTRL_MODE_MANUAL		(7U << 0)
+#define AP1302_AWB_CTRL_MODE_MEASURE		(8U << 0)
+#define AP1302_AWB_CTRL_MODE_AUTO		(15U << 0)
+#define AP1302_AWB_CTRL_MODE_MASK		0x000f
+#define AP1302_FLICK_CTRL			AP1302_REG_16BIT(0x5440)
+#define AP1302_FLICK_CTRL_FREQ(n)		((n) << 8)
+#define AP1302_FLICK_CTRL_ETC_IHDR_UP		BIT(6)
+#define AP1302_FLICK_CTRL_ETC_DIS		BIT(5)
+#define AP1302_FLICK_CTRL_FRC_OVERRIDE_MAX_ET	BIT(4)
+#define AP1302_FLICK_CTRL_FRC_OVERRIDE_UPPER_ET	BIT(3)
+#define AP1302_FLICK_CTRL_FRC_EN		BIT(2)
+#define AP1302_FLICK_CTRL_MODE_DISABLED		(0U << 0)
+#define AP1302_FLICK_CTRL_MODE_MANUAL		(1U << 0)
+#define AP1302_FLICK_CTRL_MODE_AUTO		(2U << 0)
+#define AP1302_SCENE_CTRL			AP1302_REG_16BIT(0x5454)
+#define AP1302_SCENE_CTRL_MODE_NORMAL		(0U << 0)
+#define AP1302_SCENE_CTRL_MODE_PORTRAIT		(1U << 0)
+#define AP1302_SCENE_CTRL_MODE_LANDSCAPE	(2U << 0)
+#define AP1302_SCENE_CTRL_MODE_SPORT		(3U << 0)
+#define AP1302_SCENE_CTRL_MODE_CLOSE_UP		(4U << 0)
+#define AP1302_SCENE_CTRL_MODE_NIGHT		(5U << 0)
+#define AP1302_SCENE_CTRL_MODE_TWILIGHT		(6U << 0)
+#define AP1302_SCENE_CTRL_MODE_BACKLIGHT	(7U << 0)
+#define AP1302_SCENE_CTRL_MODE_HIGH_SENSITIVE	(8U << 0)
+#define AP1302_SCENE_CTRL_MODE_NIGHT_PORTRAIT	(9U << 0)
+#define AP1302_SCENE_CTRL_MODE_BEACH		(10U << 0)
+#define AP1302_SCENE_CTRL_MODE_DOCUMENT		(11U << 0)
+#define AP1302_SCENE_CTRL_MODE_PARTY		(12U << 0)
+#define AP1302_SCENE_CTRL_MODE_FIREWORKS	(13U << 0)
+#define AP1302_SCENE_CTRL_MODE_SUNSET		(14U << 0)
+#define AP1302_SCENE_CTRL_MODE_AUTO		(0xffU << 0)
+
+/* System Registers */
+#define AP1302_BOOTDATA_STAGE			AP1302_REG_16BIT(0x6002)
+#define AP1302_WARNING(n)			AP1302_REG_16BIT(0x6004 + (n) * 2)
+#define AP1302_SENSOR_SELECT			AP1302_REG_16BIT(0x600c)
+#define AP1302_SENSOR_SELECT_TP_MODE(n)		((n) << 8)
+#define AP1302_SENSOR_SELECT_PATTERN_ON		BIT(7)
+#define AP1302_SENSOR_SELECT_MODE_3D_ON		BIT(6)
+#define AP1302_SENSOR_SELECT_CLOCK		BIT(5)
+#define AP1302_SENSOR_SELECT_SINF_MIPI		BIT(4)
+#define AP1302_SENSOR_SELECT_YUV		BIT(2)
+#define AP1302_SENSOR_SELECT_SENSOR_TP		(0U << 0)
+#define AP1302_SENSOR_SELECT_SENSOR(n)		(((n) + 1) << 0)
+#define AP1302_SYS_START			AP1302_REG_16BIT(0x601a)
+#define AP1302_SYS_START_PLL_LOCK		BIT(15)
+#define AP1302_SYS_START_LOAD_OTP		BIT(12)
+#define AP1302_SYS_START_RESTART_ERROR		BIT(11)
+#define AP1302_SYS_START_STALL_STATUS		BIT(9)
+#define AP1302_SYS_START_STALL_EN		BIT(8)
+#define AP1302_SYS_START_STALL_MODE_FRAME	(0U << 6)
+#define AP1302_SYS_START_STALL_MODE_DISABLED	(1U << 6)
+#define AP1302_SYS_START_STALL_MODE_POWER_DOWN	(2U << 6)
+#define AP1302_SYS_START_GO			BIT(4)
+#define AP1302_SYS_START_PATCH_FUN		BIT(1)
+#define AP1302_SYS_START_PLL_INIT		BIT(0)
+#define AP1302_DMA_SRC				AP1302_REG_32BIT(0x60a0)
+#define AP1302_DMA_DST				AP1302_REG_32BIT(0x60a4)
+#define AP1302_DMA_SIP_SIPM(n)			((n) << 26)
+#define AP1302_DMA_SIP_DATA_16_BIT		BIT(25)
+#define AP1302_DMA_SIP_ADDR_16_BIT		BIT(24)
+#define AP1302_DMA_SIP_ID(n)			((n) << 17)
+#define AP1302_DMA_SIP_REG(n)			((n) << 0)
+#define AP1302_DMA_SIZE				AP1302_REG_32BIT(0x60a8)
+#define AP1302_DMA_CTRL				AP1302_REG_16BIT(0x60ac)
+#define AP1302_DMA_CTRL_SCH_NORMAL		(0 << 12)
+#define AP1302_DMA_CTRL_SCH_NEXT		(1 << 12)
+#define AP1302_DMA_CTRL_SCH_NOW			(2 << 12)
+#define AP1302_DMA_CTRL_DST_REG			(0 << 8)
+#define AP1302_DMA_CTRL_DST_SRAM		(1 << 8)
+#define AP1302_DMA_CTRL_DST_SPI			(2 << 8)
+#define AP1302_DMA_CTRL_DST_SIP			(3 << 8)
+#define AP1302_DMA_CTRL_SRC_REG			(0 << 4)
+#define AP1302_DMA_CTRL_SRC_SRAM		(1 << 4)
+#define AP1302_DMA_CTRL_SRC_SPI			(2 << 4)
+#define AP1302_DMA_CTRL_SRC_SIP			(3 << 4)
+#define AP1302_DMA_CTRL_MODE_32_BIT		BIT(3)
+#define AP1302_DMA_CTRL_MODE_MASK		(7 << 0)
+#define AP1302_DMA_CTRL_MODE_IDLE		(0 << 0)
+#define AP1302_DMA_CTRL_MODE_SET		(1 << 0)
+#define AP1302_DMA_CTRL_MODE_COPY		(2 << 0)
+#define AP1302_DMA_CTRL_MODE_MAP		(3 << 0)
+#define AP1302_DMA_CTRL_MODE_UNPACK		(4 << 0)
+#define AP1302_DMA_CTRL_MODE_OTP_READ		(5 << 0)
+#define AP1302_DMA_CTRL_MODE_SIP_PROBE		(6 << 0)
+
+/* Misc Registers */
+#define AP1302_REG_ADV_START			0xe000
+#define AP1302_ADVANCED_BASE			AP1302_REG_32BIT(0xf038)
+#define AP1302_SIP_CRC				AP1302_REG_16BIT(0xf052)
+
+/* Advanced System Registers */
+#define AP1302_ADV_IRQ_SYS_INTE			AP1302_REG_32BIT(0x00230000)
+#define AP1302_ADV_IRQ_SYS_INTE_TEST_COUNT	BIT(25)
+#define AP1302_ADV_IRQ_SYS_INTE_HINF_1		BIT(24)
+#define AP1302_ADV_IRQ_SYS_INTE_HINF_0		BIT(23)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_B_MIPI_L	(7U << 20)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_B_MIPI	BIT(19)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_A_MIPI_L	(15U << 14)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_A_MIPI	BIT(13)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF		BIT(12)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_S		BIT(11)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_B		BIT(10)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_A		BIT(9)
+#define AP1302_ADV_IRQ_SYS_INTE_IP		BIT(8)
+#define AP1302_ADV_IRQ_SYS_INTE_TIMER		BIT(7)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPM		(3U << 6)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_ADR_RANGE	BIT(5)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_DIRECT_WRITE	BIT(4)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_FIFO_WRITE	BIT(3)
+#define AP1302_ADV_IRQ_SYS_INTE_SPI		BIT(2)
+#define AP1302_ADV_IRQ_SYS_INTE_GPIO_CNT	BIT(1)
+#define AP1302_ADV_IRQ_SYS_INTE_GPIO_PIN	BIT(0)
+
+/* Advanced Slave MIPI Registers */
+#define AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(p, n) \
+	AP1302_REG_32BIT(0x00420008 + (p) * 0x50000 + (n) * 0x20)
+#define AP1302_LANE_ERR_LP_VAL(n)		(((n) >> 30) & 3)
+#define AP1302_LANE_ERR_STATE(n)		(((n) >> 24) & 0xf)
+#define AP1302_LANE_ERR				BIT(18)
+#define AP1302_LANE_ABORT			BIT(17)
+#define AP1302_LANE_LP_VAL(n)			(((n) >> 6) & 3)
+#define AP1302_LANE_STATE(n)			((n) & 0xf)
+#define AP1302_LANE_STATE_STOP_S		0x0
+#define AP1302_LANE_STATE_HS_REQ_S		0x1
+#define AP1302_LANE_STATE_LP_REQ_S		0x2
+#define AP1302_LANE_STATE_HS_S			0x3
+#define AP1302_LANE_STATE_LP_S			0x4
+#define AP1302_LANE_STATE_ESC_REQ_S		0x5
+#define AP1302_LANE_STATE_TURN_REQ_S		0x6
+#define AP1302_LANE_STATE_ESC_S			0x7
+#define AP1302_LANE_STATE_ESC_0			0x8
+#define AP1302_LANE_STATE_ESC_1			0x9
+#define AP1302_LANE_STATE_TURN_S		0xa
+#define AP1302_LANE_STATE_TURN_MARK		0xb
+#define AP1302_LANE_STATE_ERROR_S		0xc
+
+#define AP1302_ADV_CAPTURE_A_FV_CNT		AP1302_REG_32BIT(0x00490040)
+
+struct ap1302_device;
+
+enum {
+	AP1302_PAD_SINK_0,
+	AP1302_PAD_SINK_1,
+	AP1302_PAD_SOURCE,
+	AP1302_PAD_MAX,
+};
+
+struct ap1302_format_info {
+	unsigned int code;
+	u16 out_fmt;
+};
+
+struct ap1302_format {
+	struct v4l2_mbus_framefmt format;
+	const struct ap1302_format_info *info;
+};
+
+struct ap1302_size {
+	unsigned int width;
+	unsigned int height;
+};
+
+struct ap1302_sensor_supply {
+	const char *name;
+	unsigned int post_delay_us;
+};
+
+struct ap1302_sensor_info {
+	const char *model;
+	const char *name;
+	unsigned int i2c_addr;
+	struct ap1302_size resolution;
+	u32 format;
+	const struct ap1302_sensor_supply *supplies;
+};
+
+struct ap1302_sensor {
+	struct ap1302_device *ap1302;
+	unsigned int index;
+
+	struct device_node *of_node;
+	struct device *dev;
+	unsigned int num_supplies;
+	struct regulator_bulk_data *supplies;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+};
+
+static inline struct ap1302_sensor *to_ap1302_sensor(struct v4l2_subdev *s=
d)
+{
+	return container_of(sd, struct ap1302_sensor, sd);
+}
+
+struct ap1302_device {
+	struct device *dev;
+	struct i2c_client *client;
+
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *standby_gpio;
+	struct clk *clock;
+	struct regmap *regmap16;
+	struct regmap *regmap32;
+	u32 reg_page;
+
+	const struct firmware *fw;
+
+	struct v4l2_fwnode_endpoint bus_cfg;
+
+	struct mutex lock;	/* Protects formats */
+
+	struct v4l2_subdev sd;
+	struct media_pad pads[AP1302_PAD_MAX];
+	struct ap1302_format formats[AP1302_PAD_MAX];
+	unsigned int width_factor;
+
+	struct v4l2_ctrl_handler ctrls;
+
+	const struct ap1302_sensor_info *sensor_info;
+	struct ap1302_sensor sensors[2];
+
+	struct {
+		struct dentry *dir;
+		struct mutex lock;
+		u32 sipm_addr;
+	} debugfs;
+};
+
+static inline struct ap1302_device *to_ap1302(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ap1302_device, sd);
+}
+
+struct ap1302_firmware_header {
+	u16 pll_init_size;
+	u16 crc;
+} __packed;
+
+#define MAX_FW_LOAD_RETRIES 3
+
+static const struct ap1302_format_info supported_video_formats[] =3D {
+	{
+		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
+		.out_fmt =3D AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF
+			 | AP1302_PREVIEW_OUT_FMT_FST_YUV_422,
+	}, {
+		.code =3D MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+		.out_fmt =3D AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF
+			 | AP1302_PREVIEW_OUT_FMT_FST_YUV_420,
+	},
+};
+
+/* -----------------------------------------------------------------------=
------
+ * Sensor Info
+ */
+
+static const struct ap1302_sensor_info ap1302_sensor_info[] =3D {
+	{
+		.model =3D "onnn,ar0144",
+		.name =3D "ar0144",
+		.i2c_addr =3D 0x10,
+		.resolution =3D { 1280, 800 },
+		.format =3D MEDIA_BUS_FMT_SGRBG12_1X12,
+		.supplies =3D (const struct ap1302_sensor_supply[]) {
+			{ "vaa", 0 },
+			{ "vddio", 0 },
+			{ "vdd", 0 },
+			{ NULL, 0 },
+		},
+	}, {
+		.model =3D "onnn,ar0330",
+		.name =3D "ar0330",
+		.i2c_addr =3D 0x10,
+		.resolution =3D { 2304, 1536 },
+		.format =3D MEDIA_BUS_FMT_SGRBG12_1X12,
+		.supplies =3D (const struct ap1302_sensor_supply[]) {
+			{ "vddpll", 0 },
+			{ "vaa", 0 },
+			{ "vdd", 0 },
+			{ "vddio", 0 },
+			{ NULL, 0 },
+		},
+	}, {
+		.model =3D "onnn,ar1335",
+		.name =3D "ar1335",
+		.i2c_addr =3D 0x36,
+		.resolution =3D { 4208, 3120 },
+		.format =3D MEDIA_BUS_FMT_SGRBG10_1X10,
+		.supplies =3D (const struct ap1302_sensor_supply[]) {
+			{ "vaa", 0 },
+			{ "vddio", 0 },
+			{ "vdd", 0 },
+			{ NULL, 0 },
+		},
+	},
+};
+
+static const struct ap1302_sensor_info ap1302_sensor_info_tpg =3D {
+	.model =3D "",
+	.name =3D "tpg",
+	.resolution =3D { 1920, 1080 },
+};
+
+/* -----------------------------------------------------------------------=
------
+ * Register Configuration
+ */
+
+static const struct regmap_config ap1302_reg16_config =3D {
+	.reg_bits =3D 16,
+	.val_bits =3D 16,
+	.reg_stride =3D 2,
+	.reg_format_endian =3D REGMAP_ENDIAN_BIG,
+	.val_format_endian =3D REGMAP_ENDIAN_BIG,
+	.cache_type =3D REGCACHE_NONE,
+};
+
+static const struct regmap_config ap1302_reg32_config =3D {
+	.reg_bits =3D 16,
+	.val_bits =3D 32,
+	.reg_stride =3D 4,
+	.reg_format_endian =3D REGMAP_ENDIAN_BIG,
+	.val_format_endian =3D REGMAP_ENDIAN_BIG,
+	.cache_type =3D REGCACHE_NONE,
+};
+
+static int __ap1302_write(struct ap1302_device *ap1302, u32 reg, u32 val)
+{
+	unsigned int size =3D AP1302_REG_SIZE(reg);
+	u16 addr =3D AP1302_REG_ADDR(reg);
+	int ret;
+
+	switch (size) {
+	case 2:
+		ret =3D regmap_write(ap1302->regmap16, addr, val);
+		break;
+	case 4:
+		ret =3D regmap_write(ap1302->regmap32, addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(ap1302->dev, "%s: register 0x%04x %s failed: %d\n",
+			__func__, addr, "write", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ap1302_write(struct ap1302_device *ap1302, u32 reg, u32 val,
+			int *err)
+{
+	u32 page =3D AP1302_REG_PAGE(reg);
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	if (page) {
+		if (ap1302->reg_page !=3D page) {
+			ret =3D __ap1302_write(ap1302, AP1302_ADVANCED_BASE,
+					     page);
+			if (ret < 0)
+				goto done;
+
+			ap1302->reg_page =3D page;
+		}
+
+		reg &=3D ~AP1302_REG_PAGE_MASK;
+		reg +=3D AP1302_REG_ADV_START;
+	}
+
+	ret =3D __ap1302_write(ap1302, reg, val);
+
+done:
+	if (err && ret)
+		*err =3D ret;
+
+	return ret;
+}
+
+static int __ap1302_read(struct ap1302_device *ap1302, u32 reg, u32 *val)
+{
+	unsigned int size =3D AP1302_REG_SIZE(reg);
+	u16 addr =3D AP1302_REG_ADDR(reg);
+	int ret;
+
+	switch (size) {
+	case 2:
+		ret =3D regmap_read(ap1302->regmap16, addr, val);
+		break;
+	case 4:
+		ret =3D regmap_read(ap1302->regmap32, addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(ap1302->dev, "%s: register 0x%04x %s failed: %d\n",
+			__func__, addr, "read", ret);
+		return ret;
+	}
+
+	dev_dbg(ap1302->dev, "%s: R0x%04x =3D 0x%0*x\n", __func__,
+		addr, size * 2, *val);
+
+	return 0;
+}
+
+static int ap1302_read(struct ap1302_device *ap1302, u32 reg, u32 *val)
+{
+	u32 page =3D AP1302_REG_PAGE(reg);
+	int ret;
+
+	if (page) {
+		if (ap1302->reg_page !=3D page) {
+			ret =3D __ap1302_write(ap1302, AP1302_ADVANCED_BASE,
+					     page);
+			if (ret < 0)
+				return ret;
+
+			ap1302->reg_page =3D page;
+		}
+
+		reg &=3D ~AP1302_REG_PAGE_MASK;
+		reg +=3D AP1302_REG_ADV_START;
+	}
+
+	return __ap1302_read(ap1302, reg, val);
+}
+
+/* -----------------------------------------------------------------------=
------
+ * Sensor Registers Access
+ *
+ * Read and write sensor registers through the AP1302 DMA interface.
+ */
+
+static int ap1302_dma_wait_idle(struct ap1302_device *ap1302)
+{
+	unsigned int i;
+	u32 ctrl;
+	int ret;
+
+	for (i =3D 50; i > 0; i--) {
+		ret =3D ap1302_read(ap1302, AP1302_DMA_CTRL, &ctrl);
+		if (ret < 0)
+			return ret;
+
+		if ((ctrl & AP1302_DMA_CTRL_MODE_MASK) =3D=3D
+		    AP1302_DMA_CTRL_MODE_IDLE)
+			break;
+
+		usleep_range(1000, 1500);
+	}
+
+	if (!i) {
+		dev_err(ap1302->dev, "DMA timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int ap1302_sipm_read(struct ap1302_device *ap1302, unsigned int por=
t,
+			    u32 reg, u32 *val)
+{
+	unsigned int size =3D AP1302_REG_SIZE(reg);
+	u32 src;
+	int ret;
+
+	if (size > 2)
+		return -EINVAL;
+
+	ret =3D ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ap1302_write(ap1302, AP1302_DMA_SIZE, size, &ret);
+	src =3D AP1302_DMA_SIP_SIPM(port)
+	    | (size =3D=3D 2 ? AP1302_DMA_SIP_DATA_16_BIT : 0)
+	    | AP1302_DMA_SIP_ADDR_16_BIT
+	    | AP1302_DMA_SIP_ID(ap1302->sensor_info->i2c_addr)
+	    | AP1302_DMA_SIP_REG(AP1302_REG_ADDR(reg));
+	ap1302_write(ap1302, AP1302_DMA_SRC, src, &ret);
+
+	/*
+	 * Use the AP1302_DMA_DST register as both the destination address, and
+	 * the scratch pad to store the read value.
+	 */
+	ap1302_write(ap1302, AP1302_DMA_DST, AP1302_REG_ADDR(AP1302_DMA_DST),
+		     &ret);
+
+	ap1302_write(ap1302, AP1302_DMA_CTRL,
+		     AP1302_DMA_CTRL_SCH_NORMAL |
+		     AP1302_DMA_CTRL_DST_REG |
+		     AP1302_DMA_CTRL_SRC_SIP |
+		     AP1302_DMA_CTRL_MODE_COPY, &ret);
+	if (ret < 0)
+		return ret;
+
+	ret =3D ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_DMA_DST, val);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The value is stored in big-endian at the DMA_DST address. The regmap
+	 * uses big-endian, so 8-bit values are stored in bits 31:24 and 16-bit
+	 * values in bits 23:16.
+	 */
+	*val >>=3D 32 - size * 8;
+
+	return 0;
+}
+
+static int ap1302_sipm_write(struct ap1302_device *ap1302, unsigned int po=
rt,
+			     u32 reg, u32 val)
+{
+	unsigned int size =3D AP1302_REG_SIZE(reg);
+	u32 dst;
+	int ret;
+
+	if (size > 2)
+		return -EINVAL;
+
+	ret =3D ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ap1302_write(ap1302, AP1302_DMA_SIZE, size, &ret);
+
+	/*
+	 * Use the AP1302_DMA_SRC register as both the source address, and the
+	 * scratch pad to store the write value.
+	 *
+	 * As the AP1302 uses big endian, to store the value at address DMA_SRC
+	 * it must be written in the high order bits of the registers. However,
+	 * 8-bit values seem to be incorrectly handled by the AP1302, which
+	 * expects them to be stored at DMA_SRC + 1 instead of DMA_SRC. The
+	 * value is thus unconditionally shifted by 16 bits, unlike for DMA
+	 * reads.
+	 */
+	ap1302_write(ap1302, AP1302_DMA_SRC,
+		     (val << 16) | AP1302_REG_ADDR(AP1302_DMA_SRC), &ret);
+	if (ret < 0)
+		return ret;
+
+	dst =3D AP1302_DMA_SIP_SIPM(port)
+	    | (size =3D=3D 2 ? AP1302_DMA_SIP_DATA_16_BIT : 0)
+	    | AP1302_DMA_SIP_ADDR_16_BIT
+	    | AP1302_DMA_SIP_ID(ap1302->sensor_info->i2c_addr)
+	    | AP1302_DMA_SIP_REG(AP1302_REG_ADDR(reg));
+	ap1302_write(ap1302, AP1302_DMA_DST, dst, &ret);
+
+	ap1302_write(ap1302, AP1302_DMA_CTRL,
+		     AP1302_DMA_CTRL_SCH_NORMAL |
+		     AP1302_DMA_CTRL_DST_SIP |
+		     AP1302_DMA_CTRL_SRC_REG |
+		     AP1302_DMA_CTRL_MODE_COPY, &ret);
+	if (ret < 0)
+		return ret;
+
+	ret =3D ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------=
------
+ * Debugfs
+ */
+
+static int ap1302_sipm_addr_get(void *arg, u64 *val)
+{
+	struct ap1302_device *ap1302 =3D arg;
+
+	mutex_lock(&ap1302->debugfs.lock);
+	*val =3D ap1302->debugfs.sipm_addr;
+	mutex_unlock(&ap1302->debugfs.lock);
+
+	return 0;
+}
+
+static int ap1302_sipm_addr_set(void *arg, u64 val)
+{
+	struct ap1302_device *ap1302 =3D arg;
+
+	if (val & ~0x8700ffff)
+		return -EINVAL;
+
+	switch ((val >> 24) & 7) {
+	case 1:
+	case 2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&ap1302->debugfs.lock);
+	ap1302->debugfs.sipm_addr =3D val;
+	mutex_unlock(&ap1302->debugfs.lock);
+
+	return 0;
+}
+
+static int ap1302_sipm_data_get(void *arg, u64 *val)
+{
+	struct ap1302_device *ap1302 =3D arg;
+	u32 value;
+	u32 addr;
+	int ret;
+
+	mutex_lock(&ap1302->debugfs.lock);
+
+	addr =3D ap1302->debugfs.sipm_addr;
+	if (!addr) {
+		ret =3D -EINVAL;
+		goto unlock;
+	}
+
+	ret =3D ap1302_sipm_read(ap1302, addr >> 30, addr & ~BIT(31),
+			       &value);
+	if (!ret)
+		*val =3D value;
+
+unlock:
+	mutex_unlock(&ap1302->debugfs.lock);
+
+	return ret;
+}
+
+static int ap1302_sipm_data_set(void *arg, u64 val)
+{
+	struct ap1302_device *ap1302 =3D arg;
+	u32 addr;
+	int ret;
+
+	mutex_lock(&ap1302->debugfs.lock);
+
+	addr =3D ap1302->debugfs.sipm_addr;
+	if (!addr) {
+		ret =3D -EINVAL;
+		goto unlock;
+	}
+
+	ret =3D ap1302_sipm_write(ap1302, addr >> 30, addr & ~BIT(31),
+				val);
+
+unlock:
+	mutex_unlock(&ap1302->debugfs.lock);
+
+	return ret;
+}
+
+/*
+ * The sipm_addr and sipm_data attributes expose access to the sensor I2C =
bus.
+ *
+ * To read or write a register, sipm_addr has to first be written with the
+ * register address. The address is a 32-bit integer formatted as follows.
+ *
+ * I000 0SSS 0000 0000 RRRR RRRR RRRR RRRR
+ *
+ * I: SIPM index (0 or 1)
+ * S: Size (1: 8-bit, 2: 16-bit)
+ * R: Register address (16-bit)
+ *
+ * The sipm_data attribute can then be read to read the register value, or
+ * written to write it.
+ */
+
+DEFINE_DEBUGFS_ATTRIBUTE(ap1302_sipm_addr_fops, ap1302_sipm_addr_get,
+			 ap1302_sipm_addr_set, "0x%08llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(ap1302_sipm_data_fops, ap1302_sipm_data_get,
+			 ap1302_sipm_data_set, "0x%08llx\n");
+
+static void ap1302_debugfs_init(struct ap1302_device *ap1302)
+{
+	struct dentry *dir;
+	char name[16];
+
+	mutex_init(&ap1302->debugfs.lock);
+
+	snprintf(name, sizeof(name), "ap1302.%s", dev_name(ap1302->dev));
+
+	dir =3D debugfs_create_dir(name, NULL);
+	if (IS_ERR(dir))
+		return;
+
+	ap1302->debugfs.dir =3D dir;
+
+	debugfs_create_file_unsafe("sipm_addr", 0600, ap1302->debugfs.dir,
+				   ap1302, &ap1302_sipm_addr_fops);
+	debugfs_create_file_unsafe("sipm_data", 0600, ap1302->debugfs.dir,
+				   ap1302, &ap1302_sipm_data_fops);
+}
+
+static void ap1302_debugfs_cleanup(struct ap1302_device *ap1302)
+{
+	debugfs_remove_recursive(ap1302->debugfs.dir);
+	mutex_destroy(&ap1302->debugfs.lock);
+}
+
+/* -----------------------------------------------------------------------=
------
+ * Power Handling
+ */
+
+static int ap1302_power_on_sensors(struct ap1302_device *ap1302)
+{
+	struct ap1302_sensor *sensor;
+	unsigned int i, j;
+	int ret;
+
+	if (!ap1302->sensor_info->supplies)
+		return 0;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		sensor =3D &ap1302->sensors[i];
+		ret =3D 0;
+
+		for (j =3D 0; j < sensor->num_supplies; ++j) {
+			unsigned int delay;
+
+			/*
+			 * We can't use regulator_bulk_enable() as it would
+			 * enable all supplies in parallel, breaking the sensor
+			 * power sequencing constraints.
+			 */
+			ret =3D regulator_enable(sensor->supplies[j].consumer);
+			if (ret < 0) {
+				dev_err(ap1302->dev,
+					"Failed to enable supply %u for sensor %u\n",
+					j, i);
+				goto error;
+			}
+
+			delay =3D ap1302->sensor_info->supplies[j].post_delay_us;
+			usleep_range(delay, delay + 100);
+		}
+	}
+
+	return 0;
+
+error:
+	for (; j > 0; --j)
+		regulator_disable(sensor->supplies[j - 1].consumer);
+
+	for (; i > 0; --i) {
+		sensor =3D &ap1302->sensors[i - 1];
+		regulator_bulk_disable(sensor->num_supplies, sensor->supplies);
+	}
+
+	return ret;
+}
+
+static void ap1302_power_off_sensors(struct ap1302_device *ap1302)
+{
+	unsigned int i;
+
+	if (!ap1302->sensor_info->supplies)
+		return;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor =3D &ap1302->sensors[i];
+
+		regulator_bulk_disable(sensor->num_supplies, sensor->supplies);
+	}
+}
+
+static int ap1302_power_on(struct ap1302_device *ap1302)
+{
+	int ret;
+
+	/* 0. RESET was asserted when getting the GPIO. */
+
+	/* 1. Assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value(ap1302->standby_gpio, 1);
+		usleep_range(200, 1000);
+	}
+
+	/* 2. Power up the regulators. To be implemented. */
+
+	/* 3. De-assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value(ap1302->standby_gpio, 0);
+		usleep_range(200, 1000);
+	}
+
+	/* 4. Turn the clock on. */
+	ret =3D clk_prepare_enable(ap1302->clock);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	/* 5. De-assert RESET. */
+	gpiod_set_value(ap1302->reset_gpio, 0);
+
+	/*
+	 * 6. Wait for the AP1302 to initialize. The datasheet doesn't specify
+	 * how long this takes.
+	 */
+	usleep_range(10000, 11000);
+
+	return 0;
+}
+
+static void ap1302_power_off(struct ap1302_device *ap1302)
+{
+	/* 1. Assert RESET. */
+	gpiod_set_value(ap1302->reset_gpio, 1);
+
+	/* 2. Turn the clock off. */
+	clk_disable_unprepare(ap1302->clock);
+
+	/* 3. Assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value(ap1302->standby_gpio, 1);
+		usleep_range(200, 1000);
+	}
+
+	/* 4. Power down the regulators. To be implemented. */
+
+	/* 5. De-assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		usleep_range(200, 1000);
+		gpiod_set_value(ap1302->standby_gpio, 0);
+	}
+}
+
+/* -----------------------------------------------------------------------=
------
+ * Hardware Configuration
+ */
+
+static int ap1302_dump_console(struct ap1302_device *ap1302)
+{
+	u8 *buffer;
+	u8 *endp;
+	u8 *p;
+	int ret;
+
+	buffer =3D kmalloc(AP1302_CON_BUF_SIZE + 1, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	ret =3D regmap_raw_read(ap1302->regmap16, AP1302_CON_BUF(0), buffer,
+			      AP1302_CON_BUF_SIZE);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to read console buffer: %d\n",
+			ret);
+		goto done;
+	}
+
+	print_hex_dump(KERN_INFO, "console ", DUMP_PREFIX_OFFSET, 16, 1, buffer,
+		       AP1302_CON_BUF_SIZE, true);
+
+	buffer[AP1302_CON_BUF_SIZE] =3D '\0';
+
+	for (p =3D buffer; p < buffer + AP1302_CON_BUF_SIZE && *p; p =3D endp + 1=
) {
+		endp =3D strchrnul(p, '\n');
+		*endp =3D '\0';
+
+		pr_info("console %s\n", p);
+	}
+
+	ret =3D 0;
+
+done:
+	kfree(buffer);
+	return ret;
+}
+
+static int ap1302_configure(struct ap1302_device *ap1302)
+{
+	const struct ap1302_format *format =3D &ap1302->formats[AP1302_PAD_SOURCE=
];
+	unsigned int data_lanes =3D ap1302->bus_cfg.bus.mipi_csi2.num_data_lanes;
+	int ret =3D 0;
+
+	ap1302_write(ap1302, AP1302_PREVIEW_HINF_CTRL,
+		     AP1302_PREVIEW_HINF_CTRL_SPOOF |
+		     AP1302_PREVIEW_HINF_CTRL_MIPI_LANES(data_lanes), &ret);
+
+	ap1302_write(ap1302, AP1302_PREVIEW_WIDTH,
+		     format->format.width / ap1302->width_factor, &ret);
+	ap1302_write(ap1302, AP1302_PREVIEW_HEIGHT,
+		     format->format.height, &ret);
+	ap1302_write(ap1302, AP1302_PREVIEW_OUT_FMT,
+		     format->info->out_fmt, &ret);
+	if (ret < 0)
+		return ret;
+
+	__v4l2_ctrl_handler_setup(&ap1302->ctrls);
+
+	return 0;
+}
+
+static int ap1302_stall(struct ap1302_device *ap1302, bool stall)
+{
+	int ret =3D 0;
+
+	if (stall) {
+		ap1302_write(ap1302, AP1302_SYS_START,
+			     AP1302_SYS_START_PLL_LOCK |
+			     AP1302_SYS_START_STALL_MODE_DISABLED, &ret);
+		ap1302_write(ap1302, AP1302_SYS_START,
+			     AP1302_SYS_START_PLL_LOCK |
+			     AP1302_SYS_START_STALL_EN |
+			     AP1302_SYS_START_STALL_MODE_DISABLED, &ret);
+		if (ret < 0)
+			return ret;
+
+		msleep(200);
+
+		ap1302_write(ap1302, AP1302_ADV_IRQ_SYS_INTE,
+			     AP1302_ADV_IRQ_SYS_INTE_SIPM |
+			     AP1302_ADV_IRQ_SYS_INTE_SIPS_FIFO_WRITE, &ret);
+		if (ret < 0)
+			return ret;
+
+		return 0;
+	} else {
+		return ap1302_write(ap1302, AP1302_SYS_START,
+				    AP1302_SYS_START_PLL_LOCK |
+				    AP1302_SYS_START_STALL_STATUS |
+				    AP1302_SYS_START_STALL_EN |
+				    AP1302_SYS_START_STALL_MODE_DISABLED, NULL);
+	}
+}
+
+/* -----------------------------------------------------------------------=
------
+ * V4L2 Controls
+ */
+
+static u16 ap1302_wb_values[] =3D {
+	AP1302_AWB_CTRL_MODE_OFF,	/* V4L2_WHITE_BALANCE_MANUAL */
+	AP1302_AWB_CTRL_MODE_AUTO,	/* V4L2_WHITE_BALANCE_AUTO */
+	AP1302_AWB_CTRL_MODE_A,		/* V4L2_WHITE_BALANCE_INCANDESCENT */
+	AP1302_AWB_CTRL_MODE_D50,	/* V4L2_WHITE_BALANCE_FLUORESCENT */
+	AP1302_AWB_CTRL_MODE_D65,	/* V4L2_WHITE_BALANCE_FLUORESCENT_H */
+	AP1302_AWB_CTRL_MODE_HORIZON,	/* V4L2_WHITE_BALANCE_HORIZON */
+	AP1302_AWB_CTRL_MODE_D65,	/* V4L2_WHITE_BALANCE_DAYLIGHT */
+	AP1302_AWB_CTRL_MODE_AUTO,	/* V4L2_WHITE_BALANCE_FLASH */
+	AP1302_AWB_CTRL_MODE_D75,	/* V4L2_WHITE_BALANCE_CLOUDY */
+	AP1302_AWB_CTRL_MODE_D75,	/* V4L2_WHITE_BALANCE_SHADE */
+};
+
+static int ap1302_set_wb_mode(struct ap1302_device *ap1302, s32 mode)
+{
+	u32 val;
+	int ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_AWB_CTRL, &val);
+	if (ret)
+		return ret;
+
+	val &=3D ~AP1302_AWB_CTRL_MODE_MASK;
+	val |=3D ap1302_wb_values[mode];
+
+	if (mode =3D=3D V4L2_WHITE_BALANCE_FLASH)
+		val |=3D AP1302_AWB_CTRL_FLASH;
+	else
+		val &=3D ~AP1302_AWB_CTRL_FLASH;
+
+	return ap1302_write(ap1302, AP1302_AWB_CTRL, val, NULL);
+}
+
+static int ap1302_set_zoom(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_DZ_TGT_FCT, val, NULL);
+}
+
+static u16 ap1302_sfx_values[] =3D {
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_NONE */
+	AP1302_SFX_MODE_SFX_BW,		/* V4L2_COLORFX_BW */
+	AP1302_SFX_MODE_SFX_SEPIA1,	/* V4L2_COLORFX_SEPIA */
+	AP1302_SFX_MODE_SFX_NEGATIVE,	/* V4L2_COLORFX_NEGATIVE */
+	AP1302_SFX_MODE_SFX_EMBOSS,	/* V4L2_COLORFX_EMBOSS */
+	AP1302_SFX_MODE_SFX_SKETCH,	/* V4L2_COLORFX_SKETCH */
+	AP1302_SFX_MODE_SFX_BLUISH,	/* V4L2_COLORFX_SKY_BLUE */
+	AP1302_SFX_MODE_SFX_GREENISH,	/* V4L2_COLORFX_GRASS_GREEN */
+	AP1302_SFX_MODE_SFX_REDISH,	/* V4L2_COLORFX_SKIN_WHITEN */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_VIVID */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_AQUA */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_ART_FREEZE */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_SILHOUETTE */
+	AP1302_SFX_MODE_SFX_SOLARIZE, /* V4L2_COLORFX_SOLARIZATION */
+	AP1302_SFX_MODE_SFX_ANTIQUE, /* V4L2_COLORFX_ANTIQUE */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_SET_CBCR */
+};
+
+static int ap1302_set_special_effect(struct ap1302_device *ap1302, s32 val=
)
+{
+	return ap1302_write(ap1302, AP1302_SFX_MODE, ap1302_sfx_values[val],
+			    NULL);
+}
+
+static u16 ap1302_scene_mode_values[] =3D {
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_NONE */
+	AP1302_SCENE_CTRL_MODE_BACKLIGHT,	/* V4L2_SCENE_MODE_BACKLIGHT */
+	AP1302_SCENE_CTRL_MODE_BEACH,		/* V4L2_SCENE_MODE_BEACH_SNOW */
+	AP1302_SCENE_CTRL_MODE_TWILIGHT,	/* V4L2_SCENE_MODE_CANDLE_LIGHT */
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_DAWN_DUSK */
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_FALL_COLORS */
+	AP1302_SCENE_CTRL_MODE_FIREWORKS,	/* V4L2_SCENE_MODE_FIREWORKS */
+	AP1302_SCENE_CTRL_MODE_LANDSCAPE,	/* V4L2_SCENE_MODE_LANDSCAPE */
+	AP1302_SCENE_CTRL_MODE_NIGHT,		/* V4L2_SCENE_MODE_NIGHT */
+	AP1302_SCENE_CTRL_MODE_PARTY,		/* V4L2_SCENE_MODE_PARTY_INDOOR */
+	AP1302_SCENE_CTRL_MODE_PORTRAIT,	/* V4L2_SCENE_MODE_PORTRAIT */
+	AP1302_SCENE_CTRL_MODE_SPORT,		/* V4L2_SCENE_MODE_SPORTS */
+	AP1302_SCENE_CTRL_MODE_SUNSET,		/* V4L2_SCENE_MODE_SUNSET */
+	AP1302_SCENE_CTRL_MODE_DOCUMENT,	/* V4L2_SCENE_MODE_TEXT */
+};
+
+static int ap1302_set_scene_mode(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SCENE_CTRL,
+			    ap1302_scene_mode_values[val], NULL);
+}
+
+static const u16 ap1302_flicker_values[] =3D {
+	AP1302_FLICK_CTRL_MODE_DISABLED,
+	AP1302_FLICK_CTRL_FREQ(50) | AP1302_FLICK_CTRL_MODE_MANUAL,
+	AP1302_FLICK_CTRL_FREQ(60) | AP1302_FLICK_CTRL_MODE_MANUAL,
+	AP1302_FLICK_CTRL_MODE_AUTO,
+};
+
+static int ap1302_set_flicker_freq(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_FLICK_CTRL,
+			    ap1302_flicker_values[val], NULL);
+}
+
+static int ap1302_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ap1302_device *ap1302 =3D
+		container_of(ctrl->handler, struct ap1302_device, ctrls);
+
+	switch (ctrl->id) {
+	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
+		return ap1302_set_wb_mode(ap1302, ctrl->val);
+
+	case V4L2_CID_ZOOM_ABSOLUTE:
+		return ap1302_set_zoom(ap1302, ctrl->val);
+
+	case V4L2_CID_COLORFX:
+		return ap1302_set_special_effect(ap1302, ctrl->val);
+
+	case V4L2_CID_SCENE_MODE:
+		return ap1302_set_scene_mode(ap1302, ctrl->val);
+
+	case V4L2_CID_POWER_LINE_FREQUENCY:
+		return ap1302_set_flicker_freq(ap1302, ctrl->val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ctrl_ops ap1302_ctrl_ops =3D {
+	.s_ctrl =3D ap1302_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config ap1302_ctrls[] =3D {
+	{
+		.ops =3D &ap1302_ctrl_ops,
+		.id =3D V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE,
+		.min =3D 0,
+		.max =3D 9,
+		.def =3D 1,
+	}, {
+		.ops =3D &ap1302_ctrl_ops,
+		.id =3D V4L2_CID_ZOOM_ABSOLUTE,
+		.min =3D 0x0100,
+		.max =3D 0x1000,
+		.step =3D 1,
+		.def =3D 0x0100,
+	}, {
+		.ops =3D &ap1302_ctrl_ops,
+		.id =3D V4L2_CID_COLORFX,
+		.min =3D 0,
+		.max =3D 15,
+		.def =3D 0,
+		.menu_skip_mask =3D BIT(15) | BIT(12) | BIT(11) | BIT(10) | BIT(9),
+	}, {
+		.ops =3D &ap1302_ctrl_ops,
+		.id =3D V4L2_CID_SCENE_MODE,
+		.min =3D 0,
+		.max =3D 13,
+		.def =3D 0,
+		.menu_skip_mask =3D BIT(5) | BIT(4),
+	}, {
+		.ops =3D &ap1302_ctrl_ops,
+		.id =3D V4L2_CID_POWER_LINE_FREQUENCY,
+		.min =3D 0,
+		.max =3D 3,
+		.def =3D 3,
+	},
+};
+
+static int ap1302_ctrls_init(struct ap1302_device *ap1302)
+{
+	unsigned int i;
+	int ret;
+
+	ret =3D v4l2_ctrl_handler_init(&ap1302->ctrls, ARRAY_SIZE(ap1302_ctrls));
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302_ctrls); i++)
+		v4l2_ctrl_new_custom(&ap1302->ctrls, &ap1302_ctrls[i], NULL);
+
+	if (ap1302->ctrls.error) {
+		ret =3D ap1302->ctrls.error;
+		v4l2_ctrl_handler_free(&ap1302->ctrls);
+		return ret;
+	}
+
+	/* Use same lock for controls as for everything else. */
+	ap1302->ctrls.lock =3D &ap1302->lock;
+	ap1302->sd.ctrl_handler =3D &ap1302->ctrls;
+
+	return 0;
+}
+
+static void ap1302_ctrls_cleanup(struct ap1302_device *ap1302)
+{
+	v4l2_ctrl_handler_free(&ap1302->ctrls);
+}
+
+/* -----------------------------------------------------------------------=
------
+ * V4L2 Subdev Operations
+ */
+
+static struct v4l2_mbus_framefmt *
+ap1302_get_pad_format(struct ap1302_device *ap1302,
+		      struct v4l2_subdev_pad_config *cfg,
+		      unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&ap1302->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &ap1302->formats[pad].format;
+	default:
+		return NULL;
+	}
+}
+
+static int ap1302_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg)
+{
+	u32 which =3D cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	const struct ap1302_sensor_info *info =3D ap1302->sensor_info;
+	unsigned int pad;
+
+	for (pad =3D 0; pad < ARRAY_SIZE(ap1302->formats); ++pad) {
+		struct v4l2_mbus_framefmt *format =3D
+			ap1302_get_pad_format(ap1302, cfg, pad, which);
+
+		format->width =3D info->resolution.width;
+		format->height =3D info->resolution.height;
+
+		/*
+		 * The source pad combines images side by side in multi-sensor
+		 * setup.
+		 */
+		if (pad =3D=3D AP1302_PAD_SOURCE) {
+			format->width *=3D ap1302->width_factor;
+			format->code =3D ap1302->formats[pad].info->code;
+		} else {
+			format->code =3D info->format;
+		}
+
+		format->field =3D V4L2_FIELD_NONE;
+		format->colorspace =3D V4L2_COLORSPACE_SRGB;
+	}
+
+	return 0;
+}
+
+static int ap1302_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+
+	if (code->pad !=3D AP1302_PAD_SOURCE) {
+		/*
+		 * On the sink pads, only the format produced by the sensor is
+		 * supported.
+		 */
+		if (code->index)
+			return -EINVAL;
+
+		code->code =3D ap1302->sensor_info->format;
+	} else {
+		/* On the source pad, multiple formats are supported. */
+		if (code->index >=3D ARRAY_SIZE(supported_video_formats))
+			return -EINVAL;
+
+		code->code =3D supported_video_formats[code->index].code;
+	}
+
+	return 0;
+}
+
+static int ap1302_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	unsigned int i;
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->pad !=3D AP1302_PAD_SOURCE) {
+		/*
+		 * On the sink pads, only the size produced by the sensor is
+		 * supported.
+		 */
+		if (fse->code !=3D ap1302->sensor_info->format)
+			return -EINVAL;
+
+		fse->min_width =3D ap1302->sensor_info->resolution.width;
+		fse->min_height =3D ap1302->sensor_info->resolution.height;
+		fse->max_width =3D ap1302->sensor_info->resolution.width;
+		fse->max_height =3D ap1302->sensor_info->resolution.height;
+	} else {
+		/*
+		 * On the source pad, the AP1302 can freely scale within the
+		 * scaler's limits.
+		 */
+		for (i =3D 0; i < ARRAY_SIZE(supported_video_formats); i++) {
+			if (supported_video_formats[i].code =3D=3D fse->code)
+				break;
+		}
+
+		if (i >=3D ARRAY_SIZE(supported_video_formats))
+			return -EINVAL;
+
+		fse->min_width =3D AP1302_MIN_WIDTH * ap1302->width_factor;
+		fse->min_height =3D AP1302_MIN_HEIGHT;
+		fse->max_width =3D AP1302_MAX_WIDTH;
+		fse->max_height =3D AP1302_MAX_HEIGHT;
+	}
+
+	return 0;
+}
+
+static int ap1302_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	const struct v4l2_mbus_framefmt *format;
+
+	format =3D ap1302_get_pad_format(ap1302, cfg, fmt->pad, fmt->which);
+
+	mutex_lock(&ap1302->lock);
+	fmt->format =3D *format;
+	mutex_unlock(&ap1302->lock);
+
+	return 0;
+}
+
+static int ap1302_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	const struct ap1302_format_info *info =3D NULL;
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	/* Formats on the sink pads can't be changed. */
+	if (fmt->pad !=3D AP1302_PAD_SOURCE)
+		return ap1302_get_fmt(sd, cfg, fmt);
+
+	format =3D ap1302_get_pad_format(ap1302, cfg, fmt->pad, fmt->which);
+
+	/* Validate the media bus code, default to the first supported value. */
+	for (i =3D 0; i < ARRAY_SIZE(supported_video_formats); i++) {
+		if (supported_video_formats[i].code =3D=3D fmt->format.code) {
+			info =3D &supported_video_formats[i];
+			break;
+		}
+	}
+
+	if (!info)
+		info =3D &supported_video_formats[0];
+
+	/*
+	 * Clamp the size. The width must be a multiple of 4 (or 8 in the
+	 * dual-sensor case) and the height a multiple of 2.
+	 */
+	fmt->format.width =3D clamp(ALIGN_DOWN(fmt->format.width,
+					     4 * ap1302->width_factor),
+				  AP1302_MIN_WIDTH * ap1302->width_factor,
+				  AP1302_MAX_WIDTH);
+	fmt->format.height =3D clamp(ALIGN_DOWN(fmt->format.height, 2),
+				   AP1302_MIN_HEIGHT, AP1302_MAX_HEIGHT);
+
+	mutex_lock(&ap1302->lock);
+
+	format->width =3D fmt->format.width;
+	format->height =3D fmt->format.height;
+	format->code =3D info->code;
+
+	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
+		ap1302->formats[fmt->pad].info =3D info;
+
+	mutex_unlock(&ap1302->lock);
+
+	fmt->format =3D *format;
+
+	return 0;
+}
+
+static int ap1302_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	const struct ap1302_size *resolution =3D &ap1302->sensor_info->resolution=
;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+		sel->r.left =3D 0;
+		sel->r.top =3D 0;
+		sel->r.width =3D resolution->width * ap1302->width_factor;
+		sel->r.height =3D resolution->height;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ap1302_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	int ret;
+
+	mutex_lock(&ap1302->lock);
+
+	if (enable) {
+		ret =3D ap1302_configure(ap1302);
+		if (ret < 0)
+			goto done;
+
+		ret =3D ap1302_stall(ap1302, false);
+	} else {
+		ret =3D ap1302_stall(ap1302, true);
+	}
+
+done:
+	mutex_unlock(&ap1302->lock);
+
+	if (ret < 0)
+		dev_err(ap1302->dev, "Failed to %s stream: %d\n",
+			enable ? "start" : "stop", ret);
+
+	return ret;
+}
+
+static const char * const ap1302_warnings[] =3D {
+	"HINF_BANDWIDTH",
+	"FLICKER_DETECTION",
+	"FACED_NE",
+	"SMILED_NE",
+	"HINF_OVERRUN",
+	NULL,
+	"FRAME_TOO_SMALL",
+	"MISSING_PHASES",
+	"SPOOF_UNDERRUN",
+	"JPEG_NOLAST",
+	"NO_IN_FREQ_SPEC",
+	"SINF0",
+	"SINF1",
+	"CAPTURE0",
+	"CAPTURE1",
+	"ISR_UNHANDLED",
+	"INTERLEAVE_SPOOF",
+	"INTERLEAVE_BUF",
+	"COORD_OUT_OF_RANGE",
+	"ICP_CLOCKING",
+	"SENSOR_CLOCKING",
+	"SENSOR_NO_IHDR",
+	"DIVIDE_BY_ZERO",
+	"INT0_UNDERRUN",
+	"INT1_UNDERRUN",
+	"SCRATCHPAD_TOO_BIG",
+	"OTP_RECORD_READ",
+	"NO_LSC_IN_OTP",
+	"GPIO_INT_LOST",
+	"NO_PDAF_DATA",
+	"FAR_PDAF_ACCESS_SKIP",
+	"PDAF_ERROR",
+	"ATM_TVI_BOUNDS",
+	"SIPM_0_RTY",
+	"SIPM_1_TRY",
+	"SIPM_0_NO_ACK",
+	"SIPM_1_NO_ACK",
+	"SMILE_DIS",
+	"DVS_DIS",
+	"TEST_DIS",
+	"SENSOR_LV2LV",
+	"SENSOR_FV2FV",
+	"FRAME_LOST",
+};
+
+static const char * const ap1302_lane_states[] =3D {
+	"stop_s",
+	"hs_req_s",
+	"lp_req_s",
+	"hs_s",
+	"lp_s",
+	"esc_req_s",
+	"turn_req_s",
+	"esc_s",
+	"esc_0",
+	"esc_1",
+	"turn_s",
+	"turn_mark",
+	"error_s",
+};
+
+static void ap1302_log_lane_state(struct ap1302_sensor *sensor,
+				  unsigned int index)
+{
+	static const char * const lp_states[] =3D {
+		"00", "10", "01", "11",
+	};
+
+	unsigned int counts[4][ARRAY_SIZE(ap1302_lane_states)];
+	unsigned int samples =3D 0;
+	unsigned int lane;
+	unsigned int i;
+	u32 first[4] =3D { 0, };
+	u32 last[4] =3D { 0, };
+	int ret;
+
+	memset(counts, 0, sizeof(counts));
+
+	for (i =3D 0; i < 1000; ++i) {
+		u32 values[4];
+
+		/*
+		 * Read the state of all lanes and skip read errors and invalid
+		 * values.
+		 */
+		for (lane =3D 0; lane < 4; ++lane) {
+			ret =3D ap1302_read(sensor->ap1302,
+					  AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(index, lane),
+					  &values[lane]);
+			if (ret < 0)
+				break;
+
+			if (AP1302_LANE_STATE(values[lane]) >=3D
+			    ARRAY_SIZE(ap1302_lane_states)) {
+				ret =3D -EINVAL;
+				break;
+			}
+		}
+
+		if (ret < 0)
+			continue;
+
+		/* Accumulate the samples and save the first and last states. */
+		for (lane =3D 0; lane < 4; ++lane)
+			counts[lane][AP1302_LANE_STATE(values[lane])]++;
+
+		if (!samples)
+			memcpy(first, values, sizeof(first));
+		memcpy(last, values, sizeof(last));
+
+		samples++;
+	}
+
+	if (!samples)
+		return;
+
+	/*
+	 * Print the LP state from the first sample, the error state from the
+	 * last sample, and the states accumulators for each lane.
+	 */
+	for (lane =3D 0; lane < 4; ++lane) {
+		u32 state =3D last[lane];
+		char error_msg[25] =3D "";
+
+		if (state & (AP1302_LANE_ERR | AP1302_LANE_ABORT)) {
+			unsigned int err =3D AP1302_LANE_ERR_STATE(state);
+			const char *err_state =3D NULL;
+
+			err_state =3D err < ARRAY_SIZE(ap1302_lane_states)
+				  ? ap1302_lane_states[err] : "INVALID";
+
+			snprintf(error_msg, sizeof(error_msg), "ERR (%s%s) %s LP%s",
+				 state & AP1302_LANE_ERR ? "E" : "",
+				 state & AP1302_LANE_ABORT ? "A" : "",
+				 err_state,
+				 lp_states[AP1302_LANE_ERR_LP_VAL(state)]);
+		}
+
+		dev_info(sensor->ap1302->dev, "SINF%u L%u state: LP%s %s",
+			 index, lane, lp_states[AP1302_LANE_LP_VAL(first[lane])],
+			 error_msg);
+
+		for (i =3D 0; i < ARRAY_SIZE(ap1302_lane_states); ++i) {
+			if (counts[lane][i])
+				pr_cont(" %s:%u",
+				       ap1302_lane_states[i],
+				       counts[lane][i]);
+		}
+		pr_cont("\n");
+	}
+
+	/* Reset the error flags. */
+	for (lane =3D 0; lane < 4; ++lane)
+		ap1302_write(sensor->ap1302,
+			     AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(index, lane),
+			     AP1302_LANE_ERR | AP1302_LANE_ABORT, NULL);
+}
+
+static int ap1302_log_status(struct v4l2_subdev *sd)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	u16 frame_count_icp;
+	u16 frame_count_brac;
+	u16 frame_count_hinf;
+	u32 warning[4];
+	u32 error[3];
+	unsigned int i;
+	u32 value;
+	int ret;
+
+	/* Dump the console buffer. */
+	ret =3D ap1302_dump_console(ap1302);
+	if (ret < 0)
+		return ret;
+
+	/* Print errors. */
+	ret =3D ap1302_read(ap1302, AP1302_ERROR, &error[0]);
+	if (ret < 0)
+		return ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_ERR_FILE, &error[1]);
+	if (ret < 0)
+		return ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_ERR_LINE, &error[2]);
+	if (ret < 0)
+		return ret;
+
+	dev_info(ap1302->dev, "ERROR: 0x%04x (file 0x%08x:%u)\n",
+		 error[0], error[1], error[2]);
+
+	ret =3D ap1302_read(ap1302, AP1302_SIPM_ERR_0, &error[0]);
+	if (ret < 0)
+		return ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_SIPM_ERR_1, &error[1]);
+	if (ret < 0)
+		return ret;
+
+	dev_info(ap1302->dev, "SIPM_ERR [0] 0x%04x [1] 0x%04x\n",
+		 error[0], error[1]);
+
+	/* Print warnings. */
+	for (i =3D 0; i < ARRAY_SIZE(warning); ++i) {
+		ret =3D ap1302_read(ap1302, AP1302_WARNING(i), &warning[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev_info(ap1302->dev,
+		 "WARNING [0] 0x%04x [1] 0x%04x [2] 0x%04x [3] 0x%04x\n",
+		 warning[0], warning[1], warning[2], warning[3]);
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302_warnings); ++i) {
+		if ((warning[i / 16] & BIT(i % 16)) &&
+		    ap1302_warnings[i])
+			dev_info(ap1302->dev, "- WARN_%s\n",
+				 ap1302_warnings[i]);
+	}
+
+	/* Print the frame counter. */
+	ret =3D ap1302_read(ap1302, AP1302_FRAME_CNT, &value);
+	if (ret < 0)
+		return ret;
+
+	frame_count_hinf =3D value >> 8;
+	frame_count_brac =3D value & 0xff;
+
+	ret =3D ap1302_read(ap1302, AP1302_ADV_CAPTURE_A_FV_CNT, &value);
+	if (ret < 0)
+		return ret;
+
+	frame_count_icp =3D value & 0xffff;
+
+	dev_info(ap1302->dev, "Frame counters: ICP %u, HINF %u, BRAC %u\n",
+		 frame_count_icp, frame_count_hinf, frame_count_brac);
+
+	/* Sample the lane state. */
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor =3D &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ap1302_log_lane_state(sensor, i);
+	}
+
+	return 0;
+}
+
+static int ap1302_subdev_registered(struct v4l2_subdev *sd)
+{
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+	unsigned int i;
+	int ret;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor =3D &ap1302->sensors[i];
+
+		if (!sensor->dev)
+			continue;
+
+		dev_dbg(ap1302->dev, "registering sensor %u\n", i);
+
+		ret =3D v4l2_device_register_subdev(sd->v4l2_dev, &sensor->sd);
+		if (ret)
+			return ret;
+
+		ret =3D media_create_pad_link(&sensor->sd.entity, 0,
+					    &sd->entity, i,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations ap1302_media_ops =3D {
+	.link_validate =3D v4l2_subdev_link_validate
+};
+
+static const struct v4l2_subdev_pad_ops ap1302_pad_ops =3D {
+	.init_cfg =3D ap1302_init_cfg,
+	.enum_mbus_code =3D ap1302_enum_mbus_code,
+	.enum_frame_size =3D ap1302_enum_frame_size,
+	.get_fmt =3D ap1302_get_fmt,
+	.set_fmt =3D ap1302_set_fmt,
+	.get_selection =3D ap1302_get_selection,
+	.set_selection =3D ap1302_get_selection,
+};
+
+static const struct v4l2_subdev_video_ops ap1302_video_ops =3D {
+	.s_stream =3D ap1302_s_stream,
+};
+
+static const struct v4l2_subdev_core_ops ap1302_core_ops =3D {
+	.log_status =3D ap1302_log_status,
+};
+
+static const struct v4l2_subdev_ops ap1302_subdev_ops =3D {
+	.core =3D &ap1302_core_ops,
+	.video =3D &ap1302_video_ops,
+	.pad =3D &ap1302_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ap1302_subdev_internal_ops =
=3D {
+	.registered =3D ap1302_subdev_registered,
+};
+
+/* -----------------------------------------------------------------------=
------
+ * Sensor
+ */
+
+static int ap1302_sensor_enum_mbus_code(struct v4l2_subdev *sd,
+					struct v4l2_subdev_pad_config *cfg,
+					struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ap1302_sensor *sensor =3D to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info =3D sensor->ap1302->sensor_info;
+
+	if (code->index)
+		return -EINVAL;
+
+	code->code =3D info->format;
+	return 0;
+}
+
+static int ap1302_sensor_enum_frame_size(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_pad_config *cfg,
+					 struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ap1302_sensor *sensor =3D to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info =3D sensor->ap1302->sensor_info;
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code !=3D info->format)
+		return -EINVAL;
+
+	fse->min_width =3D info->resolution.width;
+	fse->min_height =3D info->resolution.height;
+	fse->max_width =3D info->resolution.width;
+	fse->max_height =3D info->resolution.height;
+
+	return 0;
+}
+
+static int ap1302_sensor_get_fmt(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_sensor *sensor =3D to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info =3D sensor->ap1302->sensor_info;
+
+	memset(&fmt->format, 0, sizeof(fmt->format));
+
+	fmt->format.width =3D info->resolution.width;
+	fmt->format.height =3D info->resolution.height;
+	fmt->format.field =3D V4L2_FIELD_NONE;
+	fmt->format.code =3D info->format;
+	fmt->format.colorspace =3D V4L2_COLORSPACE_SRGB;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops ap1302_sensor_pad_ops =3D {
+	.enum_mbus_code =3D ap1302_sensor_enum_mbus_code,
+	.enum_frame_size =3D ap1302_sensor_enum_frame_size,
+	.get_fmt =3D ap1302_sensor_get_fmt,
+	.set_fmt =3D ap1302_sensor_get_fmt,
+};
+
+static const struct v4l2_subdev_ops ap1302_sensor_subdev_ops =3D {
+	.pad =3D &ap1302_sensor_pad_ops,
+};
+
+static int ap1302_sensor_parse_of(struct ap1302_device *ap1302,
+				  struct device_node *node)
+{
+	struct ap1302_sensor *sensor;
+	u32 reg;
+	int ret;
+
+	/* Retrieve the sensor index from the reg property. */
+	ret =3D of_property_read_u32(node, "reg", &reg);
+	if (ret < 0) {
+		dev_warn(ap1302->dev,
+			 "'reg' property missing in sensor node\n");
+		return -EINVAL;
+	}
+
+	if (reg >=3D ARRAY_SIZE(ap1302->sensors)) {
+		dev_warn(ap1302->dev, "Out-of-bounds 'reg' value %u\n",
+			 reg);
+		return -EINVAL;
+	}
+
+	sensor =3D &ap1302->sensors[reg];
+	if (sensor->ap1302) {
+		dev_warn(ap1302->dev, "Duplicate entry for sensor %u\n", reg);
+		return -EINVAL;
+	}
+
+	sensor->ap1302 =3D ap1302;
+	sensor->of_node =3D of_node_get(node);
+
+	return 0;
+}
+
+static void ap1302_sensor_dev_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(dev);
+}
+
+static int ap1302_sensor_init(struct ap1302_sensor *sensor, unsigned int i=
ndex)
+{
+	struct ap1302_device *ap1302 =3D sensor->ap1302;
+	struct v4l2_subdev *sd =3D &sensor->sd;
+	unsigned int i;
+	int ret;
+
+	sensor->index =3D index;
+
+	/*
+	 * Register a device for the sensor, to support usage of the regulator
+	 * API.
+	 */
+	sensor->dev =3D kzalloc(sizeof(*sensor->dev), GFP_KERNEL);
+	if (!sensor->dev)
+		return -ENOMEM;
+
+	sensor->dev->parent =3D ap1302->dev;
+	sensor->dev->of_node =3D of_node_get(sensor->of_node);
+	sensor->dev->release =3D &ap1302_sensor_dev_release;
+	dev_set_name(sensor->dev, "%s-%s.%u", dev_name(ap1302->dev),
+		     ap1302->sensor_info->name, index);
+
+	ret =3D device_register(sensor->dev);
+	if (ret < 0) {
+		dev_err(ap1302->dev,
+			"Failed to register device for sensor %u\n", index);
+		goto error;
+	}
+
+	/* Retrieve the power supplies for the sensor, if any. */
+	if (ap1302->sensor_info->supplies) {
+		const struct ap1302_sensor_supply *supplies =3D
+			ap1302->sensor_info->supplies;
+		unsigned int num_supplies;
+
+		for (num_supplies =3D 0; supplies[num_supplies].name; ++num_supplies)
+			;
+
+		sensor->supplies =3D devm_kcalloc(ap1302->dev, num_supplies,
+						sizeof(*sensor->supplies),
+						GFP_KERNEL);
+		if (!sensor->supplies) {
+			ret =3D -ENOMEM;
+			goto error;
+		}
+
+		for (i =3D 0; i < num_supplies; ++i)
+			sensor->supplies[i].supply =3D supplies[i].name;
+
+		ret =3D regulator_bulk_get(sensor->dev, num_supplies,
+					 sensor->supplies);
+		if (ret < 0) {
+			dev_err(ap1302->dev,
+				"Failed to get supplies for sensor %u\n", index);
+			goto error;
+		}
+
+		sensor->num_supplies =3D i;
+	}
+
+	sd->dev =3D sensor->dev;
+	v4l2_subdev_init(sd, &ap1302_sensor_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s %u",
+		 ap1302->sensor_info->name, index);
+
+	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
+
+	ret =3D media_entity_pads_init(&sd->entity, 1, &sensor->pad);
+	if (ret < 0) {
+		dev_err(ap1302->dev,
+			"failed to initialize media entity for sensor %u: %d\n",
+			index, ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	put_device(sensor->dev);
+	return ret;
+}
+
+static void ap1302_sensor_cleanup(struct ap1302_sensor *sensor)
+{
+	media_entity_cleanup(&sensor->sd.entity);
+
+	if (sensor->num_supplies)
+		regulator_bulk_free(sensor->num_supplies, sensor->supplies);
+
+	put_device(sensor->dev);
+	of_node_put(sensor->of_node);
+}
+
+/* -----------------------------------------------------------------------=
------
+ * Boot & Firmware Handling
+ */
+
+static int ap1302_request_firmware(struct ap1302_device *ap1302)
+{
+	static const char * const suffixes[] =3D {
+		"",
+		"_single",
+		"_dual",
+	};
+
+	const struct ap1302_firmware_header *fw_hdr;
+	unsigned int num_sensors;
+	unsigned int fw_size;
+	unsigned int i;
+	char name[64];
+	int ret;
+
+	for (i =3D 0, num_sensors =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		if (ap1302->sensors[i].dev)
+			num_sensors++;
+	}
+
+	ret =3D snprintf(name, sizeof(name), "ap1302_%s%s_fw.bin",
+		       ap1302->sensor_info->name, suffixes[num_sensors]);
+	if (ret >=3D sizeof(name)) {
+		dev_err(ap1302->dev, "Firmware name too long\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(ap1302->dev, "Requesting firmware %s\n", name);
+
+	ret =3D request_firmware(&ap1302->fw, name, ap1302->dev);
+	if (ret) {
+		dev_err(ap1302->dev, "Failed to request firmware: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The firmware binary contains a header defined by the
+	 * ap1302_firmware_header structure. The firmware itself (also referred
+	 * to as bootdata) follows the header. Perform sanity checks to ensure
+	 * the firmware is valid.
+	 */
+	fw_hdr =3D (const struct ap1302_firmware_header *)ap1302->fw->data;
+	fw_size =3D ap1302->fw->size - sizeof(*fw_hdr);
+
+	if (fw_hdr->pll_init_size > fw_size) {
+		dev_err(ap1302->dev,
+			"Invalid firmware: PLL init size too large\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * ap1302_write_fw_window() - Write a piece of firmware to the AP1302
+ * @win_pos: Firmware load window current position
+ * @buf: Firmware data buffer
+ * @len: Firmware data length
+ *
+ * The firmware is loaded through a window in the registers space. Writes =
are
+ * sequential starting at address 0x8000, and must wrap around when reachi=
ng
+ * 0x9fff. This function write the firmware data stored in @buf to the AP1=
302,
+ * keeping track of the window position in the @win_pos argument.
+ */
+static int ap1302_write_fw_window(struct ap1302_device *ap1302, const u8 *=
buf,
+				  u32 len, unsigned int *win_pos)
+{
+	while (len > 0) {
+		unsigned int write_addr;
+		unsigned int write_size;
+		int ret;
+
+		/*
+		 * Write at most len bytes, from the current position to the
+		 * end of the window.
+		 */
+		write_addr =3D *win_pos + AP1302_FW_WINDOW_OFFSET;
+		write_size =3D min(len, AP1302_FW_WINDOW_SIZE - *win_pos);
+
+		ret =3D regmap_raw_write(ap1302->regmap16, write_addr, buf,
+				       write_size);
+		if (ret)
+			return ret;
+
+		buf +=3D write_size;
+		len -=3D write_size;
+
+		*win_pos +=3D write_size;
+		if (*win_pos >=3D AP1302_FW_WINDOW_SIZE)
+			*win_pos =3D 0;
+	}
+
+	return 0;
+}
+
+static int ap1302_load_firmware(struct ap1302_device *ap1302)
+{
+	const struct ap1302_firmware_header *fw_hdr;
+	unsigned int fw_size;
+	const u8 *fw_data;
+	unsigned int win_pos =3D 0;
+	unsigned int crc;
+	int ret;
+
+	fw_hdr =3D (const struct ap1302_firmware_header *)ap1302->fw->data;
+	fw_data =3D (u8 *)&fw_hdr[1];
+	fw_size =3D ap1302->fw->size - sizeof(*fw_hdr);
+
+	/* Clear the CRC register. */
+	ret =3D ap1302_write(ap1302, AP1302_SIP_CRC, 0xffff, NULL);
+	if (ret)
+		return ret;
+
+	/*
+	 * Load the PLL initialization settings, set the bootdata stage to 2 to
+	 * apply the basic_init_hp settings, and wait 1ms for the PLL to lock.
+	 */
+	ret =3D ap1302_write_fw_window(ap1302, fw_data, fw_hdr->pll_init_size,
+				     &win_pos);
+	if (ret)
+		return ret;
+
+	ret =3D ap1302_write(ap1302, AP1302_BOOTDATA_STAGE, 0x0002, NULL);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 2000);
+
+	/* Load the rest of the bootdata content and verify the CRC. */
+	ret =3D ap1302_write_fw_window(ap1302, fw_data + fw_hdr->pll_init_size,
+				     fw_size - fw_hdr->pll_init_size, &win_pos);
+	if (ret)
+		return ret;
+
+	msleep(40);
+
+	ret =3D ap1302_read(ap1302, AP1302_SIP_CRC, &crc);
+	if (ret)
+		return ret;
+
+	if (crc !=3D fw_hdr->crc) {
+		dev_warn(ap1302->dev,
+			 "CRC mismatch: expected 0x%04x, got 0x%04x\n",
+			 fw_hdr->crc, crc);
+		return -EAGAIN;
+	}
+
+	/*
+	 * Write 0xffff to the bootdata_stage register to indicate to the
+	 * AP1302 that the whole bootdata content has been loaded.
+	 */
+	ret =3D ap1302_write(ap1302, AP1302_BOOTDATA_STAGE, 0xffff, NULL);
+	if (ret)
+		return ret;
+
+	/* The AP1302 starts outputting frames right after boot, stop it. */
+	return ap1302_stall(ap1302, true);
+}
+
+static int ap1302_detect_chip(struct ap1302_device *ap1302)
+{
+	unsigned int version;
+	unsigned int revision;
+	int ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_CHIP_VERSION, &version);
+	if (ret)
+		return ret;
+
+	ret =3D ap1302_read(ap1302, AP1302_CHIP_REV, &revision);
+	if (ret)
+		return ret;
+
+	if (version !=3D AP1302_CHIP_ID) {
+		dev_err(ap1302->dev,
+			"Invalid chip version, expected 0x%04x, got 0x%04x\n",
+			AP1302_CHIP_ID, version);
+		return -EINVAL;
+	}
+
+	dev_info(ap1302->dev, "AP1302 revision %u.%u.%u detected\n",
+		 (revision & 0xf000) >> 12, (revision & 0x0f00) >> 8,
+		 revision & 0x00ff);
+
+	return 0;
+}
+
+static int ap1302_hw_init(struct ap1302_device *ap1302)
+{
+	unsigned int retries;
+	int ret;
+
+	/* Request and validate the firmware. */
+	ret =3D ap1302_request_firmware(ap1302);
+	if (ret)
+		return ret;
+
+	/*
+	 * Power the sensors first, as the firmware will access them once it
+	 * gets loaded.
+	 */
+	ret =3D ap1302_power_on_sensors(ap1302);
+	if (ret < 0)
+		goto error_firmware;
+
+	/*
+	 * Load the firmware, retrying in case of CRC errors. The AP1302 is
+	 * reset with a full power cycle between each attempt.
+	 */
+	for (retries =3D 0; retries < MAX_FW_LOAD_RETRIES; ++retries) {
+		ret =3D ap1302_power_on(ap1302);
+		if (ret < 0)
+			goto error_power_sensors;
+
+		ret =3D ap1302_detect_chip(ap1302);
+		if (ret)
+			goto error_power;
+
+		ret =3D ap1302_load_firmware(ap1302);
+		if (!ret)
+			break;
+
+		if (ret !=3D -EAGAIN)
+			goto error_power;
+
+		ap1302_power_off(ap1302);
+	}
+
+	if (retries =3D=3D MAX_FW_LOAD_RETRIES) {
+		dev_err(ap1302->dev,
+			"Firmware load retries exceeded, aborting\n");
+		ret =3D -ETIMEDOUT;
+		goto error_power_sensors;
+	}
+
+	return 0;
+
+error_power:
+	ap1302_power_off(ap1302);
+error_power_sensors:
+	ap1302_power_off_sensors(ap1302);
+error_firmware:
+	release_firmware(ap1302->fw);
+
+	return ret;
+}
+
+static void ap1302_hw_cleanup(struct ap1302_device *ap1302)
+{
+	ap1302_power_off(ap1302);
+	ap1302_power_off_sensors(ap1302);
+}
+
+/* -----------------------------------------------------------------------=
------
+ * Probe & Remove
+ */
+
+static int ap1302_config_v4l2(struct ap1302_device *ap1302)
+{
+	struct v4l2_subdev *sd;
+	unsigned int i;
+	int ret;
+
+	sd =3D &ap1302->sd;
+	sd->dev =3D ap1302->dev;
+	v4l2_i2c_subdev_init(sd, ap1302->client, &ap1302_subdev_ops);
+
+	strscpy(sd->name, DRIVER_NAME, sizeof(sd->name));
+	strlcat(sd->name, ".", sizeof(sd->name));
+	strlcat(sd->name, dev_name(ap1302->dev), sizeof(sd->name));
+	dev_dbg(ap1302->dev, "name %s\n", sd->name);
+
+	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->internal_ops =3D &ap1302_subdev_internal_ops;
+	sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->entity.ops =3D &ap1302_media_ops;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->pads); ++i)
+		ap1302->pads[i].flags =3D i =3D=3D AP1302_PAD_SOURCE
+				      ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+
+	ret =3D media_entity_pads_init(&sd->entity, ARRAY_SIZE(ap1302->pads),
+				     ap1302->pads);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "media_entity_init failed %d\n", ret);
+		return ret;
+	}
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->formats); ++i)
+		ap1302->formats[i].info =3D &supported_video_formats[0];
+
+	ret =3D ap1302_init_cfg(sd, NULL);
+	if (ret < 0)
+		goto error_media;
+
+	ret =3D ap1302_ctrls_init(ap1302);
+	if (ret < 0)
+		goto error_media;
+
+	ret =3D v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "v4l2_async_register_subdev failed %d\n", ret);
+		goto error_ctrls;
+	}
+
+	return 0;
+
+error_ctrls:
+	ap1302_ctrls_cleanup(ap1302);
+error_media:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static int ap1302_parse_of(struct ap1302_device *ap1302)
+{
+	struct device_node *sensors;
+	struct device_node *node;
+	struct fwnode_handle *ep;
+	unsigned int num_sensors =3D 0;
+	const char *model;
+	unsigned int i;
+	int ret;
+
+	/* Clock */
+	ap1302->clock =3D devm_clk_get(ap1302->dev, NULL);
+	if (IS_ERR(ap1302->clock)) {
+		dev_err(ap1302->dev, "Failed to get clock: %ld\n",
+			PTR_ERR(ap1302->clock));
+		return PTR_ERR(ap1302->clock);
+	}
+
+	/* GPIOs */
+	ap1302->reset_gpio =3D devm_gpiod_get(ap1302->dev, "reset",
+					    GPIOD_OUT_HIGH);
+	if (IS_ERR(ap1302->reset_gpio)) {
+		dev_err(ap1302->dev, "Can't get reset GPIO: %ld\n",
+			PTR_ERR(ap1302->reset_gpio));
+		return PTR_ERR(ap1302->reset_gpio);
+	}
+
+	ap1302->standby_gpio =3D devm_gpiod_get_optional(ap1302->dev, "standby",
+						       GPIOD_OUT_LOW);
+	if (IS_ERR(ap1302->standby_gpio)) {
+		dev_err(ap1302->dev, "Can't get standby GPIO: %ld\n",
+			PTR_ERR(ap1302->standby_gpio));
+		return PTR_ERR(ap1302->standby_gpio);
+	}
+
+	/* Bus configuration */
+	ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(ap1302->dev), NULL);
+	if (!ep)
+		return -EINVAL;
+
+	ap1302->bus_cfg.bus_type =3D V4L2_MBUS_CSI2_DPHY;
+
+	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &ap1302->bus_cfg);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to parse bus configuration\n");
+		return ret;
+	}
+
+	/* Sensors */
+	sensors =3D of_get_child_by_name(ap1302->dev->of_node, "sensors");
+	if (!sensors) {
+		dev_err(ap1302->dev, "'sensors' child node not found\n");
+		return -EINVAL;
+	}
+
+	ret =3D of_property_read_string(sensors, "onnn,model", &model);
+	if (ret < 0) {
+		/*
+		 * If no sensor is connected, we can still support operation
+		 * with the test pattern generator.
+		 */
+		ap1302->sensor_info =3D &ap1302_sensor_info_tpg;
+		ap1302->width_factor =3D 1;
+		ret =3D 0;
+		goto done;
+	}
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302_sensor_info); ++i) {
+		const struct ap1302_sensor_info *info =3D
+			&ap1302_sensor_info[i];
+
+		if (!strcmp(info->model, model)) {
+			ap1302->sensor_info =3D info;
+			break;
+		}
+	}
+
+	if (!ap1302->sensor_info) {
+		dev_warn(ap1302->dev, "Unsupported sensor model %s\n", model);
+		ret =3D -EINVAL;
+		goto done;
+	}
+
+	for_each_child_of_node(sensors, node) {
+		if (of_node_name_eq(node, "sensor")) {
+			if (!ap1302_sensor_parse_of(ap1302, node))
+				num_sensors++;
+		}
+	}
+
+	if (!num_sensors) {
+		dev_err(ap1302->dev, "No sensor found\n");
+		ret =3D -EINVAL;
+		goto done;
+	}
+
+	ap1302->width_factor =3D num_sensors;
+
+done:
+	of_node_put(sensors);
+	return ret;
+}
+
+static void ap1302_cleanup(struct ap1302_device *ap1302)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor =3D &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ap1302_sensor_cleanup(sensor);
+	}
+
+	v4l2_fwnode_endpoint_free(&ap1302->bus_cfg);
+
+	mutex_destroy(&ap1302->lock);
+}
+
+static int ap1302_probe(struct i2c_client *client, const struct i2c_device=
_id *id)
+{
+	struct ap1302_device *ap1302;
+	unsigned int i;
+	int ret;
+
+	ap1302 =3D devm_kzalloc(&client->dev, sizeof(*ap1302), GFP_KERNEL);
+	if (!ap1302)
+		return -ENOMEM;
+
+	ap1302->dev =3D &client->dev;
+	ap1302->client =3D client;
+
+	mutex_init(&ap1302->lock);
+
+	ap1302->regmap16 =3D devm_regmap_init_i2c(client, &ap1302_reg16_config);
+	if (IS_ERR(ap1302->regmap16)) {
+		dev_err(ap1302->dev, "regmap16 init failed: %ld\n",
+			PTR_ERR(ap1302->regmap16));
+		ret =3D -ENODEV;
+		goto error;
+	}
+
+	ap1302->regmap32 =3D devm_regmap_init_i2c(client, &ap1302_reg32_config);
+	if (IS_ERR(ap1302->regmap32)) {
+		dev_err(ap1302->dev, "regmap32 init failed: %ld\n",
+			PTR_ERR(ap1302->regmap32));
+		ret =3D -ENODEV;
+		goto error;
+	}
+
+	ret =3D ap1302_parse_of(ap1302);
+	if (ret < 0)
+		goto error;
+
+	for (i =3D 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor =3D &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ret =3D ap1302_sensor_init(sensor, i);
+		if (ret < 0)
+			goto error;
+	}
+
+	ret =3D ap1302_hw_init(ap1302);
+	if (ret)
+		goto error;
+
+	ap1302_debugfs_init(ap1302);
+
+	ret =3D ap1302_config_v4l2(ap1302);
+	if (ret)
+		goto error_hw_cleanup;
+
+	return 0;
+
+error_hw_cleanup:
+	ap1302_hw_cleanup(ap1302);
+error:
+	ap1302_cleanup(ap1302);
+	return ret;
+}
+
+static int ap1302_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+	struct ap1302_device *ap1302 =3D to_ap1302(sd);
+
+	ap1302_debugfs_cleanup(ap1302);
+
+	ap1302_hw_cleanup(ap1302);
+
+	release_firmware(ap1302->fw);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+
+	ap1302_ctrls_cleanup(ap1302);
+
+	ap1302_cleanup(ap1302);
+
+	return 0;
+}
+
+static const struct of_device_id ap1302_of_id_table[] =3D {
+	{ .compatible =3D "onnn,ap1302" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ap1302_of_id_table);
+
+static struct i2c_driver ap1302_i2c_driver =3D {
+	.driver =3D {
+		.name	=3D DRIVER_NAME,
+		.of_match_table	=3D ap1302_of_id_table,
+	},
+	.probe		=3D ap1302_probe,
+	.remove		=3D ap1302_remove,
+};
+
+module_i2c_driver(ap1302_i2c_driver);
+
+MODULE_AUTHOR("Florian Rebaudo <frebaudo@witekio.com>");
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_AUTHOR("Anil Kumar M <anil.mamidala@xilinx.com>");
+
+MODULE_DESCRIPTION("ON Semiconductor AP1302 ISP driver");
+MODULE_LICENSE("GPL");
--=20
2.7.4

