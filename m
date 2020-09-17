Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6293E26E0E8
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 18:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgIQQjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 12:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbgIQQjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:39:21 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB58C061788
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 09:39:09 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id w12so2884277qki.6
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+pVCxdlOuttO0x9cQvyDQMtVpumybNdFktYswl2oQtg=;
        b=adzEyNZLe2lQX5kpuTuGY7FirDTdklycKFQYwPubA75xbgb5j6TD8ugrCI9bf7/dzt
         eiHHohZO+AnHSbJDTAvNMn2jBQ6JDcjLQMk3PWJV1eYz6vegb9MVG6Vqa7rp+RbSNba8
         foT0asL3W+B3RxnKV3BG/TZaQkkZydfwK38tce+3QLd4GgBxkdix9rlthBQRsvulbuhr
         znE6bDJ7PC7wrhL7/rCJimbDdwTHZl2Smzt4CuMu660WrRCrToNnF9RBP8oGf4nH0kEJ
         oNpDAzQj7uDJ0JzjGo+G3JuPYol20PLqQ1hak18E+tQ23TdfG63HPVeD5B0NtaY5P4oD
         TA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+pVCxdlOuttO0x9cQvyDQMtVpumybNdFktYswl2oQtg=;
        b=aCG8AU6+jSMoPG+3pJuV0d7sgWVsoJchP4DXAC6dbndlh38CMQjPRQrIMWU5HttZ6G
         EzpmHuL1eCBRePr8/deMFtv3Ot57xCDtnPYvRrTc1yoRQstnIapAQKA4yBMmgSfzt2iA
         ynH07U4Zp3D0vkRYiHCQBWdtwdS6Rxf+gQkeNFd4ptvNJLU8z7VbptghigwXZbMNojU9
         0oy8xek40tc2zqWs9mRVCTshqeMgFlF6sQZLaKCuyG8urZQAxJFsx9F3vlQ/T+6hp237
         PXaNGD1h8OXbsKoi37PhPSUL4RVS1CqMwg2g+uKQFeqOTWXCrXuTJDcIESeUmPo9/5fZ
         ckkw==
X-Gm-Message-State: AOAM533sfKlIyR9pgBmYJC/b7qc6+DjAF2hw8gxYA06Xd3cwKtmBqZWJ
        J4qo7vMXAo/I+rMpLftJ0cqwWw==
X-Google-Smtp-Source: ABdhPJzXIO0eWNvXRiCeMQQ1VpPTu2QRRGdP2RU1h44X5j1zQ/qFh5iONStmiiT0w4aqZdD7WTkmUw==
X-Received: by 2002:a37:5145:: with SMTP id f66mr17238436qkb.299.1600360749095;
        Thu, 17 Sep 2020 09:39:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id 8sm207979qkd.47.2020.09.17.09.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 09:39:08 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kIww7-000WtZ-PQ; Thu, 17 Sep 2020 13:39:07 -0300
Date:   Thu, 17 Sep 2020 13:39:07 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917163907.GI8409@ziepe.ca>
References: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
 <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
 <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 06:06:14PM +0200, Christian König wrote:
> > > If it is already taking a page fault I'm not sure the extra function
> > > call indirection is going to be a big deal. Having a uniform VMA
> > > sounds saner than every driver custom rolling something.
> > > 
> > > When I unwound a similar mess in RDMA all the custom VMA stuff in the
> > > drivers turned out to be generally buggy, at least.
> > > 
> > > Is vma->vm_file->private_data universally a dma_buf pointer at least?
> > Nope. I think if you want this without some large scale rewrite of a
> > lot of code we'd need a vmops->get_dmabuf or similar. Not pretty, but
> > would get the job done.
> 
> Yeah, agree that sounds like the simplest approach.

I don't think that will fly, it is clearly only papering over a mess
inside DRM/dma buf :\

Jason
