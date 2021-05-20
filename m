Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8147D38AEA8
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240802AbhETMnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242606AbhETMnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:43:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96492C056486
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:02:56 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso4930814wmc.1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lGLjcLP6XbktLbs6h51Tzfo9UCd4ALnwNCABJxfHlD8=;
        b=RswVceEghKvRou9H+Y+n/4SGLr0iHCK4YwE3OtciUiXOYGX33RrcazH0XHhG0gM+FR
         gDrggVWuc+eJ1ovzgkuY+nVHRfRMrHXKxfrg+GjAq4UJ/sIPYyWgLURB/U1ydhi+rjL4
         a0gT7DPM+iyP3Hdl+CY7cNrDKLkgXD97xlVuD0YpS0TAa4vANNYC4IZAtHLY7yOiIGnZ
         TsXH7/P3K+/tLqt6ivBjAxI4vTZTF19wicEn7EeqL1MYCjzYWyLcJe3EkWuV3k4dV2u7
         WSngNPnxaWDxif2K48yALBZJ+wpI3RYui68JmuoX7vY6B1uSkUmP+m9gPbGh1rpieE3S
         mQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lGLjcLP6XbktLbs6h51Tzfo9UCd4ALnwNCABJxfHlD8=;
        b=PNZol0bB+Si6E71MzVpByi9BqJtKS2OWDtYxhitQtUjQBeBKEOWyxLP5W1uKaWf2D+
         HfHSZZZAx8I6nlCX8D8+JlHPAaX0CARDxNh2U+mKILVIsnekSmtqOGCmCQYymXHwAOwl
         25aYpk6GEni4wxH0tdeVwA6AqFz9IoD/hxi6tFn6+eG9EIj+7ZMeR5INOn7HNZDvxgsH
         m1UUpMA6ejyKERMO9GhR5f3+vUabvEvS2xHUz1N3HmLNQfi5slFiAu4glqxE5KkXs9hv
         qk5nKzCHL97eviAr+kO8IEAc4SRqXsmDdfsth1pR8pTlRTRRqk1Ac8BKQHq0Q2ZdStvp
         JUSg==
X-Gm-Message-State: AOAM5320UNDMiUfXg/TSHx0e7///AF88/n3tRejA61fPhf2Md1YcstRQ
        lHgZ6QMJqh+dia4+oKIfTDGPN0gT3D7meQ==
X-Google-Smtp-Source: ABdhPJxYJE37rXT7HUjUcMLnTidaMQQQNRQYf0bEaPu9Z9ouJiVKZK37ju5F7bwa1KL/1nYfylvzFg==
X-Received: by 2002:a1c:e241:: with SMTP id z62mr3728499wmg.135.1621512175250;
        Thu, 20 May 2021 05:02:55 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:02:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/38] drm/radeon/radeon_cs: Fix incorrectly documented function 'radeon_cs_parser_fini'
Date:   Thu, 20 May 2021 13:02:13 +0100
Message-Id: <20210520120248.3464013-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_cs.c:417: warning: expecting prototype for cs_parser_fini(). Prototype was for radeon_cs_parser_fini() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 48162501c1ee6..80a3bee933d6d 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -405,7 +405,7 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
 }
 
 /**
- * cs_parser_fini() - clean parser states
+ * radeon_cs_parser_fini() - clean parser states
  * @parser:	parser structure holding parsing context.
  * @error:	error number
  * @backoff:	indicator to backoff the reservation
-- 
2.31.1

