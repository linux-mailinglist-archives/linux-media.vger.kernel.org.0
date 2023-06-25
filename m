Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEE773CF2A
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjFYIFP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjFYIFO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:05:14 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46211E52;
        Sun, 25 Jun 2023 01:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT81KCKq4YhItBDgn4DCX/4/hMQoUNtssQQP2JGJm0OXOPA3z6q5n49nEtZ0swXWprJhC00UxVS1ID1cHvI1UOlPgP/Cz3O7wCvpEtHSvqiSQaS+QTUuBe+Yn8v+UJlVPaf24sDou4oJ/cBDUyHRH1d1u4Eqvn4WnUlfOsKum/+E8hEvisKCI22k38oTYSxS2H1YS3j2b+dwScgqXhY1FIt7kDy+6GrYfNkuTYfQdcKEDo9KqiN5ytBIVzxQaEUBQCWtmdOLCCXF2myB9e8XG3vkPhq5AqDbVssTgLpqJtMzU6gLMda6Z5LVEhaAqHQMnExeSuOAEufr40GlYBX8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDOBKH+9wkSvLA5P1YjdLTsuSuYimNc0HjAAKVr6IOM=;
 b=lqrtmn1Qmzo0jq/VAqZvVBFPCspvDy8uWuZPAbCQZrp1ar2oxjqomb5uMaF8tqPuk9mwC2ecqdGBpFkUXwtm6cxkL+9uxKc8RrT9rUSVZDK6BZ7Zs/0xKc3baNRxCAf7fHyAqg39SBs82vizrAcAHc7RsIQOuX12l2EIrsVMdisnwPiciQvVWOeGKd7RWmsS6bO6Jvg8fbcHU4bI0v/Rc42Sx8PjAKNPG7Ct55rVInK/yEkPrWLV9RVlnsRL3Cp/v2HXADNFzuGMCDDP88Dds75goqoHRXtZwXQYAvtg+8VSGs/nBjOGbwj3uMZRx+eZzwm0MQYXSMB/z9bvybClLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDOBKH+9wkSvLA5P1YjdLTsuSuYimNc0HjAAKVr6IOM=;
 b=D9mneDATc+mLRDfAWtNQ/d0ieSEHr/TkoUrzd3iKVTTBA5N9b5cMFagy2OB//qwU9eTO54+TeN+KVzSx0rIiXS3b+nuse+86PDqpwgiO3Q7vitkyI11dT8wmE1SbCua/rpNbqSw+9dqUWU5OKa9eQnDD77j4BTpySfCxIL0n1E4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9279.eurprd04.prod.outlook.com (2603:10a6:102:2b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:05:09 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:05:09 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH 0/4] add ISI support for i.MX93
Date:   Sun, 25 Jun 2023 16:09:12 +0800
Message-Id: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: b1240388-d672-401c-35a4-08db7552e4dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dgMG3/VKbFCeusQC6T0J03gm/EPMl/uuiGHfvKwsX7oTy2/BzryKAKZVuKLNdh6Abk+CpHfQb9xdSqtlH+BQ2Rb9MzPuUU5HEqaD3uZQ79MaUjf7oLasWi3YV9XBouWxnSdLPjcS/4AnEA0Du17ReRU5lcsTgiw9HsWVDEfYOYIUfR+dcY1f8mGEN0LVBTjlyDA/XNZO//7D/j6G9tzWOCx7sIS+j/fkKsyBubWwRQdFirJuJdCfCnT2b1R+xvdiLvpH+JT/0aFpq88+UT1AQRJsp9FkVatc0M8YuAM4URWQWXbMOpQZL8SrPFbpPu6pca314c1xdhAOFRLJjE4d/VJvydAQwCrm7yrpuGl/b6mSIcHwyP1C+Urt/BoILjIMKmzKhZhuc+3fDIs2qzafTSPHT8fxqwqoz8cXRB/InVdeVmq9y30FbCkluSam90ZlptH3PljEhQV/HDLAaemCvlUWosgo7Lnp7uBt2vOWRibpxGvutJa0Sp9gkVcEQ4WGeX73ULznNNI46JtEw5Awt+uEYtlt4zvDwPRyciiLA3t3V0KPkufBZY6OfHe/fa6nTTYbhyn1ggaLqk4goUMJvDE5yqzgtbT9ugapBKVs1qJ5o6lwKdyg2iLfK5EHMku9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(8676002)(8936002)(66946007)(66556008)(41300700001)(66476007)(316002)(4326008)(6506007)(1076003)(26005)(6512007)(9686003)(186003)(2616005)(478600001)(6666004)(52116002)(6486002)(2906002)(5660300002)(7416002)(38100700002)(38350700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PEeVqChGT2J5B5Ph08MyHOCz6HRkohXjvLMaNhtUCmlHlaWxIWx8U+8wLOFN?=
 =?us-ascii?Q?WTMgfF5laAZkMmK8KyX3XqTBkkz7By+nT7+BoNqIhah7pG/81orxwgy21AD8?=
 =?us-ascii?Q?mMwXAnz3GTHYesiYI9EDiAm6Y6bxCt0V3H1sKCQq9dXbC2J3SwAE0XXYhm2w?=
 =?us-ascii?Q?ePSNGQfGnrxs+4qSzbzQCq+qOJBawpw59Fni+Xe7b5a588b5fomcefLinHDw?=
 =?us-ascii?Q?OjWe231HlC+T0C9bhg9VO5YOFV90GbDxnBcAn616MmSS7gc4Yum7iPk4XIvA?=
 =?us-ascii?Q?R7atQ1VGS/BQiyPCk3z1FzOqJ3FfFJGVMM6PsKEjeelgbAORm6j0ypL8I0MW?=
 =?us-ascii?Q?wgkJ3RaQqWlOOFWy431QpEh7UYKaUYvCSCvB3n5RVj2c4bnPsvM0dTl4/4ZG?=
 =?us-ascii?Q?pfLSGBj2cYfDvbVyBQ5nYQV+hjpPRqyvIjtJVBoDqkR1GfnQJRWVz/Kkd1WT?=
 =?us-ascii?Q?jx/99Fso67BcLJDMKe0YVhrdYHyjC2yAhXlzAl3EJopTu8MHQOYRuqIHi4Q2?=
 =?us-ascii?Q?YaTCWqa0e6g7sms8qqYRu9z36X6R5gm1j3/Gkh3CTGfPkHvzKwCWfnA939AW?=
 =?us-ascii?Q?T7zbmtFUBdKxzwB0pSXrYVA3VjcBENxs5klt7YFGhA2xUGnwehWDRkmcyjxo?=
 =?us-ascii?Q?Me9ACCvRQDrqX3+51VlWf6ylbnCZb8CrwZbVmdZlgUoL96loW+iqsH4qJQ1h?=
 =?us-ascii?Q?XkCN1ZUGt5pomsVH8nE+OGyCEr46hOubychYK6WSx7SgcSetmLIa5Jze7IW+?=
 =?us-ascii?Q?/hV/mrSRHTC8rwfQAPyMyBhP7jtvMiLl2OOf9PQH2TNid8ZE6sLupP3QwOy3?=
 =?us-ascii?Q?s9OzrkLHSzp4f9W+aILmCLx1QzYKoEhpWqSEM0yhrewqYdidqXJML9WlwQpe?=
 =?us-ascii?Q?gmZ9kgKr/XUWLVJJ8IolNjWYE3b2eluHViXDW6Lg9F1j1fhb1PiVh0oi2UHL?=
 =?us-ascii?Q?fWbhl4GgAAAaVlznkKhc7xnvULOGhmuJds9eYus0WLzvUUmF4lC9T9DfMyS5?=
 =?us-ascii?Q?ffgCVQbfID15TW0XeyfGEUKkFFIpv+9cFEc0/DjhFkhWLOmUt/RLv+iRwESy?=
 =?us-ascii?Q?M5hr1fPxozQqfQvlnnPfQUajL8ZMYEC+wS9nXCD2uRkcqIo25My64pjZtHZJ?=
 =?us-ascii?Q?W6SvrJotoOdOs+bd4y45vsbW6Q2dFSwL5HiwGTipvbl0DHhihsd5UvYobWU2?=
 =?us-ascii?Q?uYtpixbJpSBGdNeP/nQY2jpBthlb1Afmyf/nU0QNo3cmctYQXdfpEkFOaDJi?=
 =?us-ascii?Q?+3jeQhkk4iGVSyswEayI1gZyH/cc3fdnTqUMbU4DCqN9AKD1XkEVuSH7JTuf?=
 =?us-ascii?Q?2k83Zxnj1DfGVpG28iiEzC/0BIIawNy0qWsGnX4KENi2EBScVNVQ7e4b73is?=
 =?us-ascii?Q?yhMSzxRCQMNo04cMhQ6/BW7hOLVYri5NQOBtfqJ9RiMp9JpMi5agifC3C108?=
 =?us-ascii?Q?43Sw0BBrDGdSyN+qpmk3/CXKye+2eMLl8LVZW++IUKB8hFFCRgMJWk2VNXXe?=
 =?us-ascii?Q?YlNhZlmmhUt+ste6ZmPdOenDO4EVPx4viJSx+wNV+JJRsD8wwqKVbRnH+pH4?=
 =?us-ascii?Q?dCtzKAXIPHpu++3gcaJly9iIloT672ILsSJmrHiI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1240388-d672-401c-35a4-08db7552e4dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 08:05:09.3464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuEJfuN0zH2zQxK+h0ZgWY17v8JT9VmcjxBBurdBYRF2P5f3ynSoDvb/GdY+jp1Tr28pghnvl/LFisnk/1FoxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9279
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

NXP i.MX9 serials reuse ISI IP from i.MX8M family. So reuse the current
driver code for ISI and remove reference to i.MX8.

Guoniu.zhou (4):
  media: dt-bindings: media: rename nxp,imx8-isi.yaml to
    nxp,imx-isi.yaml
  media: nxp: rename imx8-isi to imx-isi and remove reference to i.MX8
  media: dt-bindings: media: nxp,imx-isi: i.MX93 support
  media: nxp: imx-isi: add ISI support for i.MX93

 .../{nxp,imx8-isi.yaml => nxp,imx-isi.yaml}   |   9 +-
 MAINTAINERS                                   |   6 +-
 drivers/media/platform/nxp/Kconfig            |   2 +-
 drivers/media/platform/nxp/Makefile           |   2 +-
 .../nxp/{imx8-isi => imx-isi}/Kconfig         |  14 +--
 drivers/media/platform/nxp/imx-isi/Makefile   |   8 ++
 .../imx-isi-core.c}                           | 114 +++++++++++++++++-
 .../imx-isi-core.h}                           |  35 +++++-
 .../imx-isi-crossbar.c}                       |  55 ++++-----
 .../imx-isi-debug.c}                          |   4 +-
 .../imx8-isi-hw.c => imx-isi/imx-isi-hw.c}    |   4 +-
 .../imx8-isi-m2m.c => imx-isi/imx-isi-m2m.c}  |   2 +-
 .../imx-isi-pipe.c}                           |   4 +-
 .../imx-isi-regs.h}                           |   6 +-
 .../imx-isi-video.c}                          |   8 +-
 drivers/media/platform/nxp/imx8-isi/Makefile  |   8 --
 16 files changed, 214 insertions(+), 67 deletions(-)
 rename Documentation/devicetree/bindings/media/{nxp,imx8-isi.yaml => nxp,imx-isi.yaml} (95%)
 rename drivers/media/platform/nxp/{imx8-isi => imx-isi}/Kconfig (60%)
 create mode 100644 drivers/media/platform/nxp/imx-isi/Makefile
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-core.c => imx-isi/imx-isi-core.c} (81%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-core.h => imx-isi/imx-isi-core.h} (89%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-crossbar.c => imx-isi/imx-isi-crossbar.c} (92%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-debug.c => imx-isi/imx-isi-debug.c} (98%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-hw.c => imx-isi/imx-isi-hw.c} (99%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-m2m.c => imx-isi/imx-isi-m2m.c} (99%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-pipe.c => imx-isi/imx-isi-pipe.c} (99%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-regs.h => imx-isi/imx-isi-regs.h} (99%)
 rename drivers/media/platform/nxp/{imx8-isi/imx8-isi-video.c => imx-isi/imx-isi-video.c} (99%)
 delete mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile

base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
-- 
2.37.1

