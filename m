Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF83585B22
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbiG3PtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbiG3PtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:13 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15C11583B;
        Sat, 30 Jul 2022 08:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDzV833n6CwbRtI18sW0i5+lKLoNJ3CN3jkq0ZlrNZcy8nu3CYjHnsD+aJ8bMfUToToyBwlq/H1lRzscUiEUYKlnwb9rwHmYdR5us3yT+eR2Q9RU9WV+N+Yoe4trq34OQoq8xtTToCK2RvE4mnxKvEehmOKtiZs2uOlzEGS4n6CEk74LxREAIvWnh6j0pGnoDoOhr7bZ9qM8I0aDfruGbnl2hQsoz9+xCvMqgNhwRNv0FSayjxD0wYQF3jBT4YFB0U84kfOBI6N9Y7MymbibKs+jneA6SJep8AsBipxtQStHQOePOf3DqbtJrA57g+2jgug0hFRQL3VL5PBLELn2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzPTxSpBvCED02QSOs2bcDzT8pYf2J9JntNxfaawM0o=;
 b=Cmzap3McBzrl9JYIAz4bbeyugAdTJO1q0gDcYlaoPdk7wrbldliyEQrt/2DNnDRNXS7wLQ+7XZx/6/ONHNfcW2Ajlg8D3rX1sTs8h7mAXomKakz+tTZIkmtbtSeXbGDPzMDmxAGHwC1HqXkfPsM7PRaxrmuV28MZK9p/afkNvvStxBLiTNa84Md7iANfqVOSA/9kS4N2P6mIcEix1eqSLHAqqcBqPDJwSQSLxEfG/A0wCKrBr7mCfB8qg5IC9+GVfclXR+LGKd7KXIndWV8aiSuV/8/AlTG5AVku6Gltd9KMtkngh02b8VtyfoEBUNrj+oRtgLOehQshy37nZLxFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzPTxSpBvCED02QSOs2bcDzT8pYf2J9JntNxfaawM0o=;
 b=QuULYWHoiwjAEm3MTpsAl2no4bnLCxijfeQiEJQj3EReVzaUtyPHcI63Tj+wx3ni9UHTMpbd5lqYEOWhRMz8+Sn5mrLWo9WvpC6ZaE86fsLlSzL8LFFc0mOraib0moWdezYnL8bmjCFkCmTvdsqxX6ll5fdsBK/AuMhOjryeHhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:06 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:06 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 8/8] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Sat, 30 Jul 2022 17:48:43 +0200
Message-Id: <20220730154843.791378-9-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
References: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0082.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1498d21f-7688-41c4-cc51-08da724308e8
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8o2xVaeLNZ3AJpln9enRaIuIAofuo39TFJbTQXmwUVbT2tjPUSt/QXFAcbgS36ScxPBGPYFkuy6vryKE5tf/fumP4YIfjvX2CzaSHY2RoDoA5KY53nQ7CpXxUDoolaRR1QfqXL0oJCjVGaD9Bpvv7umB33+/KUok04pFCHYtbXsfvaj2kguQEJGI+GWhwmc/7Ds/+xCh7KkbXR9VKf86bIKMQI5Q5Qadr1fNwJJb2ynfVfRBDRHTZ4zDeO9hkcfz1lp2wuAJi/I2iaE2w5lCwizZaSanAeA4aQFmuTeLtD4wtIS4KVoDAF83MP92acg4BZy1L+7b+Qz/I+l0NeqGu8biRyzpRFMfSTV6kAYtzdIcdV711W27+ZJmd5rN+TUmElMP2chP/9rGqV7H1VxM6nTWKhl+geXPvm/hr+W9JSqdSDT9dHGp8IiinD79OlNpdcDOJZ+pGcIrhxOzB8wH6bkqqfVsQkf72tevpSOI9yAdPXGy0wnNvmhsUStCpkAExLKvOQS8jlQBfTMBePhGHvxQnrhZU9XtiZfe1VGRNIcfVAX3Dj1jj+UzKCXBhbrDfUNUYwPihB4x+D4gvcqPVCipSDRTf+i7ThYZ35QzhHiPyoVpChJYrarxkex/L9Xu+R+OTdUG7rLOJ++mskEVfZQZTSrexZtrPzImzkLPPxFFpJvhE+42ZXFFRaMk3LXgvEhxrPyKuRQVc3voDWRWFC7CzgAJI6MEZnMXukkMX/Ynbm6HyDptaexgGQ+c67m
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(8676002)(7416002)(4744005)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O6qW9OiHkWbFpIYNsDISCGBRueIGaZLOqsNm4hV8c9R9qM7P5ovfIqzX2eaN?=
 =?us-ascii?Q?gghrcPpwCwQnAmMhau+SG16NrtmVhvVRt9aUBIkWAI+j/AD6VM24XDLrBAtg?=
 =?us-ascii?Q?5NNmkHUsKH7YdLPas9VguvPw00/BPTA+CAmbGKUPmGxF5K7H6XIcfCLzovA/?=
 =?us-ascii?Q?IxwVVCxwY5/60GUsVy3/tEULLa47HB6OSRb4b75Rh/noR12mSugHyp2Id8wc?=
 =?us-ascii?Q?+isIDA0te4xM0O5prjqW5BXjiVPp1C88nKa3WESEvKfsc8d5VkD5J7v1NQEk?=
 =?us-ascii?Q?HHq6RZA4EmM9NscMkmhdLtLZpleW/IxClNQN6MJka0yXfM23o7Tw/kVU1tPn?=
 =?us-ascii?Q?rX8eqh9xI/xl1ZRstnqF59U1gHtDU/YfvoJ+Ey61GMWIlj9KCNyFPxu85f/K?=
 =?us-ascii?Q?SdwQU2KUXJNfpJMBj9zdoQD1V4pUVKP85D4fZeL5L98VW/iB313oSGmNo6e4?=
 =?us-ascii?Q?UTVZeoZDW4EZAcolUodJsz2XbL+k14U7JurTgFStNGtkxoHmYScUzcWGmeDO?=
 =?us-ascii?Q?rlVILcwwGhqeopEIik+hi7u8Gnd/mp3LS5jacGOlKlMukFBgvEbFslggItpw?=
 =?us-ascii?Q?8YqbweQStGrznFQ7sFmud9rKl6sMTP9hBbIwCq4TjYSsEEhNNYyMZMecPcLU?=
 =?us-ascii?Q?RoRbFsTReC4t48Fe9V9tqtCjvjjBEH3Vc/Uf9Pr+G6iA9BM3EzKMOqYtuqPN?=
 =?us-ascii?Q?oODbyt9YSD+6kM8I2PHhbVpXEao04aY4ySVWfZEqblqI4HTMgDK1yi1BV4Zg?=
 =?us-ascii?Q?prpUhsdCDMIIuNLAytjagEmuVc66dTB4abdFeHVrGTTR5+OkRpxPLOTSq0Cu?=
 =?us-ascii?Q?yhT8eAxgxCGkxfSvH/UUs0ibNJqwmErWh2+JG8MMjOI8Oj+BskKXGSRPOcHl?=
 =?us-ascii?Q?cArOS6BkxydXw0jfmbp7B3AsOmFr4WUzGjczflE2ijrKm/eLWmy2gtVigoj9?=
 =?us-ascii?Q?cAl6EVyjGMnuSLMs7pe1/OUtJq3Bh8UFEB0raYRd1UX6x5NdPMdvxB4Kcf1I?=
 =?us-ascii?Q?qgSQC+yPW478ULLwalFmNc8PNBAgk3uW6TJkTrzJ6l8bZurD4I1xz/a6jCdP?=
 =?us-ascii?Q?nnhyutseYqaeLrDHlEH+mjzZUUquwkIZzTNDjlCeyFAtqhDhH+7ya5G1QwUG?=
 =?us-ascii?Q?ilRhjF1DxL8MpP3CXAcwKH8tpwM9c4fIvGD9t4GVpB5hT7GwiyZrTN5jqfKH?=
 =?us-ascii?Q?0JYJkPZR+jDEx3pI63DzW9LR9D96Oq4VURGi1apfgcCRZfqz/MQaIJb+WqLa?=
 =?us-ascii?Q?bFMQE8elhev3LF7xbOlD+HUIGAw/baI7NajQSBH7BvUnQQTwnPr7f90FvBuJ?=
 =?us-ascii?Q?hwcuuOaYXS3PN+Gg2o+X5C8CzS80pe5mIVzUqouCod/rLWcAoQFT8vq7Oa5W?=
 =?us-ascii?Q?397d02x8Duq8L79vqczKGSwf2nl+w/BHe2ofpZy10sfP3LJ6hLpU5dI8leqn?=
 =?us-ascii?Q?7Ah1CbAdpOoM1/ezutFIrr2aBOu82ZE+vnyLDwruKXWrhMNP9FACfqoc1RmG?=
 =?us-ascii?Q?ZRZf00IW3FEbzS1q3gYEdExN1mzGEfak9W/Xag640zlrph2ZpL60T2ahcYMA?=
 =?us-ascii?Q?PLDmdciZvY1GO3f0hXgDk1ztZgcnsGI3j4xD/T8pXQ5deWbkV5vjJFWKORd9?=
 =?us-ascii?Q?MFvbXRbkEUXhrlZqNye8vBkQRmJ3RUUSSdCMqPu2GlHePrrbHbLsngqMHTJJ?=
 =?us-ascii?Q?V0Cuxw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1498d21f-7688-41c4-cc51-08da724308e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:06.5602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qTyoYuctjeZCm7csO1ifcrcMw3rB4a0QuH26OPy4E57Zyc2nQQtkIDTQJmRQqtQ8gJj+nZBBEIbi2nifmcN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index 1fc9ead83d2aa..a2e1174bc0bee 100644
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
2.37.1

