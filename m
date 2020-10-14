Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22C628E363
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 17:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgJNPiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 11:38:07 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59450 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgJNPiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 11:38:07 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602689885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m2iWZa0Dgtln2P067G8zfxg1NzKCpf1TIelo7BayWic=;
        b=rWYeJo9YAtgTogv3yuYKQVrRYvAm3UcZ/87Mt+UDIq1wWNmSZafPXRmB3rhzhrEblMEitU
        WzJKYuP9hg6QiNW6RTN4XVWTU8MXC3Y2VXyHMRSuWtryTC77scdMxaHJwer7uVDmOSOQxO
        XdPA6I6lsNXtB+KYB2EeKQ4KnTJNNGargqZPYe7ueosQSKefSZCCcJfTS/onQqD3Eqq7D5
        jAHJGRTpbMJZ+hntQVji7kmJT4XQKf+Ef0ZCZRHyFT5mZ/4uFyzoajSnZXbaktYhRN+IpS
        lJTR4RaFJS+FGEKbScZeKbtIZMOJy8JagmqbTUMgP1qe90ICF98pXxJObjM0KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602689885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m2iWZa0Dgtln2P067G8zfxg1NzKCpf1TIelo7BayWic=;
        b=wOVi2pp78esrGxAluLINELnbH1L/UdCJbQaHUg9n8fdNb3rWysQw0MPzRsSMV2yerpq398
        D59dBYhIGKb5ChBA==
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: [patch V2 4/4] media: cx231xx: Consolidate dmesg output
In-Reply-To: <20201013143731.974452990@linutronix.de>
References: <20201013142616.118697527@linutronix.de> <20201013143731.974452990@linutronix.de>
Date:   Wed, 14 Oct 2020 17:38:04 +0200
Message-ID: <87lfg8byxv.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
V2: Removed the extra format specifier (0day)
---
 drivers/media/usb/cx231xx/cx231xx-core.c |   10 ++++------
 drivers/media/usb/cx231xx/cx231xx-vbi.c  |    5 ++---
 2 files changed, 6 insertions(+), 9 deletions(-)

--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -1065,9 +1065,8 @@ int cx231xx_init_isoc(struct cx231xx *de
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
@@ -1201,9 +1200,8 @@ int cx231xx_init_bulk(struct cx231xx *de
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
@@ -408,9 +408,8 @@ int cx231xx_init_vbi_isoc(struct cx231xx
 		    kzalloc(sb_size, GFP_KERNEL);
 		if (!dev->vbi_mode.bulk_ctl.transfer_buffer[i]) {
 			dev_err(dev->dev,
-				"unable to allocate %i bytes for transfer buffer %i%s\n",
-				sb_size, i,
-				in_interrupt() ? " while in int" : "");
+				"unable to allocate %i bytes for transfer buffer %i\n",
+				sb_size, i);
 			cx231xx_uninit_vbi_isoc(dev);
 			return -ENOMEM;
 		}
