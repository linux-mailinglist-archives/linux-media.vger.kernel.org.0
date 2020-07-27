Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6EE22EDEE
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 15:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgG0Nvz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 09:51:55 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:34738 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbgG0Nvy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 09:51:54 -0400
Received: from localhost.localdomain ([93.23.198.229])
        by mwinf5d90 with ME
        id 8Drs230084xT3VZ03Drsf6; Mon, 27 Jul 2020 15:51:53 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 27 Jul 2020 15:51:53 +0200
X-ME-IP: 93.23.198.229
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] media: bt8xx: avoid a useless memset
Date:   Mon, 27 Jul 2020 15:51:51 +0200
Message-Id: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid a memset after a call to 'dma_alloc_coherent()'.
This is useless since
commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/pci/bt8xx/btcx-risc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index 13bb1490a568..b3179038b900 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
 		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
 			memcnt, (unsigned long)dma, cpu, size);
 	}
-	memset(risc->cpu,0,risc->size);
 	return 0;
 }
 
-- 
2.25.1

