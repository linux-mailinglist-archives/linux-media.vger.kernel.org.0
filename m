Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F9A44A245
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 02:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbhKIBR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 20:17:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:39772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242146AbhKIBLy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 20:11:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BF6161A8D;
        Tue,  9 Nov 2021 01:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636419904;
        bh=i6jWeeqOD0/qiaPBSregEny3dWEgc7cIDgs3yisbJtc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rLl62tLtZiu8Yb1VdD/cmCjdg+9Bl9z5zAEYv6HHJjUQuxU80ShIBV0R1uP7g7nhj
         +Uv81/tFkG4T21Xb77dEXKaEjFwzewwoNdXfyiczriKnSKd7sL2qIGzenJkQ68Weip
         6TTCDrGg/OwEiRtQ2eWIpgx4voQq0z0Fna1ypI8M/DQZZXacIR5kw8FplLx1oKW2DD
         jzbtQJ2HL/D7+T0pIw9h9e6rBsX985Ghl7gXDtGlXCOETY6TIxvpXm4RosrhqfseBR
         5EMUQvT8zgCEoITYZxvOdXz/z7bBGPmbQBwT4CuGRCL+PqG1mcG3DkeAeki/z6Np9Y
         VXAfn7axUIzsQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dmitriy Ulitin <ulitin@ispras.ru>,
        Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, hugues.fruchet@foss.st.com,
        mchehab@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 21/74] media: stm32: Potential NULL pointer dereference in dcmi_irq_thread()
Date:   Mon,  8 Nov 2021 12:48:48 -0500
Message-Id: <20211108174942.1189927-21-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174942.1189927-1-sashal@kernel.org>
References: <20211108174942.1189927-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dmitriy Ulitin <ulitin@ispras.ru>

[ Upstream commit 548fa43a58696450c15b8f5564e99589c5144664 ]

At the moment of enabling irq handling:

1922 ret = devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,
1923			dcmi_irq_thread, IRQF_ONESHOT,
1924			dev_name(&pdev->dev), dcmi);

there is still uninitialized field sd_format of struct stm32_dcmi *dcmi.
If an interrupt occurs in the interval between the installation of the
interrupt handler and the initialization of this field, NULL pointer
dereference happens.

This field is dereferenced in the handler function without any check:

457 if (dcmi->sd_format->fourcc == V4L2_PIX_FMT_JPEG &&
458	    dcmi->misr & IT_FRAME) {

The patch moves interrupt handler installation
after initialization of the sd_format field that happens in
dcmi_graph_notify_complete() via dcmi_set_default_fmt().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Dmitriy Ulitin <ulitin@ispras.ru>
Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index d41475f56ab54..72798aae7a628 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -135,6 +135,7 @@ struct stm32_dcmi {
 	int				sequence;
 	struct list_head		buffers;
 	struct dcmi_buf			*active;
+	int			irq;
 
 	struct v4l2_device		v4l2_dev;
 	struct video_device		*vdev;
@@ -1720,6 +1721,14 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	ret = devm_request_threaded_irq(dcmi->dev, dcmi->irq, dcmi_irq_callback,
+					dcmi_irq_thread, IRQF_ONESHOT,
+					dev_name(dcmi->dev), dcmi);
+	if (ret) {
+		dev_err(dcmi->dev, "Unable to request irq %d\n", dcmi->irq);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1881,6 +1890,8 @@ static int dcmi_probe(struct platform_device *pdev)
 	if (irq <= 0)
 		return irq ? irq : -ENXIO;
 
+	dcmi->irq = irq;
+
 	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!dcmi->res) {
 		dev_err(&pdev->dev, "Could not get resource\n");
@@ -1893,14 +1904,6 @@ static int dcmi_probe(struct platform_device *pdev)
 		return PTR_ERR(dcmi->regs);
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,
-					dcmi_irq_thread, IRQF_ONESHOT,
-					dev_name(&pdev->dev), dcmi);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
-		return ret;
-	}
-
 	mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(mclk)) {
 		if (PTR_ERR(mclk) != -EPROBE_DEFER)
-- 
2.33.0

