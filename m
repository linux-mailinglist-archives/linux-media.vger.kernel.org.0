Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5ED181A4A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbgCKNwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:09 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45787 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729746AbgCKNwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id m9so2684649wro.12
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=flGhpt37sp9XD/VKJktequW1z/Op/EL2iIAVEZzSQBY=;
        b=oiScoyoPXcSLytkyJFtKR4RMXZnOUT43vPO6N1orKuuu8dPRVMLBJVk7aEKXvnNZy6
         6R4LyIBXhaLIPUbvls7Ix/3hJooN/+SVPeQ9W285fZX3GdvVYmPktv3rKvuzBV0HjC6i
         B+j8ze0EEgWt1wjvyy3mwyZ4kS0+yPcOGyq4jGWrnai/HUtrmCv8oBWcpcqFf7Kg4+a1
         hwOstEbOSSyJCV4Oa+UgABp4O+/h37vl7/EsFLeM66M6hpvW8ib6CKfEJ+bQvAxz/uEy
         uyvdk+xPLLIy1nnFcUU4jn/pdPDYj2/dllCAo4PQjw7pL/yTkzwroIUc2Ll13s5Qes15
         WKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=flGhpt37sp9XD/VKJktequW1z/Op/EL2iIAVEZzSQBY=;
        b=CJ7LCVbGOHMtZLt9yxbnLC5s7gZ2jap8b5ZsaFCwFUxWo4zN66eO2xBg5Doy9ROSKY
         42SRA1tmLfNzrku6b60+s62HUHXJq5fPdzKQMugbV2F021qgOoXpi5S/H/dDV6tCEM3q
         m4U2Rayc0rZdrNZsuWtIzOvVOsl2KCMDuIC1DpyARNaZKOa7i77BLS7ciyCR9hlYxWJV
         zUIfL3OEoFgvtkEfgn9xzEDq500N8ZUWnRtVQKi892Lc2FRo2FamSYg8weqYpDqwfuu2
         RhaCi1fL8z3Wt/tUXQ6uZCZ1dD15SzOFV+JUnyKH2fAsBsmTeaE0Vvu7t4ZSn0u8WNhI
         Ge+w==
X-Gm-Message-State: ANhLgQ1Bao9BSZEU+DDenT/UIcptdCjNgW5IJel7FPQmbfCP0ktDDF4N
        Z4zCU07hgy2ZgPeigXs6vV5CKTyM
X-Google-Smtp-Source: ADFU+vvgmw4fd1NqGTYZeiUuoJEPOPj4Kn4u889b6V+DZSy4sQjKVUikTia6D/Jj32pCHPGIgHy5mA==
X-Received: by 2002:adf:c449:: with SMTP id a9mr4615828wrg.366.1583934727345;
        Wed, 11 Mar 2020 06:52:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: improve amdgpu_gem_info debugfs file
Date:   Wed, 11 Mar 2020 14:51:58 +0100
Message-Id: <20200311135158.3310-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Note if a buffer was imported using peer2peer.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 4277125a79ee..e42608115c99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/pagemap.h>
 #include <linux/pci.h>
+#include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_debugfs.h>
@@ -854,7 +855,8 @@ static int amdgpu_debugfs_gem_bo_info(int id, void *ptr, void *data)
 	attachment = READ_ONCE(bo->tbo.base.import_attach);
 
 	if (attachment)
-		seq_printf(m, " imported from %p", dma_buf);
+		seq_printf(m, " imported from %p%s", dma_buf,
+			   attachment->peer2peer ? " P2P" : "");
 	else if (dma_buf)
 		seq_printf(m, " exported as %p", dma_buf);
 
-- 
2.17.1

