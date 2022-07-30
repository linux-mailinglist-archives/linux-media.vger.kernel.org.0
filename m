Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982AD585A08
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbiG3KZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232922AbiG3KZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:12 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672F42182;
        Sat, 30 Jul 2022 03:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv9jp3HLCo+2b4BMxx3RmzmIoNCCcO3PFPASib2JR8nt+YcufUAKV3Bup+r+OgL5nK6qqOgA2jceiUcP8LOgWk1KwJ5r72bBP32UqBr6wIfIY1VixumJ3ZuGjNJjYVgp3Otei9TTnb6is8Wrb4PCXjHcb0TxcRVKVDU31oPLuKt4MB54Ok8pMBlip76/dvvl3/z6yPHuHfN7YFQeSGOQaIdeeCbHyZBYQu5FWXP+01Sq6E6HQY4lsDyClKMZUe/mFkeG7StS7LooQ+U8N3FU+Jh5F4lgsbWLDb87046mFvsK6Int4r3hzTf9xQW0UThMWflb1Oaxp7QVYSQcKiHWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7f7zGHNQZv1eqEk4Rfa0A2wNlhS3QAzboYDRYMbrLo=;
 b=KeHrqcfQ2apR+Wy6ObJKf6rK8DERSxHZk58qudinrdO6q1sLbszboJj6oY9IkZ+oLcmKVxm/YkjMjvpxKZmEGjvKLdQul/F1980Sz2IJiRir2VD9er5PBlD+USECs9A7GgDCkWm3omr+WQLEoOfQfeuYg1h9qBe9AiJfp1C44E9lLVbpDT+cGY4Ck/JovGn56Sd3CfzSV48dare4xiYbZB9mOkQ15O+lHGbKcB1/b6i/Onl/+cRB3fqZq0RI3pjbdY81wLhBbeZ0VIyTBP5k8F6FfyuBbfiIEwV6bcDLxeWUeQtpXckB16upi9YEI6dVC75Eow8YzyWwvIvn1B6j3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7f7zGHNQZv1eqEk4Rfa0A2wNlhS3QAzboYDRYMbrLo=;
 b=BadO5HzRL2TjBQay6tVC8xCr664lkFQiRmIefuzxgtqJmZ9gHjuloHIdXdm+EiMBdATKqZZW178A9Fz6oe9c1AoXB8Qr3XR5efTV1rXDbM58DHkSmsty0tE0zywnTfKvsZmfLaqfOPlh58mqMzFQe47LazxyvLNrCRFY+PS4rTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:08 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:08 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 4/8] media: v4l: uapi: Add user control base for DW100 controls
Date:   Sat, 30 Jul 2022 12:24:09 +0200
Message-Id: <20220730102413.547698-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf3dcb50-1632-4c54-3f95-08da7215c3a7
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAgkXwaG5qxMEVE6WzkhGO+eCGpIvHOGw2ssc/6RbBRzlR2UrEKgPBxQHD2IY6WfU2LvkXAD7iHHLlIO+Ld8Yxmr86vylp4IyT+PxheJX+Ojf4TttIpsyKlfbCums1fQkJnxv8MbRYrREBDK6bxGORMyqUzjIqlByrfM8zyayiJJOfM6PqDlNo5B0lZx/4w9pbxNxLDYpTIhuUvlOI7P6uYoNA+e1KM2S1bWOcNE8xzJe3nASJj0pjZfVdT/1HDaQrPSM+i8rZWWt6tBsLPridFoLX8nvSZWL690hwQIcb30rOoVD2QwhtGHMgFZ1Gn2v2xiIM2mhi6P/XvPUGaYzuAw/NkV6atu4DEb+UTzGxNt4jSDZjAptbEDIW2S+1jlv8qbMAXdEpaDCF+CuWlsxNDhtpDWgweP6zbBRJcXCWhyaJgGRb6rDhrUC1IYeHFLyuvE2ADCTfNEGKndu987e9aH/+Iz1RaoXjVcdmltA9oT5uV0+WilHq0Qqsi7Z7bZ53OIl7ojlbvBhvdskeXfZoKaBJUaubVj57DpxNBHIovnW0KTLHFlf3Z6cLv12ALfKVasnplcrmUEJVN5aYCpLf+twAmkN2KQm74IrBh2G+msdCLYf4DbzP4V+V6rlHAXhdPXNzI6iIJPaiBbZnFCpZIiT9VO+CCSPbS7EQH+Lvvdr1C/PIv/efpRkxPx8mhsrDoQ8ob79eMzLXuf4ZEO3QqTPZAcB9Z1xkzyen5ffBHWZwdhEhlyEqH+rFXfgENT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(4744005)(52116002)(66556008)(6506007)(38100700002)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SnxBYf0q15qZfqb09F+4jUokxG/Y4mmXnyRhgU74eQcyY+eCd04BwoG/dVUe?=
 =?us-ascii?Q?zV4rGoqp7dBWFh6sV+kg/gAmNb7gsmtug0Z5g68I19NvupopHZiE2K309J6G?=
 =?us-ascii?Q?7+pO9Oib61w8iJWYSKR56vQYlhXbhT99IW+Hw/s5Q9oewKhFNBYxT/BCIidp?=
 =?us-ascii?Q?z+o9bBIeHTZSoN4RpRXFRZ5ULSi2mumSA5IDqVHF5JRYgiT6+mamYK8CNCz2?=
 =?us-ascii?Q?UFzjGymirOaSsWpiFz4+TDT/t/q/zGdvSbJEiYSlPlEt9YAQm1qeZvCkcZvp?=
 =?us-ascii?Q?2SHOMHBgBkhf8+8R800BQ4v7OQ2tD5D9po5Wt8hTKx3tvasleMWsB4Rv5hIQ?=
 =?us-ascii?Q?X2jrFL3zsZeYVdVJF3TUXRl8bmvBwz+4xrilW2gKhJjczTFweitxYSNFpyWw?=
 =?us-ascii?Q?ya+1kC/gWqPu3zLQHkV2DOw69PHWtpG55KSsphyNX4GsdGwvNtYNxmyo3sRV?=
 =?us-ascii?Q?0O2vJnszbSIlMllbrMBhCBmAt10el7K0tRJJdu2SqVWITSnyix7f/69GbxP/?=
 =?us-ascii?Q?nm9dR2CvlmGxYRy8gJBwfQat0fDpHV4ggQDV+4CSvp7zq6Gkzw1x0zrI04Gl?=
 =?us-ascii?Q?uk4BJ0dR5y4iK/0JLjuU77sh76xnmRayWPMRa+aKSZS8Lpw4c9cwiSwY8LhJ?=
 =?us-ascii?Q?XY0Xo2WbV2EgZEDyJ/lQvoUkhPQudSRZZVN9u5HyKvUBYRGs2D3wU3c/53wL?=
 =?us-ascii?Q?8mNgKShdnuZs6G5PFIe4IiF3rgBwqcuQ1t/ODP5qJl+y1ivlvNBNwvZjEt9d?=
 =?us-ascii?Q?MMQ78Rt41YGUU/ac0JBgoJngE8Vtwgna4h8xCkmnFzqD1MSzYXYkKYXZ2fgT?=
 =?us-ascii?Q?ETbOnOkf1lo4oNO1vGodRUV8wig6S+Tr5RCwLJ0LQi1D7id4Nvk1YiZnOEy+?=
 =?us-ascii?Q?Kv946ENQgLBifzb78oiunAiF2ptjSRcK41QqRB6lPb5EliErXkPJVxND9CWB?=
 =?us-ascii?Q?mJDRWmfUgSEZBqNw6hbUYXADjoFSkbbxw0VOJddCNK3bcyG7Oe+qAS/gSZfH?=
 =?us-ascii?Q?w1Iw9PxGzWUANsQ2RalEOWQ8qWkFBWeJ1b22eZeCg8JlBCc9NG39F3jNc6rv?=
 =?us-ascii?Q?SrLsbGIR6Qu+GxWKFxthKsVyeNeSQaakX6lbYIDMRbZcdtnRq4LM/A8P0o6+?=
 =?us-ascii?Q?dLBBlT/cljUdphB7NymuhlIUNL99GbxnlRLsMf0kafrAqs1U+4AJVoClcovu?=
 =?us-ascii?Q?I5go461hfS8eMw6YWiv5Rum3KLqXr96wfEPvb/9JC+cTfIpkSZYqeR2eAWop?=
 =?us-ascii?Q?XwBxCU3E8dWCFd3C4vBc/QzVjNuOLt8gKwJOevIK4oUf1le3MCdJ8e6elimh?=
 =?us-ascii?Q?lBW7RrecFoX1ORfiKphxjXSeUKhQF/N9y7e1brVy5oGPEJHIZEDMu6ztk+X+?=
 =?us-ascii?Q?fSoeDUq+vhdhtAW0JmNQolpRc0k2OAEX831yhtfNddsbKBAttk5o1P/T+Bgw?=
 =?us-ascii?Q?AQQ5MYfkGZ/Po7fJ+4iH2ylglQkwR1P3v6P13dEaf1hIo6noPUUPa0VilQyl?=
 =?us-ascii?Q?QBm+agVhFOS697+moh7/vVslN7teND1WSsAecruw5IJp5ZRrIUM0gjgu6toC?=
 =?us-ascii?Q?j/GyYkYISSHo0J8SzK740LQj1TxQrqYLJYq3TkEdzWREM2FCaUahb9Z50UMb?=
 =?us-ascii?Q?rWjHwyXXzWTdu+wLApqWv4/o0IaxGIJBt4Waz9SxGT0+to/tQjsGgnmmDy31?=
 =?us-ascii?Q?EtyfNw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3dcb50-1632-4c54-3f95-08da7215c3a7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:03.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKmc5kYFRvkh3mKp8apl9c/jcHc6C8R/OU+eltiYVa4CNFOsVprX88WuoYbHR+Sl+4D/PwGsbU54PDmRt3AKFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index dfff69ed88f71..0b26ebd6ca78f 100644
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
2.37.1

