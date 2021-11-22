Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F864598B0
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 00:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhKVX7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 18:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhKVX7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 18:59:38 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AB9C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 15:56:31 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so35755764wrb.2
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 15:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AGYn585wkRaPv1Hs44qG7RKg0/okXE0k2/21QIEi5zo=;
        b=lGfnpVxATdvtJqgzJjkOY8d0HtfMYxBP4bdq4SUHG/i3K5ZJ4MAoZ55UCVZj6eeE+G
         W3UmS/gY0QnpH8RDUVG6t5NSipnZp/3LLinq6pS3v1T3pICvk8ynp/i5UUz0550ZAIUq
         m0kIe5IBCSpmEIB+SfvvSz9W2vOuCPhg/9ocuUjxK8pRovDF0b14vEY2HNt3Kd3l27uZ
         CBUuc7U3JpgA+0FjwrjUght8/3WrAL5upv5YIIAbM6YIRNFdgAYkGUH7WPfgfxuSxrKc
         3AfVTdOHVFua6touIY5bFS5o2sYAJ2Vw5OitS7P/vTKYfdVHNr16k1n34VsxFKEcp+jH
         0Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AGYn585wkRaPv1Hs44qG7RKg0/okXE0k2/21QIEi5zo=;
        b=oLFXrOKKA4dgXZFOidv+VmUeEcu4mdywnh1ZeD5dE9eFQEFEGERjmEqcV0apCChY5D
         nAM7N7W2exLPQaLnWoNloUhed+CeUw7xBMMTq1VsWhGUkVLNYX14OclisDEIp/R7MEbQ
         1zTE66W+WpfiAzs0l983BKJmf4Z/q7oB2yZHin/yM7Pb2LT1oRtWM8H0Ges5SI8Jdue1
         61HNLanfe1Qjzk8Ai75SqTLt0o1Q87tHEhKRPtsD8+c+byRINBS4IioWosvsKW4RZPBF
         r/yT8X+MzYBrg/h5Ev/vCPs68Cu+tAdv+w31xqx5hgNpzb8Nlw+D/ikjnT4xQSG0BdLD
         EVzw==
X-Gm-Message-State: AOAM532ErUCgxsF2QHNBtwQRcGE6lVCpEzOeW7wTc3W6UNOOXpNMR41k
        roTdZpY3W1Q+2fahIgTUzakHgpRq92g=
X-Google-Smtp-Source: ABdhPJwjxvjQNNWvGuvguLsmd8VLUmQwJT3vgE3xadEJX+qs5TnQEquQ4HQMxFG37FPVtAPi+lTG6A==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr1564703wrt.321.1637625389706;
        Mon, 22 Nov 2021 15:56:29 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id b188sm10442067wmd.45.2021.11.22.15.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 15:56:29 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v6 1/3] media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
Date:   Mon, 22 Nov 2021 23:56:11 +0000
Message-Id: <20211122235613.41682-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122235613.41682-1-djrscally@gmail.com>
References: <20211122235613.41682-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .suspend() and .resume() runtime_pm operations for the ipu3-cio2
driver currently do not handle the sensor's stream. Setting .s_stream() on
or off for the sensor subdev means that sensors will pause and resume the
stream at the appropriate time even if their drivers don't implement those
operations.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v5:

	- None

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 356ea966cf8d..e2874fee9530 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1966,12 +1966,19 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
 	struct cio2_queue *q = cio2->cur_queue;
+	int r;
 
 	dev_dbg(dev, "cio2 suspend\n");
 	if (!cio2->streaming)
 		return 0;
 
 	/* Stop stream */
+	r = v4l2_subdev_call(q->sensor, video, s_stream, 0);
+	if (r) {
+		dev_err(dev, "failed to stop sensor streaming\n");
+		return r;
+	}
+
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(pci_dev->irq);
 
@@ -2005,8 +2012,16 @@ static int __maybe_unused cio2_resume(struct device *dev)
 	}
 
 	r = cio2_hw_init(cio2, q);
-	if (r)
+	if (r) {
 		dev_err(dev, "fail to init cio2 hw\n");
+		return r;
+	}
+
+	r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
+	if (r) {
+		dev_err(dev, "fail to start sensor streaming\n");
+		cio2_hw_exit(cio2, q);
+	}
 
 	return r;
 }
-- 
2.25.1

