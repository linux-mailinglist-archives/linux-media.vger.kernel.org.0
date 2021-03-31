Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8949335058A
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbhCaRfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbhCaRfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A73C061574;
        Wed, 31 Mar 2021 10:35:29 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v4so20466048wrp.13;
        Wed, 31 Mar 2021 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J7Mm6/g9DScNG5FEVhWNdLSdW972ryQCD27uTAegArs=;
        b=LtN7G9r8/jl/2chD7ZXrYNlXLFyE+1lvHPSzInWwN4rBV3jMbLzdoLCcYqGFP7RmQD
         tr3tNj/8FP3HOc1RRfLu5FJqSuE+8+RfTaVXmDgB6Cn4Bc9HLJicrgfBGSwMvBm6ADvI
         fkTvDyHvX5Z16HcOtUY1O1BiAeJbK1TWtK4rvVlNnHq4ya9cmq5/c9IIvuLd/5Pj9q+X
         Ht5q4jgJ7bG3/s5lu9yYdLWMnquXyYP83V/2GPTsQ5LV7sYAbKE6JqBuy0mAhu9yzMwH
         2zAhow+XzuZIwjc2KIp9P/H51r6f8c1ZHNKY8QrN/B6wv0gljbt22ABz6yhtpk3nzLZM
         E/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J7Mm6/g9DScNG5FEVhWNdLSdW972ryQCD27uTAegArs=;
        b=JETtnFMfINSSUbgUuwmiGrAwuwWw90pOkMqF8nN0e6Mrpz/hNOrx2+F0RyvzA4UouE
         u64S27vWRHILvUgkpEZ7++CKFB2BBC6WRKi/gsdvniFzSe3ZlQ3qsU6Z8obhRptJ5nJt
         LF4KhLzFUsPYC+T3aEdhlu4PnAJp838lv6dOFYRXhEKuEuoOE0PsQR2InszmEonZjrfl
         zeUXdQdM5Ga4ky9vWIo154Io8hdsBxJXCPbKA0yivlhATUgN9xoem0CUtr4Kn+94I4P3
         +cgJFEmXo5ycHGdedSr0inh1+SGy4XThkIjXRla+FX/w3mLpHu1eDNYJH/IDfpd4nyfi
         SpQw==
X-Gm-Message-State: AOAM5330CVhc6Ye8dmeDN3Al70SvJMcrTRnvVseceJtN7eXm3todmf6n
        kOEYvgJaZDbYbyKGQBzy8Hs=
X-Google-Smtp-Source: ABdhPJw52RKYcN4+cD5o9NRPGtnnTUTfKGBiYwXL6SNpac2aCdJFLiYtuSyEk+mnan+bhPp2J4+htQ==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr4938431wrr.274.1617212128474;
        Wed, 31 Mar 2021 10:35:28 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:27 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v3 1/9] media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
Date:   Wed, 31 Mar 2021 18:35:12 +0100
Message-Id: <20210331173520.184191-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
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

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
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
2.31.1

