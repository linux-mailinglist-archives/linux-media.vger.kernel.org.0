Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3976518176
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiECJo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbiECJoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:44:06 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FF938BEF;
        Tue,  3 May 2022 02:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmIfKpBtlAW9XTsoH/VaIaBeiPyOnmILwxG+2njokkCDlq+8tbUkP6AWfLwBE212vbnw57YkMSJcCvlu+ufbMHQ+KMX6zpYlltvzR+8UgY5l5j0MrDOL9SvSLUK4nIsIC7/FktGvqJltToAKO4RPznUKBstzNe/zxWnpTK51UGivvrOl3wxaeJjmlkJ5YlF4O7hNelLMIY4ZI4fOhI+onSYNTdaOvvR6IguOjESDvZJym6zKrJRZTDYmViLs+y1Joad1RNXEsCza8W+0kHzZ1JN+kmllIoK1kcGYde0rytmhkrirVxjWAkTFCyep0cqInW9g2M+avemHtNONs+6tAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OMP2iNc10NvSXXvVgEL7Kuqxwb3WoUMAWbfP4rRbyI=;
 b=oV+/QbT9yDep3pVV6Ia2H8mCp3G8elqNoAHI/+kSrx9Dorp9rEMZ4Vz/wRE9jd0VG8KkSJMcKIRbtlNWTKO0CiCiRJdBFdkdl7Lm3oTDdz88W1WrsH85zgpSP0Bctv7A5FnhaheHKz8Mg9pp1xsXHpfOOo3KHZD1a0+ZhXWU1MvJHZnvW4uZCP8Kz6i5Lt797COYn8xfuaU87Ldm5051t28TUtAAA/5a+NfyKceJCFdRj/dwYovN9ZE/8ud6zfsxMP3YBvcyK0G/wVnCYbiEYOjoV8yNC69U/mNEsuTz/iqAaVDngBrPVxgPjj0f4NK2GerUoJ6CNyud3vg8m9zZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OMP2iNc10NvSXXvVgEL7Kuqxwb3WoUMAWbfP4rRbyI=;
 b=XIxkdLbqZzl3UTvA0mMQMH2biHGVQ+0HVeFTlF/k6H3pbUrQJWbd18Uwpuq9GhWWJ4oIVEcj9IrXgR0yGx+5SGue69HjEn88d56fesb4HTQrPrgfBSkwpwPtWAUARHbYT46iw4qUVhaiHIeJAwD7x8LHhQTCaJw6ttt9Be3xy9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:39:50 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:50 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 5/9] media: v4l: uapi: Add user control base for DW100 controls
Date:   Tue,  3 May 2022 11:39:21 +0200
Message-Id: <20220503093925.876640-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9a3cf8f-8252-419c-098a-08da2ce8de58
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2559B3FB5FD322C6F4EED50FBAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slyxds3yrWcDoyf/Acy0CetIL/w1TL3FgDgsdTPa1VjscYm5uuwN7q+1kp99FMl/3B0nkLIkUHPCAeFE3gQcrtjz7GTBOtE2V8P+QKmBVqSCHxctVQe9yW/Loj/dAYQs9zUWiWkKlBQFc54r8AslqmZops/w82y+fffG8ts/eeqQh2pXihpM/ecOVYiaNe8l6Yi9ha/zPRfPLs2dSdJyuYP0fdl7FgR5YojKb+NMDpilihvTS/HRhtbitCFAtNC4SIUsFWoZd3/AH4gUJIcgvy6OIKL2NI5SpKals2IcymRtMf3Bn4c9NdrLzFClQMiyPQ/krjvLa9JlJ6uJQNo8HykKHszj8A9niO/06Lg8TYlJod1C8E9v9hasElrgaHoi6tpgqeNeDbk0mnGOdKsXksy9D9F9FhZTEZJpbLPeip7psWEOezNHGg1kWsczBXrAvvUcARIahB9B4evq2sI9EkIuQ9PzWOg8CWuO5aJZdD/igkySyTl7WBJ1h4TvwdyEgdVMCqsB3nq/PPwjHHPKZn8UgskOHBUCw9TZGqKDllanHYW9H/WX0bseosUM14QsnLmqPl38eRwbk3u32aX2cB2UHb8iy4u+MDLtk5vyfv5xrDuLH4/BC1JXOosK01TTPyLuIbzFzIgnd3bdr9pQuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(4744005)(5660300002)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eVeI/jpdT2VxED2QzVmxKswTbC1mqecyJ0jwMzasda2eq0zNV8ejv6rUUMVG?=
 =?us-ascii?Q?ObmpXsk+0ktB0p+2GFKT+JIkyhihJgKr+aFvkvJlLN98bA94dd75tLzkYSRG?=
 =?us-ascii?Q?xSaUf9rUGkwqpmh9QoVD14vWI+tO7TufWWSBiHeM4ylGYVK89S6/Jr0+64BR?=
 =?us-ascii?Q?kq7HGlD8sw0u7AJoMzeYv+Fm21dXYpx7n3BhLnXmeWRVINtswCB7vFu2c2LH?=
 =?us-ascii?Q?IH2SH2R6QU9gqfv2hff5Wk8cCR3jrxSyb5PNPnsd4JkXKMYjXUou+2easqyL?=
 =?us-ascii?Q?1N0OhaQ/oICtN43kOpvV6AH7d+ag/+CEbX4xGpBcjQgqZwi65HzI/e2iLcz0?=
 =?us-ascii?Q?hqd9/sbFaBfds/mOJlYHeH9W+UKd83+kycQyQQJ1Q6Jz3nWYdqFLVhJVJDid?=
 =?us-ascii?Q?5BF/YFgmUArTe41IQ3qO7oP6NJTSaWo/lYCRwzoNippHZnIsrzU3wfKWtl0Z?=
 =?us-ascii?Q?v2tHZphbSiTMcb9gQnpU8Dws/0OCSKA/YpiL5tPlheLwuBBYnXHoidtJTn6s?=
 =?us-ascii?Q?7gbW8TMhYfO80JqXrY9HhNCPJPZbQ9/y6z5sVAxtc2OmyWX+qbCHtwxCuL63?=
 =?us-ascii?Q?ojKFRVO51gdwJb+nI9UA4LtHelWa2O762z1Ag11c8CQS1w9YFaSX1Zg+dzeQ?=
 =?us-ascii?Q?TH3ZVx3Be5jKwyJHr4GszbSml7VbJSsoXz23SPqRFEsQ8WjcCRDQSIXsFbun?=
 =?us-ascii?Q?dtbF/4Ep9rraIDYeoJyM7N7LQvRqR/6zV2sOAvm/ciGQQL4s1ASwrfmlc33x?=
 =?us-ascii?Q?t1cfoT0VnepkMzfnE7Kzyoycdm3uiMb/SaeGarlOwidDH66COLD7fzNQaxCh?=
 =?us-ascii?Q?XGNUOEEC6FZMH3GttjFeLTVcSSpA124Ra0GyfN70FzeE+d8x93Atr7GftUOD?=
 =?us-ascii?Q?Q0W0j59RZ1mhacZxBzKItDR9YdIdnkuNDtYTa2JE+xWtNMxxs/wRjWgXdMuc?=
 =?us-ascii?Q?hCVYFEQ/yuVqDo+zqBqN4KQsGIpCvpT2SuGzzFWbkvv3h4CfRNHXp5YFL385?=
 =?us-ascii?Q?I2Q6gr8xcl99sls8aYL1xgaVyqiTG+o4XqxBFEsU5g1UexK+LApwSs7AMftQ?=
 =?us-ascii?Q?0mSW454SFzCBuj9H/sDJl1jL/VLipXNY3z7Bj5/g55mYuxv6tRQp1aK7ceLX?=
 =?us-ascii?Q?JQQjzHahrcUZeR+8SSNnfcumf2WGCOkGRWNbpW0jlUNjaqTr+KZxd6xTjeN4?=
 =?us-ascii?Q?1cZgUbhyYUVgpuwhFYBrBBI0e+bjh/Vbfn0kN1TzcCjLx3VXbdPkFQRBWke/?=
 =?us-ascii?Q?MipTYdOGxx7jualDxwIKZw8sRgewXOwCCBdJjWbxtsyBvrVBG7Gge/RVH0us?=
 =?us-ascii?Q?hraT9YXGnnHsUQWj1yPZYwpbtKbMmZJ/cqwNzg4aDE/4bBzJwRR7YRtp8Az/?=
 =?us-ascii?Q?20KeHjAI5ZJ1x7wrjwz4Tf7Qt6py6w1dkXCLCt2AD0Tdbg+tC9ByCiGGxMBG?=
 =?us-ascii?Q?sVLTDCZi1i0TLsYvIGtxRBj4BGhNDg5m/u86Zk7kbYBWaLmVVH1Khnr9cO0k?=
 =?us-ascii?Q?VUHZnYXmrWl4pBoQDQP3FRaAdJ24A34JbTN/Eie6NKWdQSll4ZIhnow67B5E?=
 =?us-ascii?Q?2GujJFOEjG3F0mlVBT5ZkZsBuEvbc1W++1u3uzCResDykjqw3F0PE6/LXrFL?=
 =?us-ascii?Q?wJB18xpaf7G5SajyQ6iMuowOZ4+2KgSt6NxTaIqdZk4x97lYhXFHP3DiVR7+?=
 =?us-ascii?Q?/5DVnhYBElGhHRxnfpmx2HB9KX3mG2ve4y+JDg3WCiEdNezGx74Q4Y1jrtS9?=
 =?us-ascii?Q?i9/8LzfI+T/L/e9qiUxlwU4hEm828hLmOdVjsJ8VXAf/CAaTmbYw6GRFooEX?=
X-MS-Exchange-AntiSpam-MessageData-1: VVG0DEIb4L6rZbPcJIH274eZn9f4xS7jj6g=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a3cf8f-8252-419c-098a-08da2ce8de58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:50.1786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJfEzQancp6DSddIKq6ZL1ETbWia637SS1lYgDx1xttbteNFw0kmMk0M7VomYfLfl4vrL9C5dvOQXa86SD/8vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control base for DW100 driver controls, and reserve 16 controls.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index bb40129446d4..c78618acc9c6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -225,6 +225,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
 
+/*
+ * The base for DW100 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.35.1

