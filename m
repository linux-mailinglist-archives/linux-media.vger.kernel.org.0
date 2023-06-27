Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0AC773F458
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 08:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjF0GQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 02:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjF0GQB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 02:16:01 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17B926AE;
        Mon, 26 Jun 2023 23:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qoy/dYfOQaCKRVcFAdf0CjhE3BJpDgHyWvn03Y62rPaRBnl9DS0E5V7aq5t+7/wrEdyaV0/QYowh5IZZWynOYF6ZyTl8L1Jiu06+MzFTGFxQfaH5OZU9nCkLl71BUMNOOEKm9+T92MGwv1d0gse1UCPNgJ3tPyl8Xb+YTNEGs3CEmgTIEz++cP3PB+zeQivamBWOr/pLtiNSDl068FFRR92WHe+bJ0Ye8U7dIb+FDACwkgXeqCidjDe6HuhqbdxO+Ad1laANW//xG1VhPB8jz0vNjoM0Q6q1QnXAHFL10K0uqAyPgac1wN02ccZF0wEWuu14rJDCPyAVmlYReehiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZYy3Z06HS9uc2pXf0fLHyI7YXzlfheYvJYaM4GejMU=;
 b=VereF60hZmTHhD4dM/bibnSUOcBPQzkKCdgqu2wnxdrbI5iBEm1N5qwqYW3Q5VPkxIbMS+FpOQP+cSTx1rI6NC13b76QXANnRNH5Erk67UNPoD2gPh1Jsb8TnO36+EB6qgOLY7fJrYNk+mfs8KmdMY7BgWAi6FUxcAZEENrV7pBC2iJ5VgpiDKom4NhZUT65ziSXwQ3NcbaxHSzW0mD/QtJwyus50EZ4ae87CLgoETcwxdOiSs68npvpGzQw8/RiNVpMVsbTT2VvSnc1HK92/cj430wdt9Pa03k+CF8tvrzdutdNbiR5K6TdZf3KFOW4NFKf+NJEE9zuEDb3OAfMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZYy3Z06HS9uc2pXf0fLHyI7YXzlfheYvJYaM4GejMU=;
 b=NDlUraUuF0loI/B3BSPgbbWnLUT7ksdycFL4OAGfkpvytjZQQ2ew2GTQr57zHCeFS2cpnSoxWU/tV1dl5GQrdgKlWj6zo3mNYaRUs5XOtb9+iaKHPW7Jl1jXBQ0oUMV6MqEgBk0myFFVMNjXNRiV5GkBf/DTS+qaBtYUof3GW6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 06:15:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 06:15:34 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v3 0/3] add ISI support for iMX93 
Date:   Tue, 27 Jun 2023 14:20:14 +0800
Message-Id: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB8PR04MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b01ce58-7d5f-4a5f-b20c-08db76d5eb06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4uw+64xdq3d524m+cTzhZVd8F/hIX/nRjkJC+mUoetmXIF3wN7cOhdEsr9RzvyXQrz+OF598+nuz3/0GPSb1uTH1ayWvVc6u/AQV2t/jxP/J5+aSzwSem3pgP1sVyo1W9+1KlouLzTMzGlYb60EGG2PdK+TkxCGTSHcbnwT+lBw4w7y6dzw7P+w6Dws5/trBdqDVbX99kcMtnBuJofwvOczYdWEZPWxw2Diu18fvDItAHZTPMzlcpQZb8RgS//nnNfJFXB2Xe/Naz1e7JXHGLl3HgUp6WZdtklRJLmXQphnziPq/EhcULOyLUMzc8qMHPKy5LAX+mYjaJtBgaaqT+DKOzJi/K2U1tTXBePtRqGx19Nz4AXf3z1kr8tY+0U0pwYzREwIMJrWdDYtYdyQ264DUdQkguOlu6m600TmNQ6gtmllftV3bJUBFNzfZE6hWMWz4Y/S05W2SZXp3wnh5Qw9qFJeOJNoFeXCcVS2WIsAbfDBGNVhdhmWQ88/a/2ZIiUvOY5ygdvNGZl+dTI8zVR54UvXKkn5CzdW/xJ8SDuhaLI1SjSRq6Ha8s5VEEmjxwJGu6HjcBA5p/bXDOsUHekOWwVw5rcWASH08YxTztZhJ2a7ot2NG1LMVZlntKAl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(186003)(2906002)(26005)(1076003)(4743002)(52116002)(38350700002)(2616005)(38100700002)(6512007)(6506007)(5660300002)(41300700001)(9686003)(66556008)(83380400001)(66476007)(66946007)(8936002)(8676002)(6666004)(7416002)(316002)(478600001)(86362001)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t0MBFmhPNuUKJXQ6OgLY4hEIgKFzX7i1UPN4KAd8Azc+8unAnmkLjAS3czkh?=
 =?us-ascii?Q?wrjxdC1CVeU7hVrbX0jif70tZe+Mc4fjmH6AFA8E0UKF1GmgB7vKpjg0ZXy0?=
 =?us-ascii?Q?1Mp3olPZfpgpLodUfY2BwfNZrdKL90kz1UFOZmiRUsPXlgIcJz9XmX3f90W0?=
 =?us-ascii?Q?zV7WwgCXq37hqAQGJm0+gOdFZPYMU0HXmNFet+HLqM7K9eVFFP3enQ0HnYop?=
 =?us-ascii?Q?JxIE8um8Y72N/YVyZpLJ6HB1EuZVDLkHSm4sXWdEjesUjf+2dLPkS0uXXLv7?=
 =?us-ascii?Q?yc4E+TqeXu34dHBXmxd8hKwCE3Mwk3AhxOd62ZBIT1tYKtRUNKEAzczr4lLO?=
 =?us-ascii?Q?XHfU/x1JefhWazaxXDHYmTdlX3sMs+woKLFN8cKF4essr34hB4fABcTyhGpw?=
 =?us-ascii?Q?7Uux7INEuf7GKVLldo3bp4tHXLKWz34XBxFkjfznpAV1BXxZToL79xoNGKHM?=
 =?us-ascii?Q?FQlRUtp8jmW3HCOA+UuIXlOutXmDoLUOiJk/Rq+iVcECGmDkPv7z9FCkSMYd?=
 =?us-ascii?Q?rq8XXBLmfQcjJGJBZXljbf0XYev4JwTd9flsEJ+B/POy45TlPZmEzJXXp5a4?=
 =?us-ascii?Q?+JV0+T9dgQ00CGHH0RMMTyTF1d5oDxQgj9hLV9v/Ix5hrYvY8yZHDyWRGoat?=
 =?us-ascii?Q?MtMYnQdyvlQ3j3LOw3pw0UzmgyiqMPRTW6ctAvk/ZV/3rjbzm8QXCXZtAi+l?=
 =?us-ascii?Q?L4Zht9TPT/EzpifFQqZLMY6kCJPxuk3Ql7zAMmfEXenAR2Sk9vMYVQzmh8UN?=
 =?us-ascii?Q?SFQ62cPQz73zYs2GHRvem52OHMNP6cs5cki21bP+uG184tr9gsz2XHpO1sXJ?=
 =?us-ascii?Q?bbGVfYtH39vJySjqN2UAZ9OPrwawb48JVNCrQx1bz2qIu6r5gSYx7t0yf2Y/?=
 =?us-ascii?Q?PmLnPqzKp5GcX6+oOSn/PHvok9LCCbnN/Bc0dRKZLdr3UddTR5iq3NKsy5qT?=
 =?us-ascii?Q?D1Sc3XNLSFK7ifiIvXGb5/jYrw409GZ8Og0LZNfyB7Ra6CUNj648YwokSRUX?=
 =?us-ascii?Q?UbP3ysBvzq5NDcr+eJoXFTy7tVTpiaKZQU7sn98TxCCV0Vr1cTggvPhHsOe+?=
 =?us-ascii?Q?84o9aMroS9TncPYR/5+jPVVC2fMbQ8OHGUI843a8G8MIU4zLafujdnWetta9?=
 =?us-ascii?Q?2Gg8KJmEhFQCdwT9mpEIynj4FTxabJDcqMEoORB/SlfAr0Qd+d6mzXC/D1zw?=
 =?us-ascii?Q?MMu1s8cbS2Ik/Imxk151CaYgPGUa6NaRiJYaTYQP+3Y2BGfc7Co249Q0LYZ7?=
 =?us-ascii?Q?hYl/DZupKmrHbBWb/EKbwqCOu9zJA05uPYweNcnAZofT/EQsNNbC3x2mnvA+?=
 =?us-ascii?Q?tbjA/aXTN4gfbx5f7V29iHsHf0vWHQ651ZQfIEpYm/qbmSFWMBHywgQigL24?=
 =?us-ascii?Q?+bUsvkIm3XTn7VEQgNpts1tDAXq0yBxvkXBcKSzCWsutzR2B4uI93CE7G66M?=
 =?us-ascii?Q?QJ7TbXyFGmFPbqzzVIAynoCLAvt4OKhd1lLU+FBTWDeVqKoSEGQe7EXgMF/g?=
 =?us-ascii?Q?+7qCs8ryg87sqMdT/Vdu4B3wA1Kn+pq40yxe0weCUORaKht81srXRZXjfZIm?=
 =?us-ascii?Q?IG2IZnb1iOxBU0XJEFfUkUz06BWgeTwy1sVFN65N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b01ce58-7d5f-4a5f-b20c-08db76d5eb06
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 06:15:34.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXsAkJCS8x1x+AeE1IxkM+Qj9xkwml8OalT//45y7gel+WDrj9YCG3aZyr3XbQdMw8p8y1LI7q7ZR8I2t10CSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

NXP i.MX93 family almost reuse ISI IP from i.MX8M family, so add
it support in current ISI driver

Changes in version 3:
- Split [PATCH v2 2/2] into two patches, one create a separate file to
  store gasket operation and the other to add ISI support for i.MX93.
- Drop some debug message in gasket operation.
- Merge .gasket_enable and .gasket_config to .gasket_enable
- Drop some dead code
- Some other small updates

Changes in version 2:
- Remove two patches which used to rename imx8 to imx.
  [PATCH 1/4] media: dt-bindings: media: rename nxp,imx8-isi.yaml to nxp,imx-isi.yaml
  [PATCH 2/4] media: nxp: rename imx8-isi to imx-isi and remove reference to i.MX8
- Modify commit log to more accurately match its goal.
- Remove redundant "media" in patch subject.

Guoniu.zhou (3):
  media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
  media: nxp: imx8-isi: move i.MX8 gasket configuration to an ops
    structure
  media: nxp: imx8-isi: add ISI support for i.MX93

 .../bindings/media/nxp,imx8-isi.yaml          |  5 +-
 drivers/media/platform/nxp/imx8-isi/Makefile  |  2 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 32 +++++++++--
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 42 ++++++++++++++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 42 +++++----------
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 53 +++++++++++++++++++
 6 files changed, 142 insertions(+), 34 deletions(-)
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c

base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
-- 
2.37.1

