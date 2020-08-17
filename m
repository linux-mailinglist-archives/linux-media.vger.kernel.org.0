Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8142D24603F
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgHQIcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgHQIcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC7EC061389;
        Mon, 17 Aug 2020 01:32:47 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 128so7772677pgd.5;
        Mon, 17 Aug 2020 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jjvDDq/8L15Sv7VUgqoIMZQVb7xUNFz5WyPYgZ5irWo=;
        b=d+VGCUspw14qYJuXoZkofwmewEPLwDoqAhfQWhxRAiRzuc4CC5op9Jo8Pk21mbzXrr
         1uN0G6TbIBH/sUQRwlZ+wg2iYL1iXUn784j8XL0V7yzj/Mhr993koq+QW72sAQ2tD8e8
         dFbKzTrY5Ge1rn9Mjz8MJq7F6rROW7bj8YEBdEezlDX58Qx10GX9BLMqw4uj2A3K8KyJ
         A9lc7iv1QMOOBs9iZp4atM50JObFBIgAQuM3gLsCap55F4OeXql4cXbjolMZqqhoTq1W
         /sTx7ipxPKLAhoGw8FWtiDtYW0SC7z/xzz6c3m9R2vq9nWfhKoyioMAZ68CU04IeJ8t0
         6ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jjvDDq/8L15Sv7VUgqoIMZQVb7xUNFz5WyPYgZ5irWo=;
        b=CoylhD8iEISUUmSd1lSX7T2NFlyWNk5sTlBVrpCWIkCpY6ruuqnT7aIzwUJVzgZE2S
         oSyQvdeJXXKVVnk94rgQ8wbLjHpwzXuXwhDtM0ntHmteDLTtV0E6i9NpS2D1j7lYFggE
         TShSmskioThVCBKd/xyAkQkYaxD4RZMRyhim2NIer/cmQk+jsR/CjD55ZKZncxQut1nD
         bOmkNHyvjervUr9ESth7zn2lalY1oJHO44QzjnPw3y1djAznloFLD4t98FuRL42xozg/
         6IFqoxCC+yaW5KnM7XEixGFbrv7TwBLGcYMlTXibYGflMZoaqnpbTeliYLRqkUQ1t2US
         Dk7Q==
X-Gm-Message-State: AOAM530s3z1+C1A/sx/cH5nThwJ+My1qrZQINZluB9Yy9Zlno6uKirew
        JKmfxmxCaopmrBpxGVUgBvk=
X-Google-Smtp-Source: ABdhPJyTu4zxbEbd5s2N3jMG1TWfoMJhqkj4QdJNVr58XHa/J2AnOn05SJcGSqAWcG9POyc7s9+u9A==
X-Received: by 2002:a62:6887:: with SMTP id d129mr10726892pfc.279.1597653166944;
        Mon, 17 Aug 2020 01:32:46 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:46 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 10/11] media/radio: wl128x: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:52 +0530
Message-Id: <20200817083153.22218-11-allen.lkml@gmail.com>
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
 drivers/media/radio/wl128x/fmdrv_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
index cce97c9d5409..5c395da74e17 100644
--- a/drivers/media/radio/wl128x/fmdrv_common.c
+++ b/drivers/media/radio/wl128x/fmdrv_common.c
@@ -244,7 +244,7 @@ void fmc_update_region_info(struct fmdev *fmdev, u8 region_to_set)
  * FM common sub-module will schedule this tasklet whenever it receives
  * FM packet from ST driver.
  */
-static void recv_tasklet(unsigned long arg)
+static void recv_tasklet(struct tasklet_struct *t)
 {
 	struct fmdev *fmdev;
 	struct fm_irq *irq_info;
@@ -253,7 +253,7 @@ static void recv_tasklet(unsigned long arg)
 	u8 num_fm_hci_cmds;
 	unsigned long flags;
 
-	fmdev = (struct fmdev *)arg;
+	fmdev = from_tasklet(fmdev, t, tx_task);
 	irq_info = &fmdev->irq_info;
 	/* Process all packets in the RX queue */
 	while ((skb = skb_dequeue(&fmdev->rx_q))) {
@@ -328,13 +328,13 @@ static void recv_tasklet(unsigned long arg)
 }
 
 /* FM send tasklet: is scheduled when FM packet has to be sent to chip */
-static void send_tasklet(unsigned long arg)
+static void send_tasklet(struct tasklet_struct *t)
 {
 	struct fmdev *fmdev;
 	struct sk_buff *skb;
 	int len;
 
-	fmdev = (struct fmdev *)arg;
+	fmdev = from_tasklet(fmdev, t, tx_task);
 
 	if (!atomic_read(&fmdev->tx_cnt))
 		return;
@@ -1535,11 +1535,11 @@ int fmc_prepare(struct fmdev *fmdev)
 
 	/* Initialize TX queue and TX tasklet */
 	skb_queue_head_init(&fmdev->tx_q);
-	tasklet_init(&fmdev->tx_task, send_tasklet, (unsigned long)fmdev);
+	tasklet_setup(&fmdev->tx_task, send_tasklet);
 
 	/* Initialize RX Queue and RX tasklet */
 	skb_queue_head_init(&fmdev->rx_q);
-	tasklet_init(&fmdev->rx_task, recv_tasklet, (unsigned long)fmdev);
+	tasklet_setup(&fmdev->rx_task, recv_tasklet);
 
 	fmdev->irq_info.stage = 0;
 	atomic_set(&fmdev->tx_cnt, 1);
-- 
2.17.1

