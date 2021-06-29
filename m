Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834CB3B6F57
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbhF2IZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:25:35 -0400
Received: from mail-vi1eur05on2060.outbound.protection.outlook.com ([40.107.21.60]:17056
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232726AbhF2IZM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:25:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBnveqb32Qju3dn7gFap+9wXDPZFCodZMefvahSwAzzmh+ui4VkQCslGttkHHoaQLJIwHTEQT+rHe6+bTDXTOvhBU+dcjevm75jcpRbEAVgzyzTJ6k3JzxMH5QtzhQU1YVjYKrhU9juAEhnjbKAJe85oXGKYcYAQnltCoSSJ1qIefNEm6zqz+CubmIUW+PM7/Y14H5T6YZP4f0VPKoYC61uuBrKYDzoBjodXdGd4N4Ss3WW6309dHyn4Gv9mcyeTbyHK2H2xezWw5Hc8NFxtVau9aPp8F89owG8eG2l/J9B7x3jI36BTaIkdvGN4xbTFRJRO5h1Y3d/sp2MIv2ZDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4abajW1vhYPi9V1bSpIlYdoKd9unIa5A4cUELflhH/U=;
 b=a7c0fRd8dK/Tz44mcHMOE6sdwAFSfD2uwh5/rdTiUsEr/MbPkwPJ/DQd7+K998oZ30zDqi70RPCnvuEv2TKTDD6tNpChqMN6QAdy9Ukl2NpJXm+1LCxc9Y95M6AmbRutzu73KtEngaWHfrP2lTCFrn5kmsJxob1qOzgLCGk3dZrZEVIDoM45esL2PMFtY9bYRnkSZ2bahpWUD98IalJrvr1EFOTdXjHXeneTQD7iRkzgo+IBP2KxdAaQxVU/GqGhAx+EvUL6ZQUDNjwsCw2RjkG0zpve3P4YtkJpgfdKRubVev34tBpyj+bOD0ATlWYROfpoXvvtcHP/A+xnVA3SOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4abajW1vhYPi9V1bSpIlYdoKd9unIa5A4cUELflhH/U=;
 b=Rb8hU8xyaKg++JeNnbmp8MY1RFjBLUvYiO8QpOZ9IX9T0EC3YzH4IaOTvBtNkvkkoyf3uAROB1YFhWIAVcnWpc/d5aegsZ6tmESLjnk4swwUGapgGfWX0+wrv3a7OFleB8dIlcliKyksCnf+AgPWML++SFKPLdoB0nbq2OHbp8g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5014.eurprd04.prod.outlook.com (2603:10a6:20b:12::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 08:22:41 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:22:41 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/13] MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
Date:   Tue, 29 Jun 2021 16:21:14 +0800
Message-Id: <56637bd756fd68222138faac6617f19b1a2cca12.1624954576.git.ming.qian@nxp.com>
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
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:22:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75833d33-5324-4a69-d185-08d93ad70aac
X-MS-TrafficTypeDiagnostic: AM6PR04MB5014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5014746434B40CC822748017E7029@AM6PR04MB5014.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1u0+OUKo+bKlJQT4+gnU/vC0YGG/UMftOumaUDvR8amuR4RJInHQf1fGmqmEb5hFgTSwIh2j5Ut0D601C+xOUeHaV6SoxoF5B7JU6IZ2m7sbznQ33iGahu0EgYPIxQtOWWH/dVSl8QLf8r04+uqOy5TkU0ytsCAVuf0cJlsIsUwnT05PRtNCdBUFyBdVMwkTpMC3Iy+50FVYrgIIEQRc+vzr++eySXv6TXpKDJ6z4gpc1E3o4BrGuCN4e+kSKwhAYcorP7iC5ZdJoN9X7oLhJSiCP1q8T2Y2W5HlCaLphGam9zzCxQSshsEWOPCMDbSxyUKDQSPXnKzVdUi6Ck/KndrSp9uhv6c7nC6bJcHhMRfaEzv7xiK3BTwaxAfPCsYzNS/WJCQFKX0UgV30Atz3qAlf7R6voMGT7CzUnhTCPze4nK5DC9HQq8sYKn3+vgdPpwISTpj5ALYdv9WesGJ3NARElNpOY2xEvSsZs8M/ZAALEF9cLw3izMxc2qKFqoasKrAWG9J52OwQd1uisN4oMizDfp30kuErnPatlBEGuUnSG66Hzld2PN2eoOOG/wN6VMaRN3a43+v2HNFxy18z9pX7e+SuEJB0DYEOfIGEKPnAxNFAzQ56710R5XLungiaKgInfvfa4FjwFCAZsi35ezBq7TNTvEl32jNsH+bSJKnmzOcrMQxRhksTLBl6k5yZejoKCR0QJ4G1Y5rjKKobu4TaUl1Z6vf/k4JDLTgQHao=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(86362001)(52116002)(316002)(5660300002)(6666004)(66476007)(66946007)(478600001)(7696005)(66556008)(4326008)(2906002)(16526019)(8936002)(4744005)(186003)(8676002)(44832011)(2616005)(7416002)(6486002)(36756003)(38100700002)(38350700002)(26005)(956004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BcjkkGYUTihEB0BLk8saJl/qfPOp+9FqM6VxnGNWvR4n4Fn/FQ62Q1ChbnQ0?=
 =?us-ascii?Q?O2ON3kh1Vc/EGKmvPqV+KP/yDnuHjWdLZiLj+4skgFno6QKzgrNnYG682yHU?=
 =?us-ascii?Q?jgCR+2zkw9JuaUD8HEWpAHPNtn+BLn834tM98upfCvog+vSbx2GeSTxsm7xT?=
 =?us-ascii?Q?xTr/F7wSxcE7UHvVohuzR/5IQx62JXSoFeyxjAm707evlnplJ68XArHhXrtl?=
 =?us-ascii?Q?abXpZ6Hw2eJXFppdRG9tQMoi6pR9D1u/5D1k/sZluy4rtuHK/xdvCt0ba8iW?=
 =?us-ascii?Q?aKhGFAbrZJYiLnjYeAxbOX43sgA9fr/K0SSqgsDfh2JKteCLzxCIkRDPKr/D?=
 =?us-ascii?Q?osRzzbVk+EZWebIxkltZ1QZQAxDakHofn2iZeJ2HSb4OOJBskiQf5GiTgP8V?=
 =?us-ascii?Q?h2Od8oDODZ2R5VUYmlg6aBtueQYOPI9wvdfPfR/yd72oArhXxtXJd3EdK60E?=
 =?us-ascii?Q?qtnyH89FwTiUryIdExUKUUco0SQghg55Ud6ddACiigMUQL2w8RqZG2POxfvd?=
 =?us-ascii?Q?bD6hkWVwU7MvUTTbYdhQsrm3EWad9A5R9WjdwbtSQONsXbR4heCdTyM5U8Pg?=
 =?us-ascii?Q?bheCoefaL0UhoWYglJLQ3b2+xkMdZP0i7EQcTvSWSST1H61QYJvTKXYvXZ6f?=
 =?us-ascii?Q?Rg+hHYghQkmxIF7rt4SGRb1IPOC2/fb+nLONOih0RJblBTA8TwcNfg3vXX8W?=
 =?us-ascii?Q?eta1oiocfveLSnpZBV6n7oHTrLxLvgsUkrb1sdMxjRSTn9hwiSNja7U4dpn4?=
 =?us-ascii?Q?/SkxMIhkB6BwK9LN/q0h/RtokxEnn0WNVQ3wi7PgXVYgs4u/XQ/MMiurIN7x?=
 =?us-ascii?Q?N8i592Sf1+0GuQfC6AyBcqLuyPrZ5m90IiNFvma/aMcU5YL2oz6F3UZND2yB?=
 =?us-ascii?Q?AJHznwnYfvQFP5a3lzBT8on3VDEcVkHCmkrVpcvCRsb5os1gMRvgzFdmA1rl?=
 =?us-ascii?Q?j0qZiThayExCmjq2gdzV7/U1nnfrVf3HoRTyJ/G/XyCg2vq1tQ1VZLlzxj4P?=
 =?us-ascii?Q?BLMebYgB+0gnqMBCmtQ+3vl5M6dsNVqwa/dbPyc6Q63l3IF4CAyoum8LbyvT?=
 =?us-ascii?Q?FvAGe2cCMuyz1vRl/zUrL+Bf3Oy1q+ytiu/ETzjRG96RqIjtc7LZR5Lo0K1k?=
 =?us-ascii?Q?ei/R5667jdi9BfG0UbuPUPWAOE3trW79Mo5cmUMbnYnH+cUYUhUizPlzLTRb?=
 =?us-ascii?Q?e7mGuOsLu4hA1rmMmgnVpeQw8hwxJMvBCjIKZbAv9acOWwz28jRDc3POTeJ+?=
 =?us-ascii?Q?PM2ORBLIOzKYX8vgTBS9PvWzyPX1oR0xDjzvilOowOeJhkOlMBtG1cq4jg4c?=
 =?us-ascii?Q?wWfyI73k4X++B4Id+15gM2p1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75833d33-5324-4a69-d185-08d93ad70aac
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:22:32.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqsi44tsGzuTZQLgaBaXLNNX5/9jwPdDtkPRMchXLGb2YFJ6b7nwUv/OseRzE4UH7+89TATiTH9YuwTHdEvkcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5014
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NXP IMX8Q VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f59b0412953..b88f6e650fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12600,6 +12600,16 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/nfc/nxp-nci
 
+NXP IMX8Q VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
+F:	drivers/media/platform/imx/vpu-8q
+F:	include/uapi/linux/imx_vpu.h
+
 OBJAGG
 M:	Jiri Pirko <jiri@nvidia.com>
 L:	netdev@vger.kernel.org
-- 
2.31.1

