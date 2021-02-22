Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DB2321FC8
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbhBVTNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:13:45 -0500
Received: from mail-am6eur05on2054.outbound.protection.outlook.com ([40.107.22.54]:47004
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232887AbhBVTK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:10:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vlx2IM9YxLHi5Ic9twpVpfZZ3t+fXOjZ6c37aGAvIQF1qHagE71YZGgirkduPLwgn5FV5WX2ArDMunScoBikBQ7XRcd4fiGuo9jM56TqG4CEb7JqdUQcS3XuIrN5vgH599anAkpqJm3XwOHLzLk7olIQNDMl6TnzIPM0qHiTHry/qHrbGvNSKVNE4AJiuW4SO+3vKZEPgpb3VO0CthQ+xuU5bemn/fGYnnMaxA3EMGKHZfCANWciwPOiiYxqi4UgW7o67xwxgn2qECsKFQ8Xe3CGWKgNh0I5GgNDOyZ8RfqsLUL7iiqClAImFlC7hHSyzpBVeR/cATEXd+y8wOKbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp2S8fAy7TxsXgfniA3wX/LhfyT7rbUZgyZv7UyNnpQ=;
 b=lriG93LUpiOAiiRXawd8NdA21PXWsbWdldo0GmXeLgKSev7CoxO7Ptc5UcpERzleslGc1bWcccOqLf9Js5k1YJJWg7CYlBILFkOWYcTKSBxY/nJcqpuX3DupJoAGBDQrOU9TIONM9vrTMoAPJLXLxymaa8cOOyhfUJ2pM1ArK08UE2EFenRDXfixZrhIo+o8ltkfseFjt3PNN/tzXx77/5yYPX5SuPkcUoBlFgEGEdE06XBF/8njB7rg3/J4czRGrYABvQBNWg2LBse4FWj6KSEiiJjAEXQw4KghMJmZn4we7gv/AAG8r+hbvtG5rh7xrid6i1pqJC+lLd/NJ4T7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp2S8fAy7TxsXgfniA3wX/LhfyT7rbUZgyZv7UyNnpQ=;
 b=j4Obr5IPIDYmlUG5iO/wF+EZFIryFSr6cWgdw1ajugfsTCDYk2Xvje6wI6J0fB4lfxv1ZfUA7FQ+m/6AIXtfOaFAJ6g34pZdByi6zjqm02u62TmqMLzMNyeerBjpKF2Kml4NZWfHP5fnbwmH6eNSA7LLidI83X5ZmMfaPd1V6p8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:14 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:14 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
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
        dafna.hirschfeld@collabora.com
Subject: [PATCH v8 5/9] Add maintainer for IMX jpeg v4l2 driver
Date:   Mon, 22 Feb 2021 21:07:34 +0200
Message-Id: <20210222190738.2346378-6-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
References: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 124c0631-23ef-4135-984d-08d8d7653487
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB759162AFB3A76A3B454163F7CE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nxQcaU8veseAxVjkoEY6NHGl4QQHm+HK4elV+3kq6HXxuWV3RoJAZ2JTwHfqpIS/g20rNeNniQvVxf5dPI1ecjDarpn7eNg2ndJpCE7rD/boSsMqpiJaUmMVbUsbbRdHzjI5xEU2nnJWwPwc7e4gsCiWa2vMahSh9Q8wMBVQWsAVxxslHnZeU2ubmeLsWFOfsl8sEEykTeU9xXoRoiEC2bRYUpHJdz0ZvvwckdhQe3GESTuOTjb8B1xhHbvvoXZJS/GpdB2FDfd11eeOz9GnAFfdpOlUqvrZ4Aw1ieWV+oIgRl058JrISfG3Y0h9LXI06JwYvXjuUuilWnjTjkr/vaFwwHTPxebV3X24sRsbmn+/6GL9r1YLKX+ivqfB+ZUAWjjcXDvnRw3UMAnGTIompIBUycnhr05g1dUnwloqfW9iCfuZlJYY6hp0U9la0sRG9LtHGlYNVj1QaN/+lxRW5GPXdLvkzJSUla6RfRDx9eYpPR/wYBJ0YzGvqn3/XdJTKBkVuFcpH1e/TOnSL3F/RhE4nV8FKGHJ8S/xU4itoKM73AH8WPolUGjY66j/jDa5In0ekPyYht02G2BV0n8UCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(4744005)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pSXTIeIeaqqBXqgmVUTKEsx09CAlTWDAxbHcGF3u4DI2jhfe77SWhOVHPEf+?=
 =?us-ascii?Q?2LtgNERPEFoD5vzqmk7ECx10nCNJocw7Hl+uGhxOXGX8yfqpGlUqKCIgBWQ6?=
 =?us-ascii?Q?2vq323c63+Bjzb5z9/uWBcoyUxuzXHvP5cAo6QfJuIQPSLdwxMuVKi+ZBifH?=
 =?us-ascii?Q?x2ze/GhYya0BehaqqOo1praRKvlnsjWU6k6An/op8dmLdw2PIM4uIJvSBK08?=
 =?us-ascii?Q?EuAv2vLTj+FG2SY8/ayxQO52cGzAvB0/Cx1aSb44Nxuf8mFBGmzQgAFIGVx7?=
 =?us-ascii?Q?KU8FrMQqItbnceiSZ4LH7GXy+tifIBGIeaBx3mMs4BDdUvvh/CsazptWfVOv?=
 =?us-ascii?Q?ahmfu8q5DwdVL9lccFgNKekg0nyNs8Xip38oNVsBeuXojsmfDZIIlzpJe+2C?=
 =?us-ascii?Q?5a3yWjOIWURUjYtuSVegDyVjiftm0piRN9heIz8OdLNUqM6MzW4MVJas/A0M?=
 =?us-ascii?Q?pBY4t4hhYpIQhFzeEeWRu04+J+S3HYHUN8bZJjahEk5DFI4gmoqm52Kyx8HF?=
 =?us-ascii?Q?YR5mivbDSyqEHSUPwfzQAMbDxQp8/N2NIYkd2tcygeWaK1DcAe0AF65gN4YG?=
 =?us-ascii?Q?d+2Nd4OtNpiAq4kW5J9D8NJ8okz9DD73KS8yX9Det8k0V0lVn+4/+YPEGFgy?=
 =?us-ascii?Q?jc4yPw1sVCBSfFfTZGGxMGFkBbUx0kifMFZjj/WtLoVKw9HGXHAulbd/kix4?=
 =?us-ascii?Q?4AeK57MyXjd6Yht2MYmW9m+knsavIMAfB5yjE+5mU1APFF6gnBIhNoc3BCiW?=
 =?us-ascii?Q?VsfFKA8YGI+c8Dl/xf6t9qqYmF21yZQaKvIgZZP5PioJOAUFN7uEKUHxqFPO?=
 =?us-ascii?Q?0DWBAFflT05HZf5J6WQl8LnnaBoVS4ntW+XR1LE5dUeJs+qhXOHGdZdfWl3U?=
 =?us-ascii?Q?iDRS/wdJiqH47S+//jtgDQmnW/cWcU0h0qgM951lCd16ZraXY/1v9mRqbta3?=
 =?us-ascii?Q?7t/Exq6U/rYdIZ0iB1ROgM845B4mHaLwyDCwx2igwlzxRpkFrTfKZFhY32MM?=
 =?us-ascii?Q?T1CRti3JhXdC+MfzLJ/kvJMf9Rh8Xnzn50R248fvwFxfH+31f9tMqaXYd76L?=
 =?us-ascii?Q?eF/f5b0IGiAArYgOb/2LOKsNa1Ls7CRnHLBhZIw+OT/OUo6M4MBc8I69y+bE?=
 =?us-ascii?Q?FAT2vyEQfiy7mV6oQ/eg7jqsFRV9RvoWXdrT+qHcYLG+upSvPXFV2gP9Yw6Q?=
 =?us-ascii?Q?dMFN08gzlP0cmlKXKvtQy/lEtAs1PxqA+axiB9RS6xCv+NrNkgLY0cx5zUbP?=
 =?us-ascii?Q?ihkB0neLp5H2dOo35/6PVfhpxxgNxIvmVh/JT51dEC6VgiMjLAX1VcjEfOkF?=
 =?us-ascii?Q?ryQR4qCIv6P1tOSANzis8zJ0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124c0631-23ef-4135-984d-08d8d7653487
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:14.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLUji+4dgxINvogly7T365035O7PwWIXgueOnqpt7ayM/CMHG/Y5HofZ3Bv+xQLu3TXh/zLKh042K4Hn6YlyrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
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
index 7924907cd7cc..75ef7d614d0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12911,6 +12911,14 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
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
2.25.1

