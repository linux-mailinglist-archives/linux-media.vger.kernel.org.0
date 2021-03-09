Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2E7333047
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 21:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCIUvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 15:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhCIUvN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 15:51:13 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4223FC06174A
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 12:51:13 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b13so23169581edx.1
        for <linux-media@vger.kernel.org>; Tue, 09 Mar 2021 12:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q+LXPS2g/C2kk8K3V/x2NSnGympAYYgTq9AwkJ/pVJg=;
        b=K1IwR7nekABeEPYTpc4sfCNOmMmM69FNHkZxRzFj0qH5RZWU9XImYZzmlE0RnWRh03
         F0CTTqCA0DSvbgqIBvUzbrZXpvHL1YQJEs9xGLp83Z5EbjgQjwPiEVTTuLNLmFa9QNmh
         PhaCKqXzEEY5ATbSploSh7okQTotlAOa7D8ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+LXPS2g/C2kk8K3V/x2NSnGympAYYgTq9AwkJ/pVJg=;
        b=L+DIuxlwB+Ks+o5Ate8WADG730IGySypcLLZTFXAZdGIQ+G1WEVfQzoWxVxbI4Nz9T
         tVwVShPdxYLYGa9bjm+Hy+dZKHIDxIVkW7MadxQpFk+rJh5yS76OsDNpzJTB+12vbSvc
         elyblUUro5bfGqPmvC8ATrOCzIJwTAQdDyfy0mJFv6gKxN2AQQkSXBSoed9EqijnZuSp
         ScSG3IBbW44Dk2qHm+Drm63TrL5drcZJMF/KdmD9JcQ7PPzmjtzBIV2E4EvW3BaRSbVB
         mAzR9QVBCoeckzckh8shEkWhPjBYvomOCdLxEpH3+rsqVXpYxJOAsU1j5VCJ1FRr8IAv
         Zxtw==
X-Gm-Message-State: AOAM532nwFTb2zfuilHhsxEbQb5sPzBbrQaRv2vp7OeroMb6begGdlay
        96ik81XQrNDjBL6HK1dzbRkM+Q==
X-Google-Smtp-Source: ABdhPJxnRoBhZTMo7aEzAdv4A87Pfu3GiwuHUGUxLoppCuiln29NC3PVmEVw94505C+/DTTrS7jsCQ==
X-Received: by 2002:aa7:c6da:: with SMTP id b26mr6426641eds.254.1615323072076;
        Tue, 09 Mar 2021 12:51:12 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id mc10sm8861190ejb.56.2021.03.09.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:51:11 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 2/2] media: videobuf2: Exit promptly if size = 0
Date:   Tue,  9 Mar 2021 21:51:08 +0100
Message-Id: <20210309205108.997166-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210309205108.997166-1-ribalda@chromium.org>
References: <20210309205108.997166-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exit as soon as possible if a driver wants to allocate a buffer of
size 0, and print a warning to help fixing the issue.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 030e48218687..c5b06a509566 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -105,7 +105,7 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
 	int ret;
 	int num_pages;
 
-	if (WARN_ON(!dev))
+	if (WARN_ON(!dev) || WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
 
 	buf = kzalloc(sizeof *buf, GFP_KERNEL);
-- 
2.30.1.766.gb4fecdf3b7-goog

