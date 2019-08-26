Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275749D211
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732752AbfHZO5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39079 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732728AbfHZO5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id t16so15646376wra.6
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
        b=qeKxET1vWhHPxQ4iunIz2aRkITtcG3b5AeVbzHcW4ifXzqW3KpSvJ9pZ4oqhPbCVfj
         ADPodVrn1rXgU69JzhEGWn2gJKYQbhy5XDfe80WtLei5vSkILKPpVjYn5zP8mYySNZEv
         94qANYWZD2RJtXmAPRnXDSnEctm2rJwmr8Jz3UjSCo3G380pseH+lRKpVlkXHBuF1405
         QgPwGRUQmki4DXe1SsGWAkLqIVqAuSBieDAoi1UwNGdONU9a4K+WwKkoU8LSW3aWnhfa
         ge17YnTn/9nMsItOI3esrJJKmP33xxw4WNjCBpJOAW44Iu880kH0zH6rnU3f0bfG7510
         rc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
        b=HO/AdqgHmvUz8s+GprPsq9WkcHGP8X/6tD3cTkdtPUidcuhXlpjSFcefm5R8yc3Ncl
         uAUyMWuL8/oJClt7wi5jZyz/nlfC6yYrPRTTdHmcMRwkqHKBO9QuX7XMXdHjTPqxdyU0
         3vDAzUAIxwizwnXt+2cJ+QwXJJtzUMo/GHgJqjPJqW2x4vjMitFPBEynM5oEYoujfGlK
         Pp1RzR79QEFpZyAPVDZg83jfP0exdIS2I9eDDkw5XIODHqi96GnlZqBVqAkDsDNZIpY3
         AKdUgktmUVgcxpDhfwD76FsggmZ/FFsZpHfclpaShjzI4GHxC4G2C9XPxH3sdl0vUOUN
         jSow==
X-Gm-Message-State: APjAAAWu46B7nUSaD1bbhFca+Sh9ih2gENt54Y45VcGjlgjSYNXpcpJJ
        UHnSdNRpqQVOW/HNaPW2730=
X-Google-Smtp-Source: APXvYqwyavJtqHKKFG9/Pq0hDSbK0sjA/XLM8TXsnzlM+VWfYqXqebeBxy61gjNb6QCvvBU9C7spAg==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr23121481wru.177.1566831455056;
        Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: make to_dma_fence_array NULL safe
Date:   Mon, 26 Aug 2019 16:57:24 +0200
Message-Id: <20190826145731.1725-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A bit surprising that this wasn't already the case.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence-array.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 303dd712220f..f99cd7eb24e0 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -68,7 +68,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
 static inline struct dma_fence_array *
 to_dma_fence_array(struct dma_fence *fence)
 {
-	if (fence->ops != &dma_fence_array_ops)
+	if (!fence || fence->ops != &dma_fence_array_ops)
 		return NULL;
 
 	return container_of(fence, struct dma_fence_array, base);
-- 
2.17.1

