Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA04149190
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbgAXXEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:04:31 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37898 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgAXXEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:04:31 -0500
Received: by mail-qk1-f195.google.com with SMTP id k6so3775221qki.5;
        Fri, 24 Jan 2020 15:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ubrJtKrXAfrxvZ08H06Ea3Xp2Ekj7ZN05GOIFs9kJRI=;
        b=myq2gH5xFk/8utUnTyRgrcte68aWmT6DcWDKlEX498UDnkZ+uM0/BjS1N+bf7BPLjw
         QK/qlMmgIUnOiM78LNCnBdppMLe3F3ttUnKWYkDNIlC//2YU6SOn3dnSE2wVVAGnKXBd
         GQ3SrcFsIjAPVs5C3BZtgNqiQoTz7pVvXzAiVbh/WFPswBgx3DVtJD1o5e9rgfoIWXUc
         GZs+zfXoHA5tDWg2SdDRpFvTsfkO8FepN6cgR7XhPYChhxbpSQbn4PuFvbBtxuwnW8uo
         sskngt+GjhzZKCGg7NCCBtM/xmzJKjis+BTFCsvFhPNUqoKQpcaNxeg/nwGG5ZPjp0Fy
         3wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ubrJtKrXAfrxvZ08H06Ea3Xp2Ekj7ZN05GOIFs9kJRI=;
        b=P5lCVLhUN/s5RyxkPfEk0ADt+8gbCgkoF1eF/BdcxHOcf//CqO3DVh4pgpN51xu9uR
         gXrRWAj1mcaQ2KPEowhCou+gKPSUSjMiFle1Oqy0n8pGsXLE2ntP3gUQM+w7r/emBkPn
         ZGVc8vMinYfZTKtyajiPgGfd7L663ta1t8tPu3G9uY58x8kugwXSkw2vATLF38ctM/VM
         5cSyKKf2FJtGRrOs3ZtfXExRaEq7AVVDR3HrfW0/RTOzFF8DX8QiVA/THfH3h5oVvMxt
         Dn9K7OdkLkeCzkarvZcBUQf5HJzBSZPmt8k5nDHli58rEUG7MkFr5O5t/Nn9xN350P9j
         B5tw==
X-Gm-Message-State: APjAAAU6MvRblysl+RZIs4iiA7Nd5t3vJXopT7EAwbGlWEpFqvFm6932
        ZN0aUvJXhTKLIUzsf6NJYwkM+XgWskI=
X-Google-Smtp-Source: APXvYqyUuBzzM1L18dGYumE+q+z0NgxDBVjZzTrZKhSobhk72S9Tl9UH0zbYQMEUSK3ZDXK4LbyI/w==
X-Received: by 2002:a37:905:: with SMTP id 5mr5038603qkj.404.1579907069533;
        Fri, 24 Jan 2020 15:04:29 -0800 (PST)
Received: from Bender ([216.197.220.143])
        by smtp.gmail.com with ESMTPSA id s20sm4075191qkg.131.2020.01.24.15.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 15:04:28 -0800 (PST)
Date:   Fri, 24 Jan 2020 17:04:26 -0600
From:   Jean-Baptiste Jouband <jj.jouband@gmail.com>
To:     sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: ipu3: Change 'unsigned long int' to
 'unsigned long'
Message-ID: <20200124230426.GA4528@Bender>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the checkpatch.pl warning:

WARNING: Prefer 'unsigned long' over 'unsigned long int' as the int is unnecessary

Signed-off-by: Jean-Baptiste Jouband <jj.jouband@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index 3d969b0522ab..5f3ff964f3e7 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -130,7 +130,7 @@ static u32 *imgu_mmu_alloc_page_table(u32 pteval)
 	for (pte = 0; pte < IPU3_PT_PTES; pte++)
 		pt[pte] = pteval;
 
-	set_memory_uc((unsigned long int)pt, IPU3_PT_ORDER);
+	set_memory_uc((unsigned long)pt, IPU3_PT_ORDER);
 
 	return pt;
 }
@@ -141,7 +141,7 @@ static u32 *imgu_mmu_alloc_page_table(u32 pteval)
  */
 static void imgu_mmu_free_page_table(u32 *pt)
 {
-	set_memory_wb((unsigned long int)pt, IPU3_PT_ORDER);
+	set_memory_wb((unsigned long)pt, IPU3_PT_ORDER);
 	free_page((unsigned long)pt);
 }
 
-- 
2.17.1

