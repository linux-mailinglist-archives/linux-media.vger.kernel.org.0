Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08E3244F4C
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 22:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgHNUxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 16:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgHNUxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 16:53:14 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB82C061386
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:53:14 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 93so8639367otx.2
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmoVjC08YrxpXeWbeOpcQEKNWTvOXbJjlLJ0uSesYA8=;
        b=aolCttJ37bqd+sgnF8A6XpmoeOLLkQCaKN3q+rb6g/rNhwhvcwL1iJBBNMcr8FvOfE
         WvjYAxIkVM0S7MriwGD//PHIXegNQsl0mZdCDmcuyyj9GY/T/5dpF1CzJkELHMgmMq6Y
         xu5L/CJRA0PXVhPH4en0+FFYYIwJ69kgrhcADp1qYUt7JGFpe8y1JikeiSySX4zjbbuN
         bv9nceABe3dfOSgPwiE3n1I+sabLGkd/b9VUWUsOU8OdDoEVkMwIumwFS93KiM+iyF4f
         5/dQyIjRafdbdS6dtGp0E3WOIK2F04eDLoBDhrem3egJOhAp3xsk0Cf5cGJenTeX2d/B
         5/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmoVjC08YrxpXeWbeOpcQEKNWTvOXbJjlLJ0uSesYA8=;
        b=DX11su7VVzWq92xkkSp2ItSifPiqBUAxtIrgoTEh9GtFvuphobsnF1X4SFPlb5BVL9
         svweaVCLCLvi+yumLE3U12taPl5O2beaeQ9G/1j5NfPdgNwx/lWY+R5RKwQViZgTpHDc
         xDc2eQAj0IGxTq4HMbli27/WiryknqAyWEOP6ck41LrdIqhKIaNyNqq3ODX1bxKLbaO0
         EF0Btq9jO09FMqRJDJwSx2ETsjleIfYFNaUH1P+4bGs4nzIIymk8dCYBBHCxI6eHPZQT
         iNP6VQBRp4wr4Wb0+xU7J1JeZxFNbhIRLZhmZZcKJbVf+9+D1B6gimEkjhXs3MqrYO9r
         5XpA==
X-Gm-Message-State: AOAM531f6qujk0S/igPJBYZq8ZzAmM7DUgsyQDrnazKu+CRIH0FkUddv
        +GKZ4FFW+xIKRaoZmbxyWH07R7XW+PTXYvlVT5CEFg==
X-Google-Smtp-Source: ABdhPJzsqsQPx8m5cz69J30RINmCdTOYqlYH4FYXz03eP3WaZBw/2J7kDm1DTz/fu92cpDUoOnTmUK3xjLtz3YQKStQ=
X-Received: by 2002:a05:6830:237b:: with SMTP id r27mr3123949oth.352.1597438393874;
 Fri, 14 Aug 2020 13:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
In-Reply-To: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 14 Aug 2020 13:53:02 -0700
Message-ID: <CALAqxLX4J4bykRis3=Q2Q54Fe1o7A7nFH3Yfjbi-kNXOQPrQpw@mail.gmail.com>
Subject: Re: Role of DMA Heaps vs GEM in allocation
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 14, 2020 at 3:59 AM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft
> in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come
> up is regarding the buffer allocation mechanism. Traditionally, DRM
> drivers provide custom GEM allocation IOCTLs. However, we now have DMA
> Heaps, which would be sufficient for TegraDRM's needs, so we could skip
> implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing
> DMA-BUFs. This would mean less code on TegraDRM's side.
>
> However, one complication with using DMA Heaps is that it only provides
> DMA-BUF FDs, so it is possible that a user application could run out of
> free file descriptors if it is not adjusting its soft FD limit. This
> would especially be a problem for existing applications that might have
> worked with the traditional GEM model and didn't need to adjust their FD
> limits, but would then fail in some situations with the increased FD
> usage of DMA-BUF FDs.

I'm not sure exactly if this would help, but I am working on some
exploratory tweaks to DMA BUF Heaps so that there could be an
in-kernel accessor that returns a struct dma_buf instead of a fd.

This is motivated as some folks want to use DMA BUF Heaps (if I
understand your approach) in a similar fashion, where the driver wants
to generate a DMA BUF but doesn't want to create their own DMA BUF
exporter which would duplicate one of the DMA BUF Heaps.

I'm a little mixed on this as part of the reason DMA BUF Heaps exists
as a userland interface is because its userland which knows the path
that a buffer will take, so userland is in the best position to
understand what type of buffer it needs to allocate. It seems to me
that drivers should instead import a buffer provided to them from
userland to fill, rather than allocating a buffer from a heap they
choose (which may constraint later use of that buffer). But, I also
grant that drivers implementing their own DMA BUF exporters that
duplicate existing code is silly, so having in-kernel allocation
interfaces may be reasonable.

However, the efforts are also somewhat blocked on having a public
in-kernel user of such an interface, so they are basically only
exploratory at the moment. So if you have an in-kernel user interested
in something like this, I'd be glad to get further input.

This probably doesn't help answer your question wrt to GEM, and I'd
defer to Daniel there. :)

thanks
-john
