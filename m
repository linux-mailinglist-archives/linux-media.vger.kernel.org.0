Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204F341EA72
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353479AbhJAKIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353492AbhJAKIV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:21 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C67DC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m22so9155018wrb.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=Cyh1S+VO3uhIzwT/x7r/+ke6Tw/sa5XVJuThgyu+evB5Z5y/CWutZVCiwpCfFHZegQ
         26g2VRhhPd9KX0OahtFF1IqXac+YyHgvNSG+BpcuOZhLk6rSPqls/sVfH9Wsl6pjbXUB
         XsRKnopUjSmdmOFWLn/0SAswKVinKLLZIOOJ68Rji+ehsq9pT/XNSYhgJl3p4zqWjxdG
         qRMNY3UTJrNN4+H9YzyNpl5HDZW6MDXbSwuFyS6RhLSt5i+dUEBzxA8h8vacLvnZfnK4
         XkBWBukDRFSr/FdkYI1aumJo88N0+S3UmvOt/8HN1d6x0qt8I6r1t141kR5TM+/8VbRq
         N11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=LZubEOX461KWS+1GUrsIj7pSMx4whq0bGkv/xcV7olgtiVpKyTIkw1AC2uItU+8WyJ
         lPAPSAXFkKi3Lz307/UQc3oN50O5sUOLUvV9ppn4oT/Y5NCNqAki02N3+hszWAWT8+Hz
         9aVRndMIgTZssTBPWDePGaX787TxV6aCYCGN8+dSrHgkrqdpT3GN21Oz3D+aixq+socB
         XGkcBCAAF+rJkiPCN3etJIx3Qp8QjDMsTz/najAxgtYDhOVEolafB5EZuY4LiKTJcEZ4
         h/H3ubCop8u9WU9T07Vk5HmXtx7wInGwACzFD+xsFxT9H+HdM3bZK8sAmXDZLRCFXqr6
         SEKA==
X-Gm-Message-State: AOAM533XjwfZ+LKLtVklktA23mNyPrs42mYVFbTRqep0mhySGcYTV0X9
        Oj0cmpyBNm3KYjUneuLRiPk=
X-Google-Smtp-Source: ABdhPJwhtgvOI7xyayup3oIPTfuGI4IkHPBzz6DTtAC78R48IvmCzllr7F2U4ngGqkW0ygDIrfd4qA==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr11183115wri.158.1633082795955;
        Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/28] drm/nouveau: use the new interator in nv50_wndw_prepare_fb
Date:   Fri,  1 Oct 2021 12:06:08 +0200
Message-Id: <20211001100610.2899-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..30712a681e2a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -561,7 +563,13 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = dma_fence_get(fence);
+		break;
+	}
+	dma_resv_iter_end(&cursor);
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

