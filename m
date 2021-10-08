Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0A4427400
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 01:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243719AbhJHXHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 19:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhJHXHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 19:07:21 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCB0C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 16:05:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id i12so21439671wrb.7
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 16:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UWbsR5pJbZb9EsYZbnnegDPj46JNw81XbPXAprANlhc=;
        b=cBCm4aiitWH9rzFz/XxyrRiwWGVgfAMUuYrMAkumpZ2fA8Qk5tk6j0dZViPG37fwww
         WHGNPzH6ZmDtF/97f0aeYJ0hB1gjt7rEcEkNXPiCbX5gARnUvfgOaN4Soep1Ej+D9u/Y
         zDvZXxIpT3sVrDp6RMx3eI8yYbSunuJzRYZL4W94bTgrQnDaFamZtkQR69CfjD6s3g63
         LjfoyoM23tTdMpFKWv+QgO1YA41rGHec5BRSzQ1LDZCBCw6dpBsYlbrJyYFR+dWPzXm6
         am3OqXRv+ZxOAS0RcJoa7YgmbXscahpNupzhFcjqYi+WedoRGGUq2k684qEIAoRXTAhX
         2FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UWbsR5pJbZb9EsYZbnnegDPj46JNw81XbPXAprANlhc=;
        b=wHYDEeXrNqJ90TykXnzPvgcAv/va+lKSUhuadO02wGvMpvEA0s88Sh8CrNarPxBUOe
         UDMKOSVrwWUmq+EHFGMsdszHbd6MiQNqiMtSsmXf/96TO/dt96UBnDcyFJRyUjw0DuCw
         M2KLQ8YWmc1hvBqipbM6H9Yd4VFnkb4rY1a05LRRYQtmHHcMMcfzR3s02VC6v/eTULrH
         ujNFfwHQfUsZ64FaOnhMuqP8YBUb/qq3XB4XjxmiqEg64QT0LMQbdYTVUTJV5AXp4EV6
         2Zk2yueLGsDZvmCNIfkIhuYrSrV/vmwWiXPOYc/7AAeHlDAVtDe3cNsGcTD/u+zEtSob
         Zreg==
X-Gm-Message-State: AOAM5336DnFuL+aDfc6u6OOSP4Q3mXMQn9htXtKcBStZVbG93z65MWoa
        VPWhelba58gqGTQED9owe7iPoXCy8o8=
X-Google-Smtp-Source: ABdhPJxNFlzfbuCe7pio0zQtXFN/hOPuMXwk3pQHy3LxylPw3hN9EVsuUpwHyhyOuQpb+m/4y/1t6A==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr7724010wrg.222.1633734323814;
        Fri, 08 Oct 2021 16:05:23 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id y11sm679267wrg.18.2021.10.08.16.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 16:05:23 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v4 1/3] media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
Date:   Sat,  9 Oct 2021 00:05:13 +0100
Message-Id: <20211008230515.417451-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008230515.417451-1-djrscally@gmail.com>
References: <20211008230515.417451-1-djrscally@gmail.com>
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
Changes since v3:

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

