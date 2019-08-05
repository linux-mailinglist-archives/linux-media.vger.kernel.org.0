Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33E1B820F7
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbfHEP7G convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 5 Aug 2019 11:59:06 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:55682 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726559AbfHEP7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 11:59:06 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17894656-1500050 
        for multiple; Mon, 05 Aug 2019 16:58:58 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
Message-ID: <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
Subject: Re: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
Date:   Mon, 05 Aug 2019 16:58:56 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-05 16:45:50)
> The reservation object should be capable of handling its internal memory
> management itself. And since we search for a free slot to add the fence
> from the beginning this is actually a waste of time and only minimal helpful.

"From the beginning?" Attempting to prune signaled fences on insertion is
quite recent.

However, that doesn't help the cases where reservation_object keeps on
holding a reference to the fences for idle objects. It's an absolute
nightmare of a reference trap.
-Chris
