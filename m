Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1763114A57
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 02:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfLFBHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 20:07:17 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:41474 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfLFBHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 20:07:17 -0500
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Dec 2019 20:07:16 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47TZ5G4QGCz9vcHW
        for <linux-media@vger.kernel.org>; Fri,  6 Dec 2019 01:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id h9P9E1aQG3SL for <linux-media@vger.kernel.org>;
        Thu,  5 Dec 2019 19:00:34 -0600 (CST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47TZ5G31Hdz9vcH9
        for <linux-media@vger.kernel.org>; Thu,  5 Dec 2019 19:00:34 -0600 (CST)
Received: by mail-yb1-f199.google.com with SMTP id d191so1299098ybc.17
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 17:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=n838+sn4bG9Uk+EUak61BRvfIERSwMTFakidd6XsXRg=;
        b=gL5WcT4Mc0H8rePtZqFSwH1R6vC2OZAqlrtr8KDt6orBDMV46jVFTGxRTyV2ujEFJz
         gSS0SUfMwRB47vPHryM1EH6SejcdhhmNwcg/v3D++KlJ5dWoxjJ5sdCF7HaJHJvcX6Xg
         eMnfXSNd+uoEHLE8PC9ae9K0mdbL+EqHbwzXYsxJHCqMltL5JmzktEQEsR6TCw12id1a
         +8L2Kp9vt0naxloHBBzJmm6A7sPTzfGue2FqPGKsiMqluJdu8dn0tL97IwpnAArOc16b
         au8VP1YkUI3dWmiffTTvsoi0VPpFJb9w+JrSAcb1SG/ZmdDDmSCJ2zLxiECF4h72LD6B
         no2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n838+sn4bG9Uk+EUak61BRvfIERSwMTFakidd6XsXRg=;
        b=q2P3kq11/8Kujk7qlfYpxAWg7LWf6G5BXEb4J4WjZ6wnSAh9qYYWcH+ksHrR86yZjp
         Lb65m7t0yRJulZZd5XXkV4ZvAhHo30JmeUv2wfv7DD26YvBEUn7d+VCeXcdU34LLuMYj
         uIALQP1Q8PLscwacN0g3iLUmIrz7x0XTAch8I7zn4Mw/J/tk9RiqWNk7OKjgCAkZrFUA
         hPUI6eNTefPZunG5EP/cr0C24VGiS8DvRuvb7yfCMRsaVGw1j81ziXjCXxCjmP1tiQRg
         a9J6O0mK3s2Tu5TRq5o5Yw4Oaxi7AhDqCIWbObqhhn6zhTaV2CPqUNr26+AgZ+UuNfWV
         yggA==
X-Gm-Message-State: APjAAAWe+IKrwnsLx0SmLP3hD705+FQ+AELtSCrlL6jhORHc4JOpQcAR
        sOa5VGyjgcVFEU4JaoXFDVhfON4SMfXv/ZsYvwvwm68gSKhGfXCQ/Eq/brYN6zMPheGssRlLFKd
        MN20TPuUJyh5MXmOVqiAVvY1HYQ4=
X-Received: by 2002:a81:9bc4:: with SMTP id s187mr8306894ywg.285.1575594033842;
        Thu, 05 Dec 2019 17:00:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIMImCE7iR91PGFys8iHvLY0Z0Z84gHtI2rM2xFVcCXCRRE1hLDFaC7Nzy3+dB8iGSwEDWjA==
X-Received: by 2002:a81:9bc4:: with SMTP id s187mr8306879ywg.285.1575594033599;
        Thu, 05 Dec 2019 17:00:33 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id d80sm5567735ywa.58.2019.12.05.17.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 17:00:33 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: davinci/vpfe_capture.c: Avoid BUG_ON for register failure
Date:   Thu,  5 Dec 2019 19:00:29 -0600
Message-Id: <20191206010029.14265-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In vpfe_register_ccdc_device(), failure to allocate dev->hw_ops
invokes calls to BUG_ON(). This patch returns the error to callers
instead of crashing.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/media/platform/davinci/vpfe_capture.c | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 916ed743d716..6d394a006977 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -168,21 +168,11 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
 	int ret = 0;
 	printk(KERN_NOTICE "vpfe_register_ccdc_device: %s\n", dev->name);
 
-	BUG_ON(!dev->hw_ops.open);
-	BUG_ON(!dev->hw_ops.enable);
-	BUG_ON(!dev->hw_ops.set_hw_if_params);
-	BUG_ON(!dev->hw_ops.configure);
-	BUG_ON(!dev->hw_ops.set_buftype);
-	BUG_ON(!dev->hw_ops.get_buftype);
-	BUG_ON(!dev->hw_ops.enum_pix);
-	BUG_ON(!dev->hw_ops.set_frame_format);
-	BUG_ON(!dev->hw_ops.get_frame_format);
-	BUG_ON(!dev->hw_ops.get_pixel_format);
-	BUG_ON(!dev->hw_ops.set_pixel_format);
-	BUG_ON(!dev->hw_ops.set_image_window);
-	BUG_ON(!dev->hw_ops.get_image_window);
-	BUG_ON(!dev->hw_ops.get_line_length);
-	BUG_ON(!dev->hw_ops.getfid);
+	if (!dev->hw_ops) {
+		printk(KERN_ERR "could not allocate hw_ops\n");
+		ret = -EINVAL;
+		goto rvalue;
+	}
 
 	mutex_lock(&ccdc_lock);
 	if (!ccdc_cfg) {
@@ -211,6 +201,7 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
 	ccdc_dev = dev;
 unlock:
 	mutex_unlock(&ccdc_lock);
+rvalue:
 	return ret;
 }
 EXPORT_SYMBOL(vpfe_register_ccdc_device);
-- 
2.17.1

