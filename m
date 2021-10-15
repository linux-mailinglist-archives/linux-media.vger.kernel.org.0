Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA58E42EC2B
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbhJOI11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 04:27:27 -0400
Received: from mail-eopbgr50065.outbound.protection.outlook.com ([40.107.5.65]:33799
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234755AbhJOI0U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 04:26:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGQxybJqrBKcOKmPq5eHQI/GN8fNN/HTslLVWiiSKk5azEYf+1OWHJX1whxguBN8p3kbQd6VpMLhRp07ShZjl2ddSZv/pNME/NGdhZz74D+jqQe/phpgQoiWIgZbbnirbbNnvLmQUfWPHecRRCMeRjsBus4Vd5naNZ2lZCMzKsO0Ea2xevLZqibQpVtS6KGdQYBfs37ynfbd6sxb8/PiPiUyDcddr4W7K6tqX1e7ilfokn69Hqp/gby7PKm4B62AKRwtimUhUSrNXtVcfwGntmRMPEp15VH5f2SrxI7dbdeNfuPkHlaspQjqC/dv4f0M54vPb+fUDrInwjT+63Sn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHWDSG3+IlihVMRDW1j90pRI3F/slKG4Im7hct5HmzA=;
 b=aFIIBcRkKkitGh8JFC9EhHkHnrqVnvJCFJrRhLsj8H7WZegwFEvgUnsodnqtNEQihcIiVE2r660V6hQ10FM5AJkWn/EF24v80Kl+DpBZ2na/WHL2+VSA/RbbokCalajgZUc/i2pULvBDbz/klQ/NYGP9+vtgcKmSiSr3AgeIFM4GnHgxA3iQRFf7e8kNdY2KzLY7qbK0VRWkKPxK+8nEqxqCfiAHTuEcHyAD+5n9Ifo7HEJwyP94S7cdgpObTX+N1VflATNUPsV1++KhbumpqKVrZnxWWF+wjZYpNw8elYrgjasyIjkgCIkwNDF3aOGqyNHcLb+wfFAEvwGj3ivnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHWDSG3+IlihVMRDW1j90pRI3F/slKG4Im7hct5HmzA=;
 b=ZxYSL9d7FtGxA9POpGs6nG0jcj/mc19QgRazZmhWnvdbe75NXm2zdfzJ3cndqxgjqRK4SUSbDZ/rN2jhlR/IYQx3ODPE6Up/4jx51dME8wE6DIFH0l1dapD10KOo3KZHk0hum52ouOTwglI4Hf9SSskW+IStGcFxygMczOUwLmI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3591.eurprd04.prod.outlook.com (2603:10a6:209:8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 15 Oct
 2021 08:23:39 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:23:39 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 12/13] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Fri, 15 Oct 2021 16:22:01 +0800
Message-Id: <969b83cf0d75298b53cc25b756ac289de843f9b8.1634282966.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634282966.git.ming.qian@nxp.com>
References: <cover.1634282966.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:23:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da5592bd-3976-43a1-c4a0-08d98fb516fb
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3591F66997B3D12A958C7B9BE7B99@AM6PR0402MB3591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMs8ZV8KsDLSMbXrYa4LSvz/+je5hK5AIdqk/vNBMTXerXo1tyzmWr4nBu4VFo0CRJhscBJC5f23hTF6cBg9lLqsjJiNYzxR3VgObCht1qJHnZwZC02q8QbGzjAdO0FCEZZCMjMOMRiNvn8JNBk19E+cHdt/BRrLNb5NstP+EjidjT2qATqjOT5lvSQjujLefzOhQCTiLkPD+khdQXOwWsyzjyNdvH8xBdZIoBl7jsV6rWU4DRdyLAStoGgpmiWHeU4peRbn2BihkCeeAq/KuZeo9QyD3XNYYwqVwvH4bISE81t7ztDss210dhasoVOrjJ/wc8OjrekzVIOV6nm5owcMrcNlqfXrYuaMjGaNr09mkXxTsLSnkCkPj35RWdhDVRAifxS7epk8Cbl+w0tCtRZio1Gpc6t9kMlFisepXYw8uVROFO7Y9nXzo33GAoxK8dQhiVWakAFfDWifpX4h8/KiAZkodZT+V/0CQIYM+6X1HD66NgjsjMa41u2WheQQbIvnZrgDBzd5FFhnq2SjJjCV3ooqgBw7eienHuXEubqoaCtmZWD8Z/VB64AfwAhRV9JnidoRCJDt8SyKK952FHUC10eHSWBILE5aLlxf1oY7mAMSJpANkEZ4pASMP1hEJkqgl2AUW71Hysw+28xz8NWTHjjxPLktaDLwi7Qx95j8sqjX2Ry9Sr66/WWzrBWdWAQ8xM7aS0Ikx6lg/vlhMiFbfV6k/CsCGYINlfAViHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(66556008)(8936002)(956004)(4744005)(8676002)(316002)(508600001)(26005)(6486002)(186003)(4326008)(7416002)(2906002)(6666004)(52116002)(7696005)(2616005)(66946007)(5660300002)(66476007)(38100700002)(36756003)(38350700002)(44832011)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kSZZAFObdEbOM5KvhTFzOyhGNo+ThsypLPbCQEk1iJxCg72f+k1kD1b3Oez3?=
 =?us-ascii?Q?B3cz8PWAZEeGIChaTejRoqhnihT7h3K3dLp92ftxEoKPwlxVZmVfpEBM7zVz?=
 =?us-ascii?Q?BEbqSOQKqxakmtcNZtAvZhhCmIegXKIry8lmedy7xwe7y+GCCEc9I8EvNY0P?=
 =?us-ascii?Q?W822FnCEgpie9x9CReBndFfEC/IfvO/RZQ8XhNKLEN9MXPhBMRTq6NQuADdS?=
 =?us-ascii?Q?civ2gIgVY8bKatabSSJxA3Myi4BsNXVRBFqx44ZTGaTp4LWWYTqoXrZy6r1Q?=
 =?us-ascii?Q?vAKrIw7fmklsDBS5Xt0eQZC8RnDyNxQUeAxy1fNej8jkmDKgMA0IEBLxmjS5?=
 =?us-ascii?Q?RSID+vzURKqob9EI1RpHGR8nMa1gHJDS5vndkrAtFZ9E31A32yPcxpL2h0Vx?=
 =?us-ascii?Q?sjPzGsEi5F1lqYWuRxbYcVXyrgCY4o0IBZWvrZRCR2KPQHaaAFzsRCKfPXqz?=
 =?us-ascii?Q?/ob94Rk9/Z1RG4ajq8mVUBqWkthdDSgbjMx1pDb3fk7nHUiO/WCF58VZnJYs?=
 =?us-ascii?Q?RywDhAucXQz9io7xHRSaq2mYnJyaKhZ0pUYvKFv6/GhrEjATb9eE6LWcWSGN?=
 =?us-ascii?Q?rTif5oErzoHw5vTzAtRLufetIAeAJffRhSO6W3Ua6Yq42ivSsKsH1Z9tluzc?=
 =?us-ascii?Q?4OrioxFyVPZ+gnYZ1mRJyhVB5ixR2a/PPdMiKAt01uqhd2kbIytcvzX7/EUK?=
 =?us-ascii?Q?bVXIZTlLEWq4BU5kwWGx6SYq7HQRyGb3mbIbS0L1oVQggdio36h8ZDmkTXri?=
 =?us-ascii?Q?4fd/ZxsMnFM97Q1r7DvJU7iGtvjZ4c8Hw043vQ+eHJ0WA7Qcmf4PLXycradA?=
 =?us-ascii?Q?e5gVz1haHh84v3AWOpvZwAQLBbW3AaCUegcWOVAtBqyOeMKdpRbZbmyHKitw?=
 =?us-ascii?Q?U4GGHh6qAgPV7Xl2m9O8CBW5j3TKOrnrcPFnbwV1RGm3awic+Lo94OXknzHl?=
 =?us-ascii?Q?HpyosrfYyKneE14zxCGV2LksQwPIDZ3nsyN4F9cMqJHEdqldvtYyylCfl828?=
 =?us-ascii?Q?QvnRC9LsjiMYFqzuoJQhovA9i9KT1cIHlWvpLwLLJ2vtiM8Z+BYHZDDnGrdQ?=
 =?us-ascii?Q?ONn7HE2470b0A6mgmFlGpwgf/ftBVuUUYn6JvTKtsBwWU577oRKVThRunLx7?=
 =?us-ascii?Q?464hWpMcMKgRFuSROdQZebHzpdKK6EWRexDSCSn8wwzfVPj5hMCS4RMJeSrn?=
 =?us-ascii?Q?YksK216GyYeyv8s63N7q72UhrdSbvSMYgwRp/wAYEnO3T85iLJSFox++ft7D?=
 =?us-ascii?Q?BffHRLZrAzC82NXa1qlKBLGNeT5gyUkc7JRHhlVIR24iijwKZ2Mas3rXDrx2?=
 =?us-ascii?Q?Cjl5oJFGd0F6GXd5HcX2g5E/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5592bd-3976-43a1-c4a0-08d98fb516fb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:23:39.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJ1lqFqxtwd6CptZ3HfGZI5uTCNhflwESyL4jgJYJ/S+F3NZ60XhDIK504rcz7MdUOHfdvokehGEqV7JZLNzKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3591
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

