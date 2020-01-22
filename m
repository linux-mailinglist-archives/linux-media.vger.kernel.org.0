Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAC61449B1
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 03:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgAVCF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 21:05:58 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54796 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgAVCF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 21:05:58 -0500
Received: by mail-pj1-f65.google.com with SMTP id kx11so2316700pjb.4
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 18:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vu0P+TqydFlkgIras7hArFCb2ZMbDqBdR1PlF/mHkkk=;
        b=en+8NfQnj4d/v6++rQTMh+iPxXPOddhceEF9O29VgX2zAafqp+1/oeqPPQaTZe8NhR
         yDkezigSS7KDcdzSjepQ5NwS7JK6oM1dB9thLNtTDgrPgv1y/rhjkSvE/6yljqsWPXeY
         kb/Y0GUpyaj/Vm9Wrcf3pMuvLhkIKsbJ9uA/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vu0P+TqydFlkgIras7hArFCb2ZMbDqBdR1PlF/mHkkk=;
        b=fC1xn6+ony9SIvCtoIGWPc9aJZZP5WXQBAQk+PcnQvvvFugwJzc0ws1lJUuvrT7HK/
         WUOrdV0CEjvSE1m88/Js7RITIaOK73p4K/FEdBIP26ie4mZbhDECGJ628K5k103dtE5G
         3ut9Kwgwp+DRHGxo0N2i/mzE0UB/wop8+h/w2BKz+Jbuph9VVxwNycKoGYgUipV8aCo3
         XeC4F1AA82SmUrxRgi1xovAFscT4JBtBNO3ZJTn5v1ZQaS/ZngpTvi+t8aJSg/UStAMO
         Aqg5bV/6nY9a9ziXF5rOijg8b2gWtzyjTMoG6AHvZaq6ePWbraqMqwy5MbZ1ia7bLbgu
         JvUw==
X-Gm-Message-State: APjAAAXXBjnR2030ub6YmJNubFmYH1rGASxwAG8WaHScGdrcZX0YQ8xG
        d6d7RlqVccjYeGnvdU6jNv8kRw==
X-Google-Smtp-Source: APXvYqyDzAJuDLiodwgaecqWrmIJKuV7weT5y48qgIvs0u7QpPVK52mU8JY8LIYW2h6XesYynn0Thw==
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr269720pjv.100.1579658757856;
        Tue, 21 Jan 2020 18:05:57 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id h11sm41882131pgv.38.2020.01.21.18.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 18:05:57 -0800 (PST)
Date:   Wed, 22 Jan 2020 11:05:55 +0900
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
Subject: Re: [RFC][PATCH 04/15] videobuf2: add queue memory consistency
 parameter
Message-ID: <20200122020555.GD149602@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-5-senozhatsky@chromium.org>
 <77ddd5cd-affc-ad0f-829d-d624f9798055@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77ddd5cd-affc-ad0f-829d-d624f9798055@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/01/10 10:47), Hans Verkuil wrote:
> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> > Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.
> >
> > Extend vb2_core_reqbufs() with queue memory consistency flag.
> > API permits queue's consistency attribute adjustment only if
> > the queue has no allocated buffers, not busy, and does not have
> > buffers waiting to be de-queued.
>
> Actually, you can call vb2_core_reqbufs() when buffers are allocated:
> it will free the old buffers, then allocate the new ones.
> So drop the 'has no allocated buffers' bit.

Well, the wording, basically, follows the existing vb2_core_reqbufs()
behavior "queue memory type"-wise. What I'm trying to say:

[..]
int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
		bool consistent_mem, unsigned int *count)
{
	unsigned int num_buffers, allocated_buffers, num_planes = 0;
	unsigned plane_sizes[VB2_MAX_PLANES] = { };
	unsigned int i;
	int ret;

	if (q->streaming) {
		dprintk(1, "streaming active\n");
		return -EBUSY;
	}

	if (q->waiting_in_dqbuf && *count) {
		dprintk(1, "another dup()ped fd is waiting for a buffer\n");
		return -EBUSY;
	}

	if (*count == 0 || q->num_buffers != 0 ||
	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
		/*
		 * We already have buffers allocated, so first check if they
		 * are not in use and can be freed.
		 */
		mutex_lock(&q->mmap_lock);
		if (debug && q->memory == VB2_MEMORY_MMAP &&
		    __buffers_in_use(q))
			dprintk(1, "memory in use, orphaning buffers\n");

		/*
		 * Call queue_cancel to clean up any buffers in the
		 * QUEUED state which is possible if buffers were prepared or
		 * queued without ever calling STREAMON.
		 */
		__vb2_queue_cancel(q);
		ret = __vb2_queue_free(q, q->num_buffers);
		mutex_unlock(&q->mmap_lock);
		if (ret)
			return ret;

		/*
		 * In case of REQBUFS(0) return immediately without calling
		 * driver's queue_setup() callback and allocating resources.
		 */
		if (*count == 0)
			return 0;
	}

	/*
	 * Make sure the requested values and current defaults are sane.
	 */
	WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);
	num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
	q->memory = memory;
+	__set_queue_consistency(q, consistent_mem);

[..]

So we set/change queue consistency attribute when we set/change
queue memory type. Is there a use case for more flexibility when
it comes to queue consistency?

> > If user-space attempts to allocate a buffer with consistency
> > requirements which don't match queue's consistency model such
> > allocation requests will be failed.
>
> Is this last paragraph right? I don't see any code for that.

Yeah, this was more about the general direction. The actual code
was added later in the series.

> BTW, a general comment about patches 4-6: I prefer if you changes
> this to two patches: one that adds videobuf2-core.c support for
> this for reqbufs and create_bufs, then another that wires up the
> new V4L2 flag in videobuf2-v4l2.c.

I'll take a look.

	-ss
