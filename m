Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC6E391B8B
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 17:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235128AbhEZPUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 11:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbhEZPUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 11:20:12 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38836C061756;
        Wed, 26 May 2021 08:18:40 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id l70so1238895pga.1;
        Wed, 26 May 2021 08:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vIk6t88cCvmSuMsBu2gfTbOYGwvE82URMCwvqXMpv70=;
        b=IlbfFzdOX0zi4Cay4brwe12Sg1xnWv2vcPd+ByXjspk18yS5WZAATgINRrHKZYyMiX
         3HTjx7jQbC+VSnWdBoi6Esd6yhTKoZ8mkkuoqcJl2s9RbuPYpLtFQRIsR/a7i1l56HRA
         78HJNxT1AU1BjfnOEnHGFVDlHs14XVhueY6SwYwTmxo7MUPpofxAw4nWq+S2WK4KpGnU
         dBnMNrhFs6e7n5R7UZvtRQ5A1pVLgusH7SeMFiaMeP3VnfX+g6FYT5bFhZ++LkpJnmwB
         Lb8SoGqrHWvZ5sArnLugPyYZ+zXDdseTNBMUyF1KCmHeXx49Ds7HuWAk7UVzGkdfYNey
         GUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vIk6t88cCvmSuMsBu2gfTbOYGwvE82URMCwvqXMpv70=;
        b=Uv856LTLPg8M98+W1+XaEnyKkhnl2R+GzA3prRGGR+DyCtD8UE2+C9Tf8p2baXY051
         LKex/lH69twe9AsRdfYZSDgQPhjg7iNlJFI8h6qeQ/s+Wf62GahkK7CZqmrkHpmLXOQq
         ee/xaLypKTJ/G8hCMT+RP+Zr8Q3hrXKv2ErRjOydlV9fflgTYEFQCTSuOM3oBCtnTFpA
         kXHF4Nt95RbGUCxEaUQW6OUVIukYALG7EZYrTWQWhDHBNNLQ0laXEdRLRnRL78vs+J6a
         sXOm6kuS4bvTmYVLM3W7gq4bcXBzCFSTAubXAYGSlDH1Dok01E2lHH85+FCyAlAJpAMm
         ByzQ==
X-Gm-Message-State: AOAM530imQ1gn4eUlurYtWUju9bK388J1ZAx/Ct7nkWw2NqqBItqAEqF
        2tHFy8FsDB6rHzCYnIzNahg=
X-Google-Smtp-Source: ABdhPJx2XrHSdXqKFZY7P74N6tSTIz1ym1YjtPFp5WtB8jlA5XSv73Lav5dcZsWpfPZm/1z+dBN+hw==
X-Received: by 2002:a63:ed41:: with SMTP id m1mr25433071pgk.252.1622042319794;
        Wed, 26 May 2021 08:18:39 -0700 (PDT)
Received: from localhost.localdomain ([23.104.213.5])
        by smtp.gmail.com with ESMTPSA id d3sm16597643pfn.141.2021.05.26.08.18.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 08:18:38 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
        a.hajda@samsung.com, mchehab@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v2] media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
Date:   Wed, 26 May 2021 23:18:32 +0800
Message-Id: <1622042312-4325-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

The m2m_ctx resources was allocated by v4l2_m2m_ctx_init() in g2d_open()
should be freed from g2d_release() when it's not used.

Fix it

Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---

v2: move v4l2_m2m_ctx_release() up to v4l2_ctrl_handler() from Hans's
    suggestion, thanks.
  
 drivers/media/platform/s5p-g2d/g2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 15bcb7f6e113..1cb5eaabf340 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -276,6 +276,9 @@ static int g2d_release(struct file *file)
 	struct g2d_dev *dev = video_drvdata(file);
 	struct g2d_ctx *ctx = fh2ctx(file->private_data);
 
+	mutex_lock(&dev->mutex);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	mutex_unlock(&dev->mutex);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
-- 
1.9.1

