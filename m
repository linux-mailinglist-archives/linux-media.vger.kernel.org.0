Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0A53D374A
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbhGWIVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhGWIVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:21:30 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A94C061757
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 02:02:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a6so814459edv.11
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H20rashoP0PI/4mcAWWqkgsc6ouNdbHg+NJZNqP1JDM=;
        b=lVm33/5j21ACNJPF/VGWVWV868PDs09n4VxTQvOBtV2a914nW69TcdhZ5QAkSUAYpU
         bgqR6uSdVVWgsSW/mR+NM835LaGlbzXkhz6KuLuevVTdwKB1Zy7LJlCfaNIrjIhywHZF
         IGZ2DRjnhEcZKePaCZRBaDMn2c0KwZuSEDY98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=H20rashoP0PI/4mcAWWqkgsc6ouNdbHg+NJZNqP1JDM=;
        b=IT0r1qpEzfZcI1qGFrDYoHTIEKVHtqPe0X6NsMjokCftrsVmPp7ODf888kTTNXASeD
         OoD6zXeZ/LRWMocG3t6rqUKYp+NBUzokGKQ3TB1hkIZJfFDLs0Oct/inl440su0m4X76
         8pMR3ef5CR0l3tyirz4Agg+DUSS4FIEMq1tvi53n87qoti6Td2v8Qc/S99eAk8s6O4gp
         Efx0USivDwrHM4lCPZuAZBayDEmc2py8euS2twzhEIdZYI0tT0mjYjFN96WZA7VjhLg2
         N7/KEHHdSkmP2Zj811NN8df982yR3E8XRHrHpCWU9poRs3VVz/dNva9id8Rfsalc8KXx
         +tng==
X-Gm-Message-State: AOAM531CAtMz7tnVO1fUZAs2+PzKzHVWth08lLnNMvoT+Dv2CrDxhAbt
        ADwQjw99Dji1Vfu6G9p8fTNC7Q==
X-Google-Smtp-Source: ABdhPJyyEFO9yMTykjx6W9MKiufO2hGuxigcLPb1ZDBRgh4QiUsdniUA57nRfgeuJaGqgIAPLTP0Bg==
X-Received: by 2002:aa7:c907:: with SMTP id b7mr4334018edt.148.1627030922700;
        Fri, 23 Jul 2021 02:02:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b25sm13846456edv.9.2021.07.23.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:02:02 -0700 (PDT)
Date:   Fri, 23 Jul 2021 11:02:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf/poll: Get a file reference for outstanding fence
 callbacks
Message-ID: <YPqFiPftjTUV4361@phenom.ffwll.local>
Mail-Followup-To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20210723075857.4065-1-michel@daenzer.net>
 <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
 <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 23, 2021 at 10:19:49AM +0200, Michel Dänzer wrote:
> On 2021-07-23 10:04 a.m., Christian König wrote:
> > Am 23.07.21 um 09:58 schrieb Michel Dänzer:
> >> From: Michel Dänzer <mdaenzer@redhat.com>
> >>
> >> This makes sure we don't hit the
> >>
> >>     BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>
> >> in dma_buf_release, which could be triggered by user space closing the
> >> dma-buf file description while there are outstanding fence callbacks
> >> from dma_buf_poll.
> > 
> > I was also wondering the same thing while working on this, but then thought that the poll interface would take care of this.
> 
> I was able to hit the BUG_ON with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 .

igt test would be really lovely. Maybe base something off the
import/export igts from Jason?
-Daniel

> 
> 
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> >> ---
> >>   drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
> >>   1 file changed, 12 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index 6c520c9bd93c..ec25498a971f 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
> >>       BUG_ON(dmabuf->vmapping_counter);
> >>         /*
> >> -     * Any fences that a dma-buf poll can wait on should be signaled
> >> -     * before releasing dma-buf. This is the responsibility of each
> >> -     * driver that uses the reservation objects.
> >> -     *
> >> -     * If you hit this BUG() it means someone dropped their ref to the
> >> -     * dma-buf while still having pending operation to the buffer.
> >> +     * If you hit this BUG() it could mean:
> >> +     * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
> >> +     * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
> >>        */
> >>       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>   @@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
> >>   static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >>   {
> >>       struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
> >> +    struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
> >>       unsigned long flags;
> >>         spin_lock_irqsave(&dcb->poll->lock, flags);
> >> @@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >>       dcb->active = 0;
> >>       spin_unlock_irqrestore(&dcb->poll->lock, flags);
> >>       dma_fence_put(fence);
> >> +    /* Paired with get_file in dma_buf_poll */
> >> +    fput(dmabuf->file);
> > 
> > Is calling fput() in interrupt context ok? IIRC that could potentially sleep.
> 
> Looks fine AFAICT: It has
> 
> 		if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
> 
> and as a fallback for that, it adds the file to a lock-less delayed_fput_list which is processed by a workqueue.
> 
> 
> -- 
> Earthling Michel Dänzer               |               https://redhat.com
> Libre software enthusiast             |             Mesa and X developer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
