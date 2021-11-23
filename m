Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDE745A536
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbhKWOYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbhKWOYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:32 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6096C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:23 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a18so2696067wrn.6
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=X3YR3D7jDkth608Q2xrTyxVz7YVn86lN3yZSoQxZoFexTRrnS+6kKAZ43G2JITYJe4
         Upf0DDhuxnYXzFqL/5DOfI5UymbhoD2NU48tvC5vzrY9HrLR+SI2Zw3cTFDibnNCnoj2
         NOII2dZ4s8fV78kn8MOa2nXC+kIVWJJr/6ofnCZF/kP7/DP8n+E++Ul8DMTt7xiRi21q
         ygW5e6u35v8g/yVbPSvpjlFGh68bDqCgmk/BjgKDgqsmYQU4Kkk9g1fVPinc7SvJYpw1
         QMx2j4lrDSNddvbBoD9RytzzNM41FOcPL8mrKv/BsUvQxa8gda5YdR+2Ppr+meqYmCg7
         p1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=AJG4MIeElwdrY6PBGKRmf4UNCTCAYJc9x+a/A0rL6gAzMSDdJ1ZqIBDdw/fbawl23K
         fIPtEUpPWLtFMvZ/Ox4AlKfNHBn1qR0G1zALOnTtWC+jx0mJkd3mRpZ+0Nm1RNb92UI8
         aZv3/7MSI5YnUvRy9afxswJLJ0YJ8GfIVkaXnwpPHRsBmaxYSMSvUKGvJIrVMaFaycDN
         eaR4+dzLdKDp7Cg7xZAJOi3eFJQnG6DeWHlln7MNbST0+QQMDpNxgw/Qbos4AA3k93cy
         +u51494yEJF8x+QgonVwDE3ba5zOkp+YzKOLGdzxnvCraA4GpQimyvIlLxfVBH7acxlD
         B6pA==
X-Gm-Message-State: AOAM530AbHs/wApMbInVKTsAi9i4whAw4B8e7YPeoyp6Be1vh4R1fVT4
        e6P/mS4QKLLQnrE1sKeJwfk=
X-Google-Smtp-Source: ABdhPJxk7UP438KpT4viIsr1qknl/aSpARQvQaanASXfRg0L+I71MFJyOabCkFsyhYeNEnBTf1q57g==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr7755625wrt.31.1637677282511;
        Tue, 23 Nov 2021 06:21:22 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:22 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/26] drm/qxl: use iterator instead of dma_resv_shared_list
Date:   Tue, 23 Nov 2021 15:20:49 +0100
Message-Id: <20211123142111.3885-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm not sure why it is useful to know the number of fences
in the reservation object, but we try to avoid exposing the
dma_resv_shared_list() function.

So use the iterator instead. If more information is desired
we could use dma_resv_describe() as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 1f9a59601bb1..6a36b0fd845c 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -57,13 +57,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
-		int rel;
-
-		rcu_read_lock();
-		fobj = dma_resv_shared_list(bo->tbo.base.resv);
-		rel = fobj ? fobj->shared_count : 0;
-		rcu_read_unlock();
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
+		int rel = 0;
+
+		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
+			if (dma_resv_iter_is_restarted(&cursor))
+				rel = 0;
+			++rel;
+		}
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
 			   (unsigned long)bo->tbo.base.size,
-- 
2.25.1

