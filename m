Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E3738D773
	for <lists+linux-media@lfdr.de>; Sat, 22 May 2021 23:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhEVVNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 17:13:20 -0400
Received: from mail-eopbgr50040.outbound.protection.outlook.com ([40.107.5.40]:5186
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231386AbhEVVNT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 17:13:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iriij5Jr5Fq3MQeM3yMq+yZDnmOb+uP9dZLx9/Glr4LkLRE3s1UtFE1ZIyzHyaJONe11JH92JMnVJ5UtO9z/9zWjV1DHzwpd9FAU6rdBFufqkRd0HCwQ7TbkUMZeSxPcJIcGxKCPxpaIlKtK9KrPI1In30fNOQQDoVOrYoyrSy8WMOJlRwI1USHzj/gMZEHKtuspCV6NSs/HwdrAqjvEF1thb+p0bjKRk9/0cjVbwP65HwTsOfl3vn48NG62Zi9CBKFyt4efHdItbyNT0McVbi3bEfmH/boGnAYC12GMbE508m0Nevm+Ft3HZwdeFscsA5dPVh4DxObFGMBpsU9TxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6i8Ew6/0fbnoaFChqymzrBzuUVzM1BTOdqfmRlIvXU=;
 b=Lw6yhKAtHVheB4FDuzz1nLQprfpKYZ1wgpuCgATioZi8PTuIatVX1fnnlK6FrmM04mZJfCVzWMaPMqMZE+fzQ3w3JFr2GByt9bjDzfonueLSX4eIUr1pBIFIOgqI2fj1qKcNMNFIWFufpGjhEwhmkmaBGt3E2DzM2k+8Y1yR56EW3jnhWpJaJlQm80T1jLaa4v+Nr/5JDL9GfGaiaTU1Du03DUG9zR88VkKrqHWOhPtH6wK5SqLMHhllOEGKpvoWXPuLxISFRbHpnfCuzLRu8IUVt2iqKBXcF75MqfbTIHDFG8sCZq3QuVbzMrmIk5QGfz726EcRsb/G6oohW1MoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6i8Ew6/0fbnoaFChqymzrBzuUVzM1BTOdqfmRlIvXU=;
 b=ZD90g1SzT9csNxkv4Hi4hFIyPBFMFCceyUPhYzVfbJlgtvVvZLCiUYrUQaGtX/jygFdoXKeFZw4vqhGMpZmyQTFxcfHwi/sKNbNp24UwCYyxh73Fl7NBd0OrHWpHqHpFGnLLpqVi+V824XR7VxLnePJlCGOJh3C9RysCqwpKzDM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from HE1PR04MB3146.eurprd04.prod.outlook.com (2603:10a6:7:21::17) by
 HE1PR04MB3146.eurprd04.prod.outlook.com (2603:10a6:7:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Sat, 22 May 2021 21:11:49 +0000
Received: from HE1PR04MB3146.eurprd04.prod.outlook.com
 ([fe80::4564:419a:6e63:24b7]) by HE1PR04MB3146.eurprd04.prod.outlook.com
 ([fe80::4564:419a:6e63:24b7%4]) with mapi id 15.20.4150.027; Sat, 22 May 2021
 21:11:47 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com, linux-arm-kernel@lists.infradead.org,
        mchehab@kernel.org
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul.kocialkowski@bootlin.com, daniel.baluta@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        kernel@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v13 0/2] Add dts and bindings update for i.MX8QM/QXP JPEG codec
Date:   Sun, 23 May 2021 00:10:53 +0300
Message-Id: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::41) To HE1PR04MB3146.eurprd04.prod.outlook.com
 (2603:10a6:7:21::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Sat, 22 May 2021 21:11:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a698f785-7146-4c6e-6c89-08d91d66348d
X-MS-TrafficTypeDiagnostic: HE1PR04MB3146:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR04MB3146AF5BA837F420F49B03B6CE289@HE1PR04MB3146.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rg20oVHRm2bsGflbKO+mbiFw3a0HkBcRh7u9nAQnq1a7f7fyqNn025oerIjwDRfYDxWWF4UY+94TrUVAZIIq2HJD65L0insgtV6WcT/3bO9xF8tYME8HdugsTMFBely0kcUYMUczJkwIUY0gfwKpuPsGkkqbM4qWfRtZyLuQh4vvwwKo/a/q0KtOrMTV+76EK07LGOUpq5TvWjnWvyyhH1dkmq07MuYy7JHaURg5x5eIFxUQs5EORYeCj1suUCawAU512gPBigj9pKaB/+oJtuwMWDYdM19RAniMVeIBw6fy0oGAbmG0fdULIZn/2MUFOkVpsFKMiRxjGR+qrO6kSSNWZyzGCUxZ9mCaOnvGwSCtu8EJD0qApPhYA8NjzT8TzUY5/7CXIoZQfnInhxI89KblPdgOASC9WrQy6MEXeNJ7XMBcdebEyWJmREy+ieTmJf614SrzJA9hfAi+hCCFl75XMD+xhRpsGBJl+CymVAQbEytYnW1MIy1zcap76nQKN1+vLAnoXtIuDWdPzcVO+/nOHQVkfMt98LfdYapPBw31gFW0HOd59rwwLfPp6DL2zWk5WfXHCBylMuEuXbuk72tksap/xWnvMJ4vbL+BrNQPWnjd3KqvET1YxoRAhStWwXUcKeUBZuqPoev9n8Y4nhPE/parLXDU/S8rrFLdlC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR04MB3146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(6512007)(8676002)(478600001)(186003)(5660300002)(52116002)(4744005)(66946007)(83380400001)(316002)(956004)(8936002)(7416002)(6666004)(2616005)(26005)(86362001)(2906002)(66476007)(38350700002)(38100700002)(6486002)(66556008)(4326008)(1076003)(16526019)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KCqQjj5qTAoptjcIKWtv/5ssOFcD8TsSW0iy/jQouZALQ+9PdRMerUCoZBy+?=
 =?us-ascii?Q?cmGkFiDzQIpTgcgdqaz4bPImsswVXuMt2GeTKbUnczJDcA+vloSNcp7dJnJQ?=
 =?us-ascii?Q?qsAxSSTSIvgJfTOGIoIhVp2ablnpfLEBBdP9eRUPIgJyqwZpAaalOAn7hIps?=
 =?us-ascii?Q?r+EAQn2aPzM9GoeGwCvNM8MLdIguR1MtR5jr9CiuKMg8LQVKzq500oA/+x/8?=
 =?us-ascii?Q?eslN9JyTJTz731I5JXWayfl9F4QDm4WoOrFv/kLAKZxSqjzxopmwKn0myoMN?=
 =?us-ascii?Q?OTXVu8dlDyppNBBv7Ni4YJXJW45dAsnpVGZn2+OngX/NKZjT6CGToRbNyDot?=
 =?us-ascii?Q?v5GzF0UAxzM1srrdwey2QuMQ/ZR07ZcPgNtUfBHlbqFBUGXW5aHudf0TKJpP?=
 =?us-ascii?Q?LRm6YfbfZdUXsveXSVEmxOPSmDzqPKoCebwdFb08eiw1vneoyCivK4GILe/q?=
 =?us-ascii?Q?TWe3zF94Lcvj7bM7kq4Wsqv1Ks+ngAwQFp3VjExEjoOdvLrfjj/l1l251SG5?=
 =?us-ascii?Q?CIVDrlxdx0jgqPdpw5I+ar/k1cI5tXuMcxtO2QYrPXlSWdH6VgdptH2WRyIe?=
 =?us-ascii?Q?gJsC8mYLQ/l0TUrNafJuRriNGg/aeR/bOb9YUDimkAgd33Qk1NjnIdq+GYWx?=
 =?us-ascii?Q?H+EDfRqGpp4A7zAaA/GrFWtNEfrF9HER8JrRlP4dI/1lxoxDpA3BnCGqxmey?=
 =?us-ascii?Q?NSw6LcWQoslmyHrr/6OLpoVsBFKQyu6KvtBTbOK8+yUw9FPkOqkjdnbNi6oO?=
 =?us-ascii?Q?eb5urMqz7kVwLTNxDWf18mN8E25vkxRArFsYKTy3SGO4cgcj+/4fh+S85F++?=
 =?us-ascii?Q?yDgihYBxvTR2/FfFk6CuoVT1DqFIp6SNxzwWqXuXDDff0ThEcleysfKBvw4/?=
 =?us-ascii?Q?jyCyx/hCh/jM87VrifiHw6eX7J3meq8WRdyaZdNPvWeZo6BKNEJt397r1Esi?=
 =?us-ascii?Q?S6T2K2APXj57/7fPKJprHwNxqCUoo1g8jP0btTbh3VZgLyBqQk6sCUwFi/p1?=
 =?us-ascii?Q?ZC0/MtaxjXzO0PMqXJztJXCUO0rSn9eIh5maKrxOAfJI74wSoT1fb3TqCgRY?=
 =?us-ascii?Q?Qn6drpaSdZHEufGy9KzjCRvofp2fJ51HBwYXvbPaKPBBe4ACnWvH1b2XpNK+?=
 =?us-ascii?Q?dPlsfZFC3fXy1Jz3nwnr55ErQP1SPsBGDHJsuo/Z8kPEzttFpr3a7dq2FZIu?=
 =?us-ascii?Q?teFhU9ROxHAyaEhdDpKKMZ1ho8vvvbNOLPkAmOmYYcpo5YcNyge+dDWULbTX?=
 =?us-ascii?Q?moDum/b5kl0BQ65LQzO/M+gE16acx92PEcL0s2VMy8hGpLmGCXb5qAW/uBG/?=
 =?us-ascii?Q?NvJIkP7faYrl8sXPzWGZnvpz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a698f785-7146-4c6e-6c89-08d91d66348d
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 21:11:47.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYPVj8MDJpoZ4VQOB/1DzxX/iaFVqQPp7bF7E63MJ23KBf65YPFUWTs0ADG0HO7trlk54RxjRVlW04BMG+bisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3146
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Add the dts files for i.MX8QM/QXP JPEG codec (previous patch was v12).
The bindings for i.MX8QXP were already upstream, add i.MX8QM compatible,
this is a new patch.

Mirela Rabulea (2):
  media: dt-bindings: imx-jpeg: Add compatible for i.MX8QM JPEG codec
  arm64: dts: imx: Add jpeg encoder/decoder nodes

 .../bindings/media/nxp,imx8-jpeg.yaml         | 17 ++--
 .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 80 +++++++++++++++++++
 .../boot/dts/freescale/imx8qm-ss-img.dtsi     | 12 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  2 +
 .../boot/dts/freescale/imx8qxp-ss-img.dtsi    | 13 +++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  2 +
 6 files changed, 119 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi

-- 
2.17.1

