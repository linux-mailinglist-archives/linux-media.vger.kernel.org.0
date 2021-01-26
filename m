Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B84D3054B4
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 08:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhA0Hbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 02:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S317626AbhA0A2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 19:28:07 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C400C061225
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 15:29:22 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id d81so8782iof.3
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBy1erHkLMBcGk0Q3oow7s6KaRas0EaJCp36zieGK9E=;
        b=WkNRoEB8P5ECNzKdEHU1MaY1ENG6KFbiRYwxbKJgSn8K+bUaEv2F6ui/00GOkBbZw1
         DpHQFu74uw5I0+o/wfDdMfhbHoEjtEnlpK5FUIHFg83cKzDTFbXIl50qxrcJjlMeI8oV
         JPuFdPCN5FPGu20ODhMYQkx2qhQ0Hb0aqdWQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBy1erHkLMBcGk0Q3oow7s6KaRas0EaJCp36zieGK9E=;
        b=TnZVEmGQpJf8iFX3LFLMm1I83hL0JIfGG8EkNyZf7O3OMVEZP8ghDLp111L/5Mhbag
         KlCMdHYnmDq5vFqizWPYW98mG0fRBQ3rOIrI0ImrBVG7dBH5U7ZU1mqpRpanDaGeky8L
         U2UEbYMvQTbPV1WMPgGbZe4EZj7hJHwQkPseQoJztYHfISOV1RG7J/xTtAHTDTR4+6Yo
         +0Nrdb5KvM/GQyLH5P31hfN9DtkrO6JKyew8bT2+Z4coF9QjxVO2OLabMfyJ/WqF/TX2
         9xmhT0u1RJWSERuP6x1+siNk4yh/EhQSigJ9phONomKOd5EGghJgskbRWWnR3P5cnUPv
         AbIg==
X-Gm-Message-State: AOAM531nnAHKm4mWl7/6JsIm8hUoYVCmbMKZzFWsR/SF+gSU/+Gx4bzN
        tqb5/KIbuHp6dqj9acScUhhhfoZs1ggJqA==
X-Google-Smtp-Source: ABdhPJxrQ9M7TnoeQbh0jDA6MUDqjYi/B0fep0SAEHQ75vJO/Aa/m5SrRnSK3b/PSvJvu32W/Df9bQ==
X-Received: by 2002:a5d:9506:: with SMTP id d6mr5763650iom.37.1611703761275;
        Tue, 26 Jan 2021 15:29:21 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id r22sm180807ioj.24.2021.01.26.15.29.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 15:29:20 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id d13so3662ioy.4
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 15:29:20 -0800 (PST)
X-Received: by 2002:a05:6638:3012:: with SMTP id r18mr6700227jak.13.1611703759669;
 Tue, 26 Jan 2021 15:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
 <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
 <20210111083614.GA27589@lst.de> <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
 <20210126170659.GA9104@lst.de>
In-Reply-To: <20210126170659.GA9104@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 27 Jan 2021 00:29:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
Message-ID: <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     ". Christoph Hellwig" <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

Thanks for the series!

I have a couple of questions:

- Is there any platform where dma_alloc_noncontiguos can fail?
This is, !ops->alloc_noncontiguous and !dev->coherent_dma_mask
If yes then we need to add a function to let the driver know in
advance that it has to use the coherent allocator (usb_alloc_coherent
for uvc)

- In dma_alloc_noncontiguos, on the dma_alloc_pages fallback. If we
have a device where the dma happens in only one direction, could not
get more performance with DMA_FROM/TO_DEVICE instead of
DMA_BIDIRECTIONAL ?


Then I have tried to use the API, and I have encountered a problem: on
uvcvideo the device passed to the memory allocator is different for
DMA_PAGES and NON_CONTIGUOUS:
https://github.com/ribalda/linux/blob/042cd497739f71c8d4a83a67ee970369e2baca4a/drivers/media/usb/uvc/uvc_video.c#L1236

I need to dig a bit tomorrow to figure out why this is, I have
hardware to test both paths, so it should not be too difficult.


Thanks again






On Tue, Jan 26, 2021 at 6:07 PM . Christoph Hellwig <hch@lst.de> wrote:
>
> Please take a quick look at this branch:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_noncontiguous
>
> Warning: hot off the press, and only with the v4l conversion as that
> seemed at little easier than uvcvideo.



--
Ricardo Ribalda
