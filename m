Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66583B6F5B
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhF2IZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:25:54 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:61251
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232716AbhF2IZf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:25:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBlISob4J9vJz/KKjbIPq/t+3KWhguob7yPrMY2s2Do+GYpkVFbDlrxXz2E/1kniGD7zfK9AgfjOZYMAdXsirJ2o73/drWmc674NTZAtUdRNH8QU15bdU74Nh/wLa/4Rj1HWWBKoTcOkEg5eAV9YI3JJV21GgxC0tbbHcpKQxWCZTdZJXM8oiTwpxg1rlfF2AM0RSNVbb8r/wQVs3nsMpM3iMAqevW6mHPF5KDGJxhl/pkrzxKYxV1ciGophav4+POQE2sqE7D48qFoQ+l5zzm0yIHvCxnwxjNFx8VYNR/o+batvnjjNx6R2GV4znwqtvee3RZ/AeLiwTkaXqY9ftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtJU9ThdFQ2vesv7NRfjzO45qk6p/6vA0zf5wrflbc=;
 b=NQVKy+oCrPwHtUlhAz1NaKUXr34qUKh2lQcNtnWFtSneDPxAdJs04AP3LYKQ6HMUTJ6DaLDw/8eY1Uy+NxmbNcp04PI0YIX4RVwWEJbl94BRv9qEurK6RRqFl5u4TNrm1do2o+WA7TEyUoTMBJIOysIPjfQsDG6Lb/xPBMz0HmqaPkU8T5J+bIcGgQnxkBWCM38SEyBOoyI88RGQBFBnwm2i2b5P2767/J0LW2DnqJtMznQQ/4b6bk7L8+ndhGO0PE4jc9BEP/PnIw1T+98sjAZjAeM17QAsQpHoqCGterPs1cmTdCCK8A6Zigp0HexZh1cnh2Q8yMGtAZ826c9kAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtJU9ThdFQ2vesv7NRfjzO45qk6p/6vA0zf5wrflbc=;
 b=YYNpN25xpg1gJ4+EetfKcyE7za8/ummUcQt7xVkvZhlXDZ1M0UE09ofpD1I/oj0f9IVGmd+a8Ft1mxoqlw9jepzCuWIDc7o9y971rGtMOJ2zkk8EzK6B8J7LQO4vK8Wl9XN4PZo2vCdbjIBP1ZnZ/bCgfQzYKXqFbZ+/dX9Tz+s=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 29 Jun
 2021 08:22:32 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:22:31 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Tue, 29 Jun 2021 16:21:13 +0800
Message-Id: <e4b5585d879e61ac26b0f8961e2eaefb96bd7014.1624954576.git.ming.qian@nxp.com>
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
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:22:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cb4b3de-c87e-41b1-27d1-08d93ad7082c
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB3089ED819AFE0267D03DBDA5E7029@AM5PR04MB3089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/dl4rYDgPhlaiPelr47HI8wi+Wf8N0CHWLNU0Mau7K0Ff+5GMM4Iy1aW3OP/cnl6LD33JSCe+nwTKZRPeodkvpC76kd7r5xCxTKXAaDaZqVbJNO5qd5/f0SM1YFDBzSyE/WLZnQMYJcKH2zoYXGARbjKHDQG+mqhJ3ncAS92OZDUS7RXtJvRhOndJocqmB+FCKJ5rKgk1X/2RfAHZGtkUhEoET40tuMLIqoMZ9/lcfmO/+dOEIw8rUO9W4dUHeN02iYAOeaU0iSWPINsJpaxHK8W5ejIVJyTp4VAs6kn0C/Hmo//18xG6GAdtx9YLaFWtiZzGTuhI7LQAThyQxw4IZ+yACN6IKfrPOZxTPcST3ZWCY5Kd2qmOrTDT4DgSUCmKCEgk6jtmZwbsmJPmhJMIaS1S+aUITjgeWgEJCvotoN1yxVAH2lrgHGuuD1HNNehvZoMAS1Ns81eYitj/tiKmg8nSANtvwtGceRFBmY+3714Om7AcBbZHlaDnxXvZjoXi4taj6vj40GE9zrwmnSAOk7BMhGWYIF+2yhi1855bP9SzrwLf0BOiItt8O8161Fe4FYv/w8efI1W1zwLPNtSkA4p3I6IaT0al9e/P1YgbXNc2AzhLXckZEu5wujWcfsgP/pMSmkcd3soezh9IBIz+fHJutrZtr3ooy3gMuI0WZd/CkPeI37NiFy/JyRIWBaNxtKD1npshjeOJUCEPHyTVsPBySGP/zmD3CQ1p7gIvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(4326008)(86362001)(44832011)(316002)(66476007)(36756003)(478600001)(956004)(4744005)(26005)(8676002)(7696005)(8936002)(5660300002)(2616005)(52116002)(6486002)(38100700002)(6666004)(7416002)(66946007)(66556008)(16526019)(186003)(38350700002)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aE2gC3Nni9T/nISKRN7/PezRYcfwQqf4AjyGOajB55eG9ZwUdqVhAhA/JbPe?=
 =?us-ascii?Q?HiNoDKSF/Ojx5xiX12cmbFkWPxHSdg6Q1pMEJ0h4LObnt3bX6qPvobFQ8jPb?=
 =?us-ascii?Q?gJ6tp8mb6Ee9PNT8fYkERnK9Y5sUR7gYxOJsoRdwVi3YP/ZHACkIJ9JG8n1X?=
 =?us-ascii?Q?xM5qI/tS/8/6jV97wZD5sl4oXk/lhJgtADvki1CJQ956RvNyBlA+yAizzbrK?=
 =?us-ascii?Q?HkPWkZ7e8AFdCZg9OR3azf9lNVmJxDxfoHKZCKb384vp1juoKK9b4KrCxzNs?=
 =?us-ascii?Q?HVTsYp04mFhCqsFttnoLl31dyNmgJzLXbdeRfXPDYdUZftREkS3kvkKyHL4c?=
 =?us-ascii?Q?Hh5OLnF8jL/pnV4uo5vxSdql1akFzxJTu6SnqlhFxx4HOg0jsBCxFge9qHJd?=
 =?us-ascii?Q?JSe0MEEpGvLNW7zCl8nEmtjOqFJGuClbZirV8AUKOZUj/EOaSOXuO0YfALfk?=
 =?us-ascii?Q?HQSyIheCM0u/Oob+WWFLTY6Npuh6cTdLezg8X562ysguWJSz1rcpdh26X83q?=
 =?us-ascii?Q?lFFlcrkTooUR8Rw/xJjxjV9KSgNYfaBzbsxakUzLu0xam16iP6uDenqt+iBR?=
 =?us-ascii?Q?1sngCe09Kn9YCiWDvlwl8etXKxHtOyhDS43nJ4lXUZ2KvpJIbLaM5HhKtb/q?=
 =?us-ascii?Q?ki8tu2jHinrRvCslSdEd4ndyXPOobdtplXrPKu46dj6fsxyV17o9kO7A93UA?=
 =?us-ascii?Q?+ayxjW+DWJwMYYpMXEo3d8+3DMDwCDXBS0UHYaq9pTLLc6d9NABi3eAjq38e?=
 =?us-ascii?Q?aF1CZNCLuBS21RH2WmdvHcKqmRiSGtQCHl/1b6ZjFNtdmRLX9gB3YcCRtn7+?=
 =?us-ascii?Q?D4uVox4uZQ+FOodnk6/7fxAkY+UHEWQt9TAERRML9xz4xcQkGKZgsuKt06Pa?=
 =?us-ascii?Q?s1vZBiw8Uzaerdnc7FPwg8kySBRIODX4lcJE4M9Q3qQcXXzwTR119e+zdydI?=
 =?us-ascii?Q?aL+m+8/q1kUKXabi1lGgr2imX4xNIzUvtCWt49PhwaCK7ZbWftQ71GoU/a0T?=
 =?us-ascii?Q?kSjKUR9BLSiH90ATnXHqXfeeqBsHNme+Po1SRayaPRhZ5i5uTibeIYMgMLDU?=
 =?us-ascii?Q?lzlsHf20YM4XSMWXjJ+95WE3syv8UCbyw0Qu6kPOaifxcR0ObTB8Kb9zRffz?=
 =?us-ascii?Q?nadlOROogetyuotC0tmSYF2LwHennKBC+99nXxEg1tvvPUWVmC8q6XafheM1?=
 =?us-ascii?Q?yS5XvKAd65xjrZTCRiYz2ooOicvRvUv7rou0R3BrwN5lKFS3bYEb9N/9Gaep?=
 =?us-ascii?Q?AXRIzftuNszgjCWlwEbjEgyJt+pXpbx1ntmYjZF77s60nIF7yk4ObsityqaR?=
 =?us-ascii?Q?2hWsKSIGuue5rF0j9el1BY5d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb4b3de-c87e-41b1-27d1-08d93ad7082c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:22:28.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwPQ9yrxI3AwWrqPQutHrxj2bwLNhMff+gMMpl6yEEwn3jeZjJblrt1Ke2nmfXxcD177C4SW5M+nELc5we0HnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089
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

