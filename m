Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459A016EC6D
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 18:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731238AbgBYRYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 12:24:02 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40186 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729939AbgBYRYC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 12:24:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id t3so15696325wru.7
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q0WzriZsFeVLIxkq9afAMphlm+5DTXv3n7yz9mov8+A=;
        b=Hmc6WuL00hZv2jb8Vwl1vSwrvg91tQManOHfCkd47lj3Hf7LWjepSA6LmQVFeJjWMA
         nacoG8L9c4rboXqrEFgbUYFPSyzQbUzBMH7cJlMPwmq7XD7/E+oqLBbIk++jg/UpKYhh
         XJf0dBgQn3ZPUBx6aOohEqq+LubuadGkEk2CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=Q0WzriZsFeVLIxkq9afAMphlm+5DTXv3n7yz9mov8+A=;
        b=MtDcGyOFXig/h5KGyOlW9LV1gcUVcimqrEiWZTN7h0tDRW1d4AzheZ0aSMDXoFjT61
         sCYURuEMxJ+g1wt3Fqbesyi7HT4RxRhuTt1EzvrEPSxOjvBmUubqpk1/SYnAi4J1sMYU
         DcYHIsJX+iSEC1I4JVVXuBibYelTLxTC/W9PHeeq3n2rpOxuperBAEgHZE9hdIq2GiZe
         kLbtE5QGjQP1/8IehlI0KUbVAUTgo06jywJZrq/yc5Uf32BuxRF/6uvIsge98I5+FYnD
         J40ZP4bIOa2pAj1TUTvNqSd8Ve1t+B1MR98dsR6cgeCZFML7oZhDAQ3EE5kLHIFKSMEZ
         40lA==
X-Gm-Message-State: APjAAAUPh6+NEObUr4NEFkMmtpZ1NcIgbrXtyCQsFrrBAvrtumvv7hsb
        PS2P9OBYWldoy0nye5/dclHF+VuXXuU=
X-Google-Smtp-Source: APXvYqyueg8icESGjchlrOzRrpEI++U3QqkMRcs7pu5XOQQNwkG3Qkqb4n0mrz6qn+aH/BHeXNmz5A==
X-Received: by 2002:adf:f6d0:: with SMTP id y16mr221613wrp.140.1582651437912;
        Tue, 25 Feb 2020 09:23:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z133sm5020423wmb.7.2020.02.25.09.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:23:57 -0800 (PST)
Date:   Tue, 25 Feb 2020 18:23:55 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
Message-ID: <20200225172355.GO2363188@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 23, 2020 at 01:04:15PM +0100, Christian König wrote:
> Am 23.02.20 um 12:56 schrieb Pan, Xinhui:
> > If shared fence list is not empty, even we want to test all fences, excl fence is ignored.
> > That is abviously wrong, so fix it.
> 
> Yeah that is a known issue and I completely agree with you, but other
> disagree.
> 
> See the shared fences are meant to depend on the exclusive fence. So all
> shared fences must finish only after the exclusive one has finished as well.
> 
> The problem now is that for error handling this isn't necessary true. In
> other words when a shared fence completes with an error it is perfectly
> possible that he does this before the exclusive fence is finished.
> 
> I'm trying to convince Daniel that this is a problem for years :)

I thought the consensus is that reasonable gpu schedulers and gpu reset
code should try to make really, really sure it only completes stuff in
sequence? That's at least my take away from the syncobj timeline
discussion, where you convinced me we shouldn't just crash&burn.

I think as long as your scheduler is competent and your gpu reset tries to
limit damage (i.e. kill offending ctx terminally, mark everything else
that didn't complete for re-running) we should end up with everything
completing in sequence. I guess if you do kill a lot more stuff, then
you'd have to push these through your scheduler as dummy jobs, i.e. they
still wait for their dependencies, but then all they do is set the
dma_fence error and complete it. Maybe something the common scheduler
could do.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> > ---
> >   drivers/dma-buf/dma-resv.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 4264e64788c4..44dc64c547c6 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -632,14 +632,14 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
> >    */
> >   bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
> >   {
> > -	unsigned seq, shared_count;
> > +	unsigned int seq, shared_count, left;
> >   	int ret;
> >   	rcu_read_lock();
> >   retry:
> >   	ret = true;
> >   	shared_count = 0;
> > -	seq = read_seqcount_begin(&obj->seq);
> > +	left = seq = read_seqcount_begin(&obj->seq);
> >   	if (test_all) {
> >   		unsigned i;
> > @@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
> >   		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
> >   		if (fobj)
> > -			shared_count = fobj->shared_count;
> > +			left = shared_count = fobj->shared_count;
> >   		for (i = 0; i < shared_count; ++i) {
> >   			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
> > @@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
> >   				goto retry;
> >   			else if (!ret)
> >   				break;
> > +			left--;
> >   		}
> >   		if (read_seqcount_retry(&obj->seq, seq))
> >   			goto retry;
> >   	}
> > -	if (!shared_count) {
> > +	if (!left) {
> >   		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
> >   		if (fence_excl) {
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
