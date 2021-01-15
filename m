Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9482F7446
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 09:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbhAOI0c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 15 Jan 2021 03:26:32 -0500
Received: from mail.fireflyinternet.com ([77.68.26.236]:65168 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726004AbhAOI0c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 03:26:32 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 23602727-1500050 
        for multiple; Fri, 15 Jan 2021 08:25:47 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <YAATPMc+1jmhxnsF@phenom.ffwll.local>
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch> <161055261490.6195.7986280621869334351@build.alporthouse.com> <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com> <161057213487.6195.581396740566956696@build.alporthouse.com> <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com> <161061619887.19482.10606780107376365239@build.alporthouse.com> <CAKMK7uE58dJabnaTNgePTyio_JY3=kvFZtu1RT1eFeGDK76ZeA@mail.gmail.com> <161061753732.19482.13146900597152116822@build.alporthouse.com> <YAATPMc+1jmhxnsF@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        DMA BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 15 Jan 2021 08:25:46 +0000
Message-ID: <161069914606.19482.1823329746575120144@build.alporthouse.com>
User-Agent: alot/0.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Vetter (2021-01-14 09:47:40)
> On Thu, Jan 14, 2021 at 09:45:37AM +0000, Chris Wilson wrote:
> > Quoting Daniel Vetter (2021-01-14 09:30:32)
> > > On Thu, Jan 14, 2021 at 10:23 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > > The only other problem I see with the implementation is that there's
> > > > nothing that says that each dmabuf->ops->map_dma_buf() returns a new
> > > > sg_table, so we may end up undoing the xor. Or should each dma-buf
> > > > return a fresh dma-mapping for iommu isolation?
> > > 
> > > Maybe I screwed it up, but that's why I extracted the little helpers:
> > > We scramble when we get the sgtable from exporter, and unscramble
> > > before we pass it back. dma-buf.c does some caching and will hand back
> > > the same sgtable, but for that case we don't re-scramble.
> > 
> > The attachment is only mapped once, but there can be more than one
> > attachment, and the backend could return the same sg_table for each
> > mapping. Conceivably, it could return its own private sg_table where it
> > wants to maintain the struct page. Seems like just adding a sentence to
> > @map_dma_buf to clarify that each call should return a new sg_table will
> > suffice.
> 
> Ah yes good point, will augment (once CI stops being angry at me).

Fwiw, with a quick explanation of "don't do this" in the docs,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
