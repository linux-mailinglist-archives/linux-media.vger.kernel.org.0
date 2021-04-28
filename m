Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6052536DFDE
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 21:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240300AbhD1TrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 15:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239663AbhD1TrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 15:47:14 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2472AC061573;
        Wed, 28 Apr 2021 12:46:28 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t2-20020a17090a0242b0290155433387beso3668368pje.1;
        Wed, 28 Apr 2021 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+wipqtCl4oGAHPqnb+AwAue6qaVdWbnOzGhdtR+Ytw=;
        b=F5bZGaYD9wF4spYCRoq8LrSFbRCNHXoTXnGNWiYQZl4kTQQ2sUE1fGqg63oRccdSZ3
         e2WMBdG12OZgIMtcCiQ4+A7/rvANDF5Fmsua8hySb5+nRwTBwqwaBbknZI27gGgFpVdu
         /ieVvhjaH/M7xIZZEFM7KBvDJ0cKjO5m7XXsqjCu1KJt2H2kRRcyOyBeKnxcHBd8g+bw
         nMgWSkdBK4rCVBnehNXD/Z1LnW1M+dXzKhsOVypcv0/SCSGRqZO5wjVbW76g2K2CCi0G
         BvtQwr1ktz2O7iXxgt/OW1YlfjNItupzRos1XJe/CrL25zNKDuwGBZCHHIVmbo5NTaHw
         1kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+wipqtCl4oGAHPqnb+AwAue6qaVdWbnOzGhdtR+Ytw=;
        b=JgkQdfmk54C66ezOV25b8NB2czJYWTG4ldhKlKWHvfuVfHKWU8jWqmbcR5otPckLu8
         VsOHWcWZZRcErQhQOb5D+wiFKYQXTh/Vkd/Wg4rEj2EmJA6D/4S0IkKqn5vEc/qEjoL5
         aG+bz33H4G/+XTcS6NcOMhnG+k5Yl7CAcFCKJJQVwQOfGKPMBP2W3p3eX24Vt22+zHON
         qerUQETDhsmm6+nkbWQR23bN9phQAAxS2PxbWAlDBVwohb/4mRlrDkAXUu08Xay8Nwwg
         B9NhoTk1v1hpTdjXKTh/DPiq09TeK4lS1IA6I7yXKHIVNXHZNA1OQfpJnabMzxfHiET+
         ImMQ==
X-Gm-Message-State: AOAM530oUqD9CB767Eq9ElaNO7pJE7fh4MKG/Qanv8WGpVpNfAFjmHIC
        NSfbd6+Mq5jf95K1hehabCljIjG9LOFLFEft
X-Google-Smtp-Source: ABdhPJyJqEdhgDdPedL1KsWIp0P/1+EZMGUpm6zBPQnyL0DGAIJZOFz8KUQJ8rTBjFnJpS7Qo56/3Q==
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id p16-20020a1709032490b02900e6faf586dfmr31129782plw.69.1619639187619;
        Wed, 28 Apr 2021 12:46:27 -0700 (PDT)
Received: from tong-desktop.local ([2601:647:4200:13:dc67:9833:b65f:4f94])
        by smtp.googlemail.com with ESMTPSA id m11sm459851pgs.4.2021.04.28.12.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 12:46:27 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Tong Zhang <ztong0001@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: bt878: avoid schedule tasklet when it is not setup
Date:   Wed, 28 Apr 2021 15:46:01 -0400
Message-Id: <20210428194602.1774183-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a problem with the tasklet in bt878. bt->tasklet is set by
dvb-bt8xx.ko, and bt878.ko can be loaded independetly.
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
 drivers/media/pci/bt8xx/bt878.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 78dd35c9b65d..6fc89649e320 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -300,7 +300,9 @@ static irqreturn_t bt878_irq(int irq, void *dev_id)
 		}
 		if (astat & BT878_ARISCI) {
 			bt->finished_block = (stat & BT878_ARISCS) >> 28;
-			tasklet_schedule(&bt->tasklet);
+			if (bt->tasklet.callback) {
+				tasklet_schedule(&bt->tasklet);
+			}
 			break;
 		}
 		count++;
-- 
2.25.1

