Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEE33AC5A8
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 10:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbhFRIFH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 04:05:07 -0400
Received: from mail-eopbgr130082.outbound.protection.outlook.com ([40.107.13.82]:34075
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232215AbhFRIEG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 04:04:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY6bEtwndIUjZ1F/rr/yw8gOsJcePbm0WLrros/7FKfEOtIauQ8j0TbhnZl/o3qXgvnWOL8wXKCWj9vCsSRx8yJzcZm09kHV7S3kYVO69gwIM0wFn3SU1QvdgyziAilgc5pxM4gIng7gCIXMy9GhNWt7DEEuwNwX6ZHbT15m4x+DPd5onbKiJAXwpIVMVkpxBRgJyQKz9nEZjFuz3UtV0peLGwUJXlj8/N8Zu9Y38qJBnAaIZsO61f4NAHOZSTk5v3AqpySg2Kln3+cAh/KhwuuFljECE6cTkhw3Tig7aCy4m5SgYhd5/mBwLg/Y+REmk+G5p1OA53pPKQYF/8LD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTOl5u03mTOwOYzWaYMu8igMSE3IwXpLVdVYyakLPR4=;
 b=ihhTxaHJRaF7rGw0CV7TwKrhOPdXsKhHPisv+nQ/3Chqe9t05QuVECJ20uiNmSnSkhxVMi8S+2Sdp61vjiv4kMqowLV0j22ntiUNBCyqn2awyRbYy+ZPPlfuSdh4YKyCCrVg5UPuOacsjm/4K3D3KdzZY+d6sfSY+57H2pm79CH9NviNiva51Mw8VJkcE4laqyojfLFE07MX/hYGhK3B8v2XEkObUqLMX1DJkh3iq0EU4xr2CiUiKoVf6RshzWp+wBk7MyVE9A+v1ssnYX9NZ7UqNZEAKxXABdk12v4rzA5lWB4qaVSrOpsGLcejnErzxfthaSnArgvGJhGzsLlN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTOl5u03mTOwOYzWaYMu8igMSE3IwXpLVdVYyakLPR4=;
 b=i79dx+Zmb5AGsG3qCNi7WUGWP++ruDf6niqy4HU5zvXS4qzVn2SWL1tBr7UH9MRzbIcB/8H/0Rp3Q2UVgDNLdFH51hqPPrT5cv50rDuVeOTmMuZeo3tWS1X7RK17YUIjMsvxUHG2obIdi8G8u9q1B7EciaUWQ1stAxQr7wfhBik=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 08:01:54 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::644c:a396:7963:df51]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::644c:a396:7963:df51%7]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 08:01:54 +0000
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH] media: ov5640: Complement yuv mbus formats with their 1X16 versions
Date:   Fri, 18 Jun 2021 09:59:33 +0200
Message-Id: <20210618075933.915202-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a01:cb1d:b1:7700:855b:c18c:d8e4:d38]
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sopdpuamd01.home (2a01:cb1d:b1:7700:855b:c18c:d8e4:d38) by PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend Transport; Fri, 18 Jun 2021 08:01:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f396bf2-3512-4cb5-f33c-08d9322f5623
X-MS-TrafficTypeDiagnostic: PAXPR04MB8640:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PAXPR04MB864081B79B47CB2EB2DC4FFBBA0D9@PAXPR04MB8640.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZzV49mYA2H/ZafDmmvovTfU8STkkl3XoeQ/5+AwzjM3X+zAIOXyY4oyDbjycD9SFzDdNiRmtTH1+bjNWASpglUNrOi6tyeWimc0XkxFLMsUe9amTMuBXWGLMRzV1SiL2TT4lRxX7Fzq0BNy9uDVk3En7vQnuz6Ra+R1Eg1+WMoNwK8pEv+LQsSjilvpucXkKpfLu/jEcr3YxtMcLA4qdAP5e86hjRUkYjiKVR4X4Ch6n071UI4ojJNBkOBPd7sZukvlaX0uxb8CSbZgRITHnt5R34ED0Rfro9ivHB6B3Z9r8OL5Fu1IRpnUYCm3LtmxVSh3GMdqfGtEO1NWE3biLhz0DZ0AMxG/534StyyR1PNUEiIBhwOTNY9L7YHyIVFapD5UBIG7QtGHbGVDkHW7HXL/KTl1Q2QGykzjxXw36sAoTrdtRbz7T/fsGuQaRBioUilFxgJRVUzZYQ3IVNxDmeaogmUNF5Klt1LKEUZqylKr0DM67W97fg5b4NIZruVszp3J85p+LWpo8Qhg7wdBLpDMMDfnKp22M0+kpOIugp0Q3cpqDgwCD4qnXCz/+RvITCCret99DRAp0m2IxE9nsqswL/tLmLfPLXu2LWFnjJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(2616005)(478600001)(52116002)(8676002)(6512007)(8886007)(5660300002)(4326008)(2906002)(38100700002)(16526019)(186003)(316002)(6506007)(6666004)(86362001)(110136005)(66946007)(6486002)(83380400001)(8936002)(1076003)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CaTYKmzzKXD3NdCJrskqL2VmVf6LByL+LvlnlgxqxbN9+XVR3ahfpuoj9UbY?=
 =?us-ascii?Q?3XkPHjVVi6X2tcmc7ODS7LDfhB1Z/FWFDNndg/MVy3Xhf6hkh3JNgcRLE8zq?=
 =?us-ascii?Q?IMBqQjNPZ9MXXs4NIhIKh6jmZGLcfISe+2NfIvZ1FOol34mAMa9wxCr4gxWP?=
 =?us-ascii?Q?E5PanLJnW9sJJDVh46KvWFmOJZOTSPG/qLSQ2BSDy+JeobGrWWsLzDoHG8xC?=
 =?us-ascii?Q?a/f1Ko7DGe9N+IJ0DktBZ7J/ssz+U2bKywrpzJDfMqB8aa2PTpljvByo/0hq?=
 =?us-ascii?Q?R4Xs8VhL0iQbXq2sqrJiOnTXjB6XPZlY5nRZEyI9nlO331IuIVwx1EbDwDQL?=
 =?us-ascii?Q?MGcjzFYkcMIh88w0EK4PIBbLEXSVgMCjWqYyMm72SEGOYAhzbJ09SvygNpN0?=
 =?us-ascii?Q?fe6JIa+JIHEFWBasJ/k+x5/CNV5KRoWPB9k3yhzIOqSpWt1ODdkuyytR8V18?=
 =?us-ascii?Q?JA8ZyZfofe/WnVHl8FrjGhHLZwykuRPdk0ghKrxgk3rPoKSiUeUqyY7u5CvT?=
 =?us-ascii?Q?IyKoaUlS9uW5EeKrBAr1wclYrA4MlH4bFgbzsR5iy8RShCi8pHxulnK5bzRW?=
 =?us-ascii?Q?Oym7mi2bpnrc2WhM4CIFEQGxsW4Sw4SOaO2E8V4TqDUMcoO2c4fq5Pp2MRtP?=
 =?us-ascii?Q?xTMu/SXeyWreQ4opQMS2xuRMw8FyzHsRQdWW3HJRoPCfFure4uhXfpLPWsi4?=
 =?us-ascii?Q?ocjCLew8CXtT34/mhvxGpoj4Vg4a9VWPdDqrxRmbnq9URgntQgqI25pIAMlN?=
 =?us-ascii?Q?SjuBtTMJ2pOYysc8X3hbbadkR2dxMZVbfe8zCz1152n41whOvOr2+R9pDg+d?=
 =?us-ascii?Q?ZKqX9LgReWfosnzVJcXPmr/lkvtcuoxuSc4/HE33cFrES3k44sagwLVrjXYk?=
 =?us-ascii?Q?g5o6PP4pA9FmpQDPLSz+uPpNwxpxNt5bLOXmS0i2FwvkQN3S0KQOHajzEbWn?=
 =?us-ascii?Q?JVNQSADSbhy8HpNBlgI4SeItdVs4+LnHixsgdewH2SAJcAhE64hCSNL66edq?=
 =?us-ascii?Q?khGbYZyrlfQoSBlh+GE4sa1AJluspr+vmK7m5qCOwbNo7vUft3zVl1U260yL?=
 =?us-ascii?Q?zgjeF/YlHsgaGB9OmSp+xTwxipzipOT8X57nLpEuF3itGnvIa45bTK+ltzUR?=
 =?us-ascii?Q?vuzuC6C1T9KQpcRsgLxegn1gG0h+p5a8FLwL8Gt/Zz3YrJ5cBYC/L4F+Cj19?=
 =?us-ascii?Q?tlkxIjGEG7nwJzGHiNwwB3hJ/GZ6/2PI8dcM4X3njF/V6gXEPbnVLpiMpVG6?=
 =?us-ascii?Q?O+xoDWmz08ZGsoDMjLDAxTb2ufEtinyNvjpZyhz0MKpM7J/R0pJsYzjFF7PW?=
 =?us-ascii?Q?Wdi+xihrbv4mDKj6PjCnCzXmzbw2aBBzbpzn0+e7Bdc4HzPDNEu5y4AkbmSw?=
 =?us-ascii?Q?UFQg8jazLMZRhNAq9ZsiotPZo0xk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f396bf2-3512-4cb5-f33c-08d9322f5623
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:01:54.2571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGzrm/sJGUsV91Ol2XpT1sg7T0SKvpoij13li6AY2quvu28BHNi86HAyt8soNQHkiiqQv41Q0cvk3J8oBjeO5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Xavier Roumegue <xavier.roumegue@oss.nxp.com>

According to media bus pixel codes definition, data formats on serial
busses should be described with one bus sample per pixel.

Documentation/userspace-api/media/v4l/subdev-formats.rst states:

"The media bus pixel codes document parallel formats. Should the pixel
data be transported over a serial bus, the media bus pixel code that
describes a parallel format that transfers a sample on a single clock
cycle is used. For instance, both MEDIA_BUS_FMT_BGR888_1X24 and
MEDIA_BUS_FMT_BGR888_3X8 are used on parallel busses for transferring an
8 bits per sample BGR data, whereas on serial busses the data in this
format is only referred to using MEDIA_BUS_FMT_BGR888_1X24. This is
because there is effectively only a single way to transport that
format on the serial busses."

Some MIPI CSI receivers strictly obey this definition and declare
support for only *1X_* formats.

Hence, complement the supported media bus formats with their 1X16 versions
(currently applicable to yuyv, uyvy) to enhance interoperability with CSI
receivers.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/i2c/ov5640.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5b9cc71df473..9eb3ec5f93b5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -135,7 +135,9 @@ struct ov5640_pixfmt {
 static const struct ov5640_pixfmt ov5640_formats[] = {
 	{ MEDIA_BUS_FMT_JPEG_1X8, V4L2_COLORSPACE_JPEG, },
 	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_COLORSPACE_SRGB, },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_COLORSPACE_SRGB, },
 	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_COLORSPACE_SRGB, },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_COLORSPACE_SRGB, },
 	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, },
 	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, },
@@ -2338,11 +2340,13 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 	u8 fmt, mux;
 
 	switch (format->code) {
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 		/* YUV422, UYVY */
 		fmt = 0x3f;
 		mux = OV5640_FMT_MUX_YUV422;
 		break;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_2X8:
 		/* YUV422, YUYV */
 		fmt = 0x30;
-- 
2.31.1

