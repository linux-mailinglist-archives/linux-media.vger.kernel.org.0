Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC8532C79E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355656AbhCDAcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838741AbhCCTBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 14:01:45 -0500
X-Greylist: delayed 1349 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 03 Mar 2021 10:53:10 PST
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D9BC06175F
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 10:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AwCGWZ8aC+Ri0jKIqZjuo5FCnBS99NZn6Q3M+g694Bc=; b=kGtPNGVjCkwfSz6bnL4zPZUSSr
        K6STyWmB82yrAg9qC5KRWIUcRhqCOZwpNGRqKMvZRisJqLQors2QSF7SJlofUJiSpgmCD4G2L/IAW
        6c2gfQdbo0M3c/CHhm/g5ZH2LxhmZLAOHuv8WjGbrtDDeDf3UXXNfkkKrgFXhvLJlUnk=;
Received: from [2a02:587:6a0e:4300::d54]
        by devnull.tasossah.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <tasos@tasossah.com>)
        id 1lHWcM-0007ng-0g; Wed, 03 Mar 2021 20:53:06 +0200
To:     linux-media@vger.kernel.org
Cc:     Tasos Sahanidis <tasos@tasossah.com>
From:   Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] media: saa7146: use sg_dma_len when building pgtable
Message-ID: <7cb84acf-1bb5-9440-a97a-4c3e69d75760@tasossah.com>
Date:   Wed, 3 Mar 2021 20:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new AMD IOMMU DMA implementation concatenates sglist entries under
certain conditions, and because saa7146 accessed the length member
directly, it did not support this scenario.

This fixes IO_PAGE_FAULTs by using the sg_dma_len macro.

Fixes: be62dbf554c5 ("iommu/amd: Convert AMD iommu driver to the dma-iommu api")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/media/common/saa7146/saa7146_core.c  | 2 +-
 drivers/media/common/saa7146/saa7146_video.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index f2d13b71416c..e50fa0ff7c5d 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -253,7 +253,7 @@ int saa7146_pgtable_build_single(struct pci_dev *pci, struct saa7146_pgtable *pt
 			 i, sg_dma_address(list), sg_dma_len(list),
 			 list->offset);
 */
-		for (p = 0; p * 4096 < list->length; p++, ptr++) {
+		for (p = 0; p * 4096 < sg_dma_len(list); p++, ptr++) {
 			*ptr = cpu_to_le32(sg_dma_address(list) + p * 4096);
 			nr_pages++;
 		}
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 7b8795eca589..66215d9106a4 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -247,9 +247,8 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 
 		/* walk all pages, copy all page addresses to ptr1 */
 		for (i = 0; i < length; i++, list++) {
-			for (p = 0; p * 4096 < list->length; p++, ptr1++) {
+			for (p = 0; p * 4096 < sg_dma_len(list); p++, ptr1++)
 				*ptr1 = cpu_to_le32(sg_dma_address(list) - list->offset);
-			}
 		}
 /*
 		ptr1 = pt1->cpu;
-- 
2.25.1
