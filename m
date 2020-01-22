Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 055ED144B02
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 06:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgAVFFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 00:05:18 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34581 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgAVFFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 00:05:18 -0500
Received: by mail-pf1-f196.google.com with SMTP id i6so2742078pfc.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 21:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W3QtAa0GpCqU3ZzHtwssyYyBXTxGEn8WOK20xfN/i70=;
        b=KOXqe+cgyOzv6v1zYpW2D5il/19yMEKhdDjOyKMcgPAp1jl4dG6xkhxbUj5vF4qAJk
         z2ylcP+/AduEA7qzIiP1BXwbM8M3Qf2O0iw+nWjNXFNzD+BSitSCCwO4ThGVoaUd4OuX
         IjqBOYsTwCTVvbmsnjbEug21kTgCMsHD00/kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W3QtAa0GpCqU3ZzHtwssyYyBXTxGEn8WOK20xfN/i70=;
        b=Z9yTn5NMv0GgD85A8aaGgsIXPGINr54m2AdXWMstfAkCMRJi4Je71I7+9M8GAHm88d
         Rn6V2R5QUoYwwPo/cV7EHFaD4jbCIwW4Gc/nlKqU6ix4LSrOnElVpdm6hO2uwu3XQezW
         kQsvICPAL3vfienrHeeSMMoAOUSdVRLd6p0HtdRC6phWGSMf23EWWyTRYdJcFr7D+zWu
         R8MFKgjLkejZnRUmj6gUPmwUgsJ3qLGcZ4yLg4z9HNJOv66CvhhKgX1fpIsZfpWdj0Dq
         McgvCK4DQBV0SPayE30LSVvJZCFlhQN1oZ2oAt6HhjkKpTa9XkAjNO/hF60/lNuWkAWf
         c2wA==
X-Gm-Message-State: APjAAAVqaeVV5ETRiGg2ej02sa/GkFQDods06BaHHt714DHrHTH37C9d
        2ltZfX0MoyQPWhgQNHZUB2ReKA==
X-Google-Smtp-Source: APXvYqzOVQxEB0Cb/qKyvWuxJK3JMG8vX+8qT1VGOd5nWnqFVGxB6D/FCdWny7gTuCLkbkB9+N2Jxw==
X-Received: by 2002:a63:6f8a:: with SMTP id k132mr9489382pgc.70.1579669517546;
        Tue, 21 Jan 2020 21:05:17 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id x65sm47362058pfb.171.2020.01.21.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 21:05:16 -0800 (PST)
Date:   Wed, 22 Jan 2020 14:05:15 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 13/15] videobuf2: do not sync buffers for DMABUF
 queues
Message-ID: <20200122050515.GB49953@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-14-senozhatsky@chromium.org>
 <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/01/10 11:30), Hans Verkuil wrote:
[..]
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index 1762849288ae..2b9d3318e6fb 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -341,8 +341,22 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
> >  				   struct vb2_buffer *vb,
> >  				   struct v4l2_buffer *b)
> >  {
> > -	vb->need_cache_sync_on_prepare = 1;
> > +	/*
> > +	 * DMA exporter should take care of cache syncs, so we can avoid
> > +	 * explicit ->prepare()/->finish() syncs.
> > +	 */
> > +	if (q->memory == VB2_MEMORY_DMABUF) {
> > +		vb->need_cache_sync_on_finish = 0;
> > +		vb->need_cache_sync_on_prepare = 0;
> > +		return;
> > +	}
> >  
> > +	/*
> > +	 * For other ->memory types we always need ->prepare() cache
> > +	 * sync. ->finish() cache sync, however, can be avoided when queue
> > +	 * direction is TO_DEVICE.
> > +	 */
> > +	vb->need_cache_sync_on_prepare = 1;
> 
> I'm trying to remember: what needs to be done in prepare()
> for a capture buffer? I thought that for capture you only
> needed to invalidate the cache in finish(), but nothing needs
> to be done in the prepare().

Hmm. Not sure. A precaution in case if user-space wrote to that buffer?

+	if (q->dma_dir == DMA_FROM_DEVICE)
+		q->need_cache_sync_on_prepare = 0;

?

	-ss
