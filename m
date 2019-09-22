Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36DBBA2B6
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 14:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfIVMuU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 22 Sep 2019 08:50:20 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:53658 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728854AbfIVMuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 08:50:20 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18576431-1500050 
        for multiple; Sun, 22 Sep 2019 13:50:19 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
Cc:     lima@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Qiang Yu <yuq825@gmail.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org
References: <20190922074900.853-1-yuq825@gmail.com>
 <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
Message-ID: <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
Date:   Sun, 22 Sep 2019 13:50:15 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Chris Wilson (2019-09-22 13:17:19)
> Quoting Qiang Yu (2019-09-22 08:49:00)
> > This causes kernel crash when testing lima driver.
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Fixes: b8c036dfc66f ("dma-buf: simplify reservation_object_get_fences_rcu a bit")
> > Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > ---
> >  drivers/dma-buf/dma-resv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 42a8f3f11681..709002515550 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -471,7 +471,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
> >         if (pfence_excl)
> >                 *pfence_excl = fence_excl;
> >         else if (fence_excl)
> > -               shared[++shared_count] = fence_excl;
> > +               shared[shared_count++] = fence_excl;
> 
> Oops.
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Applied, thanks for the fix.
-Chris
