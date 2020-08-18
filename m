Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10921247D38
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 06:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgHRENm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 00:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgHRENl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 00:13:41 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC76CC061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 21:13:40 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id a6so3880803oog.9
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 21:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7iAwBileJ0G1UKlW/P/oYgHIzA/MbhoX0L3kNhgr4Y=;
        b=MZpTMKJAOi/ZwTMoPnuu79VyaoQ8NV1AomrB5KcKmLuQqw4Gq8Hy5WYphdAqc0hYsY
         X/Ih8+44QRhGnnuXXocdyME33WJL68lqdQgLunmQlY6sUTRc9wXZRcKCodF9nLO163g/
         TEuFORBUW6T28dJimhs8o2E+Szdf26zKm1JQcnxPXArxqURVcJXbwsPRTnO892qcwncu
         totiDS0Yfwwdt4XCvI1vl5LBOFs0denGVEowudiJSbvvAApcIwxMoKm0JdqsXUYnPW0/
         hjOMgTyMcpgIwrxmwfrPDx0RPRn6UatANoSTArnwBxhuUECLqizhdbyZRmBnUh7bj3YM
         VQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7iAwBileJ0G1UKlW/P/oYgHIzA/MbhoX0L3kNhgr4Y=;
        b=a5OjHRiCqWnD9uUvyVAVzreBKEU1V4Ae5n88UlRvdVPW4F1rHdqkVjNXI5yDP0o4Kf
         TBkdQrJHXGYP6Qmlvptd4jp70zbcxkQ06nUwH2kv5N50OpLfiPPQjlV7X779JfL9lkcS
         hil/KG2CeQGePOLiuPDynjQkbR0161TADs/yvLFnjaszz5wAMcPSiQYIUa04XRA5Ms6T
         0IYQH1V7dqHQ4AAuo/FqO1iLANpHQ8KIwYNfWms7uO8yFGRQGvfOdCgoK/IaYwwnedtl
         /VWuEO2p9nCHcS4UhwdruucTZPmMaNLKtSDhiFlFltafX07cQfMTGzoMmJya6WwMKOzo
         DQvQ==
X-Gm-Message-State: AOAM532BuCy+QknHYeRfSP074rFWhi9sMH0FOtYMEIwSqD46ew/VmS7+
        IKi65xH/ZiLds2gxNZw6oeMaJeZ4u2xJ2pyMjqpYrvZ40VE=
X-Google-Smtp-Source: ABdhPJxrYPAakE/ZtJfH+fAqlGcjEntL4sQ9RdVTLtPqOfEPQ9hnBci10bKEX7nrm5jsBFr2C2NAa4HidGM5i4m/hOU=
X-Received: by 2002:a4a:924b:: with SMTP id g11mr13689379ooh.9.1597724020264;
 Mon, 17 Aug 2020 21:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200816172246.69146-1-ezequiel@collabora.com>
In-Reply-To: <20200816172246.69146-1-ezequiel@collabora.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 17 Aug 2020 21:13:28 -0700
Message-ID: <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        James Jones <jajones@nvidia.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 16, 2020 at 10:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> which will allocate memory suitable for the given device.
>
> The implementation is mostly a port of the Contiguous Videobuf2
> memory allocator (see videobuf2/videobuf2-dma-contig.c)
> over to the DMA-BUF Heap interface.
>
> The intention of this allocator is to provide applications
> with a more system-agnostic API: the only thing the application
> needs to know is which device to get the buffer for.
>
> Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> is unknown to the application.

My hesitancy here is that the main reason we have DMA BUF Heaps, and
ION before it, was to expose different types of memory allocations to
userspace. The main premise that often these buffers are shared with
multiple devices, which have differing constraints and it is userspace
that best understands the path a buffer will take through a series of
devices. So userspace is best positioned to determine what type of
memory should be allocated to satisfy the various devices constraints
(there were some design attempts to allow DMA BUFs to use multiple
attach with deferred alloc at map time to handle this constraint
solving in-kernel, but it was never adopted in practice).

This however, requires some system specific policy - implemented in
the Android userspace by gralloc which maps "usage" types (device
pipeline flows) to heaps. I liken it to fstab, which helps map mount
points to partitions - it's not going to be the same on every system.

What you seem to be proposing seems a bit contrary to this premise -
Userland doesn't know what type of memory it needs, but given a device
can somehow find the heap it should allocate for? This seems to assume
the buffer is only to be used with a single device?

There was at some point a discussion where folks (maybe it was
DanielV? I can't remember...) suggested having something like a sysfs
device node link from a device to a dma-buf heap chardev. This seems
like it would add a similar behavior as what you're proposing, however
without adding possibly a ton of new device specific heaps to the
/dev/dma_heap/ dir. However, we would potentially need any missing
heap types added first.

> I'm not really expecting this patch to be correct or even
> a good idea, but just submitting it to start a discussion on DMA-BUF
> heap discovery and negotiation.
>
> Given Plumbers is just a couple weeks from now, I've submitted
> a BoF proposal to discuss this, as perhaps it would make
> sense to discuss this live?

I do think it's an interesting idea. I agree that having every driver
implement a dmabuf exporter is a bit silly, but I also think Brian's
point that maybe we need some drm helper functions that provide
similar functionality along with a more standardized device ioctl for
single device allocations might be better.

thanks
-john
