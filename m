Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F42C4423E4
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbhKAXYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhKAXYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:24:36 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D77AC061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:22:02 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so825122wmd.1
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q3StxMi+UOmc+r7TUJoJidP0Lbn1vDwiBz4lW0b7bXs=;
        b=csluSiBiLilx7+R8qbfetgRKb8Yw8pn9bo88pPZDztQL4P5nMu85J172RXcm7jIiLy
         0v5b4WPF7SPVvaIYFPlebV5I7TwNrFQd05LdEAHXxEraY/WvvaFMAEj+kJh5yIHSuPcE
         RaP1yXBO06tCUvnApG+287sxdpj4M+07IQcvmR866H7y/7jyp1kISIbRv3tPG+qWD7Ly
         q1zy9WUnRQJHfi4STP0HCcaIwixhj2MTW8ziLAtKdS7ceR5/bcVKGNt2A4u6/TY/fXD7
         v78YmKBAVQqeZbE9zET5fTdAH13i3nskNUnqZEMElYrbLCsZ0Wid9NOi+YSW7MOEs99a
         yHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q3StxMi+UOmc+r7TUJoJidP0Lbn1vDwiBz4lW0b7bXs=;
        b=x/Mk72LqefW96YfQ1A6dOz2TIuV0oTeTxAs44PZSADcpUeN6YyjtSEunMTaJcfX0dH
         8IobX5QD0fae33kn3xho3JxByP44isNvaBxHvpq/FhrUAbiVrns+FkEtnYDXZ9BU/TM+
         R8hDDNvxDPhLH5Q3pVOnvv0QtrTQVRjKVdWZ7hymLbBz11/DDabdzGw4fu6W5/OowAO0
         kkHUfwV83XvMjNYIAj4tJ0m8u61a48BB2xTDvtxNKHoOUe4KAb38cEPF8Sbp8PzNAcmL
         G0+AWgt7qCH+YrSpnNQjilW+EVPWaUPnU8EfozdB3vEJKdIGjV1Ve0Vql0sTK/lECc+5
         +Umw==
X-Gm-Message-State: AOAM531axoAsBnLkh5ypmJDRSFQervsAJyWYBzML3PEMj+fNOsfFa4xY
        ujqDD2hnySYC14qwarm+oob7zyCNRfI=
X-Google-Smtp-Source: ABdhPJw7MTFTY6KtYUe+e0bJRr1ixawEO7zBdrommyiQU21/2rt4OiPtjOWDIcyKWmb7o+GTbdIXKg==
X-Received: by 2002:a05:600c:378f:: with SMTP id o15mr2313948wmr.63.1635808921145;
        Mon, 01 Nov 2021 16:22:01 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l124sm763513wml.8.2021.11.01.16.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 16:22:00 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 1/5] media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
Date:   Mon,  1 Nov 2021 23:21:40 +0000
Message-Id: <20211101232144.134590-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101232144.134590-1-djrscally@gmail.com>
References: <20211101232144.134590-1-djrscally@gmail.com>
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
Changes in v5:

	- call cio2_hw_exit() on error path (kieran)

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

