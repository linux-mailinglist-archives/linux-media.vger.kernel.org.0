Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFC8251445
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 10:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbgHYIcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 04:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgHYIcK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 04:32:10 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189B8C061755
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 01:32:09 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 145so3090919lfi.8
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8VBcmM6sRKWlq0/anJb0wKs91ISNtH5ktL2MLmE99og=;
        b=X9RY+o6sC9Ppm0S92JcWuGapwVP6vGdg7BjmyO+bVW0rj1WTbhhQsV4pHkqkwAjjaN
         8H/JJC5//XVna28iO68xRVOv9wU5x6YXvvotlGw4lLejKAMz/7Q00mTo0f967W4aMtUw
         fPiG3HQHt/fd2KN89nN8sEf0oVh56pcOds4wS0HQdO+5Lb+PNySRcvEGwgy4lHZefIy5
         rpPA57c8RiRxZCxSfGlU1duSCLz3LMQ8/pSg+8uvHvNSWoz0nBeDuyncKVeR1U7EwtMq
         czWKRkH2JC3rN+Vs1JuY98vwSztqYkw2+2QSwv4wCzy/Zrvk0+76s1xbiZ0f2HRzJS2N
         lsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8VBcmM6sRKWlq0/anJb0wKs91ISNtH5ktL2MLmE99og=;
        b=EGsLNtzrgPEET80TsIEhK5wWmUAaMEU8KeDEC10JQCUmSSbQgzYJJZQZIgHihUvhUP
         f5KDxidqTNfIagWiGeSuMbF56k+Daky5R/TJyPGlME+zDdYUwviO8mb9mrSwOi/YNQIs
         GmzXHD8LdWXZ3Ge50uaA6ymF3IL99Doajajba7dDY/skWVDg1I5qqniVdTN+HAfpbd8v
         qZWd1DWqHGK5/EvKn8XENQaqfqh/6+166OBDERuuDucUBMSz6sr78eGgI1Xy2o3ge0of
         oDUeOUFEWWR3TLmsaH+z8xrJJ1eZDkeQNdJFgAQiNO8fTUZiwUakMDVcfJPlmlxgZ9kE
         vUZw==
X-Gm-Message-State: AOAM5310KrT8IwtQj9ILIYVEz80tFG/V2nrsTfiwdVUdG6JZmPZUDc6Y
        w/8u2nKvSxkqLoZv6QxRCYLd4gA7e6vfJA==
X-Google-Smtp-Source: ABdhPJyvP5CCC/9K1+399P66A5Xf4E5azNewtsF/LKST22V5Yw1PmUGF53lGY/lu2kWSsQNejxGZUA==
X-Received: by 2002:ac2:4570:: with SMTP id k16mr4396381lfm.60.1598344327410;
        Tue, 25 Aug 2020 01:32:07 -0700 (PDT)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id f14sm2666979ljp.138.2020.08.25.01.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 01:32:06 -0700 (PDT)
Date:   Tue, 25 Aug 2020 10:32:04 +0200
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     arm@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, olof@lixom.net, soc@kernel.org,
        tee-dev@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] tee: convert convert get_user_pages() -->
 pin_user_pages()
Message-ID: <20200825083204.GA2068961@jade>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824211125.1867329-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200824211125.1867329-1-jhubbard@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 02:11:25PM -0700, John Hubbard wrote:
> This code was using get_user_pages*(), in a "Case 2" scenario
> (DMA/RDMA), using the categorization from [1]. That means that it's
> time to convert the get_user_pages*() + put_page() calls to
> pin_user_pages*() + unpin_user_pages() calls.
> 
> Factor out a new, small release_registered_pages() function, in
> order to consolidate the logic for discerning between
> TEE_SHM_USER_MAPPED and TEE_SHM_KERNEL_MAPPED pages. This also
> absorbs the kfree() call that is also required there.
> 
> There is some helpful background in [2]: basically, this is a small
> part of fixing a long-standing disconnect between pinning pages, and
> file systems' use of those pages.
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>     https://lwn.net/Articles/807108/
> 
> Cc: Jens Wiklander <jens.wiklander@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: tee-dev@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> OK, one more try, this time actually handling the _USER_MAPPED vs.
> _KERNEL_MAPPED pages!
> 
> thanks,
> John Hubbard
> NVIDIA

Looks good and it works too! :-) I've tested it on my Hikey board with
the OP-TEE test suite.
I'm picking this up.

Thanks,
Jens
