Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085E632C7A3
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381134AbhCDAcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350228AbhCCTFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 14:05:09 -0500
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898DCC061756
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 11:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UlMoiVgb/fwb1dp9Hzc1d4Nl0vZkDRFUZwwX8YdFMeI=; b=BJWXNC783VC1gpZskShVqKHXk4
        1eYjE6Gajc4UjVe+OauCqBLZ+vnr7O5czVpRHbXPIRrIH8zYVkdQKIJCy9UY4hWnn+9MTHEBufU0T
        qtLgqFbJS1ytdd4XW6otRpEOygJPKQUdbkKp6RFHqynRwB7Cla6sIDMf97bh2EElwr7A=;
Received: from [2a02:587:6a0e:4300::d54]
        by devnull.tasossah.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <tasos@tasossah.com>)
        id 1lHWGV-0006js-1H; Wed, 03 Mar 2021 20:30:31 +0200
To:     linux-media@vger.kernel.org
Cc:     Tasos Sahanidis <tasos@tasossah.com>
From:   Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] media: saa7134: use sg_dma_len when building pgtable
Message-ID: <6fe62d6e-b366-16f9-faa5-990d284e9656@tasossah.com>
Date:   Wed, 3 Mar 2021 20:30:18 +0200
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
certain conditions, and because saa7134 accessed the length member
directly, it did not support this scenario.

This fixes IO_PAGE_FAULTs and choppy DMA audio by using the
sg_dma_len macro.

Fixes: be62dbf554c5 ("iommu/amd: Convert AMD iommu driver to the dma-iommu api")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 391572a6ec76..efb757d5168a 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -243,7 +243,7 @@ int saa7134_pgtable_build(struct pci_dev *pci, struct saa7134_pgtable *pt,
 
 	ptr = pt->cpu + startpage;
 	for (i = 0; i < length; i++, list = sg_next(list)) {
-		for (p = 0; p * 4096 < list->length; p++, ptr++)
+		for (p = 0; p * 4096 < sg_dma_len(list); p++, ptr++)
 			*ptr = cpu_to_le32(sg_dma_address(list) +
 						list->offset + p * 4096);
 	}
-- 
2.25.1
