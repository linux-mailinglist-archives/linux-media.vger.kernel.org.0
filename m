Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08380337812
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234208AbhCKPlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbhCKPlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:05 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369E4C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:05 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id f12so2378181wrx.8
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A9gilAFWqX+sAkYfLFghCBaHM+ZlkbP8jMbwAPT3w7E=;
        b=pektPEun0KxdsEnbuwQz9hjNCrAy48V2ZNCQIjBl8zQKyJmPRrOr08idB06H8UqfO8
         9vwUJAEaHuSJyBg89IHWMNkBvx8Mwo7YTkY5nlcVXbXxKwzXwv/V5AgBnW04fCDIrxj/
         HGiXtvnpCBoQeiIx6ef6DU3Gdt59i9ugc7OCZF1JfnB/JFixmoY2dmBKGRVrnjsDi1R7
         NpvOUzJxgw+QCRi9M33+WSkb+Dm3L3pttaRgGATOt4ojG61iC5KzRLj6Qe6l2S3xG57F
         +1N/6iwOgZ8R1BR2n99gE2TW7767qemdnUZAQAZRefY0Ak/7dVYp5YYmjTtmwd+wWZzB
         DBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A9gilAFWqX+sAkYfLFghCBaHM+ZlkbP8jMbwAPT3w7E=;
        b=qxuiyB94GDh96QkGqYLV+PpI5yxg5ozfJoZVybotwb/+mR3MxQG0Xi7Ro6DITVpniT
         t5iO8I3upZohGbKq3T7Yj4TuvIFf3rAaxh1VmSlq2ZoN87TTanT5K+oqV/mOYVeLZp6Y
         fKu+XXJlBkwG/iS1855NBCxWpIp/4MIViCQqg++ya7MicfgAr2xLHx7zL1kzpIC/CNTO
         2H8kl5uWLHxv1ZTDACbesztnUm8pMQ+IFCG6INA+IspW6wxSoLMgl6QaK28Tw2EkV3Ss
         6Mq14uwWjQRtOTC7r6hnjlRGUbuEO1zWXwDHq5gZwoaDeEV47jKO5bHRdje/1XCp41cf
         9vbQ==
X-Gm-Message-State: AOAM530qTAvsA6ias3RHc4FrBT15s896srhkN8pZx4vvwfQL316q55XU
        rmaHYKV/FeSp0XuTPRUd0GDSHhFr+od+/w==
X-Google-Smtp-Source: ABdhPJxgud3NIWFBRry4m06fLMiqJrSLDu4S+lxYccZpRNN/gnJmAyCbf6lWujooctTG6oQNOz4cNA==
X-Received: by 2002:adf:f351:: with SMTP id e17mr9282127wrp.416.1615477263932;
        Thu, 11 Mar 2021 07:41:03 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:03 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v2 01/10] media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
Date:   Thu, 11 Mar 2021 15:40:46 +0000
Message-Id: <20210311154055.3496076-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
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

