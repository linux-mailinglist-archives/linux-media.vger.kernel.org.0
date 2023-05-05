Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6148A6F7AC5
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 03:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjEEB4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 21:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjEEB4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 21:56:19 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D4E120A9
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 18:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpsSPY5GfLvoJhHCQY+/rqGJmGFAjsGGjj1ddv87b6vSdUjCBVO4xLa8ehX6X2snZ29GNBLr73v52tOLBRY/EGc59lJqQ63zmW3Cf6GVf1uEsz//sn105hvq1ewuQdZdpm6cK28nehVZjPjOUyBQO0YgSzE5pb5zZeHaIf3HTMA9v6Z9IxNu9To+9RHRTSA6oIc4RzAO0A8TXVFSsO1GxB8vCWlpgDkSr39bhGmQ2n++5GFq19oXLYIC1WvT3f1TtT/oxKq/K3sfxt0gzYk11Yi8LE3OjfkwOe8iPavne/vn1/FO57zzMHGrWUw0+zeHcM0zEWujoNEJqi/6Eq/GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvknJryeOtT0eHzzbqu9Hb/JHH0DtN23UdQLQodrNDs=;
 b=Aoc9fF61u3NfaIBv+jTyubl0kRhza1rH2gFocw+awAeHdHBGhCDlsuQsPK5bbEauBNogwL2af/f0mSONSqSflinmI41xYlMdxo0XjDco4yw4+uxgRAYV8Qnsk6xWnZd/ULXFzXl4g5vkfgSByIcrJhjwA3+MwROaWCbJin3NdJaLwks7u8Sy/+KNa0lHhVMgZaS8PZxnqfAw/EbePhBO2Y8h5DAi/iHtIFOHtv7yZXCmhzBK95eueF9hokN6jDlB80giBfI3hdoSgo5YyHYGBqf7fHK9SAgTGHWD5BCpcek5oIM+MOFaVp6Fk03DXCE6Xjr8CJlkfCiXHVpc33Z87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvknJryeOtT0eHzzbqu9Hb/JHH0DtN23UdQLQodrNDs=;
 b=e8uZU5/4BSQtraxZo/lMzn8bzbniBT28YdMkp5mmVDDdmCitzIqxEYJnaVfTNAo2wHFk38jNb9+KQE0jiRxnPwG72pCVy8bwuRlhd3CCu4eZSfKR19hv9iC7kJH65myKj1uQR/wsT0wF3tecLz5EhztOoJ4u7QCG85bXvMzxUEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7966.eurprd04.prod.outlook.com (2603:10a6:102:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 01:56:15 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%3]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 01:56:15 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        jacopo.mondi@ideasonboard.com, slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH v2] media: ov5640: fix incorrect frame frate issue for defulat VGA
Date:   Fri,  5 May 2023 10:01:14 +0800
Message-Id: <20230505020114.764715-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 479298ed-5cdc-4e91-f4f5-08db4d0be922
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RznrWE0goOAt5Ackcxgh5rvBqDIAWWaeZuMAyMPia3Ym8IJ6oLTo8Uh6o+FhkmO9PwqBNR3cvw7utAnEfkVYq77fQAcoazWSiMlISEJ9M38wLYaeNr26BDGWrFWRR/rkPg/aTLW/XxngM3WKYX9PHemFxDGLvHpVzv6A4EkFaBnp3jeo69hcjTJH5pYEm5QDzkmlKE76GnH3RMBACqTNd97VVgX3OVrAFlHaQdqe9ypIhZZRkm2wHp5FjReuHQv0GnMDRvXjSWBxgiPheFEMpgLdSl0V5t1rOIssYbHOzyVS2iGcl1ybAh87GFSZ6NBgERdxth33eHBa4UpfCbITjW/PUWt2iviwB9KygLNzYbBggMj8oI65eoJIDcLpu6Ijo7WPsN/34GYFz7EwdKBcqEUvV5YockyyCnq8gbNXK2Q3ksmnYGaQIs/0DwZAy/4B/KjgXwUm78eV6/HmIbNH02oA0GfyfsMyM9MI9H64+UkwOQhD2e99xYcNDeASlyprPC/ugf9coyixJ/ZG/jnNQRoPdukK3YnwNHwGiUsNsAzBnL7KalhWdZQbN+AR0zw/hQV5eh7E8bGi9Gq5IauuU6OPmE1XnOarbPOwXezsqKcFuEalzWyi6Qh316U73RAa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(83380400001)(2616005)(186003)(2906002)(38350700002)(38100700002)(86362001)(8936002)(8676002)(5660300002)(52116002)(4326008)(66556008)(66476007)(66946007)(41300700001)(6486002)(316002)(478600001)(26005)(1076003)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M4MaLrfjNBd03ylxApWxQcfc7vocbPP1D2bAd5xbNnrOLb9JtF9OsiHZmlUM?=
 =?us-ascii?Q?E6GwjBL3A1RhC2v6iuvP6Tp39+3xRAXQOhC1qF1UkEbiYp4dxWS0/q4ECrs6?=
 =?us-ascii?Q?oGIQHhoihCpTreL0kAzjGNZTxAjV+X9DGcHFigP0/XqPFGIfaEpWunxlzP2Y?=
 =?us-ascii?Q?6DshicNGUBqa6lyUgfiLNVJ0YzPxjh/tteeFYxTADxIbiHYFYFALsgimS3P8?=
 =?us-ascii?Q?gXwoELX3RDCy9sHbAfFgYo+XDtnR+a4Z5BFUMvjyK8PlIlLsjByr2M4RZr7V?=
 =?us-ascii?Q?HmQ730lAc/xg4IkCz6k5FkPIRruWNaIAlviRmPu/6PuY/kz46GfQ2VLmcc7z?=
 =?us-ascii?Q?twrx1VYKyIR+0dU8AYtaMYO1xGlRT1FKZ1M87+JBPGuCdxqNL7x8+Q6KcDOj?=
 =?us-ascii?Q?CmkVanw6M7AwF0hfmInkO6/v56p3VdLF9YFsqGWIAl5WQpgrG4EpDb1t2cJP?=
 =?us-ascii?Q?3LSFae7twpE8bfL8ItcNXNtq+TB2i3VBx3MEoY4y544VCApys/7HQtalFf/U?=
 =?us-ascii?Q?c2Pht0M0RmC8ifWTSXWHJEhVoIDV3L0+QFhtgISuRa/AN0S0+mTS1kCujbmY?=
 =?us-ascii?Q?ocqNTzo9kfcm/aWHDGBG5GomdxcxjKHbFfz3x6LWR6khU39LKYBGLo68rMJm?=
 =?us-ascii?Q?XfePpvEwGybQfBeY39UuUuFewuwwy7qts8zdZDYmBn67eb3V5bOb48V1Cc38?=
 =?us-ascii?Q?VZM8v1OiN1LJJmHy1QYlOwesulKPLgOJECi4f22DnI9p+pilIxnz/QIhBx44?=
 =?us-ascii?Q?vaP9cgxwqrsv55HEHKAvIs0REVQ/s1yMQlZxirl0H/YcTDuN/XubJvS899sY?=
 =?us-ascii?Q?2M2DPMEA8VdXbXczTsIKMRbc8HE174BHZ4qmKUZlDi3j0vtPDR48iCR9ZNzj?=
 =?us-ascii?Q?zW0HSWDdyifDwEbP9/jZWjLVm8UsCPZMpaMYxmj9FaUFnJE/smJdtY7Kst6t?=
 =?us-ascii?Q?eAbS22jQtWvukUUBbV4UZV6F4SuL46Tnvlbpxodum/79DzkG6k/iGjR4oq/B?=
 =?us-ascii?Q?tTm2tQ8FVE9o1ps+DzA3z6DgWQGqzHSP8gWr2UPat7l0zUrtSYPw2NLEjOmU?=
 =?us-ascii?Q?g9Ed84QUzmMBzC241mOS2Ug2ksO2yuDto+Wcw6gGK8/d/l6SDISxG1OGMFVb?=
 =?us-ascii?Q?w2/WsJAygOW3lByVjo6wjH7S0Fhn3SpxLbhv2Q8Oox+q1wJUJAdC229fAHMT?=
 =?us-ascii?Q?h91twb+j1UWfUQVMt0hpEmKbUVMW10B8EZA1Hj+a3ilJD/eWOGZh856PuLvU?=
 =?us-ascii?Q?yn1+jeWrFAClLRMrC5J8SGPLBem49FO1LTfoS1zNyVlWyHbRa5nvYMYuUkl9?=
 =?us-ascii?Q?IcAJRgBCKdkQt85JIZU2zTFXUNr/QYFF2wAfy6xxoi60AAmnTs4iXGu4MjAR?=
 =?us-ascii?Q?E8DylcQwEEbllBmkS827Q8AXBUrMBkif+96NMZR/u4Owqhgqw738e4VasFTc?=
 =?us-ascii?Q?4RddfYyTbdCYKKKo9+sybGK6Wse5riPrw8vcytxt/x/0rmXkizadjha32meK?=
 =?us-ascii?Q?q8pMCYGLv1bq9xpbwWrW5rexDCeyKggY9zILkz4T6YDkN1W5s/7HIDD+75OZ?=
 =?us-ascii?Q?IUjmCW3x+bxmg+6XR1H5Tvz8GKSVbbx6+CXyC7zJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479298ed-5cdc-4e91-f4f5-08db4d0be922
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 01:56:15.6712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+uxW7OifDer9pO5bt6lDf+WsS6e+5D2w089c5AGwj4/8ebv1CfGZMWDOwGQG6E2jeVjT2ln3XZq3S7mhSYQ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7966
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

If run OV5640 with default setting after power up, the real frame
rate for it is 60, not 30. The reason is default frame interval
parameter initialized in probe is 30 but default link frequency
is to generate 60 frame rate, so correct it.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
v1->v2:
  1) fix typo issue(s/runn/run)
  2) keep original OV5640 default link frequency
  3) correct comments and frame_interval parameters to match actual
     frame rate
---
 drivers/media/i2c/ov5640.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..5c01bb9414c9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3851,11 +3851,11 @@ static int ov5640_probe(struct i2c_client *client)
 
 	/*
 	 * default init sequence initialize sensor to
-	 * YUV422 UYVY VGA@30fps
+	 * YUV422 UYVY VGA@60fps
 	 */
 	sensor->frame_interval.numerator = 1;
-	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
-	sensor->current_fr = OV5640_30_FPS;
+	sensor->frame_interval.denominator = ov5640_framerates[OV5640_60_FPS];
+	sensor->current_fr = OV5640_60_FPS;
 	sensor->current_mode =
 		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
 	sensor->last_mode = sensor->current_mode;
-- 
2.37.1

