Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED151557DEC
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiFWOco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbiFWOcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:42 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A8A457A8;
        Thu, 23 Jun 2022 07:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNTdd4rC1auTXGXiLYtjhqBieHFRiA9G3Yo5wrWfPwcxNCNfm6kNGGsKMg3683vx7pkyDzDHhmjsnn2wNSwWuaWhb3UgfpZFwjyo6m+Q3bNyELiFUqDczy4ZV5Z5pQnwRCCMpCghW+MykKimaxWWCYBziO3067J8ZLS7lgMlbHZJglztbtNoxuqQ913fpmzihRQUghzHZgw4PijgcMxRZAFfmngwCi/w/endHb6ZltetfqAQXkRYbvd1bWwZ8AiNOjJbF8syqxVTHNR8fd509jiNFsrfgqj0fsFj8aWR7O/Irje69qJBhNdR+sC34XrmoI+HsIYh055cpaoU9sb5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovrcl+8ua66la0c/B04Ms+KmUl+7NtWMDBTceDurdr4=;
 b=el8zfdjotJFmJhBVSs2AkkiqlJ075J/HgbJyzI1PoPeJ9Nuhtm5FL0tthhhbUBBIx50aL4CBFn+2mC2L0XytA3QX29gzeiPdZC7qodTE2Vyqy7uAKwnSgysbCppwR11zUrXlhUZfKfaB34tskP97KPYd44C3kBRlLVBKMlpD0dkzTshQyGFTx8oh5K06kn1JHC7y2Aeef5KiB7T5pXEu1UXeHMAFftKAjoqLnHHsL/W0OWH6+yrMM6M4y6nO4l8Z5CvVqvUHOzGNeKQDdnRr2suG9t9W1bl/8p2qdOwjuCWTjYTflpnniZkqMVXRFRcUOryIeK6BxIgkC7iBUHac3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovrcl+8ua66la0c/B04Ms+KmUl+7NtWMDBTceDurdr4=;
 b=C0/6w0cInUc91Jyrps4xh6u7XS/p8amsREVjiW2KGUDXvsa1iuaoSJwW01yuc90HwDuqr8NXEMhdloHL0gbiYL4Qadybk2mCzRw/dEf6bj8NDPiWky6RV7nKvoF9Ub9fTjMhJWtUJeGYVxPQdKocp4yYkim/DYHJ2SZGGzvmayQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB8PR04MB6505.eurprd04.prod.outlook.com (2603:10a6:10:10d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 14:32:39 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:39 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 14/14] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Thu, 23 Jun 2022 16:31:15 +0200
Message-Id: <20220623143115.3185297-15-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a74882ea-75c9-44f1-32d5-08da5525392a
X-MS-TrafficTypeDiagnostic: DB8PR04MB6505:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6505993F7535F2DA7EDC896BBAB59@DB8PR04MB6505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXFAqNYI8Jmjjqa7E+JOOTW9xHcA41qboVHd81JN01/Ebu6KcZ82P9oIqwn34lQ8bGtBa6SVVy3t9yo5VVsUnNqxgWg/AmF/mHIeukAorsXwPNdUXc+eRD40PnBWCDviNxrdUUUy6v53KdjqtzJv28kVyUMFetoc59HigXF97Z/edCBcmpJRm3OA3oLGYDJvIwLH1Zg3f+wAJKJU3EtAomR0tD/4g5dwejAJd38YC1rUajuSk++/RgGl7ptdd6iNE9fKFDE3o2MUaL+x2xOH/mvj3J0dl7j2/yKit18Jjc0FLCGppTaSuURiDE0a/8MEvMOv1d5tWXP0V7YQdZz6ru8XOH7qdLctVhbSQYxsP57ZGerapCKRj6VKzS17sQTblox6cv88mHUTeZ/Lye7y7N9bwAgMHlgx8aVsZzYA8Kod/qJWDDGM8G2f1btmJ/eNEZAojwYIKN1Tr8k+Hsb+b17ZoAXyb2gFnhszHr1nKE5OkIXt/lCV3w5Fscn5iZ8mk7heZUHDxyU7bldVfbHBP1T4Gei8ieL40V79lzLYg/WpPJz8x2sXOmVrUq/CkV6X86erc2N+EsCsf6qEBaft9AlGqhO8FKRndCRff2lv1LkTof1JzNHYCkfnnwNKFdNrsnT//6+R1sTvnWG3QYDqoFiEPhCoZkattwA7Wq9bn1vBq4gwmr+4PDeYckW7Xa2MJpmtZWhpNj91/Ur57nhffA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(2906002)(38100700002)(6666004)(66946007)(86362001)(1076003)(66556008)(44832011)(8676002)(66476007)(6486002)(316002)(4326008)(478600001)(6512007)(5660300002)(7416002)(186003)(2616005)(52116002)(6506007)(8936002)(41300700001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eAHUGoxGimwnqTDzyVyxryC6r5YBsK/ZdLlhQ6SBwz+MpQSPGvH0riWtaLRy?=
 =?us-ascii?Q?nKANLC5wnPkYrhF8pdoBS5ykTd3dIRsHFotcbIZYCt13HxV7lub5Cfe9RXr+?=
 =?us-ascii?Q?WORKFQx4DeH8qWK6FxX4PAVYwvqMRMbiPclSJ2IITnhz770HzH409jHtH8zh?=
 =?us-ascii?Q?QXGc8F9mamL4fFJGZBwCF1KOgav+H7itzrZpD0p3O73EFVNDtq+GD9w6A0Np?=
 =?us-ascii?Q?A3Ge93AkJrvlDiIevBGXZepm5gpZimO3fuUWwOOee7dg9g8UnN6C/lsOTzTi?=
 =?us-ascii?Q?llzXKzqAAe0hlm0yRB+4iD+MCOazEmHMdPUJ4MkzVviXN1tozQ4uYvq8+Hzf?=
 =?us-ascii?Q?+qGPuMN8CLzLhznZTFtiFGFUh8BzkvZfazxumDL/GoVwZ2SFbp2S6lNn8Ibm?=
 =?us-ascii?Q?Km08pYjE539R1ocbEbi3uSejCaPIMbFiyFGAWE/jt6JTnJOiVexahGNfYIaB?=
 =?us-ascii?Q?TPC/otmQThRDmILiKXia6PWBSTNVIo/RWY9ZPO56+Cicvqbj53e+wsdeWO8d?=
 =?us-ascii?Q?8IaJ8fqUv/J6D463ExmkIrREwxLtRcm8P2oafv1RfVJCNQ1k5Tz5+UQrW1+C?=
 =?us-ascii?Q?NwVzW/95ZL64yarapgCYuE2/XNYmjClZhmizaxCnUSI9Pog8zgZHUAMJRGJH?=
 =?us-ascii?Q?KeYntddleZZNnnQ7RYIII7byYPu467R5BTmF/cyOZ4Hoyqf+4x3vtsIvv4nW?=
 =?us-ascii?Q?+4mUER3Iq/tn0aJtNGHWgO6yO/ylekHQZrJ0Oj8Ld0WN56Kj3rVUKpI3fFTR?=
 =?us-ascii?Q?C5N2NWQjYxMqE9W1vTrAH8oPHBRJvqpm5NaEQg/y5Xvz3lWFSNMNvcWoDrnW?=
 =?us-ascii?Q?Qr0ahkfdjbxiCpVN+VSH/Te0jACqUresPHDWJDhRd0/jACg07mKr5JuoG8Ly?=
 =?us-ascii?Q?QKZTLuT1QAGXVueBaHDwRc62dRkb5FlZjnR4VuNSH4ht/BdXQXpm1Ma0f/u7?=
 =?us-ascii?Q?sOS17nB2BAXst0eqxJ43/lBuTqNSvIDMB3K8lPLLgQ8h+fgbR/Lypomgsh4c?=
 =?us-ascii?Q?z1lJMp8m2ZqtnNB3Vh/qJjxBLIm0FdyPvnDiP1Rm4LNtUKkq6Qao3M1VXSwE?=
 =?us-ascii?Q?hmde0X+6uH0MsQEYfwmeM/W2zz9bUH5WcQ8rTJsrVlOrTf5GCGtjN5j+fCB/?=
 =?us-ascii?Q?cXlLsMX2ULBQs7imdvS6HyCG99lWi7vuMH2fy4sXwntfV4ylj+zXShoEawFi?=
 =?us-ascii?Q?h8oHI6Hs1dF0yavazN93Gd+hFoGasft63PrepBs/QvNuvMaBidtQejmGb+QP?=
 =?us-ascii?Q?EXhMicQaUHjSRLNzsqNJfGSNHy+YVMeQEA4UZmAi/40qQmbjuwZCULP8Wu9R?=
 =?us-ascii?Q?E/oXzM/xPXt0StCFB5yhFvoGmoaNWNrNv7Fi2618L5ocCKIXJMvYcTGgO32I?=
 =?us-ascii?Q?lwGXs5tJ7Oz/0tRBmVp1FGDcoIj2HounuuxdkRfU8pPx9q+MixJ2IyRIlttV?=
 =?us-ascii?Q?MgSfV/7KBQ4NdbKFC/O6hHCJR1O8SQkDnjMCxactqKr9ZWbIE7sYmlFgrfko?=
 =?us-ascii?Q?NQGMZwML5lIYvqVhvWpKVdlc+yih4+IyMd7UZI9L3hnqa2ThKw4dEyigo80T?=
 =?us-ascii?Q?WamS8sd+sd0WGINuKWAx71cP4qDNijolP13TfbXKstDyO7j+eytodCS/OxdU?=
 =?us-ascii?Q?jiuD4n3ci8YJBKhPH5OZcpw7cYOphr3kRXh7yfxa855/EFBmQqI80sb94wlc?=
 =?us-ascii?Q?nK8Th0cgQmT5LKVreC1AH5bY51VP4q+V0g7d6opJmTGIGDHrp4tswhozOesP?=
 =?us-ascii?Q?/ontnJz987TTevxCCSAWGu/xoOey2gfMEmMWgF8GCyMELmnTQEkFxWWaA0Qw?=
X-MS-Exchange-AntiSpam-MessageData-1: Bcj7+QfE3/TFPMnOjVmsQkIF6ZdIY/4twsI=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74882ea-75c9-44f1-32d5-08da5525392a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:38.8501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsfO5WX1B+OFWJwa3o6ghoKdEPXofo2wYiPPIePUi75pHDYw8EwVAo9lGNIyM801oMzZaFj7fOz2roG/HNdhbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6505
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
index 1fc9ead83d2a..a2e1174bc0be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14355,6 +14355,15 @@ S:	Supported
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
2.36.1

