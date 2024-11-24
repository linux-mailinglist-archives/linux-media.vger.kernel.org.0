Return-Path: <linux-media+bounces-21870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E879D6CDA
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 08:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45792814C7
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 07:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8004186607;
	Sun, 24 Nov 2024 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uCdWJKtd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88015847C;
	Sun, 24 Nov 2024 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732431881; cv=none; b=a8tITNQI9UJlmG5uyF0B5aR3cXJejle+9p9yGGcfkO3j5U9gd9YyxtMJayVWWIvSmWqHusALqTSZCujxjAK8naGs99nqoy6/MlwPEnhbgtx3hWLp9kSbN2+tY0JKTYM3QaG0qM5o+DiCd626x+RAHQz/6gx5Gvc5hnfGgaHOCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732431881; c=relaxed/simple;
	bh=T3fbZXJ36wbjYidh3cGTZ7WKl7BVEtZ7NeY3axJeDu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKnCpIzFfQUetqh6V0DXSVZflrMSrh89tSvoM277LBgnGRQiZdKUiHtUwjYeylaKi3J0aYJFRmmTdKOg79WBy8dCA9f5Bvo2+qZlx3IvS9W8xDxoE3oY5QrnFmXqNeP2vn1xdhb4bi9HyL8LspD0osB19AhKX8MnZiwrmo8V8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uCdWJKtd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 979F9129;
	Sun, 24 Nov 2024 08:04:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732431856;
	bh=T3fbZXJ36wbjYidh3cGTZ7WKl7BVEtZ7NeY3axJeDu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCdWJKtd1y4P9sPbYAorA0HwhSFO6Af3ZmH5tCzziotGhkJKZGyVCjOA6p9NaPYjL
	 6N4r4rdjiLEcTNUDUAHWD1h/FwXI9cGTf9xpcVEyGoqFQfc28NvSNlrWJUWFe+oprU
	 Yubp6kF4e74V1+fhJunY218gwazbwDlsKOiw4gPg=
Date: Sun, 24 Nov 2024 09:04:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
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
Message-ID: <20241124070428.GG19573@pendragon.ideasonboard.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com>
 <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>

On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> 
> With Hans Sakari and Laurent in cc for real now
> 
> On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > kernel downstream Unicam driver.
> > > > >
> > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > have run yet.
> > > > >
> > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > >
> > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > ---
> > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > >                        * as complete, as the HW will reuse that buffer.
> > > > >                        */
> > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > +                             /*
> > > > > +                              * This condition checks if FE + FS for the same
> > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > +                              * return out the frame, as no buffer handling
> > > > > +                              * or timestamping has yet been done as part of
> > > > > +                              * the FS handler.
> > > > > +                              */
> > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > +                                     continue;
> > > > > +                             }
> > > > > +
> > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > +                             node->cur_frm = node->next_frm;
> > > > > +                             node->next_frm = NULL;
> > > > >                               inc_seq = true;
> > > > > +                     } else {
> > > > > +                             node->cur_frm = node->next_frm;
> > > > >                       }
> > > > > -                     node->cur_frm = node->next_frm;
> > > > >               }
> > > > >
> > > > >               /*
> > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > >                                       i);
> > > > >                       /*
> > > > >                        * Set the next frame output to go to a dummy frame
> > > > > -                      * if we have not managed to obtain another frame
> > > > > -                      * from the queue.
> > > > > +                      * if no buffer currently queued.
> > > > >                        */
> > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > +                     if (!node->next_frm ||
> > > > > +                         node->next_frm == node->cur_frm) {
> > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > +                             /*
> > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > +                              * contain valid data. Return cur_frm to the
> > > > > +                              * queue.
> > > >
> > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > errors to userspace ?
> > >
> > > The buffer silently gets recycled and we dequeue when we are sure it
> > > is valid and will not get overwritten.  If we were to return to
> >
> > I haven't find in the v4l2 specs any reference to what the behaviour
> > should be.
> >
> > If I can summarize it: When a frame capture is aborted after the DMA
> > transfer has already started, should the corresponding capture buffer
> > be returned to the user in error state or the frame drop can go
> > silently ignored ?

If the DMA tranfer is aborted, I would return the buffer to userspace.
This will indicate a frame loss better than deducing it from a gap in
the sequence numbers.

Is the DMA really aborted here though ?

> > Cc-ing Hans Sakari and Laurent for opinions.
> >
> > > userspace with an error, there is still a race condition on the name
> > > frame/buffer which will also have to return as error.
> >
> > I'm sorry I didn't get this part :)
> >
> > > > > +                              */
> > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > +                                           &node->dma_queue);
> > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > +                             node->cur_frm = node->next_frm;
> > > > > +                             node->next_frm = NULL;
> > > > > +                     }
> > > > >               }
> > > > >
> > > > >               unicam_queue_event_sof(unicam);

-- 
Regards,

Laurent Pinchart

