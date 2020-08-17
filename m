Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C90724603C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgHQIco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgHQIcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:36 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C636C061388;
        Mon, 17 Aug 2020 01:32:36 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k13so7128856plk.13;
        Mon, 17 Aug 2020 01:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NqEhz7gjYdgryeSdNN20GePxbntGjPIIXSk67vgjhoU=;
        b=Gh+EGB+k8MzIKZg3w4K1ReMB81hsNs2AGPTnCES/QCxxcuy4qM7/sBQrJNQ1rZHuzq
         8czJSF/odgqsMdRQ6yGzY1iPtKRcg2YWPqLMvSmk1ini9g1Y5ggfMX2Yq9gxO0rCL1XW
         pc+g+KGPFngjL/wT8JdwBlwS/0t9kq4tDuTDu/3cRdiWucfvW9ot2zpxMGuHoXypTVHf
         GzcWtlRMRpUXDGWlrIHAj7LJ/JZqzSlEQKL2Weq16sJD8FIiGwErWBPUdWUEEAECmHmX
         IsubQ+XrnAe/To191WyUFC1zxUwNK1vw+zkEBGQc8CtOGz9x/a6LU+QrgCSp1mtmLuEc
         EXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NqEhz7gjYdgryeSdNN20GePxbntGjPIIXSk67vgjhoU=;
        b=AhcG0oB5iQP1Fl+rPSeb2m+ekZZ/YgBYqfStVxwr9kSW//O5EPpX8SfFNUzJGX90SD
         7yKYUendP/sSixVK/UHGWLaHv7cw4KvSgACr2q1nrZJ14bF8P+j3uX2pS4Da5ElAQ+UE
         l/w7zmsiuLkKiQGGT2+MXdxXsc3y0MR6a0icdu8u3s0/h41d0BZ0Io56ycnOAGnKAk53
         +Vqq/+ov9KvXDhla2cHUkxzpAGR+g6GZ8ooY2XVZQTQcQxGTod9r9APZvyH6QPXfZ9+v
         cpm0MYogwoPaetL4dmzGGs9ZKysldPozMktXDuCApiESJavRAbOOQlBW6S5YVYrpj0LQ
         coVQ==
X-Gm-Message-State: AOAM5305uQQGA6xDV0GDYRaNyx75ItlRXBdxLObdAuPkqyJinVgqVpLH
        59GqWxFKqJhoCgyQpoQhmMc=
X-Google-Smtp-Source: ABdhPJyaxIojnOBxSDHaqmulSYl6Xyx5DXhb37mfDSkclxjTW0DvKjhIzVP6JCoCGtu8211RqApIaA==
X-Received: by 2002:a17:90b:3008:: with SMTP id hg8mr11716483pjb.120.1597653155825;
        Mon, 17 Aug 2020 01:32:35 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:35 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 07/11] media: marvell-ccic: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:49 +0530
Message-Id: <20200817083153.22218-8-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817083153.22218-1-allen.lkml@gmail.com>
References: <20200817083153.22218-1-allen.lkml@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 3d4242b8182b..7c4e3498d6bb 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -438,9 +438,9 @@ static void mcam_ctlr_dma_vmalloc(struct mcam_camera *cam)
 /*
  * Copy data out to user space in the vmalloc case
  */
-static void mcam_frame_tasklet(unsigned long data)
+static void mcam_frame_tasklet(struct tasklet_struct *t)
 {
-	struct mcam_camera *cam = (struct mcam_camera *) data;
+	struct mcam_camera *cam = from_tasklet(cam, t, s_tasklet);
 	int i;
 	unsigned long flags;
 	struct mcam_vb_buffer *buf;
@@ -1323,8 +1323,7 @@ static int mcam_setup_vb2(struct mcam_camera *cam)
 		break;
 	case B_vmalloc:
 #ifdef MCAM_MODE_VMALLOC
-		tasklet_init(&cam->s_tasklet, mcam_frame_tasklet,
-				(unsigned long) cam);
+		tasklet_setup(&cam->s_tasklet, mcam_frame_tasklet);
 		vq->ops = &mcam_vb2_ops;
 		vq->mem_ops = &vb2_vmalloc_memops;
 		cam->dma_setup = mcam_ctlr_dma_vmalloc;
-- 
2.17.1

