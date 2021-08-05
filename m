Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D960B3E1C0F
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 21:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242907AbhHETFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 15:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242436AbhHETEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 15:04:51 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4C2C061384;
        Thu,  5 Aug 2021 12:04:24 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so7091803wms.2;
        Thu, 05 Aug 2021 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oTE2yvgvW8glea98LSY/ffZ1b6poaqIV5ugiE4I/bJE=;
        b=lNNGt2hJtFLKaKfbRjcNF8QqPU6aHLbcEsKqIcUgkcBGaXt7+2Gc3JP83833YrWOIv
         7jlaYW6QhcblMUqhSdwb6y+Myp+VyNclNkEOqYgO2WYj/LLZvzv79PPIfufk5L6ZVNnS
         MSdFq1BZ3wz0ebR5WbqMUEcNA4+zP/6OV7D3dSQtXmcb6K5WlGGX0qpHJLHJX3N7sQOX
         gIJt3pV2aV/+tmX7rD0tIWBiz/gSxp/mANKC65ED/b/DurNYsao+j0pGMqqf1/n1sZY/
         Z4fa5X+QBDUhRVtgcpPrIjj2Aia7Q6ubvHXo36kvFKm+El3DLIOoGtnqcR3WsK3Mopk1
         2uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oTE2yvgvW8glea98LSY/ffZ1b6poaqIV5ugiE4I/bJE=;
        b=UgbDm7bPkyFquM7YFD16kFchpEshIUCDca3Z3sXOWktZdRC4hmaJQbcTdpYg1hsQDc
         P7h8ZH3IYUwfEOrc4VQX7xMucXsMIASEGRZfZgkmFNKsBS1W9u+mtJw5zMtlvVxOF/qY
         +IZIJOjNlYWUjpE34tFphr/Y4uHLzZDly/nh1LyY9vFwP5V7d8kD+A0+2ZJjE1IhfFI4
         OZkkbHJ14Hh+HlhccDEEFbAj1eQxtxKUyNjkZ0pYjWfwNeTJWdKUapQBshvFAn9RtHzO
         e/nrp5QeeYzVnA1TauMeVLR37tZpCRy5eesWH4IS9/DtF8fzyjGysnySidTYPUxvtH8Y
         mIwg==
X-Gm-Message-State: AOAM531Eta7Lgf1xupvS2G2uzkQC4NMKULvULyeEwJBGTFxmVBUyadkS
        bCbWcGhUEYIQV6g05QayWGI=
X-Google-Smtp-Source: ABdhPJwkC/YeGz/Dyo9+y84CiGmImn7JArYQpWwTejOvMX6UfS/2NsjkB1EpQntC8fZ8bP7wy08HGQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr6508448wmr.168.1628190263065;
        Thu, 05 Aug 2021 12:04:23 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id q7sm6329781wmq.33.2021.08.05.12.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 12:04:22 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, emil.velikov@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: hantro: Fix check for single irq
Date:   Thu,  5 Aug 2021 21:04:16 +0200
Message-Id: <20210805190416.332563-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some cores use only one interrupt and in such case interrupt name in DT
is not needed. Driver supposedly accounted that, but due to the wrong
field check it never worked. Fix that.

Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single irq/clk")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 8a2edd67f2c6..20e508158871 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -919,7 +919,7 @@ static int hantro_probe(struct platform_device *pdev)
 		if (!vpu->variant->irqs[i].handler)
 			continue;
 
-		if (vpu->variant->num_clocks > 1) {
+		if (vpu->variant->num_irqs > 1) {
 			irq_name = vpu->variant->irqs[i].name;
 			irq = platform_get_irq_byname(vpu->pdev, irq_name);
 		} else {
-- 
2.32.0

