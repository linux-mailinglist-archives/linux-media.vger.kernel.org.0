Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FD43D6C9E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbhG0CmN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:42:13 -0400
Received: from mail-eopbgr140085.outbound.protection.outlook.com ([40.107.14.85]:15015
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234588AbhG0CmH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:42:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSgltXTuHRYGXZa+BrQbXTplqAhlAUmDqwR/Xnap9kyzz8x8uMUiyjJfRyQN4roQmuHBBM6oPabUoCNlaoUXGm3o5Fl8neS0AKQ2iq4R/sT5RQLQqP0aMavGMragE1NyiFKCrw8JtHHF4Br3ivVEKogrBcwLqme1RkPhJyLhn3I3F2VVRzNywR98N09X+sueLdiAQIilVdiKWiCWszq06E/09gJENi8BjHB6WVGPv+lzzMmimVrjCVFJf8nXcbEDfuWCnavpjDKmtnz5+HEozWGICJggfW3b8BWTA2QZDZBoM/5r87e87W9cbK5mZgsNkFCE2bS3a/sxuBo5mLUKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6BkH8ZC/GjpPIjmvTRiy33+NpYCVdBymA5VUW2VX+k=;
 b=g7dUOFbDt8UoN6yVN+7cwRT7MlBN2qHxhg6x1j4rc029HpbiVBmHbDRzZy4rKpZ4dh/7J3yMb0dw5Q9jTqqxeT+Fwd3zSmszcOQ7rJHxYSSS20yM3vxynEBnNt3SE5vHCAQOT98gu92bYz2qBjcgig6BWDdq4KH1g13/qa0cDrRYncPdQuMNftQSQjpSAletbO5GofDqXyi6oBghxwK/YOkF88hiOw/S39RwfXNJyEO8ViMYTw4lbh1APVJHcnhu1gwnvOHjpPGfa35PH1TDvN0hmC93QH/yHVdz3v8Q8VaWbtJ2UlIr77EfBptz8io4Jz/TUhOrnjXf+luzt+P03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6BkH8ZC/GjpPIjmvTRiy33+NpYCVdBymA5VUW2VX+k=;
 b=FCZVA6bJrfB7a3fF72H0S70uZVeK5hpnYHu1GtuLFJRVoPs7XWJk0GtvIYaP4oBtYsft+ekds2EPVLqap2sp376wkTJVWIEP7pbh1Jbmkz0gZhew3NJX8bk63DDzCu+znNpiv8YvC46NHYnzHLLD60CxJdtOq5eTRa/LKL2OHn8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 03:22:19 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:22:19 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 13/14] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Tue, 27 Jul 2021 11:20:56 +0800
Message-Id: <2a58e4f60aa17f7d7ed92de3562ca9e2ae487a28.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627353315.git.ming.qian@nxp.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:22:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7a42bec-5d29-496e-071c-08d950adbde6
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2660DABC83D8D34A9417B76BE7E99@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMdzuZvhM85KGCprOY8j8hbbCWZcDqfk0yP+7dNcK/dAlJP3/mr9RmQHKkXnpyZqVZ0b0UzGY4Msj51j/rqfcRcCzrKQ5rT/TWCHq5BNH9Uey4s7yLj2n1gohijJ5oUCci99IT39/1K1Diwzr0lz34UgIWqDu7ERx0H//AHxV88D56aP6GxDs9I0y0uya8YjbPT7WIcXcqpAF/VGzaCOJfKt71V9b2vZd6YiYm+18vzg4cuCUGmZAc6fEduOaePL7RgDxclX/oH3YRHnlAwja0oPAARNp+9z4BSk/nOq06S2Ad81nuZ3yyksR8Dnbgw0HziYrqHiv5h910U4p+xH0xmRBIMpsYxiTKygIcBpzXzZkn1apa77EFjkr+G1cNqTyiHn10XH2jobN5rEQiciB2GZexoAzOVv58WaMEM6FWk4CDqUpQRv5GmE/8WDFJvJ9N8HL1++/Q2Azw7OgMfw4Uvar4f55fNp7DVvPkyXwzYcMCuvhG2iR+7l+OK4koei3h1e12t/uOLkytpDPAn8NPDUKXaqiAvHG0+FTwbEIv9lZWsR06x8udj1HUlPXwHzN4kXSZHbO9Lrq7FukiSEgWrUnFQIF4WbF2FGirbX/G0dOJN+9yrUs/0/Zyn6z9akGZp0fEEBiEIdyqAkPx/hQud8E7SrqehG84In0GGVb3dYbsYmz9jPWoICU3QFDKvaPrpkw2GgVbXHMNIgk2tTMszTguMq2EckVuw8ynGo/xU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(4326008)(7416002)(66556008)(38350700002)(6486002)(8676002)(956004)(186003)(2616005)(498600001)(66476007)(52116002)(4744005)(7696005)(8936002)(44832011)(86362001)(5660300002)(6666004)(36756003)(2906002)(66946007)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t/kqG5BXzFmaAdbbe1cCHIBuVfoZKjpI6lX/nROe2D5Egv5odwrg3ORlMcg0?=
 =?us-ascii?Q?M1xkED6VLcr75Ict/D3b/Lu0BJ8urBQvcB+Ud7z/wUH4tQomhYt0oT69Wf+h?=
 =?us-ascii?Q?AWwM5dTA/jwxuFhC+4dF9T+dqSQpD1FI/kkEIuX2HuhCUAjj4YifnthNc2pF?=
 =?us-ascii?Q?XOdaGaSo4dfl2MqDV+q/gXJ5xivAJ4Sr743i4gB/Blpl7Af86z0wULfNCdcZ?=
 =?us-ascii?Q?s6LXBK50DpaIMXpexbGZqSHUMWUV4perXSEWN63R3c7w4w2kaObQH2auUKzU?=
 =?us-ascii?Q?nCVXgQDnEULh+BIqgslw/vQpHlrUqfTQXo9r6L+qUjMEkLhpRx7WLcqp1GHG?=
 =?us-ascii?Q?MMw/FwuOJEEe/JlU261EDeYB7MunwJl13hNyEuMv96jsIXLyuIETRS85M9m3?=
 =?us-ascii?Q?fUTP9fhsgFN8ASnsfNvlFYD4W2ZLacfZHGKI7D6iJKbvOf7oYPbRfFVlIprd?=
 =?us-ascii?Q?SYXD+YHnzHqlns5SbCT791i5sKV8gz0GcLI2DUmIHPkjkinGI+hiOsn84Yqj?=
 =?us-ascii?Q?5FzrevKFJN+UwhcibkFoInrOfxvQxFSQBxqCzQWbbu4G37tKG7PtON00DbSd?=
 =?us-ascii?Q?2pIJSL8hdd9LwlGsWroSJgfsvsrxdJKgzbECskX5AoubBMbpMrRVtQiGlJQt?=
 =?us-ascii?Q?WbJk+fUnyoNuXIUuXjyLAkmLt47oceZB/vYhVfwNfPf4WcEcKKiZDc8SRymS?=
 =?us-ascii?Q?p0n9XmyvtqJzbC2kOvFq/kKqDETdL6MJNlinwZtRb9zrtSJxm64ti4R1DV96?=
 =?us-ascii?Q?s4Ie33CuiREDpfKnpgSFA0H/888tMtEUdI37hSASVphRk5kNVqe4E3C8pFJ6?=
 =?us-ascii?Q?22n2IZKnZhwe/WGORO2oUfzuo202qdTJ+LvS9Rk0YnlIMbaK86yG4ic+rbAX?=
 =?us-ascii?Q?gqX1YbTj26R4E/eEh/5GN4bVZb8ee/blpD3+h7KvRsDlxhjtgUeSgHXaG3Y0?=
 =?us-ascii?Q?Ghj9vappqS9QzN6FUPc8XW/RG/4EXmtPwM5U1Z36dJQkT35688hLOMTM59Kw?=
 =?us-ascii?Q?Q28gNlE+iKOlDJRitKuNHTL5CI07DGk9aDyMtytUmYplOGazYpq5P7XxfZN5?=
 =?us-ascii?Q?65zn+MIoFuVXicViWqP0fJOEn0xi7NMbsfzv8uMJdMbXh4pCB73XPa252kw1?=
 =?us-ascii?Q?/+gnxqFK5YtWetSvoXUF2I4XB3LAUgsYobAiTroWW7kvxStBt3pyl3Jlli+Y?=
 =?us-ascii?Q?yUzxD/6zqez9SAEmpfg/1AeNXj80IMgkH4JRSnUdVJVAenTpikxcFriu7W1s?=
 =?us-ascii?Q?s9PY2JAg21WZzeDhCkB7GvpCwKY9FEn20IbXhm51IwJRGmFzDE8ayL2auwTZ?=
 =?us-ascii?Q?N8DE//jnypS8FVyuFUs703l1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a42bec-5d29-496e-071c-08d950adbde6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:22:19.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVDqbAq2Sb4DNBhOLeezHr60SvAjQH8LaljQOJMPlO5t4AqKoKSNNUe7gwZrt0c6+DpLizaV+ko5dBYdMxIv6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660
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

