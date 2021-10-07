Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3B04257F9
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 18:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbhJGQcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 12:32:47 -0400
Received: from mail-db8eur05on2056.outbound.protection.outlook.com ([40.107.20.56]:11104
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233610AbhJGQcr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 12:32:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMVjdF1bs9vxz/AzJu7VjjSqV5lIf2Qxf2vAf07RvR1AwLcEEpe37eQCrVrJ55OlhOvcMQmpEgH6Lsi7q+80QgZMtu2dNtSQ7aDxyGfoO1Uz+j4ua14ggy/BmhipgKz1yI1yE2amd9kohKN6cgEyf4M104Qx3DxSi+oKDR5r/FHXtc/fXEwRHZo07h3b/ueUUuGeGUSNat5cexdyWiJL17+SBNjEr4EVnsiD6umU52IvvzZv6cClvuWNXiV2JNapiYbFGq089wEVpSRrroOkXAry/MudF68wbDNAv2MJS/qXHYiSZc7fi2/YsWK2Ybd79GgPSRaiSx9puQ5df7AZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnWeePLCwgiEqMTK8Kwye2vx5/xcXzOPfRQnKuIFgkk=;
 b=YhVfDDNN+lnjMS4dhfm2fT4Z34wz709TQ1ojva0WmyBi6H5N7ysxvg0SdPRih5r6utcdIfPWVC9F2VyOdPMkiR3daQk5lLc8WkrZYYMSCp1r8qG6DYfbvtac1SqqTdugrkwd7i0wRVvt5w1nN2XqaG2KUh9rSQw/OE4tY4ZoEd5ZbxO8USsfBGEkjvKCB2FcxjkcXQQSPjFYQXzOAt9FX4kcYoI9DZpKnWsi3Nxs0qXxAsqYiaqX7vvTrRsHn/6fwhe/6TDO3XhXJVbjMzx5pz8yMXKizRXINHXa+5Rr/eMtl4p3uZpSMa/yz6WRBumrIpL0WI1bs151qBNAnCXq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnWeePLCwgiEqMTK8Kwye2vx5/xcXzOPfRQnKuIFgkk=;
 b=EzzpF7nXNo99oCarBHatdcwpWaxnQvvnwIbY5MWN2c6L9M5o//e0ZD+xXW0sfO+f9FPJT5pVoBSoN/AuthmGjbROU8knUXvIYeRzV/dmi+THLsnA2g4vXO3nI8n/JZsNPtMzNr/r1oq/GmUf35rkXSDs4acbl0/Ig9KnnxbKsLM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15) by VI1PR0401MB2496.eurprd04.prod.outlook.com
 (2603:10a6:800:56::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 16:30:49 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810%3]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 16:30:49 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com
Cc:     linux-imx@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: imx-jpeg: Add pm-runtime support for imx-jpeg
Date:   Thu,  7 Oct 2021 19:30:38 +0300
Message-Id: <20211007163038.540951-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::25) To VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15)
MIME-Version: 1.0
Received: from localhost.localdomain (86.124.168.147) by VI1P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 16:30:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 440ba4be-224c-4288-3b40-08d989afd235
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB249649605A4D1085F21A9AFE8FB19@VI1PR0401MB2496.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGiudEStiWDsc0fVLlExR1Fgx3GdrVM5aBQ1H8pD+msd2oocOEYA9/szsiITk0oJc41AD5JNv+v6h1ZuJBvdqvfGmsBmV1b4rlRSkeMQqBYfaaB2gk+aTUpByUTL6prAGCJ6bMe0REzIrcWL7pQqFp+jrbIzH4LriHcDYcLlqj1aUzbNQMgVDB6SR4lHjggPVe2Uo7rN3XdX+FkYOa3W7MRZ9ZYdJFEj6JtYxJe2ed8lj4zIzoQr071/MvPe5Jtl4cOoG3kQviCYYSXbxokixVhTwInCzVQ4xaFSyrupPLQqvri4TUvu7c4qC6IIhviRGXbXCvhzEGjMEZczyK3vCPOHLNK6sgbal+9v2R8Q/ZBUGNOyGp2nE7ptzZoqFwb5UKQHInjcz64kOKKnKT1Osip19W+uQRDoDZlWc3EwDW9ZwkaIeW3so4WU9H9hlhFdlex7dlQksywMpxDPqV96M9vY8fxBBdpwERvUeu9mcA0DA4UirTRBY8ac00my5YH+Kah6o16gykggggdHj0i9rFGvZe0FrD0BW74GG2/ifC0FkyIYAS+aEaadQsNSyBZpcUFGpT83lF6uJpt0aCIsfM83ALf3Qh5LYn9DNTgegggnwxoFY0VuUKUubwsEeHj0xDJi1n8JZTYNpo9+3pDVDONlCnJG1piXYAtFaMeyH5cOR0TCL4DLi4Eh1pw7V3//qVtG0I8VsQrRFb9/h57RTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(38100700002)(1076003)(5660300002)(36756003)(2616005)(6512007)(956004)(44832011)(83380400001)(508600001)(6666004)(6636002)(6506007)(316002)(52116002)(26005)(66556008)(66476007)(8936002)(6486002)(4326008)(66946007)(2906002)(186003)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x2UH9FgHt5IdjAvDSNl/jHniS/219Q5FnqC/t1I8BS0uHaeGFwtifZClZ7Mt?=
 =?us-ascii?Q?63lxeHwtFU09qF3zVV9mLR1gZinROM2PaUVag0AncnZPYBgH0yWr22dm64WT?=
 =?us-ascii?Q?Ahx5QCReVynB9yRiQmkJM6HMULQXozeq1Y2vMECuI8BAyigmgNzHia2TPks2?=
 =?us-ascii?Q?ZR69tFRbEJZjpGSdE6r7WPl3qd5GDgTb4SWmcLL+uc3DElnT3kFm8LzKielW?=
 =?us-ascii?Q?yTaYGWWVi1JBLOeqrK9TQZWNQ4QUlvbDLYzJGGCiJmtosoeizwTTOi8wv91b?=
 =?us-ascii?Q?9fnnc3+O0i172SqSF8W/g/x7QIoN9LljcS2O/NwRYYy/lIngWiUq2O0xLwDC?=
 =?us-ascii?Q?qCjm0kPsMGKglnJ+nqgkqVf0w2vH1G/FRdA5tF1u/QOqA8XVn2mpgorNLInT?=
 =?us-ascii?Q?ogrfL4gs/QghAqrQEoX/vJWHHFACgUZUF+JF50cEHCXBeQsTyBvBdjK//mnP?=
 =?us-ascii?Q?fNrpHoJbsawDvBw7nAfnBFxQj7AJQ1wQYu9gEwQgKelTuOYpWDJtd1f+41DB?=
 =?us-ascii?Q?J57INNIcrmtAhHs+zMG4si0B/znCcoYng2wcGMIDiRxKWWr9Sb4kblA0ADwB?=
 =?us-ascii?Q?Ei5Cil24KkdpLi8dEkIT7qp58qQ2EsH0jnU0gbcpF6nAU80FtTwt7HWxxd+B?=
 =?us-ascii?Q?zjvhmYsNXiKGjBnTRJ68RKU7ez+6DdPqusYa9ps/hZ28GxMFbHnOF2Jy0xSG?=
 =?us-ascii?Q?275V44fIzEdBV2Wrps1gOiTF6f/bqbeNZMOE6wOI42e7/tRd4DDot5bndk9H?=
 =?us-ascii?Q?GPVsp1bEUTsrm2UioN3Yh9sR3/QgZGA5n5gHU+SmdgOO4kW9QtJD2qpl9huH?=
 =?us-ascii?Q?2H4emJsBAKTfcejspv+WTx0DulkD5o99ZOyKjOUDJx0qWT6dQh1OINNaGpO/?=
 =?us-ascii?Q?QGHWoH03bkkGZlrFzoTb4/JNg+oJRmo+ukiJGEf1DD9TWV2AnNhVndqpJWB4?=
 =?us-ascii?Q?ZmgTj2+K1e5vEDgAnbWW+uuSv3BGbfLKTiRz95iKM1PVMPcfiwslAoXj6+8+?=
 =?us-ascii?Q?buQCFx2f0Eux5tNwiFCCYUTe3WvqC2xWIP0vL0oCnu+8mFCLhxABU/3PFEeN?=
 =?us-ascii?Q?dxm9oi5iFVQC3X6B/nbb9rs2hdsTHvlFbFsqqbExL4a5FxohxnEY0WlRrmG3?=
 =?us-ascii?Q?dfGrpkUe/27qLeuWWxzkMEtAYChIjghwW02r7O9pUWFAdMv7TPdat+0oOYSY?=
 =?us-ascii?Q?TvYlWrmmM6keS1sCHqm4GsrOK0xo1jUdmYX5p+8K2vZSB3ul5SiCL4rSm4Ew?=
 =?us-ascii?Q?DH9RySWK8E76qp0UgeobBUADyFD2eJjTmkvx59BuJYm3QiTiaYTJmXY5Z4wX?=
 =?us-ascii?Q?wSh6NnCKwYJ6WYz6izCPVHL0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440ba4be-224c-4288-3b40-08d989afd235
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 16:30:49.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFcvIw1D/YMWhqOsMMtwTP328+CNwo1butOBx+kQYymRb5kN/uPplcixy59u/HM6+Cbmjp98dqy0w2nGIUFoLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2496
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@oss.nxp.com>

Save some power by disabling/enabling the jpeg clocks with
every stream stop/start.
Do not use DL_FLAG_RPM_ACTIVE in mxc_jpeg_attach_pm_domains,
to ensure power domains are off after probe.

Signed-off-by: Mirela Rabulea <mirela.rabulea@oss.nxp.com>
---
Changes in v2:
  - Use pm_runtime_resume_and_get instead of pm_runtime_get_sync. Thanks Hans, for pointing it out!
  - Drop pm_runtime get/put from mxc_jpeg_open/release. Enough to do it in stream start/stop.
  - Do not use DL_FLAG_RPM_ACTIVE in mxc_jpeg_attach_pm_domains, to ensure pd's are off after probe. This was masked by the fact that in _v1, mxc_jpeg_release was doing pm_runtime_put_sync.
  - Update commit description

 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 73 +++++++++++++++++++++-
 drivers/media/platform/imx-jpeg/mxc-jpeg.h |  2 +
 2 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index e45b0c74be55..4ca96cf9def7 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -49,6 +49,7 @@
 #include <linux/slab.h>
 #include <linux/irqreturn.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/string.h>
 
@@ -1078,10 +1079,17 @@ static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, q->type);
+	int ret;
 
 	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
 	q_data->sequence = 0;
 
+	ret = pm_runtime_resume_and_get(ctx->mxc_jpeg->dev);
+	if (ret < 0) {
+		dev_err(ctx->mxc_jpeg->dev, "Failed to power up jpeg\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1099,9 +1107,10 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
 		else
 			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		if (!vbuf)
-			return;
+			break;
 		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 	}
+	pm_runtime_put_sync(&ctx->mxc_jpeg->pdev->dev);
 }
 
 static int mxc_jpeg_valid_comp_id(struct device *dev,
@@ -1961,8 +1970,7 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
 
 		jpeg->pd_link[i] = device_link_add(dev, jpeg->pd_dev[i],
 						   DL_FLAG_STATELESS |
-						   DL_FLAG_PM_RUNTIME |
-						   DL_FLAG_RPM_ACTIVE);
+						   DL_FLAG_PM_RUNTIME);
 		if (!jpeg->pd_link[i]) {
 			ret = -EINVAL;
 			goto fail;
@@ -2025,6 +2033,19 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dev = dev;
 	jpeg->mode = mode;
 
+	/* Get clocks */
+	jpeg->clk_ipg = devm_clk_get(dev, "ipg");
+	if (IS_ERR(jpeg->clk_ipg)) {
+		dev_err(dev, "failed to get clock: ipg\n");
+		goto err_clk;
+	}
+
+	jpeg->clk_per = devm_clk_get(dev, "per");
+	if (IS_ERR(jpeg->clk_per)) {
+		dev_err(dev, "failed to get clock: per\n");
+		goto err_clk;
+	}
+
 	ret = mxc_jpeg_attach_pm_domains(jpeg);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach power domains %d\n", ret);
@@ -2093,6 +2114,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 			  jpeg->dec_vdev->minor);
 
 	platform_set_drvdata(pdev, jpeg);
+	pm_runtime_enable(dev);
 
 	return 0;
 
@@ -2109,9 +2131,52 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	mxc_jpeg_detach_pm_domains(jpeg);
 
 err_irq:
+err_clk:
+	return ret;
+}
+
+#ifdef CONFIG_PM
+static int mxc_jpeg_runtime_resume(struct device *dev)
+{
+	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(jpeg->clk_ipg);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable clock: ipg\n");
+		goto err_ipg;
+	}
+
+	ret = clk_prepare_enable(jpeg->clk_per);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable clock: per\n");
+		goto err_per;
+	}
+
+	return 0;
+
+err_per:
+	clk_disable_unprepare(jpeg->clk_ipg);
+err_ipg:
 	return ret;
 }
 
+static int mxc_jpeg_runtime_suspend(struct device *dev)
+{
+	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(jpeg->clk_ipg);
+	clk_disable_unprepare(jpeg->clk_per);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops	mxc_jpeg_pm_ops = {
+	SET_RUNTIME_PM_OPS(mxc_jpeg_runtime_suspend,
+			   mxc_jpeg_runtime_resume, NULL)
+};
+
 static int mxc_jpeg_remove(struct platform_device *pdev)
 {
 	unsigned int slot;
@@ -2120,6 +2185,7 @@ static int mxc_jpeg_remove(struct platform_device *pdev)
 	for (slot = 0; slot < MXC_MAX_SLOTS; slot++)
 		mxc_jpeg_free_slot_data(jpeg, slot);
 
+	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->dec_vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
@@ -2136,6 +2202,7 @@ static struct platform_driver mxc_jpeg_driver = {
 	.driver = {
 		.name = "mxc-jpeg",
 		.of_match_table = mxc_jpeg_match,
+		.pm = &mxc_jpeg_pm_ops,
 	},
 };
 module_platform_driver(mxc_jpeg_driver);
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
index 4c210852e876..9fb2a5aaa941 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
@@ -109,6 +109,8 @@ struct mxc_jpeg_dev {
 	spinlock_t			hw_lock; /* hardware access lock */
 	unsigned int			mode;
 	struct mutex			lock; /* v4l2 ioctls serialization */
+	struct clk			*clk_ipg;
+	struct clk			*clk_per;
 	struct platform_device		*pdev;
 	struct device			*dev;
 	void __iomem			*base_reg;
-- 
2.25.1

