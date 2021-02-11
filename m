Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7023186D1
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 10:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhBKJQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 04:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhBKJJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 04:09:12 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FDCC0613D6
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 01:08:31 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id e1so4481064ilu.0
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 01:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kdA1Kwoq/S/LKCIqEWml1fSvv8WMuf1jYn8nBhMfcnI=;
        b=VUe+0kbaY+lBr2aOAuw3nZWDJynOj1vx+bapgsEHj20UriFRNFl8g9448c3tGnRubi
         +EvwR0jgW8sfzeMtztTntSjlCZcTr67yBraggSLDUOTlaKo5GBN06hoxX9GWra1YGQiL
         NLztfh16+p4gv4RNidsFwTb/kVDRP5dc/m0TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kdA1Kwoq/S/LKCIqEWml1fSvv8WMuf1jYn8nBhMfcnI=;
        b=CaARDIxT2NxWS1tN1vn9NLAhbg9cTU624zwFf7nExAo5RGM43x3Ym+qj8LuH4dShDd
         eO5EccrrnIWb/xGTgDdGj9rUL4alBYDd/cigUQgiBtt0Loege8FTuN02P5nzfnCotX31
         Kqd56fbq6kHKbUwGO3MvNqUH2k0EQ4qNZl2C4Z25Nl41lmuSCW34JhOFJkue0ADbPds0
         ZR2MVF09MptSlxFuWj0XalNm9EBbqfgnJoVckx7xQ9AxV90ONbZl2JEupxjVohgIHVS9
         X4NugjxqcH1+kYEkmD/6pEHBVdQyEEWwtEP1R0z0mtx+HCZmR90bjgKhJfbnU3vWLdok
         zx7Q==
X-Gm-Message-State: AOAM53239JgnXV92bEYLGIM7x/+bVc86e9BltWMz8l4V0b87CmW0wATs
        fr795Mjc1Szv9rSJil6bEtdOAAqdhDEKqA==
X-Google-Smtp-Source: ABdhPJy6hl+UUXYs2Q2cDlmK47snBkr7dg82xtxgTPZ6E28RDhWAMCi7UthVufZAhIFxUEa7ivf7qg==
X-Received: by 2002:a05:6e02:1411:: with SMTP id n17mr4726323ilo.61.1613034511044;
        Thu, 11 Feb 2021 01:08:31 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id f14sm2352021ilr.14.2021.02.11.01.08.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 01:08:29 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id m20so4402498ilj.13
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 01:08:29 -0800 (PST)
X-Received: by 2002:a92:730a:: with SMTP id o10mr4922650ilc.160.1613034508965;
 Thu, 11 Feb 2021 01:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
 <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com> <20210209170217.GA10199@lst.de>
In-Reply-To: <20210209170217.GA10199@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Feb 2021 10:08:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
Message-ID: <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

What are your merge plans for the uvc change?
http://git.infradead.org/users/hch/dma-mapping.git/commit/3dc47131f8aacc2093f68a9971d24c754e435520

Are you going to remove the patch on your Merge request and then send
it for review to Laurent? or merge it through your tree with a S-o-B
him?

Thanks

On Tue, Feb 9, 2021 at 6:02 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Feb 09, 2021 at 03:46:13PM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > I have tested it in both arm and x86, since there are not significant
> > changes with the previous version I did not do a performance test.
>
> I'll take this as a Tested-by.



-- 
Ricardo Ribalda
