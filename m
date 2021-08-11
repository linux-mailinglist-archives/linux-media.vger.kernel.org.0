Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A90B3E8C4B
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236469AbhHKIqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:46:01 -0400
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:2016
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236434AbhHKIpm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:45:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu5OR/xdH2poyLE75ozMi2zagMZC68fuEBbcsLfiOyLrhq0to6J0/PTvVWiJ6WcqvWxPHsHgU32ySxzgMxBMF24q18x8jNRIPCgOnAcQSsA7MjSXdZe+lYA/aTc0uOULwV5OStZHzBfwtZxHkLlVO9p/NAkU0tWRCfXNY5ZQJBMbpIocDEMwc3gyfuJswdeIJlo9gQcoD3uTTaSdCAyPnPOypljvL2RSKYR5TKKrEIkpoJBQQ++2iyakMhv7jRWYrSBe2R13W1cNLFxYiTUhgqVWynWyErJNCTGOXybZ5OwMpIso6tCVhyKHHDfvd3M0ESVeDT0RYVYHhcYtn5t7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIxbb9rEHNY5D28FLfrsP7F6i+sjxtTYatIyhaTEdKY=;
 b=WJV1ylruJgPwdDja/+c/p0ofZhbuvX4wV9Ca6DUDOzeIoDMzHaCORsOOUdLUEOQBbM1eHh4cfB5t0ZzjKwTFx08L9zZigLGYCwMavzWOpifmlEPbQELPrWi5U5gMLiBPHLCcqUt7KEdGzUY5AjI4QCQI0vTfA8IvIPTAutlC0qAugPmkhYVur3+HY2F0wvcxlpX28VltXuOZFboo8ohVQdoClG70brhyHnqfIs8zL5zEQ0PvcZKlAwoiI7yapvLq9FR9carP5Uc9UNujygqD7Z2g8PjjWP/DLMHVxKCmEo88AsHL5ZC/1jmWBVUJC0bKcGdOauQdl2O16dQukXVxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIxbb9rEHNY5D28FLfrsP7F6i+sjxtTYatIyhaTEdKY=;
 b=iq6Ieg9ZgZ7HZApN8soBmwui1kCsgkR3jNzNoF9JA3DwY7hPTyl180krYzoLKB9rr9W5gQGKkgSTwKkvfgByKY0540+71S5A2RXw8lgbVgB9dBbh+0HV6NNz3lpw/8A8V81xDGXWnb7BYfnIlqKG7cCNFZ8k7zvmiUuNiJTqv4E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 08:44:54 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:54 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 14/14] MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
Date:   Wed, 11 Aug 2021 16:43:10 +0800
Message-Id: <2d1fc6f2be99f96e34a1074485e936f6bfb4b1f5.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:44:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2923b9f4-ba05-424f-e08e-08d95ca44a62
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB48889835AA2EDDBF2EA12512E7F89@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3iODo3fVZ4SBV2VF9S3GMIPMm0yJ2OBu3CblrTFyjnVOwOxU5OkIRcngB1MJe7j+NQ4CxRT3z4ktfhnZfDBcFLuNuxlhHX1mdqaHXVr6sTK2mfGHtjpwtllFnBggkNQCSuy4ktxa/zSYiJ8M03/0Jy++rYcAf49CCCb5w18acNTIbrIkhVm2alQCkblvDcv2ftGHZ+a0cy1a5iwHieS+MvGFFx60uF8iiWDa5uXhLmqsGGHPG/N9ZmERj9uZlbzJAFhKRvVBJkLncl0JRApzwdkOoQZneHOtM+FPYeHOUNMRg2oF9zLVEAwr59ArMrLNnsaJiVrjvFznkr9ZOIDvmwdFrmTh3PwbSMlE9HTmUdeCzwB26IMwB+tWFlpIYnbuOyTiVU+W7ppAokvNn1DZbIxbNcxCwijGAqMHLUAin4Ib1iEJB0buV37J9SwNrRQZkK8UJRm4Q0Y/obeXeN5k8kkmPdTKo/RMf4I67gWsNs1npfLvPKMAa7YAx9OFwBrrQBgUeZXdQa0Kj4zQ3oUWylXdKlnpDsc24sjG+pdimj8zaRI+VI6gZp6JIHq9Sjo8Rbf946R32dleanYP0VghuVruT64HIsqH1TXZsO7cV+GbKlUh9KhGT2rphopeI2BtoptOFycQADWx8yreNKrWAykDWln64Tqit2uy2xtHcHg29+AksRwWP+avqHRIBxCVit0dJh6ck3GptxK0IZjhRHWYg93Ak/Vb5e8+i2l0zQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(7416002)(86362001)(8676002)(6486002)(36756003)(44832011)(2616005)(956004)(4326008)(7696005)(2906002)(38100700002)(4744005)(66476007)(478600001)(26005)(52116002)(66556008)(66946007)(38350700002)(186003)(8936002)(316002)(6666004)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tIQcPhc1f7rXKoOOlUtjZI8dD4AKgu8BkcnfS8+CLzsewSHOlczTHH6EEcDM?=
 =?us-ascii?Q?rYhLNiNPK1qYaubpmix8ZD8enbWX7lQ2LhFSZO6wnbkSR/F1FH77Y2sqP5KC?=
 =?us-ascii?Q?J5Tmf1JmSOntucuIPloLAfpK5g49l8e03xNsKoShuHi9CXR9N5uqJALK2tSh?=
 =?us-ascii?Q?pGdmpRuIm0RWFQZrAf31vdTNvWP2/pax1f5euzknTHDlauyGWwoF6zoicsb0?=
 =?us-ascii?Q?N21comFFjnRN2j+xoiREmws4i2ZedmqaWTRCH2SwGvNJI/Fx561/t3bOEOk7?=
 =?us-ascii?Q?l7NQPscXyd6DLRpMGCgsYxq4WZjKA7mKXOjApB2pfk7qeDTLSAkpP8wOkfAu?=
 =?us-ascii?Q?N2qg4bVk6eydpQgwiYoHqbwT46CV0yNQBhEG7IrMg5KaTIfSKrG9phN2+nVf?=
 =?us-ascii?Q?fnoUfK6ohLlMXUvzpmrLWkN6cP8CSZ8cXThEC7wHbpEn0bN+Am+TXaGvY6Qp?=
 =?us-ascii?Q?tUs4SYAHuEXOQqUeIiLqPgj+go3kskU5owxbzHl4qF1HrvNDBTth6KCf2hCa?=
 =?us-ascii?Q?W0dS5nlKebKOWALjVh2UV+HHkJj1+51AMA6uD+d2wLgunjAt5IbPolFN10OD?=
 =?us-ascii?Q?+7coLOkHlOeut164NQWYqSIYM6R3EvAZeDvILpeHtKlPeWDdMeKpZkjgqQW3?=
 =?us-ascii?Q?IW5kq0+AZkhYfhrRoFy6j5qcms4hTusSsiiJ2QkArHA8aUUjWkaR4WHroROV?=
 =?us-ascii?Q?7Up+nqc6JbvZuk+V0pAaHqNS9ucL5rl5RRx5NRZBa1smImImPqxpjfimvHi8?=
 =?us-ascii?Q?LxGQYxu6V/ORANjTffG0POCOWEQSOXZnP6sBCqhE8jczJ/AHQ3ndTEvnECop?=
 =?us-ascii?Q?xHf09PEhpIAejpceWXw0ngunrvDAQF8FJI9rV/R8FBobb+go8jvfF26BsPYC?=
 =?us-ascii?Q?xAm0nDfVPVAlPddDZYf9KuPLeFj8Mg3oEHZq8gDiSsoWvhD17JC1wwdV6O6I?=
 =?us-ascii?Q?ndhu2M29B/JlrCNlpYyK19ck3cqSstDACkw9hKoBUUxWS7bX7KC9mPf4cK06?=
 =?us-ascii?Q?YPOP+xeOSJ1/oKEVJFXzydSshy4bPsVguqzVOooaOHRiuQRYDspWVvH8SXub?=
 =?us-ascii?Q?aE6h7m7pGDTyKAm0HeohPCqe6JIGbAsu+13W0kjgTTfwp1uhdzVV50s8vrJ2?=
 =?us-ascii?Q?fGInj26O5xOwPV7QxiAonrfQH3kbf2SO6ChSfawn6gsu0r5IyXAGYIpSjOqT?=
 =?us-ascii?Q?+Ej8Xn5Id6JtDmwM9ZV4Kh2JHWUhbA2xg+iORF5aReun7VPz3DktKVKK2BvI?=
 =?us-ascii?Q?0swcFmPN+qgr6wIvH6XCFVz/wVtSD28WGlvHkGqBZuDq4p5H/snJlMQ/RI4/?=
 =?us-ascii?Q?diqYmxXTqlJKk0GKA2eVNLgL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2923b9f4-ba05-424f-e08e-08d95ca44a62
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:54.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lqiv1VNUDM0ZmFOfkpkFkLWcguXmuR4/9gVO7Rotxf07gk14XlFL3tJoHEi+NAgQUlb+XY+hTDCr/D3oq3M4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NXP IMX8Q VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 524eabe50d79..77d30a55983a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13416,6 +13416,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+NXP i.MX 8QXP/8QM VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
+F:	drivers/media/platform/imx/vpu-8q/
+F:	include/uapi/linux/imx_vpu.h
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.32.0

