Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D17BE0C4
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 17:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438583AbfIYPC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 11:02:56 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44698 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731142AbfIYPCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 11:02:55 -0400
Received: by mail-io1-f66.google.com with SMTP id j4so14606376iog.11;
        Wed, 25 Sep 2019 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MWyh3PNmOklfeVqzYOrNwzDcAH8lax2jMCGmRDG4urM=;
        b=arASj5Yv5bqz17U8QZVYbble7TDB5sj0TMbNk56fxz5ejOoHyT3kYbYJ/QtfbbLSs6
         iEjbcUYxhDqPRDkxpycr9uysp4vVx+usX4dONocnmhwJEwUZNwBO9gxatNe8zkYv3cBV
         6/zgf3/mu1ElXkjkjabewFHnWgFLNY2bEKtd9Wx3P6FGJyuwNg5dgB8SDQb/2DSr4X9q
         aUgMqjBas1yw+cOjn/+KzpYS5k6gjQTDGNc4k+SZec43+S+O208YvxdUJ1ivWceNMa90
         RFPA3kk2XYQIgbJVbmqVTOzfX1l/qDVCb/GHdWaEq3GUolGoF7RGnD3ntqNF7uyElR4g
         1cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MWyh3PNmOklfeVqzYOrNwzDcAH8lax2jMCGmRDG4urM=;
        b=a11vAjMQ8OwRtbrsNLlkXz9P6ewInEp9Y3Yp+tDjNcUdkcFEfckW79Eoc5EIFPd58E
         KdJncVKoKTHG4PNxbHcjBXFY82d8wYP+gzkfv4Fx5zKfi9ZRj03gupr1tq8kAizI6+QM
         fQUaDU5Z+kETTNPQx4V9W9WsMituZTsmC3yIjhtyaY9qnvDFpjeIcFi8ityCJ59nqaBs
         xDkYx9NCUK/ZkRujeIznZ3kaCDvgTxG/PM02POWE8/CEnkaS4oVwMqIJ1WJqRO4cW5Rd
         ak9LLUKankinb6T5dd1BPeVmOq4MJJnB8OrnMrENhtYgLgCDELF9090hqfpBkv4FW4zN
         vGOQ==
X-Gm-Message-State: APjAAAULnVDgP2mQfcWBZXj8JYWYlmhlw/fk0WqZRMbvjRR4s+BO+yLW
        YtHDvZSJqP12YLMYI6zTrm0=
X-Google-Smtp-Source: APXvYqwPBH16FuEXUH7rOy3JWTXRjXFzwF9Spfa1QHh9p2MfWd+kBFJthLybBlVk8lVb6Ym4UWB2NA==
X-Received: by 2002:a5d:8ad4:: with SMTP id e20mr2109019iot.203.1569423773435;
        Wed, 25 Sep 2019 08:02:53 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id 2sm206447ilw.50.2019.09.25.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 08:02:52 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: prevent memory leak in cx23888_ir_probe
Date:   Wed, 25 Sep 2019 10:02:41 -0500
Message-Id: <20190925150244.13644-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cx23888_ir_probe if kfifo_alloc fails the allocated memory for state
should be released.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/media/pci/cx23885/cx23888-ir.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index e880afe37f15..90e7c32c54bb 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -1167,8 +1167,11 @@ int cx23888_ir_probe(struct cx23885_dev *dev)
 		return -ENOMEM;
 
 	spin_lock_init(&state->rx_kfifo_lock);
-	if (kfifo_alloc(&state->rx_kfifo, CX23888_IR_RX_KFIFO_SIZE, GFP_KERNEL))
+	if (kfifo_alloc(&state->rx_kfifo, CX23888_IR_RX_KFIFO_SIZE,
+			GFP_KERNEL)) {
+		kfree(state);
 		return -ENOMEM;
+	}
 
 	state->dev = dev;
 	sd = &state->sd;
-- 
2.17.1

