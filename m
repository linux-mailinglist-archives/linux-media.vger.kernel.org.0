Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07376324400
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 19:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbhBXSrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 13:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234908AbhBXSrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 13:47:42 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE72EC06174A
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 10:46:59 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id l25so2220876qtr.3
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VrjvjB78Kh6dNXfIIH+c0MkGaNwqdx16pxLGBYXPvwM=;
        b=jjB1UZuK32Ke9VRfm8YRmJuxrd4jZ1KKlPi1xH/k5SNHmtI/GLgaFN69BYYMoxeFow
         8gEKIaXrz5BpYsWTJADgqUGv0djXy6d2kY+4vqKKNpK8qxCSumaxTraBmtIslCFKG2X0
         DYlXBpigpHVPYOrS5YReFqkHPL8sUn0GMShwU6OUMKWpFbrON5nWwXE4X3DnKEHDIk6e
         HSdhgiFhl9Q91uR3Lv/4rNnt1VShcndISi7JtOjlSRtHy6idWrvd/Z70EFKux1zP1A8+
         aZ++cfzRJMVErMv90bk+Zua1JTlHjDPaBQEmvTQTYo7D61pMJmlMuPEhu4ho0QmdajHv
         NvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VrjvjB78Kh6dNXfIIH+c0MkGaNwqdx16pxLGBYXPvwM=;
        b=LuK0qP2DFHb2ECmNyShQjtadW2iCSp7SOPNqMV5JFv5JrwI/xoA4+QI6Ml08J30AmG
         BGZ5cBaqz3kGJ3VCHhUVBkFe8rx8B3sDsKhMuNE0aWqcjKtnFQHXK8772OP/w1VcNZxi
         fBv5lXF/oR4+GiMFZfa/7OzHD+jIsVPHPNke2bKzHezOaPGZHqbAE90uSq7DP+1aiBMQ
         AIcpGjKjEYbIlJ0qzHjM+QxuBYr9z6x+TJknw12glyTjoa4+TL2L8coTvcOMpw8uWycG
         rQWSyEgQMk8DyegmkSL3vr3bj2ayTr7UzqH8zq3REn/A8YxJcesEDUjpgaDGpVhBRJkv
         Uwyg==
X-Gm-Message-State: AOAM532biRWpLfojFUpSVRLHVaIn5OZKr4GfaF9H53fwvt9HNPJcCnW2
        oYmxCD84RPMq11io3mFqPrVo/g==
X-Google-Smtp-Source: ABdhPJxW9xJMQxdNXP/6Q9rzo3S7DhLtVdo2G2c7/gZ8wtaJRcPsqAqAlDlqAQRUSlE9KXebcfKo2g==
X-Received: by 2002:ac8:5ac9:: with SMTP id d9mr29408484qtd.123.1614192419030;
        Wed, 24 Feb 2021 10:46:59 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id i75sm2129440qke.47.2021.02.24.10.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 10:46:58 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lEzBZ-00GmDm-Ok; Wed, 24 Feb 2021 14:46:57 -0400
Date:   Wed, 24 Feb 2021 14:46:57 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <20210224184657.GR2643399@ziepe.ca>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 24, 2021 at 09:45:51AM +0100, Daniel Vetter wrote:

> Hm I figured everyone just uses MAP_SHARED for buffer objects since
> COW really makes absolutely no sense. How would we enforce this?

In RDMA we test

drivers/infiniband/core/ib_core_uverbs.c:       if (!(vma->vm_flags & VM_SHARED))

During mmap to reject use of MAP_PRIVATE on BAR pages.

Jason
