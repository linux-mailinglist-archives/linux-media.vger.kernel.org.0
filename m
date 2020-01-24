Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525BA1476F0
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 03:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730314AbgAXCZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 21:25:47 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40254 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730005AbgAXCZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 21:25:47 -0500
Received: by mail-pj1-f67.google.com with SMTP id bg7so373410pjb.5
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2020 18:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wZkNXk/j/FX4H35zLUUfeB6UVmty3DCVgibb2jFr+W8=;
        b=UK2NnWBXt+4l5lehVqqDx8Y0/xUQNfAFnsRbtbMhYt8sGV95QRl7EXnoveOqh4TNa5
         8CFJNYb04cwyZwxa8RgQdRIAfnPLIVhWGMFEcaES6aoKziZdpPfuFNoAPerOZP6CrWVU
         W50XTuUuNfc65LzzwtOl1bpcYRxp4goeZjy70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wZkNXk/j/FX4H35zLUUfeB6UVmty3DCVgibb2jFr+W8=;
        b=OeeJnYi5xN898V1gIkaIUEMrq71NPKO4ISkPPALjTJPJc6Cmwg78ByGs5E9RlyV8s0
         BWu9JP/iHY8NZO8b6xKdrNcB27D0JoTw78to0zMRzoolZjOXshe5CM9UkFaQnhki8XtH
         DrJq3khyLBkni89UIt9pwpuHoXCpRQw9b8wo+g7sK7uum1asKvNc4jEIfi7+xj8BjEiC
         rFvHZTAb7jzQ0fx9hPHXonNuLHE9gl2yBifngW/02s0ztLCoJbPnFvqB/OdYFSeHn8yv
         EVseRR66205g07RgluVXPvNjnIBy23myQjWkE7oh2s85y+1Kp6VFNJNT8E/cpZ1USYGi
         Z8Kw==
X-Gm-Message-State: APjAAAUZ4RPU6lKZHu5p+G5KbSO7iKcsSokwPyGRMPjJbaZ3Ap3uoR1Q
        ch2BtDQPH1q6/ErbW51fS0Ioqg==
X-Google-Smtp-Source: APXvYqx9X+PIiksskSh6s8xBYgkunxj4+mupFtRlAqSkOUrTwLCHtoJ9jpWIrA4YfcrFk9oLa8Ifng==
X-Received: by 2002:a17:902:aa41:: with SMTP id c1mr1240730plr.105.1579832746732;
        Thu, 23 Jan 2020 18:25:46 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d23sm4004936pfo.176.2020.01.23.18.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 18:25:46 -0800 (PST)
Date:   Fri, 24 Jan 2020 11:25:44 +0900
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
Message-ID: <20200124022544.GD158382@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-14-senozhatsky@chromium.org>
 <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
 <20200122050515.GB49953@google.com>
 <57f711a0-6183-74f6-ab24-ebe414cb6881@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57f711a0-6183-74f6-ab24-ebe414cb6881@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/01/23 12:35), Hans Verkuil wrote:
> On 1/22/20 6:05 AM, Sergey Senozhatsky wrote:
> > On (20/01/10 11:30), Hans Verkuil wrote:

[..]

> But whatever was written in the buffer is going to be overwritten anyway.
> 
> Unless I am mistaken the current situation is that the cache syncs are done
> in both prepare and finish, regardless of the DMA direction.
> 
> I would keep that behavior to avoid introducing any unexpected regressions.

OK.

> Then, if q->allow_cache_hint is set, then default to a cache sync (cache clean)
> in the prepare for OUTPUT buffers and a cache sync (cache invalidate) in the
> finish for CAPTURE buffers.

We alter default cache sync behaviour based both on queue ->memory
type and queue ->dma_dir. Shall both of those cases depend on
->allow_cache_hints, or q->memory can be independent?

static void set_buffer_cache_hints(struct vb2_queue *q,
				   struct vb2_buffer *vb,
				   struct v4l2_buffer *b)
{
	if (!q->allow_cache_hints)
		return;

	/*
	 * DMA exporter should take care of cache syncs, so we can avoid
	 * explicit ->prepare()/->finish() syncs. For other ->memory types
	 * we always need ->prepare() or/and ->finish() cache sync.
	 */
	if (q->memory == VB2_MEMORY_DMABUF) {
		vb->need_cache_sync_on_finish = 0;
		vb->need_cache_sync_on_prepare = 0;
		return;
	}

	/*
	 * ->finish() cache sync can be avoided when queue direction is
	 * TO_DEVICE.
	 */
	if (q->dma_dir == DMA_TO_DEVICE)
		vb->need_cache_sync_on_finish = 0;
	else
		vb->need_cache_sync_on_finish = 1;

	/*
	 * ->prepare() cache sync can be avoided when queue direction is
	 * FROM_DEVICE.
	 */
	if (q->dma_dir == DMA_FROM_DEVICE)
		vb->need_cache_sync_on_prepare = 0;
	else
		vb->need_cache_sync_on_prepare = 1;

	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
		vb->need_cache_sync_on_finish = 0;

	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
		vb->need_cache_sync_on_prepare = 0;
}
