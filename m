Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413492A2343
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727765AbgKBDKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:12 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727461AbgKBDKK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMXtoz2QV9CunhzCb53jSXwWqtzSOURT61ggOTYGK9bCIhvKCghlfiUfs8pviTtBmbsEa5Br4RjO8h4otfrWZbE0G2nuF836299zqS1piEg2nI1DPvfKpmYjfuHA7O8Z3LHIxTRXejE8u0fDLDVQvwcMnWmrZFampWwoxrQ++HIOKCwMoUVg90euYhkI5RbVVVVYKawD9hRwfMOxGzNYdfvsFyqvXY0GPkldr5kk2TQ6y9Q6lALNO8L8H3PIScnyVtxnl79N53giCa5cutJRkiMliRFHZ0h5YYIdCViznt48caC9zDX0D7uR0MXEtebYNwrGbBHgzdjmRKp9vb5+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIB/fjhy+ggZllz0p/bsfZJ9PPhieqbJIhplMpF9Gbo=;
 b=oY50zn7v5pYUXGpIDqUJPWdFxgBYg07PTIlK1z7fPa5N7Z/lmQEaEaMcYi+pCz5OA5BrdEhNOhjkSOSFGg5ogUNk1j44y64UKoZoH2/Sqsbhu6vB7vXaiOfBnzGHU5koFcJXyQ9xl0dLbI5TQF/hT7iXbt6rHdqDbo1dcw3rIH8E9LLZNSK70Z3H4aKNd689mFysbIXpBaC+DhYUxC6EGf31/tED2BsTrrOKRwKEQcwzdmXLFVipyQaajoUzy3FkAWcrHWuCSo79GCY7bOGZckyDRsGXrwogOiVCOE5AuawcJI7+4/8Pk4fFJhXS0h3BfQnWtuO4webQykdvvwsovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIB/fjhy+ggZllz0p/bsfZJ9PPhieqbJIhplMpF9Gbo=;
 b=kIiNCA+pm4kOjqYPgMMyo2mtvvmlMbSYF4XuSw25h9zkYMl+ZE+OUFAgFO2azj+H6eRVqgTeLYXfe8I/GlraEYLlg3bL2+vwyWbRsEXputH0qvgWn7fSwV3C36U8bnyofwqo8/08+Z4Z/JrHBPUSkRK6SwikNOSjU6yQ1R/HMMg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:09:59 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:09:59 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 02/11] firmware: imx: scu-pd: Add power domains for imx-jpeg
Date:   Mon,  2 Nov 2020 05:08:12 +0200
Message-Id: <20201102030821.3049-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:09:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2118dfc2-9d00-49a7-8c93-08d87edcc85c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5173CA9AE90E163A4FBDC990CE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTc/ROMUqV3iI8DPUuholwiCt1eNfy78Kd8EN9CzDRxezV0jXAuxEM6ERN+3oxUM7I9GeMbykogv15rRWhySGN7UMEJ6DScZHkkZNSSAwWUmS2EuzG+ezGE2lvauJMV8NsEUqZ+hmC8Ie4Ct6GqcotMv43/FJS0oqnGbsqapUB+dNL6BpNZ8bh94K8NpXa44o0l4Nyrcf+am7sEmIe8zS7NGiK8jDvLXUcWZFZr1cAT+ro860kQzSA7Uzgb+EYv5RxHl4HP1KEkjuBmHG0WT5E7vlH9M4Vzuh9v3rDq3buRBSoRMXw3BqS4DfDabQUgPeex0bVKnIb3ymg91vyBz/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3JA0RGZ07qGjnwY3nu5Uwp5kUfJENcitpWnQff25y09ZGfcpN2FpxvNdq9Y0XecGJCO57V6auyRF+pux2MBETtoG8/RlS1MHFuVFR0VLCEzuYqrYOJ8hlYHcCu9fyln7ykauS195mAwpF9h/tl77HzVhg+XITiwN0OUkK3d3o7lOUnF612yiIq5EX8bIzrzyP/RXy7emC2RGVFThnSlXOYsuYsYfDLFk0cbzH0LQHVJ3fvre3YTy9BGMiuoNk1iVOUq3evM2aTa48mzoiZCmKOdC15KV+yTpUY4uYE48LHqDG5sHKWcq+VoO5yhG/k9IfBtRMqirbK1TtfDr4lJ8UBi5w+VpzvVw1TYjcsqbLTAwkVF64L0c5nnhUNaSNQWVxvwY9gosMU9dc4Kd4SflZRWdnyzL3eG1gFapoo4lr3Kypkx4aQpZSXGI/up6qIQi0Skk1AA9/ib18ViWCkROYWX+nGtIK517DhtTjlGRJM27Y3590UuU6dIOMvZz1/GTChu8NCO+Dmiy/z2xiC1jW6KIQkjgKUW//fjUbpKuGQD9xaq3CofA86pwXoMgJjHuIRZLc1LwseM1ncgGMFCbo1vch10aSzjd93x5pyDaDYA5czfaqSzhsOfWEojWCTrK9Z9ApP4U6oLxhu8/esSHNA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2118dfc2-9d00-49a7-8c93-08d87edcc85c
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:09:59.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FCRVsKltl4EMe1Nh0WjaHlfnw8stk3xUKS3Id8a3Ptw6LMK2WwsCbwKRYW1vP4h4xFN6E3E6sbqXkVrje6mqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The power domains are for imx8qxp/imx8qm JPEG encoder & decoder.
Each has 4 slots and a wrapper.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/firmware/imx/scu-pd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd.c
index 946eea292b52..a614d8dd868e 100644
--- a/drivers/firmware/imx/scu-pd.c
+++ b/drivers/firmware/imx/scu-pd.c
@@ -180,6 +180,12 @@ static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
 	{ "cm41-pid", IMX_SC_R_M4_1_PID0, 5, true, 0},
 	{ "cm41-mu-a1", IMX_SC_R_M4_1_MU_1A, 1, false, 0},
 	{ "cm41-lpuart", IMX_SC_R_M4_1_UART, 1, false, 0},
+
+	/* IMAGE SS */
+	{ "img-jpegdec-mp", IMX_SC_R_MJPEG_DEC_MP, 1, false, 0 },
+	{ "img-jpegdec-s0", IMX_SC_R_MJPEG_DEC_S0, 4, true, 0 },
+	{ "img-jpegenc-mp", IMX_SC_R_MJPEG_ENC_MP, 1, false, 0 },
+	{ "img-jpegenc-s0", IMX_SC_R_MJPEG_ENC_S0, 4, true, 0 },
 };
 
 static const struct imx_sc_pd_soc imx8qxp_scu_pd = {
-- 
2.17.1

