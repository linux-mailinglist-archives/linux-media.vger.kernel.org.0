Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBEE8573EA0
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 23:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237368AbiGMVMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 17:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237350AbiGMVMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 17:12:01 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360123341D;
        Wed, 13 Jul 2022 14:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKkJlgekWRUeqO7hDkbYRQSppivGyxZe3MhE2cy9zyqWfTWQokDTo+ba75vi6vV9iqvT5jNPBZk4EV+COjEKgc5Wpm8WWLvK3gAtahx2H7Prbk5keYlQmDwOmqgb/QHFDA2BY5MEH2ceNtO53g23KRB6+YYLO2ri7eEH1mMPqQfIqs/0A5+N3iqk8mCGSLFgxqUbIIWBXHeY88u8a8DBM71Q1DeFebiMnxHrWvP9i0SBOPgKNZfe09XI0joISz6ut02Iu3Wq1+Nfk4z/CHRZCQ0MAAajcCIfHIeMI3nqJFdW/HeOJOTDrIk6nedTGLwx3GOEdEY5w4pzjuBuqJSAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovrcl+8ua66la0c/B04Ms+KmUl+7NtWMDBTceDurdr4=;
 b=n2UKASkeMbPN0LukGi8WmYuKwQ6paRLn7UM2zq75EPo2Cl7z/5AbX5/mAH8EVpzNxGEoetTicn6T4zM+YIyIwAKqijnHZKqFEL9YBxglDQkIbOYZV5RnHxwpDEM/DudakXxlbzP7wkbzpq/fhPuM2hGYWXLeBRCxEmVZaBn0OCN7EVUEgadgk64VNXZzTpjeO9x4DhyzGCHc2sqFCzsC7ehcfC03qvnzUIqcxVvM+77lIpbrlGHnZT3pIqf/ESYi5E56qRclMV+5/HKr28okVp5JJhMioNGC2qtsiWJ16XI6kwh53lE4RMwULzKo5osIR8rk148a8sciDc76/mqPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovrcl+8ua66la0c/B04Ms+KmUl+7NtWMDBTceDurdr4=;
 b=Xm4iCTGbF8pdn8ABzOVrnOIbEkfsoMiiiwYKoOW1mwHOzRji3PtzC5+ClTJO3lrINK+DWEYjugSXdGGk/wF7BNcPi48P49DVEpYBbcF/1nHCdRIZsUSU/zJpJDWISAHwOG2vpAjdiVRL6Xw8EdpMLRwUpMEL9w8HFaEX2NvhTi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:11:57 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 21:11:57 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 6/6] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Wed, 13 Jul 2022 23:11:24 +0200
Message-Id: <20220713211124.2677275-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
References: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397d62ed-08ab-43ed-5214-08da651451b7
X-MS-TrafficTypeDiagnostic: AM9PR04MB8874:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yAfRad7/PLzcnOdz1hReSjFAAQB7dERkBW8CHsJJmhiDxx8ru04ZUDro3pEgkP7aMvSsjgBKbzb8ffaP3dK6tLIrekBpIMxhkGnVI0jWefxgPVsZY2YHQVl3/A5ZJBJ0f+fmtvf1KfTReAXBAwwXt3yCCeotZTKbp3SK1gypSPxFxEuQA0+pqPsFCa2exCTirbjYKg9NXAloqBesc5HfmMTpyO7o4zD6EEfvk/56UF4FZgwXuQaQrXpS5CS1D5XSUCHSccMCKUu8P+z4AFOfTb0ClWxnNbkj/wQ8PVNgjBYezrYGczaHKky7yClL1s0EzOpEHnLWcsyDUuvepbe01ewc08Yv3O8JzBaKUxEitRLbD9qcOofE1etgFJWzEK8rOWuSamYs33pSrUPPsxRgmSivfwIDk5DGJESTjD/Jv9uhEGcEV1oMcumgF6Fd1WZ/jGjq4CV5d2jpAyms3CLXeZ1mGMIgqD5OlQZ7qrCRRht0NYBt/dtPnCkgPhfXp9G9veiLdh2WSscXrwd91+ekRB9Wnwh4//uWCv/uj6B7VIum3OP+u2PGLwVpu80R1DAYvaumRj/Zj/IcmlRbBAX0DgJrErnKDcYerND1Nmq0e9ZgjE9o2BVOsOYl5IzMktikcqmwfuYRPmHm9ZLZqJ3P8l8LOizaeIaybvga6dDdDFEiGEPpLXuYQI2Ni+M0rc1HaCFw9PPWWETy9Sp3VehUYyWyqSkYVk42lkTSQc0zR4zapOy16Xa80+t5MwhHTOxqTa8RGrkQcOnNMI2Lscmv5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(41300700001)(8936002)(44832011)(7416002)(186003)(4744005)(5660300002)(2906002)(6486002)(6666004)(38100700002)(4326008)(478600001)(316002)(52116002)(66556008)(66476007)(8676002)(6506007)(66946007)(2616005)(6512007)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dlHqIAU0Hxatl8SpVlVJMpewBDZ4eiVBMQj/YIV0OGRfu5mu/HlvhI+VTpe4?=
 =?us-ascii?Q?qr0kA9M2G0XMfTnWYF7GpePzKvUvNvrGlMSszvdwE77ifsirV7Mjhv/gyp2y?=
 =?us-ascii?Q?q0hmIMURnLaqPfuyTXL5ud16wHahmXYE2W7Dj4hf2b6W0R5oe2Ycqa71yVNL?=
 =?us-ascii?Q?W8tTZEFL4f9TOCgR4xFefcAhdHXjHLhwa2M+N9zAjsa+Idt/sp6t8iVSrhEx?=
 =?us-ascii?Q?Wn83beMHMTuETbH8YBk9D+0bxTppcto0UWfnEX5QpgZ7Uqh5Kg8iiuWYXxdp?=
 =?us-ascii?Q?UdaoNMvCpy1RThJ3cY+nD2zow4i1CD6DGDexm/BAmxhf1J0310hL92xQ8LpT?=
 =?us-ascii?Q?BoWGX+eB1o7T4XOYtWidxsEfCJ2skYmUCYuJfJgiz+f2XJ6ZrAJP7Y5GdT1r?=
 =?us-ascii?Q?47qlgEoe9C1C8N979E8gwylgRyL/FhMVQaXerbKyqmBq7yIsWn+Y8mhfp9ue?=
 =?us-ascii?Q?7fjB+qZlBxaxYB1DQ1R4PPBh/CTwop/5JJ1iWAD5Pv0lvCwwigJnmecYBkrR?=
 =?us-ascii?Q?Har+gy8dM4vmnx+lCHtTRq67npidOLtSimhP22kIM3149/Ez13eQaRH5gTfQ?=
 =?us-ascii?Q?+xKvwcYLLpQkqkT0Jr7ILw3+jnyGLRR2s9jf0XCz/QdsGtFEHCe44+RBHCtr?=
 =?us-ascii?Q?Mo73F6Qzo/7eMaY+4AHBmMwryBwZziK7SqlTSrMBHo5o2+804PXYPghnRGwU?=
 =?us-ascii?Q?8ra/uPQsuWU1xcZHR8/o6jd/dcKxm4G61HxcH+LAzuwarfinB8ziSgiwAZp8?=
 =?us-ascii?Q?B81BGZBX8hRGL8y4i3A+xKK3r78jRns1JDnUXnOvlXxZcNjtRioUtXtuVxjJ?=
 =?us-ascii?Q?Uu4HFCbHZ//pdxba37oRLxdeupNDXmuVAzIr1n8mnN9P2LFu9IZiD0F7momx?=
 =?us-ascii?Q?j15UQlgDrwsYAwr5sKqLfsj8Zg957yjr0MlektBp2RuN1dd1VypuvH3ab54l?=
 =?us-ascii?Q?4H/2Ix4JdR4KYqH7TCLJSeeOWEz528KsVUUPZsWiyhSSkKbWEWsKulUhlYMS?=
 =?us-ascii?Q?Z14GSDcE191AcmJNjHZ+65OFWs0rsr2LrNpiWY2V+/82R32J9KnGzYptqQtq?=
 =?us-ascii?Q?dhiWnSRFD+Vqar0XOAcjOR0bH6fk1OArDizFKaqO88geJzMQCsRUygNVrgEy?=
 =?us-ascii?Q?gmNcjky+HK7cpDXLE/aZh6fEnGUbBOoSb/vftO45lr/OK7lBynDOHwriR+eb?=
 =?us-ascii?Q?Pu/qg1WyjfpWsvHLUzpcbGYH2OKDMmgZIO2eKx8dLssY25mD/v1sq/WeHO8N?=
 =?us-ascii?Q?QhUxm8o2KvWj0tHo3qa3z3hcL6J9ldcwHGGZJIJzrioB+bTVcZgxBbon/0Ux?=
 =?us-ascii?Q?1zPG7kmcjEvd7AYumD/oJXOR91bpQAJK1ucYwe9ZXoV/9Myd7csFXQozMsmK?=
 =?us-ascii?Q?DW9SBWDusTiOaHazfSJsQL4oy+pgtYm0Z1YMwXcsKsUSO1o9NBtmBYFXS9ky?=
 =?us-ascii?Q?+Lezy3bnsjf888JqLlmSni6J3xssEvcs88p+g1cSz4jl9cvF8Ue2v9bwxS7R?=
 =?us-ascii?Q?3suoeySFM4FhBJD+rLsnvtUVuZNYiM6ov35pLRudVyOtoHJQv9JIkCLnmmR8?=
 =?us-ascii?Q?QchSiqzrSWMDnMlERU8EGHGGjkMzL1BavRi6dxpXioss5kw5DUv+Pc6i8vY2?=
 =?us-ascii?Q?6zLFo2jXCypbgtaMW6zXyPoAPhmTQGfN67xBmZjCNDzCn/LjnwwlMzKOFpDf?=
 =?us-ascii?Q?MMzuOQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397d62ed-08ab-43ed-5214-08da651451b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:11:57.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YUzL7avMM1gFIw6NlswtNSR+mMxeXg2ZvQyIKsr+S2u3nrvhgF9uQQ5FnwRQLiiB1FTOWYWAwBTP1TosTmxXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
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

