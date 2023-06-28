Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC43D740A5D
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 10:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjF1ICw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 04:02:52 -0400
Received: from mail-vi1eur03on2045.outbound.protection.outlook.com ([40.107.103.45]:31329
        "EHLO EUR03-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230086AbjF1H7a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 03:59:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/RGYmQeFlgOHRUTx65r3m2Vnq7v2M1lSoyazXk+6R6h24k73p+XDMaQEVn1UyN5By7mOE74lAoSJF8qqqNGFtVMd4Ear++WkmxQCHmp095V/f8Zn4cl27jooDb87yEcHEuYg4lM3nXWMR8pEKrYNJ3qyLxUKH6+zNKV5NwGRNoGiihG9bRDcEE1A3qTmdxwQ7xiRivw1bFYivgnf8ShB9YEjpzHhqBZQBRRzm5aqnVtoH5t3e4UhhYtHV8Z5aVEf6ozHbmNpUElHaQcf3Af1bTvKCelz8lb5rUAg9Bwtr/jZTju5j9cv3JSatjNcXjMqOOQDoRCwWCtukJFmTSHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKbAKbl6MsWWaIj/X9PeXmyA1kjflbmMMO79cSe8jzs=;
 b=nDOS8NENf+68NfRXnC4NbxgCUSVPwgcoujxYZf4JL2mKpY+5gknOnaHCwAooKznEtUf1LaDzOHvCYMxaeVkeuSEHTkeMkTuxvwY6MX6lOpHUoAFBGNXijKV0bCUj0h/szwd5aj0CunEPma4+uom7GcvUZPpkeUbi83v+ahz/Ydw0HFxDzn12T+cLbl2CafTmSLY+SddjeeY5m7WB2ji+wZleeVZQ+J7U/7clUBWvM5CJnvdHV7OqKKHXqDqqbR7a6fq4OTFNSfpiTNuEy4IaRm53e1oi9RleYoBPurqpZBrPVXDhdAtIhDWmaVU8Q5hs9q+PcPzcV3leVKZkDXMPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKbAKbl6MsWWaIj/X9PeXmyA1kjflbmMMO79cSe8jzs=;
 b=RRT4DrFcAb4cF0p9DGHhb09BTVmUHTfkBKXLId2OWeKDtfwmeYtQ9I1CM/zHJjd0v1wMhc2yofelqIpno33v/6tBTnCwayixRSsLw7uuHlyBPdg3FuAXBxpqef5W5RpTaWvhfNFvIU8ouNhoM0luhc9LZcAeRbcX/J6zwUgyqMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:38:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 06:38:06 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v4 0/3] add ISI support for iMX93 
Date:   Wed, 28 Jun 2023 14:42:48 +0800
Message-Id: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 614b4f5d-1dfe-4e18-ee83-08db77a23ad5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnpaS3I1cEzooBlGtDHEL2VQo7nQGmopBWr2mKnt+zqyImAv6RKRvjWWZCllLv5/ThGZjxKlSg8j8n/dABYb3pCGgVM0aO5IzzXzLCuIn7JOJDrMQz1DDAUvSQ5/FsZSApkvPdJTB+pmM9NUJSatVmiI5gVqTM+hia09DN6rJ6cV9DuGV2HkarEBVQZYf1GgJbVCpcyMcBctUzall6fH9nTOlWnLiKndISR5IPkgXPXGD9gOPFHQhsbd+0aTLlf8y3Wzer/wiUEW+o900GqEPeykaXvHh9rao1DpFp/Nb+FcUe79bJIlJyCgTXHUzPUC61v09dC+CjS6MMLL0cH96EevO1eUBdGp+IWrXq+VAECJ7hHJrWR0y+n9TTlj7qMYXdptVmezbixl/S7S9fEYaZqJWfL2EEq9VSRvwnBEek3imdysXVf8SiKJHGnGaurjEHdsnstwlmGzQ9fkDT8L6fTHAf12n8tpX6uxv0lGrhalM/PcHFd8BCrtfT0nEoM+Dcs3TenwUTnlnrm8Y5NM/VOsRTS5i7dbZc92NzWGT7HKKp1cM4/DZkIwQ4BltRR0HWbPkZxQNK016xDYtUFZnVyKJCGLzaQBRzGjOW8ZIk/UqXw3mTWI+E+/dwbEcBfm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(38350700002)(38100700002)(83380400001)(86362001)(2616005)(4743002)(6486002)(52116002)(6666004)(41300700001)(66556008)(66946007)(316002)(66476007)(8676002)(1076003)(26005)(9686003)(4326008)(6512007)(186003)(6506007)(8936002)(2906002)(478600001)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GsX/qXBPbxCMioFz2trWAa7cCed5orMrnGMmGl31ovBkqDuS5jtE6tvxT23J?=
 =?us-ascii?Q?TuGT0WfpjwRZ30jHjY97ju6klEDU2NGc6xwoyXI0c4N24LrnBZuO3d3IaZZk?=
 =?us-ascii?Q?6s6vg3FJZiU+psmNmGAqi44buj/rAlEeLVPDFyiXDh9mW9ozFmokMG4XxHzx?=
 =?us-ascii?Q?MJHz2+DiC7txHcXHbpiIwTI5uwkFhJtL67gqzXCswim9xOB3O20FXxXJ3fUS?=
 =?us-ascii?Q?48gyAydXlrxFWIUxncCpMa71bQHDTPao0yVKumK5hjgAtfsydK7nBQ1RtgFT?=
 =?us-ascii?Q?+DXCIxXTAojmzy7gy+Kchue0zifoqlMq99skGBQ4GTqlA0iKnJzEV/MdJNlx?=
 =?us-ascii?Q?UiLJPG6Dj6x+t+iW0AnhGmjkCgS41vrG/gu4q7zHz6P+50FaO1y5+IasSRH2?=
 =?us-ascii?Q?JbPlTIrxHKFrS+RPlj+2ejd9hTsze0EsmrW02rsJA/WpWuuw6c5u4slTVrPM?=
 =?us-ascii?Q?E8bq9os+4+XghGdH7xKPexkNIjfz2od14h2QguTNzWNJJrqTxPEnGV3FDWxz?=
 =?us-ascii?Q?dXsvdsXrafSUP0vAf61NUixWYM8z8Nqz/ORmZq3EbM4iLFjW/32bxIarKfYv?=
 =?us-ascii?Q?K7w8WVrdzUYpIgzvCeaWYWO0exDxIx9RogOtsCdqbrUPntiHQVkM3AXxosIW?=
 =?us-ascii?Q?7qZjMPmerrWjt56eEKuOJor6fDIhRv0eoPHTVUpzrQbTiScTX2fRHIY4dJgs?=
 =?us-ascii?Q?N6jiYF4lDwMfXPgsCHQHVdEQXrT9qxsimhH4uO5S/7oX0zii/D0lroTaS9Ou?=
 =?us-ascii?Q?gjRZmKnDVT6aBonxYKBwi9N/n61ewr3DVpFF8UIJQGU5LGMIqEEWJhC4kt3m?=
 =?us-ascii?Q?CJW3ZCZxpIFwlw9Um7StZkhR65FijeVyiPGVYc3YUE/Urt+or6OcHcqcCIsd?=
 =?us-ascii?Q?cKibx8NVPRYKd1iTEsRwP8lbaZ5HBa1pxnQbcwUv+GWSWb6SEd5L6s6rvZ5z?=
 =?us-ascii?Q?yygrC6sNFRow6XiA28nrD4GTWGIM5jAIhaQHN9HjU/MXBKqr0kBhYVB4HfL9?=
 =?us-ascii?Q?EI0DFq+N5+Vg8zo0PzNTA4OmoN3bALt8+w2QJon6QY71ufVUNG7F0jMk4w6C?=
 =?us-ascii?Q?8b7YWGcKZTJjoBlShE8q4Wi92OHFXnmbsJnTe5lXN8BEJGIvMO5PHTAGiUSb?=
 =?us-ascii?Q?hhz6W4dfHv23j2Jsff170NpfG/ns5GN4rRT5nUYD4RtD0PeryXWNt6i8Osqv?=
 =?us-ascii?Q?KBV17V2mY5FXldTUKB9s9YrU9hoThP6VF0lzwDrlswFYsLgbxZZn9MqLQN68?=
 =?us-ascii?Q?vaNepu5H7q9XF+488htyiSZZAHtKdrgS5G3AAY6CdR/jemBtgRTTS2Q1KCAu?=
 =?us-ascii?Q?podtT647mbHOOiV3MiZmq2WV60HrfrXgM3h+IgUpmpaBmz8KxJ/6mJK9d4ks?=
 =?us-ascii?Q?vGm0/Uit6av1jvlUVNZi0o/N7+oem+EoWli0JriXuggBrdNUNLhtdRt2nm+0?=
 =?us-ascii?Q?upDtZY9nZjM+a2cvIZ69fvWFifFJWuiUeSr65yLbhGz5YOdNdzj1sVAJND+l?=
 =?us-ascii?Q?W390EH1BisGw9Sf/y9DdX9X86lvWKvwEuUO08b7cfSQHzcbWBTuGUx0m60e1?=
 =?us-ascii?Q?vaxi9YWXiX8MmGQAGaGWCmTDhRMHh6qbdggqMPkB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614b4f5d-1dfe-4e18-ee83-08db77a23ad5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:38:06.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b3GnBNvGNqeMcTIqznMVucrKN6V+QRKg0YsTXZ5OqQkkSK8Eq0fhtvcDeNWe1Etb2a0Q84SBRZEydqIrls8rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

NXP i.MX93 family almost reuse ISI IP from i.MX8M family, so add
it support in current ISI driver

Changes in version 4:
- Update commit message to explain why need to move gasket ops to a structure
- Remove some redundant and unused header files
- Move gasket ops structure variable to imx8-isi-gasket.c and export them by extern
- Drop some check

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
 drivers/media/platform/nxp/imx8-isi/Makefile  |  4 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 ++++--
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 22 ++---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 40 ++--------
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 80 +++++++++++++++++++
 6 files changed, 123 insertions(+), 52 deletions(-)
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c

-- 
2.37.1

