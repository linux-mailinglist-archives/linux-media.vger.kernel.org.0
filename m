Return-Path: <linux-media+bounces-21964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2DB9D834F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E9C162D4E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD8B1922FC;
	Mon, 25 Nov 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vWBBAE1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0C14375C;
	Mon, 25 Nov 2024 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530440; cv=none; b=Bux5u6Yp0bQ2MLw9hsGqDtyUbo7cGj6/VAIsPnRjaHe1WUi1ah1zp1n54zjQzhrYBKzYAjyYXqE0lnuE9x5EfLMP3HraLNyAv2MhURB20cndL3HHWi6HvyPIvUYqU+mSeb58d1jMqEu3kzTn71geAfmdrvRVlVhke7Fzd1CRrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530440; c=relaxed/simple;
	bh=OooKzt1Ahe9gvg6xRWq0/KLttWsiFa/a2KRBdbv8qjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+PaSp1UksmNxVnU5OeTpyGdBQvq720CK+IBdds1mtQYpYaneDsjQisizL5TBUtDZzdi6M2hFWxNBkk2LUh1TxAO4cCgkXfd5mpqtBVXV+GCpDoCoYi3/yl2xlSOTaleJ9BePCBMUdi1h5shkwYWFDYTGLilCMfqs3GS3+oBljI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vWBBAE1Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 029136B5;
	Mon, 25 Nov 2024 11:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732530415;
	bh=OooKzt1Ahe9gvg6xRWq0/KLttWsiFa/a2KRBdbv8qjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vWBBAE1YsYdi0hQ3TzaiQxeZZheFHwQ5RTtGio9pSwSyjY4SWYZClta5UacsAoIUi
	 tllpi9+7bq9HIa3pIeBLw4Fuxws7hr6sqdRNIqSTshSQzOhpNHLHU39RZ02DDDu1kQ
	 CmfmGj1z9DGqlySAikGz182lJ7+ALIviKiRN1hqs=
Date: Mon, 25 Nov 2024 12:27:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
Message-ID: <20241125102707.GP19381@pendragon.ideasonboard.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com>
 <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
 <20241124070428.GG19573@pendragon.ideasonboard.com>
 <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
 <20241125092335.GL19381@pendragon.ideasonboard.com>
 <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>

Hi Naush,

On Mon, Nov 25, 2024 at 09:46:26AM +0000, Naushir Patuck wrote:
> On Mon, 25 Nov 2024 at 09:23, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 08:37:22AM +0000, Naushir Patuck wrote:
> > > On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart wrote:
> > > > On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> > > > >
> > > > > With Hans Sakari and Laurent in cc for real now
> > > > >
> > > > > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > > > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > > > > kernel downstream Unicam driver.
> > > > > > > > >
> > > > > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > > > > have run yet.
> > > > > > > > >
> > > > > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > > > > ---
> > > > > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > > > > >                        */
> > > > > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > > > > +                             /*
> > > > > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > > > > +                              * return out the frame, as no buffer handling
> > > > > > > > > +                              * or timestamping has yet been done as part of
> > > > > > > > > +                              * the FS handler.
> > > > > > > > > +                              */
> > > > > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > > > > +                                     continue;
> > > > > > > > > +                             }
> > > > > > > > > +
> > > > > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > >                               inc_seq = true;
> > > > > > > > > +                     } else {
> > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > >                       }
> > > > > > > > > -                     node->cur_frm = node->next_frm;
> > > > > > > > >               }
> > > > > > > > >
> > > > > > > > >               /*
> > > > > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > >                                       i);
> > > > > > > > >                       /*
> > > > > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > > > > -                      * if we have not managed to obtain another frame
> > > > > > > > > -                      * from the queue.
> > > > > > > > > +                      * if no buffer currently queued.
> > > > > > > > >                        */
> > > > > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > > > > +                     if (!node->next_frm ||
> > > > > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > > > > +                             /*
> > > > > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > > > > +                              * queue.
> > > > > > > >
> > > > > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > > > > errors to userspace ?
> > > > > > >
> > > > > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > > > > is valid and will not get overwritten.  If we were to return to
> > > > > >
> > > > > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > > > > should be.
> > > > > >
> > > > > > If I can summarize it: When a frame capture is aborted after the DMA
> > > > > > transfer has already started, should the corresponding capture buffer
> > > > > > be returned to the user in error state or the frame drop can go
> > > > > > silently ignored ?
> > > >
> > > > If the DMA tranfer is aborted, I would return the buffer to userspace.
> > > > This will indicate a frame loss better than deducing it from a gap in
> > > > the sequence numbers.
> > > >
> > > > Is the DMA really aborted here though ?
> > >
> > > No, the DMA continues, causing possilbe overwrite/tearing in the
> > > framebuffer.  Hence we defer returning it until we can ensure we don't
> > > overwrite into the buffer on the next frame.
> >
> > If the DMA continues then we certainly can't return the buffer to
> > userspace. Is it the next frame being DMA'ed to the same buffer, or does
> > the hardware put it the buffer at the back of its queue ?
> 
> The next frame will be DMA'ed into the same buffer in this error
> condition. The hardware really only has a 2-deep buffer queue (current
> + next frame), and no reliable way of telling if next has been swapped
> to been swapped.

OK, that makes sense.

In that case, is putting the buffer back to the back of the dma_queue
the right option ? Shouldn't it be kept current and "just" be completed
one frame later ? Or did I misunderstand the patch ?

> > > > > > Cc-ing Hans Sakari and Laurent for opinions.
> > > > > >
> > > > > > > userspace with an error, there is still a race condition on the name
> > > > > > > frame/buffer which will also have to return as error.
> > > > > >
> > > > > > I'm sorry I didn't get this part :)
> > > > > >
> > > > > > > > > +                              */
> > > > > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > > > > +                                           &node->dma_queue);
> > > > > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > > +                     }
> > > > > > > > >               }
> > > > > > > > >
> > > > > > > > >               unicam_queue_event_sof(unicam);

-- 
Regards,

Laurent Pinchart

