Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72435102C1
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfD3Wuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:50:32 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34290 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727632AbfD3Wuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:50:32 -0400
Received: by mail-pl1-f194.google.com with SMTP id ck18so3123554plb.1;
        Tue, 30 Apr 2019 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vh+f8bdLjY+HSfSVBVy8Lc/Hv+xFPxT6P6Duza4D9HA=;
        b=QWF1Brivv6UYPTfnGYxh65xCPC355OfYFV4gRXatH6/B8ysnJyxlopK6fDa/AlFt7y
         UirQeeopbmjHzhIRlfJi5llLDU+USeQn7qCKhj4h6F8OvgXR8bHfRYEh8WZUyhOCZ50j
         yV+74quXCpLkEcelg2bMUtVSF8xrcUT4jFeF1Qm1bk6n6B3rm3CIwqMfi5ert4gW3o/H
         ubSNTTti+IYFghxXV4uGegFfbBk9NN+xmAV7fBUqHmPPiK1ooLjN+dVUS7nTcCzK7ssy
         QySHADfiSXRxdAnS4x+lCinazqHS6v8BRxphg6XMPF4z630YdAR+IBrIFsrSJ3xyodB5
         mxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vh+f8bdLjY+HSfSVBVy8Lc/Hv+xFPxT6P6Duza4D9HA=;
        b=GTgi/emF96r+JHQiX5qrHsE9CQcLBEmOjd0++/do4z0Hnaj2OD1a8z2ibkga0irJl3
         1fHgYkXSVsjooPhMsH+1vC1ne6bVN6EpoPGzhtUf/dvNWN3Vz0TpJ77GVrT6/tIgETnn
         TDRdaFsdOp/iRs3vdTPqskeGcBYOEshARDCa84IV+U1I4j3UMSi9aI7yidzc4QL64zK/
         Q6c3MRoHJ9KkAsLxzNf7sccuSSYRjtdkDPL8l/lpE/G9iY8EXQr0HYze4+C6cPMlI432
         M82GU8GYqWv9g0nVeBdqY6gCCGDqpoAqFMJmCz+PC6LOa2Gogj/Niyfdj/ROQxptjd9k
         1PRg==
X-Gm-Message-State: APjAAAVcKazMJcvZcJFp4x7UZeLMuJb7h4I1WHUpjrzmATpGRiYtKh7+
        XcT/xnFyYuJJ7ENtf0XNdUPr+HmL
X-Google-Smtp-Source: APXvYqzgxHH9h0Pzqxdp8sUAXY2Vm1yvlKg4e5WXIJfSkWgSCE6OMbeTB40i15/ZOtYF2sgg2pE4BQ==
X-Received: by 2002:a17:902:9a95:: with SMTP id w21mr73614035plp.74.1556664631158;
        Tue, 30 Apr 2019 15:50:31 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id l23sm9804654pgj.36.2019.04.30.15.50.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:50:30 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/8] media: staging/imx: Pass device to alloc/free_dma_buf
Date:   Tue, 30 Apr 2019 15:50:12 -0700
Message-Id: <20190430225018.30252-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430225018.30252-1-slongerbeam@gmail.com>
References: <20190430225018.30252-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allocate and free a DMA coherent buffer in imx_media_alloc/free_dma_buf()
from the given device. This allows DMA alloc and free using a device
that is backed by real hardware, which for the imx5/6/7 CSI is the CSI
unit, and for the internal IPU sub-devices, is the parent IPU.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 18 +++++++++---------
 drivers/staging/media/imx/imx-media-csi.c   |  6 +++---
 drivers/staging/media/imx/imx-media-utils.c | 13 ++++++-------
 drivers/staging/media/imx/imx-media.h       |  4 ++--
 drivers/staging/media/imx/imx7-media-csi.c  |  4 ++--
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 069cce512280..ddcd87a17c71 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -464,13 +464,13 @@ static int prp_setup_rotation(struct prp_priv *priv)
 	incc = priv->cc[PRPENCVF_SINK_PAD];
 	outcc = vdev->cc;
 
-	ret = imx_media_alloc_dma_buf(ic_priv->md, &priv->rot_buf[0],
+	ret = imx_media_alloc_dma_buf(ic_priv->ipu_dev, &priv->rot_buf[0],
 				      outfmt->sizeimage);
 	if (ret) {
 		v4l2_err(&ic_priv->sd, "failed to alloc rot_buf[0], %d\n", ret);
 		return ret;
 	}
-	ret = imx_media_alloc_dma_buf(ic_priv->md, &priv->rot_buf[1],
+	ret = imx_media_alloc_dma_buf(ic_priv->ipu_dev, &priv->rot_buf[1],
 				      outfmt->sizeimage);
 	if (ret) {
 		v4l2_err(&ic_priv->sd, "failed to alloc rot_buf[1], %d\n", ret);
@@ -543,9 +543,9 @@ static int prp_setup_rotation(struct prp_priv *priv)
 unsetup_vb2:
 	prp_unsetup_vb2_buf(priv, VB2_BUF_STATE_QUEUED);
 free_rot1:
-	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[1]);
+	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->rot_buf[1]);
 free_rot0:
-	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[0]);
+	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->rot_buf[0]);
 	return ret;
 }
 
@@ -563,8 +563,8 @@ static void prp_unsetup_rotation(struct prp_priv *priv)
 
 	ipu_ic_disable(priv->ic);
 
-	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[0]);
-	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[1]);
+	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->rot_buf[0]);
+	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->rot_buf[1]);
 }
 
 static int prp_setup_norotation(struct prp_priv *priv)
@@ -656,7 +656,7 @@ static int prp_start(struct prp_priv *priv)
 
 	outfmt = &vdev->fmt.fmt.pix;
 
-	ret = imx_media_alloc_dma_buf(ic_priv->md, &priv->underrun_buf,
+	ret = imx_media_alloc_dma_buf(ic_priv->ipu_dev, &priv->underrun_buf,
 				      outfmt->sizeimage);
 	if (ret)
 		goto out_put_ipu;
@@ -726,7 +726,7 @@ static int prp_start(struct prp_priv *priv)
 out_unsetup:
 	prp_unsetup(priv, VB2_BUF_STATE_QUEUED);
 out_free_underrun:
-	imx_media_free_dma_buf(ic_priv->md, &priv->underrun_buf);
+	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->underrun_buf);
 out_put_ipu:
 	prp_put_ipu_resources(priv);
 	return ret;
@@ -763,7 +763,7 @@ static void prp_stop(struct prp_priv *priv)
 
 	prp_unsetup(priv, VB2_BUF_STATE_ERROR);
 
-	imx_media_free_dma_buf(ic_priv->md, &priv->underrun_buf);
+	imx_media_free_dma_buf(ic_priv->ipu_dev, &priv->underrun_buf);
 
 	/* cancel the EOF timeout timer */
 	del_timer_sync(&priv->eof_timeout_timer);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 93b107eab5f5..ea3d13103c91 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -612,7 +612,7 @@ static int csi_idmac_start(struct csi_priv *priv)
 
 	outfmt = &vdev->fmt.fmt.pix;
 
-	ret = imx_media_alloc_dma_buf(priv->md, &priv->underrun_buf,
+	ret = imx_media_alloc_dma_buf(priv->dev, &priv->underrun_buf,
 				      outfmt->sizeimage);
 	if (ret)
 		goto out_put_ipu;
@@ -666,7 +666,7 @@ static int csi_idmac_start(struct csi_priv *priv)
 out_unsetup:
 	csi_idmac_unsetup(priv, VB2_BUF_STATE_QUEUED);
 out_free_dma_buf:
-	imx_media_free_dma_buf(priv->md, &priv->underrun_buf);
+	imx_media_free_dma_buf(priv->dev, &priv->underrun_buf);
 out_put_ipu:
 	csi_idmac_put_ipu_resources(priv);
 	return ret;
@@ -698,7 +698,7 @@ static void csi_idmac_stop(struct csi_priv *priv)
 
 	csi_idmac_unsetup(priv, VB2_BUF_STATE_ERROR);
 
-	imx_media_free_dma_buf(priv->md, &priv->underrun_buf);
+	imx_media_free_dma_buf(priv->dev, &priv->underrun_buf);
 
 	/* cancel the EOF timeout timer */
 	del_timer_sync(&priv->eof_timeout_timer);
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1c63a2765a81..c52aa59acd05 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -679,29 +679,28 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 }
 EXPORT_SYMBOL_GPL(imx_media_ipu_image_to_mbus_fmt);
 
-void imx_media_free_dma_buf(struct imx_media_dev *imxmd,
+void imx_media_free_dma_buf(struct device *dev,
 			    struct imx_media_dma_buf *buf)
 {
 	if (buf->virt)
-		dma_free_coherent(imxmd->md.dev, buf->len,
-				  buf->virt, buf->phys);
+		dma_free_coherent(dev, buf->len, buf->virt, buf->phys);
 
 	buf->virt = NULL;
 	buf->phys = 0;
 }
 EXPORT_SYMBOL_GPL(imx_media_free_dma_buf);
 
-int imx_media_alloc_dma_buf(struct imx_media_dev *imxmd,
+int imx_media_alloc_dma_buf(struct device *dev,
 			    struct imx_media_dma_buf *buf,
 			    int size)
 {
-	imx_media_free_dma_buf(imxmd, buf);
+	imx_media_free_dma_buf(dev, buf);
 
 	buf->len = PAGE_ALIGN(size);
-	buf->virt = dma_alloc_coherent(imxmd->md.dev, buf->len, &buf->phys,
+	buf->virt = dma_alloc_coherent(dev, buf->len, &buf->phys,
 				       GFP_DMA | GFP_KERNEL);
 	if (!buf->virt) {
-		dev_err(imxmd->md.dev, "failed to alloc dma buffer\n");
+		dev_err(dev, "%s: failed\n", __func__);
 		return -ENOMEM;
 	}
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index fadde3435cb7..ba2d75bcc4c9 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -208,9 +208,9 @@ struct imx_media_dma_buf {
 	unsigned long  len;
 };
 
-void imx_media_free_dma_buf(struct imx_media_dev *imxmd,
+void imx_media_free_dma_buf(struct device *dev,
 			    struct imx_media_dma_buf *buf);
-int imx_media_alloc_dma_buf(struct imx_media_dev *imxmd,
+int imx_media_alloc_dma_buf(struct device *dev,
 			    struct imx_media_dma_buf *buf,
 			    int size);
 
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 95f3808762b4..96d01d8af874 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -714,7 +714,7 @@ static int imx7_csi_dma_start(struct imx7_csi *csi)
 	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
 	int ret;
 
-	ret = imx_media_alloc_dma_buf(csi->imxmd, &csi->underrun_buf,
+	ret = imx_media_alloc_dma_buf(csi->dev, &csi->underrun_buf,
 				      out_pix->sizeimage);
 	if (ret < 0) {
 		v4l2_warn(&csi->sd, "consider increasing the CMA area\n");
@@ -754,7 +754,7 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 
 	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
 
-	imx_media_free_dma_buf(csi->imxmd, &csi->underrun_buf);
+	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
 }
 
 static int imx7_csi_configure(struct imx7_csi *csi)
-- 
2.17.1

