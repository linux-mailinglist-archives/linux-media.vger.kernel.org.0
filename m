Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC40172E65
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 02:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730374AbgB1Bjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 20:39:52 -0500
Received: from mail-pf1-f180.google.com ([209.85.210.180]:39017 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730343AbgB1Bjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 20:39:52 -0500
Received: by mail-pf1-f180.google.com with SMTP id l7so819398pff.6
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 17:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9ubhH+dy/KSupIMOx/TfbizuLMWROXg/fbsaRaNRNTQ=;
        b=kn6ceABUO1Cc9o/V8RvE+BqRYIyMsLD7pkXnml/p+HBLTYwCD+seLQyeDd0N9VMMnG
         vA0eeXqPycMIBRwi21uFYZmEimkivcLv1xtkFSCpPPlUO+uWfwgn8lBxfHCkBxDo5VkT
         Wcp/SSjpRs/pkuS4oVeGna37qWSEBUfzoNSYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ubhH+dy/KSupIMOx/TfbizuLMWROXg/fbsaRaNRNTQ=;
        b=UMb2uYIQUspbd2Jddgbad5O2NLYEh+rYEoEwn6f6WNQ6581YxLAhF26D4GyiksNbgC
         tAE4TufmE7TIFNrULH2br4iAWt66GHzV7daj69Jc5TM7ASAOFx37WZ0ksVtgfH+W4VqR
         SALDBCo0Ri6rNfu3bPpnBujlZ48BgEolwaHB7HjVTIMIVjBvTvdFTmxY34oHlW7ADOAY
         PPDjxX3zSAy1RaE8Zk4nqavgC+ceXAIiyhu8CL2vWXZr1dyYXftFvAKPY68IiNuRbuSs
         LRQTwtkuTFgrCxQnx+jKKiv6kNeSrE+cGH3do9ycploQDTJmkSgOBBUfMgpX9unHbq4I
         BAJg==
X-Gm-Message-State: APjAAAXwjq7SAfPZgLe6Jxfyqyncsqfiw22peld+b8SAh7bx1cfsZocA
        0eiPlHuiDXs7q4UrMnXLzJ6DHw==
X-Google-Smtp-Source: APXvYqwXJNUP/+3kTTLyhDAQADeR4ErEhnIePa8ycI/oJfpnfCEKZv9NCRbU5AulBzJli9QLESZNJg==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr2119535pgh.96.1582853991077;
        Thu, 27 Feb 2020 17:39:51 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id q17sm8385815pfg.123.2020.02.27.17.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 17:39:50 -0800 (PST)
Date:   Fri, 28 Feb 2020 10:39:48 +0900
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
Subject: Re: [PATCHv3 03/11] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
Message-ID: <20200228013948.GN122464@google.com>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-4-senozhatsky@chromium.org>
 <19422259-f9ca-8715-508a-0f650d2fa0e3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19422259-f9ca-8715-508a-0f650d2fa0e3@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/27 13:25), Hans Verkuil wrote:
[..]
> > +      - vb2 buffer is allocated either in consistent (it will be automatically
> 
> vb2 -> A
> 
> (vb2 is a kAPI term, and shouldn't be used in uAPI documentation)
> 
> > +	coherent between CPU and bus) or non-consistent memory. The latter
> 
> CPU and bus -> the CPU and the bus
> 
> > +	can provide performance gains, for instance CPU cache sync/flush
> 
> CPU -> the CPU
> 
> > +	operations can be avoided if the buffer is accessed by the corresponding
> > +	device only and CPU does not read/write to/from that buffer. However,
> 
> CPU -> the CPU
> 
> > +	this requires extra care from the driver -- it must guarantee memory
> > +	consistency by issuing cache flush/sync when consistency is needed.
> 
> cache -> a cache
> 
> > +	If this flag is set V4L2 will attempt to allocate vb2 buffer in
> 
> vb2 -> the
> 
> > +	non-consistent memory. The flag takes effect only if the buffer is
> > +	used for :ref:`memory mapping <mmap>` I/O and the queue reports
> 
> reports -> reports the

OK.

> > +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> > @@ -156,6 +156,13 @@ aborting or finishing any DMA in progress, an implicit
> >        - Only valid for stateless decoders. If set, then userspace can set the
> >          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
> >  	capture buffer until the OUTPUT timestamp changes.
> > +    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
> > +      - 0x00000040
> > +      - Set when the queue/buffer support memory consistency and cache
> 
> support -> supports

OK.

> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -711,6 +711,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
> >  		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
> >  	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
> >  		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> > +	if ((q->allow_cache_hints != 0) && (q->io_modes & VB2_MMAP))
> 
> Just say:
> 
> 	if (q->allow_cache_hints && (q->io_modes & VB2_MMAP))

OK.

	-ss
