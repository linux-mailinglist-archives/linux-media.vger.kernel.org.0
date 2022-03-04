Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C944CDF69
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 22:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiCDU3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 15:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiCDU3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 15:29:45 -0500
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40049.outbound.protection.outlook.com [40.107.4.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FB263EE;
        Fri,  4 Mar 2022 12:28:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebPC6n7k8/zYPyBSQTzQtwdiXNYtf/9r8eWnQs2f/pieT0A1PF7CF35+ZIgaNwPbAIR/2gZ1K2LZlNjW2/vjk10GXNKkcPs/DYeiS6LwIa4VT4UAMQkFqda8gbSeQva/prqr6ajtgRafbuP5p3HvKf4rP0qsOatAQoorneORuLqibDr1r6sfTflzFTSevXjwWPry1GuWoQrkxZsikILgFTSHWDxPwvzc6wbqxoj9tl6hMsuS6Q4fnszYcaIidic9vm4P11bwqdFO27iRDi2xlA0l7KjTcJLxQqGETJkG/ymY2FJ04mOeWkxjX7qlc/hsoF5rLJRVlGxu0icBKoASog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNw1xjGegQd3JjluAnaGIa0GtodzYP9gI9D4m85CUj8=;
 b=Jxx/ANh7CSrpZrCSGhc1ejQqTGb4vJlfMVZxumMMtOue8hTgJUMfl6hnaCK0YVnSz0kQ2jOy9U6k1AoTMYARumFGpWUK03V58tnlNSQwZWTMqtsrFGXloNX1rMFZydKfijWowCmA6SfSE5bTxa5WRQxbqBWusEISQOTc96tAfGe1u8SzJO71kx6qkMqSZfN/9JaUe1i+QVxWtJFRDJsUFq6fjYICWhnvjxZ6lkdeQjOoUTSI70pLcV+JGcsvBs5u5GfazCXN0/AZ22tR6G41j503r+6NSSZTF0eFgvNwRa+XkIidxWA0DNZwYNfTzFS8gSXFwEpDmQMk4M2c+dswAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNw1xjGegQd3JjluAnaGIa0GtodzYP9gI9D4m85CUj8=;
 b=ZEC+Jow3QdyVbALglUQeImTQ8h3/t40N8mmGFZKuSxI33Ytndjdy8L3ZQSfQ+K3KNshLmfeE4+P/ZQGVRRhEfqkTAME6pAxMFcZ6HDDNTC08dkdJJp7l4WMRJChqAl0bPATk2sWpeA5pmI0DSU+2gvmroko6q7PW+3CZq31MO+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by HE1PR0402MB3498.eurprd04.prod.outlook.com (2603:10a6:7:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 20:28:49 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 20:28:49 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Fri,  4 Mar 2022 21:28:13 +0100
Message-Id: <20220304202813.2560202-4-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
References: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52d74914-0c55-4e11-2acf-08d9fe1d96df
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3498:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <HE1PR0402MB3498984F9FB14437D509F388BA059@HE1PR0402MB3498.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1r4mp1SRp6+jnwyoZ7pUP3HdLdoNySy8nEqDlDe6FAU6IG+306VaE9Wz7Wd4l1tnbfEEyKmbqhIsfTmsoM/62JhXFbPty3qwFtBDtTjBKhGy9LjmJq1lthFxVNXMLVUoOKL/FBg/J+C0I3SWqw9cmLvSJy0SPsBgy8suHSZOTDQYVpdBndLSGmplPkV7qoDASriafBUDin/Z6gQGI5pd5iDz6mn2cZdcUGUVe6KmSrHk2Y0Cv7Pcv/9xi5ZIQtbQ7jW1MRksXD6AAdWB/KBGwBsZmhgJtXofocAoyL8LQl9VNmWgJ8tnJ44tmOe5BLT6BuBRwv4MeYXouvBQ7yIagMUhPJDyUAgmXrgumeik0QIy9W+jx0t80xCxsyN3KfcGWTplMFWQ3cI2dIcXw4opB0E1m0O40UiV/UZys1hoihcUHzi9UJueOVSTtIBwu1vkeVdbR7jVBk3WjaMspxPMF0PrCpVolyV64pz9OyO6wnEzNkOHHFLdbjz2h8FOULTjsb1TTHpnSYQGt2eag//REMoEUkh6eSu+IXLiccz9QHezgFkki+mSwkhTCY+BoHpIOYVyda7xg8D9cgLmUHQmcxN5Mke02BN5r4cbCsl88DJkn1jvvoJxzp7qhQ7C2aMeSvRZlC5yVck8mtyFMtp0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(6486002)(4744005)(1076003)(8936002)(38100700002)(86362001)(5660300002)(44832011)(498600001)(66476007)(66556008)(66946007)(6506007)(6666004)(6512007)(52116002)(2906002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8fZd6RsTJE+cimvq+ZDneV3VjvxqbxO/xAQzAcZcc8O9dahRzOP7vtbQYNd?=
 =?us-ascii?Q?ElONI3tX5vrBenxPf943IjXftcqZs9ZsFt5dnmqNwvJPQzzylnC2FUo1yfXb?=
 =?us-ascii?Q?mjJEgLlt7tPjVKNAAtOlpDEp4dQkX8EYgaMD0HC/0goZOiE/K0Mk6RdxZ1G0?=
 =?us-ascii?Q?L2R5wZZKr4K03nsDhTMxdzKRyntJewJOewIIEh6JnLV5VFv32teGHVlHI+Kc?=
 =?us-ascii?Q?ZRH9bN5D8H2Nu/bVNtXekR+6n4b1jAwAOSg2YLxBjnFmkKyoeNMUMltizBZq?=
 =?us-ascii?Q?f92o4Nx0z7boOaf2QtaIFBiNnS2xKnt0FO6P0951XXmOpZxJ3KPFH9zyN98q?=
 =?us-ascii?Q?xGgQZZ7OFtIrWlXX32cPmrVAJfQWHHgj/deYIrOL7m53S0xgTY5GgLorsYLW?=
 =?us-ascii?Q?ShwceeyZuv1qib6EdjEPjyLDYNEt5rNdgLjOrXVSkjB2+EJpLImvKlS2JWfN?=
 =?us-ascii?Q?SEI/07z89UO1umtFpm4m40T2HjERdkPl+89j66QZw8B7AYSXAkw96IQQSYd9?=
 =?us-ascii?Q?Ermgxrx7jzQaS1XQoWZzfxS9m/RpMZw+60M1DbGPADVbfETLJJbXWK3N6BKn?=
 =?us-ascii?Q?py0JdBQv/CRbKL86LAjs7R8TO9qke0vGkL1tdUFZ6+Ionci/Ym8L9A0tjB0V?=
 =?us-ascii?Q?yJDjnY1GrwD2j7bFc/5jiKE5Tl81laWj8EYhXLwGCrdV20SGt9JlvLJdduaw?=
 =?us-ascii?Q?NmVUFUfXzqFOMGt7LlnHnTmglb4QsceBIOcHyXEGxbTacciCVBC2/+C4YMSJ?=
 =?us-ascii?Q?weWrt87gDRG2SW9FcvTgYNUeouHXoP5GTpcjEnt9LcD2LClOez8EFR4PNdbG?=
 =?us-ascii?Q?dvJ7wBElBbdwQM/NNARBvbeVUuG94TwzJ0xm+k56wrOJpj0SjU012Q3txF63?=
 =?us-ascii?Q?GxCfwGrGnwOXnrZ8nkORH3K73SFF43ZNkeAViW6BWZ619PbJiQQNgExMVO0I?=
 =?us-ascii?Q?ARvBVZVYE+Q6fJVsHickKWPx95SF77os63KsjBBNK1ztAkDBWopyQaBD3K2s?=
 =?us-ascii?Q?f+2fxd1zxYLMxUqA6KrRpSohoDph2qigVre5Gb1f33mXC71WeRgg+a4VGB37?=
 =?us-ascii?Q?bJgNbKE3Fd+bjK0C0m0H8133gCUCpfMQYxVOEiOrawMnJL/bX9yUmCmgRP4a?=
 =?us-ascii?Q?wVXPQFKx0nIDr3ORgCym76JhLwcQb8v02kJJuGGL9yL0FSBZRy+KZp84RWe5?=
 =?us-ascii?Q?igIF9Of/qN0nRyi05K4ufLJ0qqm+m1Dz96sDBIrGtKbEqc/pd1kcMqfZ9lJO?=
 =?us-ascii?Q?xSM7RvrlXujFLjhwUWXlsn2w+GINgvdIYyH1lNocu3Bb/JXwku3b+mjF521h?=
 =?us-ascii?Q?5DU7F3u+JzHbDcr9haz/9eWiXrzEltg9e6vwVKBmnQ+Z4aoL37bdrqz3f+Pr?=
 =?us-ascii?Q?laYSEdhwG0UTgCnZ9edPUFJQ4sjTkwcpZ0Bg9njzgVGvw7fBmZLyQILw0kPG?=
 =?us-ascii?Q?6ADLJCmiUJVRXtR7t3QNndydS9IaFV54r5XJFAHJYYtCpBeFQWxwWZAxBWbq?=
 =?us-ascii?Q?EGpzrCuIKEg0QIQSL9BmMPUYuF+pO+bcgLrfHlfASUBXY5WaL0o4rtZjnY1C?=
 =?us-ascii?Q?IhGUBIovc7KZNPOKrWhif5+9K50rZlzsGW5QPOqT9rmpG6UOWAOBuru/0zbY?=
 =?us-ascii?Q?OBqRGfmwGh0hgPhmBEDcnNzur/cRtYISNhUOp8/DRb36A9P6tebyHwpQT0El?=
 =?us-ascii?Q?p2j78qo1UdW2ISL2lu5gD+u8iPw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d74914-0c55-4e11-2acf-08d9fe1d96df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 20:28:48.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DufzD3MlGmcxSqFlMbx1Pr12WD1HlifAFkQ0N45Ede+EtziazHR8G73yVt1P+6wJ4r1wDAQec3vjpbVSt3O8Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3498
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70cd8a1c9495..f0ecca116786 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14120,6 +14120,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+NXP i.MX 8MP DW100 V4L2 DRIVER
+M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
+F:	drivers/media/platform/dw100
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.35.1

