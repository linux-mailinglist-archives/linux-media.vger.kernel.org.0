Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0579BED7
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 18:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfHXQdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Aug 2019 12:33:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39237 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbfHXQdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Aug 2019 12:33:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id y200so1075567pfb.6;
        Sat, 24 Aug 2019 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a52LL9oOVeDhR4hSsY0aF1GKRUMgQp010/HR2Nt7Nf4=;
        b=gpWLBfbiWuA2daHFK577ZK/G3XcKDVgGuZpd93XsBGl7fjev9r5/CUOEqOdkigt1tp
         6/FV9TYzQDBxOVfRxgUJizQmtZgrMgr0dXVsPjo8V1Eyc36nQZgvQClfLluvoEGE/yLe
         acprirszszQCoi9Z7Jc6t1ZXphLPTs1SzFMh8kyotZ3Xh9J0gZBz4fRfNImBsQ0gi0J4
         eJWqlqsfwP60pUrdfgPmKnkR0pSxpk2dirPNCvM1Duq0MzSLeBdkjOjCeIXn25LQCFO0
         Ssy8avSONmbR3Aoc5ZtBIoVOg24prKtG+YLO723uOrvQJm/w9Y3Opcz1MvCAor4LbirQ
         b06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a52LL9oOVeDhR4hSsY0aF1GKRUMgQp010/HR2Nt7Nf4=;
        b=JZJEAcddkNHIKHz0F3FMrz/S7KR8UTQfPYlPMmujr1WWujFKDr7+JuCF6yPFwUX+Ie
         h5Mrb0sBBnXyA97+rW9VQiZTXqNO1EkEpIM/rFCVMk7cBpYa5zofqrEUGD3os5HNCl5m
         OtxRrnb5ZXzWvigy46Vzz2FRgCgg5FK7Up09z1Tuj8BDhFDWBcASIEzgdpwRx++6fu2Y
         ER9op9fL0sT9+IVjcJ7YY8ex+Y6acqr3nq9W3A7RYvMaWM2MONszGm0qs9cebLwuhTZx
         zEVo+jSNtMxuvpew2+xmHkFQZxHctJ3fCgVjGfrprjGizstWtJo8mJEnrJKN19so7VId
         WvnA==
X-Gm-Message-State: APjAAAXuS2lzmkVbGwakQmvyqAfaOjllRk7dbKaqxOQtgfYo9u6j4Mjg
        U449rXATvJvEWEQSIj1krEaYHZGD
X-Google-Smtp-Source: APXvYqzkQNNfP4fETTxT3Z9RJM/LeuRq0YUyzcdRGs94doJUqceHlT+fRtU/sSnoIKtuelGIZmyETw==
X-Received: by 2002:a17:90a:d34f:: with SMTP id i15mr11342285pjx.42.1566664424553;
        Sat, 24 Aug 2019 09:33:44 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id k3sm5733018pjo.3.2019.08.24.09.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 09:33:44 -0700 (PDT)
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
Subject: [PATCH v2 1/2] media: imx: Move capture device init to registered
Date:   Sat, 24 Aug 2019 09:33:36 -0700
Message-Id: <20190824163337.8260-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190824163337.8260-1-slongerbeam@gmail.com>
References: <20190824163337.8260-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the CSI is unregistered and then registered again without the
driver being removed and re-probed (which will happen when the media
device is removed and re-probed without also removing/re-probing the
CSI), the result is the kobject error and backtrace "tried to init an
initialized object". This is because the video device is left in an
initialized state after being unregistered, thus the video device's
underlying kobject is also left in an initialized state when the device
is registered again.

Fix this by moving imx_media_capture_device_init() and _remove()
into csi_registered() and csi_unregistered(). This will create a new
un-initialized video device when the CSI is re-registered. Do this for
all the subdevices that register a capture device.

Reported-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v2:
Add missing local var ic_priv in prp_registered().
Reported-by: kbuild test robot <lkp@intel.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 25 ++++++++++++---------
 drivers/staging/media/imx/imx-media-csi.c   | 20 ++++++++++-------
 drivers/staging/media/imx/imx7-media-csi.c  | 22 +++++++++---------
 3 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 67ffa46a8e96..f8a0b21fcd02 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1246,6 +1246,7 @@ static int prp_s_frame_interval(struct v4l2_subdev *sd,
 static int prp_registered(struct v4l2_subdev *sd)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
+	struct imx_ic_priv *ic_priv = priv->ic_priv;
 	int i, ret;
 	u32 code;
 
@@ -1271,17 +1272,26 @@ static int prp_registered(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
+	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
+						   &ic_priv->sd,
+						   PRPENCVF_SRC_PAD);
+	if (IS_ERR(priv->vdev))
+		return PTR_ERR(priv->vdev);
+
 	ret = imx_media_capture_device_register(priv->vdev);
 	if (ret)
-		return ret;
+		goto remove_vdev;
 
 	ret = prp_init_controls(priv);
 	if (ret)
-		goto unreg;
+		goto unreg_vdev;
 
 	return 0;
-unreg:
+
+unreg_vdev:
 	imx_media_capture_device_unregister(priv->vdev);
+remove_vdev:
+	imx_media_capture_device_remove(priv->vdev);
 	return ret;
 }
 
@@ -1290,6 +1300,8 @@ static void prp_unregistered(struct v4l2_subdev *sd)
 	struct prp_priv *priv = sd_to_priv(sd);
 
 	imx_media_capture_device_unregister(priv->vdev);
+	imx_media_capture_device_remove(priv->vdev);
+
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 }
 
@@ -1336,12 +1348,6 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	spin_lock_init(&priv->irqlock);
 	timer_setup(&priv->eof_timeout_timer, prp_eof_timeout, 0);
 
-	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
-						   &ic_priv->sd,
-						   PRPENCVF_SRC_PAD);
-	if (IS_ERR(priv->vdev))
-		return PTR_ERR(priv->vdev);
-
 	mutex_init(&priv->lock);
 
 	return 0;
@@ -1352,7 +1358,6 @@ static void prp_remove(struct imx_ic_priv *ic_priv)
 	struct prp_priv *priv = ic_priv->task_priv;
 
 	mutex_destroy(&priv->lock);
-	imx_media_capture_device_remove(priv->vdev);
 }
 
 struct imx_ic_ops imx_ic_prpencvf_ops = {
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 367e39f5b382..b3f1cf08a102 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1797,12 +1797,22 @@ static int csi_registered(struct v4l2_subdev *sd)
 	if (ret)
 		goto free_fim;
 
+	priv->vdev = imx_media_capture_device_init(priv->sd.dev,
+						   &priv->sd,
+						   CSI_SRC_PAD_IDMAC);
+	if (IS_ERR(priv->vdev)) {
+		ret = PTR_ERR(priv->vdev);
+		goto free_fim;
+	}
+
 	ret = imx_media_capture_device_register(priv->vdev);
 	if (ret)
-		goto free_fim;
+		goto remove_vdev;
 
 	return 0;
 
+remove_vdev:
+	imx_media_capture_device_remove(priv->vdev);
 free_fim:
 	if (priv->fim)
 		imx_media_fim_free(priv->fim);
@@ -1816,6 +1826,7 @@ static void csi_unregistered(struct v4l2_subdev *sd)
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 
 	imx_media_capture_device_unregister(priv->vdev);
+	imx_media_capture_device_remove(priv->vdev);
 
 	if (priv->fim)
 		imx_media_fim_free(priv->fim);
@@ -1963,11 +1974,6 @@ static int imx_csi_probe(struct platform_device *pdev)
 	imx_media_grp_id_to_sd_name(priv->sd.name, sizeof(priv->sd.name),
 				    priv->sd.grp_id, ipu_get_num(priv->ipu));
 
-	priv->vdev = imx_media_capture_device_init(priv->sd.dev, &priv->sd,
-						   CSI_SRC_PAD_IDMAC);
-	if (IS_ERR(priv->vdev))
-		return PTR_ERR(priv->vdev);
-
 	mutex_init(&priv->lock);
 
 	v4l2_ctrl_handler_init(&priv->ctrl_hdlr, 0);
@@ -1997,7 +2003,6 @@ static int imx_csi_probe(struct platform_device *pdev)
 free:
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
-	imx_media_capture_device_remove(priv->vdev);
 	return ret;
 }
 
@@ -2008,7 +2013,6 @@ static int imx_csi_remove(struct platform_device *pdev)
 
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
-	imx_media_capture_device_remove(priv->vdev);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 4ca79ff4c9b3..b61ab16a337a 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1119,7 +1119,16 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	return imx_media_capture_device_register(csi->vdev);
+	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
+						  IMX7_CSI_PAD_SRC);
+	if (IS_ERR(csi->vdev))
+		return PTR_ERR(csi->vdev);
+
+	ret = imx_media_capture_device_register(csi->vdev);
+	if (ret)
+		imx_media_capture_device_remove(csi->vdev);
+
+	return ret;
 }
 
 static void imx7_csi_unregistered(struct v4l2_subdev *sd)
@@ -1127,6 +1136,7 @@ static void imx7_csi_unregistered(struct v4l2_subdev *sd)
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 
 	imx_media_capture_device_unregister(csi->vdev);
+	imx_media_capture_device_remove(csi->vdev);
 }
 
 static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
@@ -1253,11 +1263,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	csi->sd.grp_id = IMX_MEDIA_GRP_ID_CSI;
 	snprintf(csi->sd.name, sizeof(csi->sd.name), "csi");
 
-	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
-						  IMX7_CSI_PAD_SRC);
-	if (IS_ERR(csi->vdev))
-		return PTR_ERR(csi->vdev);
-
 	v4l2_ctrl_handler_init(&csi->ctrl_hdlr, 0);
 	csi->sd.ctrl_handler = &csi->ctrl_hdlr;
 
@@ -1271,8 +1276,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	return 0;
 
 free:
-	imx_media_capture_device_unregister(csi->vdev);
-	imx_media_capture_device_remove(csi->vdev);
 	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
 cleanup:
@@ -1300,9 +1303,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_cleanup(&imxmd->md);
 
-	imx_media_capture_device_unregister(csi->vdev);
-	imx_media_capture_device_remove(csi->vdev);
-
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
-- 
2.17.1

