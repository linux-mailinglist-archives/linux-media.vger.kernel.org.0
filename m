Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A092D28D061
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgJMOjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:39:31 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52410 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730075AbgJMOj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:39:27 -0400
Message-Id: <20201013143731.859749817@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602599965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=HbKaPIGycRqaOzLEdRLNBqBq8/efplDiFnYYkQ1e0mQ=;
        b=E8JNBJ4vUwDEYCdHMsfPowMSaseHnVbGEW0LYPQZbvWVX8lHxLhnE1tI/RVm4xd6zeEkFr
        iasw68fm+bN32PBzCrXpFuBShoFSNxcbvVDiRrHFyhXfDx9muEvyy1gK4bytCKarYxs/y2
        BCZEQblMPYeHOERWAZ5ZyWmpkViRCaFsb4zVXbDhd0mhh/QKONu41tf6ntT2e0JWaL1Dxb
        uTot1jEgFCRG+oYpml38BgNAmAByCFSKFwt/vpUVk/MQ+olDNCywrz29NiVVGdc/2S0/8M
        g0Sum2dY32xofzdilysVp0ZvaDeLaTpBmOJvFQARkAT6nx7vtkQD0s35dZpPNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602599965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=HbKaPIGycRqaOzLEdRLNBqBq8/efplDiFnYYkQ1e0mQ=;
        b=YrjAhCjFWe1WsH7m8GEx76K4ptmEC2qC95qAKZfu7nyceO8HSzmUS3935fAz8Uq2DLefv1
        ThH0UAegqrRQI0Aw==
Date:   Tue, 13 Oct 2020 16:26:19 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: [patch 3/4] media: au0828: Consolidate dmesg output
References: <20201013142616.118697527@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The memory allocations in au0828_init_isoc() happen all in task context
with GFP_KERNEL. Therefore a printk() trying to deduce whether this is
called from task or interrupt context is pretty useless.

Convert it to au0828_isocdbg() as the other one in that function and for
completeness sake add one for the URB allocation as well.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org

---
 drivers/media/usb/au0828/au0828-video.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -231,6 +231,7 @@ static int au0828_init_isoc(struct au082
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
 		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 		if (!urb) {
+			au0828_isocdbg("cannot allocate URB\n");
 			au0828_uninit_isoc(dev);
 			return -ENOMEM;
 		}
@@ -239,9 +240,7 @@ static int au0828_init_isoc(struct au082
 		dev->isoc_ctl.transfer_buffer[i] = usb_alloc_coherent(dev->usbdev,
 			sb_size, GFP_KERNEL, &urb->transfer_dma);
 		if (!dev->isoc_ctl.transfer_buffer[i]) {
-			printk("unable to allocate %i bytes for transfer buffer %i%s\n",
-					sb_size, i,
-					in_interrupt() ? " while in int" : "");
+			au0828_isocdbg("cannot allocate transfer buffer\n");
 			au0828_uninit_isoc(dev);
 			return -ENOMEM;
 		}

