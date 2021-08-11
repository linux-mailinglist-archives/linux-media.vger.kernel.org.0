Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCDD3E8C45
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbhHKIpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:45:42 -0400
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:2016
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236493AbhHKIp3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:45:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFEn7k+7HwlCsMUMfZLSvhiheHxS1Bz2LDZNHcfFASJOtLZAiUb2KqCgtN+Xry9/Kms53Ja2Ibnz+h3qJ2LBM0zpTwRCibe1tdmYWVEQfYF8XRg23p2Vl5FYQj6CoH3oD3tY56C1hrctBrYp+i0Cf3cETtKkflUO1buF1jJ2V6mZViWnN6UU5TacZXEkkxij4kbqC+VNz8ctClpPApGZQ/gLIvvYyCdBsex1M+cugBlJoVDFn84QBT5MwgKma0ucIuL3er4FoqjtAVgZzF9WFqq27GuHdKN/ueXjISuiKlPjwkYR//5bzHPlm0BZNoSEmJytEPt/vRIW1ulNSG1tLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=On/2nhhRCOD5CTEi98hjVF9sBw2lKoyk953fNdn6fmNCy8kafzVJrV2L/lpwKHXP7fh6x72lwRiDYHMRaoHCpio/YumyP5Lgp/CvdZObu3gSNlB1hzSmv4Hf2PWvHL4T+7O7H/vWs5AjhcsVzlrCNzhEepocuURLpW1EbIqxuWBWSFr1JCICxExLmP6OWmwwCQrnBqdBvSzyPHmzJh80uHyiugM9nTqLhzwn5Mk0AqAdI8OXqbBr+F1JwQVIP7mKtpKV8mFnqyHZTV7xWvu9ymOpE/Y4851s7BQoLUT+58IeTGBtAhTWreU9oFiSllMQAS4yyzEM5J1WFC9FLu7+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CphCoXulIFGtU2AEB4KsSkyW/W7RFji+tc3255MclSo=;
 b=K+lpAe1y84Z6lfhUhT+bvQwObkrNu8xuy8sFiERfumk6ABUObuPXRAw82UFahglRr2mfZbrGVQrAEAxTOs+4fkCTb2ePLmB4h9s6x7/XNFYHorcR4UnuZljiZQ9u0oc8t000fS4cyZkVAp6MLe8H4nbUpK6+aas7jzf+PKZLtWI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 08:44:50 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:50 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 13/14] firmware: imx: scu-pd: imx8q: add vpu mu resources
Date:   Wed, 11 Aug 2021 16:43:09 +0800
Message-Id: <6d0d2b8677ba40b8007aa46a02b676838f9b27d3.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:44:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a877644-22ca-47d0-6f04-08d95ca447ec
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4888502F1669BC5F504317E5E7F89@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BYIFyNOSExEEMFCYMngG3MKJ7H9CgDiHIYnPs81mKDuCtjZVFj7U5Yq8LqyIsIRzBzL8wHs3pZksD02knT6jzWn47ApI4V70y5FV0I9m9soTS26IEABXL/NCjEypEbUY6Ytv3+YzcuRGPC16ns/8f+X70Mu5GkZTBiOiSpQTICraiaM0GEEJbpIOn/uzyGcHKvgleOPP1TY6yU2dIqq2MxGKF4IQBg5x2k3Z9edT+GAY086r2p+LClRfngtnoNeGeVV3gqw20XEpS+0yu8sKCGsrFGwfHzTA0yMj1r12iuLghmBf2nULLTLSXd78dXLLMnNofe0qalgc9ws7EUPkm/7rY3Ka9oEQ78YP2SAJoiWSeMEIl09azk+NeAjPiRqD6qB1nbcZ8gLdD0X8ARMCkjIQGW4H2rCEQ7rGzq0ZdbFpMs9i9O9teCp0OTIMo5Ag+Dl8DNDBOFzVfslYmzw0+m4TJilbC7jgVBrsJwmyyeOldqiac0icWxSLQ0jvVdeSSctJPzEQYmSwm3cPCC5vnsHTbo+C3eV33jd4EKVJnS4zbecnI7tu5bwauNUg8cc9ErVF3nekcWgXsyR5cjbsTbs9VeDhOC3lbQzrhkY4vg0SeC9CKpHSmVsv+MnB8FdUyXWetMBh65Grzl3bJo7Bje80GkmGn5uBzu86QHPY5tuLXokCHjzrbqHuAPe050s0WzHcdw6HZA5cLXrwXRss5FugliWL6IptR0NHRk6F4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(7416002)(86362001)(8676002)(6486002)(36756003)(44832011)(2616005)(956004)(4326008)(7696005)(2906002)(38100700002)(4744005)(66476007)(478600001)(26005)(52116002)(66556008)(66946007)(38350700002)(186003)(8936002)(316002)(6666004)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jl6FqAJkuOnFpHYXl5sQ9fmbirOjj9dVhjyBnjC5k1FLP6M1chBhWRusZ9Lm?=
 =?us-ascii?Q?97UsoQOXrcl2ZNYSjl56vLuvAXgWBfu3H2Uy6bataonsNUyvhokyXg1YgtIr?=
 =?us-ascii?Q?hZglUyblJFrppZHaAqf9moG1fYTaP5OtDukBDQW1rs17HS6+jhQYotPinZm0?=
 =?us-ascii?Q?49GGfLEg6eSkBvlnCGGyx8As4YoNzHq0eyhpFw1uuZdDIGpuVKxcOKTMbaID?=
 =?us-ascii?Q?AJi/BFpkUULRslElcv7vqcgWFfri5l+/im5rWUIZSFufynZPnZ3Z6sUMqEcW?=
 =?us-ascii?Q?e8WGxfO9hA0CeYGsufufoi3kTAmiEZ9k9HSH8SpcFuqsA2Rek3srTWYLCjNX?=
 =?us-ascii?Q?Bb2dmzuEaj96MOBOkfp6APTja5p2Emxxu5x1v2tsS+ijHbWX/v3lbOSVH//m?=
 =?us-ascii?Q?CxqfowOb/MTSz0B2MFr7DofSFhRHYb2MvyEf/MfzDELr40Aar9jUmQV1DmJ+?=
 =?us-ascii?Q?EcpxrCQHVt8KdCIUFQUj8PKABpmCJ2gimi1uEr8vER3z4lptqcyiaTcLJMxW?=
 =?us-ascii?Q?Ipyj8eXvLl3a4UXvgbdMD5T2Mv2LoyuLTIdCh6id15Kdew+Bv23iiZ4Bo1Wa?=
 =?us-ascii?Q?8j2v8rvhoXufUZYDSkmNQTEiFlU2Q39PVNFV6f28s4QuJ74762WJsZ2X45gk?=
 =?us-ascii?Q?yjjPPJCLTLHeaETGbBDAWrVR1/XCEwTmPRZ+TNXqnzLHBFIIFvY/HSsdQEnB?=
 =?us-ascii?Q?dWowwM6wFQRsSQ9bw0G1fETyTY9bAUfs8+0zY+5ZE2oxsMTqfWPjAcln3O37?=
 =?us-ascii?Q?EHW/Ix/6RwgQSKSkWGbXyiDquv5j0XXr9IeeqYD0HLlSO9RQJ6BZPJYVhKdl?=
 =?us-ascii?Q?7hggK3C6WIDPogzfVAYEifUUzksbbFvdv5BwK88TsUpKT8xiVO0OeGDSonmv?=
 =?us-ascii?Q?m8Uc9M+un6vr+hv2UiL4c/IAaBVYhIQ1JRrbF9/45xkS+uMDw40yAXIGkis6?=
 =?us-ascii?Q?HB6VgNGOtb/861Ytq6HmALCTh2EYI7hc4baefGlCuyhI1xYd2P9EbEgJuina?=
 =?us-ascii?Q?cKw3YixHB45+WdIC1eL9SA8Y0ONJW6cUxF+MLBs1Iomd7WJDGfXtE98313Bf?=
 =?us-ascii?Q?oJhU5+wJlXKgRhGL0TC8w5CkOHG07FreyCoaf67X80qQbfnwVIaZAyzb/bEd?=
 =?us-ascii?Q?BbRQF6q+4KMevod06uLyhaYGrEBrswyJvydEjpEFgkDJVgj26yNY+CHy2Ty5?=
 =?us-ascii?Q?EbnILgR4P3mwfaBCPFftSlfTFW7k+dP/fJLbWDpMvn6YBJOGcEACE6Di+3OS?=
 =?us-ascii?Q?8G+fJzNRgIp5fxhFjtQLUeZe4P2eXZNZPwRQgKcm69NZQmF8M3SpDo+ah380?=
 =?us-ascii?Q?MNWHq/DdMB/jkF6B0P0AaGME?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a877644-22ca-47d0-6f04-08d95ca447ec
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:50.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEewjses7CDv6mIcHsjRGU4J74W1htvhbu7vShyjvsxs+kReHZkluq5ch/AEj+789IFDJT6kH66jyRetAeZ4mw==
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

