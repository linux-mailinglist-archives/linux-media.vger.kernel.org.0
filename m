Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8721282141
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 18:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbfHEQHp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 5 Aug 2019 12:07:45 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:63932 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728401AbfHEQHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 12:07:45 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17894862-1500050 
        for multiple; Mon, 05 Aug 2019 17:07:43 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <20190805154554.3476-5-christian.koenig@amd.com>
In-Reply-To: <20190805154554.3476-5-christian.koenig@amd.com>
Message-ID: <156502126144.28464.11399426968315988701@skylake-alporthouse-com>
Subject: Re: [PATCH 5/5] dma-buf: nuke reservation_object seq number
Date:   Mon, 05 Aug 2019 17:07:41 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-05 16:45:54)
> @@ -214,16 +214,16 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>                 return 0;
>  
>  retry:
> -       seq = read_seqcount_begin(&resv->seq);
>         rcu_read_lock();
>  
> +       fence_excl = rcu_dereference(resv->fence_excl);
>         fobj = rcu_dereference(resv->fence);
>         if (fobj)
>                 shared_count = fobj->shared_count;
>         else
>                 shared_count = 0;
> -       fence_excl = rcu_dereference(resv->fence_excl);
> -       if (read_seqcount_retry(&resv->seq, seq)) {
> +
> +       if (rcu_dereference(resv->fence_excl) != fence_excl) {

If I remember my rules correctly, rcu_dereference is a
read-data-depends, which only means that a read through the pointer
returned by rcu_dereference() is after the retrieval of that pointer.
Nothing orders the retrieval of fence_excl vs shared_count (different
pointers), so I think the last line should be:

smp_rmb();
if (rcu_access_pointer(resv->fence_excl) != fence_excl)
-Chris
