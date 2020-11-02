Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4782A2348
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgKBDKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:21 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727812AbgKBDKU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Viv+fywLXIoqT+xZHDBxZ8V8iWddDPUZMMmue2q5btHdy3w5UdSmq00Y6COsDqTc8NlUQUxqoc3hdc/JM4fJKZooCWj/jT3b1dwUbjMt0XFsGDnuiYvleY39PfPmGhOAZS9DkjJnqB6+gxGiDqB8UiIEvv5nkc7SdMrJya7IGpt4XKOxMCQsqvG6c6+Dp+3vFIE8kmhZvGxgNPUC/C8kRuBuJRHHcQQmwuZs4sGY2SN2Fh+gaG/4V7g8UiJVRZxk92KKQ3EycOC1xlwMDrJbzt5WKsEhMMMoePtPOJMUOqiJ0kwMKOWjXvUa4dhGKv1iTMPEFbmaJdOUJeYFOU0ZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm2P4z0iW1JxCltPtATuMNv3LADkgEE/hBdq9rBNWwQ=;
 b=PW1PcE0leeHcLtHrqKGxygRzJVWf5NZIYfaZ+xNtb7CE2hgHQgkc5HDsMMPkhm3TSlSWvUf4cxWsbPCBhq5E4PyU2bvQCUAtNN+R2NwxhZemvUZSMNq5VhDhKNhEFXQNC64uoBaXqXukLwSYQprD539OenPsRbBNgDgMYewCmvP9aj3noLgWOeJNEOj1fN17wE6Anq+E1oVocCOWb80N0S84mRaiqyE4bdIM9zgt1dgRx4NvyiPAgsgVTRKIawNgX8M8S02GcavWmupxTp4Kjq1MiC4sJX7ujESE3bndNZ3MtZYI82xRTv5sItAqdVdv/Dim4m21vUmyUiWmdq8WUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm2P4z0iW1JxCltPtATuMNv3LADkgEE/hBdq9rBNWwQ=;
 b=K6sXIDrE2sw11sZN4K6FZm2KUL7kgwvqcYZ9tTmD2xmv7aALprFBqAbDOrclOK/a+DbGx0IxXgJPpzbo2lIBV0FTyxZAj+xiV/b2UKia7jJtUa1V9uiPU5m8+dK2GalV74G95VAbAeFXtc1I88oV7lyL0R303+Auq0ARC+vacdo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:05 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:05 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 06/11] Add maintainer for IMX jpeg v4l2 driver
Date:   Mon,  2 Nov 2020 05:08:16 +0200
Message-Id: <20201102030821.3049-7-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fda997b3-3aea-4028-3b0d-08d87edccbd6
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5173485CDCAC92B63D354BDCCE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mj152cEAbLXZIKfZrSmuZoYsNMpVafHm75OpPKQ0nsTeq1ngvcOSBXbgjiAhPs5O28RlJR/Mwl3HjWhhUeNZAITLATV60gVIuTakF0TW0imHrQX5SBXugx4uJXOnnpOzqqmVLct074u+nc02Ofj5Jy/Vp5Sb9NZRK9qcY98qOet9ynBdf7Kclbz4qC/XzwuqdtxO+5+ImSNgppLJJj7oM7f3B9w3xAQdPMcotMtpGzWFBU5rWL9M/aypiGKnpgBVfuDGyGi/7EStJYP+Kq5MYQtHKl1xs+FgakWt3fsyeaEnuQJH/DDOSCGDlyOo682dDP0AsBmv5AAZH6ybkVW1FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(4744005)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cG8uJ+QTVQ3wEgqlwHEDUDpfyIva5YAVCJX6X9FF8v0b+55XFjMu4GFcI/SQLsBR/yde98iTrz2H8PJF4/h3WtIFlgVHlG+sHQ2aXg0IvopddZvn4N1D4vncJ9UqsAjZxntDS9jnR2p1e4Hcih8NCbXoDDcE4Hy1Olb3cu9ziNZRl0F/qU8hwse4I2zIHurAPGJxPzMrotPucKE4cuLGyfhiBIz/yzS4HhrPj4siBZoJjZosjDcZD9pEIivhYBV7skdrRGuIVvERjmr8r/7ry5Zcn/FEeOfDBd0X2ZStRIt4NOCeqV/CyYK6evdEfhR6KwSNXOIt18Ig1vdGGQev6C8ky4FmxjUWjEdpJHtA4c2ffzXbXD50hIC7b7lQOF4UXGiCPiXLB3slMLo+9HwsR1yPr56ql0znf7gAQma7Ix8kPl056iy9lWnbdAhrqmYpgyH7heVAblx6eA/Y+75uA881dGOen7bh+8Dd0XrT/NqRLUkYo5pM04DaNc85HNHufJGjgWdawLZVQRSt06tlFvo9r73yB4QpGn+U15Bv/9PR5qrmti+k9vWgzrW703gaBsALLZmt6CvMdzdEvU4dy25eHgdKPNIcTi58x1zCdLN4iLOK1489HW5MV8GDdtrW7boXG0FdBc6nNgjlRtMaWA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda997b3-3aea-4028-3b0d-08d87edccbd6
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:05.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwkMl4tGTD7D1BISN9HXATpdAGciFmHUZ0WUYTNQ92UIR9oODl18zAFZcOw+QFgPS+KrLeiH9TqEhJA3sTbJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Added as:
FREESCALE IMX / MXC JPEG V4L2 DRIVER

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aefbbecfb266..42a596ae346c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7040,6 +7040,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
 F:	drivers/i2c/busses/i2c-imx-lpi2c.c
 
+FREESCALE IMX / MXC JPEG V4L2 DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	NXP Linux Team <linux-imx@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
+F:	drivers/media/platform/imx-jpeg
+
 FREESCALE QORIQ DPAA ETHERNET DRIVER
 M:	Madalin Bucur <madalin.bucur@nxp.com>
 L:	netdev@vger.kernel.org
-- 
2.17.1

