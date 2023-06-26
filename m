Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0513D73D644
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 05:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjFZDWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 23:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjFZDWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 23:22:53 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318A911C;
        Sun, 25 Jun 2023 20:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPqMoh4nqXv2XIK1vDJJVj66trRh7iSmqexQlDjuL5gG46Wu6/y7SzicHhyb0LQKzYOPyYkhmgF8SciG4cOoQrpykwwEv6kSwarpa8JzWkmCWAl54is756AjfFWtq3jJy290sOf7K4BpVjqWzqOIQzvLcgcadN5U4vZ6PyhvdZLHW7EFRHY5zHIz95DUZcECT2kdl42HVQa9aliPKN5ND6S47IR1yxM1WkwEGQtFzc3CuWMw9dAMuqshcerROUDwUxHjnE2uD+wr9I/Pl9+sbH08Qx2ttW1HRdkbJHZ8RWFbUnOVy0Ey7S10Y+ekd0wd4BKaZCCujQ+8LOToH7VzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIYM0MFfpie632TRS4m3C7WBL7a/LRqIY565AJtgoCc=;
 b=XyU6opalo6B+IwheRvw/RNTwm/iFx3xMZc4RulbuILiQhCUlWGP+h1NQKHJ4T4sIdJ5UayvEvzWXfcR4rB+5Hw10i+LRFLjxwI4Z983rRuMSIu2GbI/GQYh9aslUg5+mo9T4zCgzi+584tNXuAMjj8oyNuDorrQjDbLEiutihi8u0C1PxMV+AUUVVjS90vdHdiF+VIrWpNvggkZHNTWp4bIxQE7bcDHZazT4uimRBYqwDiBbshXm0E38fuEG4kU7FR69oST33JoUV3BOQbJCsU5IwaLNweYdx0Gox64uIjft9y4IEKqKdmTzkI/eVKEPxHgALvKh/+6XcknpQ2g8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIYM0MFfpie632TRS4m3C7WBL7a/LRqIY565AJtgoCc=;
 b=YlUFfMus+Bgc339kd+dzg1XNzeStN46eZsm9gNaGjBL47R0RO3Vyiu6HTtKa3MPwGQR2gGuKTdZJnZIOr2iVbGj7OpbJzha1Ts4Db4IOFIfyKOiarf6b1Xo9z8BC7uMFeU6zIXx5hiCbwybtxQaWDV2AAvJzVe6XTLlGzpfHibo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB9934.eurprd04.prod.outlook.com (2603:10a6:102:380::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 03:22:49 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 03:22:48 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v2 0/2] add ISI support for iMX93
Date:   Mon, 26 Jun 2023 11:27:33 +0800
Message-Id: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: b16f49b5-e618-44bd-0edf-08db75f49e01
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEjMpwCSTPN5jYj3NkCTAVYlYZ1jZpOB15G9rQ3kyk5O6zvJk8lhkTvvaYApd3leYk+jzx31w75SdLNc6v1k0BxQ3VLIYMzbvF0kB9IGFPYAmmBlj19/jX+5iVjB4kaskEFTZXQYT7bVDbNAbFjTrUc3PWaBLJpyWZvhHRuIbpYBVyIypSD2CsDknXfBNh/2PkFxyvAtPGUZeTbw6CVBVd8yoc9r82fq3dv2QhBKMtN/UxP+FB8pcITIDuXhYvV5zVhvz6AHgREjZyS30Smg6n5u9Zb0PY0Rp9sSlV5Np03iyRuV1VhN0u8avgG+37ka/SGHOw27mol4siEjJWfj/ajiXrEZMczs1UlAvTFWpypoWpoTbw34oj4kfUg+2/U7J3az/p+jTreSDzCzpokFUGEkdE9dcBPJOMtjYhzM0EPY6hZNQmJudxC+fQ+Th+fPXWJ7tx18Mgc8vGkb6K2bn2xLcw3P8YglKpZp4wUUwuZt1POYMKFrIj5AZ2HnqAJxr/+2sXJpLtj9lKSC0aCv28ehSg4kSdDld+orrc2+NZp8JMxi4RwFaJ/c51dKC/9kwZzakLuiRo4v8GsdbO0yRPGRRJ2UHplZUMWbJdyug2KpKvSO4vKnHvhyqSIbVYQD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(316002)(66946007)(66556008)(66476007)(4326008)(478600001)(5660300002)(8936002)(8676002)(7416002)(4744005)(2906002)(86362001)(41300700001)(6486002)(186003)(9686003)(1076003)(6512007)(6506007)(26005)(38100700002)(38350700002)(52116002)(6666004)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jCUN9dUEBoy6wpJnQ9FtgFcRVwBvFKHhxjlfaM7i2DbVJcdtXmdtzi6HdtKi?=
 =?us-ascii?Q?sLkmJvm955mtcR3UoPgTP1tNMbN4JUbZu+YpnDbFYp272lBECAzAWxgeRZf3?=
 =?us-ascii?Q?Yswhn3RgAH8pVte19IgvhNIq8m+4gkcE6V7ydpCK96UgT6zW0KTkf68HQmJN?=
 =?us-ascii?Q?0Q6xE82/HVexAH6AWdn3L9NMGhVNbcVdYataHoxVjeTGpTo2mk3RljuW5oEp?=
 =?us-ascii?Q?YcRR6qo/atZjXE5KySQM/sNYs2RTlM3Lp6U4jtoKYMJoBCfWBZf+aaGUpEhc?=
 =?us-ascii?Q?nTsCQunyNRS/oa2jVx8Nb23JMX+Pw/oUYnbNzDawTzK/7REBBEYVnhymIDEm?=
 =?us-ascii?Q?w6r9A89AsmUZ75l29hncfrRo2KGGFQTvmxVqHhPM4eK9jkfCtWXzbgvOFY9a?=
 =?us-ascii?Q?oFkPbsa3d9MENxJymhd5nPAvFnI/el3aTnfQTozdNi9Z4grfDT5LNfqkfGCR?=
 =?us-ascii?Q?ah7Klf8ZH2/EoXgJqKdfST5YNj+ds/7FHSfJ6aEvbpAcHXpx2VCpFA/bkT/M?=
 =?us-ascii?Q?6M00fYWABaoL8DxRCGvsX1fH+neklhE51mbfzCDhpzEX8oKWO+0/0DJpFVU2?=
 =?us-ascii?Q?dLgIozvDrPFC2ljbxRN/COhiBqjzTGy7u5SpT5TdnD7BFx7mqyyK6YQTyQHK?=
 =?us-ascii?Q?42bkkaop9aENN6YjJYkaGXL7MJakzlQw+mvbLKvXkn1/UlV5HcxeqF7acrMC?=
 =?us-ascii?Q?67R7zi3hwf+M+ihYPBVu1R935nc7GmmeLtI8IUDybUc4ilYmDB5Ey48ih2bb?=
 =?us-ascii?Q?tbbmi8RTKwDm6ru07dqxS3i7WJUiT+Wd+IXld+2oQ7hjUBcvQa3KSl2DYhHW?=
 =?us-ascii?Q?pxYiKMxbmW8wriYYDVU+3+H7uAZZq7Esw/h03HoEzcR6yCHiKWk3d9HWwnJb?=
 =?us-ascii?Q?WdEXx5TgtRI8dzLT+vGpdQjJqWLNbhFVPWFbx+zlZK+1DAGnd1t8y/iyej3W?=
 =?us-ascii?Q?2mqdTFNNkxJBgu39wUkzEkgpPGPIWnqUCf5d0axjurewEHUgu5B9mUZ0mmT0?=
 =?us-ascii?Q?0j5+lzv/5ZtldmISod+nPcM5a9Xmdz3HY7zPMNdDfdZg8NGK1gl97pQYfXDb?=
 =?us-ascii?Q?t5/VKWy0IW/yGahfCp8grrpFKeoivgdyCfmb9dyI700AKNCNKvnVhA8KWWne?=
 =?us-ascii?Q?80/4u3sFP04ZEbnm2FHFuopn3Kx9YqkYlenYiHqZWO0/8kBo1a5JatGmLEZ+?=
 =?us-ascii?Q?teZGOykVDN+Mhlp/V0/Z5RJxT2e0Rl/ixWraR45eZDxkjEqFI8nJAivI6ySZ?=
 =?us-ascii?Q?Dd4tGs8oHWzCckDDeBZPnsnNby73vhmSoSoV8364bzZRJyf1SNZ7pqy9hev4?=
 =?us-ascii?Q?YnydYd9MENR9jHxUxriCt5HXiNCIDviAGxl+iD2cJ5R4RkNcb8gi/U/XbhY/?=
 =?us-ascii?Q?KMxUYKqy2dL5/bVF9gV7KUsJ9l5QVhSGElmo03+594w27odljJTSzMy7mJOl?=
 =?us-ascii?Q?t8pHkRrbDat5KkIsgFbcs7hCv6LqgcZvB5BSeWJV4372Xjc7/NnQUUW4wZcq?=
 =?us-ascii?Q?Cb5UsXCRRnxTGDgb+anTRBtgjHb8BZ4sNrmzodek0fLGwGhxGVyyXlSCTatn?=
 =?us-ascii?Q?/kpwK8ithWozCxrafjDvH+AvthVxb5PJMPasr11EzMww5BsI5ITP4h9cyCQB?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16f49b5-e618-44bd-0edf-08db75f49e01
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 03:22:48.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7K7lto3Tqc78ShLapprokxlouSpV7c6lCgGlwg1l6g+loassSgZ5f4szZc68F0pdcJUk6MinMpVc5RIkWfJFVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9934
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
it support in current ISI driver.

Changes in version 2:
- Remove two patches which used to rename imx8 to imx.
  [PATCH 1/4] media: dt-bindings: media: rename nxp,imx8-isi.yaml to nxp,imx-isi.yaml
  [PATCH 2/4] media: nxp: rename imx8-isi to imx-isi and remove reference to i.MX8
- Modify commit log to more accurately match its goal.
- Remove redundant "media" in patch subject.

Guoniu.zhou (2):
  media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
  media: nxp: imx-isi: add ISI support for i.MX93

 .../bindings/media/nxp,imx8-isi.yaml          |   5 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 110 ++++++++++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  33 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  51 ++++----
 4 files changed, 173 insertions(+), 26 deletions(-)

base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
-- 
2.37.1

