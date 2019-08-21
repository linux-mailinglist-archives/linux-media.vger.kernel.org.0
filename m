Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34A7A98580
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 22:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfHUUXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 16:23:00 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:37002 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfHUUXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 16:23:00 -0400
Received: by mail-ot1-f53.google.com with SMTP id f17so3325645otq.4
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MKzvDm+ztYbW7s8xYbQH0GgXMCIamw1+1ytg0mPF2A8=;
        b=bJB9mLV4u+q7ZA3/b2C0MxHlyFCbkgj0+BPIvFsWr5qTv+m61JrH+4mikUmO36rEzh
         GHIuTv8y2YOM+7L8jsfwb1SqW255J/fdl2x7ENOv8MljNHvWHAwfLZh0yxm46ODx7FUv
         gP2AQbCTBs1fisoXguY7cOLS7BKNT4Y492ZSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MKzvDm+ztYbW7s8xYbQH0GgXMCIamw1+1ytg0mPF2A8=;
        b=Z+cup8L1vJLKFR/9sJr52NZEhSE59GPlEsuJzV1V085qSK7HQHwgzF7Z+jYmmxUlxa
         AUa2kSQF32a+F1XIiWFyj14CL49UUWN19lB0W39zqaiZFy8aaCxNypu5cjkX7Ph0LPYa
         lvFI2m91pr0GX56Lx0AhnAf5b+/opwbvmGUS1U12sdd0bWyYcU93KZzFNR/x7yZxF5ZQ
         W38zmhNklntjynbpjHc9bjzI0c7YJJiIpWMs+XDaA1asZE5qpL0LJMXG+dZTTrtiL4vy
         ekUApMtGVmhnePaDfmgIvpbSrNtiI70Dvs4TX+iLsl1Gblb8/cCWMrjrxJ4UDq4Rcn7P
         FYLw==
X-Gm-Message-State: APjAAAUUwOQ2Fk7hUBTsd1HXgtoRJ9/HJWqxB3gA3GUVh4T3yAyD6pz4
        l7HxHHPnLHTrjQXbbDyG9MANVEb72zgj/F61pM2Lkw==
X-Google-Smtp-Source: APXvYqxzQXGnnKkIYCYTX+26SGzVn5ZVSNVD//25VTXs31hGvwkhLv0KLTL93xyFsm0usIgLXw2XWLJOtx8wuvtcIys=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr29956498oto.204.1566418979173;
 Wed, 21 Aug 2019 13:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190821123147.110736-1-christian.koenig@amd.com> <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
In-Reply-To: <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 21 Aug 2019 22:22:47 +0200
Message-ID: <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com>
Subject: Re: [RFC] replacing dma_resv API
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 10:11 PM Chris Wilson <chris@chris-wilson.co.uk> wr=
ote:
>
> Quoting Christian K=C3=B6nig (2019-08-21 13:31:37)
> > Hi everyone,
> >
> > In previous discussion it surfaced that different drivers use the share=
d and explicit fences in the dma_resv object with different meanings.
> >
> > This is problematic when we share buffers between those drivers and req=
uirements for implicit and explicit synchronization leaded to quite a numbe=
r of workarounds related to this.
> >
> > So I started an effort to get all drivers back to a common understandin=
g of what the fences in the dma_resv object mean and be able to use the obj=
ect for different kind of workloads independent of the classic DRM command =
submission interface.
> >
> > The result is this patch set which modifies the dma_resv API to get awa=
y from a single explicit fence and multiple shared fences, towards a notati=
on where we have explicit categories for writers, readers and others.
>
> Fwiw, I would like the distinction here between optional fences
> (writers, readers) and mandatory fences (others). The optional fences
> are where we put the implicit fence tracking that clever userspace would
> rather avoid. The mandatory fences (I would call internal) is where we
> put the fences for tracking migration that userspace can not opt out of.

I think this would make sense, and is kinda what I expected here. If
(and I think that's a huge if) we can agree on what those internal
fences are. There's a huge difference between internal fences for
buffer moves (better not ignore those) and internal fences like
amdkfd's eviction fence (better ignore those). So whatever we do add,
it better come with really clear docs and pretty diagrams about what
it's supposed to do, and how it's supposed to be used. Or we're just
back to the current mess we're in, times two.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
