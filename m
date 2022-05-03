Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8956D518164
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiECJol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbiECJn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:43:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB2B37013;
        Tue,  3 May 2022 02:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAGBS7bi1sm9+LPUdUHJz6NLpMZ6WpOJ0m7nm0O1HqkXX3RR4TT7cg23zBCdPZQrd7FgpiXmclclPtDdAxuhY6v9/ImER0c7Z+XXZ3FC9eTqD35OPahneLrHba2FqrkrVdYCZ6jFhHPHT6EuAeUJDrcdh6iGlI4XRNwNx0nHboGY5bQjhpCz91L+Z37j9rLSK0rQbA3gJJ3TH+OficyqjhvuHNa0MvCKJo85r5GjvR8lcDKiOTB9eQ+RPb90ZvmkeYF0I2jpp6axKIhkW8gU0hnAbmHcYufrXc9+Z/lSXhHUbSVsqi4SNok8kOJOqND9bzbSeWHkSE5yIlxPBwKdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aF81b1Hh38uMGQEB64Hy0e0SxynmiBv8LoSgHrGr0I=;
 b=Zcn/GAldC1gMJlWH89zvxlKmcCJ8Grorcir+TEJWgxvr4QcLZaaENJqInY6q0oaxvdGmkcw8yvGgnjQJhX+0FFbBsibSs655E6w90Dq0x6uuzhNTc5uH86SHF8bLKprqT93iIXc7Q9cKhS1NIKzqL4rY6o5fDzcl9R11jSnvDpSv4fdTghvzdOLr9D/2O4uD2NLSMuugz3De90XMruJIaBRimikNF1VadX+M7L96opK7dGNNTpb2A+qF720pdjwj8sMKA1PVJa/g8fPUTshU0TGhNyK7hwxNE7TEmnmWSkPHmSN1tSwYHka5lgjH0xs9z3ZDz6KVyg95m3Q3xWjJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aF81b1Hh38uMGQEB64Hy0e0SxynmiBv8LoSgHrGr0I=;
 b=CbfVoKUxXlUFMhLkCdZe9AgZGorOz+AiqKQkPTPS6STFIjcE+okqhssknLAlipaOYZuoFeRWhtckrj/5V7+jmaKUPIOZ/6hiZ7drMozN9SDXBOwqrGVINw6t1sTRVk5KkZh2nyV+gfgWRtIQ1ilLhHBn83Qptqyu8uACIKKVQ/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 09:39:53 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:53 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 9/9] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Tue,  3 May 2022 11:39:25 +0200
Message-Id: <20220503093925.876640-10-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a7e21b49-42a9-4eac-a701-08da2ce8e018
X-MS-TrafficTypeDiagnostic: PAXPR04MB8878:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <PAXPR04MB88787072A4028B02BEB33CDBBAC09@PAXPR04MB8878.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0e+07hF/VemHiGnchnCYSbwA2HfdqIdFNV723XX0GKJFwmTsJvcrZxCjW8H/IWH7hjKNQrlQlHZHib0lLjp5t8Bv8j4KzGjokZoI6BnHyq8zeU3ayybB5rOTEIZn9zw1/D09KtiQ+PcucglGT7LS9kCbpewiTgvYY0gL+JylGnoD2R6WrLJO2z/yaPEI/uxixQtoTnS3lytJUmUuWTZPHsi9aqnv9K9IvLfPUIbdIg/yJu2uwITvf6sQln6czp4LNWEhCtz9aM95O6/NO7RjvY6TEOVTNBtsHWJ2fi3V5GOKg6/D5fgliIYmMdiD36h2x9DFghyxJyvHCPuugFESZTSQq1b5M11r0Te+Y6xWkhMttQRtpV3Lzuuj+zo2qeEgYG7KHMVcfvEJxNe7PkPOGCWDa55zE2S2Q4hEJHMg2NLtEOjBQzAMcfrt9H1hKwHNUSb4W9ZCeL6X9XZ3dxQJIQQ8NZqfhqbP6qUTHIfFArIjKQVW1Zyzw2yBoYJOHNEwOTL4fYeWeODmnd71+INgSDXGa6sVlD8keAzdL3drPX95QI4V9adao+fCgreDw4Nb6f5unYHKMVmUij/0D8sJf+vq8a8WYTQy/s5/kc6hX1l3WFyafw/muy1Iez7dWch2N9pCvikHlDGx6MKXWYfVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(52116002)(6666004)(6506007)(6486002)(38100700002)(508600001)(2616005)(5660300002)(6512007)(186003)(1076003)(4326008)(8676002)(8936002)(4744005)(44832011)(2906002)(66946007)(7416002)(316002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aAzUOYEgoc6gtBel65qGrfr0awVBJnY8xMYBiqyQ08BJXmPaLdj3iHigiE/Z?=
 =?us-ascii?Q?qPYMTIl/Jwblv/v4Gsii3rXG+l+/fqH0WltElQeQLgtKtpcfXIVL51FY1Nid?=
 =?us-ascii?Q?0ctu2iJrg2H9i34hJZ1IeD1BHB42Ebb9nluLV49H4BroZViKJqgEPhjiTztk?=
 =?us-ascii?Q?j5aWYwcTz1y5kYlbNATEAqN+OwuWVV7yZjulrrJK5ISFPxdaqr/YMebEXVYI?=
 =?us-ascii?Q?vbRdHNGRXOan7yx8Mys8mbtaF6TvX2QxWs9jO2l5wLF4El5zM19cfhrqlqWt?=
 =?us-ascii?Q?RBnHO8KGyWJRAawqMnZO3JhY7wgfLJt0hhfdXcEmtqEdU8Mp0K2jSRSotmUY?=
 =?us-ascii?Q?LwbpOsqibiO4PSN9GfNMDh7HIpEOQMI9G2WWUsxDjp5B1/SBLYYSjxP/tc4P?=
 =?us-ascii?Q?ZF5rwsTlIKMMA7s47lmm56Aqk7qSb8UHRgr7w0m2e9K1gRanooYG2MQpszQ7?=
 =?us-ascii?Q?cGjiuqpepk8deE2ULb4W5SnEc5hxJJzzfCcEldGrVLjaEVqWNIJCDoFXkE3B?=
 =?us-ascii?Q?tYUizfUtbzwDu1Kp5vmxhOGdaqW59H50K/fMHL0HCO/uP0H3YWN+Fh0u4ISD?=
 =?us-ascii?Q?NeSkyjEqGc83Yb2ZQm/+03WWNn87AwVxCLp0+uhqMJQcIGt6WQoePlUq24Rt?=
 =?us-ascii?Q?HpfQaF4/jkrVy8qFYDaDp6AgfSbWdTJnbEnk3Jj5SREVzM8L1hjLF4JmzJzZ?=
 =?us-ascii?Q?fvLlTLUWBgSnYlu+NvzjCkFisagt43iTkQFJDRg9lf1bZl10vPkUbtE0g4zR?=
 =?us-ascii?Q?opvrwiY+plDp7/hC9GC6gyX6NiKLU0ikedxG/NUi0ZBXdS4zp8h21Hs/uCEV?=
 =?us-ascii?Q?7GuIJMyMkZi8XdCidfjmdoc6XgSgroxi4YMb0hEjUFK2TFVlX++YobCWYYmc?=
 =?us-ascii?Q?st6ODZBQQQ1Z/m15/RLfzQeVnEYk8x1S1BrL9XmDszjHKVUNqC3V3rRT5j05?=
 =?us-ascii?Q?00qXPnRhNAD4YsKaIc/Y9pugBYGwfsDMJq93KuNLvtt7W/W8+J8tuYluwQus?=
 =?us-ascii?Q?s5+nC7dDxLvn8K2nrSUUQ/psMDk1TkfO6bQ2jg2WXYPsY/usOJ2Rg8FfidN8?=
 =?us-ascii?Q?CJI3Iin4Snl/A6IpTCYYi1pc0dL3ngoGOYkph6zu/rEY7uWUznqE5RDEwRxf?=
 =?us-ascii?Q?lKQJd0V5OguSexLkk4bG7jHtj3hOKqn0mbhT3onNUBDRDq15Mcp8CbrqAw8B?=
 =?us-ascii?Q?aiNKcLbXoghKtXTtQdmmauUO9lUAMUAVvUGJftv82vd0jsvaz0J7OEY540+/?=
 =?us-ascii?Q?6Ksk5r0Lv2tT43ZRN1nTnJm8XsV1VfPLqMHMnDVzMGPGutlz9a/kDbV7A9Cv?=
 =?us-ascii?Q?r0CjSVDEj/oaCbcMPj4IBdAuYm3HUNMQ7WgWrr+VM1vlZX2HW4Y2mYdbh044?=
 =?us-ascii?Q?+y4T0Ow1+BibAz/756Rl7wyABx77634lrWgmTbe2rJFzUG6qH3DReNSle1zC?=
 =?us-ascii?Q?UY5lHTUcBs2zj/kdgfTrOLDRPFhnLdk1zg7+pS8Dk2iPq27cXL6rW1ivRwor?=
 =?us-ascii?Q?Bk1vnJtk1TQpOs6W1khbzu8bgSMuC303NTSYH6j4Ml/exy4yZ6cbWUVn/5+3?=
 =?us-ascii?Q?IkWjplbzyb//BJXHOOOmCzj02vOuGHK6aU5JmLkxh7rtSaSW9C8XWPrq9zzS?=
 =?us-ascii?Q?GWffYASY9v12dDlkF5vlyh6QO1ZWjP1gpjJpubOYvFRPzgp4iILlao98L+e/?=
 =?us-ascii?Q?fasjFS6d+jRZcEhpx2ziRQyo+IrcKmky2T4merP1YiN9tIWwLHdZ5X0oegOW?=
 =?us-ascii?Q?GFsbRJqiPbaOzanc74rhyDyBoF9smxQLika9ofhSXjyOcN6B4qt7A2yGMngo?=
X-MS-Exchange-AntiSpam-MessageData-1: JDDDmtd+GVDDEKSmQdw3QCCDhfhPwp4Hen4=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e21b49-42a9-4eac-a701-08da2ce8e018
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:53.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6voKp+ry9EgMOqgwwCbCDtJbXGJ8Bnj7q4P4dTr8XuBBkTPVBzmXvNkYoxwgdHioIFnUka8c4yf8lGugD+AeQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add myself as maintainer of the dw100 driver which offers hardware
accelerated dewarping operations through a v4l2 mem2mem interface.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e8c2f611766..6dd29c3cc281 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14187,6 +14187,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 F:	drivers/nfc/nxp-nci
 
+NXP i.MX 8MP DW100 V4L2 DRIVER
+M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
+F:	Documentation/userspace-api/media/drivers/dw100.rst
+F:	drivers/media/platform/nxp/dw100/
+F:	include/uapi/linux/dw100.h
+
 NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
 M:	Mirela Rabulea <mirela.rabulea@nxp.com>
 R:	NXP Linux Team <linux-imx@nxp.com>
-- 
2.35.1

