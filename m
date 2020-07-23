Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B7A22B520
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 19:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgGWRqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 13:46:55 -0400
Received: from mail.ispras.ru ([83.149.199.84]:42040 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbgGWRqz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 13:46:55 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 0D0AC40A2040;
        Thu, 23 Jul 2020 17:46:52 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Todor Tomov <todor.too@gmail.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
        Anton Vasilyev <vasilyev@ispras.ru>
Subject: [PATCH] media: camss: fix memory leaks on error handling paths in probe
Date:   Thu, 23 Jul 2020 20:46:51 +0300
Message-Id: <20200723174651.10392-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

camss_probe() does not free camss on error handling paths. The patch
introduces an additional error label for this purpose. Besides, it
removes call of v4l2_async_notifier_cleanup() from
camss_of_parse_ports() since its caller, camss_probe(), cleans up all
its resources itself.

Found by Linux Driver Verification project (linuxtesting.org).

Co-Developed-by: Anton Vasilyev <vasilyev@ispras.ru>
Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
---
 drivers/media/platform/qcom/camss/camss.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3fdc9f964a3c..2483641799df 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -504,7 +504,6 @@ static int camss_of_parse_ports(struct camss *camss)
 	return num_subdevs;
 
 err_cleanup:
-	v4l2_async_notifier_cleanup(&camss->notifier);
 	of_node_put(node);
 	return ret;
 }
@@ -835,29 +834,38 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csid_num = 4;
 		camss->vfe_num = 2;
 	} else {
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free;
 	}
 
 	camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
 				     sizeof(*camss->csiphy), GFP_KERNEL);
-	if (!camss->csiphy)
-		return -ENOMEM;
+	if (!camss->csiphy) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
 
 	camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
-	if (!camss->csid)
-		return -ENOMEM;
+	if (!camss->csid) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
 
 	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
 				  GFP_KERNEL);
-	if (!camss->vfe)
-		return -ENOMEM;
+	if (!camss->vfe) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
 
 	v4l2_async_notifier_init(&camss->notifier);
 
 	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0)
-		return num_subdevs;
+	if (num_subdevs < 0) {
+		ret = num_subdevs;
+		goto err_cleanup;
+	}
 
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
@@ -936,6 +944,8 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
 	v4l2_async_notifier_cleanup(&camss->notifier);
+err_free:
+	kfree(camss);
 
 	return ret;
 }
-- 
2.16.4

