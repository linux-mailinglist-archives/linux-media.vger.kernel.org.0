Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E884D2076
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349665AbiCHSuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349652AbiCHSuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:11 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E44532E3;
        Tue,  8 Mar 2022 10:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyLnnq+mxz+mE+4L4VNiJ+w+WoeFepIPEP1gdRPspVb848BDGbiDpjpH4AWMSjPxA0+HHUW/1/WT9j5KTScD6L3EKDeJqnQAgcWUXA2Y4R/YifX1g9BlsxopOESThAwjzYTG84zO/qZbXqM33cgd98rZnaPvUqkew4AEo4RBTVCXgOnorJBH/i43WTZVBZp1seYXm5QEc/PKj3SckB1N5ObLWCArK9T01PwS8HQ8eJ1BSQ8oSIfJXrktT7/133t7NWA0l+rqJCOX3Uw1QuISCzyAhTqozqn5w9oKTmsmEPCY+OXF75hrrzuZZl4iQGKVdXk6uoOmkgo+vIYks5eIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQDh0wfjD2cCDwgTJ7xrrzvLa3R5Ew2ME9XWlfJwSxU=;
 b=RwGTkZGLOSg8wqHqClmCKIxbkeZtDuuAn+1aRlK9pimxNrMLCej34Xb/eokE7ohVE/CysRzDmrw80hB7vRrCGxnzSKdmSUhVBm3lcE3E7WInAHpgoNK6GxyjGTkzAHBkwBSRhcRPOGB2/LUmqUptIIgaFtQyY0z4rfIEjB/JBAg53ttAGC6Xc6S5/EmsMB2pRMNBUSPHIdqwKgaIszTr3qFYP49ztN0TLnySbQrDekZVH3IggVZND2lXOeSrS7KbVA0M02la+qHiVlwSGuGB5bzfmX8zPZJWFbnWtcx2f5LZ43kATUXPRNDAqIkEZS8+hBmjnJydsoMC+AmfQR2jcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQDh0wfjD2cCDwgTJ7xrrzvLa3R5Ew2ME9XWlfJwSxU=;
 b=FP4EWpOsopnPzSB7EVcu3NbSc/BRKfwkSHebTVIlj6G/ftiPgqmj6u55YFcPA86YpkYIyRi1gUxfthMZOE2PRS2oaCH+zyOgEZrglrEYU89v7sT44wUzWtgEXHJeoDEp0KQvkxA852zV0zI5y0VeynlamSABysaKLBYY7i+xdH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:04 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 5/9] media: v4l: uapi: Add user control base for DW100 controls
Date:   Tue,  8 Mar 2022 19:48:25 +0100
Message-Id: <20220308184829.38242-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 815a80bf-19ad-4f0e-6d3e-08da013451ae
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB43116DACD30C5786F90005F7BA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQclm95gM0g3Qek1FxOVEeSMrNZa7zL4GSp1FS+KDlhUrrUHHxHvGLJhaPX15leRZMNH+Y/rUT3nN9c0DeEZVrnABAMx0zbtA2gc2S6vqLTASIHZQajgrpvlUIeZbkAQgU36ONczonCpIfS7hR0LUqZQbQskzaCqHxmS3BXxM8RXJaddyP/xEDIJwxaMSxHj1TJf8c5pJFMuR4V+OdLXfAiGd1U9KmtlCxgnOFtsRG5nyrGbgsHB15C5ZBP4sWRzo7c8NRPrg2PR4/zvTxV5glVw6IclzIIvvLVWsMAmne0H1kmVMWPYsGbnHFHE7uSN1fE/G2bpbOsXhgIDV11fY8NxGZigu64Wu4pQyRX3f3rL3xmVOyD+mJCHqSf9xOb9pQnkHTpO4xLTSNbaLcjbppqCu/M3hCNWfEfq2MKHxgTZ5EWrxycNP++xPjCBBqVXNT96sHtCDkF7/D4GAONL1fNh0+bdUe6LGhJvmDrox8u01rvGIquTV/fyv3bPFmMx0Bl7Auak7GGekklYCQFSBhnLF18eOw6fnFj5WqeFm7afsVIxzSmczOCBqBSZKCiy76K3QXHbRUEH8sVupEaBK90bhQzOKwcKwgaUmfWkXw9EP8OnhnRgRK7lu7/bCnQp60UTZ4oN/CuusmSSuI6sEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(4744005)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8se1tjLsulnZYDQVVcDdaTmQIT5Qa3jVwioFGxydL/hPWL01lBeHZ/lltxk?=
 =?us-ascii?Q?5+1CcSYaLbEd4BZSubXsePjq6KkHs9GeTLV3MlvRwwq5NDqy5wM2XAEjUbW2?=
 =?us-ascii?Q?HoPoqu6XkCV4c76f5y9pAhe+rZ/DtwIi2YUj3tJt73AVOrQL/jn4SArquWzx?=
 =?us-ascii?Q?zl0dnhQk7Fab79VGIMdZa9d8ee2ghHzdOHHw2QO1P6oOEEW5wUtTtmUQk1Nh?=
 =?us-ascii?Q?Grkk0Z4v+hAxqzXcdMDN+Sfjhkkm9ZiDg0FW7/2xGanVla8ufqIHoRvmuOWH?=
 =?us-ascii?Q?HAG8VafySc/p4tJXiEUpfB207XeHpGUF1Eq/jL85J503IbBOPCJ43fIRK7uW?=
 =?us-ascii?Q?5Pd29gEjbX5cbvMSkZsV1JVn4TMPQUqVw/a5+If5cRBJumArxZXLL3oliZPs?=
 =?us-ascii?Q?1b93KcKJtOvGmWVmFnh9VIip07599jBedGpc3ass86eEJ4adBReGlmmvVtHh?=
 =?us-ascii?Q?sBBoqEyvXkzxpXVnnQge5NDNHGYudYZB7vfDSn44d8AZOvOEa15C7H9xzute?=
 =?us-ascii?Q?7LA+BKNLJdv5OuhynFue2oltTu0GEkAkXNBtg2/tzIIJkiVolZIa6RLcwSer?=
 =?us-ascii?Q?eBsUumZ8YETIQEBCMmjwL3IS3jK3d5EgONQ1fchlNOYkLhaMci0xIEYu/ir7?=
 =?us-ascii?Q?QVJRn8NjkUF/VvnknXDQ1TqnnsV+uCbf7QdVe1NXcQz1jRXoioKym6VwQKlU?=
 =?us-ascii?Q?6/Zq36gC4N/W8Q+RDhdBok2OJE3MP1712IHzSy9+xTXX9PP7mf2yMGcpsqxg?=
 =?us-ascii?Q?MvCh5xuQ2xp0nTVEpqaQD/r/wT1J9kG5EItaUSH1iukJsh8Cv+UH7dqfiDQQ?=
 =?us-ascii?Q?rFetDBeVZuLmWPbAUXCzcMM9DYjiceL5ZGcUwFBrx9f5bYpq7drO6baMM5M5?=
 =?us-ascii?Q?NnEjhDFWX4wPABhm2DKRyJsn01AqjVWwem0PAJNOKX4XDjdgMQ0uNMbskrVq?=
 =?us-ascii?Q?oenNNh0tO6/gk/1P+YflEW6MkZLnWNGLt9NqyRJsh84xa07YtdzNNZ0hrc1Y?=
 =?us-ascii?Q?RuJAX+My/5K4wtsDgcGBxIXmvIQo3a0M3gkGHdbZrES1rhCGGD4rtvjQg3F5?=
 =?us-ascii?Q?bq4fsL5/ysQZYKOdE78q6vYlA8cyWDeLqPG/MErnIoLg214gIJ1F02LOhzmY?=
 =?us-ascii?Q?+OqocgSKxb8wka0O5tli7k0v+R/+b+HDBB8090ABZv7LxbgujZpIfN38TQJQ?=
 =?us-ascii?Q?FPZ6lSLiXVsjEAwbivXC+r9+RPUjN+Xxhn25bNnQIvHYm7zhhL1t/YJi/te3?=
 =?us-ascii?Q?MjDVqO6NsEIWN9EHNlIdozZUeUkJcyQn/dhC9VW53BqqM3mYNdklJccekfHl?=
 =?us-ascii?Q?0zbQRlEwRXdw8/9EQEa++XyDm6AaT15stkEWMPuxo8oeOnhWceTKsj6+E68u?=
 =?us-ascii?Q?TsiHK9VlG7C7IitaxGU36FVPwdutPz0GA+QTKP21tRB8t9e+MVoM9M/77fYM?=
 =?us-ascii?Q?oEA0BtiW6+hdWY3cGpywmSKQUsEQe7RNosWHTOWFGgm4Hz9B/A7naj8GuB1l?=
 =?us-ascii?Q?bkKXwKK5uYEylZx9BrCTazWd3B1bcVA6Jl7pjJK4ZDfSjKwiS//OYKB0ujxM?=
 =?us-ascii?Q?/x2nHq3Rm6NCwVEWLLIRgt+6TnGrZXhySj8hlCYIEl2MDbX/zBPQ7eE6c56R?=
 =?us-ascii?Q?mVn3RoIDIJLgAVslWVLPf9X86BZ8/rNFaxiCVAw55hJJ9JZ501eYiXdTppIn?=
 =?us-ascii?Q?AZNs5b0Z2IyWolUl61gx77vGH5w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815a80bf-19ad-4f0e-6d3e-08da013451ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:04.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztbJvYptnv1DRKsIuxAJNO6VA88+W9b+DHq5ZqihTs4RESWdToC76wCWIvbJSnlPoE38Rj29p8IK6y0QaTLseA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
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
---
 include/uapi/linux/v4l2-controls.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index bb40129446d4..d275f8b1bd96 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -218,6 +218,11 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver.
  */
 #define V4L2_CID_USER_ALLEGRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
+/*
+ * The base for DW100 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1180)
 
 /*
  * The base for the isl7998x driver controls.
-- 
2.35.1

