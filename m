Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EC124603D
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgHQIcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbgHQIcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:33 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE91C061389;
        Mon, 17 Aug 2020 01:32:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y10so5582290plr.11;
        Mon, 17 Aug 2020 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ahy70Yk2bRVB7QBIejUmD1G9Y2W/MzcgwHjWYQelH0I=;
        b=WRLKS+MMnDOkRIFbCcdWRCCHhHc4NwPn/uvQL8gU6YF85p2FTJdK8xTGsE7T6dsj3U
         M5m5R7c22PVaRHYYlJrTCNAVVSA9Ry9vsR9LR/18XxF4S3771cEBSmJRDHFCFuI4jQ9m
         RwzaQWZb16vkJmf6I6rRBVfBehuKZp4pKepBsJttncXoKZr21hfqlHPKLANXMoFkBnC4
         diwKPpcz6XxHWurdG2aD+q4V1SIH0iV7TZFvaqP8SlRphmAZiVHGyF0ykisJe5lBCaG5
         b+BjELiv1yH0kF6J38RYp5CXxrp/u/PDEfKbkqURS8m2aBrU6fFcwy3yc+7eW5icEApv
         nC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ahy70Yk2bRVB7QBIejUmD1G9Y2W/MzcgwHjWYQelH0I=;
        b=LCDQuMyDEHjwcj+Zjudk69KKqSd/9HgEY0tDlZOaN3+iOJdtNldptPVcEzlanKWAam
         hJ+f5XZeg4O+4PJCPySQdA0TxDNVC2TkUEIn+HNAgGDCxnrHAqJ4LBhnXXTF06QfRbtM
         +Lg3A4sX3zCWdhebiWZhFoe9o5HTDx9lrnx4aQztN80NpFXJMNl56SqcJrIq7FHmIlK4
         ZkP/urR81CYyewOhs+PZHAVd/vfinrvv2TVA4495yoPs8oR4VFIuOJts2ZuRyNR3Nj1+
         dSroE3K5KNEkvscUNXjj1hpLfiIBaYEU8Y1KWwCqipfXCLLaOb4S195Us+uxBwSzXjNL
         bI6g==
X-Gm-Message-State: AOAM531yMs1fGuYbcfSqGWBplOIC/aB7fgagRWzfW212ML75d/L/VC2C
        MkyH/PtHTi3TAQG++tWpcJI=
X-Google-Smtp-Source: ABdhPJwF+cEnYujAMr0ykZx6WmkvBbF37TVTpNJT6zlrJJGif2tX3AG7dRZY1glR0Xvx5drCCwEEsw==
X-Received: by 2002:a17:90a:88:: with SMTP id a8mr11612469pja.196.1597653152014;
        Mon, 17 Aug 2020 01:32:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:31 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 06/11] media: tw5864: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:48 +0530
Message-Id: <20200817083153.22218-7-allen.lkml@gmail.com>
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
 drivers/media/pci/tw5864/tw5864-video.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index ec1e06da7e4f..e232c6535a0a 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -175,7 +175,7 @@ static const unsigned int intra4x4_lambda3[] = {
 static v4l2_std_id tw5864_get_v4l2_std(enum tw5864_vid_std std);
 static enum tw5864_vid_std tw5864_from_v4l2_std(v4l2_std_id v4l2_std);
 
-static void tw5864_handle_frame_task(unsigned long data);
+static void tw5864_handle_frame_task(struct tasklet_struct *t);
 static void tw5864_handle_frame(struct tw5864_h264_frame *frame);
 static void tw5864_frame_interval_set(struct tw5864_input *input);
 
@@ -1057,8 +1057,7 @@ int tw5864_video_init(struct tw5864_dev *dev, int *video_nr)
 	dev->irqmask |= TW5864_INTR_VLC_DONE | TW5864_INTR_TIMER;
 	tw5864_irqmask_apply(dev);
 
-	tasklet_init(&dev->tasklet, tw5864_handle_frame_task,
-		     (unsigned long)dev);
+	tasklet_setup(&dev->tasklet, tw5864_handle_frame_task);
 
 	for (i = 0; i < TW5864_INPUTS; i++) {
 		dev->inputs[i].root = dev;
@@ -1313,9 +1312,9 @@ static int tw5864_is_motion_triggered(struct tw5864_h264_frame *frame)
 	return detected;
 }
 
-static void tw5864_handle_frame_task(unsigned long data)
+static void tw5864_handle_frame_task(struct tasklet_struct *t)
 {
-	struct tw5864_dev *dev = (struct tw5864_dev *)data;
+	struct tw5864_dev *dev = from_tasklet(dev, t, tasklet);
 	unsigned long flags;
 	int batch_size = H264_BUF_CNT;
 
-- 
2.17.1

