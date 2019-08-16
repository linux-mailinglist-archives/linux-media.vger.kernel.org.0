Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA8638FA82
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 07:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfHPFyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 01:54:04 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:46200 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHPFyE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 01:54:04 -0400
Received: by mail-yw1-f65.google.com with SMTP id w10so1438066ywa.13;
        Thu, 15 Aug 2019 22:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UYipLE04l+hV469SmbY4XrY4oOZqtnVNPF3gQkQCll8=;
        b=iMqSP6pGnWAXHewOT3BbWgAvUi94n5G+ox/HqhKY6PF5taiLU3VDjV7Tu6VYI2ngj7
         B5DdnfxowmYupREgTLAevB+NAvIF21PcRM405wUysuglUm/ICVmvMhwLgaxyDBQjcMhJ
         i5M66NoLqSFram2SlhyJ0PfhSqVy9IpblbNZM/0nHIR5bdsOgix/s4HKk4/Xtt3Uljgq
         3dKLOgpo6a/3Q6qG8KDwibY7QlLYP7cx/LSn2UL8GdsbIX1rbZKg/BCWN+YMg6TLSrOY
         Xm9ztZHgGKVCDVXLsSKbwwOpfKMESl0SkSZnezjSQkK2ouQQtmNIDUXdRiN5syZxeiu4
         N15Q==
X-Gm-Message-State: APjAAAWgI+JQCXcU7jAb345+g61tauZZR2wsOg1OMAZYtCO7qOAENYFF
        BSy7M+nAjJJTu3lGTpHgLiw=
X-Google-Smtp-Source: APXvYqxZaUZtS4fZ2kSCQd9d68IuvZhzPXPZFzXz5Kmh9HdF9l//nCgqyB/I2s70nXogaGzkCJRxhg==
X-Received: by 2002:a81:1cc1:: with SMTP id c184mr5901885ywc.297.1565934843404;
        Thu, 15 Aug 2019 22:54:03 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id b64sm1052332ywe.43.2019.08.15.22.54.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 22:54:02 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        dri-devel@lists.freedesktop.org (open list:SYNC FILE FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dma-buf: fix a memory leak bug
Date:   Fri, 16 Aug 2019 00:53:57 -0500
Message-Id: <1565934837-6471-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In sync_file_merge(), 'fences' is firstly allocated through kcalloc().
Later on, if the size is not sufficient, krealloc() is invoked to
reallocate 'nfences', which is assigned to 'fences'. However, if krealloc()
fails, 'fences' is not deallocated, leading to a memory leak bug.

To fix the above issue, free 'fences' before go to the 'err' label.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/dma-buf/sync_file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index ee4d1a9..6e2b2d3 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -272,8 +272,10 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	if (num_fences > i) {
 		nfences = krealloc(fences, i * sizeof(*fences),
 				  GFP_KERNEL);
-		if (!nfences)
+		if (!nfences) {
+			kfree(fences);
 			goto err;
+		}
 
 		fences = nfences;
 	}
-- 
2.7.4

