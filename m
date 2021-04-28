Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC6636E178
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 00:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhD1WQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 18:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhD1WQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 18:16:59 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06310C06138B;
        Wed, 28 Apr 2021 15:16:13 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id md17so6146163pjb.0;
        Wed, 28 Apr 2021 15:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ftMk683axPNdEq4WcuPKh12K2D9Yoa+fg5jvL/NYtb4=;
        b=D5VjVFi5wMQh86jZf8XAXjjNodd2Mmm8WaIIXzpwECRLNt3JRFg0nZK319mAj1r8IQ
         V/Bvw/2JRx/W3KfyStDUQXO9EnO3GmA3r35T+uuF++6ZtjO3716buiycRhdYICg+jBzN
         wST6iRjwesFizubk5womozkaPO/15cJMCLK+1LKJQdHJfMEuvjL3rre7lGHq/0pwZ2HG
         uXuflQceqdYCWtuHONlbPvlK6mRfFu4JYkI4ovtBIvZjOZAUvA89sIMaIbdj6h1p3klx
         Ystl7TmF8/hgzQh3LJaVcgX9uW5cq5X75SJeDBpPjXPTF0X9qFvZYhnTS4F/bcPBGAwY
         0RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ftMk683axPNdEq4WcuPKh12K2D9Yoa+fg5jvL/NYtb4=;
        b=EGADyTeYyPrBecAyTa86cqBGp5f8HNJsaElFm4tVEVpTWkaWF/wV+rVqcBB3wrbX/K
         9EIiDusEV/+3YKCy0c7RL6KBmNRqzj5DKSF78Nu7kEwhw7uDPPpa8lsZmLB1bLgKpBIr
         ts3XW4ImLoRu4GSbTnFL0U+JdN8bIjlvHiUwpCsi5kiUU7iD7xBVrytD/Wqm2lK3NHkp
         De9HJBVoGdTWi0L2IMgvXupxFe/RhSAx3E03vn23JLHKhKh8xlSrtX5I/f12e7wJfCrA
         Okw5eDQgZy6+7ELl8JABB97J4zSoUJEN+nyKH22h4WgZYJfVSzaFutsD3oykUC+MSbkr
         xYpw==
X-Gm-Message-State: AOAM530yUOROvP4LUYKDPzHrJgkYsMrGAAbz3cnigjVH9f88771FB/tX
        VNRZtSj3NwUpZQMPwOaJ9Q4=
X-Google-Smtp-Source: ABdhPJz2Y0lUTR/ryvbtVwjnMmazBMlSssQP9OcqAuvRUk1OStHvlqY/bgPn3hBH5xNzek6DI6Cdfg==
X-Received: by 2002:a17:902:b494:b029:e7:36be:9ce7 with SMTP id y20-20020a170902b494b02900e736be9ce7mr32348024plr.43.1619648172493;
        Wed, 28 Apr 2021 15:16:12 -0700 (PDT)
Received: from tong-desktop.local ([2601:647:4200:13:dc67:9833:b65f:4f94])
        by smtp.googlemail.com with ESMTPSA id b5sm659153pgb.0.2021.04.28.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 15:16:11 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Tong Zhang <ztong0001@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: bt878: do not schedule tasklet when it is not setup
Date:   Wed, 28 Apr 2021 18:12:26 -0400
Message-Id: <20210428221226.1799076-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <acd47ab6-49b3-f00d-857d-1f5f42129e05@wanadoo.fr>
References: <acd47ab6-49b3-f00d-857d-1f5f42129e05@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a problem with the tasklet in bt878. bt->tasklet is set by
dvb-bt8xx.ko, and bt878.ko can be loaded independently.
In this case if interrupt comes it may cause null-ptr-dereference.
To solve this issue, we check if the tasklet is actually set before
calling tasklet_schedule.

[    1.750438] bt878(0): irq FDSR FBUS risc_pc=
[    1.750728] BUG: kernel NULL pointer dereference, address: 0000000000000000
[    1.752969] RIP: 0010:0x0
[    1.757526] Call Trace:
[    1.757659]  <IRQ>
[    1.757770]  tasklet_action_common.isra.0+0x107/0x110
[    1.758041]  tasklet_action+0x22/0x30
[    1.758237]  __do_softirq+0xe0/0x29b
[    1.758430]  irq_exit_rcu+0xa4/0xb0
[    1.758618]  common_interrupt+0x8d/0xa0
[    1.758824]  </IRQ>

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
v2: fix coding style and commit log

 drivers/media/pci/bt8xx/bt878.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 78dd35c9b65d..7ca309121fb5 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -300,7 +300,8 @@ static irqreturn_t bt878_irq(int irq, void *dev_id)
 		}
 		if (astat & BT878_ARISCI) {
 			bt->finished_block = (stat & BT878_ARISCS) >> 28;
-			tasklet_schedule(&bt->tasklet);
+			if (bt->tasklet.callback)
+				tasklet_schedule(&bt->tasklet);
 			break;
 		}
 		count++;
-- 
2.25.1

