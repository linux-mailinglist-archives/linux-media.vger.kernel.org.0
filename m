Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD2E2F8F6A
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 22:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbhAPVXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 16:23:33 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:60950 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAPVXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 16:23:31 -0500
Received: from localhost.localdomain ([92.131.99.25])
        by mwinf5d14 with ME
        id HZMm2400J0Ys01Y03ZMnqF; Sat, 16 Jan 2021 22:21:47 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Jan 2021 22:21:47 +0100
X-ME-IP: 92.131.99.25
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        vaibhavgupta40@gmail.com, tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: cx25821: Fix a bug when reallocating some dma memory
Date:   Sat, 16 Jan 2021 22:21:46 +0100
Message-Id: <20210116212146.555745-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function looks like a realloc.

However, if 'risc->cpu != NULL', the memory will be freed, but never
reallocated with the bigger 'size'.
Explicitly set 'risc->cpu' to NULL, so that the reallocation is
correctly performed a few lines below.

Fixes: 5ede94c70553 ("[media] cx25821: remove bogus btcx_risc dependency)
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Completly speculative and untested.
---
 drivers/media/pci/cx25821/cx25821-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 6f8ffab8840f..22e47dd74df4 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -976,8 +976,10 @@ int cx25821_riscmem_alloc(struct pci_dev *pci,
 	__le32 *cpu;
 	dma_addr_t dma = 0;
 
-	if (NULL != risc->cpu && risc->size < size)
+	if (NULL != risc->cpu && risc->size < size) {
 		pci_free_consistent(pci, risc->size, risc->cpu, risc->dma);
+		risc->cpu = NULL;
+	}
 	if (NULL == risc->cpu) {
 		cpu = pci_zalloc_consistent(pci, size, &dma);
 		if (NULL == cpu)
-- 
2.27.0

