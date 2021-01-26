Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDDC305A46
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 12:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314086AbhAZW41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbhAZWZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 17:25:16 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C045C06174A
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 14:24:35 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id n7so5282oic.11
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 14:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ohOHGKULZ8e6c5l4O4JpvoXWXbdcQoRiPfyQ9dshYo=;
        b=m+PTUoDlfCt8R8R89ycoOt4KMDzCFjNp/hizWmJ8DBgwY1eDy+FqJKXrjLonZWzfxC
         bhETcjkdXiQ1nixca+DX0L1EGYxF7oSyLtI0L7Y/chHhud7vouvwOqbZCPl0fw+Ogm3o
         Y7sZ+6kz4O3yBNtES265/JwWOCxRb61YVEydHLu+9zUuAuGNoanqQ9uzMQGYH39KbYAK
         579hctzmPzA6qwTs+/8GKvD6Pe9g4lImXGmnnKcxbC9f2goQoQ8VfrnmqiczpPi69XGw
         PBoeRFyeHv+mPUG4wst98mZ/nKS579Nss1vl3+NVpRvhVipqeVMPtlwX/Mx5ZDCxJ1ky
         ETTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ohOHGKULZ8e6c5l4O4JpvoXWXbdcQoRiPfyQ9dshYo=;
        b=FAtXutuJrCmoNA/bS3GnRdiTTrLrIP9vS+9zveLpQV2qAaY3eOllCUeAAF7awnOqy4
         NEoSui3qqWyEW6GG0PXxHM/yfcU/MY0YQrWdQ6iWNj50+cSz+9UXLdDODwbfVRDtuQAF
         aEPANHt0C/+EWnn7HEW+89GBEQRn0GaYfgfZ96WCybq0dtdUAKH0hk6/sV2iDDU6T4Sz
         KZg3uglYO9wWzGnEK6GbfBuCiBXAdeyTN/GKE2ovm/HUBTF056fead2FxS9sFgtfo4KJ
         y8VP3AoQbugNzSuULHBVMNdrWak325EiqdNCGL5/Y4Cah6prZ6Dj8xYvHkiTESk934id
         vj7g==
X-Gm-Message-State: AOAM531kwkTFbgGKN8lA6N95XMbcqwHVtjvKurD+kbcGlAXOUtIUrf/P
        ULupWYU1USE7ix1+pZW8bfz4EwWRSyseMOJp
X-Google-Smtp-Source: ABdhPJyoV15qJkbe8yYftcAVZLplVzohtf3/bBTmUZVPjEKaoM/iR23LD35HRtN3/E7BDBYNHb95ig==
X-Received: by 2002:aca:d481:: with SMTP id l123mr1167132oig.155.1611699874253;
        Tue, 26 Jan 2021 14:24:34 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id l12sm59732ooq.22.2021.01.26.14.24.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 14:24:33 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4al.nl
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH] cx23885: add more quirks for reset DMA on some AMD IOMMU
Date:   Mon, 25 Jan 2021 22:52:05 -0600
Message-Id: <20210126045206.19517-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The folowing AMD IOMMU are affected by the RiSC engine stall, requiring a
reset to maintain continual operation. After being added to the
broken_dev_id list the systems are functional long term.

0x1481 is the PCI ID for the IOMMU found on Starship/Matisse

0x1419 is the PCI ID for the IOMMU found on 15h (Models 10h-1fh) family

0x5a23 is the PCI ID for the IOMMU found on RD890S/RD990

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/pci/cx23885/cx23885-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 22f55a7840a6..d0ca260ecf70 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2077,6 +2077,15 @@ static struct {
 	 * 0x1423 is the PCI ID for the IOMMU found on Kaveri
 	 */
 	{ PCI_VENDOR_ID_AMD, 0x1423 },
+	/* 0x1481 is the PCI ID for the IOMMU found on Starship/Matisse
+	 */
+	{ PCI_VENDOR_ID_AMD, 0x1481 },
+	/* 0x1419 is the PCI ID for the IOMMU found on 15h (Models 10h-1fh) family
+	 */
+	{ PCI_VENDOR_ID_AMD, 0x1419 },
+	/* 0x5a23 is the PCI ID for the IOMMU found on RD890S/RD990
+	 */
+	{ PCI_VENDOR_ID_ATI, 0x5a23 },
 };
 
 static bool cx23885_does_need_dma_reset(void)
-- 
2.28.0

