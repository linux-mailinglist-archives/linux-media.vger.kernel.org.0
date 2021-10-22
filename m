Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3F843753D
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 12:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbhJVKJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 06:09:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51796 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbhJVKJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 06:09:06 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B711D2BA;
        Fri, 22 Oct 2021 12:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634897208;
        bh=vjGCE1iJEOP6vV6D0o3cwyBykC5jl0LSgHg7NnDh2WE=;
        h=From:To:Cc:Subject:Date:From;
        b=Y1wO203LGw6PjdKbkmzC6kZ5Cx/aNu38JaYV83xhlT2yHJOOWtG6KQnlmqNtHczdh
         Iy83GXud7alkNIXRnppNdcnQR/5ZH1rIcALoBM+Wazi2Yubp3302UkL4CjHOpLsZqd
         pSAo7FxwxIz3ASxJOI4TJo65dN5i9TzRVw9Cdn1E=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: tw5864: Disable PCI device when finished
Date:   Fri, 22 Oct 2021 11:06:44 +0100
Message-Id: <20211022100644.3447-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cleanup in tw5864_finidev() neglected to disable the PCI device
after enabling it in tw5864_initdev().

Call pci_disable_device() after releasing the associated resources.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/pci/tw5864/tw5864-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
index fee3b7711901..5cae73e6fb9c 100644
--- a/drivers/media/pci/tw5864/tw5864-core.c
+++ b/drivers/media/pci/tw5864/tw5864-core.c
@@ -334,6 +334,7 @@ static void tw5864_finidev(struct pci_dev *pci_dev)
 	/* release resources */
 	iounmap(dev->mmio);
 	pci_release_regions(pci_dev);
+	pci_disable_device(pci_dev);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
 }
-- 
2.30.2

