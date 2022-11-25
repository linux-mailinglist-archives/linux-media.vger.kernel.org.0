Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D019638411
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 07:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiKYGhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 01:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiKYGhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 01:37:00 -0500
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2062.outbound.protection.outlook.com [40.107.103.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F7629C94
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 22:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnoWBxayh5cuHNf1Y1g5zYIiIBPGfDQ1M4RWDvhLIACqfpvcFox4myRXHDWqMk3w1rkUrMFFlTTQ9mEY1YP2sbCMDb2r0+lRTrWWDfqETB02SS67ankKvgDtGdtCfKwMWmQ7gpYvoyMgxtUF9hnU00J662SLzabX+i2lN7+53O1AyN3gQ/6cZg1nztFBtphBwxjPj+t2P/M8C197Uz5BYZ5MI1TJlHGAVkGPJzrYqr7TbkYR1KUzy4iB5byH2dwbWaMnOA7PWFtpWgdcGYID44Hg+EZgU7mrnnXLfrRI766//EgA4r336DF9MITdSmy8J/HU3oeBrhnKyI6QAoLB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fg/NfYdqX/YIQqE4gqF26jg0aUOxlpqUI/exu6+9MQ=;
 b=J9cchRsMGthQS4xAH11b09zhNnf0JjtVrgbaSMZCln0gVTvzKRvQU5ev2NXl5rPR3E5fX44/TUwRlmBAoldGowKOQoh2+ywVDUBPjz2O3kQuWnsv5aeh3oH8MWHVyzqyKmL3n2cDW05tKHUIyry4P98BWTF/Xa8lZo+nVyMYuQy8rcNfA0WDT1RHg8fqadawlp9s7WghdCt53TFEe3ETlH55EAbnR3C9z0ta6yVuAzmehfYC/cBltpCe42wHXX1exXa153INS0Nv2rfOVu4R2nkZ39UgbXWptSmA4b94YrWC0GpFO2hsiVTB4w2GEROstAQ3w0kvLqP6FaE1WwYlmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Fg/NfYdqX/YIQqE4gqF26jg0aUOxlpqUI/exu6+9MQ=;
 b=L6qKvlHnu/tAsr5ubm73HnphNuWPRhNsQYmdqG9ZP4BSUSfkX2yM3P610plHJS8YS1mf5ViDocNr7A3dOUty+BiAPqEzo9rQnZmaSkao72BmwvGPSyA9LCNL50b0KfNWnwRXTbcJgFLAt2UL3p1adzkaWFLaGOfrVv/dsr4IvS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7754.eurprd04.prod.outlook.com (2603:10a6:10:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 25 Nov
 2022 06:36:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 06:36:55 +0000
From:   "Guoniu.zhou" <guoniu.zhou@nxp.com>
To:     linux-media@vger.kernel.org
Cc:     slongerbeam@gmail.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hugues.fruchet@st.com,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        guoniu.zhou@nxp.com
Subject: [PATCH 1/1] media: ov5640: set correct default link frequency
Date:   Fri, 25 Nov 2022 14:38:16 +0800
Message-Id: <20221125063816.2728786-1-guoniu.zhou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 900fbd34-1e77-456a-86eb-08daceaf71f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZccTbZrE1bPR2rBa4v04Gl1qqWmkSE6McW9ZJBf389Ovj+7enwLtcFKquBI+oZB4+MCiU+PUBHD9SGG4ICffPmXGw0kjmFLMbrqgFF5XdhResRpTQ1rRfKd++CdYe228Q1JHIsF9wiw39xwG+2vn5U3PGh08NMURB5lCk3VNpjshQ9NEecsfWyU6p6b+Z0Z8T4nBKFDmMEP+bmmv11fF3i9C01w5/DE7qZC+Ed4bwyD4ohLov402b94c3aKk5lf7GgyvJb6PS33nCYufflU6mP2VA8dIg0n4IlLbq+JynpGTlT17SMGZx6WBNVj7sBfSb4aLvooakoERx/xGRr9mIuhF6IB5PlB0fJzcpfP5CyqQSE7/zrsY9R8a+7QHRN2E5GXRiZ3FDbpo9F6G+jDBOo8z5CofbXITueJD+rwsLiW9tOTj0yM1wHALX2+liPMomMG75RxbmNBTzxAr56SUGQ3rjsE35VJwK4b0MnMiRdIr5nZJDOg1mOVRbceq8DE7NXNHjEQlDKpHca+ipjknYvvrJ+CVYhASUVyhSyTt8nm9mhFntQNDNSzhsEwe9OCBmpXD+6VKuNbUfZkapJ6i5OGkh5O1CGwt80Rq4KQvuukUaj2O9dj2uuJEnIdkTS+A2zPwLZhHoLImp8HsSZ6cTEOqujujCR7i0A5WlMQJHdc7C7LXBistGQO4nLaF5YlIdzh42d1egYRZMzcBE77aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(36756003)(1076003)(186003)(66946007)(41300700001)(52116002)(8936002)(66556008)(8676002)(66476007)(26005)(6512007)(4326008)(478600001)(2616005)(6486002)(86362001)(83380400001)(2906002)(6506007)(6666004)(6916009)(316002)(4744005)(5660300002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61LxfsuReJXQBxSBd0qEdlPIpvS7RMUsNdxuYP0FwgkdZnRxg1BrrJg5Xbvb?=
 =?us-ascii?Q?Hmp1RSJUeHkY6XbSVR4ba5rI5pF23QWdu0ZwR/vUaAt6ZJloUWUTYwnAegyu?=
 =?us-ascii?Q?Q+2AhY5BX1Y+Dt4PYKZqFJs9sYKQ/RVFFijSKdeWd1IE3g5oOcCtK62NWrmu?=
 =?us-ascii?Q?yNNCQioLefsySmPasBnK4YGw6VAa3O+bKyZsSF6pv2W1iyq46rAiE00FK9Q6?=
 =?us-ascii?Q?P1zmleKjMcpRcOjL/BBPrT8YZuCfXXRMDfhpsXY8z1PMyJDbkOiunKRHKo3D?=
 =?us-ascii?Q?F79XIFWywObxe3BqEY7qBq+xOnCmeOFZ8sbVh8hQHOxb4wcBi9qarAygZkfz?=
 =?us-ascii?Q?xrGhOkP09OeOf5FsrUdwquU8m0u+EuL7hVfnjGhc5rAH323xqq0vz344l6Us?=
 =?us-ascii?Q?hLr36H22ErFLhvRlzdd3hRNpWs9BxXbFr/ScVZYrZgw9Dl2AXoCtZq0Wqhma?=
 =?us-ascii?Q?KRaHuHjKCpCCxZJoKvs0eoHAMgVfM7IXr5oTsvI5aZBL9dBl6FZ41KfaGuiZ?=
 =?us-ascii?Q?m3r5IDVxMtV+ePRSF4Ig6tQ4yr5+nmMdcaBRMTKqP4E5+XJ3+ZoK+AtGA+T2?=
 =?us-ascii?Q?GAMRjqa8dAW3H92Ur7NoYPW5IFvwtzIqlfxHRdu/gIoR+bib/h0uXsrQHNX3?=
 =?us-ascii?Q?7iynH8SAl+nf0M1cbYmbTDZ88xpGyHHlJT20JfF7UsyinnHPRHW8+qLsEPIF?=
 =?us-ascii?Q?uUDLixMJxH2p+lSkfDN8MFr8bKztmuGoa2YjDPAY25WRQoLcJSAdjyakINyb?=
 =?us-ascii?Q?ozJYxKHZpfo3yaIPHiHy0RzBDKPIOHwPp1rFYYw3n9jQNuVC5KX2/mCdM/Wf?=
 =?us-ascii?Q?rqilca4imuukWOL//rSp7DkJr90h/mwUXEAEsTgCTDoIJnL8Wl3fLYYwUAA6?=
 =?us-ascii?Q?2kvVJN6qvwVrYPUV0IMjfynPYnl2yeDD7WgSYSY+cxb+3yjNIA8Hi2iwKF2G?=
 =?us-ascii?Q?+I+AjEPaiyuzzU98x/plZwSoJwF658SL03bOIPsVh+2R/TWNGk+Rop2QYAri?=
 =?us-ascii?Q?fMpZzIRgBCK3SHEwz4zaow75FAOb3Z2fmN3TIc5MdTzkza4QkFxJcyMMGAVM?=
 =?us-ascii?Q?lj24RYML5zlPbBDIbw0Lujw+I+22L8WKZlNHHBKl91LshJEOuXocxq6VOpiS?=
 =?us-ascii?Q?j7DA//ejeaU1cc4bKJkbqhVcwzr8h7koLneHeMKXrfOmimDtk3w2Er8JquxN?=
 =?us-ascii?Q?i47sbOC0qI3ZnoWZfFF9opPC0lBfjmxUgl3ipKRrbgQIpDRNCFqCU7BrN91t?=
 =?us-ascii?Q?cuYrUy/aKsMJJdvGfGB+LUgukF0ApTEkcS2Uem9lS6lhe2q3cE+ygZ0wf79o?=
 =?us-ascii?Q?jH3PxvfFr78KmE0nSeLM2Bo1RV4AJasJQaBofDOShRBjledTTgCB4FsZGRnC?=
 =?us-ascii?Q?n2Ye3LutH+MX1AEJeglW5gMJllBUMOv+vB8avvEq7ox2YiA2T+TcHtz7/8tG?=
 =?us-ascii?Q?69dir5eK/ZpKsARaVPxlU3G3evfyufBtBqgA9qx3Rm/hq9FYS+dekSBVJBic?=
 =?us-ascii?Q?NKMIelRawS3LuzJn0C4Q32S8fUOMVNwe7JibHKwstNiacLEU89J4mOtFYqke?=
 =?us-ascii?Q?pRDzJrLnSvjZqyO+sHmLoRLtxQ9as02WHvJhuSAk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900fbd34-1e77-456a-86eb-08daceaf71f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 06:36:55.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7i8l6Mfll/e55woOejgvzkMJgF0JM6ErOdpMdmUOob10qMf7Kt/MhRVOau+GisbauOWIvEjnDECz/7bwDl4FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7754
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

current_link_freq field in ov5640_dev structrue is link frequency,
not link frequency array index, so correct it.

Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ov5640.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2d740397a5d4..3f6d715efa82 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3817,7 +3817,8 @@ static int ov5640_probe(struct i2c_client *client)
 	sensor->current_mode =
 		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
 	sensor->last_mode = sensor->current_mode;
-	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
+	sensor->current_link_freq =
+		ov5640_csi2_link_freqs[OV5640_DEFAULT_LINK_FREQ];
 
 	sensor->ae_target = 52;
 
-- 
2.37.1

