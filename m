Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F40939540C
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 04:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhEaCyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 22:54:23 -0400
Received: from mail-vi1eur05on2059.outbound.protection.outlook.com ([40.107.21.59]:54529
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230091AbhEaCyR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 22:54:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLVoc7D/HiXU/tLa8RNyTmlciunn1VE7KpeXWoC6GfTJJlH+Z6YeipHwS+9Ps7/Ztnty0U5LISgFDrTq7WYoWUeZav4VJgZDUleVhPkdhijjaN9Hzqm++/zf8k7TIBAVcF8Xv5mT76z8woNIYM4l0M4MqyWaDNXAlkkyuZImPgLyYyd++frt3CwfncQLTIccztsNZbgBvRDS+tJh8Mba68q+817dbow8bEuipZ7bW3xPNQYf7MwWzUB5JfCWMIZ37WziO99lV5ObxLkAHQBCRl0HOpgDRaKt4qk3vLt9sWTMVNod6X60MkyIj2dNrH0pgKBqL3HnJ4R8yWLJGGnniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtJU9ThdFQ2vesv7NRfjzO45qk6p/6vA0zf5wrflbc=;
 b=levy/if7KtkCiRdWdVX7Ko6dHc6RlQPc/Qk5ucYP35qPjZTsMwwbYkbNw13lEPtwQaj3nadHKg23PBHSUB7S8iuotPczpWexmMUFvwuZ9mmxpIYFj6J4NCRbrw+mW9wWC3ng+zmru2VAlWiOpkIoegheNiaBWTrL5lFB9lbBW5acJBMEkA/AMIY6TJmlToDnwiBtHpVp79wxwtzCSYDlYreSPcbXpDQjbPV0BiPazoWjBGd4Tjk/OCZ2AwO1BaPi98+fWovaxCeMGMUl95iNloBtmBWsnPwCfa6dtpfK+Kcgo1wt6x9AZ22VDbzd32HtNwaeVm9GwuS3kyhydn2V/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtJU9ThdFQ2vesv7NRfjzO45qk6p/6vA0zf5wrflbc=;
 b=RC8GBoR8FdH4IHRJeT1UVfn8Cni931vveOHsSx829jIwFEW0aEAWfzyH7OTVEYGndeTNs5YhMcaaANzd1fdUOo4dOiP87Z1+c7rPuf5M86OfI5vjv7VWo/P3DcS51dNuTQkLH4v7bcsHB7W0syK8ndP+Lh+F7bdcdlkZSrHOIVw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2546.eurprd04.prod.outlook.com (2603:10a6:203:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 02:52:25 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 02:52:25 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Mon, 31 May 2021 10:51:13 +0800
Message-Id: <a6606d1676efaee35175d71b16aaecebc62cc996.1622429026.git.ming.qian@nxp.com>
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
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 02:52:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19f09893-d8bf-48d8-a612-08d923df1eca
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2546CE8183C61EBEDD50EC5FE73F9@AM5PR0401MB2546.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FqaL6zN8t33RDlyA0vcZgbFJGs3g193SzgVigOlPEarxA1X4TQs6wtm4HWFY+EbAQW6QU5T5oPn36CRTZfB+HaE/rb0xExEAK+qi3zyKRgTs7p5rFwPY9p07zjWME3lgFgU4VLvK0tJWDwt2iVQitYPXodO4z9alDmqCXrZgce/ZsE6oKoSGpShbjDD29Mg/q7ImcyGfV0PWpIdK1l3IWInAa6uUCor+JHeyKJZnFryhftgyAgWS9Zm+CHaUtc7is17X7E5O2MGvRU9VsA9nnvqgFIaOKz4c/xZ2lcLcsbdI7Ri5Ppid0RCox8711ec1VaIVTKPCm1fSQnr6UNlMbHIQ431kkmqr3axNeLqajMKX8gGBpo2C+Gb/qBJHrgG/uhj8X/ZxtMbK6aIVIHx/gIn2ZS7kdsas0rclRUAvem7ZoVaXeW4sVPWMwvyhnBgVhwYFqCZsydVj0I/kSO1ieVXBefWJFPIMahTGxgp8jfeH7hkrDbWLdzIC89Fkcnbh6vpHdG9vY9mR8ZNLN0f3vmZ0E5Oj/UulGTldDB8oF8/Mip5Tr1kD6hTLdVNOIb/tUT4gp8n4i0Q9YXQj2qXD3TseYoeKoCy9aIROFNIDm28AkrDO8tMSOOsyFFFC57vg2+qfdSPXWMQkr83jzhGCHuiPU0APf1BSsMalyFfQzRhJABSdJddOG0x+8eCBvIZu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(5660300002)(4326008)(6666004)(36756003)(16526019)(66946007)(66476007)(66556008)(38350700002)(86362001)(38100700002)(44832011)(186003)(7696005)(2616005)(478600001)(8676002)(4744005)(6486002)(316002)(956004)(2906002)(26005)(7416002)(8936002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p0QkDQ3iMQcsaCTxphT5MWvSoPO6CUgJ2M8VV5OANWu1C9JMROV5KsviEpfa?=
 =?us-ascii?Q?UF8/0fMlEpy/Vkg1q752vwsc7KtzvhGnULqpbkHoYnMPeHxtkRGCeeyeDQiE?=
 =?us-ascii?Q?ghvUDmohSXB6MEHG6MmkCTnT6T0ORbtHGuedB2Bltr90ZrPtZM22SBznxh+y?=
 =?us-ascii?Q?dmU3MzkkyXuyxqHnKrfyHc15dYXJAoD6CQOy1D/5umAI/Pf8ANjA78Wu39Bf?=
 =?us-ascii?Q?qfBlkjISozAO2GDZGEeF8pGt6oClHkAZwNtS4P0goVVhTe5qhrkPYYbHma0Q?=
 =?us-ascii?Q?zXF1cl2uNbJOBM7fPMOs0Dl/FbYq/Ucz4FWh9GkbqweaMg/JWRTFbZU4w7AU?=
 =?us-ascii?Q?6/6ZPUcURuOjlHzyyiJxtwEhlfXAIgqB3CLjoidoMmo43kqi2EGV1jUEb+ZW?=
 =?us-ascii?Q?jn4u57OiVXhtvzUE5iawDlqKX07o06S0wsLwa7XZssS4qsEMlZVHmVaE7pAu?=
 =?us-ascii?Q?kqYbU9KMVLl0hTcEJ8SBr1RgQbjmXpjtYgnPTyYWEHvRZK2WsEG2NZ187EVV?=
 =?us-ascii?Q?/B73gG6NN/PhkYAmx8ZWRXlrz/osCVDdGpYhTOr4damRlDIaucq9OKcSpY4h?=
 =?us-ascii?Q?WEqg+HA01OxVS2C3VZdLuswg9ENVnbJaeIqAX2gyqAg6F9sH2Sm1hncZDcmF?=
 =?us-ascii?Q?5uZ0dcL0jpjQ8e10dRDgdAmTDniWSmsNsGeFcrug1C2hrAjwbMTccoiA2Wfk?=
 =?us-ascii?Q?NPuUMb4o/5vi4e8uR/WPLCxhNRevlsubYv+yv46TxdyabxVii0bWCn7zOGV6?=
 =?us-ascii?Q?zoPQU0TT64ILxLVl30Gt5K7oJth/LiS678SIF8FzQQHW0Esg0HP9tqfMsTPE?=
 =?us-ascii?Q?Q/oXLBrTTh4U/yGjr1uEpot70goIr5WA+vbWr4dQsY5EeYXBt8wQ0wx4XfNi?=
 =?us-ascii?Q?I3W85IOeN25oyLKm0O3OQTA1a6XQTXTRUooiQ15X6pAFs5rTh21ZLbqrybS2?=
 =?us-ascii?Q?piZRFOPNnxn1+HdV4Oyu5LOcX0D45uw3j5/l/StOcpkXnXDBQ/NaUCVfsQ7i?=
 =?us-ascii?Q?m8En3LIicGXw+T2yC2d25YMKoSCcsvCS502XtyBU78ZAki3WepoTrLpYTtNR?=
 =?us-ascii?Q?f02z16E9oS/gMX7hzF7xv4zUAh++xxyGq94Sds2mPWTgXHMAYlcBuBpbJvdO?=
 =?us-ascii?Q?mrTM/ZLigDn1AQhaZ6yXBMYWyCY1H2aNrdK9jXpSmNgbvzG2ztxMLKkK/0Dd?=
 =?us-ascii?Q?idzHLd21nQIn2E+GMwsUlGmfKzmoC88V1hhkDgoWuUAnnLmVi8ECWM71/Lyt?=
 =?us-ascii?Q?/jFJ9jFZ1y3wHuXQ5VVbKmCv7jkT6nyVpIpOZl8q08rY1+TAhrlD1u3ofJzi?=
 =?us-ascii?Q?BCFPvBMAODkRLkkPFYrptvnt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f09893-d8bf-48d8-a612-08d923df1eca
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 02:52:25.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34VQLRozFgvRXiQSijb48lP/W5gPFBYD/tfFNBdHc3rrPYYrQL3xylbglaEJ4tJJFNtJ0+DHsYBFkEoOG+Dn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

the vpu core depends on the mu resources.
if they're missed, the vpu can't work.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/firmware/imx/scu-pd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd.c
index af3d6d9ead28..48bcc9355a7c 100644
--- a/drivers/firmware/imx/scu-pd.c
+++ b/drivers/firmware/imx/scu-pd.c
@@ -145,6 +145,10 @@ static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
 	{ "vpu-pid", IMX_SC_R_VPU_PID0, 8, true, 0 },
 	{ "vpu-dec0", IMX_SC_R_VPU_DEC_0, 1, false, 0 },
 	{ "vpu-enc0", IMX_SC_R_VPU_ENC_0, 1, false, 0 },
+	{ "vpu-enc1", IMX_SC_R_VPU_ENC_1, 1, false, 0 },
+	{ "vpu-mu0", IMX_SC_R_VPU_MU_0, 1, false, 0 },
+	{ "vpu-mu1", IMX_SC_R_VPU_MU_1, 1, false, 0 },
+	{ "vpu-mu2", IMX_SC_R_VPU_MU_2, 1, false, 0 },
 
 	/* GPU SS */
 	{ "gpu0-pid", IMX_SC_R_GPU_0_PID0, 4, true, 0 },
-- 
2.31.1

