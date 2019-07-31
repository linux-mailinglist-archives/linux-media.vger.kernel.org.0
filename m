Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6D17C430
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 15:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbfGaN6N convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 31 Jul 2019 09:58:13 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:60942 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726115AbfGaN6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 09:58:13 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17760809-1500050 
        for multiple; Wed, 31 Jul 2019 14:58:09 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
References: <20190731113853.51779-1-christian.koenig@amd.com>
 <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
 <6421ea80-2bdd-7f63-1cba-9c57157f3946@gmail.com>
In-Reply-To: <6421ea80-2bdd-7f63-1cba-9c57157f3946@gmail.com>
Message-ID: <156458148806.15787.4157473890441039515@skylake-alporthouse-com>
Subject: Re: [PATCH] dma-buf: add more reservation object locking wrappers
Date:   Wed, 31 Jul 2019 14:58:08 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-07-31 14:34:28)
> Am 31.07.19 um 14:33 schrieb Chris Wilson:
> > Quoting Christian König (2019-07-31 12:38:53)
> >> Complete the abstraction of the ww_mutex inside the reservation object.
> >>
> >> This allows us to add more handling and debugging to the reservation
> >> object in the future.
> >>
> >> Signed-off-by: Christian König <christian.koenig@amd.com>
> > Looks entirely mechanical,
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> >
> > Quietly opines for s/reservation_object/dma_reservation/
> 
> I was thinking about that as well because "reservation_object" is just a 
> rather long name and not very descriptive.
> 
> But I'm not sure if dma_reservation fits either. How about something 
> like dma_cntrl?

Reservation kind of works because of historical usage, but is itself
rather long. Control doesn't mean much to me. dma_sequence? Maybe just
dma_syncpt, as the snapshot of fences is itself a fence /
synchronisation point. Though that is at odds with other usage of
syncpt, we have an unordered collection of fences across multiple
timelines, as opposed to a single point along a timeline.

Fwiw, we use i915_active for the similar purpose of tracking the active
collection of fences, so maybe dma_active?
-Chris
