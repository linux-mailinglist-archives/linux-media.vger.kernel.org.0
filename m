Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E12D46163C
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377692AbhK2N27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377814AbhK2N06 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:26:58 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB4DC02B677
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:06 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o29so14380826wms.2
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OOCzCCGRhx0Yd+XBoLOb3ENe6v2ley+rjFyWG7N2LJU=;
        b=Q6X8MelaozaQwJKcGk9PhwHDUcDD0804yBPKlQUpU1WahVImfNpIKG/OejgeytkrVR
         A3wNCR3VBtNfSkPSL8va2GAnQvspMA6Veaw52bQrGuFdVnEJxM3Mg//xlVyVog2LNH6N
         u3PuAcHbhNX4JVUslAoJDcdMWtA7GeefmOIWvi0al+OncC5jRO0s2lR331gCBS2BpUaO
         7QA/1eafmE1MIbH5CacqhElctbQZD4c+EoiPi/xvpWyC8rGSlA5xIaFqjlNz5k7BoY7L
         SNDc+sadmIsANRckOh362ojch30ULQgLgSzba+Pmp3jkOdz90y6AOUNnKBRFSa51v0ZC
         ksVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OOCzCCGRhx0Yd+XBoLOb3ENe6v2ley+rjFyWG7N2LJU=;
        b=TWOtXf9QLISYxpnS+GnUPmco572Hvs4/YYHTmYQ3KBbk/LC1yX/TXLGNk2MWjXos0c
         P9AGmDkYXgf26C0aV/mw2I6KUpRfe4OLk+0v3MJ2ze+a8wfljsVx7dOJg5nXsYMUYjK4
         dO3x0Yg4Rr+fdOjQNX2jtuzgsuw2TBO7SrM/brFQ7OJD+oH3D1skOrfkNbqtujiKLkId
         SxAtrRsOmZxiz6AqmSU32LmKfDuJJRt0Yl6Xrxd07xpucw+x6kUbTuJ1PpdQOhU26oFL
         vO7qtesYWDduad1WbtucFT0v6EiZDIERWdv1f9cKJJ1goXLuS6A1x0aEM3vi0JcqfS5C
         f8nQ==
X-Gm-Message-State: AOAM531MP02HMbJabOGQHVgOo1aAlkSz/XHXtT+bqzGTx8ao9iFkahHD
        BGTi0P38ILYZa8iCg80KeJI=
X-Google-Smtp-Source: ABdhPJwP9DcyaVQ4UYDvEecjYzTaOmhgzoezNR1SawExuKjdgJBNc8PjMSFTpKkeIGvBtMZEVrk4eQ==
X-Received: by 2002:a05:600c:3494:: with SMTP id a20mr36318388wmq.195.1638187624754;
        Mon, 29 Nov 2021 04:07:04 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:04 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/28] drm/ttm: stop pruning fences after wait
Date:   Mon, 29 Nov 2021 13:06:33 +0100
Message-Id: <20211129120659.1815-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is just abusing internals of the dma_resv object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e4a20a3a5d16..fc124457ba2f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1086,7 +1086,6 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	if (timeout == 0)
 		return -EBUSY;
 
-	dma_resv_add_excl_fence(bo->base.resv, NULL);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_wait);
-- 
2.25.1

