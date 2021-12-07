Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C709746BB25
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbhLGMhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhLGMhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:53 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55E8C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v11so29121817wrw.10
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
        b=gDe8fJ83oMPovLlyB8HFqqdujfmf5BPCwaHMpVcaiqkl/LQQHASJUErCDODbhDVu13
         463dGJB1StIe+RozstSEm51gDJQ54VUcefZusTDUK3gcnXJjjbJfX5Qo4UtnZpIYIdJO
         xYPfijXb4W3uQCaaFf+IaHUvTMx0ZPVntXKRtLfr1WLl4hj6A92WJOBw1gabBspr/0Qk
         xSDySBgU0G2u5KPAJm2PsNRQ4vH7Cz+IT18G4X8xdfuXfz5pvgqGIMdCovRT4+30pamA
         PoSd8MIML1vJCBJSYOUvI6Si2GH+nZ29lCpQz9aHU51ZK+e2zijet61eZNnOwJLXmVDv
         TfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
        b=MnUNAz/fK/wim28+a2kzeC3ug2DgCYHXVa+gM3Dv2F50Rjb2K9awxp+m0qt8tr7oEA
         fv0erFSEIX2hVgXHNWv70Rl7jhfeDTz/RNTtPfH5UPvJTwGFTzZiXo3S286pT123A4NQ
         z+yM1ZwEYa0Wpw/4D+yNdTndoT3LnwGCu7x1lSx8ukuMukFUmzrXt2k8dQG9tUhmA5k/
         IThICDnsB4it9nVym0j7049osNQhRNwE6BC9sWrAMZ6zGTpEAEy5B9QCgQoxVg1zp5JJ
         7IuTCo3igD9aCQZWNI/zuQ9ozKIX+tl6WhpoxxEeAhE+FLBx8TM+HFxn55mJL/EsHSrN
         rTxA==
X-Gm-Message-State: AOAM532QCSr7LfMPJ1PiLc4qpx3Bw9L8xgRKNSO3Fl0qlZZYhLtgV0LO
        zDti5RnDz5amb/UoRypaE5k=
X-Google-Smtp-Source: ABdhPJypSKpYTAj0bMWRRYynzVsdxJu8BhXzkE3TVsWyAD+OO288aVK1qVjH/jTm9r62ZXOk9fwTVg==
X-Received: by 2002:a5d:668d:: with SMTP id l13mr50335591wru.526.1638880461580;
        Tue, 07 Dec 2021 04:34:21 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:21 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/24] drm/vmwgfx: stop using dma_resv_excl_fence
Date:   Tue,  7 Dec 2021 13:33:55 +0100
Message-Id: <20211207123411.167006-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 8d1e869cc196..23c3fc2cbf10 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		vmw_bo_fence_single(bo, NULL);
 		if (bo->moving)
 			dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get
-			(dma_resv_excl_fence(bo->base.resv));
+
+		/* TODO: This is actually a memory management dependency */
+		return dma_resv_get_singleton(bo->base.resv, false,
+					      &bo->moving);
 	}
 
 	return 0;
-- 
2.25.1

