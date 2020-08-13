Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72AA24410C
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 00:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHMWEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 18:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgHMWEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 18:04:52 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F65C061383
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 15:04:52 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id g1so1534381oop.11
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 15:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3xfqWmRtflhotperG6NWnIwC3g3Q247SCA9p41kwBGs=;
        b=UolcndJsDVYSOyRpQ9JTr2zGfNCUwNjMdyqIq4GBD+js16X0QMFHU5pkdTbeMN4D3J
         uwZsx83sUIAi5fU+Gbv5X5jO0+tv/noXUjIKV7uJOsz6DBylNxDXlnygKa+NedmkkH6d
         qTEw+QDw3sG5vtR/zRjLg8lz8ckaz7kKb1JsiOEOYroIvUHv+ofhMZxfUi+xgv5arPwO
         UvRKnfgaTxRKRU7o9D3LtRh/ubS9wF0j9Y88CIhCLROepZJfUBs77IHt62o8ek1hDQ8/
         mNQPIZ4ViJW7nKvDYb/zMZHPeb8DTESKlnSV27oRfA8E5Jq7vDISu7SxEKObQ/gQCYMS
         /TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3xfqWmRtflhotperG6NWnIwC3g3Q247SCA9p41kwBGs=;
        b=BbhWbxTNrQPvmtRiYbmM0aNQfqMuzwn3xhEWduYkJvS9u6XdK5zeobAHt1IPZ9h99P
         fv6qT8i6I5X8z0oMfegGf93nRRAFUNAKTHY7pA7u17UOkO9S+SMtsfmXqYWqEVc6a1T6
         6zHoMUzeq8uLeGHGPc0ZzZs+PWsLqZimnYmwSAlizFloL4AoqcCKTTXEfEdou592OK4c
         ZfryrI0P0eusiPrX1ZbTYpXGHSWLGiTGNBXwGHqhN2MMMJVTxBAQSFr1QLCv1jjsZZM1
         DNR5dNZNNuTCRhKS+lqoSdBC4NtyhJarzOELh9kWsIRe3gdtm/vkqO6vNnswWNkIgDC3
         rY0w==
X-Gm-Message-State: AOAM532VqI0e34Qvy9/u6B0/cw+XQBoeWeBqZ/spg7sfD4qBfbdjkgeb
        2Pxyy7kdppxCXa2x64W7VeV7HnQZvHZ47Jm6uPJoPg==
X-Google-Smtp-Source: ABdhPJzyc0QUIbGQc/Raud6mkyJ1G5M3ZSdPSTn1QQLc40+ET2RlCL4akGxQ7ZSYtufsf1cTHSfN70KY25WQ15RXw0c=
X-Received: by 2002:a4a:ca11:: with SMTP id w17mr6358838ooq.88.1597356291596;
 Thu, 13 Aug 2020 15:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200725032633.125006-1-john.stultz@linaro.org> <20200813100411.3gh2awfbmdjupbnw@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200813100411.3gh2awfbmdjupbnw@DESKTOP-E1NTVVP.localdomain>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 13 Aug 2020 15:04:40 -0700
Message-ID: <CALAqxLVyNtnXeCU1u=kV02k2wGYtBW1iRVLrOpNetRCnBvepvQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] dma-heap: Add proper kref handling on dma-buf heaps
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>, linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 13, 2020 at 3:04 AM Brian Starkey <brian.starkey@arm.com> wrote:
> On Sat, Jul 25, 2020 at 03:26:33AM +0000, John Stultz wrote:
> > Add proper refcounting on the dma_heap structure.
> > While existing heaps are built-in, we may eventually
> > have heaps loaded from modules, and we'll need to be
> > able to properly handle the references to the heaps
>
> I'm not 100% clear on the intention here. What would take/drop a
> reference on a heap?

Yea. At the moment nothing, but I did this cleanup as part of some
other changes which would allow drivers that want to produce a dmabuf
without having to create their own exporter to find an existing heap
and allocate from that. Thus we needed to do proper reference counting
on the handles to the heap. Those changes are stuck for now waiting
for an user to be publicly submitted, but this change initially seemed
like a reasonable correctness cleanup, so I went ahead and sent it,
but as Daniel noted we can wait for real users to be submitted before
adding any extra complexity upstream.

> In the case of modules I think the bigger problem is how to prevent
> the module getting removed while there's still something using it.

That's true. Probably need something like a kref on each buffer allocated.

thanks
-john
