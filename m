Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C271F3D3C1E
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 17:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235468AbhGWOUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 10:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbhGWOUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 10:20:48 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAA3C061757
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 08:01:20 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n11so996963wmd.2
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w9v+4s7/P2Cg+QjJMoNBlGX2Ekj8q+TMc1efLZ/J8+4=;
        b=fj7JYwQb2WhybJAUx4rfOc25+s+QNn44GNfoxzaxvvv+Pb3suvS7pBkfDBusZwXXlf
         m2ohNk1UieUIgdG4WzCnhOgYhZQUxbWqMI912foPZDh3S/Xyz1xqNn42hbT6j9xpiyaK
         YtEu8H9SIRKgSAtAIMM9wzpHYJE1pq6x0zKXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=w9v+4s7/P2Cg+QjJMoNBlGX2Ekj8q+TMc1efLZ/J8+4=;
        b=gJvGdwl76p+SbJSLV85LJzRawvBrtX2kTxif+q2lSzaRnjx2/Fi88758ARbFiXMHit
         HrgWDJ9BzcrlMUKuYvLgL+qY0YVkO1FR4dWLhpT+l/U4p2L4lln+gzFiSjImQ33nyK6R
         DAFbz6FxDIIfiI1YHVr5YvoOm7Xq3WJsx+XLWukNKx3q9Nd40xSgXG4TVMPHFT2OUsxe
         h6VG9Ti3XkCovRfrasGP6agoWWBmeStttgRCh7lHf+4i2FEKnxZpjZkzzmVqe6hP6U8r
         9i/ndkXgS3FiyW01aT+d9+SND+KgCBZ1mWHSxk0NJB0VFGwHiKzlLr3qGGwCoYI8vmng
         S/hw==
X-Gm-Message-State: AOAM531XAk5wsZVuc2uPI13+cLSoGJR7cbPg/AkRC55qi2dkLshjjymR
        29Ff8WbmtlFe9IipX6E23pthGQ==
X-Google-Smtp-Source: ABdhPJxAhoY4SO+Rljt8tSjDfVfejZCTQg8CZQ/u7VOQRIgpa+QXhopteYV2nXJ0mUMxsKF9l0l34Q==
X-Received: by 2002:a05:600c:21cd:: with SMTP id x13mr5151839wmj.12.1627052479277;
        Fri, 23 Jul 2021 08:01:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b6sm5468873wmj.34.2021.07.23.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 08:01:18 -0700 (PDT)
Date:   Fri, 23 Jul 2021 17:01:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Charan Teja Reddy <charante@codeaurora.org>,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        vinmenon@codeaurora.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: WARN on dmabuf release with pending attachments
Message-ID: <YPrZvM8BI7VO8xQk@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Charan Teja Reddy <charante@codeaurora.org>,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        vinmenon@codeaurora.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <1627043468-16381-1-git-send-email-charante@codeaurora.org>
 <b057b0fe-75ae-d872-f500-a307543d8233@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b057b0fe-75ae-d872-f500-a307543d8233@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 23, 2021 at 02:34:13PM +0200, Christian König wrote:
> Am 23.07.21 um 14:31 schrieb Charan Teja Reddy:
> > It is expected from the clients to follow the below steps on an imported
> > dmabuf fd:
> > a) dmabuf = dma_buf_get(fd) // Get the dmabuf from fd
> > b) dma_buf_attach(dmabuf); // Clients attach to the dmabuf
> >     o Here the kernel does some slab allocations, say for
> > dma_buf_attachment and may be some other slab allocation in the
> > dmabuf->ops->attach().
> > c) Client may need to do dma_buf_map_attachment().
> > d) Accordingly dma_buf_unmap_attachment() should be called.
> > e) dma_buf_detach () // Clients detach to the dmabuf.
> >     o Here the slab allocations made in b) are freed.
> > f) dma_buf_put(dmabuf) // Can free the dmabuf if it is the last
> > reference.
> > 
> > Now say an erroneous client failed at step c) above thus it directly
> > called dma_buf_put(), step f) above. Considering that it may be the last
> > reference to the dmabuf, buffer will be freed with pending attachments
> > left to the dmabuf which can show up as the 'memory leak'. This should
> > at least be reported as the WARN().
> > 
> > Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
> 
> Good idea. I would expect a crash immediately, but from such a backtrace it
> is quite hard to tell what the problem is.
> 
> Patch is Reviewed-by: Christian König <christian.koenig@amd.com> and I'm
> going to push this to drm-misc-next on Monday if nobody objects.

The boom only happens a lot later when the offending import uses the
attachment again. This here has a good chance to catch that early
drm_buf_put(), so I think it's a good improvement. We'll still Oops later
on ofc, but meh.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks,
> Christian.
> 
> > ---
> >   drivers/dma-buf/dma-buf.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 511fe0d..733c8b1 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -79,6 +79,7 @@ static void dma_buf_release(struct dentry *dentry)
> >   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> >   		dma_resv_fini(dmabuf->resv);
> > +	WARN_ON(!list_empty(&dmabuf->attachments));
> >   	module_put(dmabuf->owner);
> >   	kfree(dmabuf->name);
> >   	kfree(dmabuf);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
