Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4A52B1C87
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgKMNvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgKMNuY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:24 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D7AC0613D1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:11 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a3so8546706wmb.5
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQkfxQ/U8Tk4/T1pD4+koDIKxw+zqPvW8TyQwINa4Hk=;
        b=p+qCr72t4ihE18soadDlaCQDbatISUugUvivCXWYBcpCtMq7piGK6yvdMfWe5dOlUz
         epwJ2cODurA7r/6VuUAYrYXfYCAU309NoyA05LOmjaELk3tFujk8ElkHboNXnaQcpc8G
         zZLHqhh1zUmkJivv/y8jjofUTY2mjY/xirZHrK5r42BuPbpXaoaH2hGm0sBHW0PClrfn
         G3tz9jkPvZiZZK0f28wsPfX8I29xo+ErTlJfaLfsnvomw33WeZmaQHc1upjKvr0LlHdV
         UJLl0EKZ4iN0XSw7CplmsnLCoN3kUHPWQWCAquy6HaUTX8YX0wKSNf3DqpVb36uZwhnF
         2k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQkfxQ/U8Tk4/T1pD4+koDIKxw+zqPvW8TyQwINa4Hk=;
        b=ErQwiPH2tcQKTmeUOokOCm7/PpNixwuVYyW1dOm4hJ6dghE72yAOQKhYRWjvUP+Cu6
         uNbSS2ISoCY3l6ebHUv9uYP2Vb4TnxFoACbTMcg3MaSrUjqZPpFd0gRj13NEvLoE8tfw
         guuzjBWaeOmFW/p+ECkUlBZJvngHy0TZmolniaWOGsxZQKTeVTbb6QSOsozwmhMXT9mr
         B7TpSBld2ppomaJVx6THh18XESZPK1/y51qK/yJsik3sy7Y6H7Z/5sN+EpWpgh58ZfuN
         26XhI3oX/NVipy4hV2dTkR9zHF5mHHHnLaBQsy0z1m61V5HAh2M3oM6EZTgZ1rzFRL2E
         h2JA==
X-Gm-Message-State: AOAM532dmUmkyRXnt14tTtWzc8NjJKzgTWt+Luj//MaqHT59YIXFHW6z
        W709IZqpavZEylNjFj9gPvFP7A==
X-Google-Smtp-Source: ABdhPJymL/fKIayM3ll+Scbr9dyC1LRXBH326riSmfGznT+FB8Ojz4hiHyuPNwQSLAqi/i9sv8er5g==
X-Received: by 2002:a1c:6209:: with SMTP id w9mr2608331wmb.120.1605275410099;
        Fri, 13 Nov 2020 05:50:10 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:09 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Qiang Yu <yuq825@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 23/40] drm/lima/lima_sched: Remove unused and unnecessary variable 'ret'
Date:   Fri, 13 Nov 2020 13:49:21 +0000
Message-Id: <20201113134938.4004947-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/lima/lima_sched.c: In function ‘lima_sched_run_job’:
 drivers/gpu/drm/lima/lima_sched.c:227:20: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/lima/lima_sched.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index a070a85f8f368..63b4c5643f9cd 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -224,7 +224,6 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
 	struct lima_device *ldev = pipe->ldev;
 	struct lima_fence *fence;
-	struct dma_fence *ret;
 	int i, err;
 
 	/* after GPU reset */
@@ -246,7 +245,7 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	/* for caller usage of the fence, otherwise irq handler
 	 * may consume the fence before caller use it
 	 */
-	ret = dma_fence_get(task->fence);
+	dma_fence_get(task->fence);
 
 	pipe->current_task = task;
 
-- 
2.25.1

