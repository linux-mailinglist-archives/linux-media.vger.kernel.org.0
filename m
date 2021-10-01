Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5691741EBCF
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353871AbhJAL1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353790AbhJAL1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:12 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAC6C06177C
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id m22so9485650wrb.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gLZK8PdbeRKM6yKe+al6KCGRIW1PaVpWWADOyHb+A8=;
        b=c0PIqTzXBtRzvzFVdawJzOuSiftzl9N7n51LfPQzWJaaKBT5JjZq24sk8yNqXjPaXj
         g/1SSy0VHG8sN6JM3Wa8Q+/IGSdMAiqQuyLVe59SeOqwCgXZ3sjZ5xPLvJpLtzOv8rdF
         AOwVrGwpuZOQY86VZAqH8m9gyP4ddgl6WDRVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gLZK8PdbeRKM6yKe+al6KCGRIW1PaVpWWADOyHb+A8=;
        b=OSq8exsJDlcRgnXUzDrCb+g/b1rGjbtzBCDNyoKfk87ZAMjWHiOT4/pKNWtH73goNc
         zByzHrmnh16nfXVkuclA6SZ1PT1Hyv+GeLksJSQvQdOKYIzCkVDrqeokbrvpQhZsybj8
         bvHAvT/nLFkvHlnFsDMrHWslniuQU48Nr+YKEYrm2noUfoWy9qLmovEpaBSs1YPZEKcl
         /eGBrpdP6xgNPgth2tOOjqi3rY04jUoVHIx5BUcP9eEW+3RrNuMWF/4QVcyxOdtjLfUr
         0iGetT9iV4g2CHZjHRpSKfknVZ4OAXaqHtIGBjnnR85SJ7H+cuWh1RqdX/A3yztgWBkV
         +9Tg==
X-Gm-Message-State: AOAM5305ae6VzxpFxxJEQEAYFRK7xydH1J9qTf2v5QeErSIR4y0kxzbf
        8YPiWzk5MVEGDHhvSOa/KWJzuA==
X-Google-Smtp-Source: ABdhPJy95MV3Hw38b9M9wQ2e1shQruJUA56ulLoiyN0inVxJ49B1Cj2pJDAMgj7NUny7mUv+DLHd/A==
X-Received: by 2002:adf:fec6:: with SMTP id q6mr11481828wrs.122.1633087527336;
        Fri, 01 Oct 2021 04:25:27 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:27 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 5/8] media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
Date:   Fri,  1 Oct 2021 11:25:19 +0000
Message-Id: <20211001112522.2839602-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211001112522.2839602-1-ribalda@chromium.org>
References: <20211001112522.2839602-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

bus_info field had a different value for the media entity and the video
device.

Fixes v4l2-compliance:

v4l2-compliance.cpp(637): media bus_info 'PCI:0000:00:05.0' differs from
			  V4L2 bus_info 'PCI:viewfinder'

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index bf3cd1d576280..a2164b6708236 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -592,11 +592,12 @@ static const struct imgu_fmt *find_format(struct v4l2_format *f, u32 type)
 static int imgu_vidioc_querycap(struct file *file, void *fh,
 				struct v4l2_capability *cap)
 {
-	struct imgu_video_device *node = file_to_intel_imgu_node(file);
+	struct imgu_device *imgu = video_drvdata(file);
 
 	strscpy(cap->driver, IMGU_NAME, sizeof(cap->driver));
 	strscpy(cap->card, IMGU_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", node->name);
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
+		 pci_name(imgu->pci_dev));
 
 	return 0;
 }
-- 
2.33.0.800.g4c38ced690-goog

