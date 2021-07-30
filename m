Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240E43DBCBB
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 17:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhG3P7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 11:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhG3P7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 11:59:35 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A258C06175F
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 08:59:29 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id em4so559145qvb.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MHVnaVRrD59u6p4EjJzi2uYI5PXt/jdlePo1FxxGd4g=;
        b=e9Ql8tESerxuX9Gr7QUBbH8wmcnRvD077u+HbqZmxroCo7dF/1c5DC63GdHx9Xv/1C
         QBGihWWJ3ibWzKFSV72JdK/dvJV8+ZjoLd3sUqAmA1W2HiAPJg7KBZOgMv+OMRBnksgC
         3K+ZgWb75Mh0sCiiyKhEk3DEp1pztXX1HaQmGacgjY7IdMuBS+xFNOnzvEutQQnJpszb
         CfLZFj1bALVYoOYpzwV91g4xqLvAgZb8igae4GtIq7aTbSHVVVUgQSOl7pv0CsivfjDP
         vl5zVku0T/0zJFujIjG4p93+08+AE3racTxAcoBAkt7mFpdd7u1hJXA9BgQT1L2lPY9Y
         ZaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MHVnaVRrD59u6p4EjJzi2uYI5PXt/jdlePo1FxxGd4g=;
        b=QpoRJsa23NmDcP07jD5aHbWT5HyK5K/FyusNxWI+1qaZzyOc5xMGhu+StXWKHgiSQ/
         F5K/zyeIrsgSPouqt3i+mHeiFjoDTZH43JdM313A+5CUeleUGQRqpW50IWR5bJIrDJXu
         Lp/pKchEAJQhGIdh6XQRubpruNxOYUqXRH6HpnWAH7uiKbqKrzvOaJyho4pr2/sX+w/r
         I+ivQx0C1DuTGaLwghD82R1bJ9OKUy5FeJiFIzglzfqbIEerFnLucs7lgFGliUSJRl1b
         w9N7botSjFEhl5msLUpzQm9kZpLTroG0Z1hjyP0FvYzsciwSnCkIWiAuorpxeJTHHJvp
         IZig==
X-Gm-Message-State: AOAM531/Tg2pwZX5afEN9w8qjK6iYZKJu6G+PmQ1J8eFsYiEJWeULVd9
        ybv3cfwcF4j8L7vE7a3ey+R7zg==
X-Google-Smtp-Source: ABdhPJxiRBR0yk/CjoW3+YE2thG1denD2+HVLc1y/Wd3mMhSXcXZQ16Ud2zZ9hn4eGCBslo3s6N9pQ==
X-Received: by 2002:a0c:e6a4:: with SMTP id j4mr3438142qvn.16.1627660768575;
        Fri, 30 Jul 2021 08:59:28 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id r13sm775448qtt.38.2021.07.30.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:59:28 -0700 (PDT)
Message-ID: <5cde7f090939ac43588c682f2626f07ca9648dd7.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vimc: Add support for contiguous DMA buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Date:   Fri, 30 Jul 2021 11:59:27 -0400
In-Reply-To: <YQQJhjOtPb10+olI@pendragon.ideasonboard.com>
References: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com>
         <40a1fed8-456e-97c5-9aa7-715a4a4c816b@collabora.com>
         <YQP6aILfBDLhSFUt@pendragon.ideasonboard.com>
         <69e4b3fe-5e31-840a-9ea6-a3050f9a6a20@collabora.com>
         <YQQJhjOtPb10+olI@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 30 juillet 2021 à 17:15 +0300, Laurent Pinchart a écrit :
> Hi Dafna,
> 
> On Fri, Jul 30, 2021 at 04:08:11PM +0200, Dafna Hirschfeld wrote:
> > On 30.07.21 15:11, Laurent Pinchart wrote:
> > > On Fri, Jul 30, 2021 at 02:35:20PM +0200, Dafna Hirschfeld wrote:
> > > > On 30.07.21 02:19, Laurent Pinchart wrote:
> > > > > The vimc driver is used for testing purpose, and some test use cases
> > > > > involve sharing buffers with a consumer device. Consumers often require
> > > > > DMA contiguous memory, which vimc doesn't currently support. This leads
> > > > > in the best case to usage of bounce buffers, which is very slow, and in
> > > > > the worst case in a complete failure.
> > > > > 
> > > > > Add support for the dma-contig allocator in vimc to support those use
> > > > > cases properly. The allocator is selected through a new "allocator"
> > > > > module parameter, which defaults to vmalloc.
> > > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > ---
> > > > >    drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
> > > > >    drivers/media/test-drivers/vimc/vimc-common.h  |  2 ++
> > > > >    drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
> > > > >    3 files changed, 19 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> > > > > index 5e9fd902cd37..92b69a6529fb 100644
> > > > > --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> > > > > +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> > > > > @@ -7,6 +7,7 @@
> > > > >    
> > > > >    #include <media/v4l2-ioctl.h>
> > > > >    #include <media/videobuf2-core.h>
> > > > > +#include <media/videobuf2-dma-contig.h>
> > > > >    #include <media/videobuf2-vmalloc.h>
> > > > >    
> > > > >    #include "vimc-common.h"
> > > > > @@ -423,14 +424,18 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
> > > > >    	/* Initialize the vb2 queue */
> > > > >    	q = &vcap->queue;
> > > > >    	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > > > > -	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> > > > > +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> > > > 
> > > > maybe to be on the safe side VB2_DMABUF should be set only if vimc_allocator==1 ?
> > > 
> > > Why so ? vb2-vmalloc can import dma-bufs.
> > 
> > oh, I meant that exporting should not be supported.
> > I see that vimc set ".vidioc_expbuf = vb2_ioctl_expbuf", maybe remove that if allocator is vmalloc?
> 
> If the importer support non-contiguous buffers, vb2-vmalloc can be used
> as an exporter. I've successfully used this to test sharing buffers
> between vimc in vmalloc mode and the R-Car H3 display driver with an
> IOMMU.

Having an IOMMU is not sufficient, as this is shown with Intel DRM. The DRM
driver needs to support CPU cache. Note that in GStreamer this is used a lot
from UVC camera to GL (but it breaks, corrupted images, with kmssink).

> 
> > > > > +	if (vimc_allocator != 1)
> > > > 
> > > > maybe define a macro instead of `1` ?
> > > 
> > > Good idea.
> > > 
> > > > > +		q->io_modes |= VB2_USERPTR;
> > > > >    	q->drv_priv = vcap;
> > > > >    	q->buf_struct_size = sizeof(struct vimc_cap_buffer);
> > > > >    	q->ops = &vimc_cap_qops;
> > > > > -	q->mem_ops = &vb2_vmalloc_memops;
> > > > > +	q->mem_ops = vimc_allocator == 1
> > > > > +		   ? &vb2_dma_contig_memops : &vb2_vmalloc_memops;
> > > > >    	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > > >    	q->min_buffers_needed = 2;
> > > > >    	q->lock = &vcap->lock;
> > > > > +	q->dev = v4l2_dev->dev;
> > > > >    
> > > > >    	ret = vb2_queue_init(q);
> > > > >    	if (ret) {
> > > > > diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> > > > > index a289434e75ba..b77939123501 100644
> > > > > --- a/drivers/media/test-drivers/vimc/vimc-common.h
> > > > > +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> > > > > @@ -35,6 +35,8 @@
> > > > >    
> > > > >    #define VIMC_PIX_FMT_MAX_CODES 8
> > > > >    
> > > > > +extern unsigned int vimc_allocator;
> > > > > +
> > > > >    /**
> > > > >     * vimc_colorimetry_clamp - Adjust colorimetry parameters
> > > > >     *
> > > > > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > > > > index 4b0ae6f51d76..7badcecb7aed 100644
> > > > > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > > > > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > > > > @@ -5,6 +5,7 @@
> > > > >     * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
> > > > >     */
> > > > >    
> > > > > +#include <linux/dma-mapping.h>
> > > > >    #include <linux/font.h>
> > > > >    #include <linux/init.h>
> > > > >    #include <linux/module.h>
> > > > > @@ -15,6 +16,12 @@
> > > > >    
> > > > >    #include "vimc-common.h"
> > > > >    
> > > > > +unsigned int vimc_allocator;
> > > > > +module_param_named(allocator, vimc_allocator, uint, 0444);
> > > > > +MODULE_PARM_DESC(allocator, " memory allocator selection, default is 0.\n"
> > > > > +			     "\t\t    0 == vmalloc\n"
> > > > > +			     "\t\t    1 == dma-contig");
> > > > > +
> > > > 
> > > > There is a section 'Module options' in vimc.rst. So a doc should be added there.
> > > 
> > > OK, I'll update that.
> > > 
> > > > >    #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
> > > > >    
> > > > >    #define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
> > > > > @@ -278,6 +285,9 @@ static int vimc_probe(struct platform_device *pdev)
> > > > >    
> > > > >    	tpg_set_font(font->data);
> > > > >    
> > > > > +	if (vimc_allocator == 1)
> > > > > +		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > > > > +
> > > > >    	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
> > > > >    	if (!vimc)
> > > > >    		return -ENOMEM;
> > > > > 
> 


