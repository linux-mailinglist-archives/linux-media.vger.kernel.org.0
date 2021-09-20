Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADE6412BB3
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 04:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347066AbhIUCZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 22:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbhIUBvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 21:51:38 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8242C0DBAA2
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 15:54:43 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u18so32178995wrg.5
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BAyK6ZRiwXBj5PSOxddUeIgnBB41wZflEoPUvDMohwo=;
        b=kALRITCZeCgRWqNrRgj+hgx5a4CuY/1QnCKbr04zI4D56Z1Yc3WoAO1hVPgDkv3yWy
         jqcXkzOobw338zpJw2/0OsucdNkZ8JbbX9SoH/CD4UKEO3/FTgVqTu8SSCTTByHpV+VL
         rx1k6VZAsvVUCHmCXuM+/MwaRiVYmrodjj6ub/ofReUClfEagR9WF9f9IAWFKAmmaarj
         gG9ynlytEBvt1zQzqyCZg/5IlaM1cS0Gqjwzfsb5NgAnX48P4s0Tu8GztFX89xsgISkx
         IpNYkrufPf6gCtk1Mw29HB8lweN3yGuxPIo+twzlcPjHYp40mtQQKuxkgBsup1XAw1Wh
         5SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BAyK6ZRiwXBj5PSOxddUeIgnBB41wZflEoPUvDMohwo=;
        b=QCOCBeryXKSHCp4V2jK3zyubsIg2zNoJdXLO5Nct/Bh+WsrvITHXhNxj7rm4X/3xFV
         p7RCVhPWd5XdCd7a6Xht3h5ekGKYio9D1qwcv0tCSFiBLAz1XLrrDrvJX9RBJF9xB7aE
         c+Qse0XYZnf1yYMBewBwPHrb0FY/tsJ2aOPr5GmbpvN3XOveN1bbfkv9DV4LHQdEgNTf
         y76+H/9AosObJ7iC2i8Aautnh/ijF+e26IeUKUqjNixVPPU9wCtEOXq8qQ5QNo8bsDP+
         YvcS6VCRkkzqy+zrN1+WaDTAFuQhULKw0NNY+ksMofxCCP9L72B7FupE8ebWqW+Q1yWI
         NM9A==
X-Gm-Message-State: AOAM530OKauBedG+JMQOp5XE42/FkAdW68FShgmS+4qfZkTNh0yTp554
        Ud21LJ43qsR1tXvewQtuWhuiP48WstI=
X-Google-Smtp-Source: ABdhPJzAA9ZF5I+W6dsY6uxD6AE4vf7CxuoYDGp0rExrZdfSh0CfwmZUNK4V9dFF6UVqdNZT4JGPfQ==
X-Received: by 2002:a5d:43ca:: with SMTP id v10mr32175973wrr.139.1632178482460;
        Mon, 20 Sep 2021 15:54:42 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s10sm17234976wrg.42.2021.09.20.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:54:42 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com
Subject: [PATCH v3 1/2] media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
Date:   Mon, 20 Sep 2021 23:54:21 +0100
Message-Id: <20210920225422.42618-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920225422.42618-1-djrscally@gmail.com>
References: <20210920225422.42618-1-djrscally@gmail.com>
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

Changes since v2:

	- None 

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 47db0ee0fcbf..7bb86e246ebe 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1973,12 +1973,19 @@ static int __maybe_unused cio2_suspend(struct device *dev)
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
 
@@ -2013,8 +2020,14 @@ static int __maybe_unused cio2_resume(struct device *dev)
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

