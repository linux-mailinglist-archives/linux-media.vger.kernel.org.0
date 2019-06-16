Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013184765F
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfFPSXT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46675 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfFPSXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so7106559ljg.13
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7kohzk3d/imwpcKuuf6BYJ5CA8g3j4D6lhzmHCfxE2I=;
        b=Q2aTQWkCvWfaOA6jS+rnO5RpmKuUJWTgVSZUveRmBoNoMTDP45/fmoulSiHm4sW3QQ
         LHjbT+jTxSIZzxF972vU9MGqMNMe+VH1TCYQoLTdZpEuqDwG0tMBL/7ftSYkgILQgbCT
         o5LQEnz7D1j1Ojx45hakcWYnfrlnH9lTJ6RsYrp5vZxu5j3cu9J9R0V7z/akp7KpL+Ga
         IGTsAxET/u1IhwrwHHKuoEdh4oo5xHH/N/I1AEGy8Hk1XgB1g3pC3FTMkNTR5Rh1t8t3
         HoeI5xzSelHOsnL9NDNY8NOpLPjsp0bXijy2bQxJZDGL2fruyChirEWXprdB5j5D3XvO
         xRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7kohzk3d/imwpcKuuf6BYJ5CA8g3j4D6lhzmHCfxE2I=;
        b=sc8IVKlSpGwVQw1pm4R3h7grtF+1+rPKc6UVmSgPMIrRqbxpBTneURD8npmNGoRJHS
         7VKvwEv4UUueRTvv6qVZvgC5EeTdNIwZbIW/cMF6l5KvRhCc7V38I0MuIyPlQmCpo2Bj
         t2BRf1vPc7JH6I8FBBkM80ScoJ2dr+tQE8fU6HBE/QlR4bkMKDlHd8nsbFPbglXHiob2
         uG405p/0PkPrekFjlwK0ffpi2LwDieXVlXWFKacZKzCn7qaqHKRDXVbcckrPDplmMMo9
         vB90AP+F0zkPPeNcOBHG1DTuq7Ao5UK/9KKjTf5ikWzCdesSHDEb5Skr2op+Ik2Nzi2V
         EQVg==
X-Gm-Message-State: APjAAAW7dgirT3Dmtq4CegEhXp8mIRNcZu7W27cWVlcbeya8gzBkLSPz
        K9aeMCX3eDRx0f4A7CRvH+oRa2aRy1k=
X-Google-Smtp-Source: APXvYqy+2bj88SviEcfM4J1Ty+TzTBCb3W8LolhX8GQMS8IOyLncDLUeEbLM6bXXX/9IKJ9dZFeNUA==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr5231770ljg.80.1560709395851;
        Sun, 16 Jun 2019 11:23:15 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:15 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 7/9] media: vivid: reorder CEC allocation and control set-up
Date:   Sun, 16 Jun 2019 11:22:16 -0700
Message-Id: <20190616182218.37726-8-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
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
index 8c211fba3c66..bc2a176937a4 100644
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
+		ret = PTR_ERR_OR_ZERO(adap);
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
+			ret = PTR_ERR_OR_ZERO(adap);
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

