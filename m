Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4672925C19B
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 15:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgICNUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 09:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729028AbgICNNv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 09:13:51 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10935C06124F;
        Thu,  3 Sep 2020 06:13:51 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id w16so2942317qkj.7;
        Thu, 03 Sep 2020 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GeSELCg+76l+Qd82d5e7kNqgvSufU981JBM+QwM43w4=;
        b=HIcz/v5l5h4krWlWHjOk7uGWLS36/gGPbD6q94mV74F+7i3WWmLJg1V0Vu3eSV1qMM
         D6AC3+wa30Zw9q+Lrprmv+Mt9CdGj6AV1sHrvtLBp6iDxkOj2p43Q5zW6n0Kzgnkxh1o
         1CxFZVZFU0aKHPIAUha6CvKkT4Bc7MJWyXtN4Niy++BVLUJoptZ3bL+Xqs+C60OMeeWx
         QPe0deWpBFJPqp9TWcSbdpAiUj2ynuqjiPdtP6w8jcLghz/iHp4gm2uHSyWiYbXXvmQu
         eL8T2H1YD8myR3SVgLI5/AXH+vkboZaLC696bficonY97jHXijITEhV6Gsj6LwoJcdom
         ULkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GeSELCg+76l+Qd82d5e7kNqgvSufU981JBM+QwM43w4=;
        b=KIuS8o6jrdmi95ao/ob2mSNMmiVmyWZCyzHjUDF6Bhl8lMV47rEjk77r8oNn5uRE/t
         91urzLNvDs9kVxhPmltQmUisL/R7zTGgkcOk/xXt6VK3LrfBXq9s3UI0V5YsfhGVjp/r
         AszYtvSSFwVqv+wO61o/D+VsCCX0TqQVKDHdgJIgmDrIcBmKtcG3961dAT/ffXZa7ijA
         O83EQ8di/c708GlZ0A5cMHH8sv1lSlq72dUVm+YqoPCn4PmRFNha30nyH/gUNmhmD7KH
         QwDcZA0H9psZ2tpPMMOtjTU7PYZwUC5RlQIS4lFhFJAzP++zkdW+Xybh29og9O1lzSYL
         tcww==
X-Gm-Message-State: AOAM530PB9VSoFGVtTxP4FNPsI2gn8xBr+oM0W7+tttnoh4IIdBFUwkh
        +z1HumWlKVAW2gyiK3KX7WTWPX8c0LUD+w==
X-Google-Smtp-Source: ABdhPJzz+Q2kkqpiYVDogABB+MnnbWms7aUoJFNfRihFiQ88s5NyhBrVt9veq4QvSnGraLqdKYvmGw==
X-Received: by 2002:a37:4990:: with SMTP id w138mr3114693qka.346.1599138830265;
        Thu, 03 Sep 2020 06:13:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id e63sm2127007qkf.29.2020.09.03.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 06:13:49 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Benoit Parrot <bparrot@ti.com>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v2 2/2] media: platform: vpdma.c: fix comparison to bool
Date:   Thu,  3 Sep 2020 10:13:10 -0300
Message-Id: <20200903131311.442255-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/platform/ti-vpe/vpdma.c:946:5-26: WARNING:
Comparison to bool

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/platform/ti-vpe/vpdma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 2e5148ae7a0f..5893917ce50d 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -942,14 +942,13 @@ int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&vpdma->lock, flags);
-	for (i = 0; i < VPDMA_MAX_NUM_LIST &&
-	    vpdma->hwlist_used[i] == true; i++)
-		;
-
-	if (i < VPDMA_MAX_NUM_LIST) {
+	for (i = 0; i < VPDMA_MAX_NUM_LIST; i++) {
+		if (vpdma->hwlist_used[i])
+			continue;
 		list_num = i;
 		vpdma->hwlist_used[i] = true;
 		vpdma->hwlist_priv[i] = priv;
+		break;
 	}
 	spin_unlock_irqrestore(&vpdma->lock, flags);
 
-- 
2.28.0

