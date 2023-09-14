Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5B77A0669
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 15:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239148AbjINNvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 09:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239088AbjINNvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 09:51:11 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC58A1BE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 06:51:06 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-501bd164fbfso1684734e87.0
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anddroptable-net.20230601.gappssmtp.com; s=20230601; t=1694699465; x=1695304265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WTE8M48lswjiIBbCnB9meCfmG6FI9V0LOi+aUY5QAo=;
        b=oErlRTIThCGRIdm3a7/8YGZgz4InZFqJ1o4ukXfaG+H4h6089bR1wH1QZne7G66AZZ
         BFqFQ6N6zOgFxJJONKVOcpqoanVHguXuWZnfn9d9WnS6bA/HAFMfLLRXNFCSXQ8JhqQj
         CBDE5/fN4dVNR1DWF56lwk7/S9Oim7Azc8BuRpI40NeXh2czncFFjNmf0H46ka3DHAPG
         YtEzH/2WCmNK1PLT6iVoyEICT5AO0WiSTsDeUNOoEgJEv2/REi1p4cs7yxrRpsCcnxXH
         uUfji2j1O6+F5UX78CPYHxvdpHv21aaoRkF+JVijcTDtKbZ9PGhfQj5iJoMJVGgyAJtZ
         zWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694699465; x=1695304265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WTE8M48lswjiIBbCnB9meCfmG6FI9V0LOi+aUY5QAo=;
        b=Cx+by5gxwoK0CObgcWo6/hRPXu/7LMmcAvkeeY6zUzY4VasT49O3Y0unBwMtqwzKUv
         qTH74AZABemYH4az4onwHaOr/GQl+rrR5Wef9N+gAculeEeFm6mPcpoa3Epvs1ui8EgK
         hBnB+ae+y4xI1yd6Q2yfe4pl1knCieIIp0MLpXY2L4Jyy4Th8H9gjyCs/71Kc4Jui47K
         q095CLJ5kT8yGo4cA+yvkIbtqAG6cy2JMOnf//U8m0dliOrGgZrDLd5hiADJIXVNDp3H
         ZkNz+t6uhkg4akzotmHs9SlzMiFpU6s0v9MWNmZ4DAXzEKeUWPIkGbSkXmk7p1uR1F5o
         EWiA==
X-Gm-Message-State: AOJu0Yx/MT6vP2foyWikF0q9GNJqeZZ0j9TNgCS+Ky9hGzA2W1JaaE1k
        U0AL0cQHiCh4GNXiV2w3SDR6WgrhP+s6xSqUQE1kXw==
X-Google-Smtp-Source: AGHT+IGYN1sdqadoQfW1ejEFyH9iL8TfJEIiHTQOcgVsB76pLZWZ1Tonml7nwfTggtxD+RTq51mLCA==
X-Received: by 2002:ac2:5490:0:b0:500:c348:7efb with SMTP id t16-20020ac25490000000b00500c3487efbmr4394236lfk.48.1694699464788;
        Thu, 14 Sep 2023 06:51:04 -0700 (PDT)
Received: from congrafica.blancco.com ([193.64.185.110])
        by smtp.gmail.com with ESMTPSA id g25-20020ac25399000000b004fe4a1f046asm283871lfh.266.2023.09.14.06.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 06:51:04 -0700 (PDT)
From:   =?UTF-8?q?V=C3=ADctor=20Gonzalo?= <victor.gonzalo@anddroptable.net>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?V=C3=ADctor=20Gonzalo?= <victor.gonzalo@anddroptable.net>
Subject: [PATCH] media: ipu3: Use MODULE_FIRMWARE to add firmware files metadata
Date:   Thu, 14 Sep 2023 16:51:00 +0300
Message-Id: <20230914135100.19911-1-victor.gonzalo@anddroptable.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ipu3 driver requests firmware files but does not use the
MODULE_FIRMWARE macro to show them in the module metadata

Signed-off-by: Víctor Gonzalo <victor.gonzalo@anddroptable.net>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 0c453b37f8c4..10b4407b734c 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 
 #include "ipu3.h"
+#include "ipu3-css-fw.h"
 #include "ipu3-dmamap.h"
 #include "ipu3-mmu.h"
 
@@ -866,3 +867,5 @@ MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel ipu3_imgu PCI driver");
+MODULE_FIRMWARE(IMGU_FW_NAME);
+MODULE_FIRMWARE(IMGU_FW_NAME_20161208);
-- 
2.34.1

