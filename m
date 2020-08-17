Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA9E246042
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgHQIdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgHQIco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4093C061388;
        Mon, 17 Aug 2020 01:32:43 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k13so7128982plk.13;
        Mon, 17 Aug 2020 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r6iEsvCYaHsibJa9rpmWya82cHXN/+L9JRpqk2jnfA8=;
        b=M3HikLYsY5jZ820rwnMInNQ4KMjMxkVS2VwmimZ5k9tBdXq1PGYd5213wHMPknYxdL
         jh2+DZbePnzWScl6nzFOb77CmhXiSMKWfMKASdvqtVYkqfRyQwPqz5/1o5inqZBZ8dFc
         1elGGFVMwBbZ+8dsftxe/r1fXNkemRcbN6USdSMxf0STVF69yJBqt71UxYiSeT5Wgr6o
         kjH1YMd2hhG2coQOO8qjnjmPdgbT206dxO7lUDkX1RFCcoJsxsRX4//p4E6WYHDnLNbM
         ZBCUSThiou01I/6hXoXUvvvRh9nfslyyQvd6OqNn2qXBW3N5mTcsAHlRzVPp4+MgJzwP
         TOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r6iEsvCYaHsibJa9rpmWya82cHXN/+L9JRpqk2jnfA8=;
        b=NJb1xEScxmihdPBBO2r1SaNgbaBAPYHocRMpZq2Aj+rTXymXXncoWV5c00qkStEVui
         KTIeRWpoz34AydAgrvN5ykupziI89G66chbGCSSSU5tWr9wiEiRK6mZzOPVkveZYJ92+
         E+68ghEJcfJk+JFDqU0/PK0V2yt7E7RnuaFHQrQJwHZ2MXIVu3LE6X7jY3yCBptHAwZm
         szZubxOlW5/enOsvx5682eOlUwg93mJ08cfoyJ1ut9B9goPGd3ucyy9xhEcOJLDTM5xo
         1OdN/9WKO84IvN4z/g53JwjlbIzJqmnYKmsP3UxQHGvYuvsrgWwm4X0NVz5p9hSP6r51
         etvQ==
X-Gm-Message-State: AOAM5324L3zBz3GmOBNXq89koywDLo6dwPf0/CHHKb4U4i2pdcrktf5v
        AgYFAEaqhmE8yU8trEdJ41B7ujJi76d/Mw==
X-Google-Smtp-Source: ABdhPJz72RyY25jDKMUxgEvYPHXwNJTcXnrhDfbusclY4Wta6QY/XQq8hlumZ+cC/qRzKrUqTIONBA==
X-Received: by 2002:a17:90a:e511:: with SMTP id t17mr11596987pjy.189.1597653163410;
        Mon, 17 Aug 2020 01:32:43 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:42 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 09/11] media: sti: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:51 +0530
Message-Id: <20200817083153.22218-10-allen.lkml@gmail.com>
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
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 5baada4f65e5..dbe7788083a4 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -77,9 +77,9 @@ static void c8sectpfe_timer_interrupt(struct timer_list *t)
 	add_timer(&fei->timer);
 }
 
-static void channel_swdemux_tsklet(unsigned long data)
+static void channel_swdemux_tsklet(struct tasklet_struct *t)
 {
-	struct channel_info *channel = (struct channel_info *)data;
+	struct channel_info *channel = from_tasklet(channel, t, tsklet);
 	struct c8sectpfei *fei;
 	unsigned long wp, rp;
 	int pos, num_packets, n, size;
@@ -208,8 +208,7 @@ static int c8sectpfe_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 
 		dev_dbg(fei->dev, "Starting channel=%p\n", channel);
 
-		tasklet_init(&channel->tsklet, channel_swdemux_tsklet,
-			     (unsigned long) channel);
+		tasklet_setup(&channel->tsklet, channel_swdemux_tsklet);
 
 		/* Reset the internal inputblock sram pointers */
 		writel(channel->fifo,
@@ -638,8 +637,7 @@ static int configure_memdma_and_inputblock(struct c8sectpfei *fei,
 	writel(tsin->back_buffer_busaddr, tsin->irec + DMA_PRDS_BUSRP_TP(0));
 
 	/* initialize tasklet */
-	tasklet_init(&tsin->tsklet, channel_swdemux_tsklet,
-		(unsigned long) tsin);
+	tasklet_setup(&tsin->tsklet, channel_swdemux_tsklet);
 
 	return 0;
 
-- 
2.17.1

