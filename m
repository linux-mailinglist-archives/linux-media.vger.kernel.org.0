Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACF1633F09
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 15:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbiKVOgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 09:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiKVOgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 09:36:23 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88C926AC9
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 06:36:22 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v1so24967333wrt.11
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 06:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJAX9bh44USRdwqCCs1XRembKQE+7Zn41PI7dnWPC7c=;
        b=cIyvgEbXTJlKKpJ5dS3YZLtxi9nJcf1bLVSWFgPYiWNAfO4UjcYaJulhMczfGqPe6K
         m8bS6+WO/fHS+xvAhObz2CUed/99J/g/zZJJdO3qQH4go4Nogj7z3xa/xFvpuatC5MP9
         qJ2eMHD28sUV+BMVuv547L7hpGp30MJ2QcBjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJAX9bh44USRdwqCCs1XRembKQE+7Zn41PI7dnWPC7c=;
        b=7m5h+qtYfpsQz9+ee7/jzNv48sVvG/Jqa2z3U8Vc9JrwGmvShJ4R0deStwzBWAMUkW
         R2IueLZhUu3VGRQwRh+73sbBKRNUE9CIigyGaoNG5M3hxVxCdRv6AtyAN96uWtWeYiXF
         2unweuHaiQ6ZbGZvJky2/OX744D0B1AhaO6aR7mns27lJ26FmggAd2fbjOcZ2UEWVQ5Y
         t03t544Jn+Y3cpleRRzg8a9gAMVYD15YV10LN72p2FXn5oPcZk/mOWJqhV9k0WUqWaXx
         MJQJsziQqnM5xh2+Qa07/kE7yaXX56tm9+GN0InnRNc9dYfKbvPNLD6PcmatYS3hYaUU
         krTQ==
X-Gm-Message-State: ANoB5pnB1qWfDp3jreceDuGWs7y0NLXwWSHcXAt71SOY3vxhOAhNZD8o
        X+su0ycL/VBJfY5pigg8fvpgyg==
X-Google-Smtp-Source: AA0mqf40CZNOgsBdGjKcG0OTGUB1GivriUFnhQB4elBdUJ8Ho+SYd7WuislfYUUdfraPuU4/cfTTxw==
X-Received: by 2002:a5d:6284:0:b0:236:64b1:bd30 with SMTP id k4-20020a5d6284000000b0023664b1bd30mr14342309wru.667.1669127781096;
        Tue, 22 Nov 2022 06:36:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id d9-20020adfef89000000b00241dd5de644sm4063176wro.97.2022.11.22.06.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 06:36:20 -0800 (PST)
Date:   Tue, 22 Nov 2022 15:36:18 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Stone <daniel@fooishbar.org>, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
References: <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 18, 2022 at 11:32:19AM -0800, Rob Clark wrote:
> On Thu, Nov 17, 2022 at 7:38 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> >
> > Le jeudi 17 novembre 2022 � 13:10 +0100, Christian K�nig a �crit :
> > > > > DMA-Buf let's the exporter setup the DMA addresses the importer uses to
> > > > > be able to directly decided where a certain operation should go. E.g. we
> > > > > have cases where for example a P2P write doesn't even go to memory, but
> > > > > rather a doorbell BAR to trigger another operation. Throwing in CPU
> > > > > round trips for explicit ownership transfer completely breaks that
> > > > > concept.
> > > > It sounds like we should have a dma_dev_is_coherent_with_dev() which
> > > > accepts two (or an array?) of devices and tells the caller whether the
> > > > devices need explicit ownership transfer.
> > >
> > > No, exactly that's the concept I'm pushing back on very hard here.
> > >
> > > In other words explicit ownership transfer is not something we would
> > > want as requirement in the framework, cause otherwise we break tons of
> > > use cases which require concurrent access to the underlying buffer.
> >
> > I'm not pushing for this solution, but really felt the need to correct you here.
> > I have quite some experience with ownership transfer mechanism, as this is how
> > GStreamer framework works since 2000. Concurrent access is a really common use
> > cases and it is quite well defined in that context. The bracketing system (in
> > this case called map() unmap(), with flag stating the usage intention like reads
> > and write) is combined the the refcount. The basic rules are simple:
> 
> This is all CPU oriented, I think Christian is talking about the case
> where ownership transfer happens without CPU involvement, such as via
> GPU waiting on a fence

Yeah for pure device2device handover the rule pretty much has to be that
any coherency management that needs to be done must be done from the
device side (flushing device side caches and stuff like that) only. But
under the assumption that _all_ cpu side management has been done already
before the first device access started.

And then the map/unmap respectively begin/end_cpu_access can be used what
it was meant for with cpu side invalidation/flushing and stuff like that,
while having pretty clear handover/ownership rules and hopefully not doing
no unecessary flushes. And all that while allowing device acces to be
pipelined. Worst case the exporter has to insert some pipelined cache
flushes as a dma_fence pipelined work of its own between the device access
when moving from one device to the other. That last part sucks a bit right
now, because we don't have any dma_buf_attachment method which does this
syncing without recreating the mapping, but in reality this is solved by
caching mappings in the exporter (well dma-buf layer) nowadays.

True concurrent access like vk/compute expects is still a model that
dma-buf needs to support on top, but that's a special case and pretty much
needs hw that supports such concurrent access without explicit handover
and fencing.

Aside from some historical accidents and still a few warts, I do think
dma-buf does support both of these models. Of course in the case of
gpu/drm drivers, userspace must know whats possible and act accordingly,
otherwise you just get to keep all the pieces.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
