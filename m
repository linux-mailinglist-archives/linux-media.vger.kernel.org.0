Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A77419EB4
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 20:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhI0S5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 14:57:43 -0400
Received: from mail-db8eur05on2088.outbound.protection.outlook.com ([40.107.20.88]:28736
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234406AbhI0S5j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 14:57:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VovOhFSc94vDDc559ZbHHmenTD8+MtF+B+fKwny35RhQpO3BABIpDXO75oq4jwgWY2EzwMmDJc8GGjb6V07lmxRvBgMvX6FXfjaRuLvWzZkMpnCDGmc2tbiZ24GNeCay86flx1bW1SCVeMhjJTIiZzXX6qdQmT2Ex5NqC0CwvQ19xrJY0O1YHhFbvK+arFjDVR3Glk5I4cRpS/qd0KX/cnsMUYfuUWWXAOvnA4rpWddwKnnf2RPEtnEUGuaEbc+WAL+qHE/l6XdwX3rvbcduhzCSbeIPBuBFEyGGvoSCdntamMveBP5YTtVqPuB7BVoA0d3BHtZCzykSii3yUub2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Pxoon18dmOfOFHAQ7dXbLfA3MleUYezvCML6fb1nzrM=;
 b=RntKoGiaY/vTaWAK9UYFTc6p7eWK7Y/v7ifRsvbtUnTVXASdgo3weg4efQJbv5Q3pk7UAAsrEoOOQV6HloPDR1dRXf1hYhq8KKV032x6hbTreiP0TqhEeMHeWtJaQjS18sJVBWOWi3pZMuaFLjLjaQ0ZYqcClumXx2Uj0kzGqAjvUbBJb6/Z+nRp99x01l99boo7hNYkqS80BcDQESdGDdVjH/vnmTMLyxrJmRWX13puqpY0nzpDPHgXqYNsTCP4nHLOWEsTVWe7yacxDRKlKnzxEE6GS5zC2NmIuhgGT9ycvnw+bDxte7agQuROLVal2ssT9V33BnUNNDifRmL5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pxoon18dmOfOFHAQ7dXbLfA3MleUYezvCML6fb1nzrM=;
 b=m/i/btohSK8fobsd92UqmnRV4O3pOTIU/hxrEM/0SXpHOfiEcpHamc1Ayowf7h26MUC2gqGnAw8r8DLYFeLI6n5gOSEPVUTBU1HUl7kfL0vvsZbvVugl/4F+9/Go7AWsin5o1epTJlxY5dpDaKOnCHSJyDPRcJSo2XSDwWktH3s=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com (10.168.63.15) by
 VI1PR0401MB2287.eurprd04.prod.outlook.com (10.169.136.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.20; Mon, 27 Sep 2021 18:55:59 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810%3]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 18:55:59 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com
Cc:     linux-imx@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Add pm-runtime support for imx-jpeg
Date:   Mon, 27 Sep 2021 21:55:47 +0300
Message-Id: <20210927185547.3094607-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0148.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::41) To VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15)
MIME-Version: 1.0
Received: from localhost.localdomain (86.124.168.147) by VI1PR06CA0148.eurprd06.prod.outlook.com (2603:10a6:803:a0::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 18:55:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ededbb03-1290-4de5-a6df-08d981e87188
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22875045CE78F44866F3B6C88FA79@VI1PR0401MB2287.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujqB1QfE0uqwmc2XEs+r3OQ/Pm6sFIJoUBuJGhNK/viJ2+u+GhhHkV9+qV/8WUHeInyN/aAY+p4uZWkmecwzo301aPIZa9c53LME/EmIVf843UQiJAAjPC0OUk/PDDvjVvd0QOapmCgAT0hbC1bYtHNk7iJUrOK+sHymNpgqE3EtG4HX82rcJhxO4uU9w2U5pw05ntV6d0RUBN6r4MKmyhymX/cmcjLznRMDFLbOUlA9VvUKqWfGIE9Su/8qa4pBT4Xr0e6AI9ybA4iWOXIoFrsk7enakXRoCkncJzz/5e1oMlXteKeqk6JYlh6HOS3WCRfA+H+0ODCASEa8//vqzIFywdWCvk2J3BSoWEAdQUBli0k5g+2Sgxrze50lv06zugeJi1uSqH0d56fMyBhL1SvUT7nAiCANknIQvnMkkBcnPv7U40Vt8PZ+weQ1N9Dzol366lTJq54KlhnUSSisuIHpKCOVRcg2Q9MXUoRInv6nw3LQE/CQfSGxpu8X3j4UoxiAd/ly0zkI8DtzMjuoFlm8NMo/i7Id76gyZCJ35AiTtH1GJQFQ2SHMOFHkdGGHvecTH95EGXPeDMG/MGCP9g7/Kyzo8NT3zYymaD7bR8j4ay4x4ckNmY62wRgECc1fcuDuG2FPRdvnRFSy3OAX663qECv6fOXg4qOI50nmD74uVPauWGW2rQVuDl9/atReNq5mCISwEhYEhsMRufiaOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(2906002)(6666004)(38350700002)(6486002)(83380400001)(6636002)(38100700002)(1076003)(26005)(36756003)(6506007)(66476007)(66556008)(5660300002)(66946007)(186003)(86362001)(508600001)(8676002)(8936002)(6512007)(52116002)(4326008)(956004)(316002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tC55sojPxPCIsSfzklw6avk2d1p/dtd6tW836ZBCYHOPf7dkShdDAXRqYSLH?=
 =?us-ascii?Q?QvFizDaO4oYE3K0/S3m8neEBbw677YIOCyMTAur0czolpn6wiwxSRwI94C6W?=
 =?us-ascii?Q?fjmb/XwtxoqeupagtcQqUjtyighldM6RIiBTT17rE8TPYLCclONWzqNPpp0y?=
 =?us-ascii?Q?N/2sMuHSgAkwMIhAmGQn0E+EpalxXLbqkYMqj/mJ2pKblE0+sZH67N+sdED+?=
 =?us-ascii?Q?mNRnmTg+zx0TYga+09q5lf45cxXQjkJ7ULb6IkRgACvSjuHtlQEPhYw4GL2u?=
 =?us-ascii?Q?89WXmCG4wRVvq2c1hZ8iyFGqdOXT2+9U+fmfbZ6uG6f+QxMwWD6g86FxIVfI?=
 =?us-ascii?Q?GkT+XAygE3EbtpohEeshl3GfZGvY2nUODZZUY/89HmVEnNjjfZIcNhau3pr7?=
 =?us-ascii?Q?Fs2xXUyqQrrPVeORqWZoJxLM063OB3mRdQLvHi6z6ctiu8JVfIdcCQmnt/vq?=
 =?us-ascii?Q?h9O+XTfdghIcVlIN6Qq/CC/jSPSVfqC5/XNtopB3Z0X68+1eR3/yeibIY1gg?=
 =?us-ascii?Q?/4jCiGtNSs3ofqpQeBuPCJ3WcxrHX6IXuGufzkNe76Kem6xnKrUTackiJq7n?=
 =?us-ascii?Q?/y8OPg++dpNafSeXUi5pygQ8NMRg598fLg47JlykymCNfjFGlQCAhHGhPhxC?=
 =?us-ascii?Q?onctN6jvJDB09DqosHzcSZDy34ZyWjTvH/97UI6beqXI/8wZxnDOsS/9m7o6?=
 =?us-ascii?Q?+hF1fcSJqmOsAANepCGNPQpjuFUFm2sghwR8KAcvacCUnM2wx/khVBZhMMx9?=
 =?us-ascii?Q?6+HCk8HJXkXCJkfcYxEDIaPYifSePTA+rgyVU1tG+th56RgVHy3cEEC7AnTn?=
 =?us-ascii?Q?keDiw6lWez+VWFTsNhkcqEpamBot1rNbg6+z0TAMCoTyfVvHomil1lsN9/Lm?=
 =?us-ascii?Q?G24DUYJLtp5Em53NZ0483OTM+5B5B6Fer7YUyYzzhNfcTERGEMHZCTUuv88Z?=
 =?us-ascii?Q?reKiKbJvy0TlVOAF7IFmYyEpAks0ZcOJ6IjNlGuyRr67m4xFl3ly5mvnqsWI?=
 =?us-ascii?Q?gkBElC3zHefhYzUDoxezZ6g9cgYVaUteECkzkUZXQHmJUU4SlAcjhhPysiGD?=
 =?us-ascii?Q?0INdaNRA6JC9zHJ4WPgfI2EmTwd825wgc2fei5im7minIdyolKmMnnxpVT6n?=
 =?us-ascii?Q?xog1TR0v+0f1Qw5BZHkON/MgfJrBpxOL6j78QtgL1bVURQu0RWArHwEsnx8E?=
 =?us-ascii?Q?/Ah9J1l0d2EyPU7lSd9UnaJ18hswr9ev8zulysKS1xDa1h0wU72eOToAI2zh?=
 =?us-ascii?Q?E9xHXv1t9SkauiZ1yOajPPwAdD2Jx/YIEklcNHSf2tJdtrsEHI0haBgMaohS?=
 =?us-ascii?Q?bhuY28uPCzx3fwiumgT3xXQf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ededbb03-1290-4de5-a6df-08d981e87188
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 18:55:58.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDNCekVkyfZgIeicDDhIysBn+AH9/f1aYzoNMjOtA5FCjGoSeZJJXWW4eCp+SmbTJXcr5VbZDKJPvlZ4hXoGDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2287
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@oss.nxp.com>

Save some power by disabling/enabling the jpeg clocks with
every stream stop/start.

Signed-off-by: Mirela Rabulea <mirela.rabulea@oss.nxp.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 79 +++++++++++++++++++++-
 drivers/media/platform/imx-jpeg/mxc-jpeg.h |  2 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 73e73b6f2e5b..2e1fef88cdf0 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -49,6 +49,7 @@
 #include <linux/slab.h>
 #include <linux/irqreturn.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/string.h>
 
@@ -1058,10 +1059,17 @@ static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, q->type);
+	int ret;
 
 	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
 	q_data->sequence = 0;
 
+	ret = pm_runtime_get_sync(ctx->mxc_jpeg->dev);
+	if (ret < 0) {
+		dev_err(ctx->mxc_jpeg->dev, "Failed to power up jpeg\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1079,9 +1087,10 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
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
@@ -1461,6 +1470,12 @@ static int mxc_jpeg_open(struct file *file)
 		goto free;
 	}
 
+	ret = pm_runtime_get_sync(mxc_jpeg->dev);
+	if (ret < 0) {
+		dev_err(ctx->mxc_jpeg->dev, "Failed to power up jpeg\n");
+		goto error_pm;
+	}
+
 	v4l2_fh_init(&ctx->fh, mxc_vfd);
 	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
@@ -1487,8 +1502,10 @@ static int mxc_jpeg_open(struct file *file)
 	return 0;
 
 error:
+	pm_runtime_put_sync(mxc_jpeg->dev);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
+error_pm:
 	mutex_unlock(&mxc_jpeg->lock);
 free:
 	kfree(ctx);
@@ -1875,6 +1892,7 @@ static int mxc_jpeg_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
+	pm_runtime_put_sync(mxc_jpeg->dev);
 	kfree(ctx);
 	mutex_unlock(&mxc_jpeg->lock);
 
@@ -2005,6 +2023,19 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
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
@@ -2073,6 +2104,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 			  jpeg->dec_vdev->minor);
 
 	platform_set_drvdata(pdev, jpeg);
+	pm_runtime_enable(dev);
 
 	return 0;
 
@@ -2089,9 +2121,52 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	mxc_jpeg_detach_pm_domains(jpeg);
 
 err_irq:
+err_clk:
 	return ret;
 }
 
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
+	return ret;
+}
+
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
@@ -2100,6 +2175,7 @@ static int mxc_jpeg_remove(struct platform_device *pdev)
 	for (slot = 0; slot < MXC_MAX_SLOTS; slot++)
 		mxc_jpeg_free_slot_data(jpeg, slot);
 
+	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->dec_vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
@@ -2116,6 +2192,7 @@ static struct platform_driver mxc_jpeg_driver = {
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

