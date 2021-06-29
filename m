Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C633B6F32
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbhF2IYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:24:19 -0400
Received: from mail-eopbgr70044.outbound.protection.outlook.com ([40.107.7.44]:27726
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232463AbhF2IYQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn2RfcTJvullmBUckdYHSwkG03M5ObYtR4k5fG4dXcGd0AFaduGVDHs6n35N4Cvzy01Jm30EM7RAisnPJjCIJuSzOuKshJj1bTio9n4e+frwrShf+uHKuylrlPwRhuU8tsycdM2hCsXzj7gWe/ytWwbFbv1vVbQeNDRSScQIG5rpuk4Y7yhCDCG8KQLX1XXC5fYjPZg/QxwTtl2R7RMIfY7DaD5pEZS+MlgM9Yuk03Yq72ceHzvcAZtNn85+9Xi5srvRYQ+MfvadgOr8rRx/oMiepYTbDg6HbbNKGA1kp+ruc7YHE9NBQeaEl9uwICZ+WLn2mTK5kqQoQ3P311Mlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuQ9QP8tzWwYiM47RQl4AGrnggktDCI01VjB9V+qHZk=;
 b=cEbSoszcN7nLdPQHWrnPmT3lkG8JXrvAVyTA+6hgDLuqlZoiXs968ADO5XiIGR8Lk9IMF9Yl31nHr/3ZHorliKHSFFL1RDshXDJdVFE+R8gBdW3C7Xm7WyVaaTJBv8rgNOTRr+xnqexcRbn9igSiKneRKh7i1Its2DCaoJ165lSDsVytoO5s2c6F5I1EF9XPgAK3ghXxb2FscigRD5oIL7q9UMGlNFYFesJU/fcjUSaxLv0rGE2RFu6cSFNX81PEtAgFUGuvCKDu/9Q5o88IQkFhNj0aDu9RqYkpCxsDZZT1WZEXFEWj62qM5uyspLlDHSW5JS9cMMqulYcmGMsaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuQ9QP8tzWwYiM47RQl4AGrnggktDCI01VjB9V+qHZk=;
 b=UcQ+3aEqVgO78oPvrkcGpq87TikyYCntw1eUn9sv3sTo+d7MQDBVwluRF1fPAZgUcCFz8Dxhi32mWNEtTx7XvH13ZwokUgsMT58mYxY3hgIBLdb2bI1x7WI0tWm7tdU4jo3ZJssDDololi7MIGMlWZJ6bbApbf6SDKDf454rrGY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4583.eurprd04.prod.outlook.com (2603:10a6:20b:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 08:21:47 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:21:47 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/13] media: v4l: add some definition of v4l2 colorspace/xfer_func/ycbcr_encoding
Date:   Tue, 29 Jun 2021 16:21:03 +0800
Message-Id: <edf4e239c594fcaf213745d301c4d64bebf62e30.1624954576.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624954576.git.ming.qian@nxp.com>
References: <cover.1624954576.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0160.apcprd06.prod.outlook.com
 (2603:1096:1:1e::14) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:21:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a01895ab-0958-47cf-b8b8-08d93ad6efc6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4583C43DA098C4292DBDAC1BE7029@AM6PR04MB4583.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCPTkwzq0Gth4ENNFn04pmkVIPrsP69ddtIe+3pV9W03bQ7L2BfyWqrH3tLszhxp6Ps+KEsjvAv4VVdw8IyaLgA7KyTftk+jYBVhLBxg+0NWuWiwbSdW/n0rYxkP5dl6iMpyOvbyhimQfTeYwxQtaqjd5UZRvkrCt1BeigLnxtYLUCpy6bvJNPvkr5DmKH5cTblI7m1tFTiBLTS0w68BUDvTSR/Zpp2l7xIh7LpUUnOL8Igi2n229aY6bzZEFgs9OUD36CbzPc40S9kL+U9M0lOEF51pMxs4jAhFxKQH0yWcGnjidle2g1jSYxurLXNxsjIicQ9JzbMLzPylI1//g9S+eMcKM39AgWMsh4SGs9cmYZV41ebrkhWZcWUWd5KykVrWFVtSuSZIg4/yvxrRcrQDfGzLfdmXPWRyOcqhcNNTUri8R5DKKLfo8x4+dVipaZGjk7gJZYhAoQW8ZaI3JyVqaEhdSLUJC95/pBROvigoLWeCYVQnqQ4aOKMb20WGxVPotmsoXdBB2wtwYlhVrB7NUqngYEsR8UaBBVXYcpm92Fa8KektqRfqipRYRUVQ3yOWPY8XGavOz6gKQHNLKyyJcs3aHDXGK6hs8FI8Uq/uSqP9OdMtK+AMkxjf+YcGEu4Yy8QBMq3hBsX6ccZh0y9BkPipJKVnpxcPq+VX2J0tU4KvmpPjaUQ3rpA0W6+yY3jaVY5wWrkOjB3Btucc3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(2906002)(7696005)(52116002)(86362001)(66556008)(5660300002)(478600001)(38350700002)(8936002)(38100700002)(66946007)(316002)(66476007)(186003)(6666004)(956004)(44832011)(16526019)(6486002)(2616005)(8676002)(4326008)(7416002)(26005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbUwk66rPki3eUClIjK9eOmEeKVtvIl1mj/wrb1WMCSkYHVTJoecmxb4m8rt?=
 =?us-ascii?Q?ayhmyCW6AC5xkeOVHMyTo9Q2LfYhk+js466gQhXvkOyV60StycvOwnTen8SK?=
 =?us-ascii?Q?6A6qa+oT0AejYIIwPSUhHNa+hF+bgMdsiQd7w8bsb+1zh2GoqIYOk+wkvbyV?=
 =?us-ascii?Q?TmO2I61Er0eUtL45p+Hakxlgi/2ehuShzolWYA/T8FmySiIu4sbUHP8pFSY2?=
 =?us-ascii?Q?5fXD1jPeMI5vqvS2nrl5ezqVWd35desuAvYTW2zSAUYtOFZBpPKk+3mQB+S0?=
 =?us-ascii?Q?tDeOgq36JDt/B5jeyoJDnRlX+TyBzdpPNTHQ5CRDqBGtiZMmy3d3tP393XHs?=
 =?us-ascii?Q?zrPc/P8pG5gqBioXdkozSxjdSXVW9MUyYXx/kQ8jKrnh16tEF9iSVA9wx+vR?=
 =?us-ascii?Q?878hYZBOrjqulAiQDRS5Pq+80T67FPaRF6f9DcJG31hJ7CUcanHlcURSzhE9?=
 =?us-ascii?Q?eYp/NU6L8BEEeSmsGgBLLhEHtBcCHf6p4HPuWZPHR9UarzD5EMZImFWHfxyz?=
 =?us-ascii?Q?vYDj7z/R87FZYuHS+rmmKxVeNvm+fP6RqyQuzTWy9VFFaXoscVVWcbcaa2pJ?=
 =?us-ascii?Q?zR1NSqt9hUipfgRKu2V6pWHZLW3mc5rrerLr0v8QBvuwMMg5RXXMenhzllTE?=
 =?us-ascii?Q?M0ACcYqLvxb372DQXhJAmCWWqVcdMAH0VgWRYNqUZ4leMnnhjhi4iT9kiO6M?=
 =?us-ascii?Q?qPt2Ni4JIeCEnCKV4w0OQ7C0G7Ka1ycpLTQKRIP384MbZmzwezpqGQRppOcu?=
 =?us-ascii?Q?TYBeIu+GDgm4fmnP9vNmnxfi4yUmvxtIAjpwHhzRv2cW+YV16qhvTqHqPUXW?=
 =?us-ascii?Q?O8y6xwbaIXMs+N661xGKtltChTlB4Ypdy/h2gz1FeJvwWwwDszMNzmL0J2ng?=
 =?us-ascii?Q?bx8Wp04tsGYr4lm9K9uHYOp4fp3qQGFUi7ygBK5I0fE0RF16hXZjN3B840af?=
 =?us-ascii?Q?2c0SKJ05+baF0qVBljeejpTXLUCkVM5EA9xWrtpw7A60PtRzHGKRnsCiXz9k?=
 =?us-ascii?Q?HXuFGMkvOGv4yDRcrpqe359DY9Xvpq512EJkPt2IIppDE9Tsa7H8mOPyF/++?=
 =?us-ascii?Q?no4oxSoJOmvZ0aMEe182cbKqSCn9ECoSlTufBMRb/oibFjFFRXzdYEBosAJw?=
 =?us-ascii?Q?CFSy/Qp/5BIm4dU+vgp/uO6JiiMr8ZqwvNW6MFeN411V86NXZXp+0ia4F5v3?=
 =?us-ascii?Q?IJIMr8f69MlLzy5ZQCgW6qKfnFiOv9ac879nYKPvB0UgmJc9hmPLu3RrnA90?=
 =?us-ascii?Q?LchaHc02WYO0oKiAv3aw8qEmAlCCy7wydi7Ho/89Lr/gouLyWP2zLBseO0pU?=
 =?us-ascii?Q?z1Jx2bLqaDx0JYNQbBlDomQe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a01895ab-0958-47cf-b8b8-08d93ad6efc6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:21:47.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkBqu1EKhY8wLGTZrb0sNCwEeH3xm4hlbvG9BLwKsJo+q+UJ9Eql7UY3/I22EWmsFbqn7++4U6qtNh1Lzyh9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4583
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

