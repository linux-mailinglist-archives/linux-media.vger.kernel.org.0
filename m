Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31653368BD
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhCKAbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:31:23 -0500
Received: from mail-eopbgr140080.outbound.protection.outlook.com ([40.107.14.80]:48539
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230242AbhCKAa6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR9ZrJfdSq0QNXqilvHCsCqEeQzC14AysMAibvYjV8Jqe9fsNQDA1JeYugjcJzyebcLLsdv5UfQKVahsSmHIHHBaWJKZ5uhsq1MNnTsQKJ842YfTgyU0uz5wv8Xh0A3hLxi2DTX16TTYHT2vIwKeZNbXqRKLnrjFlbVuLc4MQkiPwbAeXb61Sv/sYuAae3F8uLWmWXBGcm29RgayFflaIQluSJUEDGHoGM720FmlQZ5DIEjSEPMUqv+rMB+ft+uAm7T49nOYaleSZ1jzWijg7m/CDIpncYMyln3YaU5K3CXCHgIw3vgCPQjTexHeNYMQApdsPjbRBsIUrRNV/jJ5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQaTEDPOGU65dBNDtVFGsir9yk7Dbx/SZMT1Ly7lA4k=;
 b=l5buckLT3g6OxcpTn73/NffEfpgPuQ6ZHOEzaekw3T6hmgtfB7FWDL2DRqfTiGfRIl7cMapQzvDEVkVuMzRFsCrbLM2wrfIsXq6ZmJv9q/4vDhCrnNgD9kund40f9VZZoZ02nQoLuoEMteKhqjsvs5bLjjWB2UjYzhTPRKk7V1aSPuNsNpd+Q7n4uHbYdCZZfK1ltUG7jXbKWx/AzqQJT8wihJ/elfgVA5nIkGfImm5xLSvYchLONA7KN/0VTIvz/KpRECol1ZSNUuKD5ZvcAXylEtnpUT6PkL0OmrjSsAgspcPxQENyVYnA5cCOoLjoGsgliKrZEYIa3ONNMaCZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQaTEDPOGU65dBNDtVFGsir9yk7Dbx/SZMT1Ly7lA4k=;
 b=ijjxfu4zIA/cQC9pkdzQlhmmlTOjfBxRHE5Tyit2f7o3xM5TgYU+PlHAak/5aoKQMFjmNfQKKbHPYehWnRVnJD6IWK3sIbWeEhWtfZTIeByu1AiJA05hlL4U9xn5TSzwNsdjZpFc1Y9fnVx8leYBQbvDmhwt6/ALRCijcKeUSQM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4984.eurprd04.prod.outlook.com (2603:10a6:20b:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 11 Mar
 2021 00:30:55 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:55 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v9 8/8] Add maintainer for IMX jpeg v4l2 driver
Date:   Thu, 11 Mar 2021 02:28:54 +0200
Message-Id: <20210311002854.13687-9-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5470f506-0ebe-4e08-d1ab-08d8e424eed7
X-MS-TrafficTypeDiagnostic: AM6PR04MB4984:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4984CEFD78DACF5E0ADA7501CE909@AM6PR04MB4984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0NRASkfdDy6Gb2GWUB+5Sn9T1gbITeW0srbT5qsBBb6hA52Jp/CWdYziItci5GOJM21XVGtvHtTSJ1AERRDOKZgTjR5as5/15vUEOTn4yY3UEArkZ5iULkEeuy+sH+C3Kvy6DR8W+6mFdUFQ64ToTCZ6gbzr62eOQ82cZXag4p4BlpkYkVk+sQ8EcOif/VRzJAJShAw4ubbrRttTB+Z0VgRMXjztQY9XzNDXey//fjtTjWz3bWEX0ueiGfd5/sy3f4NnBQNmbBY7Iz7mnxNwcTQUo8cNl4LlSpkjVvRPt9OdZ3Y3Qr5tAAoqvo6qcfj+J0NTDnzhDi3KbCTSKlnceGfBqBBCuOusIgUcEZT9Z10n1Oz8KrCbYEF5RjyRpdX82yzA9vLu7Jrlq7MFI8aUN2KxxlkmqLejUh89KqUQAWRPf8M7TaS8eNBSNxEjY9BLgD1JN1kZ//I2dz16JrHuft7uZF1YEpbqpKNRDLi60Vst5bHCgZ7UCT1CgR5hZUyyriaXTwaQzjRtJmfVfOKAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(66476007)(66946007)(4326008)(2906002)(5660300002)(7416002)(16526019)(26005)(52116002)(186003)(66556008)(4744005)(316002)(478600001)(1076003)(6512007)(6486002)(6506007)(8936002)(8676002)(86362001)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zoVGaIfK1qs0M+t/ay7+BzAi01eCUt0bHZhdRLCKuh13xXaS+vYT62CiEr8M?=
 =?us-ascii?Q?Ia+/rB1dmla+ey/prZEHCZ2tiSRTy+2Gp5G9LB/huhVg6DiNNZ7C4p7OyfNY?=
 =?us-ascii?Q?k+6yLIysJX8W1u3EEYx8a7nAuxaHkk2ktWmNvyOMudNR5Heg82iQEO3iV4zQ?=
 =?us-ascii?Q?tgZmWUwrEiv7dTQPPrlYgQjvEfSA8hr5fQt6pFDTYyk4+UvGvkL4ZRWf8kjH?=
 =?us-ascii?Q?Zjw78YLQj05Q9F8Wvf3dmfSp1smpCVlgaGD5rn3190hjmX3tg8dNyDmn/2ed?=
 =?us-ascii?Q?unEvTluYpxYPRu09Vd5eEvc49NTRvosxWjZlpGVymHmDlyR1cZKmBTF62ky1?=
 =?us-ascii?Q?LdeLtSfW9KODU1ENnWkoa4ckHKBXNp4xiP7FmO1osZAXuO00IsvT7okF/KlJ?=
 =?us-ascii?Q?m4iUutqklzUFoAh06rzG3S3vOxYiE/L51ikdjQpq2T9sYYFQVvtfDIAcPz4g?=
 =?us-ascii?Q?Z46oovxpHc+BiTDBoEZfFg1uxCNILea0ZqogOJC7eNtGlRCkWk73uVIhN+g2?=
 =?us-ascii?Q?t6DkiSM8lryEBAK9T44KS3R0LFv+ltwszykeFIA1Wb+iduTYecCODsbvGwwA?=
 =?us-ascii?Q?1Aml+AUkYVRSWvX3ne0WD4Pn1Q7JvjdJYW/5zMKNP5OxJPjveKHnSm9aS7Dq?=
 =?us-ascii?Q?HCN3I6X2NxXt1ebd7MEZZdJT4FZU5SBWZhMfMDN4dUB7+bPBRMK8V6x85qXs?=
 =?us-ascii?Q?+3g/wjQv4cXhsX8lxpQaQWGJrZ4ilDzukADGz+krJhyGVJfw0Krluyo4DRyh?=
 =?us-ascii?Q?sBEoXKtgBdUCkZuTI2HXC6Cp+GGQQB43mlgKrIetkmQoZjgfXD5Eud+X9hmv?=
 =?us-ascii?Q?Ub7BhoxsaKMGtKcy1xJ/6aExopOW3ROv+cd/8vXDa0ct+RU96Ot+eSLrMcN9?=
 =?us-ascii?Q?d+RImHc4F4qjRtZsY6dRsB9v/RTJalbB9B/Duj8J7/HJmzUMagSzCo/9CpSV?=
 =?us-ascii?Q?D0ZJTLUDiSaTxlNE+vF8oeU3L9cDh+hj2LS1Up05/D8ROF2ELHZ47XZuYDCd?=
 =?us-ascii?Q?nrafQDU2V3/4hs/pwj6NexC1PeMlVZgh5MR0OmfiPRAmXjnpRbJSyVz3BhYa?=
 =?us-ascii?Q?WBaGOpXnMV1eQc4DWcpyx1CKGWXhjwFNGtcd4MMwruYGnTz8xmTcVpCLbyxW?=
 =?us-ascii?Q?NBR9JgbdcIvvZtTQAA5iFfJIa2mOT6M2FbUSdJ2ixm2PT/Qketf6kTeE2qo6?=
 =?us-ascii?Q?K6rNi9tzw6geLveSyiTd93w1ORxFgRYNUwuv5SjskrJmfXUnUBE48LHZxDNC?=
 =?us-ascii?Q?mQ85nLtHqRIl8FvO+EsbiXLKhtbnUnJBFsu1ooIi+KrhOfte09qaOcHGiYrg?=
 =?us-ascii?Q?YRiqIPbuOYgCUzmT3jnDqDJi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5470f506-0ebe-4e08-d1ab-08d8e424eed7
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:55.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox6G/tYkAhT9yFjQbcAnV77jIRC3lsCXr+8SE+Sg9sY7D94gTZVt09fmMtiy0e5MrmYbk89E910TluxT6/7o9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4984
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The driver is located in drivers/media/platform/imx-jpeg,
and it applies to the JPEG decoder from i.MX QXP and QM.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f032f45bc951..37adf5783725 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12923,6 +12923,14 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/nfc/nxp-nci
 
+NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	NXP Linux Team <linux-imx@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
+F:	drivers/media/platform/imx-jpeg
+
 OBJAGG
 M:	Jiri Pirko <jiri@nvidia.com>
 L:	netdev@vger.kernel.org
-- 
2.17.1

