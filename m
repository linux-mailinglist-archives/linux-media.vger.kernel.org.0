Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929941ADA7A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 11:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgDQJx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 05:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgDQJx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 05:53:27 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A41C061A0C;
        Fri, 17 Apr 2020 02:53:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d27so2370298wra.1;
        Fri, 17 Apr 2020 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0r2saJqXCfbhTP4YNp7fFMKDxQ438fDLZI9Z34Ilq2U=;
        b=Yv4uMmyFS1AYBuxY/wPWl66psY1uTtQ7PBpwTlyzjel3ZPwyDVjyc1NoeeBP8oQ/jv
         CncMDCwILuVwicSD5AYrodqwmkfHZWpqWPZYokMGslXNhoH2Xr0Ze0sa3LAYy57ySflt
         gNE2Z8kkJljaxfdrNcQyBC7ei5lFNwWTY7F1LZy8F94s2imxbsrHBHbLVMzkb1gtjBQn
         pYH5ZXp9buYabMAPZ6ATlxlbGf+EyfWc5i2JcuE+gbb/LUzydte2J9Br4GdUELbMtJG0
         /u2qnX+DsKf71yzgoGSXfJIUoM86trgM4nSlly6e6pWH5TDUbZx229x0g4JeWx1gPebK
         DWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0r2saJqXCfbhTP4YNp7fFMKDxQ438fDLZI9Z34Ilq2U=;
        b=ADtRTstjEgnQ/NAw8Ue90VL7VqgOGrBgRZHDzR07+O4xzEY20Q2vrbUiy1RbwTTo1u
         iXInL+fVZYI3mLLvXlKkremplpSXKochAyrrtRPMZnVtPNEtQX/lXZrG7kVGCuhhTLr3
         vhqM+p1bTYPgnz8Ime1DkNRUxNHiFy27xgH65WpjCJR4G/kS/+U37afwVSwKkC2KvZL1
         VebM19F3SC5uTThOcyQGlOhJ4mc5ees06nOVcH05H74epIazPbsK39r1EOyPAyGjdM+l
         T10lKiTRbdd+FxvGAzwM0c7eR2MfWzNf1va5JOR7ugOeapwQtXTkmj0ljU6cCXoahrX6
         SjcA==
X-Gm-Message-State: AGi0PuYnLzsEamnq15G/siUJB8PeuWzSRU4EoYn8GkCEuO0jZRbrIn66
        Rr+Xbe1Yq+x0vSeCOJ9jXJ0=
X-Google-Smtp-Source: APiQypLHJppZWXPZsbK6/NbMCBEVGzrs11Z8FU9Sx8T3ots1IO8WI4JCddoNVpuvhl8EGAJK82CHuQ==
X-Received: by 2002:a5d:4283:: with SMTP id k3mr2852343wrq.238.1587117205930;
        Fri, 17 Apr 2020 02:53:25 -0700 (PDT)
Received: from localhost.localdomain (185.239.71.98.16clouds.com. [185.239.71.98])
        by smtp.gmail.com with ESMTPSA id g69sm1491441wmg.17.2020.04.17.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 02:53:25 -0700 (PDT)
From:   Xiaolong Huang <butterflyhuangxx@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, tglx@linutronix.de,
        mpe@ellerman.id.au, allison@lohutok.net
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaolong Huang <butterflyhuangxx@gmail.com>
Subject: [PATCH] media: media/pci: prevent memory leak in bttv_probe
Date:   Fri, 17 Apr 2020 17:52:30 +0800
Message-Id: <20200417095230.11708-1-butterflyhuangxx@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In bttv_probe if some functions such as pci_enable_device,
pci_set_dma_mask and request_mem_region fails the allocated
 memory for btv should be released.

Signed-off-by: Xiaolong Huang <butterflyhuangxx@gmail.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9144f795fb93..b721720f9845 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -4013,11 +4013,13 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btv->id  = dev->device;
 	if (pci_enable_device(dev)) {
 		pr_warn("%d: Can't enable device\n", btv->c.nr);
-		return -EIO;
+		result = -EIO;
+		goto free_mem;
 	}
 	if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
 		pr_warn("%d: No suitable DMA available\n", btv->c.nr);
-		return -EIO;
+		result = -EIO;
+		goto free_mem;
 	}
 	if (!request_mem_region(pci_resource_start(dev,0),
 				pci_resource_len(dev,0),
@@ -4025,7 +4027,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 		pr_warn("%d: can't request iomem (0x%llx)\n",
 			btv->c.nr,
 			(unsigned long long)pci_resource_start(dev, 0));
-		return -EBUSY;
+		result = -EBUSY;
+		goto free_mem;
 	}
 	pci_set_master(dev);
 	pci_set_command(dev);
@@ -4211,6 +4214,10 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	release_mem_region(pci_resource_start(btv->c.pci,0),
 			   pci_resource_len(btv->c.pci,0));
 	pci_disable_device(btv->c.pci);
+
+free_mem:
+	bttvs[btv->c.nr] = NULL;
+	kfree(btv);
 	return result;
 }
 
-- 
2.17.1

