Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DD63AAFF6
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 11:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhFQJnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 05:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbhFQJnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 05:43:20 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F276C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 02:41:13 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t7so3084395edd.5
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BMBrp+aRn4ogTXOq7rSsoT2WCWZvMYD1C/0K2uFUP9Q=;
        b=cu+yN/gr48xagwRF3LIo0gsjK3+kxP56KYc4muNqbfusiNDcUeu3zygS65SkmmVLxt
         dK+Tr7frlm4pKAG6DrJ0zb1TRfcg3+7apSa8zPFmkxzNhRWQhg2qQ9UzO1JBxBLLPj1l
         ozKwJC5Wu55f3MK+46q+CjzgjLzGEkX/8Z2BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMBrp+aRn4ogTXOq7rSsoT2WCWZvMYD1C/0K2uFUP9Q=;
        b=gk+S9m8v0b+WHPTuu4qQP1OpBT3xW6BYlOyA+f4GmOJFR9RluwPnFEFWfVmZv+IYcw
         9/GmtK1fw8mCFlu4L3hWhcFydnanf987LPaG6zUxInF8cBXNAbkxLqsZKmpy6w/hFkXT
         FMmtvCtUeHrpY71R3dgArLzoTHKxvOguWMqeFoKTvzvr3zaLbCHt3iM+I3HQG4BXwaKT
         r4I5KWdWjIrUfQwJ4y3YSvzrPh7Oz2DTLUixVYVLONCQoceZzzkx1aAoDpyvldoFxUau
         5bGIbLhG9ZWDVY0X2m3J0WT4+U2PR4+S+AyCjrFO0MsRwsJAQAYaNx+Lx5obpEDS8rSp
         7JFA==
X-Gm-Message-State: AOAM533UfMySnIadeSv09DY5MaOk6fCInqSlK5hFhJ/RK7q5GIzrWgM7
        EXZYAn6uGO1zzD3v0od1beeGDAo6FF1LWw==
X-Google-Smtp-Source: ABdhPJyEiD+jZH9ouHZ9wmdSWR3wMBB6PCF6kpYF8by7Tw2HBOH4gxTp3U5W+sDlBuuwZZsOjZaiSg==
X-Received: by 2002:a05:6402:1001:: with SMTP id c1mr5275514edu.26.1623922871237;
        Thu, 17 Jun 2021 02:41:11 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id h8sm3522508ejj.22.2021.06.17.02.41.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 02:41:10 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id r9so5972718wrz.10
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 02:41:10 -0700 (PDT)
X-Received: by 2002:adf:e804:: with SMTP id o4mr3456617wrm.103.1623922869865;
 Thu, 17 Jun 2021 02:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de>
 <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com> <20210617085233.GA4702@lst.de>
In-Reply-To: <20210617085233.GA4702@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Jun 2021 18:40:58 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
Message-ID: <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 5:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jun 17, 2021 at 05:30:11PM +0900, Tomasz Figa wrote:
> > We still have use cases for dma_alloc_coherent() and DMA_ATTR_NO_KERNEL_MAPPING.
>
> dma_alloc_coherent does not take a flags argument, so you can't use
> DMA_ATTR_NO_KERNEL_MAPPING with it.  What would your use case be here
> anyway?  In general DMA_ATTR_NO_KERNEL_MAPPING is rather misnamed, as
> usually there is a kernel mapping, just not one that is coherent and
> should be used.

Sorry, I meant dma_alloc_attrs() and yes, it's indeed a misnomer. Our
use case basically has no need for the additional coherent mapping, so
creation of it can be skipped to save some vmalloc space. (Yes, it
probably only matters for 32-bit architectures.)
