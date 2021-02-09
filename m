Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F79231590A
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 23:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhBIVzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 16:55:09 -0500
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:60033
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234385AbhBIVOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 16:14:39 -0500
X-IronPort-AV: E=Sophos;i="5.81,166,1610406000"; 
   d="scan'208";a="372589600"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA; 09 Feb 2021 22:13:37 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Walls <awalls@md.metrocast.net>,
        Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Subject: [PATCH] media: use getter/setter functions
Date:   Tue,  9 Feb 2021 22:13:33 +0100
Message-Id: <20210209211333.1261893-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use getter and setter functions, for a variety of data types.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/pci/ivtv/ivtv-driver.c  |    2 +-
 drivers/media/platform/fsl-viu.c      |    6 +++---
 drivers/media/platform/pxa_camera.c   |    4 ++--
 drivers/media/radio/radio-maxiradio.c |    2 +-
 drivers/media/spi/cxd2880-spi.c       |    4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index 6e448cb3b51c..c4a069b3b9d1 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1393,7 +1393,7 @@ int ivtv_init_on_first_open(struct ivtv *itv)
 
 static void ivtv_remove(struct pci_dev *pdev)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&pdev->dev);
+	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
 	struct ivtv *itv = to_ivtv(v4l2_dev);
 	int i;
 
diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index 4077217777f9..931ec0727cd3 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -535,7 +535,7 @@ cxd2880_spi_probe(struct spi_device *spi)
 
 	dvb_spi->spi = spi;
 	mutex_init(&dvb_spi->spi_mutex);
-	dev_set_drvdata(&spi->dev, dvb_spi);
+	spi_set_drvdata(spi, dvb_spi);
 	config.spi = spi;
 	config.spi_mutex = &dvb_spi->spi_mutex;
 
@@ -632,7 +632,7 @@ cxd2880_spi_remove(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	dvb_spi = dev_get_drvdata(&spi->dev);
+	dvb_spi = spi_get_drvdata(spi);
 
 	if (!dvb_spi) {
 		pr_err("failed\n");
diff --git a/drivers/media/radio/radio-maxiradio.c b/drivers/media/radio/radio-maxiradio.c
index ad488ecbd16c..de107e2cbcd6 100644
--- a/drivers/media/radio/radio-maxiradio.c
+++ b/drivers/media/radio/radio-maxiradio.c
@@ -176,7 +176,7 @@ static int maxiradio_probe(struct pci_dev *pdev,
 
 static void maxiradio_remove(struct pci_dev *pdev)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&pdev->dev);
+	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
 	struct maxiradio *dev = to_maxiradio(v4l2_dev);
 
 	snd_tea575x_exit(&dev->tea);
diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 75fad9689c90..88a16cfeced8 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2398,7 +2398,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 
 	pxa_camera_activate(pcdev);
 
-	dev_set_drvdata(&pdev->dev, pcdev);
+	platform_set_drvdata(pdev, pcdev);
 	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
 	if (err)
 		goto exit_deactivate;
@@ -2455,7 +2455,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 
 static int pxa_camera_remove(struct platform_device *pdev)
 {
-	struct pxa_camera_dev *pcdev = dev_get_drvdata(&pdev->dev);
+	struct pxa_camera_dev *pcdev = platform_get_drvdata(pdev);
 
 	pxa_camera_deactivate(pcdev);
 	tasklet_kill(&pcdev->task_eof);
diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 1f1042d5c865..a4bfa70b49b2 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -1529,7 +1529,7 @@ static int viu_of_probe(struct platform_device *op)
 
 static int viu_of_remove(struct platform_device *op)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&op->dev);
+	struct v4l2_device *v4l2_dev = platform_get_drvdata(op);
 	struct viu_dev *dev = container_of(v4l2_dev, struct viu_dev, v4l2_dev);
 	struct v4l2_subdev *sdev = list_entry(v4l2_dev->subdevs.next,
 					      struct v4l2_subdev, list);
@@ -1550,7 +1550,7 @@ static int viu_of_remove(struct platform_device *op)
 #ifdef CONFIG_PM
 static int viu_suspend(struct platform_device *op, pm_message_t state)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&op->dev);
+	struct v4l2_device *v4l2_dev = platform_get_drvdata(op);
 	struct viu_dev *dev = container_of(v4l2_dev, struct viu_dev, v4l2_dev);
 
 	clk_disable(dev->clk);
@@ -1559,7 +1559,7 @@ static int viu_suspend(struct platform_device *op, pm_message_t state)
 
 static int viu_resume(struct platform_device *op)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&op->dev);
+	struct v4l2_device *v4l2_dev = platform_get_drvdata(op);
 	struct viu_dev *dev = container_of(v4l2_dev, struct viu_dev, v4l2_dev);
 
 	clk_enable(dev->clk);

