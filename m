Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE91A4E2
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbfEJVub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:50:31 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35292 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbfEJVub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:50:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id h1so3620057pgs.2;
        Fri, 10 May 2019 14:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vh+f8bdLjY+HSfSVBVy8Lc/Hv+xFPxT6P6Duza4D9HA=;
        b=omYrEmCuTYEVBNisnGOHilpKCLVfZ+0EPVJMDoMTGG90EaJJGG5ZfJu5TpCnP0Hywz
         gpqzqzH9atDhKc6Q4rlfbIZB0DMfiHEguD/SVBi99iTyiMPzei8yoSevgtLeddyapn5A
         ogzmfWIFReFw4ahsfIv0FdjKh8NFCYdFqdhbfQ2yzzoyz9lMQ5nF6xN8EVZ8IsgdxZ/F
         IdRoaUf382n14/rEHtu8oOOThHUSarlltwi3c6tkC1JFAA6CuMfK5x4pnFxIS/he1cKM
         d7rddkUdvk3HUY/d4oYSrEcBbrxlIquK9ZthylldTvQmK+QiKcWN9fNGyfzM/JKHl2/X
         2xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vh+f8bdLjY+HSfSVBVy8Lc/Hv+xFPxT6P6Duza4D9HA=;
        b=QxoPJ8BEZ53FsJgoy8qLqxnaFnrJrNEg7700GvGQepRQGB/3sXvedd2hkx3sayG0Yo
         GC6vV07krUtfkzNSh1GYpzUrvyZrgoJ2++dwNdSK2sHpJ5Sy2E+jw+ycPvJoX00ssqgY
         GMc1uqMkmhdIPkWIZ3ShfAbtfNUYpRnXu+uQeWtSDzQK/61R2lhJq3Cx3e8k6BhHB3Te
         lc5AqIEqtQSvnnZgDQbDoeR1uSZiOg8h1klSexaPLevsUziKNeG8BjJyJGIn48GUA2fp
         hoQ7DetKttXqCHTdGhNJbXkPNfLXGN86jcl0LQ55nl3PF3swLkGa640KZj09F2sBtBhN
         II1w==
X-Gm-Message-State: APjAAAWB8Fgx77UBX8lqeKeLEc1XRaXzraz9cVsgO/KHv1XsVl+iZR9G
        zjmOzc0mvYEPwXLE6ptBKbupj+5L
X-Google-Smtp-Source: APXvYqzE7NoboN7QVvd/ywIi5lUSyJOY0NhNdqiN0TZU9lVJ1dRqAEx1Kxl+t7vOG51zJKs4LpkCxg==
X-Received: by 2002:a65:5682:: with SMTP id v2mr16603512pgs.100.1557525029703;
        Fri, 10 May 2019 14:50:29 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e14sm1524108pff.60.2019.05.10.14.50.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 14:50:28 -0700 (PDT)
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
Subject: [PATCH v5 3/9] media: staging/imx: Pass device to alloc/free_dma_buf
Date:   Fri, 10 May 2019 14:50:06 -0700
Message-Id: <20190510215012.13881-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510215012.13881-1-slongerbeam@gmail.com>
References: <20190510215012.13881-1-slongerbeam@gmail.com>
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

