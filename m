Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630112A8198
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731311AbgKEOxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731313AbgKEOwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 09:52:23 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95461C0613CF
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 06:52:23 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p1so2074490wrf.12
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B68ULhNIafZ1wW7c1l8pnyj5WZlq4OYRmPHr+DhWUhE=;
        b=y5NLIQDVRqbJUttUWB4r8/ibcZ5Qata4Q2mrbDJBmadOo2DotGPs54R38SqQQOJtK0
         APDTcNF2QLkfRliuF57BWAQCdehDYlb8lsZFwORe8I/gL2fKDdjWxTNYlEnicdU+Tepk
         5OAcbqoeisbVAWkR8/09ao1c1KKTBgYRHdOoAZ2QAAqvarPS1tsfilMWK2a+AlJNuzz0
         +kUncIw/eC9DDBQ60wMblUKDiSVe6X7R5lWE83cQIIuQuIZRnQdyUh3vH+ugoQ+RH7Yn
         MLAgK7S/UR++VibC4t2AYpomfaTwMl4ffyF3maXz3zJHEmlNVS5ukN+72YKOTLdKnzri
         Do6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B68ULhNIafZ1wW7c1l8pnyj5WZlq4OYRmPHr+DhWUhE=;
        b=RfChrNUh0WJXa3aj1gajzu+c0xXAiJ2y6f+foQMCUhn4gy8MKyYkp3wd6kxWEZCC8l
         7bjdwcAOcCYfq9cc9TshG/4TAZDOUSqe9eUKX7c0U2Jzxl8iv/5wZRBwX9l5eOkTn6q5
         AJBHB2txT5vpucm3HLBtuDYz/PKIfus+QnfsUit9kQdZ0Zxw1kAN8MlBEOWIQk2bVC6K
         6IHb1ZjLCcueugwyRwiavufPk61MccRx9HXp9y+JlWO/IqnrTZN7j1inLHMVXkTvx4Os
         EKFmY2XuJ5Ghah0U7CLiLV9xNO4JwVNWwu/rxQfq/GVYz1Y27pmuJpf/YW+zcdK2lj16
         Egrg==
X-Gm-Message-State: AOAM532Uyt79Qg13I5czxXPyLaZorEVPvNSpbi8IyISSfL0QPX6vgQ7Y
        Y45NGiDUd8/FiXQ5tZmQcHN6nz+k3tenDv5o
X-Google-Smtp-Source: ABdhPJygN4kha10hMe+UVXlVwhFEkYq3Wn91ptnkwyJh9gk4hgBLYUpGHf+fN868Iaa7qiNaQGBSZQ==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr3435853wrr.20.1604587942346;
        Thu, 05 Nov 2020 06:52:22 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:52:21 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/19] gpu: drm: scheduler: sched_main: Provide missing description for 'sched' paramter
Date:   Thu,  5 Nov 2020 14:45:04 +0000
Message-Id: <20201105144517.1826692-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/scheduler/sched_main.c:74: warning: Function parameter or member 'sched' not described in 'drm_sched_rq_init'

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9a0d77a680180..da24c4e8b9fb3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -65,6 +65,7 @@ static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb);
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
+ * @sched: scheduler instance to associate with this run queue
  * @rq: scheduler run queue
  *
  * Initializes a scheduler runqueue.
-- 
2.25.1

