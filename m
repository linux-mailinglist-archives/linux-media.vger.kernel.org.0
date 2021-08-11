Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F883E9708
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 19:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhHKRvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 13:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhHKRvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 13:51:21 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0FAC061765;
        Wed, 11 Aug 2021 10:50:57 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id m17so2187211ljp.7;
        Wed, 11 Aug 2021 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WzsnUxBYIc+bSZUtA3NKiDP+0ZwVyawbHIDa/FfGc4Y=;
        b=Z98w6Murfk1StGoEFJCxePVLAOuOt1g1EmB1/Vb7kolrquRDRjbCvwlsGVHgf0/s6R
         6Gi1582QeZGW5yn4B89EGNMtVaADen/DMnYolZ8DU4/JEuU7EJG7skg+Gh1KOv7ca7aT
         IuGOcO53necv70sOTZbxVWkH1lb1NMKAAx3GStoRV7NQVC/ECn3ANBhpzVMBYz8liMMi
         C++Jg2VJOFum8AoP3ryOAk9oH5PW8Yi5LnDkGpbgG82yPzsAiACedneLPUSYNdtp45WW
         AlDPBjttamudHhH3+D+gXlvS+WcTS+Tfv3yq+9yyxsrlai0ulfcQYqu7ok4DenjDTz4b
         yThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WzsnUxBYIc+bSZUtA3NKiDP+0ZwVyawbHIDa/FfGc4Y=;
        b=TaBo2mep0SGWpOMIrOUpplmSoqvYSI7Lhenk8yMKjLxOVlw7NlNEpuY8ecNMYJvrll
         ri0K8NZWsOaNvhat355/jbZCrxOSxnZ1WMwbxTJk85QuUJCCCQBrPhWGn46RqEOmE1Ca
         JRBk29qICrYOYG6M5If1YRItjlr9djbdnBwOrxV9s2kydtmY6jbkrmENt2c+8L4otNGX
         j5U95Ka4slqDNmRpvObtwpgCZjTRa7mh+5K5f8MQsYEu0juQVKuAmUC3OouC+FeIl95L
         qwrxHTrjw2Ut9j0MMPmiWe3aU9GaBS9OkI5K5BkWyp69B0tlg7+bFWJqpJbKkICcoOJ2
         PfpQ==
X-Gm-Message-State: AOAM533rGvGyC4wEzPUEk32DQ4dmxJb7RxzIfz9+qfcdDIESkyCsSGYG
        U8gs7s5zIPF3PIr38HrjWr4=
X-Google-Smtp-Source: ABdhPJzEyaU97ApUL46N7106t7ETiGvrl5AX89dDJP4GxSN4vbomMZnLX8IRmHcAPlg3m9k57d7mtw==
X-Received: by 2002:a05:651c:2043:: with SMTP id t3mr17204244ljo.499.1628704255038;
        Wed, 11 Aug 2021 10:50:55 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.232])
        by smtp.gmail.com with ESMTPSA id h10sm1619lfc.49.2021.08.11.10.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 10:50:54 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     kraxel@redhat.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dongwon.kim@intel.com
Cc:     linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com
Subject: [PATCH next] udmabuf: fix general protection fault in udmabuf_create
Date:   Wed, 11 Aug 2021 20:50:52 +0300
Message-Id: <20210811175052.21254-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported general protection fault in udmabuf_create. The problem
was in wrong error handling.

In commit 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
shmem_read_mapping_page() call was replaced with find_get_page_flags(),
but find_get_page_flags() returns NULL on failure instead PTR_ERR().

Wrong error checking was causing GPF in get_page(), since passed page
was equal to NULL. Fix it by changing if (IS_ER(!hpage)) to if (!hpage)

Reported-by: syzbot+e9cd3122a37c5d6c51e8@syzkaller.appspotmail.com
Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8df761a10251..c57a609db75b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -227,8 +227,8 @@ static long udmabuf_create(struct miscdevice *device,
 				if (!hpage) {
 					hpage = find_get_page_flags(mapping, pgoff,
 								    FGP_ACCESSED);
-					if (IS_ERR(hpage)) {
-						ret = PTR_ERR(hpage);
+					if (!hpage) {
+						ret = -EINVAL;
 						goto err;
 					}
 				}
-- 
2.32.0

