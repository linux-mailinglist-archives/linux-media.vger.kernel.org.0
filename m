Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1190025B12E
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgIBQP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:15:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728273AbgIBQK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:56 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA50D21548;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=VKstAS5TMtenxpJXpzEKD/xHPc8x0PyHzvTyd/dAajI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KIJmLcONeHMe8ISzWaqErJcYQgpqR/EhQJg7T5LzEYOYAyoidk+2Mz4zRsx5chtpd
         9FJIkrhioeF9jtNXDrcpjVrCRiUOlfomOSToSTUYIrWhPHedtk9caZTMF2SB+K8I11
         xIWW513/t8pNLafhXRHf4YfGhZ7y6N4zs1Q0TAnc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAR-3Z; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Takashi Iwai <tiwai@suse.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/38] media: cx25821-alsa: number of pages should be unsigned long
Date:   Wed,  2 Sep 2020 18:10:20 +0200
Message-Id: <1294201cb66aad5c7646d662e3699aadeeaa215b.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by smatch:

	drivers/media/pci/cx25821/cx25821-alsa.c:146 cx25821_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?

the number of patches should be unsigned long.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/cx25821/cx25821-alsa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 301616426d8a..49892a88f528 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -53,8 +53,8 @@ struct cx25821_audio_buffer {
 	struct cx25821_riscmem risc;
 	void			*vaddr;
 	struct scatterlist	*sglist;
-	int                     sglen;
-	int                     nr_pages;
+	int			sglen;
+	unsigned long		nr_pages;
 };
 
 struct cx25821_audio_dev {
@@ -131,7 +131,8 @@ MODULE_PARM_DESC(debug, "enable debug messages");
 #define PCI_MSK_AUD_EXT   (1 <<  4)
 #define PCI_MSK_AUD_INT   (1 <<  3)
 
-static int cx25821_alsa_dma_init(struct cx25821_audio_dev *chip, int nr_pages)
+static int cx25821_alsa_dma_init(struct cx25821_audio_dev *chip,
+				 unsigned long nr_pages)
 {
 	struct cx25821_audio_buffer *buf = chip->buf;
 	struct page *pg;
@@ -139,11 +140,11 @@ static int cx25821_alsa_dma_init(struct cx25821_audio_dev *chip, int nr_pages)
 
 	buf->vaddr = vmalloc_32(nr_pages << PAGE_SHIFT);
 	if (NULL == buf->vaddr) {
-		dprintk(1, "vmalloc_32(%d pages) failed\n", nr_pages);
+		dprintk(1, "vmalloc_32(%lu pages) failed\n", nr_pages);
 		return -ENOMEM;
 	}
 
-	dprintk(1, "vmalloc is at addr 0x%p, size=%d\n",
+	dprintk(1, "vmalloc is at addr 0x%p, size=%lu\n",
 				buf->vaddr,
 				nr_pages << PAGE_SHIFT);
 
-- 
2.26.2

