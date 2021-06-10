Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FFF3A2742
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 10:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFJIlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 04:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhFJIlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 04:41:10 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D0FC061574;
        Thu, 10 Jun 2021 01:39:02 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id k15so1017355pfp.6;
        Thu, 10 Jun 2021 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJ/3CFAnf66IztVHiUM7TufpmRTGEjurhGpIG8tXI+Y=;
        b=Iv1M0+0ZgB3znr5ObdOouR26sYGG2l5dZR8cEVa2+73+qox7uhCjGFZ3FzKcLwuvPL
         aMIOdAWfyE/mL6Mkg3EDnuzzjgtmV1GPHD+WVyeto6erbg3E2Fq7jYa4UU/ftk+0EftF
         y5NYzp/+Bx/EWqaj3Qmtqr9HGM2pd3IIjfd9c37ISkIk/UHyqkp8JxgLzMc2toMHc69E
         yGXWIz+TiIyDnLZaV+pc3PhIBHRoVommuW0GhzBxKhTWL8OosFKjb5wUI3aggmvnQnLP
         kOU+wXlCa/w0/Uc75np950p8MPvIr5hZL9oSnPvYb39NWbVh+NhhSJP56JO+VNbD/uxr
         /6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJ/3CFAnf66IztVHiUM7TufpmRTGEjurhGpIG8tXI+Y=;
        b=LnsaO7feHWsaojx3yZpePR7x0gEjGxNaJY0ZCXFh+WPR6fDesIiKMGyrktk0fsqR3T
         YY8fdR0NeL8xZoORW68BaTOpRiBFwC5ZtBxXWhmmpooicjQuupenNjlppDHCGWwq7A2n
         +5DQUttIU84QjR6y8lg8fv3V3aqcVBd1ydtrq1BpYKqKzyy9TAdvSeMcepn9p3Nn8aF1
         qaJ1KyWcHxIYKTlJW6hKeT6Q0OSxxyN4B8XjcP7zKtmXmFg5BXH+Ym/dtcyr0NKe9Fw7
         NjOevfd1bzpZ+1SY9/YOlpiuteLTIsBgdQXrGZM5kVb/fgYoOQBDXH2Twal6Z5RM/mM8
         c5bA==
X-Gm-Message-State: AOAM5301RJnD8lmARrH2twe1nnPT1vflPAkIipIvtZ0eJmk2gf6K1G4/
        +DrrZRQ7ceiwOYRbNWUPhJ4=
X-Google-Smtp-Source: ABdhPJxisGBg9wUaVxIHBSCE3H/+sFPWN3xx8GxPeSpiv8XfGX4TLIpxtCvd3JJ6lVQ6xorJ1kFD3g==
X-Received: by 2002:a05:6a00:23c2:b029:2f1:b41b:21ca with SMTP id g2-20020a056a0023c2b02902f1b41b21camr1926499pfc.13.1623314341961;
        Thu, 10 Jun 2021 01:39:01 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id n11sm1728436pfu.29.2021.06.10.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 01:39:01 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/platform/davinci/vpfe_capture.c : fix typo Proabably > Probably
Date:   Thu, 10 Jun 2021 16:38:15 +0800
Message-Id: <20210610083815.13681-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change 'Proabably' into 'Probably'.

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/platform/davinci/vpfe_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index f9f7dd17c57c..0a2226b321d7 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -189,7 +189,7 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
 	if (!ccdc_cfg) {
 		/*
 		 * TODO. Will this ever happen? if so, we need to fix it.
-		 * Proabably we need to add the request to a linked list and
+		 * Probably we need to add the request to a linked list and
 		 * walk through it during vpfe probe
 		 */
 		printk(KERN_ERR "vpfe capture not initialized\n");
-- 
2.25.1

