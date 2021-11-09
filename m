Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7614944AA50
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244907AbhKIJNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:13:52 -0500
Received: from mail-vi1eur05on2052.outbound.protection.outlook.com ([40.107.21.52]:17696
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244858AbhKIJN3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:13:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq0OacCnvyeSEoid4HkLd3k5JV/NM5KKr5OW27hNvSYXooOTXnAHJNNK1ClhAAwqE6WDosrGtKXP0FrgOa7Ey7SoNrVR3oIiv7Q6pRrdFjQeuSQVCDFpafJQlIDgF4JchD/B4rwRU825JB6G3+7rhGcudWn2G7+bi2uw4cm3hSLxL2cfjA+H3M0wMZj3mU1C784EQMU1jnxi7PqdsL1P3tj6ahvkEOmUJIu470z7iPT7hDA/N+qmobNflvTT5I/3n3GsM5HF00eGMw9J0QEjVFCIJScKolBX6kcpYzphfqVPgUwRHDtlGA0uQD/vFOlR8op3G/+Wz2ebw140u07l/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJSXz/FISg2A5W9QNN6fSy8d7njGIlB9ac0iOHjV2YA=;
 b=eQ+6HVzbV3GSw7I48BLB0gzD891c2UczS5RcvNDNcOMLM/z+WjqR9hRNSYn/6zkkbdWTh4I43wVPekUHHWhLIDzES/KTQXP4EFIiPsm2ur1R57Bd3ik64cO+T1u3YhGCu7T6AnQnOlh2E/mKvNnZ2b6omVxd+jtyTqvKXJMKlvWpuLLRIS0dtGrShfAmf54lKJCvlTfHqUPDNjB4I1mdWEEE9btDe/5IFEPxs09au16/Av+ALj0bJuVhxNubUvhZWWwbUtUYRBxRv+WCN4IE06XMwvTpUxMikKebfyiKuMBwYvsB6tsxv/cY+yQGPFccHbU9AGjYtzEUd3cDENXL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJSXz/FISg2A5W9QNN6fSy8d7njGIlB9ac0iOHjV2YA=;
 b=Hz80kcU+G9ub6sb9vjqJ8+ZtGn7enh83NoAIgFyl+NLoxQACTq/Kp7lOuRTfx1NVvTV7LcE1JznsbbyWS7WuwxA3g2DKuIqvI5XLd4fj0MmdDLUvM59u4T2PHlamjrMKxQAsn0DfceYOAFEKKq3QTufHoRP06E4CZ5f3OkQCXKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:10:40 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:10:40 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 13/13] MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
Date:   Tue,  9 Nov 2021 17:09:12 +0800
Message-Id: <0c1f00b2f419bbb043d58ac5d8e0aff8d091dfac.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:10:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3916073e-8c3a-4cdf-cbbb-08d9a360ccb6
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB8278D9714C8289BF6F0AE1D6E7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xvf6rDX6zta3Wb71fY7IqszBPsKrCHFjD1eHIWtvu9nv+UHpfom20dkXnhKnym1KIOXE/dElt7BdYAJHX+BDueCwA79E86UTe/aRPYBXiMNT1jOL/VrCxH3r1diyhO0SqCQkQ6fLpL7b28B/InLYqDPIykZMM3+lxp2K7hjPSzbOw+MoEM+tb1OWrThgMmeiiDQeYDK3bjI3l7pT0do529p1P9g0bcaYp6evACW6lqPhpXw/Ehp4KE5ABpVoimllGCIf3vMFpS0l/7Enbb6zgOLuUgQLkNiswufYwM6C7SnPIfJMHHMaNvE6ONAVOQPH3A0WADVSzkIWgZ1qBVvx5T94tpmBULelnkfnI6dJIBXtbvafDBVAo/wi9lKs3YMD8bdQcCfvL1Qktnjm3AAWImyOW1ngcVlBYHtxZBYLW9dKEg4HLPUh9qbbgVsBzbdXPpzBbQAn9J4TwcIM5QcyhVcBLGta+MQdz/VUts9IyLkrXE2Y8mODlPoSg4bQ2KCuPw7ZHf6BRnof8Gh7WhgAufhycJ5lBoMhbtLeyHHGFYKeLyWqmOekx/uhVqB5IUsio3bTCeNYoZcvtFVA6PD19dQq00JYOsNetewbsE1N/rEf8OtqZrRCkFskj05af4O+hFGAO7xiR4UbWOFUz7vCQRmjiCnOPpnPIBZgtMckmTTVQzqhK3nBEKEOzXLrR96r3Nf+uhBDdiikdCFo8HOE8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(38100700002)(6486002)(956004)(4326008)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(4744005)(66556008)(8676002)(7416002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5QtXfR+EBpGc8+HxAHC6Fqw75iWYIgt2hQ1xKgLZnzBJBHd3gb/lEMjQW/m?=
 =?us-ascii?Q?+RSfxleNFdohZwnbY4x0AyxC5b20AOn3tYWzpxD8mpEt+0hlcP+MFau3MBxC?=
 =?us-ascii?Q?NUZeVL4JdGo7TalboSbSQzKNTUGVpVggPVvNIqZ3uISm0k7p0kZLSctElAI1?=
 =?us-ascii?Q?YOa/Ug84jnCakFGPh7HLlM6yu0GqLs0CXuLNiB/AUmcSM/GhgDCFr9aHvqqV?=
 =?us-ascii?Q?l23ctqIp0LDNOw+MGWCWWKfAZKbD5i4GwBFgNDRya3w1ctnOkR8rMApyhtPD?=
 =?us-ascii?Q?b1PMQwXs5eLJV/fM+DL1AJ3WFmA1YU/FFg0yC021bXfktKoZggBtXp/Epbyd?=
 =?us-ascii?Q?Ep78oNwIzYQUWmvR42XkanIP4s8A+d1R7YIsP831IouU6Noa45q/sVz5rTdW?=
 =?us-ascii?Q?Mb3N0Dxbwn1zau4tnElsluWrU9ybKsJC55xUXOnltobn/fGY1dlt6nNHMPx0?=
 =?us-ascii?Q?DjIJ/5ePHpiRPsf3nLakHVQPHXeCrCYrU5apH0tplnlXOCsTQoM+dd7vqxqG?=
 =?us-ascii?Q?2MWg7cKsnWRqHQTEEOgkK4rTAV6lvc2ZiJ5z+Qd3X2DXmKdpCslwjPqsCHCh?=
 =?us-ascii?Q?kqd7TI82Z4YfhHj4Waqs9cJ2H1teFe8+Aw/1ykzzN2+hj3IIxn/QGJlLpQ+Z?=
 =?us-ascii?Q?Zx1e6iXbI6BymbZbMl5oHnr0TNewqZv7K4GZdUx2QmgD6pfIujAe4hG1Uhav?=
 =?us-ascii?Q?EEpLwL5L5Jdgo0cvro0d4tvnqIL6WIyw2dR+UvUFSk2cQlqLM5gDFGXGZooK?=
 =?us-ascii?Q?W4ilfDfTtO2fXRKZlos3LUCJecP3zrlhNwaDRjlQXgNChgJDMcjeA/giTCPA?=
 =?us-ascii?Q?vpALT4+aNL08W4yEMoYV38UEiQzugxpiv2X/m1BLBa6w5asYfeSeEJJDYD+c?=
 =?us-ascii?Q?yZ4reSMxZogxYZoTVHUBdSExjTLSbkkHm2ARUxBStrgZ8jbPC0CkncEX/hBo?=
 =?us-ascii?Q?vVK1jDiNeZVY81oiJSbWwJT1sdDFx1qaFifqrmlRvtc/0ILSJId6P5Ad3u2z?=
 =?us-ascii?Q?tsWHizzK+rHC0MZ09e9krmzVq5ujLaAj3TbYMy7nvz0Nk5W66toZYKRplkHI?=
 =?us-ascii?Q?iTA8D1TF32uRFmol03oE/mhK9UC/ygB4ZcCG27rXm4GigPm6USY7bMrbyx6k?=
 =?us-ascii?Q?+JtbCLt+zh/VtsMnlYZecEwETulQ9rXK/3YBM7wxAKu7mTF7CVCyGKqTZK9y?=
 =?us-ascii?Q?xNFRDeEPUvsr4mR7FBzAJpiTJAInBvUGsGD5fSkVHhQrYooRZajYQ9dGYZRS?=
 =?us-ascii?Q?Zbpzy+iOQQiZua4lQt95APaZwu8I2+9lUxFPMDDb3zrhyi9yGye8e8CEbtgD?=
 =?us-ascii?Q?9H7w4X+j1IA1FehArXmxxXryGsaxiyAPmPe8bTWwgQNAdpKgrBSlxrPKgPBx?=
 =?us-ascii?Q?iSQV2PXwVrT6HeusaKf8fBN0pGcvl6icYAMjcFdbONYNBki/vetNvtfkRrx/?=
 =?us-ascii?Q?WeVB0J4fluQKtsieUP6cqHfQUJ29kRK689pcCidiBHdgoahd9vLb1Oodb7RZ?=
 =?us-ascii?Q?1hb6+rp9niRIXSwgl3JTjwLeYrxvBqNY+lnvH4kqwKmJc0GdbohudV1FlyxS?=
 =?us-ascii?Q?yUlyGYkKr5TcNosmZdzMFfBJI+2ABkmZapphrdpcSse9IWsqIBObZLpCCesP?=
 =?us-ascii?Q?0WeqTjV0QTPls1DtTXLBikA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3916073e-8c3a-4cdf-cbbb-08d9a360ccb6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:10:39.9793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl9vrVvfIuHkvb7hkUvDrTX8ELHFJBz7n6VGvQUWrKHIVGS4hNJz7vloqqPnTrX4/SbVcXQLfkhUumo+sGSP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add AMPHION VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df69dfe482e7..5253916e1f3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13540,6 +13540,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
+AMPHION VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amphion,vpu.yaml
+F:	drivers/media/platform/amphion/
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.33.0

