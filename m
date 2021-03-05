Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C50332F2E4
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 19:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhCESkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 13:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbhCESjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 13:39:47 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF0FC061760
        for <linux-media@vger.kernel.org>; Fri,  5 Mar 2021 10:39:37 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id p8so5364747ejb.10
        for <linux-media@vger.kernel.org>; Fri, 05 Mar 2021 10:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bIJdIGKj6HKNSz+mFrNMaUm/bPZqpcnizzIMsRqYuoY=;
        b=RiVWhR/OvXOcja8xhoQiGT5PENPEhs6J6857L37rppeYpLlOTH6et5xlvA4+/l13oB
         IgaRlZNmLThTUY36AbheXvHSUyptu/w4y/kNgRcH8BW+s6CZe7PZdF95iLM6XL4YUwLu
         bJ5qmvSmOLTEitH66jN4etv4LydMPbJeyRZJOiSrnoNQ87xaKYAOrt4ceqRRnsKCTuZn
         PCbHjZbHpdMRs7LdBdfWzQ9cW2YM7fRq/AMFje8ieYX7bQmjk4zRyp8l84iR6+uMTHvU
         X4J3apTH6S5zqMHdBsLR8zyjSlsmmzFgUGJmcjUv5/89r+kPcSIBo8ohwOm8mnurXhst
         yoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIJdIGKj6HKNSz+mFrNMaUm/bPZqpcnizzIMsRqYuoY=;
        b=axnpUKWQ4ixD7lJmydEv2+J+DrFijstIYYm7n7mLIbiKcIG0XZaCrOJPN7EP1hUv21
         ybFChq+ka5AEsDlrGYXahv0Kh0mujF9uYwZebLGS3YE86C7CTI3tY9MtCWVPQVjJV7w+
         vXorjB9gBHL/DUS0ABiilOZgQ/Xaknn1rKwo3WFkeOnbw0apgUV5XR3ppZSkHq8DMLHd
         F0AoXQAGddLE72N1OvOvfCE8nga/lOFH2QJdTOGMWvI33Kk9dNzW/lzoZpMrrYC5wlfN
         b9QYfOb0SgnGxqnw9HtHD+WWbd5AUot80+KsHCnA9w337SLpT/SomoJhJ6icccEtwAjU
         9fxg==
X-Gm-Message-State: AOAM531KH7y8Uz5BMgWtkZeFKMowoqyu/C2uJnMqX7DUE7kblGwwPOc8
        8/X7/WZDljTVHm/g1+thXiQ=
X-Google-Smtp-Source: ABdhPJyYrwPZqYJTonz4hUccXLXjyd7w2XNt8KWKQ+V7zyILnAlCiP4HpU6o6QjjEkD32oC9F2oRPg==
X-Received: by 2002:a17:906:c210:: with SMTP id d16mr3539327ejz.187.1614969576258;
        Fri, 05 Mar 2021 10:39:36 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:39:35 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 1/7] media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
Date:   Fri,  5 Mar 2021 18:39:18 +0000
Message-Id: <20210305183924.1754026-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Use the register directly over the existing SWREG().

Ideally we'll port the driver away from the local registers, but for
now this is enough. For context - I was reading through the IRQ register
handling across the variants.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6386a3989bfe..0fd306806f16 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
 #include "hantro_hw.h"
+#include "hantro_g1_regs.h"
 
 #define G1_SWREG(nr)			((nr) * 4)
 
@@ -20,7 +21,6 @@
 #define G1_REG_REFER2_BASE		G1_SWREG(16)
 #define G1_REG_REFER3_BASE		G1_SWREG(17)
 #define G1_REG_QTABLE_BASE		G1_SWREG(40)
-#define G1_REG_DEC_E(v)			((v) ? BIT(0) : 0)
 
 #define G1_REG_DEC_AXI_RD_ID(v)		(((v) << 24) & GENMASK(31, 24))
 #define G1_REG_DEC_TIMEOUT_E(v)		((v) ? BIT(23) : 0)
@@ -246,6 +246,5 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	hantro_end_prepare_run(ctx);
 
-	reg = G1_REG_DEC_E(1);
-	vdpu_write(vpu, reg, G1_SWREG(1));
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
 }
-- 
2.30.1

