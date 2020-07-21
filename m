Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0723227CB8
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 12:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgGUKRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 06:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgGUKR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 06:17:28 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F976C061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 03:17:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id o1so10072697plk.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+q+SwIxmtmY9Sx81EleZKhYAND9OH1kntiZdkYfvU0=;
        b=qWUN5QA1aFxfB2DjiMqONNST2jbTf6OJYJuEncUgJ0vCiHbJxunBCOUDrf4lekJ8ha
         xuuUm8Cl2v7EumQrQheCESumNpdnZvcS/90E63isULze+vaWc8aZYciRvxhmhyyP0TSf
         Fx5i/21HwbbQOGJLhczghtvtyGJAlsTYvRpp+0AqdPzgsjBVROzbARZ5qgx2026dMlub
         TArir1DbUviFSysJwu5HANPdXBogPkA0ZUAF5zTOKrPGXo9tLNFEoeCG8VQ3YO8q5LMj
         G/H0qmzRixx5hp8uXhDFskCspzBv5cfBU+5AglKLR3sVFp2gP3rGCESR0X453einKieP
         5v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+q+SwIxmtmY9Sx81EleZKhYAND9OH1kntiZdkYfvU0=;
        b=W/jbmcNbuQ/IH/pSKLIzVegfz5Mmaf4XTtTMcD3kJJS0VrSWE66AxI6zgjomR4bJnh
         uSXOksLHig4EFh1Pp1MLaymA/7VcWyJTfxvZv21uimohJUjGbwrJ+gjWx90plhe3ly0U
         0X6duxu+Or7qZiwi0gPR7Wn9bN5P5N683lL1pA86mOKfjp4BMbxMNn7036aidkcwNHug
         AUrt/62F7lCuvb5R4UasxRp9SskKX8nHc3GO8GRFhUXFMqEqXQGWHZ9o/c6gd6F+Da+P
         OCJEOaLv57yY8lnSMK24s/gcevQXbk0DQe3SnqTeux8tZdKY1mFlCONL9h2vH1iqo781
         CEDA==
X-Gm-Message-State: AOAM530/4/m+l6tUCdBWchILdr3nw+NKN7RqPGMilHOle/eWsgpC/wVM
        /srhonP42oBx9KCKJbncqyUpnw==
X-Google-Smtp-Source: ABdhPJzcHPIg+Zax6xdjIuD6JIMyV7+jwiFE6h9cpHXvzWvIdo5+AtqiMlB4S1ecvEas79S1d9KNiA==
X-Received: by 2002:a17:90a:f68c:: with SMTP id cl12mr3570326pjb.116.1595326647639;
        Tue, 21 Jul 2020 03:17:27 -0700 (PDT)
Received: from C02ZK051LVCK.local.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id e195sm19694815pfh.218.2020.07.21.03.17.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 03:17:26 -0700 (PDT)
From:   Xin He <hexin.op@bytedance.com>
To:     daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
        sumit.semwal@linaro.org
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Qi Liu <liuqi.16@bytedance.com>,
        Xin He <hexin.op@bytedance.com>,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3] drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()
Date:   Tue, 21 Jul 2020 18:16:47 +0800
Message-Id: <20200721101647.42653-1-hexin.op@bytedance.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qi Liu <liuqi.16@bytedance.com>

We should put the reference count of the fence after calling
virtio_gpu_cmd_submit(). So add the missing dma_fence_put().

Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
Co-developed-by: Xin He <hexin.op@bytedance.com>
Signed-off-by: Xin He <hexin.op@bytedance.com>
Signed-off-by: Qi Liu <liuqi.16@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---

changelog in v3:
1) Change the subject from "drm/virtio: fixed memory leak in virtio_gpu_execbuffer_ioctl()" to 
   "drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()"
2) Rework the commit log

changelog in v2:
1) Add a change description 

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5df722072ba0..19c5bc01eb79 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -179,6 +179,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
 			      vfpriv->ctx_id, buflist, out_fence);
+	dma_fence_put(&out_fence->f);
 	virtio_gpu_notify(vgdev);
 	return 0;
 
-- 
2.21.1 (Apple Git-122.3)

