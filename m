Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E0444AA4E
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244818AbhKIJNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:13:51 -0500
Received: from mail-eopbgr140087.outbound.protection.outlook.com ([40.107.14.87]:55280
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244829AbhKIJNZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:13:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGLcC00Jy9fImKlbWZAfE2glam+tCN3SfnCrnOSS7mP7EAUiIw2VCM8lDaArm8tKHq5PBPs7OOspGqvFppWjeGQ2e4g1FFUTkTDM0Ubt4dexUdYXHakHEBqRmugy+x22qaO5qj1M58h1E7KfAeQq1DcGCKmwEdEIzzzMCRbYhi8IYU6+f14+0P/znXHcbaC2s6u7Y6Tz641jdD1B8gY4b3Hi4dL1+GPHb/NUkElTEzEGJK5n/Ymcd+MFK/f/8bCXTs0wTj2P6XJ4fwhLrObKEIf5fK+dFk5B7dzk90nlE6mOlaLrgxA/I+aefEKMW3+rghjtAByBl2icTuEBYtn1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHWDSG3+IlihVMRDW1j90pRI3F/slKG4Im7hct5HmzA=;
 b=RAg/wBHPaSKhPwYlxMMFX0/tJXVS+VaeyJpjdcstm9D3OdLyxzuWLsbPxx9koIImnHWugu5Q3xifto8ZDahDO4SGDke9qQPD3O6apvAsTcZWzahVPqyerDPjY9khQicAG3D6EB9f2zqEkgK2jqMO/YKp7EazZFuXyed/0QvPd8KW5YpMX4tKY9S71bHPUMh5gMKwG4wA69eBiaRjAOXhTsOL+IBLhD/PXqSBj7iq39JZf7oHFpOULnohIAsnPL8hu438yyFzXT0gqZ40i5bFg3uthE3dWlD/aWm7NsMdLxc7PT5ycEKawTbGdE89tFbXoo7SFXJUG6NzNPBV/AddiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHWDSG3+IlihVMRDW1j90pRI3F/slKG4Im7hct5HmzA=;
 b=Fb2kDLIWepoB4FpLFxrvdFI1DmbpGcA+/MnbxMkaxklPwJ4BtmujsZXrepdPFgx6lfTyYDiGtrKBET4DF3aFOnT/Q+kynqNWYqmbDemwpxSUz6mOpiUEHN/G6oDYjiygv0jE6ZPZhTlhlz960UMcR7RseoGufoPf1TPzk2hyHYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:10:35 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:10:35 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Tue,  9 Nov 2021 17:09:11 +0800
Message-Id: <e7389d8498062c5bc05cc3c63c7d91edf6deea8d.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:10:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4164487-a590-4579-5e14-08d9a360ca3e
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB8278928D219E013927063EF2E7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWmXwyARCnfPgSFSetZbC+KK6jcNl4ExdnNVtR3K2oDt/7U0+ZBBY23kK3eUqU7Wz5PLHOKSmlCULB5w0VAlYq8ESOov1sgeFE0CVj79nW6qxOXECkgFo+7h6AfqqvSX53PttMXmMtwuuXn4sv5jBzSRRZ0k2KUpwHKGzFOwv+YgM2r8LfskZeSXFTEvJokvCeSeTU+o8TtM0yoRMBFw1Jiv/rB977+HmKgxNyKrVwY4GKoLDQ/3DNy0YBh+MqwnESZ/yNApBOvUkgS1hjciPHkuIGbKaKOyQt2AXD6UcBMy892ODEJvZ4iGq5HA9kTwkgk89Wg9G3UFU2BKUUPCZMp54sXEaKnCubgGzFBQBF0+XdpRKn9BImqC3p0spwUGmtGXhi6cLh6zA9M2v1u8qpWdTiVu168XJj+PeVrRPJkWVKxnYKuLKrZ0nMiy7uchCdoujkRhD+JBWTdNJxwN2IVJuOesVngHmIRr+oVPyjldcSqE5rrmdf3Sufcj7ESDsQb1O2Z52Sjm+zSaVUD3E+nJps9B5ue4ckIpmS2eHBLZR8rw01hDpGrXlo639+S38ddXGVsi1MgSw8lDymJX+tgIMt4T59EbIaZv2NrI5vUFWEVgYjN2FOhNOUxgZHhg4fAHN5fYQn7SkrzNbw7jooN2PYsjkaAIVkW5VI7i+i/JWwcjK9KeR/vihHMhl2AXz5bAPCRGNsLuK+cIN4tErhwllhuAyyZgvq/3152A168=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(38100700002)(6486002)(956004)(4326008)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(4744005)(66556008)(8676002)(7416002)(66946007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?crIAZ3nDeBhhfKYRgJ2IL8gZbNXY6OnjDkHPDrfZFcRv2I5XjzGpBj8m+pD/?=
 =?us-ascii?Q?Pf9frEuKWaGlfxJS8uDyBao6pIOhPiAVpbLympKXsc06H5jA1yDJkw9Jnu26?=
 =?us-ascii?Q?/tJaoM5SKeBENh8OhuiYNOijMs3hSsLbIZRWWeCU40ps2yJY5nkWTtwU5EFO?=
 =?us-ascii?Q?FAmPx0b1PjjqEH91//JpH/Q3H132Yz+t02pWyPIy4uLP0LCfzVgfWEQxk47P?=
 =?us-ascii?Q?Yzr0T7J9yUp0N9eZbx6Q7MWLp3IGmtIKZKyWnXbwUPBeIYgHGMpnHZ8NK8bw?=
 =?us-ascii?Q?rNdizpJWGK2HLYgrVvs/m0WRNfoDL2ZIWLzEX8gsMNvf0J8iE3Ir8wnyTu3h?=
 =?us-ascii?Q?sGsDdhV4drxHboC08y4YdCBw0NNQbgiGyD35Dq1VRYibEFt/CLLcbgzBPyMp?=
 =?us-ascii?Q?tYqEbxT3hiEXXSFpUUG6K1Ff0x7C6uzzB1t/3wd5BzfnKKE+8HvQ0fhejowP?=
 =?us-ascii?Q?nQIW+0Fmpv2UjL7BiwXCelqfYLPUcbHbpzGZ6Xme65tfyIfqNnC6gU1olpxq?=
 =?us-ascii?Q?027cqjOCpj8jR8yAwc8m/iP0yQSE9TXSJy3m/XqKNz2ljn3bod63ELBDKJ3J?=
 =?us-ascii?Q?bUCnmHVbFS6+YSPyKmreu5dj0DrGx7+5jWaIkvRJeW44C9FMBRZrHm1lea7g?=
 =?us-ascii?Q?jGHTr/X1p28kQr/Rddwa4Hqp809pJyeJhZ5ST8VbBVyvh2GLDQh3ZMLi13Qy?=
 =?us-ascii?Q?7KiFghIz0cp35WNjubmVZvUYlBlcoKxH9Kyld4MbfcnJ1OPgEvlxYUBomXRz?=
 =?us-ascii?Q?Euxb/SVAoRbrBMaGha67b+Z+cqkwoP1965c8+0oXGfn9Jl9ge6X6wClkCSct?=
 =?us-ascii?Q?SexVp2cgzvn6B6umhNaSo9wvjkd+XnbjQDQVzw2Izl+g4X8FYuolhj0uTJ6l?=
 =?us-ascii?Q?74qWV37dymaVzHNlX9p5JwXFtYFrx+iIIYUq0OEJDl6XssotoQQ6XmXRvl4n?=
 =?us-ascii?Q?vOyp9nmkImmqHazLsiZqliaQR59q+AlYNNS5auaSKIXKDgnhluor3JXGqndg?=
 =?us-ascii?Q?eewYu9x4mN5ruee34iP28GCt1T7cZFwsZPNwbbVF7lqsABHEw2z92+hINJKS?=
 =?us-ascii?Q?fKR30flzVnF9vyLE1spPMEjsQtLlvffwS0IHS5CQbZGYLqGKJjTKW+GMDLUe?=
 =?us-ascii?Q?QT+pvoaXKLMcKTSDEvPu70RD8h+Qy90LrRCwss6JWcAChRwJlq31bZj+2J6M?=
 =?us-ascii?Q?fMajZ5gJ8ViZ2f21qPa8zeHwC3tAaDJWI1OUkrTf/evdBOhWXJqBABUTP6jB?=
 =?us-ascii?Q?uXehZNBEJT9G07cIUDBWokL6fs62TWMSLrh6jd1nN+BfIxMRTo5r2MQefakj?=
 =?us-ascii?Q?d4E7WpeIhNDhDzU/WXKUfEvfzJjuyWjWdoXlfe4JpFowXvWjtx0liHMtCVxS?=
 =?us-ascii?Q?o3aRiBEDC1VZ4uhVMHpzlGwRQyeyREqTKkr4ggVDZUjI/3a3TuBp0lQ1reA3?=
 =?us-ascii?Q?7JNRsY+V/n1VX/bgLcUGNPbYiJVF69PLrIVkyuLBehWDB6rqwAR7V8hbHPQO?=
 =?us-ascii?Q?e3DpT8Jz5Pnxx4rG+2wxVNHjBULt2fHw9zQZlxfszWM1xF9lqkqUgQTMbe+G?=
 =?us-ascii?Q?8Av2k5NkoXBNIYY60oxyjwwkdQ0rC3izIs/xfQbW7cJ61sNim9u5xKQDhPLd?=
 =?us-ascii?Q?OqyJVUE/gKVNH/wUVYiG4yU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4164487-a590-4579-5e14-08d9a360ca3e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:10:35.7956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWjzhoIO9Ntv9G/Ik7uBgEYe82vPQPQWmSLrh1nY83D7FRJjfkJZDPUOxrr6lP7bIRG/zLly33/MSQAlHJ6zbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
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
index ff6569c4a53b..af3d057e6421 100644
--- a/drivers/firmware/imx/scu-pd.c
+++ b/drivers/firmware/imx/scu-pd.c
@@ -155,6 +155,10 @@ static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
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
2.33.0

