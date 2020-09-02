Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4622725B138
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgIBQP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:15:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:53930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbgIBQK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:56 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2CCB2158C;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=TyB5qk7Sh1O8/duNBsCmd6m1J0cmxULTBPs5i10qCv4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X8hl2OM2sVEtfrkk2thA9m4OvAG754Js57hqXJuQYYiDQRMEp/L5O536GhFLyEuAG
         wyCt/12joTSh/IBm7vFAom7koT/laCTuUl3snPaaqWVoVZCBGdQA8wcSDbIcQK1I+V
         kQzB5Vm/BZvEO9kbiyYfPjkeH2rPum7INZiNN498=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAU-4J; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Takashi Iwai <tiwai@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Forest Crossman <cyrozap@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 18/38] media: cx23885-alsa: number of pages should be unsigned long
Date:   Wed,  2 Sep 2020 18:10:21 +0200
Message-Id: <1ca468a8b0b6b0e6a1843a9eed04568902833b68.1599062230.git.mchehab+huawei@kernel.org>
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

	drivers/media//pci/cx23885/cx23885-alsa.c:83 cx23885_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?

the number of patches should be unsigned long.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 7 ++++---
 drivers/media/pci/cx23885/cx23885.h      | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index df44ed7393a0..141852f02236 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -68,7 +68,8 @@ MODULE_PARM_DESC(audio_debug, "enable debug messages [analog audio]");
 #define AUD_INT_MCHG_IRQ        (1 << 21)
 #define GP_COUNT_CONTROL_RESET	0x3
 
-static int cx23885_alsa_dma_init(struct cx23885_audio_dev *chip, int nr_pages)
+static int cx23885_alsa_dma_init(struct cx23885_audio_dev *chip,
+				 unsigned long nr_pages)
 {
 	struct cx23885_audio_buffer *buf = chip->buf;
 	struct page *pg;
@@ -76,11 +77,11 @@ static int cx23885_alsa_dma_init(struct cx23885_audio_dev *chip, int nr_pages)
 
 	buf->vaddr = vmalloc_32(nr_pages << PAGE_SHIFT);
 	if (NULL == buf->vaddr) {
-		dprintk(1, "vmalloc_32(%d pages) failed\n", nr_pages);
+		dprintk(1, "vmalloc_32(%lu pages) failed\n", nr_pages);
 		return -ENOMEM;
 	}
 
-	dprintk(1, "vmalloc is at addr %p, size=%d\n",
+	dprintk(1, "vmalloc is at addr %p, size=%lu\n",
 		buf->vaddr, nr_pages << PAGE_SHIFT);
 
 	memset(buf->vaddr, 0, nr_pages << PAGE_SHIFT);
diff --git a/drivers/media/pci/cx23885/cx23885.h b/drivers/media/pci/cx23885/cx23885.h
index c472498e57c4..349462ee2c48 100644
--- a/drivers/media/pci/cx23885/cx23885.h
+++ b/drivers/media/pci/cx23885/cx23885.h
@@ -325,8 +325,8 @@ struct cx23885_audio_buffer {
 	struct cx23885_riscmem	risc;
 	void			*vaddr;
 	struct scatterlist	*sglist;
-	int                     sglen;
-	int                     nr_pages;
+	int			sglen;
+	unsigned long		nr_pages;
 };
 
 struct cx23885_audio_dev {
-- 
2.26.2

