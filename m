Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D898A3CBC42
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 21:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhGPTUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 15:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57504 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229534AbhGPTUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 15:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626463062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Dh9TP4UQfqmrs3ZL1M5afaofaGCDHoww5GnNH6A6qVI=;
        b=aHFLzUI4zoaxgzLbdaj35agvtSSuNAqhfLWHPx/WGOvZFeifBiVUNyVThwtasJVLeuToY9
        3bgEAriXkz7UHNG2LvGxP8ycKSMgZNa0+F+UcrkIyCTWt9s/KNPVqwa6Nk4m39fpXIb8U9
        o2rpuF1Kyehn+U75e1qo+eoVbVLaRb4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-hLWwPiIGNtaJdNvRaMDRQg-1; Fri, 16 Jul 2021 15:17:41 -0400
X-MC-Unique: hLWwPiIGNtaJdNvRaMDRQg-1
Received: by mail-qv1-f70.google.com with SMTP id u8-20020a0562141c08b02902e82df307f0so7400228qvc.4
        for <linux-media@vger.kernel.org>; Fri, 16 Jul 2021 12:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dh9TP4UQfqmrs3ZL1M5afaofaGCDHoww5GnNH6A6qVI=;
        b=kZpCwYi3pHZ6bNPx5O3im+Zh6JRjHFyo3k9l2rt2J6aK3I8Xp+kCeLfrUOzbhUTl4S
         JrY6VmARRBWoD/7mjhZAwUC9uXrpwNPN2U7854+N0HkGjkVWvJPmfPO8Gy1KAxwpGJ3+
         JJNQP94oONoJzAnjymSN9/ADEY9pqrIITx7fBgDR2IPOsJbMqivSjfZud3VC5du3KJ5C
         bZzCwRXJFkPFn+TdoXLKJ7MazZuRL3Sl93qnrvOlgi0nkblgqVNW1H0FzxBBXuqkid+4
         2NIbNH4FmFvq4MJOb9GySV4OnEIYnO2U67pV9zl8f8I5H4g4bodIYMxolX8OB3IeQH2Z
         Sq4A==
X-Gm-Message-State: AOAM533qAHYywW+8IcIZFZLcvZnIzyGuGKfpcDRNF7A2jTKX+S+nEtXp
        DFAaPDKcSkhOxZBXUl361aGLtNg6zOJ77oFT1ILhI86KYDJ6v20JO+H+Sdt/G7GRFST8hHDHPky
        6w/NavL3D4bbzvkwaSLIi11s=
X-Received: by 2002:a05:620a:38f:: with SMTP id q15mr11493406qkm.116.1626463060842;
        Fri, 16 Jul 2021 12:17:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxojxgjssz6s5hi5XBH2Se8WN32bm3yv16fSMX286naPzmFZ35jHl0F2qL6jCa2aHw6/EBhXA==
X-Received: by 2002:a05:620a:38f:: with SMTP id q15mr11493386qkm.116.1626463060658;
        Fri, 16 Jul 2021 12:17:40 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i123sm2659785qkf.60.2021.07.16.12.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:17:40 -0700 (PDT)
From:   trix@redhat.com
To:     bparrot@ti.com, mchehab@kernel.org,
        tomi.valkeinen@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: ti-vpe: cal: fix indexing of cal->ctx[] in cal_probe()
Date:   Fri, 16 Jul 2021 12:17:33 -0700
Message-Id: <20210716191733.2976039-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

cal->ctx[i] is allocated with this loop
	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
and accessed in the error handler and else where with this loop
	for (i = 0; i < cal->num_contexts; i++)
Because the first loop contains a continue statement
before cal->num_contexts is incremented, using i as the
indexer will leave gaps in the cal->ctx[].

So use cal->num_contexts as the indexer.

Fixes: 75e7e58bfac1 ("media: ti-vpe: cal: support 8 DMA contexts")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 05bdc6d126d82..8e469d518a742 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1148,9 +1148,9 @@ static int cal_probe(struct platform_device *pdev)
 		if (!cal->phy[i]->source_node)
 			continue;
 
-		cal->ctx[i] = cal_ctx_create(cal, i);
-		if (!cal->ctx[i]) {
-			cal_err(cal, "Failed to create context %u\n", i);
+		cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
+		if (!cal->ctx[cal->num_contexts]) {
+			cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
 			ret = -ENODEV;
 			goto error_context;
 		}
-- 
2.26.3

