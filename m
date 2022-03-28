Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCC24E9920
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243710AbiC1OP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243702AbiC1OPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:48 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB4C24583;
        Mon, 28 Mar 2022 07:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxhskklRDiT/l5QOxxwxdwLybgfsq02fJeCW76B7LeRo6VCKApA3kCzgkHHnVj4UHU5yF8588G1J1GZoe43Uff//GV4Y9QFTGTSQAwfG5fyDI6rFCsvS7OGzOPbGqcq7o0aErwgmZG401R0zS9E4pXH4Pg+xukvXS23zlh4hbvrwpGdvTaxcS7xnP/JSDAFtynslmkOdCuyY/3C0xikZoEl1ACwwW20WMXdZXArp05UVv1fSuG8E7uy+Kncolo9h5KZRwdUVVPSQOhoRfaW3ATnzMhtzZC69DQE/N3QGPjqgIjO/JbICJv/PXS/PgDUzCUbT0/aM2i76WDavIvrzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3bzVS2olRdSdcMZ7JWcuE+gz3dxFoGQOYI1d2cIaLI=;
 b=arfBY9PhROofJ7yiTrBbobSIvSE9Zjme/5zCW9HEtWzgSOqWdvkD6L8YM1xpjlpsuK8x9zn91qnu79eWvnYHqtAasMiQzvs21ndBYj8tl6wOy2IwybDFQSH69IvjDD/qMeAkps0lresRn0O80dS3YvXhetmPmMHVyD/lahOPyx/Y/jXjkxkkqTfzf3leLuhYXRC/riSQLBBWHJNv/5afzGFp1s2Ws6fjxkZeTAR+8nDSiEZECsUhoxwv9j+/TM5SM74J/sKK4fk0Tp0E4CuZNQGz85wg36rXpfSGL/tq5pREpom137rUiXooKOb5qY4tjcXGSWPNPhLbqUXQafE1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3bzVS2olRdSdcMZ7JWcuE+gz3dxFoGQOYI1d2cIaLI=;
 b=DmDGj1Fi5TR8xcugXbb5NZXOuRaI2Xr20ptbWEZ41BDjzxzZBlUHZeRn0FaiTjaDPGmfTFogYsyPaarJTOSwd68RqMM5XxW1KAmT5br6gQBxtynfttPo4JhWctsLz/2Vngi+DxZ75zZQwJTyumX7bEoihhFMxCipu7ydAauJMAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:14:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:14:03 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 9/9] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Mon, 28 Mar 2022 16:13:09 +0200
Message-Id: <20220328141309.177611-10-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0032.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20ef2a51-0002-4d3a-873f-08da10c53683
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4418C82F5B6F9744984F5641BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfBKM+ULxbYYgVr0YDMsxRv85j57QdMuC0aDY5aaEdXMuzaVlppf9dP65b25SPzb24qROEZ0uEL01s5lMkwTQeG/b1Ec4CsREh+2yDgmEYnr1jhdpnNYEYEZYUhgvNt4mX8gMml46r4fJ7c+Xbf1psUgpsrqWJEWOW+oHnrM6sHDP7BGx2+xDhCN5pa05ak3bjJMdWiPO0UGs4weqcw/ybnKoq7xygGVmTgWbVXOjtL240PFehpLeygott1fdXv31+9voDjgIBX0OFGCd/X1sLHVVuRqFR3WFtHMhayi2dxlu6CCf04/212PrEzK4nh8jHNeggI1/PF4O4Dqb4m/MP1/qGr8j1GjlJwYqQ7KALF3Fp+Ng6s3l/t3cRlv8hXq7zJMLhEXwe/PfFHgwF0s5odwr/+73zARAzaA/AyDJQsz6aOIZT/btfFGG/I9YoSTpyLd6aIrxHOZrel8wz4hlMzohH9s1XCmQ7v4wgPTfnZ7NBDd9oL6PjPRQ4T6xUQHXsckeR73G2oAX5zMqrPUivo6E9SHFX0Hf4mKBSTxm4xb63Q19iSSGOazF8ouGwhnhctnk5tIjrfUY5wmmTgSC6ZCl6nQjhdmIXFq9H3NdR5bSQCS6ZT7l/uQdnSUjByr0SjPugKguybGJ/WTHLz2Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(6506007)(4744005)(38100700002)(66476007)(8676002)(6486002)(1076003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RoYfkMl1BaeqMwCwvgUmhArxLPcaEFTCkU+23AHuEypj2y0JAoxCjZTLLDj1?=
 =?us-ascii?Q?ymgTOd+papi94qOltwxHtf0YVP8Cjjls0D4JErCZonG2pEFZcz16+4wW0VTp?=
 =?us-ascii?Q?o+v1DOw9Vk+TBcnAK6m6jtcYlvWO9un6B437TLMprUDQCpsj0m88vaLWMyVa?=
 =?us-ascii?Q?CRKr1GzD0UeZ2DKE8RDRUdlk8sUz3I4Y8o5/PHZ3I0EFAhCSVuA3JFLjIluC?=
 =?us-ascii?Q?TCPepnlPUeqolYjEWFZc/s7PbDVRV3HNODCzB+L7+FcWS/pQK2cvpi49WOTj?=
 =?us-ascii?Q?Q91VnmTSs2dSTYU8HdiVhK6zZqGIOz9+ZnZRtgzRpkUx4kq20Xf+KVuvaaAE?=
 =?us-ascii?Q?stYu9i7VoY5eee+TwV1GpQma6cw9a2Nombgp4g8fLoodhf71XLn53wykroMv?=
 =?us-ascii?Q?anNBp5rbknuVoN/kuKRNLlvfHXk5M01iYCQKz+uEOGXvJaXyOR1G20x0UH7X?=
 =?us-ascii?Q?LAu+96o364a61kWt+BsauvelM7Q0Zt4Bc9ItXwf0PrC7OTX/ZtWf9K6BwY8x?=
 =?us-ascii?Q?IWLFgHSeZ3ZFj2yieQ297tlCPuEr7sMtuO9GZJrx1rhDod3eQ6JppRDxDCir?=
 =?us-ascii?Q?Tmbcx+a84uC05oIT9VDpFxPt1ry8WZ5Wr39/nazJsFDgebXx87CroB1w+Xf9?=
 =?us-ascii?Q?wXcVH2dlDYCZnXTJrGuj0lCBWufPHqkHlfqQ4sr0NXrFionQBgYR76j+5j3F?=
 =?us-ascii?Q?x8lV3/wx2iuUga4/afeVzJ2ohOhhEgH3GAJWy1M4a+lTAEGJHc2x35X/wI9a?=
 =?us-ascii?Q?NaCW8WKby749nN2Mwva0gkjcVSi3SxkTT8PldF/QqTfFy06frFCMxfhOtQWO?=
 =?us-ascii?Q?57nNruVFqNd728J5N0PP2npXKCdq2OOHMsM4PIiPNT/QEHGboiZDCV2h/bbG?=
 =?us-ascii?Q?oUcnZla33vETUas9U3DFq3R+tn8GsEYAqQHc538Yll4Sb4/eLtB8TEXJW2n2?=
 =?us-ascii?Q?tNXn17ZgHHRcFsv40kNrhuwP3TC/7jOQl9af+1ztpndfzc+C5X7yxJb6b/mQ?=
 =?us-ascii?Q?vg8z3kWHatFYC1eLyAtkX6oPEPr/w/PZdGtggsHWgt51rQGgWhVFL2FWCgDl?=
 =?us-ascii?Q?OSkbf0nqzgVM7XJ/1uPlFcyvoAYi6A684HDJbzk7ZAPnrgKEQYymw8wIBdAL?=
 =?us-ascii?Q?Vqdm9JxevSY2FFeCDkUfx6yoooC268lclFTewxoTrCzVXhYd7Ff1ba+4XNV6?=
 =?us-ascii?Q?6d2yhDefJXXeLzUifKcZRZ8JqbhmqdaRxeh0GyzOTO1NJMW4w+/nVbd90VBH?=
 =?us-ascii?Q?oTV/A3aj4gs/WyDFRAs3/cTPfbd7dpuOaH9eeYy9yGafM0Jk5SU7Na6VWdJA?=
 =?us-ascii?Q?NBDJQf5h2yccojD7PdJu4Z1ycHBMeEtXzI9Fcca/v83BCT8dO3lGUjo18gwa?=
 =?us-ascii?Q?ucBif5UmG0YLYZUTZjvPKXS9FN0Kl4f/I0hmhxlesa2Ldde0G8DHUlLPzRKr?=
 =?us-ascii?Q?gC5FMSsS81yFH/WfuxBRko2wjq49DOSzmMi8YUMnI/TF88BZtHtPyw26OYFx?=
 =?us-ascii?Q?IvyNixRXE9iKyxb0gaC3RdT/5uJzIuF0mWsXU5vPsqrbVuUREC+6S5HvS9hl?=
 =?us-ascii?Q?iptMJrga713bVE4FTM/Ho6Y4nfa05pDdiYYDP9dF/fCpyq7ykxApZkcub6gu?=
 =?us-ascii?Q?CuQThJ+ibjcfoIhimwNyYctgfZUb8xuuvczzW5XzJbEFyyB12yAWrm1ZAXUi?=
 =?us-ascii?Q?fVPY70OoAJCfP1tmq7UzZpUQ7xCnRy4dtDufVAh03suwp2I8J1Vay62m+KwR?=
 =?us-ascii?Q?LVag3gPjrs+K95/aHd7R8EUXtXwBlmEkchK1ryV7H6RvGMVhuxT2yT4Lzpwi?=
X-MS-Exchange-AntiSpam-MessageData-1: 4Y1jwAqlsf+EzLaF/5mOkzLRF4s+srzX2fM=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ef2a51-0002-4d3a-873f-08da10c53683
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:14:03.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm2r/VkhmotrEIFSpiNCWkIRekmFU6SngINHLrvcTuvvaAj+JvPaIN1j2g9CfYMthhzy405zb7TqN1ETFniDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
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
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49d1e43f4a9d..be517babe68e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13932,6 +13932,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 F:	drivers/nfc/nxp-nci
 
+NXP i.MX 8MP DW100 V4L2 DRIVER
+M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
+F:	Documentation/userspace-api/media/drivers/dw100.rst
+F:	drivers/media/platform/nxp/dw100
+F:	include/uapi/linux/dw100.h
+
 NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
 M:	Mirela Rabulea <mirela.rabulea@nxp.com>
 R:	NXP Linux Team <linux-imx@nxp.com>
-- 
2.35.1

