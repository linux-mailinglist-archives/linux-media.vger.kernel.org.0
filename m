Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6B5117CCB9
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 08:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgCGHuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 02:50:52 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36671 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCGHuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 02:50:51 -0500
Received: by mail-pf1-f194.google.com with SMTP id i13so2284833pfe.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 23:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lzhcSxhRoYq25n80YF1EtESa7xdST5h+El3OqWYt5Hg=;
        b=cdSzanK2cycSUIeu/UXqBeI2m6EEqm+kGhZ0/OwVDliTAxokaHvteVBDOLxoP8XeLc
         tqBNEY+Gep7ynltQwNMZ9o4vy3yNhUJWt2bgcg6eYmWto9x1e5xnTN/jcrHqXc5ioNai
         7XYqz+mvxPOH5aLFK0d7xkVsk9stdNVWRIN+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lzhcSxhRoYq25n80YF1EtESa7xdST5h+El3OqWYt5Hg=;
        b=a8ORGd4fdjUYWDX19ZwZoDo3PiKpVPfJaLKup/zgo2Zp82aBYZeVz7/mo3RrFhGMS8
         WFvvRjm28uOgH+WURyL1Uo6ET36lfQFjC/JJ92W4cKidskbd/zEaONPhWtDF5zoV9mGg
         fXgBCJDYK7X+5pe25z1lblcpPYE5x/tDJnQN1I2SO43qFUs++1LXxZUZJPDWEokhDlu3
         NOiPSApnc2LF33sQddUP8c0LPmSY8wiSvtB+zttrI2DtIa7nanHsUSP4ZYj8DlxMLUKF
         zV+xz0ROA92LpFiYqJt7yBjRYSOSsYRwJtFxmYoWiDorb+qkO68DA/fh3uWMOdFKcqiG
         z6MQ==
X-Gm-Message-State: ANhLgQ3pwWn0rpxJv9XbcclqwQFk3+ZM0I6SOCOiGBJOOYxL3A9WMoIg
        DAtiBzjbRg6g4optDp8x/T+a0Q==
X-Google-Smtp-Source: ADFU+vuClVSW/XG31xmrGAXKpohpkFTIz6ipoCyGnff9XH2Tpx55nA/tOvI2WtBvP3Xd4JmwZMK8Ow==
X-Received: by 2002:a63:745c:: with SMTP id e28mr6715988pgn.231.1583567449271;
        Fri, 06 Mar 2020 23:50:49 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id b4sm39496450pfd.18.2020.03.06.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 23:50:48 -0800 (PST)
Date:   Sat, 7 Mar 2020 16:50:46 +0900
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
Subject: Re: [PATCHv4 04/11] videobuf2: add queue memory consistency parameter
Message-ID: <20200307075046.GC176460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-5-senozhatsky@chromium.org>
 <7ab74b32-441d-1a1a-0112-6c4d0c0b900c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab74b32-441d-1a1a-0112-6c4d0c0b900c@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 15:04), Hans Verkuil wrote:
[..]
> > +static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
> > +{
> > +	bool queue_attr = q->dma_attrs & DMA_ATTR_NON_CONSISTENT;
> > +
> > +	if (consistent_mem != queue_attr) {
> 
> This is the wrong way around!
> 
> It's much better to write it like this:
> 
>        bool queue_is_consistent = !(q->dma_attrs & DMA_ATTR_NON_CONSISTENT);
> 
>        if (consistent_mem != queue_is_consistent) {

Hmm... That's a great catch. Thanks for spotting this.
Puzzled, how come I've never seen problems.

> What concerns me more is that this means that this series has not been
> tested properly. I found this when testing with v4l2-compliance and vivid.

I fully understand your concerns. Give me a moment to figure
out what's going on...


OK.

Apparently, the user-space I'm using for tests, utilizes different
call path. vb2_core_create_bufs() is never even invoked. Hence queue
consistency vs. request consistency checks are not performed.

What happens, instead, is v4l_reqbufs()->vb2_core_reqbufs() path.
It orphans existing buffers (if any), sets queue memory model, sets
queue consistency model (DMA attr), then allocates buffers.

On my test environment, I see that vb2_core_reqbufs() orphans the
buffers, but it's always due to "*count == 0 || q->num_buffers != 0"
conditions. The user-space I'm using does not twist queue ->memory
or consistency attr, so the tests I'm running are limited in scenarios.

verify_consistency_attr() is not on the list of reasons to orphan
allocated buffer. It probably should be, tho.

===
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index afb3c21a5902..d6b1d32bef3f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -730,7 +730,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	if (*count == 0 || q->num_buffers != 0 ||
-	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
+	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
+	    !verify_consistency_attr(q, consistent_mem)) {
 		/*
 		 * We already have buffers allocated, so first check if they
 		 * are not in use and can be freed.
===

> > +		dprintk(1, "memory consistency model mismatch\n");
> > +		return false;
> > +	}
> > +	return true;
> > +}
> > +
> >  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> > -		unsigned int *count, unsigned requested_planes,
> > -		const unsigned requested_sizes[])
> > +			 bool consistent_mem, unsigned int *count,
> > +			 unsigned requested_planes,
> > +			 const unsigned requested_sizes[])
> 
> Use 'unsigned int' in the two lines above, as per checkpatch suggestion.

OK, will do.

This comes from the original code. There are 'unsigned'-s in the
existing code, I saw it and didn't want to modify, in order to keep
diffstats shorter.

	-ss
