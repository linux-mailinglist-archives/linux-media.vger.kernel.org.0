Return-Path: <linux-media+bounces-21970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE51A9D83B8
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C24165B86
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE06E166307;
	Mon, 25 Nov 2024 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JtmO6+QG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D5193425
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531600; cv=none; b=f2ljVPACzJaZ9pR1dDvLYc7SKlTuAm59j40hg5jCE5KL7dsbqhoE5ryOxs0y6DWm9cD0ick4t6YU1BxfSKwX0eCZWXjNv+kYa90ddhyCZE1yH8djdU1J0wAATr6fSJP8hIjSHczwZf4qb9dWc/iWxyqZ9sfTRWw8eMSgraagwl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531600; c=relaxed/simple;
	bh=GP0T8ewRYzu4HxZ3WnqjMjNwJ8ZYiCh/2BOXbms6Z8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhVaANrRCnpSatUhoMn+KGeODrquleCa9tU+xuDF/G+jIbAP4Mk+mMj4egcBPVLuoWvzpSzN+ec4zm0SDE+SIYPzKoCCLzcZZLOe+T8X7LdS5RrytI7JzE13ZIO7tPzIOLDs/rI9z+vNdYmyVVwF/bMfAEtsWFo4JbXhNoieuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JtmO6+QG; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e393167dd71so73643276.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 02:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732531597; x=1733136397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26FZSeEdgO+NHa3EUYAzp6T4D/JS5Ge/APF1zhDq5PE=;
        b=JtmO6+QG0lePTPqJWQOcQqsdkAvPgdP3kkolDH+1z1F0BL5fv7zL93ll9wv4cOfkw2
         w4GFw2uClOSKC4x3qtee9W6gXxVD+/mFPdEWDxZPYqiWVJ0dRgEktZnJurhEpOLQRu2e
         FrbDcWJA7+hzyB4+pJWLoS2Zeqi2zfbslv0IXwFUn67IiemklgAN4YPzKdXMQwC4MBhg
         GjHl/1j7S3GaL2+jbSFiFoR1VgO9T1ixNVhRNJcYNFLVWRlRBB9Y6N3VJrleMmHaddSx
         qkPzuoazubtLMckEGFT/xfC1rgd6ZPoPXs414lpDyjtK5jUyWTw59CVXm4fGUyFfJ3G0
         rN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732531597; x=1733136397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26FZSeEdgO+NHa3EUYAzp6T4D/JS5Ge/APF1zhDq5PE=;
        b=aepqFPcmANKxtHzn/dgXsekImLbioIitTtS5BXR0wz3amIvrsSZTzyQqOx8KxMtj6a
         Y4B2Iig2mcsxq9I2gs8LIMorUPhUMlc1E77BwSijtDyEaiCSBRDYTRbPCYg+/8yEFgVt
         RmOC65jb+EZX2slGf4y0NnMTZS2nG0lqsCwgNFFnDliKjyOUVuz67g3RKzKzW99hMmlC
         fXCuREN6M1ERs+xv9g67FWfVOFxJe+jSgLYZqbQ61jrLVzqDJ9DzIclI4BtFo/AMqf/t
         f1daZa3f2x4gcu0gBguxrYcRMnfDBqZAjUIv7gfSVsWD09eldRZPYfeyLjQGoePBajMA
         IbSA==
X-Forwarded-Encrypted: i=1; AJvYcCXCsvJyZXVtx6XP3mUwlDrHoLLNUtVfPG/g+VVeaVCGIpLA/pSt2Fy15q73yTFRAhQFtUC0Fth6KE4I+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3UtpJ4091yxVtIPQ0sOEggQOILHjiUkdK2R1ResutPN89knwK
	NjKVdbepY2AwwUnpgLcWNWxQAe/Ak/c9HDVmqn2sZkuwR7Iqm5H2ZgPWZafpPgYH5XipC+/Y6Iw
	Eq3c7Gewq4rz4FU39ba4AurDyZ4xfIAjGqrHzrw==
X-Gm-Gg: ASbGncvU+u8E6V0N+IvefOdkJ8kkmJva696d9dXXH8eb6mlNZKpUUT5IZCadkzK5Fkh
	0wr1A1J7pVaAw9mZUWzvA0gaHq8AZXhLyQk/mC56Z7NYfz/GoksN/Y/O3+uAseXo=
X-Google-Smtp-Source: AGHT+IEKBDUKsnQY2QvubNmp8u3yV1Nbr7olengon87+FnysXiAS6rV6LCeYk/aaPdprs28q0xV7/4+THizDS8P+rvc=
X-Received: by 2002:a05:6902:2210:b0:e38:b8bb:fb7d with SMTP id
 3f1490d57ef6-e38f8c11c69mr3265008276.11.1732531597130; Mon, 25 Nov 2024
 02:46:37 -0800 (PST)
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
 <20241125092335.GL19381@pendragon.ideasonboard.com> <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
 <20241125102707.GP19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125102707.GP19381@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 25 Nov 2024 10:46:01 +0000
Message-ID: <CAEmqJPrDb5_L-9tv7nEuG7GoN6naKhM-vsC0tPfLQaAQYisqjg@mail.gmail.com>
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


On Mon, 25 Nov 2024 at 10:27, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Naush,
>
> On Mon, Nov 25, 2024 at 09:46:26AM +0000, Naushir Patuck wrote:
> > On Mon, 25 Nov 2024 at 09:23, Laurent Pinchart wrote:
> > > On Mon, Nov 25, 2024 at 08:37:22AM +0000, Naushir Patuck wrote:
> > > > On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart wrote:
> > > > > On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> > > > > >
> > > > > > With Hans Sakari and Laurent in cc for real now
> > > > > >
> > > > > > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > > > > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > > > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > > > > > kernel downstream Unicam driver.
> > > > > > > > > >
> > > > > > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > > > > > have run yet.
> > > > > > > > > >
> > > > > > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > > > > > ---
> > > > > > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > > > > > >                        */
> > > > > > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > > > > > +                             /*
> > > > > > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > > > > > +                              * return out the frame, as no buffer handling
> > > > > > > > > > +                              * or timestamping has yet been done as part of
> > > > > > > > > > +                              * the FS handler.
> > > > > > > > > > +                              */
> > > > > > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > > > > > +                                     continue;
> > > > > > > > > > +                             }
> > > > > > > > > > +
> > > > > > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > > >                               inc_seq = true;
> > > > > > > > > > +                     } else {
> > > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > >                       }
> > > > > > > > > > -                     node->cur_frm = node->next_frm;
> > > > > > > > > >               }
> > > > > > > > > >
> > > > > > > > > >               /*
> > > > > > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > > >                                       i);
> > > > > > > > > >                       /*
> > > > > > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > > > > > -                      * if we have not managed to obtain another frame
> > > > > > > > > > -                      * from the queue.
> > > > > > > > > > +                      * if no buffer currently queued.
> > > > > > > > > >                        */
> > > > > > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > > > > > +                     if (!node->next_frm ||
> > > > > > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > > > > > +                             /*
> > > > > > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > > > > > +                              * queue.
> > > > > > > > >
> > > > > > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > > > > > errors to userspace ?
> > > > > > > >
> > > > > > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > > > > > is valid and will not get overwritten.  If we were to return to
> > > > > > >
> > > > > > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > > > > > should be.
> > > > > > >
> > > > > > > If I can summarize it: When a frame capture is aborted after the DMA
> > > > > > > transfer has already started, should the corresponding capture buffer
> > > > > > > be returned to the user in error state or the frame drop can go
> > > > > > > silently ignored ?
> > > > >
> > > > > If the DMA tranfer is aborted, I would return the buffer to userspace.
> > > > > This will indicate a frame loss better than deducing it from a gap in
> > > > > the sequence numbers.
> > > > >
> > > > > Is the DMA really aborted here though ?
> > > >
> > > > No, the DMA continues, causing possilbe overwrite/tearing in the
> > > > framebuffer.  Hence we defer returning it until we can ensure we don't
> > > > overwrite into the buffer on the next frame.
> > >
> > > If the DMA continues then we certainly can't return the buffer to
> > > userspace. Is it the next frame being DMA'ed to the same buffer, or does
> > > the hardware put it the buffer at the back of its queue ?
> >
> > The next frame will be DMA'ed into the same buffer in this error
> > condition. The hardware really only has a 2-deep buffer queue (current
> > + next frame), and no reliable way of telling if next has been swapped
> > to been swapped.
>
> OK, that makes sense.
>
> In that case, is putting the buffer back to the back of the dma_queue
> the right option ? Shouldn't it be kept current and "just" be completed
> one frame later ? Or did I misunderstand the patch ?

Yes, I agree that the buffer handling logic below does seem
contradictory.  I'm going to need time to look into this in more
detail, it's been quite some time since I looked into this.  I would
suggest we remove this particular patch from the series until I get a
better understanding of the change.

Regards,
Naush


>
> > > > > > > Cc-ing Hans Sakari and Laurent for opinions.
> > > > > > >
> > > > > > > > userspace with an error, there is still a race condition on the name
> > > > > > > > frame/buffer which will also have to return as error.
> > > > > > >
> > > > > > > I'm sorry I didn't get this part :)
> > > > > > >
> > > > > > > > > > +                              */
> > > > > > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > > > > > +                                           &node->dma_queue);
> > > > > > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > > > +                     }
> > > > > > > > > >               }
> > > > > > > > > >
> > > > > > > > > >               unicam_queue_event_sof(unicam);
>
> --
> Regards,
>
> Laurent Pinchart

