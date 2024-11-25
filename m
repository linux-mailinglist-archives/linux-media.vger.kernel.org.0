Return-Path: <linux-media+bounces-21934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1509D7D05
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF00282031
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD5418C337;
	Mon, 25 Nov 2024 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MgHQWlu1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623B188CCA
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732523881; cv=none; b=S08Dm7MqAqX1SOFuMW4t8cB5YpnO2xnH0A0j2kXN2rj8dNR4MEKuWuRTNyuWE3JOJPrmD7no40yAvGYZpFeGu2iSe4/26OrLELSuNog28DZqpTDkNJP1J+tr/UabNbSbQZt7wHd+XRkV6MghBOTizhrL1rj6t40Rcyc0FRhkPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732523881; c=relaxed/simple;
	bh=oSo4OIpSVx6i5YQ9jErVlOU0MzohFWjjfjhgST8rLIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nj1hdhNv05z4UtB8CJGlhqNIVe4k9+E498vkZhtiwJ+kaCLjn7cCb8Zy88YMHfj/daxqUGdoOfwC4z58hBpxkrZ+mlldUFZObQese5iWFfk0o88utr39YWycqq2Zs1wQXpGVN7TkpSuhJ3IJ3+VK4eAyGpa2/ndEZYFvsv9f7ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MgHQWlu1; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e393167dd71so56796276.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732523879; x=1733128679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jhf7UJAgjkqS9IEr+4/OYITR2vHwr6435xJDHVHDw+g=;
        b=MgHQWlu1VVAV2bZfkxSoD7T6ADCRHdhup+Zggm286dJ7bWQIBY0mov6OJXSf+2K5r/
         IjnVAXUsHxBRKkZrF0POWZCo58FrKKQFjCdbVeAb2dXh8X+f8kbsjEBi2tl4V9oI15hH
         KxEoZSCfEGOus8/C9hTqWvJ0d8jW6SH1K4PS9NKqJEqS29ypw8EqMW7f0esjJzTzyYxT
         MSbgiGwwzH5d273lzyr+6cmiktY+T/q4mo7acCyI2wGxy4RuQDcRkFzKaDKo08pQ6Ngj
         S9TbMtwRFWIPlF8RZodpmnUSDj3fjLxXlFC0KiEKjEorCXMPSiUAqDzvTTXE+VuyE2JC
         zoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732523879; x=1733128679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jhf7UJAgjkqS9IEr+4/OYITR2vHwr6435xJDHVHDw+g=;
        b=wc0wBKnpSufroHru69ulLy2n2r8F7NP9Qh9r1ebdaWkWcBPvoGrhRJmZD81Z7zdEaU
         opB2AurIZhOQuXxerXmFdWOX5Ht0cdFcB9P9ehjgmN3K4f1afnNGliM8UEAf0bc1PkNb
         MuWcFufIYza14QUipGuNOMV6PQbp0YG9dWJYPUg//v8BdPfN72Au0df6/evJh525jkZM
         YaCK+takPpN/y1NbjD4AjZ8H7mH5pus9aqA/KCWWDWRQn0Yh4RBibLEEIJfEzYqFd3Xc
         nifwkiTWoMje+GHIAKOstKxwSTVbaes5nt9eAaRHPyohfZRa5dKZs9jvJyyPgRerYhRw
         3nug==
X-Forwarded-Encrypted: i=1; AJvYcCWo8cOQQuLdz3FB2BSPN2qN8D0AQ+NptpVpcPE48HICEg4VWDR3VeY9RRmzF8v6Qhj9wvx7lXG8qM9kiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIKgdeBJfbf/qo9ULCMdQiGTdb4CX8XVKcB7Ksv4EUAzxlaBa
	4U66pfQxGzkzqqXgczDxX59qzQqUF+aFRyMyInvshgM/I5fjWBuDEJ2wXY3zs8Nqv681JnRQjlj
	iuFW1SZXnSG+15gHqWBT1KSSBD+VIlrgZWLtvww==
X-Gm-Gg: ASbGncspVMzxtUtIpdDzA7lGa6phLIpVSvM8CJ3ZlW4lbOzBtxV4ZvYR/Qu/X4uMrkl
	qhAFprjOrsJOHdZvKyDgGmggL6CRypB/RHlO9hRvhI8SFbtXPPGb7ZdhiX6+9nvg=
X-Google-Smtp-Source: AGHT+IFqUQwBayan6EHR2PgI6nhPiQUSS+N/6Yi2pVJ6bDreyN7dWTXfIQHNKenhX/VU25atPq9Gdlp6/SGHZtv9xLM=
X-Received: by 2002:a05:690c:670d:b0:6e6:c8b:4ae3 with SMTP id
 00721157ae682-6eee0a49b45mr44025007b3.10.1732523878855; Mon, 25 Nov 2024
 00:37:58 -0800 (PST)
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
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd> <20241124070428.GG19573@pendragon.ideasonboard.com>
In-Reply-To: <20241124070428.GG19573@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 25 Nov 2024 08:37:22 +0000
Message-ID: <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
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

On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> >
> > With Hans Sakari and Laurent in cc for real now
> >
> > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > kernel downstream Unicam driver.
> > > > > >
> > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > have run yet.
> > > > > >
> > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > >
> > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > ---
> > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > >                        */
> > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > +                             /*
> > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > +                              * return out the frame, as no buffer handling
> > > > > > +                              * or timestamping has yet been done as part of
> > > > > > +                              * the FS handler.
> > > > > > +                              */
> > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > +                                     continue;
> > > > > > +                             }
> > > > > > +
> > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > +                             node->next_frm = NULL;
> > > > > >                               inc_seq = true;
> > > > > > +                     } else {
> > > > > > +                             node->cur_frm = node->next_frm;
> > > > > >                       }
> > > > > > -                     node->cur_frm = node->next_frm;
> > > > > >               }
> > > > > >
> > > > > >               /*
> > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > >                                       i);
> > > > > >                       /*
> > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > -                      * if we have not managed to obtain another frame
> > > > > > -                      * from the queue.
> > > > > > +                      * if no buffer currently queued.
> > > > > >                        */
> > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > +                     if (!node->next_frm ||
> > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > +                             /*
> > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > +                              * queue.
> > > > >
> > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > errors to userspace ?
> > > >
> > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > is valid and will not get overwritten.  If we were to return to
> > >
> > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > should be.
> > >
> > > If I can summarize it: When a frame capture is aborted after the DMA
> > > transfer has already started, should the corresponding capture buffer
> > > be returned to the user in error state or the frame drop can go
> > > silently ignored ?
>
> If the DMA tranfer is aborted, I would return the buffer to userspace.
> This will indicate a frame loss better than deducing it from a gap in
> the sequence numbers.
>
> Is the DMA really aborted here though ?

No, the DMA continues, causing possilbe overwrite/tearing in the
framebuffer.  Hence we defer returning it until we can ensure we don't
overwrite into the buffer on the next frame.

Naush


>
> > > Cc-ing Hans Sakari and Laurent for opinions.
> > >
> > > > userspace with an error, there is still a race condition on the name
> > > > frame/buffer which will also have to return as error.
> > >
> > > I'm sorry I didn't get this part :)
> > >
> > > > > > +                              */
> > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > +                                           &node->dma_queue);
> > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > +                             node->next_frm = NULL;
> > > > > > +                     }
> > > > > >               }
> > > > > >
> > > > > >               unicam_queue_event_sof(unicam);
>
> --
> Regards,
>
> Laurent Pinchart

