Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F567573E9B
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 23:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237352AbiGMVMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 17:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237335AbiGMVL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 17:11:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A120233369;
        Wed, 13 Jul 2022 14:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8v+0GrZjLgmPurdxOjyL0uXAlCCCHRrU2+YvKYeBk/I4xjcutaeArqtvtwRpDF3ezdq+FTkNtcBAW8qooTPRYkvpi72ZApQf6Tai7OJ/f5iz+IjA5SgnNDagRNA8D7WZGtdN9V+hcWfQ4jJOMRPH+NW7vrRTN+Wx16kp5j8b+bsicHdgeFvryiSoSnd9CFYvZWGRwnwnXzI3tZIIBenVxHeL+0aeXeXushoQYNmDqnzC+y67IQJBFpmUCiF1x4MvAVQ/m170hT6SDDWLISNm1pTTZVmeMMV3yvmybMcu01XqgfkjcZXWAK03kWPjnNmR50Z/AP3RHQoFvkOPYVqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXAAGNfrNiSMxe/ey4OTDpi0XLzQaqJVF9QrNOOgtV8=;
 b=DD2SfqkTRC6Qd1U3qwhRx18gUocW8rc6RNF6adsHz00KlZjeKll4jLsffPMhboY9qkRKVQL3WE+lzXinTxghe1gKMC+0pf/vfYWBxbCViw8spiVasfNnmgseyepcjwp9yU4xWLibfWu8VUYWjKbKZNAqab09gCLQc1Abvx18Fu4NR2dzam6Z7IPZkaQ15xRug5xEo0Kcj4xASGq05F10kxUDoNOlrwoqcB9S+Ln4MmqTY0wOfKJizGbWJ7Y5gIx9yZJ9CQhmW5A8T1FHBsprvAboksiaq/g6D7lCcRIFrD3Ps5x2GYss0bm3B7aqDrFCi8tqbeY7tPjINysPMHBU8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXAAGNfrNiSMxe/ey4OTDpi0XLzQaqJVF9QrNOOgtV8=;
 b=i79IPgH1BQgAPMLRTJNe45PdDqtdN1Nr1FObR+koOSme+dzf/aJn3bHmhCXBxafYHAIGzsEdd0JOTMwn4VyfWxzXAlNw9gX1bz0tk6zoh/Joo4fsbkHkXyIMVP6kLB84mxjdVZyigdS0m5jLcsemS2YLViJnWIPB3iHq1slfZMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:11:55 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 21:11:55 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 2/6] media: v4l: uapi: Add user control base for DW100 controls
Date:   Wed, 13 Jul 2022 23:11:20 +0200
Message-Id: <20220713211124.2677275-3-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
References: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b5a92e2-3a28-4252-7ff2-08da65145075
X-MS-TrafficTypeDiagnostic: AM9PR04MB8874:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVjYj40Fw4xQT0sK5Ib0gZM57X81MZGE6MrNTwWe3RhmuN/aogT9ogflP0Dpru1PR/ZFhOYlWGnOhkPvGu58cnUWej/SbSkQiNhZ8nG3w8B1+P5GRkMrtRLELEXTJoCuv7000kQMZZIIfZeJedwKnIWeG0W4sO1aY9g1TzWKUXWJtJ2FjM+nRg2wEZEISjqZ2V94oQY0M5Wf56497lDOUCLcCIV3/obVhSyDJfjFat1M3dRLVCLluooNIKDKU64PywDm0YFz/a2eTCthY+s2dnzHTtCCnR+ieHNzpvcMj2lFIhNX7YY2ljuozRkmEjBAvbh9CebFo8f8GVa3kVZVK5coTUyttJdK8A1sUgCtOnZHMtA7TyFEY+//emSVFZaS+n0+xAHgRs8hrH5o9X4Hhy2wGJCD8SfeJ5oxPVNuC8awoJx4G6G9EeQVyZpboIbFaNKaUTP4E/KYXmH+dXjYfCQLQbjqjsi5FJtiKNo39Mi9MIigWnIlAHvv4afr47VgDmo/y+7C0x3srxmxKnnUJjyvCMP4Q6KqN+Nw6OHV7w1lv2WEAVGJWCLVsww3srk73ISE536pDgV0lXX44/Q6rNQHxDcR8XQyVNJ0tpWN+2acNtR6spTTwhBRBFK3cv2+prLqFeQG2IuvxxOv876Tc1P2y+We9+iu2u46HWiTQwCVi2/FAUd3BGLFz7TNOuZlg998rmxGXNZUQlW4/fXMttNbuXoblxwsB9Brkd8cqoKXfV2lz0T+szRpPdw2e7nQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(41300700001)(8936002)(44832011)(7416002)(186003)(4744005)(5660300002)(2906002)(6486002)(6666004)(38100700002)(4326008)(478600001)(316002)(52116002)(66556008)(66476007)(8676002)(6506007)(66946007)(2616005)(6512007)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yYyMnjBarPvKIW6sudqJhiOHLpNGJVmGWyqwRTV+732MJTgB05I6O/cJfbxt?=
 =?us-ascii?Q?EZc8J8Gn9al3bAiT8rWh0A5KvslJDn6puWTFaHCJYQhz3RrsMvF+Uoj/X3dR?=
 =?us-ascii?Q?mqq83cmTyziTQoXFJpt2McjwB7PYhl8RvMMOcJ4fmq+aPgLjo7mKswoPz6RS?=
 =?us-ascii?Q?9KfcVEvdSJm+ILD/yL904pGDNx8Nv95G9S3p135DZANXP7m1nxmq9DCDpfzo?=
 =?us-ascii?Q?6Iv3Q+rqSXUdYmDvovkS1E7PCxkRYRcOSOXqrOXJsEM1oGoFa8HuKGUGyNCs?=
 =?us-ascii?Q?4H9B0pVhZKJWwPB3TRMtJYr9OdSs1s72mN8ugeFLi2jH0hxgPx3+nvOoJf/L?=
 =?us-ascii?Q?+iLiWoHFKqWgB2QkInD4i+RySpb6Q4d5ZfM8Ktub8HIwfgeutnod9kXhN3Xy?=
 =?us-ascii?Q?73KHojlZ+Fs7c/LZWi6AovRdRllpeklWgnUguohg0s1PiczOPFjhRJKVZbju?=
 =?us-ascii?Q?q1D0VvErPTCM1fRwpYFe00f8fSUve8XRG4uCT2loC7idqJUBz4wTRcwfL1JY?=
 =?us-ascii?Q?uoxkHX9kSzVMPGVXh+0yds8YLPDto9lV1O5TBPxnaWvrHnnuOc4jFS6FfQ2N?=
 =?us-ascii?Q?uJh0XmYFVBjPKScutd1IdTtjCav/A4cs8Mjw3hj71FC4Clb2B5TyW9JPrbeN?=
 =?us-ascii?Q?qoPCHDsRbpOGM1DJXD/oibNnubCeOCnLlAv7z3WT8k+k95ngaEli8nm2Aiy7?=
 =?us-ascii?Q?+G2OA97wTFU39rgOWmIxOzf839gyN0eEw4xK8Gw/xD8iinQJfB8nTuH+vC1C?=
 =?us-ascii?Q?9yri6avAsInpggCdkMWwVTPkUKJ8YO8c387n3w72c7YOzM8/0Ldtfdalqp4W?=
 =?us-ascii?Q?L/BtLzp2GtcFCdy9984F4bshDQFYEJ+L0kOw8f3qXUFZqff4RBCHm2dbD3/9?=
 =?us-ascii?Q?8YrodXokESwE3GsPt+eUvvxQahBh3b5hPfYt6mgxGz7H0EZde7pkF8dPYEn3?=
 =?us-ascii?Q?3SrC+EUIjVBAs1RG1DyX/yKK8P45K7jNRg75/av9B6qyrwavhecefvbS/p14?=
 =?us-ascii?Q?I2RhrphzvVzKYMw4Y1LeSIvzlEMjK1Y5kYmfz8LEjgB2/QfRj2IEEd8EPyWm?=
 =?us-ascii?Q?PXL/aXfMOvSD/OQQ0wQg45SzjTnP6y/AFDJpUZu439LtAxpfS3Udid7xJcjF?=
 =?us-ascii?Q?HwWlTk3heAZrQss9mc/RTyCk2VYkbTdwagWP74nTBabalfNwM/YRYBXzZEv3?=
 =?us-ascii?Q?P/Ypwm868WCW1xotSjNItrYxXduw66tsh2/cxzDaUFqfTlpNnj4rdkN4jLhr?=
 =?us-ascii?Q?52vwLrLcA3ICnBhsi1vxHoXJOmh/oXhFuw6A0U87dwBZ+k5iFjElsbajYtHi?=
 =?us-ascii?Q?5iTzYnEbMpzsiYzlNPKnWa+widqkxZjWGu870MPcucUZdjBY+F8zO9AAJcSD?=
 =?us-ascii?Q?1ijhVF2yBcBNhKk7r3NJ1sHl6LDU1+Gwk8XFXmlFcLaRwCPBj53QUlL8KS/Z?=
 =?us-ascii?Q?yHuffJs+aej+GgatX7sBQqM78Nn8SLK//dF74JUDe3rJI+W4AsOBMixITE4v?=
 =?us-ascii?Q?+/n48ApO345Y/r5bSZ6+bhszNx9iYL6v4ndYTpeDdrgJrEtQcars4SwiYW70?=
 =?us-ascii?Q?46xvxfxjYoale173o8htoDPBcTp4Gr6borhoKwsfVwjxtEloLmmdVcl+IG3v?=
 =?us-ascii?Q?DmKT4UJkgCzxDztyGbplwWH0ekYd0qZ8Qx84pBg9ECKD47eV23O0JRbGKT4i?=
 =?us-ascii?Q?NQIJVg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5a92e2-3a28-4252-7ff2-08da65145075
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:11:55.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUCnGpFlky8z2EyNCZ+1/MO/rjJwqhLn2fQSe/80+Bl4dGWG9WTv5rpiptPzcZrUD/Lksb8JfVqP//EwZZC67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control base for DW100 driver controls, and reserve 16 controls.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index dfff69ed88f7..0b26ebd6ca78 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -225,6 +225,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
 
+/*
+ * The base for DW100 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.36.1

