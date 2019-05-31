Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74E630CA3
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 12:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfEaKdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 06:33:20 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37936 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfEaKdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 06:33:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so5609467wmh.3
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByfPDgU22Z1U1XSrJRvjO9v2H1XpDQdjYxUHf9uqjyc=;
        b=oqStfDIlIvDhQcvg02CGqjgJ7Ao8oVncyoutW0cZjjWZ58BOJIESPVLfHcy1Z14EMG
         xEAxiq7yhKTu0YlXgoHnS5DqWjOrtmcOjkYtlo8sN85WUB5cpaLMYHaPAmVdBa1gYzl4
         3TdtYf/g2gLQfx4TkB6ZwxU5tAWDa875de3CK44we9z5lnWpAg3qLow3qvGZyw5fqByI
         anpgZCTe1MSQwrLWQN95Aut0KAj+F2NHlcWIwvI8QSqxoyAo6kt0Q7Ea7VZEK7STuA7y
         CaztDXWqWndS69y4O++k2U3ZO0XDlOC8Om/r1jB1ND2Lvb1tpftUFKO5Pgsvb2/KN+K8
         sxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByfPDgU22Z1U1XSrJRvjO9v2H1XpDQdjYxUHf9uqjyc=;
        b=TeLc7Mn7ignzx1X6AT/BLPQPrMu4K5xmDplcvw6Mxrl1oM94T5tL8wLUs+YXk3majq
         bl82FLlu9LODS2TKmPDmn/4tBvMjLVsdpyj/HM9CjV5SngOwi5XyN3M3U5XqGMUt4roq
         gpD/ko5ptdDIF05naI4vftfDyUOvu8NOL/6whcB3YMXEFCJTajAwZB4JGvLqzrIXdPO1
         +8NWVfeDT6FRuUY7VjCqf6rd6P1wUJUo4oYn1PNnYAYg9OHycEkRFoK0Pf7ri8wQLPea
         12w7ly4d5AAZDNtL5hscrQfztJlFYqySGzzqCe4ViWGJYGojrfZan5PaoWy+Dt0LN7hG
         y6uA==
X-Gm-Message-State: APjAAAXd0w3Ckd++N3h1P8NdsoH+gVer3wMZ1ZZaee50tYo2jmnVcVw6
        BNCHbXli0B6qUhRKtiquIJnzxQ==
X-Google-Smtp-Source: APXvYqzjri4jLx4G/XNJBs9hd4fjiKEFHxhfjCQjKElQHrV/S/VVwy5aVTcTRF646Me7ACF6VyIlqA==
X-Received: by 2002:a05:600c:22cc:: with SMTP id 12mr5271222wmg.141.1559298798562;
        Fri, 31 May 2019 03:33:18 -0700 (PDT)
Received: from bender.home (amarseille-652-1-291-131.w109-208.abo.wanadoo.fr. [109.208.94.131])
        by smtp.gmail.com with ESMTPSA id h14sm4038960wro.3.2019.05.31.03.33.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 03:33:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-media@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: ao-cec-g12a: disable regmap fast_io for cec bus regmap
Date:   Fri, 31 May 2019 12:33:15 +0200
Message-Id: <20190531103315.15166-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With fast_io enabled, spinlock_irq is used for read/write operations,
thus leading to :
BUG: sleeping function called from invalid context at [snip]/ao-cec-g12a.c:379
 in_atomic(): 1, irqs_disabled(): 128, pid: 1451, name: irq/14-ff800280
[snip]
Call trace:
 dump_backtrace+0x0/0x180
 show_stack+0x14/0x1c
 dump_stack+0xa8/0xe0
 ___might_sleep+0xf4/0x104
 __might_sleep+0x4c/0x80
 meson_ao_cec_g12a_read+0x7c/0x164
 regmap_read+0x16c/0x1b0
 meson_ao_cec_g12a_irq_thread+0xcc/0x200
 irq_thread_fn+0x2c/0x60
 irq_thread+0x14c/0x1fc
 kthread+0x11c/0x12c
 ret_from_fork+0x10/0x18

Simply remove fast_io to use mutexes instead.

Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3620a1e310f5..ddfd060625da 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -415,7 +415,6 @@ static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
 	.reg_read = meson_ao_cec_g12a_read,
 	.reg_write = meson_ao_cec_g12a_write,
 	.max_register = 0xffff,
-	.fast_io = true,
 };
 
 static inline void
-- 
2.21.0

