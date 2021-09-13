Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8D14087F1
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238780AbhIMJOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:14:48 -0400
Received: from mail-eopbgr140043.outbound.protection.outlook.com ([40.107.14.43]:39618
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238506AbhIMJOn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:14:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edghxFXvpdqRydWFckZ+WwwAcaRdltEGsINeCP5wc8fGEntSDvEgDT3Vb+jvplbasjHWs68+4k3UaBCVej6EhsO55+621RSA343OXfO+No/DcmdDxySsSyxc857TNlAhkb53V0y5cCwhAAPfzj5et6t0olINtQUsU+sqosiUhnlcBOaKsVeEzPj22Ix1nm4KzufNgSW0ZcdlT/aDseIbX8cBpxwo34FHqTIc+K5qxvs/Wp7IYWrUPBQHsb5oiei0srizUk1fMurpH947IObnrwvKlieEQYhD5Gbm/CphQRwGbRyBCr0psjxrLCYVzFFPQF17iZB51JnZDmAdzEQWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=NYFT0VSzhnYEumwkq5WzlnQmNBTKix8gD8sF5Y7YBS+0lGqojNSRAuc4wqur6VdzAqSbDZHxqKtGhAsA1BD+sW13p4WdeK58RbKMjai9y0KHelrzwZL0r/LgTzfZ7xLM9e2WyP6IuUtz9svABvBG4pnuewYxNMMqKJVzwt7UiHwJxnBeUobc1Km1pU1S/8KY/76eNuLVWQHj4bqIupF4jClUE0WWGIduyyL01DmtNkG+nAJ0omXIQlJVYSf1UV8GMmEsIm1H9VvWUVZEdKf5FRL2wVZLoMDeSBu50wvj6xdGgu367L8gBdBWJZq0iaGhHfhNZsdxZTxWoVowXQeC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=Mf22aMUInhYkbXDsXdrqYm9+Vd0x4eTXB7TY1LbsrKngD0qup/mw9SMB57aQWFm/SBXFxn4Ch5v+MUyeqRg5D7yPG5uEtHRi7wcdFrqEptwPv/FFW/WV6j1CeO1Zm2HmPIJ6UCm4fNu04v+KOv6mrcnO9h635IwZO31td5Pfpqg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3925.eurprd04.prod.outlook.com (2603:10a6:209:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:12:34 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:12:34 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Mon, 13 Sep 2021 17:11:14 +0800
Message-Id: <2eb67c17f126f196be5cebc81a9a9dd64c76cf03.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:12:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e508c80-c8af-4a1a-097d-08d976969f3b
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB39255D5FE43C0EFDC122D7F5E7D99@AM6PR0402MB3925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfKyfB+FzswWml0Pze1OQPkn9uJVe8GRQK1E/APiWGd1b+GkeLwOV+c8O3JjIw78dh6MQuf3lxGZ7gHgZy9VKOoJji8GLW73JghmFyETCM0drjC2G6cpJHFxoH/3kcW7t3HgaGacfZIU2C5/OkC7uBgStUfZ8cGmFgcd6u3n8ppocXdZT2lhhLCABoOnP0Z3liroIfWaVJUpRT1VKbwWf7U0zsI22/maYRXYhakJggKpYBeqbrMmNf0xiMYzP/JwnNdxQG8A/qX9+vWsb7HvV8nosDRLUuOtB5p08DIvn5sDRbelxMYSZTKMj4tNSPobig/cIQqNsp0/Fw51OT08v+dOzgc6fbew4+wjzsY+rQFDyQPjjEtuSGsZT0i94/ieJH7+T5zVeWNuHdbdbysMVXDvqTwOao9rbuU8Ipu135i6O6qwoZ5WHwtX9ZHkYyrLHnz5qX6BxEzAiEFq8CCkk2gxAtQhGzmq0GaCVYxi8vbuk0RCaaMUpylcciiLP9m1N4og4sGYXRtd+0Vw3B4Avmn9UI1UOFoJhhdkSpk1TiJ4b4VbAce3iFyJOtXSWQ1pR5tq21cpm20tLni3mufd3nPNAaw3+4BXlq7+r/nIcmxjGVvKlG1aOgja3hzzpHRIcfxfP88n9//Q4herrBBJa1Z4GIO6z2BnVjvjkfdFpenmWKTZSIJXJBdFT40FURoQfzrGFWkqW0kbslGqNeLm9BBqPIFXKzQfJGf6lHLngSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(7416002)(4744005)(66946007)(66476007)(38350700002)(38100700002)(26005)(8676002)(6486002)(52116002)(7696005)(5660300002)(8936002)(186003)(66556008)(478600001)(956004)(6666004)(316002)(2616005)(36756003)(44832011)(4326008)(2906002)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4gTcWjrSHRKTyf7UoN8hZHRKsIVCoeJ6r9VQZZpbK4c0O4ylwLvQnQW125z?=
 =?us-ascii?Q?8QfjjtGQUlFWHJIRMh7SLrwnWM+tTLUOjkvV/Ogy77EBcr5syznnC9sNsECW?=
 =?us-ascii?Q?e48R/pltYMHYEOQ4Wv6bXzbdyS9uUm14ifd8zBtzWDVmTc4PeAfawRuBAls+?=
 =?us-ascii?Q?/027o3bNBF6kmw+BHODRlssssS7vCNaIb9wpjlsm8JGK8KhIEw9tqmY/Hc5F?=
 =?us-ascii?Q?y3InwaOA3y3KU9o9lIM1GGw0waj2tS8Wy1OmTYHCTT7LI33uEwPlBBOW8RSc?=
 =?us-ascii?Q?hh+syF0n31cJxZmV22iLrCQ1AlOXjVDjKFMuRf+gSccZBnD4afjqkFq5yuET?=
 =?us-ascii?Q?7OPsLDbv09ffoJTcL6oS5Ka7BDqNkQdRmrQIjaeX/9eUDmqE3nQObtfKOm8J?=
 =?us-ascii?Q?tM3n0JVGqDJXBuIB4AJhBDJtDY38/isJ+Ki97j5jwuUoaESvVPMDZNTeBOpi?=
 =?us-ascii?Q?PC1KWUCmNS+posv32EVhTtf4RDqzHbzcco3nL+WhgcSqPmuQZ+kxT5zbLXT2?=
 =?us-ascii?Q?aMbtCnmSR3oh7PXnh95q4jGjqTRdUPq+9L2bzN7MOr22jGY0QBXk261d3X7D?=
 =?us-ascii?Q?E12ALKIQRDE9BrrOef+5Y/84Na0G5EUSi3QA0YYKNzHX6reqREXtXKRI79HI?=
 =?us-ascii?Q?70mm860PHvN0wItoW1syD1z6x+OJDrvwgAa3kj2EUkh1XxqyniNEyUya3F1N?=
 =?us-ascii?Q?U88UggRTZO6371ytBYso4CcHKvWTHEo5/2BSh1QBPXTv0ZcO4QXUojG9Cter?=
 =?us-ascii?Q?la2W0qrJdoBwuBIE9N4RqhN1gxUASz0fS8CzHcVpA+x837JnE/o1WhFjRLg0?=
 =?us-ascii?Q?7OKFhjxh3h+2/x9yPjadS+QLhfZIftAUCqGejCZeJpHYOYS9qKG7QUsgpBC8?=
 =?us-ascii?Q?v2C1RacmuqZRsF/0OtjQYBorTXZ6NWav3sBgfIGOmYXFj87iMSkTmOR9RsKg?=
 =?us-ascii?Q?1+OvGZhcQbizNnfKJ+/jAAvrxfKLFsCViBVrme0951ls0KQ7H5tUVvolJO2m?=
 =?us-ascii?Q?swZiK6+4YKQbgXDqYILHUGG5DCE3Is1Po+GNsf7PVgqFlJzHaERTsPdlhI0O?=
 =?us-ascii?Q?MwfsXYmW4n0LAZD5Qo4IU9VNuO4XKE5ifaAJfeeT2obBLEtIbH/xkQdemAG0?=
 =?us-ascii?Q?2EuCnqhiXON0XttyeE3BI9yeZJN7stx7d3hEJje1l6n5eJwmSs6DJO7DyKU8?=
 =?us-ascii?Q?iHA8h9+jCfqpeM4O9jf/1BPkkUXYs+pVArxYzyjZMrmzl2UNNyi/tbyt6UcN?=
 =?us-ascii?Q?iq5kp1ZkLSBvMBuOYeq+9AD/UwdQeNBAa8dXok4y9vEP9TYA3WdW9oe8pHaF?=
 =?us-ascii?Q?QisSmyyegVbT+8U2zQh35ARe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e508c80-c8af-4a1a-097d-08d976969f3b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:12:34.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIolKAmCVSkn6jss0hpry/ia7NSVImlFkvAUIXi/Ssv7R74kcqwSbNeTCgHzhBpvcZslXkky6Uqd10xAuWf3Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3925
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

