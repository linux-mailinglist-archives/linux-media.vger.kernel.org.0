Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F793931D5
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236912AbhE0PKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:10:00 -0400
Received: from mail.ispras.ru ([83.149.199.84]:60204 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236936AbhE0PIt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:08:49 -0400
Received: from localhost.localdomain (unknown [85.89.127.119])
        by mail.ispras.ru (Postfix) with ESMTPSA id 4622D40755E6;
        Thu, 27 May 2021 15:07:15 +0000 (UTC)
From:   Dmitriy Ulitin <ulitin@ispras.ru>
To:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Dmitriy Ulitin <ulitin@ispras.ru>, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org,
        Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: stm32: Potential NULL pointer dereference in dcmi_irq_thread()
Date:   Thu, 27 May 2021 18:06:26 +0300
Message-Id: <20210527150627.12995-2-ulitin@ispras.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527150627.12995-1-ulitin@ispras.ru>
References: <20210527150627.12995-1-ulitin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At the moment of enabling irq handling:=0D
=0D
1922 ret =3D devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,=
=0D
1923			dcmi_irq_thread, IRQF_ONESHOT,=0D
1924			dev_name(&pdev->dev), dcmi);=0D
=0D
there is still uninitialized field sd_format of struct stm32_dcmi *dcmi.=0D
If an interrupt occurs in the interval between the installation of the=0D
interrupt handler and the initialization of this field, NULL pointer=0D
dereference happens.=0D
=0D
This field is dereferenced in the handler function without any check:=0D
=0D
457 if (dcmi->sd_format->fourcc =3D=3D V4L2_PIX_FMT_JPEG &&=0D
458	    dcmi->misr & IT_FRAME) {=0D
=0D
The patch moves interrupt handler installation=0D
after initialization of the sd_format field that happens in=0D
dcmi_graph_notify_complete() via dcmi_set_default_fmt().=0D
=0D
Found by Linux Driver Verification project (linuxtesting.org).=0D
=0D
Signed-off-by: Dmitriy Ulitin <ulitin@ispras.ru>=0D
Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>=0D
---=0D
 drivers/media/platform/stm32/stm32-dcmi.c | 19 +++++++++++--------=0D
 1 file changed, 11 insertions(+), 8 deletions(-)=0D
=0D
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/plat=
form/stm32/stm32-dcmi.c=0D
index d9b4ad0abf0c..ada0c01dc1b1 100644=0D
--- a/drivers/media/platform/stm32/stm32-dcmi.c=0D
+++ b/drivers/media/platform/stm32/stm32-dcmi.c=0D
@@ -128,6 +128,7 @@ struct stm32_dcmi {=0D
 	int				sequence;=0D
 	struct list_head		buffers;=0D
 	struct dcmi_buf			*active;=0D
+	int			irq;=0D
 =0D
 	struct v4l2_device		v4l2_dev;=0D
 	struct video_device		*vdev;=0D
@@ -1752,6 +1753,14 @@ static int dcmi_graph_notify_complete(struct v4l2_as=
ync_notifier *notifier)=0D
 		return ret;=0D
 	}=0D
 =0D
+	ret =3D devm_request_threaded_irq(dcmi->dev, dcmi->irq, dcmi_irq_callback=
,=0D
+					dcmi_irq_thread, IRQF_ONESHOT,=0D
+					dev_name(dcmi->dev), dcmi);=0D
+	if (ret) {=0D
+		dev_err(dcmi->dev, "Unable to request irq %d\n", dcmi->irq);=0D
+		return ret;=0D
+	}=0D
+=0D
 	return 0;=0D
 }=0D
 =0D
@@ -1906,6 +1915,8 @@ static int dcmi_probe(struct platform_device *pdev)=0D
 	irq =3D platform_get_irq(pdev, 0);=0D
 	if (irq <=3D 0)=0D
 		return irq ? irq : -ENXIO;=0D
+=0D
+	dcmi->irq =3D irq;=0D
 =0D
 	dcmi->res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0D
 	if (!dcmi->res) {=0D
@@ -1919,14 +1930,6 @@ static int dcmi_probe(struct platform_device *pdev)=
=0D
 		return PTR_ERR(dcmi->regs);=0D
 	}=0D
 =0D
-	ret =3D devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,=0D
-					dcmi_irq_thread, IRQF_ONESHOT,=0D
-					dev_name(&pdev->dev), dcmi);=0D
-	if (ret) {=0D
-		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);=0D
-		return ret;=0D
-	}=0D
-=0D
 	mclk =3D devm_clk_get(&pdev->dev, "mclk");=0D
 	if (IS_ERR(mclk)) {=0D
 		if (PTR_ERR(mclk) !=3D -EPROBE_DEFER)=0D
-- =0D
2.25.1=0D
=0D
=0D
