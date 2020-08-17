Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB43D246037
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgHQIcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbgHQIcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:14 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EE6C061388;
        Mon, 17 Aug 2020 01:32:14 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id kr4so7465150pjb.2;
        Mon, 17 Aug 2020 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e3Og+eF42LgjnZGVUesfee3WTkmoUc4PC8c793SBuQU=;
        b=WgoiJu09z4J0Jj3XuHjmXRKp6QZJHcgPl1ICWv0c8Gp/4sOCo43HwNBDraeBOrRz2Z
         YZwz1TSpV78cMxbqMYqBgGkaxc+xCJwqzNNzgSRzuQe4MOeJlkA8ES3UprnEDKpR0prs
         0kv1Y1kVCbmRB/L/cl64K1DpPrwzoSFnMUoTJGdktwTOuerqCzMAwEwUNcbm7hK1dbIj
         FNAYzYkQhshhFr1wSbDUQEj/BucIGRR/EyOJX5cz7RpRVRpp+Na7Kwevn3g2BucCTz0D
         wD1ixTL2MZmBs1BUCoEk0ZIw4QdiL5ZUSybxd7RujKFpkU4vQJp4oj8pR0jfNbmtrJ6u
         lI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e3Og+eF42LgjnZGVUesfee3WTkmoUc4PC8c793SBuQU=;
        b=VRAg+agrxU8+q2xg6ur5mVk3HXMqZ4JzIiz+FuFDBM36UIp4eyKFhiRX+mp6rFWwbF
         xSJsgrksz2JDX3n3WJ6i9pcPcb002GxpmOTLhFXRDa94pE4J1J9bDpzKLKDB7lE+c563
         yENqWZJ0E4xugSwwFeXYbb/WHD7ZdZoYM4mJ9mBNNjbEMf6Y6rvtbkboNlgnNUJ1VTaa
         WLFQnWq5HrTM+h13r33flCvdQggkriH2odZDVpqGg4VLiGiJ+7uMR3wB+pt8rBuEZvpf
         i1o2dPJk54c7o9rKcDRiRmzp2h9T2EmVho+jjguXGweUsqDS919K17TIVyBho2Dq0gB7
         0grw==
X-Gm-Message-State: AOAM532qRG/XgsTYB2xNovv/H/64VUIyuafGVjFgc0V1WvvIEwDGks7w
        QGW9FC6ryrf8Ek2wxzQjPkE=
X-Google-Smtp-Source: ABdhPJzUadOmIrNJaQ4WF7QKMawSbip+D07RLS2LQ9WloQtegJR1zfyW+4hAn2v9YtO/677c6Vz85w==
X-Received: by 2002:a17:902:8f82:: with SMTP id z2mr8443888plo.177.1597653133845;
        Mon, 17 Aug 2020 01:32:13 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:13 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 02/11] media: mantis: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:44 +0530
Message-Id: <20200817083153.22218-3-allen.lkml@gmail.com>
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
 drivers/media/pci/mantis/mantis_dma.c | 4 ++--
 drivers/media/pci/mantis/mantis_dma.h | 2 +-
 drivers/media/pci/mantis/mantis_dvb.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/mantis/mantis_dma.c b/drivers/media/pci/mantis/mantis_dma.c
index affc5977387f..4df571ff272b 100644
--- a/drivers/media/pci/mantis/mantis_dma.c
+++ b/drivers/media/pci/mantis/mantis_dma.c
@@ -200,9 +200,9 @@ void mantis_dma_stop(struct mantis_pci *mantis)
 }
 
 
-void mantis_dma_xfer(unsigned long data)
+void mantis_dma_xfer(struct tasklet_struct *t)
 {
-	struct mantis_pci *mantis = (struct mantis_pci *) data;
+	struct mantis_pci *mantis = from_tasklet(mantis, t, tasklet);
 	struct mantis_hwconfig *config = mantis->hwconfig;
 
 	while (mantis->last_block != mantis->busy_block) {
diff --git a/drivers/media/pci/mantis/mantis_dma.h b/drivers/media/pci/mantis/mantis_dma.h
index 421663443d62..37da982c9c29 100644
--- a/drivers/media/pci/mantis/mantis_dma.h
+++ b/drivers/media/pci/mantis/mantis_dma.h
@@ -13,6 +13,6 @@ extern int mantis_dma_init(struct mantis_pci *mantis);
 extern int mantis_dma_exit(struct mantis_pci *mantis);
 extern void mantis_dma_start(struct mantis_pci *mantis);
 extern void mantis_dma_stop(struct mantis_pci *mantis);
-extern void mantis_dma_xfer(unsigned long data);
+extern void mantis_dma_xfer(struct tasklet_struct *t);
 
 #endif /* __MANTIS_DMA_H */
diff --git a/drivers/media/pci/mantis/mantis_dvb.c b/drivers/media/pci/mantis/mantis_dvb.c
index 2da94be5b373..c7ba4a76e608 100644
--- a/drivers/media/pci/mantis/mantis_dvb.c
+++ b/drivers/media/pci/mantis/mantis_dvb.c
@@ -205,7 +205,7 @@ int mantis_dvb_init(struct mantis_pci *mantis)
 	}
 
 	dvb_net_init(&mantis->dvb_adapter, &mantis->dvbnet, &mantis->demux.dmx);
-	tasklet_init(&mantis->tasklet, mantis_dma_xfer, (unsigned long) mantis);
+	tasklet_setup(&mantis->tasklet, mantis_dma_xfer);
 	tasklet_disable(&mantis->tasklet);
 	if (mantis->hwconfig) {
 		result = config->frontend_init(mantis, mantis->fe);
-- 
2.17.1

