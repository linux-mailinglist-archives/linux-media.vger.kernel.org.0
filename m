Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE3F39D7C6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhFGIqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:46:23 -0400
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:5364
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231192AbhFGIqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:46:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkApUQtsRe13V+VJQmmNf/nlids+eph9RqE5vHiVvJoLWOVc6CBKTaU1oADp6PnmtHXt1GbTQ0ACLxryb94dYZQnGvfU+5QJ2DGbG5T0oUU1HKBjhNSd98iMK+UDwr8bnmTEtgd2qHLIGc9VcBfwI4UuJtfqccuHwBk6XruinwqKNmPFICm+CL0p+Rgd1LZN0nG24cnZ6JZxjcAtaGZSMzivyHX+U6+GdmMbN1bcKCRevNkQQxwB8oj1+UnnaJD4MGHI6nvroXUucNBLG5oAjSnFLPlzsvqxTQmlV+GnFC0I1QXcwrsGMkwuly683RD29slyrza2y0XlxehRmD4vWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtJU9ThdFQ2vesv7NRfjzO45qk6p/6vA0zf5wrflbc=;
 b=OMled6ZTgTb+bqDFTbaqwBfXbgZQlc0bQORMd8DUjDZIANYVNoU+EUqqgdpdwHBM5ONp2cWONBr8kQGX1nBPdStxHqUepkea+oq+CZTVS/PnJTTD40p1y+PENSE9T8F0k50LjtbO+epCPYZzh5KQwbCpTp3i+hkse54LICrHZwWesR46SVt58Wl/POWZLFCZuY9Le4pwvM380FmGIQy8RcrhjCZhaTUwAiCcBffi4eCYfHL0soVAoSzLpuTDAh7h6BG6bqSzst1I85IR3J7n4rapXMsfiwRudiiI1oX+If786JZXmDk8Fwnd0VHL+NqVeuupTiHoB88rQYDJiCfl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtJU9ThdFQ2vesv7NRfjzO45qk6p/6vA0zf5wrflbc=;
 b=cqUr255Mzty+eRQUtrqV8JQ8OOnYKSDl/90bPl28DpHapaNevEND+Nob+wgTRQkuNZQwgLYjUqV//zkik+o9bKtzPSz4u55X6U/Ihj3r23y5uYJXmATWT+SPGhWFJ5GRZRqkgYwhM8jgYhTrAiSRUKqxKHm9KjFFrvsQwf9+VN8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6696.eurprd04.prod.outlook.com (2603:10a6:20b:fa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Mon, 7 Jun
 2021 08:44:20 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:44:20 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Mon,  7 Jun 2021 16:42:59 +0800
Message-Id: <bd632eb05e438c3eeb7b3aebbdc5bcd74fbe648e.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623054584.git.ming.qian@nxp.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:44:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5cc0cc6-e022-433f-542f-08d92990710c
X-MS-TrafficTypeDiagnostic: AM6PR04MB6696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB66962A706AE77EE95288EF23E7389@AM6PR04MB6696.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cYVzYR5nYpdb8j+FjZ6yWvyivEBSMde4jjbjP90XLge8/I865J6n6KywkMAhLroCRvJw2wlcNMzJABbajeWPSqrNs3495vINOcaIde4b2h45JPL1GxYrhbh6vgxUf93CQtaGaVe4pEM7HRFy3sRoT6ZXU7224cP24tOoavhGLcb3vGpg2TCmbvQuRyE+3TMvAFgugtRXZWerAtj0HFiNx1sSy/wW+DjujSIPI+Y623C+374h6bbNkRk9DSKcNiqIVla5C2kwGnItpfrrOIKuzHMHaMEYcaH3L6HPATHqJ0ktmeY1OkGEw/XLyj9am4JzVIQb7haLHNZ68SryUn7buhzaKXT8K+8hp+cn0zYmfKFxQX3AV8POUWqgTNFsRMC5QSkKFWGXH/QBHjgK70iVgSH+2hKYwqbXoa8nsE/3OZRuKCN+7N7z9hwfzdysvtp6pQzHal9t2MosZBvdeqWVyqQnDsLv3y6pxC34lpHWEuWeEMdriVCJZ9FFJnArCb5vzSL6NP3oGvf7PBNn1FOwv3ySIZ/51INFXbxkSDHemR17DpmZRGG/Urc0H11Szb4cJzInKXViY2kmrUTNB1h+eIFlLt2fuXjW+oiWBAYNaeROEQ3ZNt6BV6DS+XcWbW7DIvx5IcBsXs172QE36KSzvOlNkFBWdTDda3yV9TCMAiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(36756003)(6486002)(7416002)(4744005)(4326008)(16526019)(956004)(6666004)(186003)(5660300002)(2906002)(38350700002)(38100700002)(44832011)(26005)(2616005)(478600001)(8676002)(8936002)(66476007)(66946007)(7696005)(66556008)(52116002)(316002)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?drUSXjUqlF/2wgnuSpA6/BdYBk50MIX1geNh6+tmKYgqkZQpaxoyVY1/5kfR?=
 =?us-ascii?Q?5p5iOfzacWrj3Ftw+OuqJugP55+uzcgncK2gKYp5boU70KuyXDevm8sp06H+?=
 =?us-ascii?Q?kjQe+97Ii5mBqfRLVeMKgBTrT7ELTCQOebxn3j4sydEqNHMTvHlKKPZVyyCL?=
 =?us-ascii?Q?ZpwU4dvvdVk1q41st7w0MJb8SWCoyAeDaZ0hpbSRn1eyMwBveKNP4u7xq9bV?=
 =?us-ascii?Q?2UdbPWbJwD22ZmxNf+QcLSGjSTNN8O1BGQ4DI2/OMqBBI6E4qGzRfKDuIHXH?=
 =?us-ascii?Q?+h59eZbszySKz8Jn9oBn5UB6RG6PFQvZqoFUWEXJY3UPwrK1TuXGW0UqCh/u?=
 =?us-ascii?Q?bUCK/llYI7maR3h7FQNuRg1r2hL0hV8wEgY9TP3Zgih5vy91yAgV5gCg5dmt?=
 =?us-ascii?Q?aANHpHi6tAak6g5TTd2VNtjUPRPgHrsEpchIz/3kFLQxtGFzlC7fb8uRExOE?=
 =?us-ascii?Q?oKU2De5mqIubN5Xc2NHzCYYF7Ait+Kx8NfMSLl3IBVrC7bGVV2zRi6hqf2Yx?=
 =?us-ascii?Q?m7hFyQWaRa3EMisl+oXwLdhHNeskj8HXNiQq87JqwfUfl7CQ8ZnL1HPek5Pa?=
 =?us-ascii?Q?gkZ4ynCiG3YCngz3IMBvSphdRCOi5123OKBC2FaUwKZ/sGvq4Mhzi2k71/ar?=
 =?us-ascii?Q?RFx1+lQMmDlw0+wB/fN/+Imfnwrh08j6foXi2CMTluFYq7u6CtYea27vaXCg?=
 =?us-ascii?Q?N0YPTMBduCg6ZCnCyq6aa9RjS+iO5J8NphalJcpnyLontBoIyCIl2v836fW4?=
 =?us-ascii?Q?1VKt81z+9bp59SG8gcwQdEH3c2tlhc36AregXc8oVdosq8sRS7JzoJLQ4ewv?=
 =?us-ascii?Q?s3sysrz8c2C9h6NpTuihe0Htgdz4jL+aTKObvLJ6+KlUDhfWMO9ART5CK4Xn?=
 =?us-ascii?Q?mf/dhHyu583q7vayVgVP30pEyBWoQgd6HLmTrSVMPhwoS18FCguwHiuOJRxD?=
 =?us-ascii?Q?bv/kjfy8TuALWE4bhIEkVLHkOG1MLPfx2B6bGGBp8zrh0meXwi+gjnjdVCZ1?=
 =?us-ascii?Q?rLRDbHxLbfIE9vKqpF6EGKqE4LmEzOlfK90CB5UOp3uNnaN2okJGl/aJvtiU?=
 =?us-ascii?Q?a96O/8Ynje+n2uv/rPEshec8MFiMkBl8UvXbjNxH0p5Knws+4esrebsd5GKH?=
 =?us-ascii?Q?vLmotpCIdDPZ4KAA2+MfqIXDvPzWa0Cqb3dkEoNlfh/eTpTmdGUXyDieG2IR?=
 =?us-ascii?Q?Zh2v+0lXZoAXCEFOlkyR0uTyLgnNtZ+Cro7kh37k/9ijDXH/7vu86eZRZ7AZ?=
 =?us-ascii?Q?cbrXWj7MpMDIraghEoxNTrUKiZuTy3meIchaNdDygCCIgewgfIvYkLQQLlSy?=
 =?us-ascii?Q?IY2/0fMjfpJ8C8loOPlQJqx5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cc0cc6-e022-433f-542f-08d92990710c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:44:20.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSDGuYnfpzO3V2vwMojCObvVVhzRg0X3HEYehPmBHvxp8t54vCJpe8C75CkKRjo47ceHj9ZpQIbrIfhMmGQwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6696
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

