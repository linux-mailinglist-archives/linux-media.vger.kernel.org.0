Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39646351D80
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbhDAS25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbhDASSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:18:48 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EE9C0045EA;
        Thu,  1 Apr 2021 07:43:50 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id w3so3264428ejc.4;
        Thu, 01 Apr 2021 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RKzjLcplK3Qj6N++ugVsRlEJA8YUUn4W3Fexo0s7VWk=;
        b=Yx8aJJF9roXhjRvDam2PZ/yiaGQfqO6XO6xisEn4pmEJrBCqSuW73+eIrydZ8+7iwJ
         0Xt6ZBC77PaQOMtj4201lxCmu4wX/dkuj/RVa1r9XkwWmiRQb6dDdjmKsSQbv+vhRbPx
         u+dMeYQZJW7ZhTvkhNs+vIBwagNotIf8JBLoxszWk8De+6QZjAP8C6RE4vgaOtm3f7Y7
         Ht+vr4bDq4zY16YByGONEw2LshCyJbFte7VvJjH4on84mLfs3NRKmcU6be1j6clerxf2
         ReXUEyf+PGGKQ4JcBruu2oQMLxw6Rtm/+5TX4V8pdtTbTApFFhkUb38ZpCbFZPyCNd/k
         /U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RKzjLcplK3Qj6N++ugVsRlEJA8YUUn4W3Fexo0s7VWk=;
        b=kFgPY31HYmO1vtuMSqoscZVtlw5fcAzCU7/Pcy/0bZWBpzUBi5mP/fQ0zMn+JMyLwE
         gm/wWPAlDLxn621bsQntbHl2ZF1x3rygbFadHPXo8VOE6PlmSdaxpKY9oXynmtISJVl3
         UNjxYtS7JP5rJoEl5hJXcbDlzOEfsVgoyNk1Eli97+dEW/RYOkqk3lRFNFLY9/OHr9ZK
         JD9KYSmpZnlNtGpHYytzRZQZUmhjcnTiVyOtUoAxuyaLTDNO+DY6cDJoIcIdkKJqDOyp
         1FjqHFeEBKH++5EjzAGPZhXYIWTkAjEEidvX0usC0d2025/0L8QYlGIitBn/aIRiS96k
         fsXw==
X-Gm-Message-State: AOAM531+AGZjLbnw5zfyZkZRuh7LpqTyHtHHgswUoSrNaTIBsShvR2B+
        QhF94lddaibfjm/T3jK8dsE=
X-Google-Smtp-Source: ABdhPJzZowtT7P8Uk03UXsaDI9qXGEjJgDB6omDUiNF5Lwe4cohmebQyyy0VbSRa7O5DF0gjk8/Vyw==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr9157045ejc.133.1617288229379;
        Thu, 01 Apr 2021 07:43:49 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:48 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 4/9] media: hantro: imx: remove unused include
Date:   Thu,  1 Apr 2021 15:43:31 +0100
Message-Id: <20210401144336.2495479-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The current imx8 code does not use the jpeg encoder. Remove the
unnecessary include.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index cb1ac02c03d2..f36c1bd681ba 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 
 #include "hantro.h"
-#include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
-- 
2.31.1

