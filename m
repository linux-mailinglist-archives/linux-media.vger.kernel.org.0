Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA8D351A00
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235982AbhDAR5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236721AbhDARzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:55:11 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67955C0045E7;
        Thu,  1 Apr 2021 07:43:47 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id w3so3264176ejc.4;
        Thu, 01 Apr 2021 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J7Mm6/g9DScNG5FEVhWNdLSdW972ryQCD27uTAegArs=;
        b=cocP5aFSaDQz8YX9rCZCsYjT4pyAyRqKwmr4Mz497RoajsgGF2xqbQCtJ9O1AY1Gok
         ztzYsKCqUuhznyQHYNx2Ba6KCc28I3YlyUPf+rRN55qv+nTIwfMsXFpH1R+VsnczpIsn
         AHdxpAHTqlY7owm9DUO/EWWQc0gyCbJ84Ia71jjxSrFwE+HNkgTzErq5IJPuKGBXzjYT
         sxrjIr4B9GpD9yQvDcDIqYCd8CPisH9MTH4PUN8ypRhG7B0+q81iEIvldW03OaV/sYVY
         I+7YmjudeoZ+90m1q30mzvPcIALWSTMjdDS3lm7yhQaGuhM88R53g0IXZGctH+u/a4xD
         Wt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J7Mm6/g9DScNG5FEVhWNdLSdW972ryQCD27uTAegArs=;
        b=B6WeRZiAKzmHv0CNpacxGxl9ykMFjkgW2EKvfxSgT2rCqrplWs+E9Ovgh8BFFopH8s
         bg2oVAHtIfRipqIDJhcOfeBKiLb6pTs9u7pRWZ6xXm2vPpMI6+q/n/JDaLfsGcfWTDNW
         KT7sbuYcYTn3diXMlDXte2CLet/r2eYsJ9ZgubBwNDw7hfWfQXVLT4Pux0XtEk7E0Or6
         RDZ1stCEeQpAOz7Wwi/OQuHPpgOOvyIp4monSErtKfzFAda57HHQKszmq5LqyuuPSMMx
         L3jcWzwlNUAuVdT4XeMMjELenofK9qO//HwYWE1nw+yLKXPx58/78OTNAeQ3TCZVIV9b
         kPWg==
X-Gm-Message-State: AOAM5323CVd+xhOiMuD+SiyN6VD27z6YvP6FKpW9k5r2AkGx12NXgqhN
        iWv/KRDtbp5K33vQIrHTaY0=
X-Google-Smtp-Source: ABdhPJyVac4iu3IdmV+i/AHmGdiPnVtIYRQD5L8PxGyrsvDy5FaLQyPgzgxpLJNCatATCQIbVe94Ww==
X-Received: by 2002:a17:907:37a:: with SMTP id rs26mr9422030ejb.336.1617288226183;
        Thu, 01 Apr 2021 07:43:46 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:45 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 1/9] media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
Date:   Thu,  1 Apr 2021 15:43:28 +0100
Message-Id: <20210401144336.2495479-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
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

