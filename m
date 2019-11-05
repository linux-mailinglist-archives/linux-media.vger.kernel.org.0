Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C19EFEE9
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 14:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389002AbfKENqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 08:46:14 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:53400 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388615AbfKENqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 08:46:13 -0500
Received: by mail-wm1-f43.google.com with SMTP id x4so9830447wmi.3
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2019 05:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MTEfglnTSPOhC45PLjE/oQ5m/qtok/s9NBFw64ev4Tg=;
        b=JkxN3NX/Q/mYJ7uS9k72G1xJnPrVQCbORQEGOPOaxg8VYPUgh+Heqx7wvHjpbdd+vH
         k+iDvq4qHrs4DEJ6MRZ6ZSa/LQKXvVC9gnLdwANs4/7XxnK09qzrwLrsMMAgKnn4RWwp
         w0V8nK2w8vZz704uBY+mQMKEAQtM5t7mNJrVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=MTEfglnTSPOhC45PLjE/oQ5m/qtok/s9NBFw64ev4Tg=;
        b=CCzuXmASqQifb7q3zu3UhmM7Wh9cB7wkevlbUK4dY3Tg6nqYNV0z+6i3GyB2ayKoCb
         DsCBItDG1pmc20ypUk/2/2CqmR2okFsSDh48OS3vgSqzKuEk8xHeT08SWoTbDubqEvv+
         6AN0GKvgWNPuf6EREzzNvjR36vU72xkFnPEgTJ6N+2ZM1yiVGur+lndZwU0CQ/4REkn1
         UP2cgQXb2DbpQADOv11TqGZOkW0QNYyVCPBWQVwlHVxSoZSJcyI+PzboZOrpYhnWWh7G
         vFtTY5hoKLVs8uVW8ui5TM9ycaV5h/48+tGRzAd/8aHIvUh2pBod53nUVY7cgHLi8Iok
         f31Q==
X-Gm-Message-State: APjAAAWUdBeGQrlisdu8rmnnWSCztuUaQjMkND//jKu1/bDo2YewyKTX
        rudIHAWEa/KvpBlQmsCb/h/CDg==
X-Google-Smtp-Source: APXvYqz7y9qIdqhlIZZBhrBaFPpsX027Pw6oBBeZ9j2OgSp2zdJ+KhDDv6C+1Aqxvubb3RgKypWyPw==
X-Received: by 2002:a1c:64d6:: with SMTP id y205mr3981508wmb.136.1572961570525;
        Tue, 05 Nov 2019 05:46:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id s21sm29846720wrb.31.2019.11.05.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 05:46:09 -0800 (PST)
Date:   Tue, 5 Nov 2019 14:46:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: RFC: Unpinned DMA-buf handling
Message-ID: <20191105134607.GH10326@phenom.ffwll.local>
References: <20191029104049.9011-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029104049.9011-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 29, 2019 at 11:40:44AM +0100, Christian König wrote:
> The basic idea stayed the same since the last version of those patches.
> The exporter can provide explicit pin/unpin functions and the importer a
> move_notify callback. This allows us to avoid pinning buffers while
> importers have a mapping for them.
> 
> In difference to the last version the locking changes were separated
> from this patchset and committed to drm-misc-next.
> 
> This allows drivers to implement the new locking semantics without the
> extra unpinned handling, but of course the changed locking semantics is
> still a prerequisite to the unpinned handling.
> 
> The last time this set was send out the discussion ended by questioning
> if the move_notify callback was really the right approach of notifying
> the importers that a buffer is about to change its placement. A possible
> alternative would be to add a special crafted fence object instead.
> 
> Let's discuss on the different approaches once more,

So here's my pile of higher-level thoughts on things still to discuss. I
don't think we need a code-answer for all of these, but at least a rough
idea to make sure we're not walling ourselves into a corner.

- The entire eviction fence stuff amdkfd does. It is kinda a very special
  version of ->move_notify, except it's also passing around an active bit
  for an entire set of buffers in an efficient way. This active bit works
  for amdkfd where we evict the entire context (logically at least, ofc
  all the unevicted buffers and their pagetables stay). I don't  think
  it'll work of a more traditional execbuf driver.

  I think we need some way to move lru/active information between drivers
  that works. Including making sure that drivers don't spend all the time
  walking over all the active buffers in their lru first, but also not
  burning down too much cpu time. So either lazy lru updates, or some bulk
  move thing, or something else. Or alternatively we spec out explicitly
  that lru updates will _not_ happen across drivers, and that drivers need
  to lru-bump buffers while evicting when they notice they're still busy
  (so some kind of lazy lru update).

- How will we handle the acquire ctx? Sooner or later I expect that when
  an importer calls into the exporter to validate the buffers we need to
  to have something like what you added as a stall point in ttm in

  commit d367bd2a5e2b12cb9135b30df94af8211196e8cf
  Author: Christian König <christian.koenig@amd.com>
  Date:   Wed May 22 09:51:47 2019 +0200

      drm/ttm: fix busy memory to fail other user v10

  Now we can do the same trick you've done of fishing out the acquire ctx
  from the buffer we're trying to get validated, instead of an explicit
  parameter to dma_buf_map_attachment. But the other change is that
  callers need to be able to handle EDEADLCK, and that's a huge one. I'm
  leaning towards requiring EDEADLCK handling for dynamic importers from
  the go, using the fake deadlck injection debug knob to enforce it.
  Explicit argument would be nice, but oh well.

- Related, we need to have an idea for how we should handle the TODO
  comment in ttm_mem_evict_wait_busy across drivers. Other drivers might
  hang onto a lot of buffers they don't really need, simply because they
  evicted them and kept them locked (i915 very likely will do that).

  This is one of the questions I don't think we need to solve right away,
  but good to have a solution in mind. I think a dma_resv->can_evict flag,
  which allows the lru evict code to throw out locked buffers (only locked
  by our own ctx ofc) would solve this. But not 100% sure. Also making it
  can_evict would make it opt-in as an optimization.

- ->move_notify needs to guarantee that all access stops, or we have a
  huge leak between security domains. I think there's three ways to do
  that:

  - Preempt the entire context right away. This is what amdkfd does
    (except with the eviction fence, not the move_notify callback). Then
    when you reschedule the context make sure all the pagetables are up to
    date again.

  - Synchronously punch out the pagetables in ->notify_move, and let
    gpu-side page faulting handle the fallout. Not sure anyone is doing
    that right now, but we at least discussed that as an idea here at
    intel.

  - Add an async pagetable update job, which has the current latest job as
    a dependency, and adds a new fence to the dma_resv object to signal
    when the pagetables are updated. This would all be scheduled from the
    ->notify_move callback, so would need to make sure this is officially
    allowed.

  If we don't have any of these then some later batch (which didn't
  declare it's going to need the buffer we've evicted) could access
  whatever new buffer has been placed at the same locations through the
  old pagetables.

  I did try to figure out how you solve this in amdgpu right now, but for
  normal CS ioctl the only pagetable update code I could find was in the
  cs ioctl itself. That's too late I think.

- Related to the above, and since I think the ttm hack to privatize the
  resv_object to avoid unecessary stalls: I think a last_acces fence on
  the attachment would be really nice. That way a driver could make sure
  it's only blocking on its own stuff and not on stuff another gpu is
  doing. But not sure it makes sense to have that in dma-buf structures,
  drivers can just track this on their own (and ttm would need a big
  overhaul since right now it totally ignores that there might be multiple
  mappings of the same underlying buffer object, that's all left to
  drivers to wrangle).

- Finally, we need to spell out the semantics of when you need to call
  dma_buf_attachment_unmap after a notify_move. I'm kinda leaning towards
  that you first need to unmap the old mapping, before you create a new
  one. But that might be too tough to implement for drivers, and result in
  stalls. So probably we need multiple mappings, and then we need to make
  it clear whether you can do that on the same attachment, or whether you
  need to do something else. Either way this must be really really clear.

I think the above is all the big questions from the past few discussion
rounds that we still have.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
