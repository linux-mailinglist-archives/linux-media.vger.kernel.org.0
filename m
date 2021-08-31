Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532AD3FC11C
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239733AbhHaDDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:03:12 -0400
Received: from mail-am6eur05on2045.outbound.protection.outlook.com ([40.107.22.45]:39521
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239725AbhHaDCi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:02:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amaKKAfGRpWGfiX0o3TS3KSjkPs5rlcByAxChtaoztUgspVC1+dJyN/bjC+2Xc+w4hwAMF64ypJ8J/+2l8+IrGsqo8i0BQpTA+wejPzanH+g/Jgj4/aA0TZ8e5VczDXstwY/pP6wgBLtW+O6tJRVPjPOqWisbl7Yig1zivLGgPuEZUcqyIegx88RliwXmf9CmrKpu2LDTq1O90lRO6suhH+uWNCIqXSBBY460UK2APG4hCw0onbYWY7d2+jTWJEMDOGfgcrEqJ7WfLmYwlPZjfHZmcymPcLDnlpuE3TYIkyU2SJ1pe0gO9a2Ne+cOqbuzxcv1Yogc0czc8ppLeLf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=TOEIpQrSz1gxGKfZpQhcf1GH4SO3Gg4PCjmzMYRiXHHDyECRDRbWjbI75+X9fY14LOu7WalgGKJgdPN/sk+OiRMVReelD+/0G8OgH+45uJOqX5fI3aIC505s51jXOgTMWBwcFXgqtfjrnh+PgJ5+AeKImm6Dl52QIVgZO1QaXZ5uKTOprRbTd43/t5dtd7l+los28EFWaZEGQNdqu/uvB8MeJtcyFgzn9ZybdkI6Kw2Hq3RR44O06YQduxI3mI58m1HHP+396rxPtcmlOY5fN33gk2r0SWIpRSKcVdaIb6C52tloNWKe6kkMXQ9bUo+OtGaqDsL+tV0hfOwJGN4KvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=UekceK3DebhwVFiOwEy0y4sOm8VFWlVgGxJzZQU87E0GTSEdURyLWy0pqV0A1BTtuDTK9aZbuIpmNCSuHZsd0d0PWtj5k/ykuXPMzIeusEWPs3ted9ACLFm9YJB8zjE8gELi2wBmtFCdHj5d5aV0J1YqLL2nLfBvlncMvQpj1XU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 03:00:52 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:00:52 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 13/14] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Tue, 31 Aug 2021 10:59:14 +0800
Message-Id: <168aa67b66d687c2fd9a19ecfcc0b7cb6edc2bb3.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
References: <cover.1630377507.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 03:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91e438c2-25b9-491a-109b-08d96c2b8ae5
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4888B25335D4A1D925D512CEE7CC9@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cR2+VLiddbWxf+QMWpLDdI0lgX4lB0PTVDasAqTmpgsigTA9XoEEsL0TCQWF9wV3+Hxnd6p13aDktAXIuo20rxy4ISLl0tQFVZLyeus0UnSYhWkHDtNJewNxcVR4zGsUtkRdclGUijzcJNFW9jEsuH2b/PAeQqPHzEzoZzXRc98aXeInk+PWzi/ZyKrQk7Ip/sNblG/3ucAy9cAZYaveGCXjtrZTOmLsxCs/JR1x6MeM5GUrNaSQyYD43btPpd4aewskvgMrXrDOCnW8NNOrzouV++BqWvWbA2h9jlL/vIATveCnEtdkp6NjFBnWZjsA/PZin+vGHI9Ck0SaaoSn2+Fr63LVruH8BSDG7UjzNOhS90Kwara2CDTVakeTOBfji+DLkRB2LMdF/cpBTvfA6su5F1E1Stsyp/winF3l7pb5rH/ychgxEUkICgvHa/hkfPNM6m7FI9Xo5VXlTXUEQSdyWTYZrXqUZikUK5kOF0SJkyGTRRGJKFwkAwJvxu51AvSGyU0oOrLVxVbTJFZNluTm71z6Fj14LCAV78Zt2/0YgYpGDClAObGV/JouFMMKgeGnE5B2HGI75eDLhSQqrHkdprWg1RKaD103EdsSUl/daPYOgTlSzVwYWEL4rSdk7v43Kah/klQZnIn/kj6UluR/mb2l70D3bF2XxlG9izZM9czu/RXv8Vs7J3BDZAPPJ3Xhi6OAMvhv+CKoT1Dvw1XZQcPpkKf1BXRwN9ejkE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6486002)(36756003)(8676002)(2616005)(186003)(38350700002)(38100700002)(2906002)(5660300002)(8936002)(44832011)(6666004)(478600001)(956004)(26005)(7696005)(316002)(7416002)(66556008)(66476007)(66946007)(4744005)(52116002)(86362001)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uX/NJ0/v2y7xozP+LVAbb5mlfLwIi9mb8NdEm3JNIsEaWTFQlsI/hvQdZ2PO?=
 =?us-ascii?Q?PdygUDgmKUrdUlyG6ShUb0VElIUWJ8K5dntG7q+ZSj0QKn+3U1HmW0ujUehm?=
 =?us-ascii?Q?HhBpTbjR4uh4FAG5uG60O95E36UjxwNX76WEK+UH8XYqZ5x/PMXjPRRZEJdx?=
 =?us-ascii?Q?WMo7SosHcW7vmxsglJMlZSpF86SfbhJ8d1zmIIFqtx0ek7M5AG0vdgsY/QIP?=
 =?us-ascii?Q?+IgphU7SgAVGWzASauDmGuorbt85i8nhkFAM5QuYQ9TkVNNVSFPxImEaH3K5?=
 =?us-ascii?Q?5CzspZL4PbNTPPSvS+lEd7gQqR0HxdPye6bLh28eyaI8a7wnDrC7gRW+Iqfo?=
 =?us-ascii?Q?DxqkB8Kq9YgmJW39M7M97cTLPDIr7wGrqal0z+C3eIQ0LWwZ0hkGmkzidiDt?=
 =?us-ascii?Q?Yv8eofSqstSvI9o2XN8/zDcHxr9G+uv3e+mu9NyNPaMqQJ/MKqNdJOjDtkPt?=
 =?us-ascii?Q?YSv2eBd69v9JRCRNgWje28VaD465TSFhsNOOxfoPLgJOUhYUXosvijSAVBH0?=
 =?us-ascii?Q?fxOuBLIM1gs87HvG8w9/s+ZzPb1ACuSkIM+QtacuAEpB3DLOgj/ti3lvlGu5?=
 =?us-ascii?Q?hUnvXAa3F67AJkOuTgne31qlVojqyEQFHuLwgfJ4yFPgIu64Ms1jdLsDs1co?=
 =?us-ascii?Q?70ozd/f9oz+M5xnwnXpQfpKmu5miuXTzn/tb3cTtErTybrDHXfiRdQrZ4ReR?=
 =?us-ascii?Q?hscNs8Pj8JPbitoXaHdIuEX8Pqgn3WCVZi/0Nr6cpaMkdJ9DUTGljoWOiAIL?=
 =?us-ascii?Q?m5ggdihbcfOh8Nc9KMiwWg3p9V92HFGH8JQ3AN25m5rWtfvBGUxT2T9c12Q2?=
 =?us-ascii?Q?1D/uqZV8V9X6XG4fdFzMVjWIHE95yN3S33r0awGWNWd30g1Q17lv/FZFjSg9?=
 =?us-ascii?Q?ra8vJvXByssgbfvnZ8l4271YMHqvy7WriAIQ66E3kKOiDJ1or0LHth0va5mP?=
 =?us-ascii?Q?7mVUearO8GtjTb4aBWiyBUC6S7CYPYzYfxnvQkt9fxEuqTBqWEXldWXm1R8M?=
 =?us-ascii?Q?paWGQhrugbWgy/yZcroAZeNNdS4peqBuxXsmV3gePhGttqBvccoHmzv3WJ0D?=
 =?us-ascii?Q?jWnr9kwL4AeH8Zj1JW9JssYyFL95pC1na5OTsFDBGifI8EStLAVWm5CTEMaE?=
 =?us-ascii?Q?wFvllIooINuYSv8tMuNsxWD+/laO3XmVKlsXEG/vV6+8Q0YH7VPkiP1FdA0Z?=
 =?us-ascii?Q?NLBnh6hqAfAG8dUcALVXgDz3WhYX/RK5NYW7GK2wLgl57tf/c5f43LZpF8IG?=
 =?us-ascii?Q?Cw47KYYiktuPwbO7mC6Gpurq4/0QN8xliVlGkUaory0hIkuIgQU2/EvHq9Y8?=
 =?us-ascii?Q?Zp2PWAiBcK6b40zCFmCHSIOH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e438c2-25b9-491a-109b-08d96c2b8ae5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:00:52.2075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zjJmuAE6RxHqd5rBuy9vVSuZvyNsH5QGENy68pXMBEeAHwJRQaKuD6Q2FsNQDgci/xVfeisTK1u8FcGWEuZbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
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

