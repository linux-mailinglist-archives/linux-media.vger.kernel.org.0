Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 006BB39D7A7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFGIpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:45:31 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:21122
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230313AbhFGIpa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:45:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxOGTiXSX5wc9kdfEcmB4xrmKnpIkP0Ra+q967vKsbx7h6IrSME0NIwSJicaVb/xdR2QazFhegYxQU6BUI73USVrkjPRiFXxCZULoBB3P3bw6Adh6+y1vJ5eOU7ZeISDbPeKKlQP1MYmaA8NMUtNrVk13IZ7t8rtInngwyuRk3sFG8mO1lEW9ZfRTKPjZQKyCLzQoCmmO7jxj9BwlQBLDrONP+TdKysUQ5pF9l71upbygR29j4xRF7kYJavL+coLdoJv6/KpcLwTyLxAjWSm8tJueb7bNcDRgSAHYpVmGxaaxDiPGbn6ufeCMn9vBTYCewcOTLXxicMKfvOewJj8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuQ9QP8tzWwYiM47RQl4AGrnggktDCI01VjB9V+qHZk=;
 b=MZqZdvKZV2pPJ8s8Fw13c2SC7ofphSYWkTesfCXGfxBDE5lqEWgyMitFgsF7InXtnthFG016cvNUKPeXd2kLymqnf8kshT/VW1usvlVj7Wg7eIBYG9FYisL344v4PZig81LoY5mAPrL5AiJ6RRt3muR9DGF2vKNM47TGxbww3t8/xNIl+pAyUzbslAnyRcth4NJm05HC1i6CNwkvJ/+toPoTnCBCtMWtUEWJBlPhoLBRjFRc6qZefhc/xi5UTsUPGhxZtJ5Nga1AiJhxEjrTjRMtoSBkAvC0ejMiWKqEzhTjJ2cy5J1iyq2fw5GzNFTXoRgeJnZ0tKc9splRBHjmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuQ9QP8tzWwYiM47RQl4AGrnggktDCI01VjB9V+qHZk=;
 b=AeMCxdHiJEjiaSUjyjBoO/hGC1BxgMTu7a6Kv3KD07NVfTn9GmlBvMqJz7Rqx/j7HBZlQJ1guKi9bTFQUzPo2KYWShif2JHDJYtrtKAwMhXfo/QcScoYxrY+axNyyqAU04nojPlm/6+i+5EL07pNAWr6siiW23W2Mxh1CHrw99I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Mon, 7 Jun
 2021 08:43:36 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:43:36 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/13] media: v4l: add some definition of v4l2 colorspace/xfer_func/ycbcr_encoding
Date:   Mon,  7 Jun 2021 16:42:49 +0800
Message-Id: <91be725ad5f2f21713aac60a9b5a65f20ef2cd5f.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623054584.git.ming.qian@nxp.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ab08937-733d-4f79-a880-08d92990574b
X-MS-TrafficTypeDiagnostic: AS8PR04MB8199:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB81996350475F1C4305985DE8E7389@AS8PR04MB8199.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2oannPobcjLyZ1wBs7A5s32JV7y3jasLwQMpD4JOswxQ4JRAZ1pL4YlaVJ+z/anfsW7cduPgLviSOQXrAC2Yb865SeHDhYQPYEYH8A+P47gmCqCz7WHjBxxhXh2OiopoIsAxUPymMsoQRy8rmqh7bPQ6KDII96Y1gkzralQMQWHzlIBzuAKUvnQRzVwsPpETfbgLw2Qq8p7WE32ZBk35YMdwWPokC41Fb0hbt8qBhKvHt/hmp7Xp5wgi/EHRktamIK5PvKPvVzbEHlAPmnGoV4mJmYS3C0zkH3DMpbDLU6vNDKAaAIBmFVFUVPOQFdFWaKOhS8bN95l0F8W7DurQe6+RbNBvmxP49RhLoxE+IjqWvgbhAmeuaslvmVvAvi+bYspem91RfunUbUNcOAmGg1SAx/wO4VdPmiDetmsPfbTYL/XJ/QPBCb2rQlVZ+9cvo/+bDYJPb+cHCmRZgKfd4o9uNT6LkwH5Z01Uvzt6DgT22asltXP92kZGNo9tVPXh4NiOV1Xio6H/8j/SDRnPviq2yPShy7T+Hp0hcGrq59YVaYcvYVocfdVTxxIMRg7w2iYF1/o5VkF5+hRek+jtCYioC88pVHcyBW2qzqHT9+79bZ2jK3MXlmZirWr7gT6levs89/XmskU78rP0wwI862tw5FsJgn5ZASBKIAGAnyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(2616005)(956004)(2906002)(38100700002)(38350700002)(8676002)(44832011)(36756003)(7416002)(6666004)(8936002)(478600001)(66476007)(4326008)(316002)(66946007)(66556008)(7696005)(52116002)(26005)(16526019)(186003)(6486002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H7v6Q6q9vjRTIurUkGDXpW8z4zsQNi0u8Po124H+Qfp/iSs85UHwYKv8dm/0?=
 =?us-ascii?Q?yB+Dz7eE1DQ6SejTRM5yRfC/I3lyHrP4AniI75kbigRhSzBIOQj++7XZDSBO?=
 =?us-ascii?Q?cxxByMznEQPiki9nw23CP427y07YjU31+DUk9+XjwXs/CPqzpCeX/A9JV7gZ?=
 =?us-ascii?Q?fuPxhuf+P5tX68Ct9+gTqh+Z6v6gOD5bvdSGj90RZ4caf80jTyh2p21LSs7p?=
 =?us-ascii?Q?+gbhbgsMwM8zr3e8KmJ88p4xmUnHAgCGlVoz94obEx+dUHGvelODEZpYZfyP?=
 =?us-ascii?Q?/aoE+0PAVQcBlsutwJuUHxNKSC3RiOm23KxOAEqxM1te6Wq/INGH0Zd7TcST?=
 =?us-ascii?Q?fxfpbJEexK78vdEGhq8OiJU5tOxc6Sv2FF6TvNqNAj0vqKnBdZ8MY9V5faot?=
 =?us-ascii?Q?VB7kNPWDxS+ouFmz3MvLf6INLlgKAYKdUjkqBvMdRyc/3YuTUdueurVFi7Ti?=
 =?us-ascii?Q?aAgWFliXksXMwKU93DtG+bgK8zoCV0xnKSUcMj1srJQgRnyAOm2HFJw+80gR?=
 =?us-ascii?Q?/7gRfwLKdIw/zx5ptRiXDcyzY6fX7VuN/3L5J2xC1rQIA69h9uZCaVe+X4iw?=
 =?us-ascii?Q?GXYpM6CmU6ZIF6KCHzu9rmsa+rumWybugpHBA6lCVpGeAqQaNrq4+/PBz7UU?=
 =?us-ascii?Q?ylQ/hb/9vWsIxtXH5chRAhxdXJIju9FfR73qesH37qX/O9ahntNDCuYycc9J?=
 =?us-ascii?Q?TL4TSYZiAOic9my8X6P6yACj4MxdIuPBav2wS7xXnXRSAm8uPhGua5zUIyd+?=
 =?us-ascii?Q?eDy2rU7EcxNf4IQvYUkgdpnzeTE6ZKN59nDQmu3UK+3h4UlTkUEspL96e3TT?=
 =?us-ascii?Q?CacEd0GVe0st5kDsDsI8kZhBWlrkmdwN+Zz/Bv9SGHawEdjdJjbzhw+Ye8V3?=
 =?us-ascii?Q?fnjmtWZm+XVQV0H8VFE8juPt472yh6lvt43PLxjQzngtaqIFaeJFT0H0Q87O?=
 =?us-ascii?Q?iC2AasLuAf2B9gRlTdX/i5BVQT6RfV/x/2cYd8gdIStNfq5YhEbWVfGnWlSX?=
 =?us-ascii?Q?r7HiYRoqK87m8zIy8wbUM6TPP6bc6TkBfPG4yA8Y1lAzHgw07uWyfgM5purM?=
 =?us-ascii?Q?ZT7XwyZSumlBqHvPQv8A4IkbSmz3kNjoUh13OiGiq3i01wsUWdyH7ll8KLKW?=
 =?us-ascii?Q?BDC/iB9XTAe4PalyY5Y3zOf3SMGHvsvNwZGkmsW+d7/WfMAoahkdhmrmzgOp?=
 =?us-ascii?Q?ExFGo+fU51SR8dfUX5bgeKOec1p5psGo0qNu4V+P8GY6nkjildFYJ4VYZ/pr?=
 =?us-ascii?Q?uPRGgCokzthRnGwwk4N4/1202jHAY0D4QBRks73DwTSWcIq3XZW0+v+sLsRw?=
 =?us-ascii?Q?AWHWJNSThGFsxAyYLb6m5nI4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab08937-733d-4f79-a880-08d92990574b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:43:36.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbjeU3r1hvcnynzz2vu9vytfXbQCraTwnEcOL/8tIQ0JI6H6/7wo+jqRwwq/6OVVEqD/LdzCtf7gJhzBM+c8UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some definition of colorspace/xfer_func/ycbcr_encoding
are defined in ISO, but missed in V4L2,
so add some definition according VPU driver's requirement

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 include/uapi/linux/videodev2.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc..545f2c329bc9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -247,6 +247,12 @@ enum v4l2_colorspace {
 
 	/* DCI-P3 colorspace, used by cinema projectors */
 	V4L2_COLORSPACE_DCI_P3        = 12,
+
+	/* Generic film (colour filters using Illuminant C) */
+	V4L2_COLORSPACE_GENERIC_FILM  = 13,
+
+	/* SMPTE ST 428-1 */
+	V4L2_COLORSPACE_ST428         = 14,
 };
 
 /*
@@ -276,6 +282,20 @@ enum v4l2_xfer_func {
 	 * V4L2_COLORSPACE_RAW: V4L2_XFER_FUNC_NONE
 	 *
 	 * V4L2_COLORSPACE_DCI_P3: V4L2_XFER_FUNC_DCI_P3
+	 *
+	 * V4L2_XFER_FUNC_LINEAR: Linear transfer characteristics
+	 *
+	 * V4L2_XFER_FUNC_GAMMA22: Assumed display gamma 2.2
+	 *
+	 * V4L2_XFER_FUNC_GAMMA28: Assumed display gamma 2.8
+	 *
+	 * V4L2_XFER_FUNC_HLG: STD-B67, Rec. ITU-R BT.2100-2 hybrid-log-gamma
+	 *
+	 * V4L2_XFER_FUNC_XVYCC: IEC 61966-2-4
+	 *
+	 * V4L2_XFER_FUNC_BT1361: Rec. ITU-R BT.1361-0 extended colour gamut
+	 *
+	 * V4L2_XFER_FUNC_ST428: SMPTE ST 428-1
 	 */
 	V4L2_XFER_FUNC_DEFAULT     = 0,
 	V4L2_XFER_FUNC_709         = 1,
@@ -285,6 +305,13 @@ enum v4l2_xfer_func {
 	V4L2_XFER_FUNC_NONE        = 5,
 	V4L2_XFER_FUNC_DCI_P3      = 6,
 	V4L2_XFER_FUNC_SMPTE2084   = 7,
+	V4L2_XFER_FUNC_LINEAR      = 8,
+	V4L2_XFER_FUNC_GAMMA22     = 9,
+	V4L2_XFER_FUNC_GAMMA28     = 10,
+	V4L2_XFER_FUNC_HLG         = 11,
+	V4L2_XFER_FUNC_XVYCC       = 12,
+	V4L2_XFER_FUNC_BT1361      = 13,
+	V4L2_XFER_FUNC_ST428       = 14,
 };
 
 /*
@@ -345,6 +372,9 @@ enum v4l2_ycbcr_encoding {
 
 	/* SMPTE 240M -- Obsolete HDTV */
 	V4L2_YCBCR_ENC_SMPTE240M      = 8,
+
+	/* KR=0.30, KB=0.11 or equivalent */
+	V4L2_YCBCR_ENC_BT470_6M       = 9,
 };
 
 /*
-- 
2.31.1

