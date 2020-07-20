Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D786B226267
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 16:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgGTOpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 10:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgGTOpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 10:45:06 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D65C0619D2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 07:45:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m9so9155331pfh.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3fAHcvVg4jnZtoaiivjfSSE8o0hNzpTD9CyVyYtzCQ=;
        b=sOlzDOWuF+3RlEwNt2F5CrcNZqj5ddpZi3faZ9Bj9LGVNS+/HCg4ITjur/s9KGE8Um
         EErcgyT0YlA/Vt27osM+RlWCRgnYCvOrQ4GBds6LxWSoJswfyVQlYLuQQF68Dnlzhh/N
         R5CGaKX23fe1yNWLrh5YvObKYO5WeaPhCwMYmozzfak8l+EpGDYvzvQuF63JZrikisuH
         t2WnZ2wHL5+DY+e3BM/WH3zvaVAgJ9zjG/bN4CyIVFyvC8agiGULf1HyIpIdADzX9Ynj
         DqpxiUkonBkuuVA5KnJj8zC2eJ2/k5gQw5WXImWBYghWgRi1nRfPXZ1n3fOvYnehUEz7
         56BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3fAHcvVg4jnZtoaiivjfSSE8o0hNzpTD9CyVyYtzCQ=;
        b=hUAyyrAcKOTNq4NvUkkAWeIMx/pxPO+RO0BiF2H6NpvqCF1KcqeuH1vQC/9u8kPwXq
         ZOQpDWaEhDP+UrG78wms9vDUUJDRUaQpUVmyc7/KjJYKHGwtKv5ipFzk1wsKxYiAABk9
         0hK9GhrZ24q/DaTCrkckGIc7eh7qQB3tzHIRt4DEpjz178do2m8JSn65BbWIe8jbGgrK
         gvTHo9MDuvsDXwkoyhZFkevoP6WkwPr8k4Q5DkO5TZsLwNFkxh6vfyTj0q7o7WeTsGlK
         EbujEi41mQgrrYxtRlQe/zzjmTyZAjg6MRF/+LIJydMHSV1gLYtfhWxkH6BNVqSEaMRa
         9Cmg==
X-Gm-Message-State: AOAM530QJuG5DoGGosXLCENTjJaPQLICIoYBOVKeHftO0CxiaKqCZMiV
        n0ZPQWy9r9zZYHR/E8i9nir5gA==
X-Google-Smtp-Source: ABdhPJwRAonkAHS7pUDdFtQUFZnVnmqFela2Z+QxFm1cKeXlzbDX3rdGvU5oZ7BhRlEbOXhoueAOmA==
X-Received: by 2002:a63:7e55:: with SMTP id o21mr19414072pgn.263.1595256305771;
        Mon, 20 Jul 2020 07:45:05 -0700 (PDT)
Received: from localhost.localdomain ([103.136.221.73])
        by smtp.gmail.com with ESMTPSA id t13sm11951338pjs.17.2020.07.20.07.45.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 07:45:04 -0700 (PDT)
From:   hexin <hexin.op@bytedance.com>
To:     dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        christian.koenig@amd.com, daniel@ffwll.ch, airlied@linux.ie,
        kraxel@redhat.com, Markus.Elfring@web.de, sumit.semwal@linaro.org
Cc:     linux-kernel@vger.kernel.org, hexin <hexin.op@bytedance.com>,
        Liu Qi <liuqi.16@bytedance.com>
Subject: [PATCH v2] drm/virtio: fixed memory leak in virtio_gpu_execbuffer_ioctl()
Date:   Mon, 20 Jul 2020 22:44:07 +0800
Message-Id: <20200720144407.13706-1-hexin.op@bytedance.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

commit 2cd7b6f08bc4 ("drm/virtio: add in/out fence support
for explicit synchronization") deleted dma_fence_put(),
which will cause the memory leak. To balance the reference
count initialized when allocating fence, dma_fence_put()
should not be deleted.

Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
Signed-off-by: Liu Qi <liuqi.16@bytedance.com>
Signed-off-by: hexin <hexin.op@bytedance.com>
---
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

