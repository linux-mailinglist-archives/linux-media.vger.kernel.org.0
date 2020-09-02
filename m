Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2732325B0D0
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgIBQLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:11:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728261AbgIBQKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:52 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E524B21532;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=jLwPewIQn+pgFUopzBjLSNLeLllS2zvZWT+HqHEkCss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mfGsMbIFHQAtssLyUM73TwAZkAt+2AAhZnlAsVA0zni6U3JNgnIdJRkMEb6bziIrR
         oF6+7psEzCsO8jJDQG4mZM5t8RKmSqk380rORMbIeuv+TkiN0XD6Ew56MyX5C/EjSI
         aLle/FcBysGu2c9nmQCpppgffNzQqbkndQ+F0lDc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAW-57; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Takashi Iwai <tiwai@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/38] media: cx88-alsa: number of pages should be unsigned long
Date:   Wed,  2 Sep 2020 18:10:22 +0200
Message-Id: <0f391afa1692b65fa61f795e192fcef43e1779ba.1599062230.git.mchehab+huawei@kernel.org>
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

	drivers/media/pci/cx88/cx88-alsa.c:286 cx88_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?

the number of patches should be unsigned long.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/cx88/cx88-alsa.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 7d7aceecc985..aec60ebb010f 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -42,12 +42,12 @@
  */
 
 struct cx88_audio_buffer {
-	unsigned int               bpl;
-	struct cx88_riscmem        risc;
+	unsigned int		bpl;
+	struct cx88_riscmem	risc;
 	void			*vaddr;
 	struct scatterlist	*sglist;
 	int                     sglen;
-	int                     nr_pages;
+	unsigned long		nr_pages;
 };
 
 struct cx88_audio_dev {
@@ -271,7 +271,8 @@ static irqreturn_t cx8801_irq(int irq, void *dev_id)
 	return IRQ_RETVAL(handled);
 }
 
-static int cx88_alsa_dma_init(struct cx88_audio_dev *chip, int nr_pages)
+static int cx88_alsa_dma_init(struct cx88_audio_dev *chip,
+			      unsigned long nr_pages)
 {
 	struct cx88_audio_buffer *buf = chip->buf;
 	struct page *pg;
@@ -279,11 +280,11 @@ static int cx88_alsa_dma_init(struct cx88_audio_dev *chip, int nr_pages)
 
 	buf->vaddr = vmalloc_32(nr_pages << PAGE_SHIFT);
 	if (!buf->vaddr) {
-		dprintk(1, "vmalloc_32(%d pages) failed\n", nr_pages);
+		dprintk(1, "vmalloc_32(%lu pages) failed\n", nr_pages);
 		return -ENOMEM;
 	}
 
-	dprintk(1, "vmalloc is at addr %p, size=%d\n",
+	dprintk(1, "vmalloc is at addr %p, size=%lu\n",
 		buf->vaddr, nr_pages << PAGE_SHIFT);
 
 	memset(buf->vaddr, 0, nr_pages << PAGE_SHIFT);
-- 
2.26.2

