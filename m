Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25F2C1313A3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 15:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgAFOc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 09:32:58 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:43342 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgAFOc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 09:32:58 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47ryfK3DVzz9vYkC
        for <linux-media@vger.kernel.org>; Mon,  6 Jan 2020 14:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MvVYQxA6SP6P for <linux-media@vger.kernel.org>;
        Mon,  6 Jan 2020 08:32:57 -0600 (CST)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47ryfK28rtz9vYkv
        for <linux-media@vger.kernel.org>; Mon,  6 Jan 2020 08:32:57 -0600 (CST)
Received: by mail-yb1-f198.google.com with SMTP id a14so40069463ybh.14
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 06:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5l0p/vFRPZk6guP1BnAdEk2ZYGrbFqodbRjZ+j59qOY=;
        b=Kq7Cs7IZotx/82WeJdfwB9MXJggXXaHssfFQoQTrFQaJzvY7GPa/fMpe/4kUCTqmzc
         gK/zkpKz5SLclirD9vhP4CpBEXiww7a1/Ic8JubeyQU/BL0zqPfVUXYZrgUz5XVQGYax
         Dk/fwd/EGzATrxMizGpvFosb4bhr9w0iMVaUmOr0+eV54OLfeS9bpUfsyDYBbG4VITan
         nLB9pRBiSgkcTJ/vwobgF/tWqU12sYsZLGaJui38RUlDEJ6VUPi6/orZ2S2dWvSF/NeV
         fQ2npo/MLkGGwWx3lGGUNBcvdahsa70Ud+h2lFu9rXahpD1kFB3LGy3WR34HsYWX+rUY
         Yh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5l0p/vFRPZk6guP1BnAdEk2ZYGrbFqodbRjZ+j59qOY=;
        b=Rg7sHEb7kWI8Kwcc4mqeYvnTLJeqadfacic+BZDDCbiBK9WxYpUtImkjWBgRDICazO
         +nzFnxBmyd3R0EnEyvKyJDPJYHaMhKe6a0oA8g4VqHaDifdxDKChDSdnnwWCRPQAgSjz
         Y9E5S+MZuKAxOvbUxC16iz8Jz30px/rOKjdGhbVBJlXRohIsxkufB+Z3TZFC9UNoohy4
         CVsw8DsDZnxQAO0CloU3JT82VRY9AIGcT5dRxtHH4sqxFDQwL1PQtuznuIOXEGe4pC9w
         hok7/ZCWtyEv5iNN2HeQX+qg8NWvZVeQr4gsv9UNvzTsooSsVNdJKs1wFpfa0Uu6Pb2/
         HvgA==
X-Gm-Message-State: APjAAAWF7SiYJpvgJ0hWKss3buEfrPuMFE4Q+UOuVIOQqgwjHVm2Ho+H
        Ov46pED97tZ8mVNQ4ERCU0bRbLL/NL8adV2kxr3BThFMQBNZ9aECMmOdyOZPZabqmLXuyxfgNi4
        9F8q9zDY+pIl2eLOI/0CoV3QCVoI=
X-Received: by 2002:a81:6c55:: with SMTP id h82mr77451862ywc.311.1578321176372;
        Mon, 06 Jan 2020 06:32:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkV68WEDTQEyoyXmVebbHWiYnKmmEY9oPOGZeSJpiKfLcQmzj74d8oPwzY9h6TRNWXkKX1Xg==
X-Received: by 2002:a81:6c55:: with SMTP id h82mr77451819ywc.311.1578321175824;
        Mon, 06 Jan 2020 06:32:55 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id w74sm27845121ywa.71.2020.01.06.06.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 06:32:55 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: davinci/vpfe_capture.c: Avoid BUG_ON for register failure
Date:   Mon,  6 Jan 2020 08:32:51 -0600
Message-Id: <20200106143251.11684-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In vpfe_register_ccdc_device(), failure to allocate dev->hw_ops
fields calls BUG_ON(). This patch returns the error to callers
instead of crashing. The issue was identified by a static
analysis tool, written by us.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
v2: Fix alignment of checks within the condition, as suggested by
Hans Verkuil

v1: Fixed the type to a regular variable instead of a pointer,
also added fixes suggested by Ezequiel Garcia.
---
 drivers/media/platform/davinci/vpfe_capture.c | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 916ed743d716..9b1d9643589b 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -168,21 +168,22 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
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
+	if (!dev->hw_ops.open ||
+	    !dev->hw_ops.enable ||
+	    !dev->hw_ops.set_hw_if_params ||
+	    !dev->hw_ops.configure ||
+	    !dev->hw_ops.set_buftype ||
+	    !dev->hw_ops.get_buftype ||
+	    !dev->hw_ops.enum_pix ||
+	    !dev->hw_ops.set_frame_format ||
+	    !dev->hw_ops.get_frame_format ||
+	    !dev->hw_ops.get_pixel_format ||
+	    !dev->hw_ops.set_pixel_format ||
+	    !dev->hw_ops.set_image_window ||
+	    !dev->hw_ops.get_image_window ||
+	    !dev->hw_ops.get_line_length ||
+	    !dev->hw_ops.getfid)
+		return -EINVAL;
 
 	mutex_lock(&ccdc_lock);
 	if (!ccdc_cfg) {
-- 
2.20.1

