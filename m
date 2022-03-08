Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B744D224D
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350173AbiCHUMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350160AbiCHUML (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:11 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00083.outbound.protection.outlook.com [40.107.0.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A0E48311;
        Tue,  8 Mar 2022 12:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV9ctRNkxPY/KxzjXmQWBMyyPnrrMxMAQxkZXzo7iNHx55k3aKemumYNQmVNmxN+YdAEV36P3vZA2sTks30kEthEbARghV7CqExl2JpwK0Jzu2TyLNjUcwUti5t6dTgepvDqS/Kkc7qGp/K4EJpBbDobs5WD2hOM/8IY9JHoCkhwfL9Fj4RV58fKhW0eLsLBdfMsZ2WdwZidbhQBNxGZb2V8tQHo0MmHQE+gVio/NKL3QIcuK3dDuMMU4hxnIJBsqdlOeG2I/Qq+OXuO7kZWMF2FB7NQtUAyYtXnfKe2og8UgzJe7eSW7zWIjAnNwAZ+MTVHVfnsntFIA414oZvsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQDh0wfjD2cCDwgTJ7xrrzvLa3R5Ew2ME9XWlfJwSxU=;
 b=N/GcT69fIt6pybVOkuRIANzJES1ciH9cJvdM4JnGRK3wVw6ZsNYok8RgxsAB4BXriX/eL87z71fpvFyDlNi+8DJA06BA2Z70ZBJFifOtOluBttbkjt8itHzTIzbU8yFTq+cijaFnPCRagFUySgncFpZOs+MLglxcDa/65Dk8tk6PYj5bfnD1SMwNGQ8fRegCbQk7eA8PbpcIf3E91g24vIf3RJR5cW0nOsXQfSDrmya+oc7EJjyGk33/kLzPuiPIm3nfAJo6vVJqlnK/QIjU727OimFRs/sg5lRfn/JhX+7mO8IGlM1fzu6LCnrkq/yzx/hHRD/u8HEpuTshMCKoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQDh0wfjD2cCDwgTJ7xrrzvLa3R5Ew2ME9XWlfJwSxU=;
 b=IUe9d++8VYKs+c5UQYduS4WSi+kvxvQQ/0Vbrz5az9Pdm1XfZ8yFReEiNEJYYqbSESHdpeepX1Hsr+SoVIa3JmZW7PMDenPI/bdKSXsPC+oS5mktE8BxARWzZaVL+jE+7w3Gx9CGyXy2HPwXxkJ/2dVj36uMyAvgMKh2bt2NqVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:06 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:06 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 5/9] media: v4l: uapi: Add user control base for DW100 controls
Date:   Tue,  8 Mar 2022 21:10:34 +0100
Message-Id: <20220308201038.48386-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18bf435-4f8b-4245-ec13-08da013fc719
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4588F68A53032EF596CE8677BA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGQ5H+61AuGgcNe+xZXFWam6vunyq9xritFvr8AuMgMAiqktJb2ciA6Xyq1sKyN/XJRlM1Uv+ViFbZVaXlVxC7b67etCnL1oErpeUBX4wtAtLlqtuXQsKvBWQsiZfAC4Txt+pqM3D1FMW0Ba1gRDgbGuYcuwUL9TnvZstE/ggX9CGJ2+AehXdqnBegAObEJhK6W4oX5CAs39KpHzRTdYNFEE0YxkSLeruhQQaoMi6yKogrbyparJixyWYDK5cOYzXyTdAWqG7xhKYIrBDhn+Ykqin5fNesCu/PhS2EPeB/6nTgSDTE7QtvLhWJkjCZ4V2GA6ScwvBKPn9JAzbHpdnbBzAzhaFsz+GzYmDDX69J8o9mFwl29xQ9kGdZkEKjfSc7+BmjogPbDA4b8d6nVs3Wc7SuX2/ed1j4lScAEzFB0QQEjVefukj8jnS8ci3X3z5jtlxjbq8zNYC0I7Hbfa8B16mKXUGNYbGTSlXgOo0QV7oI5zYw4yvtkS9dCS2Xsx9CHTBIV1bbKALWUYPFjXX8b7tJTE4LKooIpF53lOQLVvQJJuinHNkkMjLFN9cRM+86ZMNt1z4OpNl84YLrvzY/N26q/ZWvWSO5FR6gwVMK1pMCDibrw/I5axefOnWhYrUoqQ8M5vV9Y6Wc5nNDTA3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(4744005)(1076003)(186003)(2616005)(86362001)(38100700002)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNPAOFX9b6VG3a7yCsSV4QEdfmgucXfBEq37BEn/SGbKbLX4833nsKkl5ZFg?=
 =?us-ascii?Q?WDBz4sit+bBqCIsjCwSIvwkewTd306QoaAIJYSvCmqqxT03SJJN8odjKda/0?=
 =?us-ascii?Q?XHNEBKJrhDrzAGFF+VxrIIuGhfl8Ni/TTgEw0a5XfMOpGTLOhFlmOmWggipZ?=
 =?us-ascii?Q?x0tggJFels+K9ywuOT1gflT5GMWBdq8gs6ed6urxblJxBUIppiiIcBp4Wrz4?=
 =?us-ascii?Q?3+XceeN58zxteWzBhgYY1qn80n+sLSeUccan+6Zh2LFFCTLKLqu5MI3I930p?=
 =?us-ascii?Q?Sbmb3Lwqafkn1uXnsZsA8Gxqd93zdSi6JeSQX3b2Dj6w5yRdsxDMcl7QjkDA?=
 =?us-ascii?Q?/fR6UibVU80kowZ00u3He/ai8Efcg4zi+b0Rxlm6K+2eS6hy8DApc7OPv8pL?=
 =?us-ascii?Q?7TjyMAtTiaAc995Fzn+1XflEiGd4MI01yDO5wz+z0Et8Wq2jW/muH5Vd7wjd?=
 =?us-ascii?Q?Io9P3BIrvVqh6nR4rzGdrwyWlej7dzDrbGAUCX0arlErbVJDbfnSkKK88X+y?=
 =?us-ascii?Q?mDI11GPGN8WCKX6JNrFwWzxbp4gZ0ElbLaVJyTN8TygIw1FmMsr8aoObKdmu?=
 =?us-ascii?Q?0QE/a6APIIn4kqAV0xICcOWn50ydsj8z3IVMJH0OAVckLzWoJYBsKdHRz3rR?=
 =?us-ascii?Q?hnlPljgWXcq2Czdwwq1vFaJszvZO8Gv8tm7WHqwQkff3dMYmliFyZTq1iImq?=
 =?us-ascii?Q?SN9/YBxkToDgxyCvzoArDbDqFIwgzmvZ/jFtn0pn8tKqm7XuefjLpQ7gz67h?=
 =?us-ascii?Q?fYG6lxKKHQt+5i694RFQgF0UkIaS5wrlSLauIH2mP4ttxZjBl1m++u4MaWFW?=
 =?us-ascii?Q?8eOhfAt0EdP1VxjgblhIBDakVtuJDdybADq5d1T37AiqmQzCLJcjk9Gn55e2?=
 =?us-ascii?Q?m60v+YbLaJs+2inzJjW5RpmJqjLuA+axPgN4IFD5wxHzlJqluMEeFCE0x0Cj?=
 =?us-ascii?Q?JdsA120FK6Kb4IHzBAoMB7toNGYu3MhmBCWhiG/G46VA0LteClvEHf38LCBc?=
 =?us-ascii?Q?9RyX4NTXyTKs/nmNQmZgElTwgbghljPtdeASwiUaYR7bJ5Fi8kK6jDmIWKfs?=
 =?us-ascii?Q?VVpzdDN+6s9CwKLVWuvcUlDJwPGfn05J4Ds3SZ/uqvYnxkO5M+c9axnBAP/u?=
 =?us-ascii?Q?VvextB4dYmtUYH//Ni7Mr8AYBCckt+U1g8D+/T1oxVmyA/SnwOChkEXmvTVL?=
 =?us-ascii?Q?ycmsXU5REDD2tWC1Krwp6+aqIA3QKZnL6SQ/fKDtImAG+enMIAEJEEekAytd?=
 =?us-ascii?Q?YpcEB0PXxQNwDJEaEYgtM3EvQo5TU9kO56qsfoighhaZFSA/kaAfmMHiNKpD?=
 =?us-ascii?Q?UAuClc9QRycWBCTRg7Pc/M1tBIA+W/1jJ8JBxf11vSatQpevPzE7aE6VxQzr?=
 =?us-ascii?Q?OiqlkX4sCy9Yx2O/zGX2ihe3sByPhLKUA3K9nvKlikX4y6fzHsD1NeZzJn4Y?=
 =?us-ascii?Q?XIXznXLD1m504DrtdbG+i1NbpVpSH3SQXQvIDAFBsf0j+e4LUZ96idvVZYjp?=
 =?us-ascii?Q?3D/L7zG+n8oIClhZEPBj1jtxsz0dF8pWhfTUULtg5W8orpGxhDVHUWXIuuac?=
 =?us-ascii?Q?m1hY8DzfkmjshrgeFQoophkTmIvc23Ai3WzGXoBVkUXUa2E8SNvXl7CSkqdT?=
 =?us-ascii?Q?Ayy4c9Al8FRcoaUSXLd7ruOiQYuI8y7MvZo3HZCACQ7AhJ/szKJ0lAfuxo9l?=
 =?us-ascii?Q?0PMQ2oGRnzNfPgDjN6Jay36igd8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18bf435-4f8b-4245-ec13-08da013fc719
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:06.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9xj5soSLhZPOjtgS3xgXmcs93pH31HOzxNyquiiaHTHosAJ+9dxR239uRR0v/Ms7uQeyFeT0uhjxK8SBaql4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
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

