Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C36F28D063
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgJMOjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:39:31 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52432 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbgJMOj3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:39:29 -0400
Message-Id: <20201013143731.974452990@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602599967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=a+PI7nT40Q7VihMNU5RIN+OWBiwkSEbdS5+PZ5WYDjY=;
        b=Nr6vvhnkEXLDckX4GNYZxOxh99r2Ef2t2NnWvCtRSm6KHuO/8knJExArD88REMOg+evCkt
        wiCnxtq/NWHg/Niy/IFaxXgPjSgwyXiIvLlGN/pQ6GMa7riw64gOhYESIGo4PIqhbk5CXQ
        SKOlEtqxGjRakl5nSmLkuIOaNLfrwwV2iZ/XWwwserVLbAI43oo2xxQUdOV8uuhJrClsm8
        IIB81VXyW4Kpv0Oo3i3tzU/K2IRygljT6Z114stwS3q8TDSJCbxHhiGevnCSDQubmmOElD
        WEjtf26z84BdLv3u7gUDN4Ba2a3CmVOkoCPpu4fNQtpKK6oeuLIhhG0++5CjeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602599967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=a+PI7nT40Q7VihMNU5RIN+OWBiwkSEbdS5+PZ5WYDjY=;
        b=6iz62w3zOMhjhLhLouDT42w/sk3OVOqtOnWEB4VeNQcrQn2g9ITQsSZV4huioyrsMYnJNw
        a6tbMnCjWIbCRQAA==
Date:   Tue, 13 Oct 2020 16:26:20 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: [patch 4/4] media: cx231xx: Consolidate dmesg output
References: <20201013142616.118697527@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The memory allocations in cx231xx_init_*() happen all in task context with
GFP_KERNEL. Therefore a dev_err() trying to deduce whether this is called
from task or interrupt context is pretty useless.

Remove these historical leftovers.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org

---
 drivers/media/usb/cx231xx/cx231xx-core.c |   10 ++++------
 drivers/media/usb/cx231xx/cx231xx-vbi.c  |    3 +--
 2 files changed, 5 insertions(+), 8 deletions(-)

--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -1061,9 +1061,8 @@ int cx231xx_init_isoc(struct cx231xx *de
 				       &urb->transfer_dma);
 		if (!dev->video_mode.isoc_ctl.transfer_buffer[i]) {
 			dev_err(dev->dev,
-				"unable to allocate %i bytes for transfer buffer %i%s\n",
-				sb_size, i,
-				in_interrupt() ? " while in int" : "");
+				"unable to allocate %i bytes for transfer buffer %i\n",
+				sb_size, i);
 			cx231xx_uninit_isoc(dev);
 			return -ENOMEM;
 		}
@@ -1197,9 +1196,8 @@ int cx231xx_init_bulk(struct cx231xx *de
 				     &urb->transfer_dma);
 		if (!dev->video_mode.bulk_ctl.transfer_buffer[i]) {
 			dev_err(dev->dev,
-				"unable to allocate %i bytes for transfer buffer %i%s\n",
-				sb_size, i,
-				in_interrupt() ? " while in int" : "");
+				"unable to allocate %i bytes for transfer buffer %i\n",
+				sb_size, i);
 			cx231xx_uninit_bulk(dev);
 			return -ENOMEM;
 		}
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -409,8 +409,7 @@ int cx231xx_init_vbi_isoc(struct cx231xx
 		if (!dev->vbi_mode.bulk_ctl.transfer_buffer[i]) {
 			dev_err(dev->dev,
 				"unable to allocate %i bytes for transfer buffer %i%s\n",
-				sb_size, i,
-				in_interrupt() ? " while in int" : "");
+				sb_size, i);
 			cx231xx_uninit_vbi_isoc(dev);
 			return -ENOMEM;
 		}

