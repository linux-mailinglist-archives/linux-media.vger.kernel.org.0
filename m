Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22733F047C
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 15:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbhHRNUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 09:20:45 -0400
Received: from mail-m971.mail.163.com ([123.126.97.1]:43348 "EHLO
        mail-m971.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbhHRNUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 09:20:44 -0400
X-Greylist: delayed 921 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Aug 2021 09:20:43 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1ty22
        VOMwZz6zNP9VFFtEN/bLi/9Opdu0wufpsZYxvU=; b=i7B4+rwLQ+mjFUw+4LiCg
        wuTOwj4+GIIggPwv/s+CqaBR5YrmzueXWvpchOZeltR7OomoWEgxjXu46GIz/Nga
        ukQC0qXZ0dOA3Quo59Pt0Ywa3h5QiIWMzHlplguIbLNAWJjdyLv6sP2XreKZZuzD
        EwMhX7wwXVHfiayv6MqLZk=
Received: from localhost.localdomain (unknown [111.201.47.26])
        by smtp1 (Coremail) with SMTP id GdxpCgD3FkzqBB1hdtlmOA--.179S4;
        Wed, 18 Aug 2021 21:02:41 +0800 (CST)
From:   Wentao_Liang <Wentao_Liang_g@163.com>
To:     maarten.lankhorst@linux.intel.com
Cc:     mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
        daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Wentao_Liang <Wentao_Liang_g@163.com>
Subject: [PATCH] drm/prime: fix a potential double put (release) bug
Date:   Wed, 18 Aug 2021 21:02:31 +0800
Message-Id: <20210818130231.3484-1-Wentao_Liang_g@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgD3FkzqBB1hdtlmOA--.179S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4rGF4xWr43CrWDJr17Awb_yoW8Kr1fpF
        WYyFyUKrWUtF4jqFyfAF1kZan09w45Ga1xXrW3Jw4Yv3WFqr1DWF9rAr9Fyr15G34Dtw1S
        yFyUXry5JryUCF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkYFAUUUUU=
X-Originating-IP: [111.201.47.26]
X-CM-SenderInfo: xzhq3t5rboxtpqjbwqqrwthudrp/xtbBQhHyL1++M90j-wAAsd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In line 317 (#1), drm_gem_prime_import() is called, it will call
drm_gem_prime_import_dev(). At the end of the function
drm_gem_prime_import_dev() (line 956, #2), "dma_buf_put(dma_buf);" puts
dma_buf->file and may cause it to be released. However, after
drm_gem_prime_import() returning, the dma_buf may be put again by the
same put function in lines 342, 351 and 358 (#3, #4, #5). Putting the
dma_buf improperly more than once can lead to an incorrect dma_buf-
>file put.

We believe that the put of the dma_buf in the function
drm_gem_prime_import() is unnecessary (#2). We can fix the above bug by
removing the redundant "dma_buf_put(dma_buf);" in line 956.

 314     if (dev->driver->gem_prime_import)
 315         obj = dev->driver->gem_prime_import(dev, dma_buf);
 316     else
 317         obj = drm_gem_prime_import(dev, dma_buf);
 				//#1 call to drm_gem_prime_import
				//   ->drm_gem_prime_import_dev
				//   ->dma_buf_put
 ...

 336     ret = drm_prime_add_buf_handle(&file_priv->prime,
 337             dma_buf, *handle);

 ...

 342     dma_buf_put(dma_buf);  //#3 put again
 343
 344     return 0;
 345
 346 fail:

 351     dma_buf_put(dma_buf); //#4 put again
 352     return ret;

 356 out_put:
 357     mutex_unlock(&file_priv->prime.lock);
 358     dma_buf_put(dma_buf);  //#5 put again
 359     return ret;
 360 }

 905 struct drm_gem_object *drm_gem_prime_import_dev
 							(struct drm_device *dev,
 906                         struct dma_buf *dma_buf,
 907                         struct device *attach_dev)
 908 {

 ...

 952 fail_unmap:
 953     dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
 954 fail_detach:
 955     dma_buf_detach(dma_buf, attach);
 956     dma_buf_put(dma_buf);  //#2 the first put of dma_buf
								//	 (unnecessary)
 957
 958     return ERR_PTR(ret);
 959 }

Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
---
 drivers/gpu/drm/drm_prime.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..cef03ad0d5cd 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -953,7 +953,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
-	dma_buf_put(dma_buf);
 
 	return ERR_PTR(ret);
 }
-- 
2.25.1

