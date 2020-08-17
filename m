Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1DF246038
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgHQIcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgHQIcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0620CC061388;
        Mon, 17 Aug 2020 01:32:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h12so7767370pgm.7;
        Mon, 17 Aug 2020 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hOaPXxj1ai+YwAcly+36QLrMNRChjPUinTBacA1yTzQ=;
        b=Vh1O6hNKx5uPwEhSlycr3poiuspl4NNR8D+J1oJuoL0KyXyzdwAe5JZfWbyHIBfEKx
         aPcFQMXkBGwwYNGmq/yQc6WJIbMSDyKdG+MhBS7DK0ZAqVVTu88Q2ndym5JwGbUs6Sd0
         cVmK7oa7fO65A7NZW/2IzEEr54WmzcZvHizXPp6G/l2wXldXQ1lwKaitli+OuUkV/eB1
         GPTQLvNzfJ228xHRLv8W+Cu3yIpMjhEP/E62UD+j/pOOeLMyoiinH2K8BiISshPphEz3
         W+KbBNWUZ2EimUulXYBahy2eH+XNbUQXhCoRHohGFkOubOkXRPFAZkzWjmHLLSpddxZb
         lKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hOaPXxj1ai+YwAcly+36QLrMNRChjPUinTBacA1yTzQ=;
        b=Vaw1ggPkHng7kB1ALzPBuciYlbNOYcomk6HAiA1REBvEtdomoJ36vRlAEbq56WBFNL
         CDvaffZfoSQb8xN1p7GXf1owSeBrEvlPlxY6PsqGlebDIXhpVsdB6VUXjl62RGR0v/Kz
         qPx8UKKMs/FovhKk/rRZfaGCSadlLXSeZKHLcHbVfa4LE0SroRkpBwjfheoFDq1w70bV
         tWds9IN9gfG1tK/bWZYN3ZFzq7ww14GwhzjsILsTRiAxkEeWtmvoM/xOBddmt5+01jBI
         T61OaOaLzS4etlWH3usNVQPrRRl51KO049OFLxYEyyVdgoNr+UtCxOTh1VgvWfLe7nI/
         /xrg==
X-Gm-Message-State: AOAM531Mh92ooG71Coqfm/EkgHXLKWYLRBgqXWvKtnTf48eSpdH634NQ
        JiB0FEbh1TM8ZYNSzf4MCoI=
X-Google-Smtp-Source: ABdhPJwMX/GI66KPwY3Jsk4XWv9O89pOJfG5fNqvE+XbYqZ1Agv0nFBm6SbXx4Z8l4MD6znhJC7kmQ==
X-Received: by 2002:aa7:9ec4:: with SMTP id r4mr10857380pfq.48.1597653139620;
        Mon, 17 Aug 2020 01:32:19 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:19 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 03/11] media: ngene: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:45 +0530
Message-Id: <20200817083153.22218-4-allen.lkml@gmail.com>
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
 drivers/media/pci/ngene/ngene-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
index af15ca1c501b..f9f94f47d76b 100644
--- a/drivers/media/pci/ngene/ngene-core.c
+++ b/drivers/media/pci/ngene/ngene-core.c
@@ -50,9 +50,9 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 /* nGene interrupt handler **************************************************/
 /****************************************************************************/
 
-static void event_tasklet(unsigned long data)
+static void event_tasklet(struct tasklet_struct *t)
 {
-	struct ngene *dev = (struct ngene *)data;
+	struct ngene *dev = from_tasklet(dev, t, event_tasklet);
 
 	while (dev->EventQueueReadIndex != dev->EventQueueWriteIndex) {
 		struct EVENT_BUFFER Event =
@@ -68,9 +68,9 @@ static void event_tasklet(unsigned long data)
 	}
 }
 
-static void demux_tasklet(unsigned long data)
+static void demux_tasklet(struct tasklet_struct *t)
 {
-	struct ngene_channel *chan = (struct ngene_channel *)data;
+	struct ngene_channel *chan = from_tasklet(chan, t, demux_tasklet);
 	struct device *pdev = &chan->dev->pci_dev->dev;
 	struct SBufferHeader *Cur = chan->nextBuffer;
 
@@ -1181,7 +1181,7 @@ static void ngene_init(struct ngene *dev)
 	struct device *pdev = &dev->pci_dev->dev;
 	int i;
 
-	tasklet_init(&dev->event_tasklet, event_tasklet, (unsigned long)dev);
+	tasklet_setup(&dev->event_tasklet, event_tasklet);
 
 	memset_io(dev->iomem + 0xc000, 0x00, 0x220);
 	memset_io(dev->iomem + 0xc400, 0x00, 0x100);
@@ -1445,7 +1445,7 @@ static int init_channel(struct ngene_channel *chan)
 	struct ngene_info *ni = dev->card_info;
 	int io = ni->io_type[nr];
 
-	tasklet_init(&chan->demux_tasklet, demux_tasklet, (unsigned long)chan);
+	tasklet_setup(&chan->demux_tasklet, demux_tasklet);
 	chan->users = 0;
 	chan->type = io;
 	chan->mode = chan->type;	/* for now only one mode */
-- 
2.17.1

