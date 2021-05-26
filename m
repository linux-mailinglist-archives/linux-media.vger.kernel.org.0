Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B1C3912F0
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 10:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhEZIuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 04:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbhEZIth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 04:49:37 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7904BC06138B
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:48:03 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q5so215938wrs.4
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
        b=Lqd5jcfBOyTJPW2tFudt8CJv9J24bMfUhxeVIJZ8LmLI4SntnbTDRQQKyC6gpxAHXz
         9bN24AK6T739jCAH8GscQi8AgLUwd+1GsQcwK5rlRKI9kY7T5vOPO8+dZWVsWF1LSCZ3
         vG+j9kMH6Avl7hje6v2lDCjezgRtIi2s8bjtXVftIff6+ZLU1WMKEWszoAmYPFPG+d0M
         l9HPG8kGlyHpAOjOVi8ub43lhmZysDxIVeNgKCjW/MPBpSpJ6EgC0SlVBD4MLyN3Lhk6
         xoqjjLeGwk8V6oZ2P+P27keDN+hsF4syPgMq8Kv2GGg9MDJI2j+cjGbUixn0xhZfGkxW
         N0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
        b=piHqTFHvKUw1J1zaZvvRpB/XyeGCyKjMFYxB2vLY5guVKEtpsY3INtBK/qLBs5d0R3
         wXGyEybYgwuqffGZwBh3cPp5pq4LA96pKBLLOlQefViewqiQkB5U5HQyqKWcLvPHQ/3G
         01mUuwL23XojXUVmvFTWlSZ8Aiey/rb1BTRzMvfo5p5zyyFXxv0uMoSsMDnOjte+GYsR
         4SInfP2J5UDs2CVULDEoOBCecj69B7bwch46k8g2j7O0nhiWs5Nb6Cgbcbi9Dciqz61+
         9rqQwbBCh/Qb24bBCbpLjUDpraORB4yS1BykBGuGBgvdPApJCyjaimsi8kb3+IeLkADW
         6gPg==
X-Gm-Message-State: AOAM5330BF1/0pKrZUHe6JI9geTFhxIt16eyCtkpqNxcLET4OLgMkdCg
        zF6EfMqOOduscoLeoafWkqsaJQ==
X-Google-Smtp-Source: ABdhPJwxA+jqhLj0tvDnM1PGh5FH/QBEyrCkQJOeG+4sHZp0/bgWOd+eUHWE5+4mhkN/TVbBG84CAQ==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr31620387wrr.304.1622018882087;
        Wed, 26 May 2021 01:48:02 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:48:01 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Adam Jackson <ajax@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 30/34] drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc format
Date:   Wed, 26 May 2021 09:47:22 +0100
Message-Id: <20210526084726.552052-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vgem/vgem_drv.c:47: warning: expecting prototype for This is vgem, a (non-hardware(). Prototype was for DRIVER_NAME() instead

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Adam Jackson <ajax@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a0e75f1d5d016..bf38a7e319d14 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -25,7 +25,7 @@
  *	Ben Widawsky <ben@bwidawsk.net>
  */
 
-/**
+/*
  * This is vgem, a (non-hardware-backed) GEM service.  This is used by Mesa's
  * software renderer and the X server for efficient buffer sharing.
  */
-- 
2.31.1

