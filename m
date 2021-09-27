Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D864419EB9
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 20:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhI0S60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 14:58:26 -0400
Received: from mail-db8eur05on2062.outbound.protection.outlook.com ([40.107.20.62]:24127
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235865AbhI0S6W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 14:58:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1CuT162ibfR8xy2jA5aHcOmC5q7EvcPSG+PS9P6zMxPCXt6+q9plmAg96rhuv6xtn8a/UcUY0IXb6XOI/crrFtuuQ4FsiGi9X+t28JrrN6v4y5OzPfg4CE40hgkImGyTehRb9W67UO3DL29dJ60ut57zf2TAyD0LVoIq0ObErTTWAbfVgDekNd7ZNKBv+1yb+aRtwZvq2eHb4GjwHPhQ3Q4EXAgb/5ttnUuiEVaRTemsLuTfAAlP5U+Ra0tOHfdNVbhlWjV+NGRQqTHoQJ8fr0T2Id21+ADRblZH3B+CktRi2GJzsuIwvqimwxOaSia/PMCduqeRMXHyVwIFv9VUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w+5VLlNbH06ITbO/8Fs9VCB59Cehl5rJbozgzR2JE5U=;
 b=TZTD+k59MYF74hH+X83hX3xFzkKP5ubfQbatPA5b5OQkSORaPXlzNpwx/dxZBdsa6MLhHbgD0X7j7bSgXPcTXzQ22OcL/0d7OJFGjb0UyXn46Y2qaU6wFUZyJ3pV5/a3hXQ/2XF60z+qu96Cr04Rj+8PlTWwzPwMfJkh3XreVHUscOfn7aZt2pe5ArOY8kYbOODHYU/tjRjio1DwQEuwt9fikaupOLVPC+bJY8iRPbeK309caeUvDrv6j2kcDBQgC+JVioDQxYhiUJv9bjb+7clsomAXbClSsEM3G3Hd/UQWvD/9uWX82cTQBJcZpfiXunctNTzlssm0i6CTDC7XFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+5VLlNbH06ITbO/8Fs9VCB59Cehl5rJbozgzR2JE5U=;
 b=RrUcn9YfxnB9+5UqfWcwjIWkhib9cVOT45xLocL2Izk+3zKtptt7zQv/3nZRjSG3NkwCbZVZsXm/DipS5TBlvVG9VLr/LQw+xSn/w9eeZmqPpkjgAz7Ag/hNj6+vLss25T0hu+sakgVKEZrtYxvb5K6lxL39J9C3uAM4JLyp/0I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com (10.168.63.15) by
 VI1PR0401MB2287.eurprd04.prod.outlook.com (10.169.136.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.20; Mon, 27 Sep 2021 18:56:42 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810%3]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 18:56:42 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com
Cc:     linux-imx@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Fix possible null pointer dereference
Date:   Mon, 27 Sep 2021 21:56:32 +0300
Message-Id: <20210927185632.3094673-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR03CA0059.eurprd03.prod.outlook.com
 (2603:10a6:803:50::30) To VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15)
MIME-Version: 1.0
Received: from localhost.localdomain (86.124.168.147) by VI1PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:803:50::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 18:56:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2047721a-2ce0-4c38-4065-08d981e88b9b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22878D1D000B0F993D2392418FA79@VI1PR0401MB2287.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4PhqnGwMZCUY6Tp7dSSy8WknnPLsrlS8sut9n6V/rUnMWhZLsBG/dNaPZ26wZL4zobfIJ3m68kUKI6sRBPWnXnaRLfNDLuy3EcH24OYQoQGlKYlMWG7mQH5F80l4cvyDA/7K2hZTsZkMmJAqsBiMJGFXnFkz2S91tRTSGy6gzLQ/lWz0v11oLNpmfVAeYg3XqX9/hvSx1cH627tKsE6DWaqRp7SFX9pwXcXsP8nEVZCrUOIHgkZRMwNONUr5Gz5bgKOT9u3XnirKxe8xPskMZIxOe5gp14N7YELNNBFsIXGcC+OrPE1lhOdDVXx8EJjeDCuE6sNBT3XXucPkFRbTwNQtgB8sYEMtGwZaLtLgR1iPinmPuigg05fodRjUUF5FDVA4Zl2ZMw/fZUM0KG5vlWal/euupBCkMmSBLj7dZauOjjTyatvH56sNhyLK98XsW053n2x5ne4g6kUuUx4eWpAUQoB98vxBFJwa4Q5XQW8m2HQAjvDRu34e6U3CoTCU1kYlngl9MXAHQr0w1Z4xUeHIpUKHmYGnnEuLHFeIj7AIK9WWJfYtfUPK78/iI3OUESzCTtM5cVdknWV51poV7QeK/J1a2kI9sJDt0f2g4QSc7t6NGrDTqkluARkKAU5kTYbda2cG7h5655wRiv/+ykjtTnQcgr/15f3Ayfl031FFaIIrugJ6lHqpEbW6hXw1hApQW5k6C/9Fnhmr2JggQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(2906002)(6666004)(38350700002)(6486002)(83380400001)(6636002)(38100700002)(1076003)(26005)(36756003)(6506007)(66476007)(66556008)(5660300002)(66946007)(186003)(86362001)(4744005)(508600001)(8676002)(8936002)(6512007)(52116002)(4326008)(956004)(316002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kSHXSTQcJ7idAEK0Lb14Fb9hPit21749pfhQJ0P1WsQpOV2Qb/YsQZawiE7z?=
 =?us-ascii?Q?6Usy7LtD0QFLZmKRWtxz8CpQP8fhWVQ7HK/jxGhnQ8CScutJ5twVSgJxmIjK?=
 =?us-ascii?Q?9N+/bGC0zuQ6widJmul32XP+oZKRLEyuWYyqJvi5+tYB42YxX0JvcVddD1L4?=
 =?us-ascii?Q?k5JhFExktxxA1A7u0QXIFjobFhbFjpk7IfUW9JCdsuJRuyVTP1mkvOiv3N/A?=
 =?us-ascii?Q?MbamkEUYYic27/r20OxVF5I12Yl9EtLk1squRnSu55y53kV49594FHEHAmml?=
 =?us-ascii?Q?xMD+Q0AgYw1IPPYTC0RZnJ1bHANIEeCp8U0MTqa4IDfuGEb/6rOG6Ze65GEd?=
 =?us-ascii?Q?VKoVRBMchWCdndUYr5Yk+QJZCNec+y4C4ZTiIBpK3TeELfD4lc8hfecV9bGq?=
 =?us-ascii?Q?0/L/wrLzxVmJpQlIZGXRChxMAKNwXV/nXAlwySMcrIWTO41zkqEr3oOHFTHA?=
 =?us-ascii?Q?GZ0NRAQ/HXbygLqZBNhq9/hkgJdyClhcUotb1GPwoFoDgPQqPLhEzi1wcLR2?=
 =?us-ascii?Q?fkBxQuwiWBCI2/RtVFdH/BpavYlKZkAX9+jL++JF2T1N4PgH7Bsp2N7ZkaBY?=
 =?us-ascii?Q?axfzbnJyGxRuXmsBv/ykU6Ity9C2WSVqn5H83iDdFktBMISr2XV9QwVMPiy0?=
 =?us-ascii?Q?60QCUr6CFVlPPNpMNg4efO54yITpd/LpkompRvCI6W6ueI2zp46aFblH+R7y?=
 =?us-ascii?Q?TQsIBXP+tRBcOi+RgZZErZnTu4tgDBB36XGiGoctWwVCiiAG5rX1rOLAZoh5?=
 =?us-ascii?Q?/yUbIJAd0dzJkPLpamqHvwQouCKIB2Nue3lyp2SPnAG7xxPmMZGPP3FdUnWv?=
 =?us-ascii?Q?RWyTPbI0PkreDODTz4tphaDHMfRCnOjbpOTTXsNiu2rWyWl1i+fLVzzd3zAR?=
 =?us-ascii?Q?SmB7kT20a+hP2xq8KDbQxgJiDeFbkxFqp7zMwB5S3D7sP+KjiA89aLdqjgEc?=
 =?us-ascii?Q?I1iNcewthWJyqu7UWyfRdKMOTZoPJ7pdb9W3Pn37LzY3uB0ujos+do6thgd5?=
 =?us-ascii?Q?5L2Pxf5B+eITqCOTKAzjPCYJKtiudiWGeBKO8utntZTcMylRICBo1hwM3B8g?=
 =?us-ascii?Q?OHgocvoGBz2Z9/IXso7F3T4lkCYiR51hrJh3J7+syp5IKTQQdNy4cpckQvPq?=
 =?us-ascii?Q?O4KUXUeyIOUkyAWFGmTkN1/QYtpgnMHdZ3cOYAh1htKfhufZAoKaB9kz7Xm0?=
 =?us-ascii?Q?BUFshajgJp/B06vWPwtnxaIEPbzPkC9m/7Hrxlk9yACIbLQHfVbZapoT5hJo?=
 =?us-ascii?Q?oFV6a7LjbjxCr7sCj+AJAS/ao7c0TRR4PYU/Mv+XlcgDCOh9jIDCbZi0diLO?=
 =?us-ascii?Q?EV83sP7Qgbvkl+ZfjXJ1HyZ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2047721a-2ce0-4c38-4065-08d981e88b9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 18:56:42.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FLSRQHdrhUVG5tBpz/kj6yHecrgDzKM8xpAhuz870a3cQwF9DvGK9kiH17di1FdA8mq+BiIzESpsekBwGO5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2287
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found by Coverity scan.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 2e1fef88cdf0..b1678f94dccd 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -576,6 +576,10 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	if (!dst_buf || !src_buf) {
+		dev_err(dev, "No source or destination buffer.\n");
+		goto job_unlock;
+	}
 	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
 
 	if (dec_ret & SLOT_STATUS_ENC_CONFIG_ERR) {
-- 
2.25.1

