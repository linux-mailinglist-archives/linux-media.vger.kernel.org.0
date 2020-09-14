Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E6B268C4E
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 15:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgINNhC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 09:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgINN3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 09:29:55 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1CDC061788;
        Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n13so17550919edo.10;
        Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ShM3ina3e3/hH7dOyVac4CL9sFVc4RQd6mh3jLnIlg0=;
        b=pUG+6EgLO2UPiBn6Yk4D2WmMQ/2yB7GdzCr1j99p7omOVBGUkd7OME2Fcch33BqK1h
         kRoISKMKO5KS64Eoe/fHBFeNwV6nFMzIKjBkMfXBmA4CS+3/ttEr8EbhVHNz9ZsbSKC+
         tYgEBRJJqVRXOcxWBasjfP0giKeqzan4zln/A47HPqfQB6JFTqJfBGpbRUO/fyQwbUal
         UdqQUeN+a9jSnmr+R3MdQ6PbF9DaVnJ+dE5LVNIofNGl83vr4fPPxwNAhIod4K+nZZ4S
         S/jizlrTm17N+FilPGRnJONY9iEJiG9iXj+/8ipwpTSCARh5J35nyMCPQkiynXVYWbZ+
         uZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ShM3ina3e3/hH7dOyVac4CL9sFVc4RQd6mh3jLnIlg0=;
        b=JSF5mFcnaZTqJbV7OhaEqqG9RR+Dk+UhFGVuKfrg/va3h/ME5Pnw51Vz92Lt1RitWk
         zp06XFrqGGF0RaxZmmjv8UEWbqRWORsuY90ed4tWaOUE7eY4ubbuLZnquueUGqLyqz/h
         27XJh0xD7jh5QieZ/pijW76LUqit5Y7vHQCzN+MqYp8TPOFkBRekr762MZLNxXIkgzRN
         AJkqXIMz1KjCeBzTMDT/L1xgeHENF0o3BJWKN2IeMsc9Vhm9RJii+6WJ32zgSubN9BhG
         IKRcVc0xKZcZN0hgKvCXnZlSfItv4fvEDQrj81Zln5ig51DOJyCaLp550Dkp8JV2TYe5
         Ob0w==
X-Gm-Message-State: AOAM530TwBYI+t8Zj0RFWRjAP2X1M2rat0Qo9kUzqgW7f85BDz8A4gJk
        bLoXq/vCvKULXjVYxuyLtws=
X-Google-Smtp-Source: ABdhPJxDNWaaOe6mtDbVu9uBxPuALA0/yZsLGV/qaVVWO83ofnwCuhSwypEKZj15QfAv8gcowcwWvA==
X-Received: by 2002:a05:6402:17b9:: with SMTP id j25mr17411290edy.203.1600090170135;
        Mon, 14 Sep 2020 06:29:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6179:d701:8021:da3d])
        by smtp.gmail.com with ESMTPSA id d6sm9575625edm.31.2020.09.14.06.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:29:29 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported dma-buf"
Date:   Mon, 14 Sep 2020 15:29:19 +0200
Message-Id: <20200914132920.59183-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914132920.59183-1-christian.koenig@amd.com>
References: <20200914132920.59183-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 26d3ac3cb04d171a861952e89324e347598a347f.

We need to figure out if dma_buf_mmap() is valid or not first.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0a952f27c184..cd727343f72b 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -594,9 +594,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	/* Remove the fake offset */
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 
-	if (obj->import_attach)
-		return dma_buf_mmap(obj->dma_buf, vma, 0);
-
 	shmem = to_drm_gem_shmem_obj(obj);
 
 	ret = drm_gem_shmem_get_pages(shmem);
-- 
2.17.1

