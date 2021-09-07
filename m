Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00E6402680
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244885AbhIGJxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:53:22 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:32225
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243810AbhIGJw7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:52:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lrls+0lWTGrAZ0at7wRRDnJNNU69/ArWY8vfWLkTJ2ZK3H2qFByr9RyWNN+y0lu5Q0iHF3TD2xJ1lwTGHkZdlrjq1uvjJce9z+JfZ7ruYkDov8WixjU/aw5PDmvKw5kf8jZPgrPQdwO8y2mnkj+UA8h4YjfN/INxJWmlr6Fi5cYMsUfdA94N6H4QwfaaM7iQPtPaRdms4Zp2IHImClilQhb1UvYfgv8OGBPO4yntkJP0Ia9vRBc7EqwaQXZSTiWj78796AXbSOQ964Wjd9IHWkx337CW5HCCYZPpbKrew8qiSl17x92u0wa8q6Iu2HuazlKMnTOwU75gdAigXyScgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=Ful9+OHG9KSA5XUdvA/PrwWgKSr4Duh+7qYdSbphio7nedS06rAJd9TAxAgHh9l5c9Dx/bkUHLlRvcbiH7d9eaKcUARFqPx9oisBOJJgDIT0Q6dGNKFv7FJXQVsmf7ZeG2WtCywdsHsfvaSKNio3nD/yznGCZvj3hnYvIaXprbzfchX4YDdBLVBR49KkP4XiO56BDcpqSVGnLxcStXyqE74LhNmoPjXloFJHxovltFZ6NftlY9wIsatkle2cQIXt9eBEhh6mgp90VLg5qM4raSLEHi1qb0yFNd5kXPSxq1ueqG5iGafarrt0BBucqHvAGwW+PpoK5aXcZoa8OxN02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=P9Vm5qnOVBldROWdX02PX08G0TqXKlMmz8lk0dYrBlziP0XLXQzIzbo7+Pi1W7hmFI28weJDtkajMGbGlSpDLLamUz+2Qtbe6Pj2i6lPvbJUxPL0ni8fN4g/ZQ6+bQpxit+s5TTHvOpgV1EG14onEGefDdJ+7FtQ9xMlHfS+EIk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0402MB2772.eurprd04.prod.outlook.com (2603:10a6:203:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 09:50:47 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:50:47 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 14/15] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Tue,  7 Sep 2021 17:49:21 +0800
Message-Id: <1218d5aae916a78f824de89330e4b012deac5156.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:50:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcd48198-963e-4de8-7649-08d971e4f7aa
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB27722371999382868944EDDAE7D39@AM5PR0402MB2772.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yxI4Szaa+Nhb+MljjqQripf6vx54oQn7P2mXC+KYC1brshwXdIy7k15U7KDKZ+p17Nbj5kCGzLXB8zBsdtJiTjEiQ0FwZX7Ix0POHlp9anXHIwDsYUVmtvOTu2wy4JS8IjT6k38Ej8KDlupuH6+laJPjQCCoLN9fyjS0MFeET00V8xVYs7nxi+q4Yhao9m0aV4Us5CZHq1KZHJd92W9CVngmRVFsrcbYDowA/CKiaGB11/fDeye8lquFZuNodkzu3NjpskzlpqGVW4iR1fXN52JeaYYbBWfCI8OaJB8rxAodHkmax602Dv5nsKJkMTpdgpf5ZIeq4iJX6Ben5zuja+YJQF2r+rdDamb1+2Vn/UVTLvZ/20mfW1cRMLuq6LDxu9vOgRr+UJsUo0hAL9jtWPzRPX7pS/dbmZgccSLgCstL06LQY1mQqdS7lfY08wqGdQ+7fSZbPLMmrdp18mw+yuxhkpPjIcuahlmJL1Jlj3QTxoh9g86z3loRaB3ZY35RZ+7BWuv/hJoqqHLMsTOmGEIX58H19v0Tjhd46n/CFD3hNpLdQbQyZ7fsGyd8PobxvvTslpY3jj2Z8dqlkHkXz+X7xMC2GyWRDK1pbWbGaLglMKkwdseZLUowKbDhJ7g2XzQKN6rhTg2yHOjSm/sGlYBaZpxKdmfdm2gnymwEBwu1NwnvEEMkqjtzwD3ajCQMBDdswzpbqb4RSrVvdfZmqiQhdLJcqdSDhj7YcdqmmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(7696005)(52116002)(6666004)(66476007)(66556008)(44832011)(2616005)(86362001)(8676002)(66946007)(4744005)(956004)(26005)(38350700002)(38100700002)(6486002)(4326008)(8936002)(186003)(36756003)(316002)(478600001)(7416002)(2906002)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bdBOAi0ggcedu37/Gup0uKDoLp27L2PfIrEcoNzbCVyxJwYygjIou5Eoivh?=
 =?us-ascii?Q?4kpSb+4uwSg6NXnk5JJuG4UhocROeViFGE0N6K3Iz2Ukya6q/VjzxI8Y3Jb1?=
 =?us-ascii?Q?xJ6FRumlJip6dwDG8zJmT4SRVfM1R5q4ORryEDc8gNOLYfPjHmA/CnrNkrSt?=
 =?us-ascii?Q?eX4rdK+BijXFJGlKaVcMPF0bzPc4ntsocmcD6A3WZ7JVtbtC/GeDHA3RcmDP?=
 =?us-ascii?Q?az9oqJNdSMztfsMiU0fkBsqbrNo3SlLOXc8QGt/5Cq8/QtZZlypq3eThEt8O?=
 =?us-ascii?Q?lnJ4LrOX6iYgQSE2IgXV0AoKJ8SmIt6vH8UC5b7aSeluJNpXM1Pu48n6egn4?=
 =?us-ascii?Q?J76zHbXSq0e7LNC9wG3WNbPGX9uZBjOtmV5K/DgVSUDZ2a4NH7L3fX9tqdST?=
 =?us-ascii?Q?l4buaocluTSJulqH1g4ylnrqY8SYYPNxYxUekFjvrSt8NExCxFQn+RAAskER?=
 =?us-ascii?Q?MpEuMnbALG0YfMM/SrTW2psx2c52yNkKwzK4W1HtBIZaygCxyEeZlbNzZLhT?=
 =?us-ascii?Q?UX1sZ0Uv2VjNpYC4OO0Whr/dwi89anqqJQxRlrG4e2Mdf/Cke7Y/QUFtc/Vr?=
 =?us-ascii?Q?+2F+nxPCp4B0/gqV4oHFBLc4uU7hNJsz91qWo6a25JWczVOCHm7NpxFEBamc?=
 =?us-ascii?Q?R692I2HFMPrpOVGxLfrGYB1M0PH1N5Y1lXGFyQY86k1IKHRWH12KD89+nbtg?=
 =?us-ascii?Q?AbvSCfhkb3daL7+UC7D+elMsQylCzXQea68aQjvhbSscpNbpjzKzCZnDe3mz?=
 =?us-ascii?Q?WGWX1InCuoTsKJRlaOS0or1PygtIWGTRZpCXS9DrL5G9Xm+HDFrQfCGXFSWj?=
 =?us-ascii?Q?NeaYiGglTCWxvE/Xd3Q7P+80Ey7bwzhZB1O61eeXVotN5+xA2Co0BHugDZeG?=
 =?us-ascii?Q?ObB43Gcv2a6xwLUneQT662pRfNTzVSOD5X2MAdfIZ1Z1r+fFD6d40kgKog0R?=
 =?us-ascii?Q?Y4NsilBLWaxEXmNJ4z9LWoSsI+vqW1TQ63w92huDk3nqUHIpkxaKZiXHX+Cv?=
 =?us-ascii?Q?lGzWPp4Ya9ww/Sk0Xbcla9W0ngpZAxr2uSDo1VOBWPC0gwU9lvnDVmSc+Skl?=
 =?us-ascii?Q?A6ddQ5aWJXZlrK7XGsHTm/uOLDhuJldoKFU6rMWh7ATGWvhZD84KTgxthZ+Y?=
 =?us-ascii?Q?iPW2qnPnNgiQgC9eu0NxnVgVWCkFzrrsRWa6Y+2W4ExpDhUYSi4GQ+bmGIoD?=
 =?us-ascii?Q?VXcQKpo1Ar+s8FXq9j8Eo+oUv54lQOyPKxAWXzkwDG18VKJcxMhMDxI+amGt?=
 =?us-ascii?Q?SNIQwDUmH0iuxHSP4M5IgFBbSTkaJnLNxjuaNT5RLvpc1q5GMC5AiSOwYpcQ?=
 =?us-ascii?Q?c/Kz/vxFus78Sc/7EvNzrHgS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd48198-963e-4de8-7649-08d971e4f7aa
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:50:47.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBXq5+53uceC9v7y6Cs1dwS9+WCYnlOrCeDb3ij46omdRtYNxb2e8zLh0/G0I09mw6V/14rbCXZuoowO7ExZ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2772
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
2.32.0

