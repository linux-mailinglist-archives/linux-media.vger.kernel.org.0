Return-Path: <linux-media+bounces-21956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E19D82CA
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88BC283981
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8031917F9;
	Mon, 25 Nov 2024 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mwCZxdrR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93C3190067
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732528026; cv=none; b=mmX0JBuLEyTMgtsUYfRkF1vDAUeMywPXgOTTdm3j+HOp8dtIYMrXjtIjvjKVPm5/EECUqzwoNaAF3qFXjFyG+LqV9tUgsjCvBATZBWNVV8D2Ud9dk8fkNqOdezdSNOMf2zFkJYGtLFAw/+GjXU8JiBYtl9EqPYKxxepqFGyIVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732528026; c=relaxed/simple;
	bh=baAEXZJOl2HYqg4flAdoZMZVtytu3PbwMdEYrA+3iyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5UF8WtRWY8KC7aLDmrpivWtsd50U3qgjxtyy4U2atHuEVG4vGG6I94sZJNJZVSau9Q0zS2/jUctT5eKu7PlKxJJO2zv9fPAFXT5DKfqHtqHQ0XtKOW8tcR0qssuc4b87VnaWmO8o7mrxdL0uGmusysulQlnjrZ8WKaKjkMQfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mwCZxdrR; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e393167dd71so65925276.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 01:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732528023; x=1733132823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bE670VWrKFAJi/k6QF6YDyCcP2WOkY0/aumOzxz6kvQ=;
        b=mwCZxdrRzS2CgWK9egm49K3kYgbB/U8puA4q1qUow+ahtjMGA0NPvJGFj26znRz9Rr
         oYzWKwou28lVgVphHiFeZ6zbH2lruGLn3H9K5drifJ++wPJcN5qQTW7DVwPWtbDx9OOH
         Q5q5CiS6MKzwrOTFbcn/k5+r7J+jcocPtLEztlGpi6tS9iOFUFdIa7wLGJ8UgfxGK0qq
         vFkujWUq3wqFyBJ0Em44RafKn5uxPB1VDsKP2jkct7e2X6SffpU3QXDCMvmnnB/dILTU
         VU+b0OnRrhMJavE76ANnD8SvfAcXOFvu3Tpl2IfFSqRH06tBTm2/xi0kRlm3tJhPxPOU
         eaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732528023; x=1733132823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE670VWrKFAJi/k6QF6YDyCcP2WOkY0/aumOzxz6kvQ=;
        b=YOtftktgqxEuToqlnACkC6eDVWGbPqVGsYPZY83+hoYtqe85plNgZlPnenaswdj7+S
         z7h/BxWfwWUhkvKPPz8ZeQflSbo6uFrN44PwukQ6nRPzh9NxKRHVm6YJ58j+rgvoYV59
         SkUIfh1CkolRLduTzyYvzg73GxCBj6DiWovS+NEASXDNNvt4+5Iypuuyzv3QCSRiih5n
         e7Yn8KrwsinX8tpWMi4Y2PHqNDEgjE8mJ7ejLbxIQyQG3cGwOyNSJWKYa4n59EPT8Beh
         4nEiFYl7ecuq/X79RYqREmXy8jjxcpTE1eVGHXiOBz7ph4INojzjuWh77/cqgmR7DDEU
         Gz6A==
X-Forwarded-Encrypted: i=1; AJvYcCU/6XxMTuSY4mypP5VmVdu3bhxPyiBE/oFm9Q+iK8PlhKnGccudFuQLy307jJsemk/zKO35xF5wGUIP9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWimu4KlnFiIg3OObjrvs2JHglKtesltAlyPKTL7v/RADy1M3
	mxpC39YVcXzDo+w1XnB8rLSlMuW2G03C8aGG99PhaM+rBk5NfeUOg7IBO3GVZtQWuJwQsr1HvPh
	iploz67aKwmMWnCC8b+M/5QmvaJOw8fxL5G7A1Q==
X-Gm-Gg: ASbGncu2F73lTso2exlyHhXJo9wrV3J93nsup/dm7ouDYrR6pKWVWUjW7XcMOC/1E8s
	/YLR649ooJL7juWJg7Mg/uS/kgvluqWjznIJJNAZPPNXM9zy0LQBFfEM73pJUTOA=
X-Google-Smtp-Source: AGHT+IHd0ValakmyJkPHUNRA+XE2BGtzAmKFDofJT/4iGoxBm2cj6JdKQe6Q9DhXX/URSJWtCBziiupwenCdRWIX0K0=
X-Received: by 2002:a05:690c:3603:b0:6ea:8cb3:32e9 with SMTP id
 00721157ae682-6eee076ceb3mr39495667b3.0.1732528022681; Mon, 25 Nov 2024
 01:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com> <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
 <20241124070428.GG19573@pendragon.ideasonboard.com> <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
 <20241125092335.GL19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125092335.GL19381@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 25 Nov 2024 09:46:26 +0000
Message-ID: <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 25 Nov 2024 at 09:23, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Naush,
>
> On Mon, Nov 25, 2024 at 08:37:22AM +0000, Naushir Patuck wrote:
> > On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart wrote:
> > > On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> > > >
> > > > With Hans Sakari and Laurent in cc for real now
> > > >
> > > > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > > > kernel downstream Unicam driver.
> > > > > > > >
> > > > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > > > have run yet.
> > > > > > > >
> > > > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > > > >
> > > > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > > > ---
> > > > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > > > >                        */
> > > > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > > > +                             /*
> > > > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > > > +                              * return out the frame, as no buffer handling
> > > > > > > > +                              * or timestamping has yet been done as part of
> > > > > > > > +                              * the FS handler.
> > > > > > > > +                              */
> > > > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > > > +                                     continue;
> > > > > > > > +                             }
> > > > > > > > +
> > > > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > +                             node->next_frm = NULL;
> > > > > > > >                               inc_seq = true;
> > > > > > > > +                     } else {
> > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > >                       }
> > > > > > > > -                     node->cur_frm = node->next_frm;
> > > > > > > >               }
> > > > > > > >
> > > > > > > >               /*
> > > > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > >                                       i);
> > > > > > > >                       /*
> > > > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > > > -                      * if we have not managed to obtain another frame
> > > > > > > > -                      * from the queue.
> > > > > > > > +                      * if no buffer currently queued.
> > > > > > > >                        */
> > > > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > > > +                     if (!node->next_frm ||
> > > > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > > > +                             /*
> > > > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > > > +                              * queue.
> > > > > > >
> > > > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > > > errors to userspace ?
> > > > > >
> > > > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > > > is valid and will not get overwritten.  If we were to return to
> > > > >
> > > > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > > > should be.
> > > > >
> > > > > If I can summarize it: When a frame capture is aborted after the DMA
> > > > > transfer has already started, should the corresponding capture buffer
> > > > > be returned to the user in error state or the frame drop can go
> > > > > silently ignored ?
> > >
> > > If the DMA tranfer is aborted, I would return the buffer to userspace.
> > > This will indicate a frame loss better than deducing it from a gap in
> > > the sequence numbers.
> > >
> > > Is the DMA really aborted here though ?
> >
> > No, the DMA continues, causing possilbe overwrite/tearing in the
> > framebuffer.  Hence we defer returning it until we can ensure we don't
> > overwrite into the buffer on the next frame.
>
> If the DMA continues then we certainly can't return the buffer to
> userspace. Is it the next frame being DMA'ed to the same buffer, or does
> the hardware put it the buffer at the back of its queue ?

The next frame will be DMA'ed into the same buffer in this error
condition. The hardware really only has a 2-deep buffer queue (current
+ next frame), and no reliable way of telling if next has been swapped
to been swapped.

Regards,
Naush


>
> > > > > Cc-ing Hans Sakari and Laurent for opinions.
> > > > >
> > > > > > userspace with an error, there is still a race condition on the name
> > > > > > frame/buffer which will also have to return as error.
> > > > >
> > > > > I'm sorry I didn't get this part :)
> > > > >
> > > > > > > > +                              */
> > > > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > > > +                                           &node->dma_queue);
> > > > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > +                     }
> > > > > > > >               }
> > > > > > > >
> > > > > > > >               unicam_queue_event_sof(unicam);
>
> --
> Regards,
>
> Laurent Pinchart

