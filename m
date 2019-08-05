Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1AD382335
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 18:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbfHEQyY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 5 Aug 2019 12:54:24 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:59119 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726779AbfHEQyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 12:54:24 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17895348-1500050 
        for multiple; Mon, 05 Aug 2019 17:54:21 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
In-Reply-To: <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
Message-ID: <156502405985.28464.7514823669359337891@skylake-alporthouse-com>
Subject: Re: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
Date:   Mon, 05 Aug 2019 17:54:19 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Chris Wilson (2019-08-05 16:58:56)
> Quoting Christian König (2019-08-05 16:45:50)
> > The reservation object should be capable of handling its internal memory
> > management itself. And since we search for a free slot to add the fence
> > from the beginning this is actually a waste of time and only minimal helpful.
> 
> "From the beginning?" Attempting to prune signaled fences on insertion is
> quite recent.
> 
> However, that doesn't help the cases where reservation_object keeps on
> holding a reference to the fences for idle objects. It's an absolute
> nightmare of a reference trap.

Fwiw, it's a pet peeve, and not a fundamental object to removing some
loops inside reservation_object. Here, the seqno is being used as a
guide to avoid trying to take the lock if it's been externally modified,
but it would equally work with just a plain trylock + test_rcu.

Better yet would be autopruning, but that suggests a slightly different
data structure an rbtree instead of an array and spinlocked cb_list
manipulation instead of a plain refcount.
-Chris
