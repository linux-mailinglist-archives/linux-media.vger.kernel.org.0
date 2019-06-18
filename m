Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DEB49544
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfFQWjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40844 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfFQWjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id a9so7750778lff.7
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kzve9uLO5TQvOnU9yKmn8IIOCl/TG9sX/iiN7ouexFE=;
        b=fLSONj6iQFsfA6hnUUOtsm1zlz/DrRBbe8vnEVgJKP+KFis2NgPv46dXH7nmPQVu5C
         1Xfkd3zO9AuMsxBSNGrh8Qc0zqYHJGUpG8fwh0GQtfJU8ZEM7tMamvU//3q1SA8G8tsA
         A0t8vymF37CcYNlXWeYNpyBEY/Ji6bB54vDdwAhX0YdZnq0N8UTupKf1Za+QfSC8hKLj
         0twN2YW7olgcq+2O0kYi0R7bCfgdwVQ1lSG2+ecUcwf7a2a3aN4BFswnarrPZkzHhKkv
         YK/kclHZ2RwbPjgZTbaPrq3ocYfGgRTQi3QPuFukg1ZV7pgeCa45bkxiT1OUmBsMxcB6
         2DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kzve9uLO5TQvOnU9yKmn8IIOCl/TG9sX/iiN7ouexFE=;
        b=amDjjhRwUAusfAzJTvy3WO45ma5JTCMpliJNx9WJcTnLj+13ZwFDfdBlQj/da5qaPU
         laaBMMNSNzfTPelCPK05SIzzytALL2lf7iB06GlQUN4KL0s5CvGq/I+S7EMs6W6UOL2y
         Rg5P3v6Xw32wF/FOBeIzqGrmTcF0c4k+rIFknDvLpS44S5vFdxLRKebxOaspDV7m+fwQ
         8WnQJvERBwYsCBN8qW9hpwpVH5Qw0P5T3y4YSncKk+H6mtTm6kwlyc201Mo1BX/c5VXI
         n5lKwBXIVQ/Z9fS4x6soWC2C/i4gfbrdQtWZhu/G44vngEkgXES6kuGITZagSlpnwPMs
         RRPA==
X-Gm-Message-State: APjAAAXPlGL6sFRJMrQGLeKjHAnRDk7PGjMqShQrDTN1FBuq5MSTQzdP
        /W9W+FG1Z26BsW5ulgP9RpOqgnjv04rIwA==
X-Google-Smtp-Source: APXvYqxdfQxHtXsVVNNCTx3CPxGpTPUB9r1vqnqiMzGgSqoEwHiRidcRWqUbY7P1guoZQNzJ8yqaKw==
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr20195993lfm.36.1560811172139;
        Mon, 17 Jun 2019 15:39:32 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:31 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 7/9] media: vivid: reorder CEC allocation and control set-up
Date:   Tue, 18 Jun 2019 09:37:24 +0200
Message-Id: <20190618073726.61776-8-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CEC adapters and controllers (handlers) are now set up as follows:

1. Allocate CEC adapters: setup of control handlers in next step
   requires these adapters to be allocated.
2. Setup of control handlers: This must be done prior to registering
   and exposing the adapters to user space to avoid a race condition.
3. Register CEC adapters: make them available to user space.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c | 100 +++++++++++++---------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index 8c211fba3c66..d21ce43b1675 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -667,6 +667,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
 	int ret;
 	int i;
+#ifdef CONFIG_VIDEO_VIVID_CEC
+	unsigned int cec_tx_bus_cnt = 0;
+#endif
 
 	/* allocate main vivid state structure */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
@@ -1058,14 +1061,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	vivid_update_format_cap(dev, false);
 	vivid_update_format_out(dev);
 
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
-
 	/* initialize overlay */
 	dev->fb_cap.fmt.width = dev->src_rect.width;
 	dev->fb_cap.fmt.height = dev->src_rect.height;
@@ -1226,6 +1221,47 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 				dev->fb_info.node);
 	}
 
+#ifdef CONFIG_VIDEO_VIVID_CEC
+	if (dev->has_vid_cap && in_type_counter[HDMI]) {
+		struct cec_adapter *adap;
+
+		adap = vivid_cec_alloc_adap(dev, 0, false);
+		ret = PTR_ERR(adap);
+		if (ret < 0)
+			goto unreg_dev;
+		dev->cec_rx_adap = adap;
+	}
+
+	if (dev->has_vid_out) {
+		for (i = 0; i < dev->num_outputs; i++) {
+			struct cec_adapter *adap;
+
+			if (dev->output_type[i] != HDMI)
+				continue;
+
+			dev->cec_output2bus_map[i] = cec_tx_bus_cnt;
+			adap = vivid_cec_alloc_adap(dev, cec_tx_bus_cnt, true);
+			ret = PTR_ERR(adap);
+			if (ret < 0) {
+				for (i = 0; i < dev->num_outputs; i++)
+					cec_delete_adapter(dev->cec_tx_adap[i]);
+				goto unreg_dev;
+			}
+
+			dev->cec_tx_adap[cec_tx_bus_cnt] = adap;
+			cec_tx_bus_cnt++;
+		}
+	}
+#endif
+
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
+
 	/* finally start creating the device nodes */
 	if (dev->has_vid_cap) {
 		vfd = &dev->vid_cap_dev;
@@ -1255,22 +1291,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 
 #ifdef CONFIG_VIDEO_VIVID_CEC
 		if (in_type_counter[HDMI]) {
-			struct cec_adapter *adap;
-
-			adap = vivid_cec_alloc_adap(dev, 0, false);
-			ret = PTR_ERR_OR_ZERO(adap);
-			if (ret < 0)
-				goto unreg_dev;
-			dev->cec_rx_adap = adap;
-			ret = cec_register_adapter(adap, &pdev->dev);
+			ret = cec_register_adapter(dev->cec_rx_adap, &pdev->dev);
 			if (ret < 0) {
-				cec_delete_adapter(adap);
+				cec_delete_adapter(dev->cec_rx_adap);
 				dev->cec_rx_adap = NULL;
 				goto unreg_dev;
 			}
-			cec_s_phys_addr(adap, 0, false);
+			cec_s_phys_addr(dev->cec_rx_adap, 0, false);
 			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI input 0\n",
-				  dev_name(&adap->devnode.dev));
+				  dev_name(&dev->cec_rx_adap->devnode.dev));
 		}
 #endif
 
@@ -1282,10 +1311,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	}
 
 	if (dev->has_vid_out) {
-#ifdef CONFIG_VIDEO_VIVID_CEC
-		unsigned int bus_cnt = 0;
-#endif
-
 		vfd = &dev->vid_out_dev;
 		snprintf(vfd->name, sizeof(vfd->name),
 			 "vivid-%03d-vid-out", inst);
@@ -1313,30 +1338,21 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 #endif
 
 #ifdef CONFIG_VIDEO_VIVID_CEC
-		for (i = 0; i < dev->num_outputs; i++) {
-			struct cec_adapter *adap;
-
-			if (dev->output_type[i] != HDMI)
-				continue;
-			dev->cec_output2bus_map[i] = bus_cnt;
-			adap = vivid_cec_alloc_adap(dev, bus_cnt, true);
-			ret = PTR_ERR_OR_ZERO(adap);
-			if (ret < 0)
-				goto unreg_dev;
-			dev->cec_tx_adap[bus_cnt] = adap;
-			ret = cec_register_adapter(adap, &pdev->dev);
+		for (i = 0; i < cec_tx_bus_cnt; i++) {
+			ret = cec_register_adapter(dev->cec_tx_adap[i], &pdev->dev);
 			if (ret < 0) {
-				cec_delete_adapter(adap);
-				dev->cec_tx_adap[bus_cnt] = NULL;
+				for (; i < cec_tx_bus_cnt; i++) {
+					cec_delete_adapter(dev->cec_tx_adap[i]);
+					dev->cec_tx_adap[i] = NULL;
+				}
 				goto unreg_dev;
 			}
 			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI output %d\n",
-				  dev_name(&adap->devnode.dev), bus_cnt);
-			bus_cnt++;
-			if (bus_cnt <= out_type_counter[HDMI])
-				cec_s_phys_addr(adap, bus_cnt << 12, false);
+				  dev_name(&dev->cec_tx_adap[i]->devnode.dev), i);
+			if (i <= out_type_counter[HDMI])
+				cec_s_phys_addr(dev->cec_tx_adap[i], i << 12, false);
 			else
-				cec_s_phys_addr(adap, 0x1000, false);
+				cec_s_phys_addr(dev->cec_tx_adap[i], 0x1000, false);
 		}
 #endif
 
-- 
2.19.1

