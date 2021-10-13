Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B3E42BA62
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239004AbhJMIbt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:31:49 -0400
Received: from mail-db8eur05on2078.outbound.protection.outlook.com ([40.107.20.78]:6081
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238969AbhJMIbo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:31:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMiqfjR4u70xT6OwLfwi0HL9Lc+//6TFL6C74lahdA7+DtjwL9fwpWxS/ciux+vXefyWa7PSsLWnrfhxMBan1gApjafXqd6gwCF4i5WSPcWfnMCoAikxSOmobzh0d4TQp76mXVGHRAjb8IPX5RqUwhBrna3px11JMYFY7CWgWEDyP+jpU6f9y/dT5sf+pGb97dtrE/WzAs3B+9vqPpR+8b2oPOFwHV/CPSTPQAvzysloAS7r4SdhBNQACCkCkTDfUsrWpQHNxjyZ2PZv8JMKJN6AwnTAsc6VBi9BtTMER1rkRHqOHARt9Js3otHBvvSW0B4VWuQRSSzx4I70/qLrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHWDSG3+IlihVMRDW1j90pRI3F/slKG4Im7hct5HmzA=;
 b=WiG6FU0+S/msuo8G4PEtbMdlTC7WLuPhCd/4C07Y+wPhAEmIhIl2DsIYksbTCY2+CMLck+XO0y+Dzk5Q3dyZYumqGSHRwecn07Wxs+lbXdIrsw+OIDkpsA0ib4iQFSNf999zKFKkyDuNtERcEqdigmWkgu9LD5HV6GACEsT4nQ1t3fQ4LdcXMbrTc9RMIvIY8iBVQU7GuTyfHt2trFD/n5+tLC4KWptlhgNTX4Li/IR/f7kwuKNFIcOOJ1HyKni0K7izYK/b1vsuwRlZ12/BnMk635EV69KuUAy9LYezI/BiTNmWUCkOY3sJKtwURNu1Vg0283duSkQA8iB+9ZC16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHWDSG3+IlihVMRDW1j90pRI3F/slKG4Im7hct5HmzA=;
 b=sONbfyLtRIGAZyPbRqKLkXsasdm1w3ez9Hk4rYUqs5f/Ujc+FAZvmw787xmb7w2vQjMg47q1XL6e7whMVna9JKczdQhO4jLYnuz2eOBq2xwxWKmFuDTDETdi49/cGmBwBwQcEBaC2lHZKYmSK5hMsCjfMruUHU2A35A8nQhq0FA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 08:29:16 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:29:15 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Wed, 13 Oct 2021 16:27:28 +0800
Message-Id: <26f98be61611879651fe734ea65c7f9b7c0fef02.1634095309.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634095309.git.ming.qian@nxp.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR03CA0121.apcprd03.prod.outlook.com (2603:1096:4:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12 via Frontend Transport; Wed, 13 Oct 2021 08:29:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ecb958b-e342-4890-c2c7-08d98e238ae9
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4789DF2CDA7BD66265B84672E7B79@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aM7FQhL2nHq2Iggx2NvAwN8Z2ikUVRgUhH1Ld6hZdKDgvv9UfkOs1iRjLu1ZkjMRoYUf2kM7hMmI5PE9stJ2toFssGfT1xEv5ElUKhuec+9Mt55fn0TzrAx+z2BMLOPC1HA92zi656XNXx0Zyr+PKRTeYiEXuBSubsMgzw8WlIOkJ2/rKlrauIXkRLm9QyKhTVMSNL6dIBx9fMvoyDMtOfLBoOSLleMHSB1JwtqR7hjaCBjKtU3EhQ6nDvwB3mAnXsnyQSn6FUvyOpzayAXUef3w5wefrb26o6tqAG7HMtDhoGRMHTnEFoILYN1KvScjFSvpKTAckJLjQ5xmJkMuY3rWe5F2UJAWfwa6/lEsjft7awEL74LgQqByJU3zDeh5bPCvJUewzAqo4JA7NvDg7U7u2BlzyAIL08chgSC5Yu8Sk8b7ddNGFywZn9qowcJ0PEkFOxNFVSmcm6doYS60j0eaVGIgbx5LX7WkrGjvfgRb4T5lT7Ooh5iLiiebrV277DVGAgXKYLLmkSjvzqb2wo67clHhobxePPOQIO/Z7YGHzZbuNEvgcYhQaxWNBSlMNJFnh5nCRK/wJHTYo2rgYdItnbWhZUD3DCjGz9wOQAQcePctE38EqtIjUhvLMeQsG5q4tU/2PjXKoKltvL89b7qm7fsD6xZwEj6g1afJEplrlhiGrmTWeo76G9hY7MB9H9n2oJYqwN57SSXSGuKV3F+q2agQ/qY28PV1DNqYzDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(186003)(2616005)(66556008)(66946007)(26005)(956004)(66476007)(6486002)(44832011)(316002)(7696005)(86362001)(4744005)(6666004)(508600001)(52116002)(8676002)(4326008)(38100700002)(5660300002)(7416002)(38350700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMK3r3TovVAcaoPcitsGdGPtlCNkVDK7FNDp8z7mb/1Pi1gZhAh1boV4HyKN?=
 =?us-ascii?Q?RHD2OBvDCWEMievJDF9AWLfpMlM2EwmS7GBt5C712OvmRSmXOZ2w08V2kfqG?=
 =?us-ascii?Q?LFZksAjt8km1tmBvi2VwAkADnKQzkUrPXVCPBE57cVYS/aVozyGYdp4XoHIU?=
 =?us-ascii?Q?4KWRTiohY6+IvQuPfGN6pH/KAybsDToFGsLt84EGqfZF972ZF8bv5kZ68N0c?=
 =?us-ascii?Q?Y25EqD/M/74KqtD/y3Q1FoLwoEp87ntYsKCaFAX6/jA+h6ZrgZ/iTS00p+XZ?=
 =?us-ascii?Q?M6Y9GAS60GVbn2gPQJCeoSBxUZgZlbTO3O7BDd+HlI/Td7vyq+Z9C48Cdfz4?=
 =?us-ascii?Q?hM8lNSdB2qb9m3Pqb5WbsBcpW8vwZibg4wwSb5epnHI4uqrh6b8Dd3EWerbV?=
 =?us-ascii?Q?U5RNhNOFgou3OuxcFqxeDOPg/YpT+KIFJmMjIXngpSzv012o64jCf/qZsC/R?=
 =?us-ascii?Q?RLcIL21u0Vxn0fmjygS49PDhuOusiwZoJ2atEeogxsTYb9KHGrsqBd6ZmcNM?=
 =?us-ascii?Q?Aif02iXDzILO+8IesWjKKtK4xJQrRkDKsOJOyNQgfBv7KFZgMtqt8C/gREbu?=
 =?us-ascii?Q?r8wNIon9+hAGo6r9L4vfduJxiRWR6DknjTncakbSM5tOl+MF5l8X13S6MqGT?=
 =?us-ascii?Q?i7bLFqijguz3Ey6SpnCd8bSs45EoB3oDxLkp1p9W2lYe/BHoSJo97rd9RH/e?=
 =?us-ascii?Q?Q3vJUKOWSM6U6DEwgU4xmkRWVnQVyUHGQ2ylFc8YfLX2hCcSyerxQrtake3J?=
 =?us-ascii?Q?Xd4bPy02vSSPaGD3dUxefM8yNhgGn6YnPFBCqaOOCcI5WxWI/lCLyOVrvVlo?=
 =?us-ascii?Q?grBJo917vOP+/LicTITDSIkN5AB5KYuaYOFiYfX1/Vz7t2W2KJWIy73X+iPt?=
 =?us-ascii?Q?Tb/YSVSCTenlAtmbC/p1vIN9XF5VoBwXc62gJIBtV6o0UbsTtlnIxasBBJp7?=
 =?us-ascii?Q?Wr6ljTCrVJAoQGT6pj3cyyPbkyRpXrYXDQ8XOq1sSmZ078g7CytY+LC4Joi0?=
 =?us-ascii?Q?8cikalBbcpK+I+3FQW6T+nk7VJxCj1yms5fYOUbw1puqtGTeqUZzYQuLM9Ce?=
 =?us-ascii?Q?Nfd2kHe3rUWXFT/aYJtGTC1f3T90ueQtsQAzY0nCO0DtVpk/e+Ccia48Bb98?=
 =?us-ascii?Q?JF2ego9ZTfwROQskmgZQ+7FSA/nl0KwDip81Aw5s5Ka8d21WHvuqm8cfOCEc?=
 =?us-ascii?Q?LQU/3r63XXAcTA93/gaMr95IFgu2/tzkB4ewFZ3V7nPqpzy6O6xYqyOeBIuD?=
 =?us-ascii?Q?BQjw7nnlLk09Db5ePLLONYDVZrsyERbogrj7s8SuDu6KQGo2UrhY03FiYCg2?=
 =?us-ascii?Q?dNkIv0LWQlKdMQTcRmMkcb4x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecb958b-e342-4890-c2c7-08d98e238ae9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:29:15.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K54gEKfokiACV5uqE9CfrUJdhyVcZ2iHV66zLc4K66VCGT27Vx1zhgcMWshWgVmDq4vOTHhn6yLYMvj0fvIINg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789
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

