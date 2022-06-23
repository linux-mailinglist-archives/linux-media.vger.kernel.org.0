Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD32557DDD
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbiFWOcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiFWOco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:44 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F0E457BA;
        Thu, 23 Jun 2022 07:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAI9jsC3LPw2fG2Ghl4d5Gib2KVQwXfmsGrq4XAcnYMPgVsMFrdyWE/f9zmg48rEBuDO14jytLP9pRE93t8INNYdYFAtQHZsGiajkQLShsGvzFOyeHN4PT1vqXYfayOvK5gCxOepBnfh+k351QTbHS1ah2nZltT+2803hlY1AjulODl9C/5Rc7W3L7UVSEemUSzM3q0bejLbt6qk050AXrj2aIBlgJjr1ZlTRtZ9QrLHnFokDaUmN7HfbNBqBQN1GN457pH03NjeS+XyDvq4pL/FvQ7t7PShCJ55NQ2J9pvRfSDK4cL8PXrKF6fRPBgBx1oFUuGCB2H38wvq82Lw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXAAGNfrNiSMxe/ey4OTDpi0XLzQaqJVF9QrNOOgtV8=;
 b=Y2Q+1Au7mC6oZ5QmCF0qkT01dYj/cAcATLeNfTviel0FVVE1KZyCykNtknUCDvV7xMuldf+DJvH0V78cf7GvaxVUkF9bJgdw1YOnlFqsqA1rN24QCbJ5/L7DYLhVjFKqN7XJs53nviRC5zJTqSoyy1vIwnXKpurQaZ1ROp35VrsQfbmMY6DNwOrrv4ePY/TJ8wtI7CN4b2Qt/LIugkOBJdIcQy4mgJ62vjKN5JyeGrcv4Oo1wDfCLA9PDYCeuNG04mX3HmU/3LGpTY6Fe1iKG//TQ0O1Q/wNLI29pAfsR0HPCXntIHp87WYZoy/auVHh5ir+eH4J/8ywbwWhRYhwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXAAGNfrNiSMxe/ey4OTDpi0XLzQaqJVF9QrNOOgtV8=;
 b=J7utRe6weuaab0QtrcYuuqtERo0VVjnPaT8QpAnL0B6PiRzn5LfmptWhymjualCsTbWQR//q2RCg6tST9j3uLJJaU+KtQXjwyAd7FNPXYovhlzjy/kp8dc5O0QRIzXuHT5OcB52c/p+PiXx/2RBkjScolraN9ynim7ib0WxZenE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:36 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:36 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 10/14] media: v4l: uapi: Add user control base for DW100 controls
Date:   Thu, 23 Jun 2022 16:31:11 +0200
Message-Id: <20220623143115.3185297-11-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36af456f-c9e1-4609-09cf-08da552537e1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22885C21D4DE2726F52F6DE9BAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovh0SUfdL8piPIGnhjmKebWHFWqWX2d/vwwcoTlCM+V5PesjrINLq7U9o3UCCNTTGbUYR/5+PyGitRYeUotpU+fGg1KB6qvZV6zrE+IObbl/gh3C7ymwk98OSHSySaylONr+flJq59LPkaoJvc0QkLU9Xtk4oOTZqjKIamHEHWEaaueZPGA4k2GL5A4b8KOkmilDVFiUkoolBRpU04+MMENSt3/EtphG2zCdunPl9tdw1tBM+u0KVI/ImTM1pUyBMedbkF0rJCWi0aZsL/ZDrhwtPoV0FEU/zwRVgQZRJpdmNoStA/Rzx49MBQRadTUN5KmPv//2MBjWl0ctQxfSHlJ7TMRvgtKaS6FXUH7/jnomgMrtJdzmMTlwh6Udpk11LJW/1zMxY6/msSgkAqrLxadLDj6yoabVzi+vtPStzEs2iBdE3vtftxzY0E01LdGW1KGfPaEIsiCh1o7xdRYkOhU4A1rvtRaqva6szCfXoZEDbBz3KCqw55rktHwdaLM7jtnFqENRVxISD3x8hS9n8+AOCQXFgFYmWyvub7Ni093GTBwYM4YbNxvO8UuqsUZvRHKylk3OhHgPHoIjzkCUUN0y+86j7F28+Ln+vcemyBYP8/AadrnMuP+21BIk29zNzGWO1sCMOhUJShtKXgRQMjk5/esyFK9YR0JM8WexsWob1atSJCeMd8EtvLPVDxQt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(4744005)(7416002)(6512007)(5660300002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jj7EF9/ksj/cuUOqfkvOvz5sObTuHMtnYR0/s+WK5a3GhYYGwgp7ZBOkQvE3?=
 =?us-ascii?Q?idQgBl0ro3AIRGJ5FlYxjvqTtgphK0vY4d25V3Bgh8z/Q0/e/zZBJC1Mv0Bt?=
 =?us-ascii?Q?oLiuwFSI8ARdEPYserbhfAzkpGblQmpswHtkZNce7Z2iQ9RBfVDWXeH7xbhx?=
 =?us-ascii?Q?cATHPeJ+ihN2mNwOS/pMrfwDjcXMVMhtUDIw49rug3A7ZYifFP9AvVeNJSD4?=
 =?us-ascii?Q?p6xb6qZLVjHmUULL8keDQPSNZvPBfVRkcPik7hkpEUVllZvnwOLyMIUuc/qO?=
 =?us-ascii?Q?udWk5ZfQXjHtdvRWMa70Dpm/R/BvH3ieGcwTdMoeiIumIsACFiXXWG+h1M9a?=
 =?us-ascii?Q?XlX00Fpk7+lEfq1Z13PGQr643MA7npTHC9pLQtLChcDfvnLovXgkBjBJJ56m?=
 =?us-ascii?Q?33LxeCs4EsxmMF9I30evvvExpADg/pZU1NQUwlZYCB0R0zT3R1/osvrOOPlj?=
 =?us-ascii?Q?Qr1GpR/UaL0RXvi1IfuCTuopflfKSvkr9Wqix/ZwZvfPzmGI/YMf0Uxjt46G?=
 =?us-ascii?Q?/Rh8l8fInqOCp2UlrTRcT6WKdzHCLS+9LG/ZwN9Mp60Fjfl9zctCNJuuT8xH?=
 =?us-ascii?Q?AASR01oPKhiseMoLWntBy7rA2fwUmC91XR6kgN/Kl3fbm8ybtf+S2giIIDi0?=
 =?us-ascii?Q?cmXPqCTwYI+Dmy/I1wY4HzyYUQ/LPuuvrj0vGOd4jUEjTqdYumbBG1k75ZoQ?=
 =?us-ascii?Q?hptVbvFGnEuk90F2n+gN70k0jSPT0lGmNg36UyWpNsv2NbcuvbqobTkpEIdr?=
 =?us-ascii?Q?wr1ptycCFSHUM7xefravS6gW2cl0Zo0ABu/eVMT+pIzGrL9z0iRVIJvyZ4k4?=
 =?us-ascii?Q?zWHeX6cuMznuqPaxsTPcE55wqRAl3xgaCyf8znQSeB/4U7esXvKLB8rb47kp?=
 =?us-ascii?Q?qVk9V3syecIAHNRGQXPadRcWzGcmtisC69aJONXaRJ+XqOgfU0BqSq2rOwtY?=
 =?us-ascii?Q?mw3oFev4GdGFr9wiPbgEyIcNW61894NtShM3cq7B9WY+igmTrNEAJc0r9aOe?=
 =?us-ascii?Q?/Svxgi5GAJn47nG6+3Kc7s7DBhwHoiqHeRe+0SrjL9lGvDUKnLJw/5okPaTZ?=
 =?us-ascii?Q?EWxm1RPqGCnoKrK6aJMRo03lX2JSKeWPpZh4jC8Wy1mp91R5PfTBgtVgxMDv?=
 =?us-ascii?Q?tSm9GhXX6P95R3aXV0iLrZ49272iopiUnMMcXilVB000lYkHR+v4cXz9nL6g?=
 =?us-ascii?Q?2e1FHP9T8lp5k8j3v/LlOu04G4fLG75uNClsR8UyhrgHmZDJXXrsrjULSZ5N?=
 =?us-ascii?Q?hL+kh48BP6YVdD6AD/A5DDepAxWyhtnHxrd98UE7dF0qz+PmkZ5pg2DbgMqW?=
 =?us-ascii?Q?NxaieujbGiKFQ//72UAhRTKSvRLhwfS8fpcbTkJNMQJS+yG5iZiWMdoYA04D?=
 =?us-ascii?Q?dRB1013hlst3nhN1/xL90uJOHGvT+qZh2aQFysUsYj/CzSuyl7debGHpXNMP?=
 =?us-ascii?Q?6Hf3vVwSFCY8/UHQWijBIBK15Rr4Bnz6Y1NKbGNQPttaHMi8uk5eHn63+3ZS?=
 =?us-ascii?Q?+LuPJ3tQVqA6KDYNnZbeDSLsUbdPdMUtYhJA7LMJOldmToeLCbv/TAG9aFIm?=
 =?us-ascii?Q?k+LsDst7pfdZZmZsxIG2xmvsNii2Oj6QRpqecOJvX+0CjRsOHy92aeM0CAUm?=
 =?us-ascii?Q?22MzIUbukB4TxvudqDMJwJUfnHGr/AatLnLDOr1a4917frqTmljaXpYRRg5P?=
 =?us-ascii?Q?+rm9YavWrz5Es7MJSfe9vyhnT2b6ZrpCclFOupA8+j5GftVJumglktSFpnEe?=
 =?us-ascii?Q?fOlvIDgDjaqOwWrETban/6zWYmSrWlR6qbWPBt95FQp1DTTikiqCXZqC6e3c?=
X-MS-Exchange-AntiSpam-MessageData-1: vb0dlvcjxedFxHDL8HsQ6Wc+ikHpHfR2N+M=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36af456f-c9e1-4609-09cf-08da552537e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:36.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW9juYy5cnvWCyBKs56aRncwBC/cnooCC2mD3ZbTCtkXTtJmWTqvXcdWdPO5+tFS9uQvalZl29ILM/q2RZarpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
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
index dfff69ed88f7..0b26ebd6ca78 100644
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
2.36.1

