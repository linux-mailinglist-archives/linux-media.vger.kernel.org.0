Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0326C354903
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 00:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhDEW5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 18:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhDEW5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 18:57:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36B0C061756;
        Mon,  5 Apr 2021 15:57:09 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id a76so3179630wme.0;
        Mon, 05 Apr 2021 15:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SgSkzffQwD1xfZ9dCG+FPaXqoohtaxLr0jY/LHALm5E=;
        b=Ed1nRso5J1ZkS5oVi2ChisHbmGJj3ke0t+b7DOnnIs7DeYLyJIBd82rhG+2RUg8WeW
         FHs8P7W5+vkHtIKfCS036ZFYMUMXgqW9NPUB8JTOmDl1ItFqhNI2m+m7LPawMQFZFSwB
         x80qGjSjtjcq9L2Y6/5hfocitgo74I+hrQedPptBVo/FZYt+OruceTipfOLM6XOvq8f+
         aUf4pvKa217P9N9CWummOfB14V+Db8AnGdzP+Lb3EDFzql2ftEGY58sKXixas8ObEker
         2KYJM2bPHjNbt0VbeqJEHxgIEHZJFSyzgINZjMUqJ5u6LWQZo25wHAX6fLtLENOxnu41
         fLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SgSkzffQwD1xfZ9dCG+FPaXqoohtaxLr0jY/LHALm5E=;
        b=f2/jakybQwRFmoDt06Kf8XYflgXUVbISvWaB5ANoo9cCg3Qvhy0cx+QTeQk1brKuiO
         6bqbBZRJuKLoCjxiUFyJpdi/g04pyzKyBi1MsWGeB5SWuIG41ngaE/RrW96SEXHNTTVm
         GfyG1bJ/20Bs9mLPo7FlxwQaKR9z8x55Jr7so589lBkr/R+JRN+ZSFwDdz9q1iESkBhM
         pzMe9YmOZROliC7ZK/r/cpT3PA0LIBqazVQxarHcBKqMKeznrHmfk+BEZSy+9Z/pOIlK
         ASV8RHdiEwLxuoXQo940oWlT+u8UYYwYGDLqJiz1Z/uAGcBtMldKQIbxLztTbRHD7OEu
         it3g==
X-Gm-Message-State: AOAM533Fz0uqqOs4LjxzzC8mfFUas+eP5mpDYbZx3l8HfpZ8COUMo5eN
        y1+q6fiM5iNrhxkfe2Jd29CVliCX0xW9tg==
X-Google-Smtp-Source: ABdhPJyhF3zYmbmkolZjNfC8Rv5D0DEhmBUU7lWlD5xR1jDxpyA1mB2o1aiG9r/vU3Ksy1Ak442enw==
X-Received: by 2002:a1c:c341:: with SMTP id t62mr1192943wmf.27.1617663428478;
        Mon, 05 Apr 2021 15:57:08 -0700 (PDT)
Received: from valhalla.home ([2.29.208.21])
        by smtp.gmail.com with ESMTPSA id s10sm20173361wrt.90.2021.04.05.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:57:08 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com
Cc:     tian.shu.qiu@intel.com, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, jacopo+renesas@jmondi.org,
        dongchun.zhu@mediatek.com, niklas.soderlund+renesas@ragnatech.se,
        me@fabwu.ch, luzmaximilian@gmail.com,
        jeanmichel.hautbois@ideasonboard.com, kitakar@gmail.com
Subject: [PATCH v2 1/2] media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
Date:   Mon,  5 Apr 2021 23:56:53 +0100
Message-Id: <20210405225654.126916-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405225654.126916-1-djrscally@gmail.com>
References: <20210405225654.126916-1-djrscally@gmail.com>
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

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	Patch introduced

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index db59b19a6236..0a970ddeb281 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1981,12 +1981,19 @@ static int __maybe_unused cio2_suspend(struct device *dev)
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
 
@@ -2021,8 +2028,14 @@ static int __maybe_unused cio2_resume(struct device *dev)
 	}
 
 	r = cio2_hw_init(cio2, q);
-	if (r)
+	if (r) {
 		dev_err(dev, "fail to init cio2 hw\n");
+		return r;
+	}
+
+	r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
+	if (r)
+		dev_err(dev, "fail to start sensor streaming\n");
 
 	return r;
 }
-- 
2.25.1

