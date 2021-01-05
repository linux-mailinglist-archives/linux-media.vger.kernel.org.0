Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7672EAB98
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbhAENKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729933AbhAENKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:10:52 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA51C061798;
        Tue,  5 Jan 2021 05:10:27 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id s6so14571149qvn.6;
        Tue, 05 Jan 2021 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQ0OJEOn97+wjoYhHmOVVLzYGUU35WOQxdoz8BzVbpo=;
        b=MOXVvFSD/yTZYfKFMRSRsdSzpkq0MFYG+RVMJriLzxtNntn2B7msayxE5Y3YFooiWW
         WqkXn229ZHIL/6D6iI1Z3NDTO0/1dD7nr0aCfwV1hB7Vsw5Dt0lfzGAsayY6KB6A+DPf
         hqPFPwm0p4C104afa5xcNhDrsV7YMs89a1gc08GTjA/capXtEAU91M8dbAKLEkT64Emw
         y+5ziOnoT4tMxp2RBfNqwfaOIkyXHcw+z26rPhWn/Dx8Pl+s1O6ltamZJ+tyw7JRlZyf
         vxwTGPiPZmCqykUQsQE3QV09VIo1MwZQ2wVwiaYsk+7VCetOx0F5et/wDE7bR2RzscgC
         pEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQ0OJEOn97+wjoYhHmOVVLzYGUU35WOQxdoz8BzVbpo=;
        b=GQcpPOrs7b0Dx7TCBv78cRWj2eukTUo1uv7Ghs7kGVFfJsIAyLrn1VlrddEvfjJOoj
         wVkUa8wX9VL/MEigBFBCMpdYb3NgpdrqeL8krXkJVK9pHJ6kI+zMNMp810szOUhnQmoM
         UAXHwxmR+oomjGyBf6MFydeyrSd0J21zkZ/jOSUkg/7g3nJ8cHufWKs+NexzB9YpTSMW
         35umRWlSrb7mNNAyrIruBnDJnZtO+oEfdzQ98j7wLtlyjwuOQM+uGdeRh/d/4Gge4jeq
         nDfyN+ZcBHCAiIercu01nOXDpcp9qeGR+EUdgE6/lINeRtYFy/h+E4+ggQ8vJTUUi+Tc
         FQTA==
X-Gm-Message-State: AOAM531s8lOE4SSaFIgwcAR1pDVkRcX2FtX3QVElZuViVQS22mPupRzJ
        ob/WgdCBCK60GGnlrV6LuUoFe43lZ3ObJQ==
X-Google-Smtp-Source: ABdhPJzIdycboSnJXvhU3084nK5JgJmsz2hiAgBIyXo6VNMIKZuwfEthdweT4BdmbAlpdoTKMfGU3Q==
X-Received: by 2002:a0c:f2cd:: with SMTP id c13mr81734677qvm.11.1609852226332;
        Tue, 05 Jan 2021 05:10:26 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:10:25 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: vidtv: use a simpler name in platform_{device|driver}
Date:   Tue,  5 Jan 2021 10:09:55 -0300
Message-Id: <20210105130956.1133222-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Change from "vidtv_bridge" to simply "vidtv" so that vidtv looks
more similar to the other media virtual drivers in /sys/bus/platform.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 4 ++--
 drivers/media/test-drivers/vidtv/vidtv_bridge.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 4ccaa0f00639..11ee87399375 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -562,13 +562,13 @@ static void vidtv_bridge_dev_release(struct device *dev)
 }
 
 static struct platform_device vidtv_bridge_dev = {
-	.name		= "vidtv_bridge",
+	.name		= VIDTV_PDEV_NAME,
 	.dev.release	= vidtv_bridge_dev_release,
 };
 
 static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
-		.name                = "vidtv_bridge",
+		.name = VIDTV_PDEV_NAME,
 	},
 	.probe    = vidtv_bridge_probe,
 	.remove   = vidtv_bridge_remove,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index d42899a31295..101a26a4415f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -16,6 +16,7 @@
  * For now, only one frontend is supported. See vidtv_start_streaming()
  */
 #define NUM_FE 1
+#define VIDTV_PDEV_NAME "vidtv"
 
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
-- 
2.30.0

