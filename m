Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6063C2D4F1B
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 00:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgLIXyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 18:54:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgLIXyM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 18:54:12 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F13C0613CF;
        Wed,  9 Dec 2020 15:53:32 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id v29so2429381pgk.12;
        Wed, 09 Dec 2020 15:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LINlBO/TC6i2SZUXr1MFYVpHThXjdgKp5RJMwGfVaFM=;
        b=Ny+CXFK7gIl0c60QTsv6Z179rJXR+V/YO1bIOBjW/l36zV9omQz1PBALfvBpcGzTzF
         gXsqkrEm1CcmvQ2EoKrLaYwZSi7fVot1JQROXWmWH1LBOFx4BkOQ2vw/sS8SYaZr5z5s
         CCWxSXYyQEkYlKvrA910I3lxzryURgyLRfyU+bP+f8XJiZpG7Cxgmuzk/k8N6yL/U/1C
         D+ActPuN+MZir1Yt/UE4quga/vC9g4s2goTY8mC0rdT9kSKYmLJhEUENbGpUHrWM1P9S
         81RQTmr3YzjSHxMDCd232An57Vj2JZjbjHu6+yKppbsP30SaKbdHosSsfCL2ZdGKxKTI
         8VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LINlBO/TC6i2SZUXr1MFYVpHThXjdgKp5RJMwGfVaFM=;
        b=d2lMBruTDffL1tlhP2DptYaBZP/KeyacpaRdLvcfKc503jYSacoMN1K+sGIZHtGWtI
         /3BIfmfFou+dxbnEE/fRp1gnRW/53cjZlIDY5b7pU7f+g2RRVu6X+rw162tzAq459x0K
         B7smRTnrDJ2ntnZW9+GswqGgkVQ2zduXbrBXRytEYh4YcuNHP2ko5agc6HSuhIVDPFoT
         AvlRbwh6ORInYKYl8SlmprtQnOobzFjLI//OigfEaOfPWJyetW8LaxTMURT3MJ63TIPu
         CJn3WE8CU68uibcJ3BNIucpFGi07V9ryxNOLmDwHJrsnMnlLVVrzZ71AoQJxM4Y36XCH
         Ujcg==
X-Gm-Message-State: AOAM530aGRtE6NCR4xMcd7XahJ7GEFfjAnagyYIN92eZh0B5OQLbZqzT
        GjalnkeojcIIq8o9bFa9eHo=
X-Google-Smtp-Source: ABdhPJxXQYKC6C+ZALoZwKd3MPYBy3Ldrw2eWk/ZTeLxkruiOLwLFI4xttcrwjLymhD24YOSNPZv7Q==
X-Received: by 2002:a63:cd01:: with SMTP id i1mr4137530pgg.83.1607558011479;
        Wed, 09 Dec 2020 15:53:31 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id f7sm3742524pfe.30.2020.12.09.15.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:53:30 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 9 Dec 2020 15:53:27 -0800
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
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
Message-ID: <X9Fjd+eSStUJskOV@google.com>
References: <20201117181935.3613581-1-minchan@kernel.org>
 <20201117181935.3613581-5-minchan@kernel.org>
 <CGME20201118030110epcas2p1105a09711ea2c123f19f413b32372764@epcas2p1.samsung.com>
 <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
 <20201119011431.GA136599@KEI>
 <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 18, 2020 at 07:19:07PM -0800, John Stultz wrote:
> On Wed, Nov 18, 2020 at 5:22 PM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
> >
> > On Tue, Nov 17, 2020 at 07:00:54PM -0800, John Stultz wrote:
> > > So I suspect Rob will push back on this as he has for other dt
> > > bindings related to ion/dmabuf heaps (I tried to push a similar
> > > solution to exporting multiple CMA areas via dmabuf heaps).
> > >
> > > The proposal he seemed to like best was having an in-kernel function
> > > that a driver would call to initialize the heap (associated with the
> > > CMA region the driver is interested in). Similar to Kunihiko Hayashi's
> > > patch here:
> > >   - https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/
> > >
> > > The one sticking point for that patch (which I think is a good one),
> > > is that we don't have any in-tree users, so it couldn't be merged yet.
> > >
> > > A similar approach might be good here, but again we probably need to
> > > have at least one in-tree user which could call such a registration
> > > function.
> >
> > Thanks for your review.
> >
> > The chunk heap is not considered for device-specific reserved memory and specific driver.
> > It is similar to system heap, but it only collects high-order pages by using specific cma-area for performance.
> 
> So, yes I agree, the chunk heap isn't device specific. It's just that
> the CMA regions usually are tied to devices.
> 
> The main objection to this style of solution has been due to the fact
> that the DTS is supposed to describe the physical hardware (in an OS
> agnostic way), rather than define configuration info for Linux
> software drivers.
> 
> Obviously this can be quibbled about, as the normal way of tying
> devices to CMA has some assumptions of what the driver will use that
> region for, rather than somehow representing a physical tie between a
> memory reservation and a device. Nonetheless, Rob has been hesitant to
> take any sort of ION/DmaBuf Heap DT devices, and has been more
> interested in some device having the memory reservation reference and
> the driver for that doing the registration.
> 
> > It is strange that there is in-tree user who registers chunk heap.
> > (Wouldn't it be strange for some users to register the system heap?)
> 
> Well, as there's no reservation/configuration needed, the system heap
> can register itself.
> 
> The CMA heap currently only registers the default CMA heap, as we
> didn't want to expose all CMA regions and there's otherwise no way to
> pick and choose.

Yub.

dma-buf really need a way to make exclusive CMA area. Otherwise, default
CMA would be shared among drivers and introduce fragmentation easily
since we couldn't control other drivers. In such aspect, I don't think
current cma-heap works if userspace needs big memory chunk.

Here, the problem is there is no in-kernel user to bind the specific
CMA area because the owner will be random in userspace via dma-buf
interface.

> 
> > Is there a reason to use dma-heap framework to add cma-area for specific device ?
> >
> > Even if some in-tree users register dma-heap with cma-area, the buffers could be allocated in user-land and these could be shared among other devices.
> > For exclusive access, I guess, the device don't need to register dma-heap for cma area.
> >
> 
> It's not really about exclusive access. More just that if you want to
> bind a memory reservation/region (cma or otherwise), at least for DTS,
> it needs to bind with some device in DT.
> 
> Then the device driver can register that region with a heap driver.
> This avoids adding new Linux-specific software bindings to DT. It
> becomes a driver implementation detail instead. The primary user of
> the heap type would probably be a practical pick (ie the display or
> isp driver).

If it's the only solution, we could create some dummy driver which has 
only module_init and bind it from there but I don't think it's a good
idea.

> 
> The other potential solution Rob has suggested is that we create some
> tag for the memory reservation (ie: like we do with cma: "reusable"),
> which can be used to register the region to a heap. But this has the
> problem that each tag has to be well defined and map to a known heap.

Do you think that's the only solution to make progress for this feature?
Then, could you elaborate it a bit more or any other ideas from dma-buf
folks?
