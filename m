Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5547C3CF1E2
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242217AbhGTB1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:27:04 -0400
Received: from mail-am6eur05on2071.outbound.protection.outlook.com ([40.107.22.71]:27941
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243800AbhGTBFK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:05:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByuOy/NWpQargbN5I5sTBKyS/v9iR8iJibEVoj8Dy9WC46q4SMEGjKCLKVIT9KPCw0JVJBTQGa6FBNmoEc7EjZd03X2HHZeFuZOsmIxlQZLGddTp8ab1SZHVv/gnjjUtdDtP9/trJRGee/i3c6eTVhsTEqW0ZWxjbsWFyUKd6AY7qJ8+s8gvdg0/elx+vEXX7nWds67h1/IUx/4hoDddpF8cNj4jkSJ4qKxVBhhfpfrvPCZ4hOJmExi5OhOrKj8HYWlLpuM6VIkdkCcWfXfFrFyngQWmQcZgMXUbxglvAgWyJcy6m81Sb/T9OSHfOCZk2gVK+mzNEUmZ6VnppoJfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6BkH8ZC/GjpPIjmvTRiy33+NpYCVdBymA5VUW2VX+k=;
 b=NvpRUn+ED1YBUC2BZdrFrx3EWF+MrN9YFgF3OZi4RmslcLfx0qDFQLLmXlUTk3kk3/h9z5HZnt2Nyt0WVTYb7I7VEE1InFYVBL9n/YQCvE32LicguGadr3PQEdaWLRoE7c9pWH/yJMriJvs/FfX2SuLMosqnmPj9J0aBf4E2KpaWz3KBDsIM+GeJzzqLz10RVdGwNNm+BMbbuoHO+yV6oHkTZQ6dBkIOMwKO+/nV2FYCA4rP0PAWOmUt7G1YSSjsHsNU+8SNvn71WUHjteNXme3ELUbx4WxV2d/zb0Md6CiZhvJrJIqe8ca5/+FNb6y5iHlHuA4K6irhS/GlyTgwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6BkH8ZC/GjpPIjmvTRiy33+NpYCVdBymA5VUW2VX+k=;
 b=BVQBOW97CZcKX6OE5OWWcr5ldn4Zj0oS2hdUlE3nrhPa/ZbDDQDdRDZQoTe2r8uF6TlnKD0EYEkPz3V364jUjCpEXeicJHvhT9yjhdii+buO9UuQHgDU0Qiv47nZL3zVUugXbzt7TnQa6pnZH5TYh1wUWJMsb9MkxNzuGGHoyq8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:44:47 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:44:47 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Tue, 20 Jul 2021 09:43:31 +0800
Message-Id: <4b2b07fd3000e2a7235049e033dc5887942fc793.1626743758.git.ming.qian@nxp.com>
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
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:44:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13a20045-6c63-4fff-db1b-08d94b1ff4ca
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB381393CB0289D9EBF8A1EFBDE7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uchJ8yREwI+kZKjEPyuCUuMkExqkpzTmW7lL7+kgmBO9iOcnd8T1rjZ4C3zSR/tTpr6xOsuAi6v+1yNiNXwdHho3Csr/g+ARZvfddzkhy2bzdeL1BU/l6CJFNCMYArUrRma9vQCFBo5g0fUWVeH8vfVTMz4yo0obZ2xypIRAdJr438aknOcQ7JP70OCjzyMEP6H08cyVBtV4Tljc1kyWqmrSqf81lTBruCnbm3oWTXIRIhL6aT8ZpGoaLelU2HxRjFidqkgNmA7b36VGXJO+mwHqpkcz5MlIBukEDeae0+zRo5YlnbYNATyKOfSzLoDtQnBFgdm3qHF7qmrajPkx5oirPBz2OyX2JbkDDeRjUXgOq/OBEI7928omAx2pRP2+2Hw27JgFeF/ms0Laa/0QKCfPgz9m+FkZslV7LsfudEePICSl2+wlvvys9np6MEvdunfmNZdwu0P8Ogs+PTxNi9BoYu1FiS99g6wjF9PdayUvB0/cc2boBO8BXs9wk+vDCuUe+KcxkvZx8knybOmvV9cYOXx//RrL0mqkyo7SIr1nxAuHs2PI1gFZ5kdP7SlX4pkNoyJj6cdBc7bUofWU+onLbnSpgs9JDSCOES7XDgkFoLUFsCQ9be8XH2ij6xpNr5dtoHLPJYfnSbZO6KK0PNM81Hg0JN5TLV6Uu1dW1tY+rMwxC//+V+J29Zy4wwW0s3ZTh48gSP4wEg5y44HkZgKDu9X8sCUECjpfbswyZiw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(4744005)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(26005)(38350700002)(6486002)(508600001)(44832011)(5660300002)(956004)(2906002)(2616005)(8936002)(7696005)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?812MRsu5xGTAk5JGGK31kQsMjfm84yNcsocSOQU8L/zRwjlTf+8gJ/clfrVI?=
 =?us-ascii?Q?GhNeX6dXA0kJXKFxcjeRIjYbFuxA1QSrpQ2cF3BnVeesLFzI8Njfq5IoI+NP?=
 =?us-ascii?Q?RiZC++2l/b9w1HGMdsSl8OKzTLk0Xt8qLVFEslwQdkySiKW2zMHC/BvRTJP4?=
 =?us-ascii?Q?/1wS4wpAmhQfTFn0u5Q/aoxWTTvyZ0GoG9IZo7oAA/eBht+txz0yw0wJ/EVe?=
 =?us-ascii?Q?FzofvAjxGBR9bWsTDB2/niSTzc/OmAWsDIbYuRKFBKJlSEPozf2qEViNm8kN?=
 =?us-ascii?Q?6fEfay2IfYBUOnNj4a2Tq60dIsF2jAlvkHYQCm/EJDXnljwF5klxbuoOo2MH?=
 =?us-ascii?Q?Pvq4yY2u1oZU42fsmy7Ig6zdDWI7KhXxvGuFkzL0FD3IE/2eQZyHXQrwVesA?=
 =?us-ascii?Q?INVOYYYLNg+uRdH7Cv7pQ6BiTI62DEjX0md1BdwEaCvsF8rymoMj+HTg/F8a?=
 =?us-ascii?Q?66ssNCCjzkMEzn1rgYwbppI4ABcvdj05NQpcJ6uzDZHceVcgzgRFPfQhMmZX?=
 =?us-ascii?Q?pz17ddLS9KQVdaOa3xemEuDalqr6Ob6zvlL0T5vhT51yWwzTefGtCtKkoYIE?=
 =?us-ascii?Q?YaajP7RtDVxudg4zJWGIirtLgst5KaqhCXVPgxMxcLbUTIFFjEb2guGctjKG?=
 =?us-ascii?Q?jVpUWi60oT/UxNgCqoe0yIh2gVvhl3EbcjfjJdObBWrQ3XX2WY8MHU+lt76K?=
 =?us-ascii?Q?OfvY6x6Ph8QiJNIARgA9CN2nT6kKxSjRsDbke4Q1eNvmYVTJas0LbFMofLT8?=
 =?us-ascii?Q?wEkcTPDfC3Fw46bzMrqKMkyCsln6EMDlifjB+ZHnIncNbE7B/XHStz0GE7ZV?=
 =?us-ascii?Q?Pmv5jUGAi/0R8o1u7bGT/SNrBAmUJbNw9xVxV3m1LAixRUVQKTQwagdKzrZu?=
 =?us-ascii?Q?iS4PDPcJ/eA1cTVecfXcX9YrW8VtSWCBesvDgx3XXwPDUA7YxmIVTkm/mZZh?=
 =?us-ascii?Q?u7JQnfVmhStqTZFWPfflSwMXh+qpgupEUe4WGyu049Vi46VRnlrWcQU53rQ3?=
 =?us-ascii?Q?i9VR+d+uxLAeJErDacwhULCGzAF6hsEVGrz8D7sc2NR10xowCKkDeGsw6MKQ?=
 =?us-ascii?Q?ihCBwmlpomxyWrOJHWmLTiGz1DtKHTsiks0SwdIkRTD5woWReHEeSdr6Okfo?=
 =?us-ascii?Q?qYXc7hcpBDRxQGNu4u2r5sXWGT+kyCEZinZCcXgHhZfwsHa4xKwvgLdkaGO6?=
 =?us-ascii?Q?OctOoF2TZX/K33ztZJOHYbOTqRGhBC4Rb82y7KCRM0iwcfukJ7otSDVdzI9y?=
 =?us-ascii?Q?Qyli1jiP5TLN3LDcxYt2YFaSX8pHXoAmLGy7so4sGM8eCTFI5YgMUaSAQgSQ?=
 =?us-ascii?Q?n8cmWNd4ounE7B4utBdMCYRr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a20045-6c63-4fff-db1b-08d94b1ff4ca
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:44:47.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04xTMAkA+SQDSs7C9xdZObgXIn+Qap75BU7OuqO2BuR55CoZbgrDPAzh5y1GtmCRhgmXJUGjlUeZ3X11CD2HEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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
2.32.0

