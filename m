Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592A423E902
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgHGIgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGIgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:14 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E188C061574;
        Fri,  7 Aug 2020 01:36:14 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 6so750363qtt.0;
        Fri, 07 Aug 2020 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdO3teMZpZhh4Zg2rIT12joG5MKLgBFbBUxDW1pI73k=;
        b=eIR16ZnQ1nthK/tYOCxXkv+uIJlqLI5IbwPoaSHYzG5gRu20ue9nD6QcbcUL6csLHq
         qJ2Bf3uuqmFtWK+oIJ5EzY3p1D25EFds9Q/z7v8P5eEDL2TVQ9mEVGerVe/8PbTl/Qsk
         D11fnpEB4jlA3GJjzTBBaivnKJQfkHoMpRl7Mes/NBarDLQ2EBA5tm3fKMVXCUX5p8NE
         VtI6+OpmTkmJ4j60tffXtyKIDmyO1/uEycScTE8E6FEgO3oFk0A8h/SRUTFFX4NyHy/D
         pAI5tBl+++1vqtgrdk6M+NIJOrts3ioniEWB22DpA+PlR4g7FKvH16B1edACnFjwhi+W
         txjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdO3teMZpZhh4Zg2rIT12joG5MKLgBFbBUxDW1pI73k=;
        b=DwXflxIr0aYng0tZNcuTXEfNuxsGg8tnZ7B3e/CXmsbpD0IPeFpYOQhxxsUUvnbhgO
         fPCUOHgxKDRmjBlpq/vx+0W2fk0zIqG3AemOiaDUx3dZZnflq+7qh0ZsJmTNjDztYjZW
         BtS0kJZWr8xBkRem82LKmy/GxmM5dbSy6wqI3voRTPpaN6ecCW4zHIHN6eRTUHLNdcty
         cJjQwlaxu70QcMwQ0ovAM16IZFxGOCE2Y9q3ib9z/PZ0XcJAV8STUYzJLUEFpT0Brgo3
         nS+9N/LjKsHGtGJ0dvKZaljM/XMnn162PHBdO5ULHIyRWft2tltWxgn4N8PSOlmUSWCC
         ec4w==
X-Gm-Message-State: AOAM530/rzC3S1Z2DlMccmvAue2paDuNet+gamR7/9g9RtIMYzh6stmy
        3k77orKkO78d42dV0cf+MFc=
X-Google-Smtp-Source: ABdhPJwBojBnRxKGIEx2o9NF/V0VbhRIv+H1iWPd1xJmwPYqw7fbihn+NBWPgbuQol6WxM2CBA7iGg==
X-Received: by 2002:aed:3947:: with SMTP id l65mr13322315qte.374.1596789373742;
        Fri, 07 Aug 2020 01:36:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:13 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/20] media: exynos4-is: media-dev.c: use PTR_ERR_OR_ZERO
Date:   Fri,  7 Aug 2020 05:35:29 -0300
Message-Id: <20200807083548.204360-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fixes the following coccinelle report:

drivers/media/platform/exynos4-is/media-dev.c:1273:1-3:
WARNING: PTR_ERR_OR_ZERO can be used

By using PTR_ERR_OR_ZERO in place of the existing logic.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 16dd660137a8..9346b08931e2 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1270,10 +1270,8 @@ static int fimc_md_get_pinctrl(struct fimc_md *fmd)
 
 	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
 					PINCTRL_STATE_IDLE);
-	if (IS_ERR(pctl->state_idle))
-		return PTR_ERR(pctl->state_idle);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(pctl->state_idle);
 }
 
 static int cam_clk_prepare(struct clk_hw *hw)
-- 
2.28.0

