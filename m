Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83AF92B4E56
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387682AbgKPRok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387702AbgKPRlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:37 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EF9C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:41:37 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 19so55897wmf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
        b=k6Jv+7mHwhLKPJA/QCG06ugtxDKWpQTKy+20nzwFKSS58MARf4S8W8ACDDJb9At+kN
         Zj7BRm0cL5pJuZG03JgKNEOyxkFzKQDZEoeq6JKwur3GNW3waj1+cD/cATWqphXb/N3E
         Hwel7NdYgPQ30GBKTzLyGySsqlcZlYoScXIJf5HNpiV7Q9NiuYvKyh5I1UrBg1kr6UbV
         iCLuVTvJ0zQs9VHfs2J9H/qqPEg7slFJP5MGKs7bVItDI9ChEjoM5eM4spQGw5YLHt1S
         zBTagqyBF4NDMKbJ0sdlBYLtRa1aopP+KNyfSJbABRD/2iFY3eTiXtqFZBU8xFpxWZ8o
         d/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
        b=r9LrXfHRBUOg8DUN2VJq6K7xoAlhmq3VNAtE9LpazaY7tt83Q3RipLyTutfGI49/Ih
         X65X2h6AFgdqzTUQPqlStNgwbJo60lBv5mJSai/lIK3AtK72E8p5OxJISv5Z/FkHAEuH
         1tE4L3PGo9DhpZiY2F7GJnITx/9CDVbbbFTcT/BM110t1KyCyhZecebF490gX01FDsb7
         ecqjZaROk4D7oJ3gW5FMt8Vd0sEH+FHO9OyTHGYPI7WR2ibZ81o+aOIt+vXtbislS7A2
         e8JTTLrTSqdyO8Kd3n6o9Ne1AEh48DZJMFI0lQfvpJOihUujFN4B1nIREY2MA9NkpDMH
         kP9w==
X-Gm-Message-State: AOAM5304CB2KT4rshm7CrhsGSz/auEv2BBxj+m7ow04QTE6zQOeyOTnT
        N1OWuKJSyjc46iv/zJzaK/33xw==
X-Google-Smtp-Source: ABdhPJzqHnsBJooc4S8laQMeNPmpnnuKV6rHd3UhDvssbsZxsM79tG8D8ZiF2nH5S1+VMw/gXxelZg==
X-Received: by 2002:a1c:5f83:: with SMTP id t125mr30364wmb.82.1605548495973;
        Mon, 16 Nov 2020 09:41:35 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:35 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        YT SHEN <yt.shen@mediatek.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/42] drm/mediatek/mtk_drm_drv: Staticise local function invoked by reference
Date:   Mon, 16 Nov 2020 17:40:42 +0000
Message-Id: <20201116174112.1833368-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_drm_drv.c:316:24: warning: no previous prototype for ‘mtk_drm_gem_prime_import’ [-Wmissing-prototypes]

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: YT SHEN <yt.shen@mediatek.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2e8065b1e2bbc..401311453e7d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -313,8 +313,8 @@ static const struct file_operations mtk_drm_fops = {
  * We need to override this because the device used to import the memory is
  * not dev->dev, as drm_gem_prime_import() expects.
  */
-struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
-						struct dma_buf *dma_buf)
+static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
+						       struct dma_buf *dma_buf)
 {
 	struct mtk_drm_private *private = dev->dev_private;
 
-- 
2.25.1

