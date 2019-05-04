Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0417213983
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 13:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfEDLlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 07:41:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:53480 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbfEDLlg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 May 2019 07:41:36 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 May 2019 04:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,429,1549958400"; 
   d="scan'208";a="139844370"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 May 2019 04:41:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMt2r-0003gT-9N; Sat, 04 May 2019 19:41:33 +0800
Date:   Sat, 4 May 2019 19:40:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org,
        dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC PATCH] allegro: allegro_alloc_buffer() can be static
Message-ID: <20190504114050.GA12462@lkp-kbuild10>
References: <20190503122010.16663-5-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-5-m.tretter@pengutronix.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Fixes: ccd8b4b2b72d ("allegro: add Allegro DVT video IP core driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 allegro-core.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 5ed8553..f4313cc 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -732,8 +732,8 @@ allegro_get_firmware_info(struct allegro_dev *dev,
  * Buffers that are used internally by the MCU.
  */
 
-int allegro_alloc_buffer(struct allegro_dev *dev,
-			 struct allegro_buffer *buffer, size_t size)
+static int allegro_alloc_buffer(struct allegro_dev *dev,
+				struct allegro_buffer *buffer, size_t size)
 {
 	buffer->vaddr = dma_alloc_coherent(&dev->plat_dev->dev, size,
 					   &buffer->paddr, GFP_KERNEL);
@@ -744,7 +744,7 @@ int allegro_alloc_buffer(struct allegro_dev *dev,
 	return 0;
 }
 
-void allegro_free_buffer(struct allegro_dev *dev, struct allegro_buffer *buffer)
+static void allegro_free_buffer(struct allegro_dev *dev, struct allegro_buffer *buffer)
 {
 	if (buffer->vaddr) {
 		dma_free_coherent(&dev->plat_dev->dev, buffer->size,
@@ -1604,7 +1604,7 @@ static int allegro_receive_message(struct allegro_dev *dev)
 	return err;
 }
 
-irqreturn_t allegro_hardirq(int irq, void *data)
+static irqreturn_t allegro_hardirq(int irq, void *data)
 {
 	struct allegro_dev *dev = data;
 	unsigned int status;
@@ -1618,7 +1618,7 @@ irqreturn_t allegro_hardirq(int irq, void *data)
 	return IRQ_WAKE_THREAD;
 }
 
-irqreturn_t allegro_irq_thread(int irq, void *data)
+static irqreturn_t allegro_irq_thread(int irq, void *data)
 {
 	struct allegro_dev *dev = data;
 
