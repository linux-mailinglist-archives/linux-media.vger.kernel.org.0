Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE62041B904
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 23:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242881AbhI1VMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 17:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242860AbhI1VMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 17:12:19 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207E2C06161C
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:39 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id g16so651441wrb.3
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BshZZVKwdBlyyHBI8IqWe63R5Yq6DUQYXsV56Yu2uuo=;
        b=IZvfT3BfhcGs94bf3v3Da6bFccLoKIv9+bHRb30GpVaH+wYkDwVdqbe0YRyHsnb3mB
         DHOE2ju3CsckBASRSNzXZiXFTgp2moIS3Ur2zc+F1Oma9jQPSmC3RdZx8cYZISsrFU7k
         hhW/9qLcJYtH/fRUTeOQBprDyJtWcjmXGEqms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BshZZVKwdBlyyHBI8IqWe63R5Yq6DUQYXsV56Yu2uuo=;
        b=Bbc8R5p1qRLDMmrq1tHNH8dkDoFMuy9ulDWoNZhRUJyo8/y6rsD3UY6mJngDsW71fl
         uCWX532IFcHWiIbJL3pbLQYwH9w4wwqQ9Ac3TLEeQX6Y85NOpk8uYSyBDfITUihdxAnH
         /kfU7oHrdwh1lmCaZw7IfxSd2LkX79SbirtNRWQamg2OcfAfgXkmj+ESzjcYKvZmTMA7
         UVx99K16rL0nTTYVi9/KvvoMIgybMk2vE4A+pGalK4Pvs0Ot7nyPIdqujs+ExbF+dd0c
         l8ekCBMjHfY2Z4prrwT7KBos2IwUndEZpri3f6C7hqGzc1TMUUpF3LPcv9E25v8BBpwb
         232Q==
X-Gm-Message-State: AOAM530mcMtMkO8zXGNxfF6BkRkgQa1R1mdB7JYMufCZe0OmGk1R9kln
        lKNZV8joPJxySmFXnD5VZKAQsA==
X-Google-Smtp-Source: ABdhPJxcTAzxA8tDEC7we03mbt7Mf+/GqBwkhRQ5cM9jkRW7UdSzOjFqXTkEvhjGxPW0mM0hONW9PA==
X-Received: by 2002:adf:f8cc:: with SMTP id f12mr2513838wrq.195.1632863437817;
        Tue, 28 Sep 2021 14:10:37 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id n68sm3885773wmn.13.2021.09.28.14.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 14:10:37 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 4/7] media: ipu3-cio2: VIDIOC_QUERYCAP: Fix bus_info
Date:   Tue, 28 Sep 2021 21:10:30 +0000
Message-Id: <20210928211033.2415162-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210928211033.2415162-1-ribalda@chromium.org>
References: <20210928211033.2415162-1-ribalda@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 66995c6f15808..2594ac4eb0763 100644
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
2.33.0.685.g46640cef36-goog

