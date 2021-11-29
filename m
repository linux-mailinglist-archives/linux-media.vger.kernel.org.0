Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00769461640
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbhK2N3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377838AbhK2N1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:08 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFF9C09B057
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:08 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a9so36269015wrr.8
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=mMBkEjAb2V9hwLba+xllKCVItFPWEMhA4xIys9tcDkl56iSm77cJAnwB4dnctg5CcS
         bDHTl/TeN4e44OGiNeuL3fQP3bKAc+15Fvm6/VXVULuMKqi6Le+8HmwVK8on4QVUb9nR
         IlIq7C+Pe61xHO1/fS5uRzcy+6Z55GNc6JxeutpGkYQ8SLsvSC8+bcyIKYBmnTuIUm3O
         Y/DA8Py9Zse3uX7SZiwzTnEZAqs5bhidFOBlUkA1B93/tFC18qiUfXrewljTv3K5Lk0U
         htU4haudwsxS3JZsBBm3gZEpLvbdQlQdh4xwObaczzccol9hd2hMfZz/UPydY1p1vAlf
         vsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=X9DRIWhydz6JT7+eTzV/3V4cxkOjfsvafX1O9oxHajtREM0vVfBzGKb8YIIT6CNoyS
         oHdZFrECgKDekDm591KxpWU2DVUkbSZJXtzgXqg4zeCPNTF2zkP4MRz868Z0qVY/o3j/
         upY9m+hc0ah8hKzKdfzXjFw2HJn8CwmSajYaTH34VbRivjhbZtVZwxVl2hOZNERE8uko
         GJgovSK6YnBIhdBmBoP+at6xMjWf5ycbpeqeQjXHWyMktkkQ8CqtMPV866ZSIRxYOoWw
         PMZZoEDGdZByGqakQZ+uukGVSgpLOy02n08N61XcXV0TXziJ9AcOQAndpjBS1poxFXMh
         yONg==
X-Gm-Message-State: AOAM531Jz40pXLA7sQGaga/8A/AT1KtyEgefArhEfQ8BwJChkLVqwhhN
        Q+xLVYqc+UIApQ94iKlkrkLVJu36H/E=
X-Google-Smtp-Source: ABdhPJw5XzuStawRpnnCTuKzSotUgvYOfiiTDZQIfIOnFaHslSDTW7ESFD1Euk76wFZy2dibJ46q7w==
X-Received: by 2002:adf:d22a:: with SMTP id k10mr34327677wrh.80.1638187626698;
        Mon, 29 Nov 2021 04:07:06 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:06 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/28] drm/qxl: use iterator instead of dma_resv_shared_list
Date:   Mon, 29 Nov 2021 13:06:35 +0100
Message-Id: <20211129120659.1815-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

