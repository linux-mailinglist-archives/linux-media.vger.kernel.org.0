Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07C722C4AF
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 14:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgGXMCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 08:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgGXMCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 08:02:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A12C0619E4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:02:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so4990283pfm.4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VKngwrDwYgMZRpBa5N9RttIghmCEGJz3vjqXKKgCKYk=;
        b=Y9nHFo1tSKAnjffVi8kwBLAhbHp18RkjpUlSYPHC5SLF6ED+aAi8ub0ltlRPvNOo6m
         jyRVYf50yN+B368eh0I9OOPp0FGE2rVkkkPe8Dl0zntj2+6UtzM9TT8LnXYpEviCFHnj
         AO9WiXksWr8YJUBFdDCP05mzFPBm1kVCvZhEtHv6WVMgvxDwG4o0KIb6CTSZTXjfwA32
         QTJ1McDzGMLXsUqcr4K/Hc52U/uZzAh0FtwjJfxcmknTx4AfjUNamWAvycYFBFyqWW2f
         kP05t82lXJJmJCjHWHPoH3FY+lH2DDHsI2quYHe4UVCQ5LZWaRC3UsO+iuPw0c5NqJiV
         O3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VKngwrDwYgMZRpBa5N9RttIghmCEGJz3vjqXKKgCKYk=;
        b=I29Jk0fGSoEuwV6GaHqQdkFpqKqcBBZXIgGrV/vQXFJjy7BEciLMyLjzBzK9aCeOBB
         q0bo3ZpvzkMQ0mM9Cg6nX1xnhvdfRu/m9qVkf3h6Zj7VSLxFMw60uVEiur6aw2muhWZB
         uhrRPHCaGH3rc35kBzJRv6NJ6c0nGcBiW2wk6xyo58N8/KSaCMYDw6FXkFzwqD8P+fpk
         i6m//VRxXyYGkx8ZRdmJGJesNkd3/f2xoC0lqKMNFx94FtRNKRxVnEbexiNqleaG3RUg
         ILKT6hJNvzwR0+Z7ZVnI0HtGvRm4oKlp83eKWhL+QZZxCWyEK2a7X7c1GKM6Bk3X1DvJ
         hqcQ==
X-Gm-Message-State: AOAM532XbMToqLUU2o6hgTqxXf6skPFf5QEGZBheATIrrj8T6kvMkUa4
        QWaioDcLzpfo8WCkRFQY5B4O3g==
X-Google-Smtp-Source: ABdhPJzGkOww4gi9LFKtV7dptKqSu31UyPoqgTqsxr4uMsEnNXSe4O6qsjXXwcf2My8/R09yVCrJew==
X-Received: by 2002:a62:e217:: with SMTP id a23mr8616963pfi.257.1595592160037;
        Fri, 24 Jul 2020 05:02:40 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id w71sm6455658pfd.6.2020.07.24.05.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:02:39 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v2 3/3] media: vimc: Join pipeline if one already exists
Date:   Fri, 24 Jul 2020 17:32:13 +0530
Message-Id: <20200724120213.17119-4-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

An output which is running is already part of a pipeline and trying to
start a new pipeline is not possible. This prevents two capture devices
from streaming at the same time.

Instead of failing to start the second capture device allow it to join
the already running pipeline. This allows two (or more) capture devices
to independently be started and stopped.

[Kaaira: Changed the search for an existing connected sensor, to search
for a non-NULL pipe instead, this helps to terminate the search at
output itself instead of going till the sensor, changed variable names,
commit message and conditions accordingly]

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index c63496b17b9a..423d5e5a508d 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -237,16 +237,49 @@ static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
 	spin_unlock(&vcap->qlock);
 }
 
+static struct media_entity *vimc_cap_get_output(struct vimc_cap_device *vcap)
+{
+	struct media_entity *entity = &vcap->vdev.entity;
+	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_graph graph;
+
+	mutex_lock(&mdev->graph_mutex);
+	if (media_graph_walk_init(&graph, mdev)) {
+		mutex_unlock(&mdev->graph_mutex);
+		return NULL;
+	}
+
+	media_graph_walk_start(&graph, entity);
+
+	while ((entity = media_graph_walk_next(&graph)))
+		if (entity->pipe)
+			break;
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	media_graph_walk_cleanup(&graph);
+
+	return entity;
+}
+
 static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
+	struct media_pipeline *pipe = NULL;
+	struct media_entity *oent;
 	int ret;
 
 	vcap->sequence = 0;
 
 	/* Start the media pipeline */
-	ret = media_pipeline_start(entity, &vcap->stream.pipe);
+	oent = vimc_cap_get_output(vcap);
+	if (oent)
+		pipe = oent->pipe;
+	else
+		pipe = &vcap->stream.pipe;
+
+	ret = media_pipeline_start(entity, pipe);
 	if (ret) {
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
-- 
2.17.1

