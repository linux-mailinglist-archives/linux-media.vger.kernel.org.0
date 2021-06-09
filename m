Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137A83A0A6A
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 05:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhFIDEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 23:04:37 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:34317 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbhFIDEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 23:04:36 -0400
Received: by mail-pf1-f179.google.com with SMTP id g6so17306704pfq.1;
        Tue, 08 Jun 2021 20:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggPiWNjLnMl9vp+wrpys4LjL7SR3Vo8fg/uGEatzS3g=;
        b=PiBQOtOin8f7gWkcQvhCm1Gx5DAwi0uUA2Q+eZeAlHWeoCH/1luLccKwoiEQDX4n5C
         XBQSstfSfgMAxWutUY0tUc5sFe1fUqn0pxMr3gHtnLLE2Mc1SrqqNDCSQ78BU/7DfISs
         9BllQdJkwURzVMmyMSxZWlYGBwWKJ4vfQtqIWomcdmnOikmkpO4kfZ5uwXXQXLo1ekST
         1ZmSCx6n4dchr6P0qkqjMJ+b4tExUWwIkAyiP6Ir7GCUJMbMT2oLkhk/YBBihlpSFv2Q
         hEoySn6qtMFnwPYzT4Akzx9661nhZv745y2TGrqj7N5EnD1xeOInlVjvIuvWRlwku+ze
         XhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggPiWNjLnMl9vp+wrpys4LjL7SR3Vo8fg/uGEatzS3g=;
        b=ARQCXaoDHHUdTso6jmvPHxYZ2qwlgJ20DDhlLIXRKK3kv3q6iSnKN0MkSkLGJaRYDE
         RfmOWxhwZEzhqPUEkbPiatLg02uDcnNJssd8o+e1jOy9xWa9GJyX2RMfYBzEqFf6yr7/
         fRXbk+hi6fx0I24Hv1ZTAyWexptJh2q4K2qbfuUz3vuqEH7h51kPbKkbDF3nI/sVL5AD
         zyIaF75m1LM3dXxYQh313VjvaAvR0zHpPOxJ+A2Rynbuwr5tZN5OwrPXtnpUgq1mLDek
         zOODNLYwKNETenBQc4obZcHjQzDHzVJ2h8d9w13RipsEuXfPDkVLF7tAAwYXAm1Pb4JZ
         xXBg==
X-Gm-Message-State: AOAM532YHNd9PUNAgpNDFki1B2gmtrwt6QuL1IGYvyjdxdDt2BzRV+te
        D/b0In73JKSePN0SmvaJ1lc=
X-Google-Smtp-Source: ABdhPJy4yOaQlOXn05qu80u3ApZ9J/yD4tS1sAozQkqup49kcMjUhOwWdl/Ts+jddLRxHibIjLiJyA==
X-Received: by 2002:a63:1349:: with SMTP id 9mr1499736pgt.235.1623207689924;
        Tue, 08 Jun 2021 20:01:29 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id f18sm5122910pfv.79.2021.06.08.20.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 20:01:29 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        maintainers@bluecherrydvr.com, anton@corp.bluecherry.net,
        andrey.utkin@corp.bluecherry.net, Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/pci/tw5864/Tw5864-reg.h: fix typo issues
Date:   Wed,  9 Jun 2021 11:00:31 +0800
Message-Id: <20210609030031.1574-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

change 'syncrous' into 'synchronous'

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/pci/tw5864/tw5864-reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw5864/tw5864-reg.h b/drivers/media/pci/tw5864/tw5864-reg.h
index a74f30f2f78e..970e6fc01537 100644
--- a/drivers/media/pci/tw5864/tw5864-reg.h
+++ b/drivers/media/pci/tw5864/tw5864-reg.h
@@ -663,7 +663,7 @@
 #define TW5864_SYNC 0x8008
 /* Define controls in register TW5864_SYNC */
 /*
- * 0 vlc stream to syncrous port
+ * 0 vlc stream to synchronous port
  * 1 vlc stream to ddr buffers
  */
 #define TW5864_SYNC_CFG BIT(7)
-- 
2.25.1

