Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F9B4E9918
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243705AbiC1OPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243690AbiC1OPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:45 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E58E61;
        Mon, 28 Mar 2022 07:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQeB/wVMQRZZRkyGNnAFwEtfk9h31bKzLw1gvi0X/zmWXzIoAq7dW+JxYpnSVmhHoDGcm3lT7n0SuxDN/ziTK+9jko1pA23a7lKePfBPUYH7oZvQy/VU0XSlZf7kVzfCQrKlvV64HOWu7HZ4xAWZCrNK8kKfCE8bsuXKxzol2bawHWV3hlSJ1/Yh/vMwvfMqLBXvHTAkKwA9Zz9qS+ssKW8+CgEc6LbQwzQtdw/m/kprrJ3g9aeLd+j7OBwE0sFhe+tdHawezmfLiBTm3hJ0rI6qs4Q7BhOrj+XafYk8p7ApyjFqjGssC+baCybjH80IIqcWVD7gs0kj/JtO5OMb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEWICxvkMXk9UZaXFhcZPxKpqObekiOZnrQ5j8j03ac=;
 b=ft3ovT0mYX/V1U8dX1H4ACO9XtuEBiE8mNdOyJm2nLpsuHjj1MBuqqa+iawevWgV0JyVkoxf8Jj/MiaNdF4cqmX17k5GiCb6FrTnWuhnyaH6+k8/scd2PGu6VCDxiwWh+PJ8E2ijXnP5F138qXmeY2yPVfD3HAYvzpRcbUMjG2SJLe29R0PCQ1tOc1L35JpGx89BM/1qBJ62R/iNKPeUds6mXhSHtpSecteJMUESvCfhTEvMW1roJKIw45q9NBd19mgOyGBQ4Sc1xupIEGyoS6QM1RpbHW0nY8zeVFKpaBgKzjUXUmfHNGmbMyMVT8y/XbIRzImUCFG94QC9OSUbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEWICxvkMXk9UZaXFhcZPxKpqObekiOZnrQ5j8j03ac=;
 b=GP+kfFqx2Nc9hprOyjVC/y5zVSfemf1Aird6L04nCi3AF01TWwUC4vxGHOeB/na7CBYxXPz46aCNV5FaMsV+OyHDH6aSTVWgYKu3VBxACuo/CPUs3PJCkxgwIt50pNq+yFGcyvfw37DmeLKh5lDuNaVhdq0SgDriyqSzwjzuqhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:13:59 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:13:59 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 4/9] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Mon, 28 Mar 2022 16:13:04 +0200
Message-Id: <20220328141309.177611-5-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: bcd83a28-6bd4-42ea-858a-08da10c5343d
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4418F62A058227401ED963B4BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qG30bBhTfyBz+Q5MZZM6QXo7fHiLa9oryi6Q4WJoRO6Lb1uZe3BtWO49HpXSA+UWxCSU8KYs+jAByw75At6l9M4lI6cr8qm66Msj40mJzR9LjwPcvlYPeSHcBy37oHXYhbDHLMpqQ/88m1nJakiCBWjUzb02NcWP2aBeNa6d4ulnxizEat90CVFGMtZzBwqjRCn33iHk24ujG9DvxWz0ivzxwYqEwD5VD5CshtSwPEV/zawzbGLzp22Iaxfmd2zqqcMLjgrYj8L4q5v1qgw5IcHCKwTRrPbwvdg1jOhL+OkVFonazpXPilSymw678n1i7zeupZjBRgIJtV4WH3+8qZ8vi/PmKaT+61+n+CLprpyn1TgIhfaqrMxxe+FqsbWxVM5muXo4P5D/aOdFIClFwVHvmCDC83OcduLTAQdwL3wyca3GqojIALlnYJgu3J21xKlZCuekbSZ6KZ8iPjgfmCa46j6XTJybTu1w5sQeYBDBp+xMhtj31YLhXM5UECAUvgXmFS+5Pj/gqIg9UqrO+3njYMRvorc0DxhiRz+FkCVMDCCP86cIKGL40x+FZXop31mW2RDYdV8iHIxoysddK0I3ePLV+s/7PI4aRFe/4DlsPMo/Iq90aawnwh5lI8DGn8zs3xcoTFQ/tkJa7ufKEtO0Hmy5fdr7ja/xQCUbbDuwpbVTWF+BJuYVdtlMK4xjro8jYFjQjYexVq/nRI4+o945ziStdQFI9btWqrzm9uk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(966005)(6506007)(38100700002)(66476007)(83380400001)(8676002)(6486002)(1076003)(5660300002)(6666004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQNI9x/kGlyJPuFgxBrOpMtV4DTSv7K8KJENv/zklXHn5t5/oUDPIoPmZ74b?=
 =?us-ascii?Q?7YHdpGn6yDfyRd4dg77utR+UXRXbwsg8x3sR7RHLFqsIeWgbt5n9kfIiXzB4?=
 =?us-ascii?Q?Scxc3JbqWOpir3m1w6hVGDV5MTkFpkgBN5p3wGFNeKVWSNOu6Hq59RPfrmJO?=
 =?us-ascii?Q?blATpPjUII04SxhtZVh+wOocDGCTcp5e2B9NukH3Hj86lLEhrsfDTLN22Px/?=
 =?us-ascii?Q?ffx1z4vkN2l4XV/PA47FbZhgSrfPSijzhv4y3uBPfM4bEog2MHKWvXxauKbP?=
 =?us-ascii?Q?ATy46qSJY+CSlvzYPz6BE/90Mj1ioWCQKF/ApeXytbLYfplY21orl/jYDLcQ?=
 =?us-ascii?Q?4VkI105mCZKWPHN+/ty4IOu3nmioA/1hyBpmSojZ8dd/TXtrickhl/905v8w?=
 =?us-ascii?Q?mo745DEcE6CeV++3C8rgSHO5WUbeXgHlKNApxxSHCOlI6gQUZhTtAopX5uK0?=
 =?us-ascii?Q?2JUPtwvA4j+A0XFju5ZD2QMeZStR5fCKsz7peWMKKJfpfhbkyh2TinDze+yX?=
 =?us-ascii?Q?xYuGZG8Yg73tsjXn6k+1meivEevIXBcog6JYQCokVLtQj8IXqEIcS2eqtxuy?=
 =?us-ascii?Q?534HjeecwOdqGyKAGe7p4VKwCAT0qu9Q4tT/UhE/3TwpIwm6uA/9gz9xEz2p?=
 =?us-ascii?Q?PI0bbC2VQDYUt3vA67BME0bXPUEPD7YYG9F73++HWUXWRrti9DY0kR709b0q?=
 =?us-ascii?Q?yqwdfl6ktkjwsMlC3y4Oj5yJ8KA/+x4s/yS23I9CTOpaXdaYtuK6u5WgztL0?=
 =?us-ascii?Q?Ebdp7ycIh8U+fWYivc5lcJ3WVV4XGxOC8KJ7GRhShIT8tI2f1ac6+YMP/0TD?=
 =?us-ascii?Q?LA6Rm4vr/TKJ83w8ouNB9Clpu8jLUXvj2Vt/dWT3UJEqZAYhbPlxzjEr4KSt?=
 =?us-ascii?Q?kC1mEGUCnYg+IDvo9mueUkjGJWUq4S6mpS0MJrGP5YFxQpk+3FX1WxtNy/5W?=
 =?us-ascii?Q?cwwZAeP6JBUeXTXx6VRr0jllCbFqB1bXOK7OOOL77ox53PrzmHWfhq7vWy44?=
 =?us-ascii?Q?71suFYarlz1U41OZgTy5+2TKxZjHjCzC+ReB8PLAWifC7PhzuD4TN0eFGPrX?=
 =?us-ascii?Q?f6bi2h4lOUq4nBnf77gcbVWaQvMpxCP1L4dyym5xCg0gE9v9sOQi4yjG56T9?=
 =?us-ascii?Q?6v199Km7FUJQ3Ms5WjiieqUZ0dsbNh2kziu2vjiKQlWpYdGkUQIGlCoc8tCy?=
 =?us-ascii?Q?VHa2FIk8WgUCUwRoJF/sXARi9g6GzCFeyUDt/IKB8hcpWaaw/MqeeIH/Pv3d?=
 =?us-ascii?Q?uxyVppvz+2Ieumq0EffZuT/9j2E2WIxZsvRcyoEzWfXl7Xowa3PrcZsnbdIA?=
 =?us-ascii?Q?GU2wlzgbTKwyEj5LBecFgGgtR6n3TDhlWZjov4R5U6sSppXZYRO+vzqtCM3m?=
 =?us-ascii?Q?lOA/QAN3P0j4SOJRNjJOEb4mXNf3FUv0ZSQYf5eF9jaPNo6yveiwfjpA7AFE?=
 =?us-ascii?Q?8o9O4whncz9G9n3Lh+yaenciAA/mTFvBu37EaGoSiUMDkgNvhZGuZbaCUvAu?=
 =?us-ascii?Q?qG68SnGvLWG1/WdRNahhJGpnBwx1mWHY/7OrQGvR+1EoFJ66slsiMfu9DvZM?=
 =?us-ascii?Q?M2a456VQ/NBb1khYxqbusHTD2ax4ixPDRMSq8r+4pIB+yL1mvtBG9ielwt+g?=
 =?us-ascii?Q?rsy7UIA+DqhhHmJyBtI9QUcoQHY5QH+on53ijDC/8PV8POoVrQcgO7hArw2u?=
 =?us-ascii?Q?p5TAkWsfNY9WnE215xdusb4U9jmZ4yo5Kjp6Sih2Ogmw3BdPRpmpPpUUWFP6?=
 =?us-ascii?Q?/YtyQ9dfW6mDiIPmQ/El3XfaFy/Zf0LKnHIL954AReTnRbPuyFWfu3Cha+m2?=
X-MS-Exchange-AntiSpam-MessageData-1: ZZrMy2gmLH38MeEeygaRUczOmgZy8ajUvjg=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd83a28-6bd4-42ea-858a-08da10c5343d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:13:59.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hfEhfdibtdSFcOzXLDgy+0MV4u+56yC5INaMVkI9JPxu2eZHSaS8PGEpU8NLWSoV0t+l7IEVIuZk7eZJY7q2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the DW100 driver.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 .../userspace-api/media/drivers/dw100.rst     | 23 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
new file mode 100644
index 000000000000..4cd55c75628e
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DW100 dewarp driver
+===========================
+
+The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
+programmable geometrical transformation on input image to correct distorsion
+introduced by lenses.
+
+The transformation function is exposed by the hardware as a grid map with 16x16
+pixel macroblocks indexed using X, Y vertex coordinates. Each x, y coordinate
+register uses 16 bits to record the coordinate address in UQ12.4 fixed point
+format.
+
+The dewarping map can be set from application through a dedicated v4l2 control.
+If not set or invalid, the driver computes an identity map prior to start the
+processing engine. The map is evaluated as invalid if the array size does not
+match the expected size inherited from the destination image resolution.
+
+More details on the DW100 hardware operations can be found in
+*chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
+
+.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..8826777321b0 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	ccs
 	cx2341x-uapi
+	dw100
         hantro
 	imx-uapi
 	max2175
-- 
2.35.1

