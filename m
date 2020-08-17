Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AF4246046
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgHQIdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgHQIck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F064EC061389;
        Mon, 17 Aug 2020 01:32:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so7354335pjb.2;
        Mon, 17 Aug 2020 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=evlrKxSaL3VCX/rnaXC9Z1AuYwNMsmnef16/xHaNLkY=;
        b=XiM7kKQGvEDYEWbFL/Mq6Q9BGZdpAV8zIYWA4SZCu/QG1NxDaNrBk+gmwsZaimHx/W
         whR3YKb0mb2/haPbA+IoLIa9yQO4eyhUzXOnK+Npfc9HuAsa92i/PnTDsqmzly5AGnsH
         BYQLYQaZeNtcs3F2w+lt0koPEC1pQdx4mdX29hvhR+wWTiP0aocJFGfV18le4P+T00OT
         RiMpFeOg+nb5yziknywMjFVgGDyXtyG+oq40twQbO7UdmfjwuTea7oS4yy/IOR4AZFGp
         EL9Cbh+0woowtm+3epEs6iz32Qr27p6YNa1JlVBwJaFncBzCbbgOigL757gfKKntvGlr
         Xb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=evlrKxSaL3VCX/rnaXC9Z1AuYwNMsmnef16/xHaNLkY=;
        b=OJ6q3DVJMtOF/zVB9rA7QAHttYW1v5ZlO3/MK5j0Ptoe0bzwhR67r6i/Z3hcNmIZsY
         1ctYb7vYwRh3qlvaAIidgz41t+mY26xpBCmOQpSSNvlHhaFQAMiTUa7VsYaqja50fDoy
         FlxtkAil09+vYOpDY18BBajBUNw+Zrv4dszhHzNMjhIxSR5uBK6VCKfkmdLsq7tpntSP
         PrEn/KEu4Zu09EyjLMqa6FegWmvgGUxZ1U/0eXsQ4B4JKD5Ih/l4wCBiAQDdD7/mdPoM
         N0KSruz0FHHhW16KgFtKp2EIX8G6itnfi/p1wHoyGr5JT3fbIHl8NlToUZ+iXWnpAxyr
         d2aQ==
X-Gm-Message-State: AOAM532SiduMrsat99lHXw2Qc043Bqhrf+QzxSwF9rGSy5Khsizd37kA
        4ZEQCYGX1OxrDQZUAwxHVkzt+e3fPpu1wQ==
X-Google-Smtp-Source: ABdhPJz4PEYfP1FEGnR3KB0zo1YmJDTwWrbYngPxGyBv1e4zvnZP+Kyse9nY2LYHZr7Y/7TGqcSIlw==
X-Received: by 2002:a17:90a:db87:: with SMTP id h7mr12083211pjv.51.1597653159607;
        Mon, 17 Aug 2020 01:32:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:39 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 08/11] media: pxa_camera: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:50 +0530
Message-Id: <20200817083153.22218-9-allen.lkml@gmail.com>
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
 drivers/media/platform/pxa_camera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 6dce33f35041..ae317a900ce6 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1186,9 +1186,9 @@ static void pxa_camera_deactivate(struct pxa_camera_dev *pcdev)
 	clk_disable_unprepare(pcdev->clk);
 }
 
-static void pxa_camera_eof(unsigned long arg)
+static void pxa_camera_eof(struct tasklet_struct *t)
 {
-	struct pxa_camera_dev *pcdev = (struct pxa_camera_dev *)arg;
+	struct pxa_camera_dev *pcdev = from_tasklet(pcdev, t, task_eof);
 	unsigned long cifr;
 	struct pxa_buffer *buf;
 
@@ -2478,7 +2478,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		goto exit_free_dma;
 	}
 
-	tasklet_init(&pcdev->task_eof, pxa_camera_eof, (unsigned long)pcdev);
+	tasklet_setup(&pcdev->task_eof, pxa_camera_eof);
 
 	pxa_camera_activate(pcdev);
 
-- 
2.17.1

