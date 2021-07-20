Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21473CF1CA
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbhGTBYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:24:38 -0400
Received: from mail-am6eur05on2074.outbound.protection.outlook.com ([40.107.22.74]:54432
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238685AbhGTBEL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:04:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4ebrgLsItVfEInWAeTbg+4YIYc3jNySI94PkMk/Ka6kyzYaU1THxixexshJNX5s7OVc1x8U5a1kPRNlOJGZhXHjHluHI0iMMjoG1c9Fa+kXaxD768St31U+TRhzR943KnHfY1vVEtiSyK9Y4eDGkU6Y6d78dQPm6sjgcrp7J9GK9JY8+ngB9fnhK9EtqtdhDINhVZnMGPwn/j4eZRkXVqNVq9VkV+H/kUzagPKh/Mn9mnBNMdZbg/WM25qHc4wpie3GI7YmUjuAXsiFOm5MWjb9LhKrgE4IsGm1FgL2CnfIMfoKefaLZdgOhDS/eO28Sw+PobwQRb66m6fGVI6r2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vlecUsaA3pUCj0vObcD6+TbPlBwh44QQcU9ueIJmC0=;
 b=hNZMkv5qO78NjuCTkJdmzGbVmpvAtxyHUmtNgJgm42dG/vu/zfW34ltVO9wLWQyajTz52g2gjHN8pYfYGltTrOcfpVg2Djdu0/PxEdauHicLVRf/kxXSkVV+w9E8Rfh82YMX8chRG7x9vc5Hff3CNeu6RbIbUQnLIObedixSVmhF47NXrXMRn36GPFHnW9KCZT3DTz3ocy4BFx8iIs+c6k5XTYgYTxw+u9wQzBncbL5Zd6nVVsZIuRdwLkHBIYWqV+CX64EYRtcjzN58E5dxP1xoHkgkcYKBwEQGmwcF9VMt9BdBNzMaEKcWPjl82E/Ti2Ek+UXR9yxRRCkvSJeZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vlecUsaA3pUCj0vObcD6+TbPlBwh44QQcU9ueIJmC0=;
 b=IQ/FECqXxtrevYkIM/gLEej0vUUBkahlZrMWT8tWWD1Y+RkLlY6vKHK4qN5cdlkYnhc8UK2x4Kenm118bKaX+WZsVonL6yRCXsID0tUhohLIO3PtpRAj0e888gP/cg5ERAA79ZGzRvg5KoXZtit8vSLftjRB+h0GqnXgpbKu5pg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:44:05 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:44:05 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 02/13] media: v4l: add some definition of v4l2 colorspace/xfer_func/ycbcr_encoding
Date:   Tue, 20 Jul 2021 09:43:21 +0800
Message-Id: <d63b34381eec0ae47bf39dd2b88d2bc8994c269d.1626743758.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626743758.git.ming.qian@nxp.com>
References: <cover.1626743758.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:44:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03a5aa5-d21c-4ee1-cba4-08d94b1fdb79
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB38138ACD5ECF2BE552E0B679E7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZU+uQLRf+uUBdAge2Ip91gVRR55XUypY+Bmwqz1VKBst1PfcnHOCN8Ps9q3C91pYVrfNfnOP4MqitxzH2UjWyvNNf2Sj9daIUyUx6w+oZ+ijAUu9NJfo3ZJWZc/nhE0TK+b76+405wZLOLc4M2HXVrhP1sXpHXQvRrafeL+dpcJGABPSkTr8b/kf58SzDG4e2htJaw/NScriJ2pQ6ik0rx4x86t7wKF7UHsNX+d/D8g+fkjJFwb+V7CaZMSOXuYx3b+ebvcNVAp3/FjLGuWSD/P7+lDeBv6F3EcB6UVtMCbvafd3dzl+8VR4+/GtllOkYSfrPHAZb7AUq6EnI9P6Tdq9v0beHl2x6C4J9QhwpRyY2M4TsS1BzsIXmqA4BqBOF9uK4lKXj3p1KHEUmbDDXN2QXfvDAvHyJidG1MT4J3NDopD82lk0j7EwGvHODP5SW3J8OgsWoAhlzj/mIwPtWFIuOCIhv4rhKcWx3uqbk9OLu7DyJsXfysAaxdN2NRIsmAXCc/+A/vQS0GbYuV71bgN0dk5hG1wzBSIPAOu5OvkwAjqX1egNJ1fU5ETMY8D9iB8DT6wlkBrGDihFb+wrrGX6KxOjqI3Ta7VEA21wH9a+r9+oFqhO7pRvYiToK7A0Bah7/Mr4o/VGCtfGpYXWrJGjd9NMNWyslLEtsRS9ebGYgUPBLS9bQS5EC+1LQ2cVZbJmfNzHYq5E1nZi3S4nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(26005)(38350700002)(6486002)(508600001)(44832011)(5660300002)(956004)(2906002)(2616005)(8936002)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+tbMQdr3xgq2rp8UiyRl378SeLDY6ix15SKGIQWzFytpTOqodsrj9zdCgHcV?=
 =?us-ascii?Q?m3wOK5Lyj/b+DHvigxA/13gV5J3AOHUZM1CwazkYmtfMWx6BrMjvTJrzye3s?=
 =?us-ascii?Q?NokrBIDPWvFmHCV6BJ69ZvXlMrYZf7l5ddBg/t8Q3uSEDSg0iz1DJdhpyGRj?=
 =?us-ascii?Q?vYvNqvkaVQZX/IcbEhPhz4ryg1/Akg6DW7TbaUy20bGwrPFvls76C3NZ/ISs?=
 =?us-ascii?Q?y9MEYw3fxDvvGOAoywN15AxsNELExTbzukg405P/u1Q95n9ZM7i1FpssAO/h?=
 =?us-ascii?Q?kqLUw3iJbMKgaR6zZuuo7xrho4y8U4ELV4+B/1YFJe/2S7RDRucYxoSC9Cc2?=
 =?us-ascii?Q?GQCLHCNn7ZvHbZfCenTEvI9PMPdO4HuAum12CZ5h6QC3cm9dUU7HYxihxtuT?=
 =?us-ascii?Q?Hlrzy02Fifjb8VexFtOiXxTiC+cnYobKrw0/h/psFU0BtrR1GY4mi+q0GiEs?=
 =?us-ascii?Q?Ss0X6wuBpj2uyjQV9EZcsYLgV9zp+JOTW2VFuTfAXibamyb3Q7gEtPYfJpAj?=
 =?us-ascii?Q?sB9VlpkFrAKniupnRbhVsryH8nKlE7fIEuYAxl0KBNzh36DSnJwS/UowCSRP?=
 =?us-ascii?Q?bKRwog/5+mPp6R4apDrl1XJDUk0wJiFDgm43I26vG/9xjUIcsrPVex3yGhLO?=
 =?us-ascii?Q?UTJSmWlOwgg4fdqF0zU92VDjeBnnGGfTWNKipjSB7GGqMRVYTekSGukrAMlK?=
 =?us-ascii?Q?JJfoVCK9IxTgNNO+a5Ofik8sbB740MbbOmxpNnAtjqnO67nwllTrGi8VgW37?=
 =?us-ascii?Q?kzQk0P0v4li0r8Gu2MQm6300tt156PZjufiOTjhWgQYVOhs3hXjzJ6zSdSzd?=
 =?us-ascii?Q?TYB6k69rhzhJphJaAQGRnVKZxLs8yswvUYKrPVlOoYZE0yWkJ9i7u0vhGpjQ?=
 =?us-ascii?Q?TXjOy+i5LGTYpew6T25gPSwcHWuf/YNICMcwL+YiuW6YEm4Tr6nkH0EZ15IZ?=
 =?us-ascii?Q?cJ1Hmy8c3Su+ic1PCxXKBR2dXRm0bfUZEIMLgtLupW7I81753FV+kwTwsCyK?=
 =?us-ascii?Q?OxrwanHxbTaq5tvYP0Hls8OF2rhxy+6y3WrKpjoOLOCDoE6hqSJPatZiz2Je?=
 =?us-ascii?Q?s45bS9SULBDNc7ZFcOBEV2UEV3c4xgVJgRd1tZbrmMuSJwXHLda0NUBAhr06?=
 =?us-ascii?Q?yWNm3Iq4C4VJ90XC+u9WQ3tcO6YMEwM/Bu4I866vM/yvix/EcYN3kwhiexTP?=
 =?us-ascii?Q?YLwsl7iBpcjcI3Ezh+MlW8l2B13JqUA9SXszwu49Nk2wN5ZdtBgXCOxroGYT?=
 =?us-ascii?Q?ia63M4E8dTwhiE4/vT2TE768O6eCkf7u8lt/fbqXe0/YX1lC7vUSMMpbXTuc?=
 =?us-ascii?Q?89qQZpF2SaiX782afi5BuVxB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03a5aa5-d21c-4ee1-cba4-08d94b1fdb79
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:44:04.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AgxOrSDTjXGDiLEAMJlMod9X39DqN2MABVDtSb0+8zEqDpJseWle1on+0owtXoKw3KY5xDn2jL0U28pxJuBIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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
2.32.0

