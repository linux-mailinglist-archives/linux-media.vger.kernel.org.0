Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342042D6BF4
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 00:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390800AbgLJXcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 18:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389466AbgLJXbj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 18:31:39 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E0FC0613D3;
        Thu, 10 Dec 2020 15:30:59 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t37so5774001pga.7;
        Thu, 10 Dec 2020 15:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DxIVSUX2H6bimNutMDtAzIsDtpsebc1xO6PGsZ2Pwhk=;
        b=GLRkf6JQL1ptO05KUdb29Wdoj51vQzqeflF1WXIJFrnJiwxWUSO6LD5UW/dQri2ULl
         7QOrSSeGEpb68pcn9L/fFd7hRoRiQmwg8YgLf8weoubgjcOYqqNfrBP7As0weMoHsLb2
         Zeqzs1Nx4Ah8yomvfrQovm/gEB2hH8COhGfUw5mePmVVZHlDl5VB9aEWYON4en+DoZNT
         ucf2LpDwtCCrDkkDUAnzEXyFHS9+g6RjvwNliWU4NjPEiWvamrvarJsaCapXe5qDkMW2
         L5RBqKjX91B0sL0cgHvra3sfXHRhGTBpdfZjvcXf8y94yWyoX2I4Eg9FF7HsRrDbHGlb
         8Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=DxIVSUX2H6bimNutMDtAzIsDtpsebc1xO6PGsZ2Pwhk=;
        b=ZnCiRPP7TOrCOGdN4Qv4Ohsu601uaeIRY8WNR3AZXjukhIcKX8ZGkLWVjyE9uyH+fv
         ePSa4lAQQ6X2X1vNNylQB/vPq48FPQ4LCGhlCZklSWV5QP/mbFGCVGMMg4MSEWrSvrxr
         iQk9Q+7gB9jCy/exd6VOPZ4tP17ajTjjJ1t3Dw7MEeCeCbqKwH73T3YKh+5k425qQ3/r
         4tEyDsz0aiF+TrtpMw+biKoyfSIScrKFVJ//+zOnEm8Mo4n8PANKCdbcbwyPldNHW+Ba
         590cp++jUKFqSsdTEXg5o7DWDRfqehrOYOQQG9Cf14TnEJU1wlr5pv80KoiLe5xkUOEt
         UZig==
X-Gm-Message-State: AOAM532TXtH2rKQ+g9mCynahIGj3W/s+uASwil+Ypy8tfLXUjHljuyNO
        Hdp9xwUj9R24nHg1UVM1RZM=
X-Google-Smtp-Source: ABdhPJzQ34O5574nawCtthvGcN4o4HywTqDu4/7/e/5QfeGCNPMRhSxX4RTQEVQMyXAdO/WoAlfGnw==
X-Received: by 2002:a62:19ca:0:b029:19d:cd0d:af83 with SMTP id 193-20020a6219ca0000b029019dcd0daf83mr9006284pfz.51.1607643058804;
        Thu, 10 Dec 2020 15:30:58 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id e24sm5119240pjt.16.2020.12.10.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 15:30:57 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 10 Dec 2020 15:30:54 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Hyesoo Yu <hyesoo.yu@samsung.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Matthew Wilcox <willy@infradead.org>, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
Message-ID: <X9KvruEuDsuuqlfA@google.com>
References: <20201117181935.3613581-1-minchan@kernel.org>
 <20201117181935.3613581-5-minchan@kernel.org>
 <CGME20201118030110epcas2p1105a09711ea2c123f19f413b32372764@epcas2p1.samsung.com>
 <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
 <20201119011431.GA136599@KEI>
 <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
 <X9Fjd+eSStUJskOV@google.com>
 <CALAqxLWthd8bEDRMWmuOf8dOCW8=cFao9HBawKGuRhQZkdgXXw@mail.gmail.com>
 <X9JHjPTdxv6Z7lCW@google.com>
 <CALAqxLVz5bCYxehjVtCJ5eEJ-Wz81=fe30sqRtYtZpXWMkXZiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLVz5bCYxehjVtCJ5eEJ-Wz81=fe30sqRtYtZpXWMkXZiw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 02:40:38PM -0800, John Stultz wrote:
> On Thu, Dec 10, 2020 at 8:06 AM Minchan Kim <minchan@kernel.org> wrote:
> > On Thu, Dec 10, 2020 at 12:15:15AM -0800, John Stultz wrote:
> > > Well, while I agree that conceptually the dmabuf heaps allow for
> > > allocations for multi-device pipelines, and thus are not tied to
> > > specific devices. I do think that the memory types exposed are likely
> > > to have specific devices/drivers in the pipeline that it matters most
> > > to. So I don't see a big issue with the in-kernel driver registering a
> > > specific CMA region as a dmabuf heap.
> >
> > Then, I am worry about that we spread out dma_heap_add_cma to too many
> > drivers since kernel doesn't how userspace will use it.
> > For example, system 1 could have device A-B-C pipeline so they added
> > it A driver. After that, system 2 could have device B-C-D pipeline
> > so they add dma_heap_add_cma into B device.
> 
> I'm not sure I see this as a major issue? If the drivers add it based
> on the dt memory reference, those will be configured to not add
> duplicate heaps (and even so the heap driver can also ensure we don't
> try to add a heap twice).

Sure, it doesn't have any problem to work but design ponint of view,
it looks werid to me in that one of random driver in the specific
scenario should have the heap registration and then we propagate
the heap registeration logics to other drivers day by day. To avoid DT
binding with dmabuf directy but it seems we have bad design.
To me, it sounds like to toss DT with anonymous dmabuf binding problem
to device drivers.

> 
> > > Yea, an un-upstreamable dummy driver is maybe what it devolves to in
> > > the worst case. But I suspect it would be cleaner for a display or ISP
> > > driver that benefits most from the heap type to add the reserved
> > > memory reference to their DT node, and on init for them to register
> > > the region with the dmabuf heap code.
> >
> > As I mentioned above, it could be a display at this moment but it could
> > be different driver next time. If I miss your point, let me know.
> >
> 
> I guess I just don't see potentially having the registration calls
> added to multiple drivers as a big problem.
> 
> Ideally, yes, I'd probably rather see a DT node that would allow the
> heap driver to register specified regions, but that's been NACKed
> multiple times. Given that, having hooks in device drivers to export
> the region seems to me like the next best approach, as it avoids DT
> ABI ( if ends up its a bad approach, its not something we have to
> keep).
> 
> The bigger problem right now is not that there are too many places the
> registration call would be made from, but that there aren't upstream
> drivers which I'm aware of where it would currently make sense to add
> specific dma_heap_add_cma() registration hooks to.  We need an
> upstream user of Kunihiko Hayashi's patch.

Hmm, if that's only way to proceed, Hyesoo, do you have any specifid
driver in your mind to bind the CMA area?
