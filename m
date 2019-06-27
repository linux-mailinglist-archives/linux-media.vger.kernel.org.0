Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8A2588B3
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 19:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfF0Rib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 13:38:31 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35984 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfF0Ria (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 13:38:30 -0400
Received: by mail-pf1-f194.google.com with SMTP id r7so1589790pfl.3;
        Thu, 27 Jun 2019 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yev4G8QYtR6xlxZYkVv8sTq1fmbwwbv1DCYef139PiQ=;
        b=eJppl8B1R1xZZ6TEQjHPGSUxatEedxllDN1UjG6nUpgzBRe3Edg5LZ69Y1GqPBW8sZ
         n7+tsp8uu3XPCah3GiHvU8RcTgubuGztG5wX47+CLjKdwSLrBfEFbJ7guTLNYVQ4iYiA
         6cZqDeqLsv8WcVwVOMiGJey/35MYnSiibl15acxmio6jP0OpXo6aEPb9x5qYq2Px6fPj
         rQXpm0TOm9a0ai9sYpmYCLka2PkptAF96yDHLhXw7sqptPeOE8HTkCx8Cm0J2/1ouDs6
         b6gZBaE/bePXZhGCJGARlFNXzgt2+ocx2vFjvY7gWz88OL/4xN0T4Kt657pEipE8Dg0k
         Kj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yev4G8QYtR6xlxZYkVv8sTq1fmbwwbv1DCYef139PiQ=;
        b=AgcyRTHd0xxO0nsfrTzXZLN3GUBa/Lhu3du5Xim35YhesUI8GXBCRjMTZDrPGlpt4C
         BAzwUYcg5Q+MyvER5CQjtJFwMYxWCBqYyVqw/HNHvCYYrBmxGpkVOMcl7+4oI6Dff0mw
         fqRtDvX5rKVv7nUpzY7pQ4vFvp6iQAZypZRVN11RNFmUfht2b0ZN9Fk6ORylMK/LS6+v
         ChxOdSWD+cs7sYh7JNUgeo/CFN42jVtkfL5B+fAV6wQlZzlfCQGZsD99+BFNIIWjsWgw
         oaAtsjSemmKxtAfRbK/Cs1dyUp7cSqtfe28kM/vjtRonehad8xY6tdRKFMyVfgdjnAaH
         NzTw==
X-Gm-Message-State: APjAAAW2KQ5pEgpxuw3IIg3fh0oBNgaKcfsRKMBNkxc8rxMIBsxnPBQL
        U/1LWiyRrVyMhSKxPhlbnjI=
X-Google-Smtp-Source: APXvYqwQtnKKqodT4oW2uR4nn8udbJk+Gya7Cyu2ygsgry08a/7LN/05AB2Vp7t3sqOMw02ElFr/+Q==
X-Received: by 2002:a17:90a:bb01:: with SMTP id u1mr7275202pjr.92.1561657109939;
        Thu, 27 Jun 2019 10:38:29 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id n19sm7878021pfa.11.2019.06.27.10.38.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 10:38:29 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 30/87] pci: ngene: remove memset after pci_alloc_consistent in ngene-core.c
Date:   Fri, 28 Jun 2019 01:38:22 +0800
Message-Id: <20190627173823.3413-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pci_alloc_consistent calls dma_alloc_coherent directly.
In commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
dma_alloc_coherent has already zeroed the memory.
So memset is not needed.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/pci/ngene/ngene-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
index b75ab7d29226..af15ca1c501b 100644
--- a/drivers/media/pci/ngene/ngene-core.c
+++ b/drivers/media/pci/ngene/ngene-core.c
@@ -854,8 +854,6 @@ static int create_ring_buffer(struct pci_dev *pci_dev,
 	if (!Head)
 		return -ENOMEM;
 
-	memset(Head, 0, MemSize);
-
 	PARingBufferCur = PARingBufferHead;
 	Cur = Head;
 
@@ -907,8 +905,6 @@ static int AllocateRingBuffers(struct pci_dev *pci_dev,
 	if (SCListMem == NULL)
 		return -ENOMEM;
 
-	memset(SCListMem, 0, SCListMemSize);
-
 	pRingBuffer->SCListMem = SCListMem;
 	pRingBuffer->PASCListMem = PASCListMem;
 	pRingBuffer->SCListMemSize = SCListMemSize;
-- 
2.11.0

