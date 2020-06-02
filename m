Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167821EB974
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgFBKTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbgFBKSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 06:18:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374F6C061A0E;
        Tue,  2 Jun 2020 03:18:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y18so1173710plr.4;
        Tue, 02 Jun 2020 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PdIpbAszWwqcNgU29oDY/uFem+Fq3TsYDOXZbQ3Tv3w=;
        b=rJm+Vu/a0+DiZdGgWDW/Cw4bDmxbYBa35aczL+ZkoNXQ0ffqQDyII9fTrhzXaVdb4x
         HT6W5P8WlSzHArUTJpKB7X7P4wy5h3zpR+nc3AAF0M2UbrtRdJnV9es/J7zuIhZcyE0R
         jPF2U/+rKHkuZLO9zFPex8OohsRSsrYymopGryq+Vtvnq8oYoTmExfa4fl64WQ+qq6XS
         k31f3dGUyrcli6YX2eded/Lz+q/p9a7ODbaKvzN+/km+u6MfeiKBNvNR7mu18A4B7uy9
         ME+skxLD5rueR7xcynJe9RCLZYI3h0rXE1mAE1E5FPyJ0hTzBea3Bjblh8FaojWkDmgk
         g8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PdIpbAszWwqcNgU29oDY/uFem+Fq3TsYDOXZbQ3Tv3w=;
        b=Ktwwu7NLDtPPSAq+EDlfhhSM/7uPCpykT97lp937HZD95/BQm4eCSfkFblnBVr9O5F
         mn+dHgxcVgUcDVBU5/dbUBh2Ag0bPt6DA7Q6DsMBOOHVWfmGOMAkSxGnoNVigJkghrFb
         7xEg3gFCcCpx/b1uTdXSNcS/3OBlRzWjTVBl1AnvqDYVSxoyAgb05zDIEttpHJobJHF1
         su9wrmkr+ZOauYrujZn3QRKXv9UrNGu/4+UXkaQRi98RwVX11DiJEN3HfLnmoEXjaN7t
         8A8qXlcK8e5t+2h1mYfvt15lOgdMEFq8IJigX52SAIedgbY54k9Ijm4MOgs8b3joAZUg
         PHJQ==
X-Gm-Message-State: AOAM532KFpuAmyNFH+oYZV0LKkESXXcM/uxsrbBL2qNDsh5jpTHXidls
        ZfI6UAdinCTLRKJY1ZiLZ4o=
X-Google-Smtp-Source: ABdhPJz8oSyfcSRFYN+JWD8lqfloLw69h52Zn84HsM5uJ0sl3yFPvCrw8jxSaUWnJX3OwLhrV8stJw==
X-Received: by 2002:a17:902:c1cb:: with SMTP id c11mr22638009plc.299.1591093117695;
        Tue, 02 Jun 2020 03:18:37 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id n19sm1983188pfa.216.2020.06.02.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 03:18:36 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Tue, 2 Jun 2020 19:18:34 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
Message-ID: <20200602101834.GA617@jagdpanzerIV.localdomain>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
 <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On (20/06/02 11:51), Hans Verkuil wrote:
> Hi Sergey,
> 
> While doing final testing for this patch series (together with the v4l-utils patch)
> I found one remaining issue:

Thanks for the report.

> > +static void set_buffer_cache_hints(struct vb2_queue *q,
> > +				   struct vb2_buffer *vb,
> > +				   struct v4l2_buffer *b)
> > +{
> > +	/*
> > +	 * DMA exporter should take care of cache syncs, so we can avoid
> > +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
> > +	 * we always need ->prepare() or/and ->finish() cache sync.
> > +	 */
> > +	if (q->memory == VB2_MEMORY_DMABUF) {
> > +		vb->need_cache_sync_on_finish = 0;
> > +		vb->need_cache_sync_on_prepare = 0;
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * Cache sync/invalidation flags are set by default in order to
> > +	 * preserve existing behaviour for old apps/drivers.
> > +	 */
> > +	vb->need_cache_sync_on_prepare = 1;
> > +	vb->need_cache_sync_on_finish = 1;
> > +
> > +	if (!vb2_queue_allows_cache_hints(q)) {
> > +		/*
> > +		 * Clear buffer cache flags if queue does not support user
> > +		 * space hints. That's to indicate to userspace that these
> > +		 * flags won't work.
> > +		 */
> > +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> > +		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> > +		return;
> > +	}
> 
> These two flags need to be cleared for VB2_MEMORY_DMABUF as well in the test above.
> This bug is causing v4l2-compliance failures (use the test-media script in contrib/test
> in v4l-utils: 'sudo test-media vim2m').

Sorry, Hans, do you suggest to have something like this:

	if (q->memory == VB2_MEMORY_DMABUF) {
		vb->need_cache_sync_on_finish = 0;
		vb->need_cache_sync_on_prepare = 0;
		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
		return;
	}

I didn't clear the ->flags there because we clear the vb flush/sync
flags: ->need_cache_sync_on_finish/prepare are zeros for DMABUF memory
type. Which is equivalent to passing V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
V4L2_BUF_FLAG_NO_CACHE_CLEAN. IOW we would clearing both "vb's do cache
sync" and request's "do not cache sync".

> It's enough to post a v6.1 for this patch, everything else is fine.

Thanks!

	-ss
