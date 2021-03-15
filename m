Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD7733B2DB
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 13:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCOMef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 08:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhCOMeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 08:34:11 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F82C061763
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 05:34:11 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id e19so65968691ejt.3
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6fzzF2nTd+REl5qE5E9llLopvCzR8WvhV0GzxYvbKiQ=;
        b=hoyWYL6Ua5bHjZ5fFiNjWiTwgVHOeBMTl+C5u13Hz9ANPNeqiQqB5bdkXQOvPxa4JC
         TXZrjnLLJzAUkFsn3tNWaX8h3rYBk90pIGTe4hmFG7FsbEsYNyD8330Qq0UeAvATAY2r
         OAS+nnMyIWc8xYtIds8GqZY6O2L+O+c43FTIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6fzzF2nTd+REl5qE5E9llLopvCzR8WvhV0GzxYvbKiQ=;
        b=EVFTGTWoNBmYAfszn5UxRZQfZ6weIUDYIGLN/3h7iBFhZXpMQeMl713HwWEx1sRPmR
         iLiw0AOWjooZ0yw5f7ni+zCVrfXRyPdttIWz4X/8CS+QG63LMiHbQ+wJvMOz22aDkcWJ
         jMJLdHEmGctBKq+o7Pn5bRtG9lZz3c9cG4kBIbbzziCxii2s2zlm1pS/1uo+y5bFxIfE
         OHstbGeuT40OTNF1bPqyEAYp5bDcpx2KJLHAoQc3YhSGsrxESJrIZmYmeduzS8TV4Zq5
         /fDgJRsAii+RtrOG9hgc24li4KKDlzXs9QKibpiA83B4D7fM0TN/PdPnDrC4MyJ6QMDt
         18pQ==
X-Gm-Message-State: AOAM530DadJ4kGugD1zJznZDH6XcYLdDYzpFGYDAqE54iisi5tce4wrd
        yrkL5ty44UaB/xmlp2e5VfrpAg==
X-Google-Smtp-Source: ABdhPJyOPSGp9sA5eXQVAxbFL4UxF/O8joRa0JjAWd6X3k2uT1JpqKrHlwRtbH8Vpz2mWPC4OuSQOg==
X-Received: by 2002:a17:906:b297:: with SMTP id q23mr23580704ejz.315.1615811650164;
        Mon, 15 Mar 2021 05:34:10 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id p3sm7155128ejd.7.2021.03.15.05.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:34:09 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v2 2/2] media: staging/intel-ipu3: Fix set_fmt error handling
Date:   Mon, 15 Mar 2021 13:34:06 +0100
Message-Id: <20210315123406.1523607-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315123406.1523607-1-ribalda@chromium.org>
References: <20210315123406.1523607-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If there in an error during a set_fmt, do not overwrite the previous
sizes with the invalid config.

[   38.662975] ipu3-imgu 0000:00:05.0: swiotlb buffer is full (sz: 4096 bytes)
[   38.662980] DMA: Out of SW-IOMMU space for 4096 bytes at device 0000:00:05.0
[   38.663010] general protection fault: 0000 [#1] PREEMPT SMP

Cc: stable@vger.kernel.org
Fixes: 6d5f26f2e045 ("media: staging/intel-ipu3-v4l: reduce kernel stack usage")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 35a74d99322f..6d9c49b39531 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -686,6 +686,7 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 
 	dev_dbg(dev, "IPU3 pipe %u pipe_id = %u", pipe, css_pipe->pipe_id);
 
+	css_q = imgu_node_to_queue(node);
 	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
 		unsigned int inode = imgu_map_node(imgu, i);
 
@@ -700,6 +701,11 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 			continue;
 		}
 
+		if (i == css_q) {
+			fmts[i] = &f->fmt.pix_mp;
+			continue;
+		}
+
 		if (try) {
 			fmts[i] = kmemdup(&imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp,
 					  sizeof(struct v4l2_pix_format_mplane),
@@ -728,16 +734,10 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		rects[IPU3_CSS_RECT_GDC]->height = pad_fmt.height;
 	}
 
-	/*
-	 * imgu doesn't set the node to the value given by user
-	 * before we return success from this function, so set it here.
-	 */
-	css_q = imgu_node_to_queue(node);
 	if (!fmts[css_q]) {
 		ret = -EINVAL;
 		goto out;
 	}
-	*fmts[css_q] = f->fmt.pix_mp;
 
 	if (try)
 		ret = imgu_css_fmt_try(&imgu->css, fmts, rects, pipe);
@@ -748,15 +748,18 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 	if (ret < 0)
 		goto out;
 
-	if (try)
-		f->fmt.pix_mp = *fmts[css_q];
-	else
-		f->fmt = imgu_pipe->nodes[node].vdev_fmt.fmt;
+	/*
+	 * imgu doesn't set the node to the value given by user
+	 * before we return success from this function, so set it here.
+	 */
+	if (!try)
+		imgu_pipe->nodes[node].vdev_fmt.fmt.pix_mp = f->fmt.pix_mp;
 
 out:
 	if (try) {
 		for (i = 0; i < IPU3_CSS_QUEUES; i++)
-			kfree(fmts[i]);
+			if (i != css_q)
+				kfree(fmts[i]);
 	}
 
 	return ret;
-- 
2.31.0.rc2.261.g7f71774620-goog

