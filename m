Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B06D40B440
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 18:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbhINQNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 12:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhINQNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 12:13:37 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F05C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 09:12:20 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id a10so15412768qka.12
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I7DiJbd0cxUCLQIOVYzn8bpAGXC1DpRRoThWyrXU5us=;
        b=VLAPpylLAYTeobmTkVR3mMWEApbSzQVCY6y9NZmlGqOYAYmCLqLovz+JRKOW4zbFQO
         SsICmqARfpElDi01jfGPfhfGp+XbjOWG5j7xhqkXBcfxNTtfN0Q2EHL2YIPXJAmE5lqq
         9fO4vT4ebWpM51oXh2PN3UzJN/nZE167NxFttlYk9zDneLRVxgg54Ms6stPw+IfwS8fE
         BcU8DH0Wkz0TT/2TEuDT6T2VOxScMtYxzNvvbGLNasoE4MraqR/e/O1maoUvya4XQnt5
         8ZqntLHL5K06ZWcY7hFsB6CkWDvb6eMwUQMOMC/DyK5zV21pUx/5Wgk/nJhjm274HIe8
         i/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I7DiJbd0cxUCLQIOVYzn8bpAGXC1DpRRoThWyrXU5us=;
        b=Ah93XvJRi/HIJTDg2dydEwL4MOB0xSA+9xw+ZSj4xYRPRgVRJpmx8WU32l0hIu4MPi
         gU5sWhp2neeBRL54yuZiN+AYgEW1O/9gHQJ2EGC+XZeYu9fyNH/8FIDq9uM0itOw24NH
         CJfpyJWWoposMh7fSBmvSQp6bXZa5a0V0mnZvEj1gQgwAcJMpo0O4QJzSIPsdq26wwpX
         bsxVib2vCkfdu3HcMTJ9UwqCpmkzrwgqBTghZ/1cVDBvLW9jLkx+QQbcNF9308Ouozff
         pfc0b8nsjy0HKOm3rqZsjleHjVE08gEZ7d6ystV8wDl85gaR7+7ki7JZVTz+t9aFGkdG
         aAfg==
X-Gm-Message-State: AOAM531fUugxmhj9FDiSw3FDEssuP4Y1DWor7Q2KflsKdklByzqL3cdt
        WWfg+dBjv9aShpDb+ABQR/dS0g==
X-Google-Smtp-Source: ABdhPJx4jViYSyei0WdKfCFMJbXr109wAbeh5pMtA2HJlrp+YG8SrdRPcGb67UHsXDEjE3Pl7PPDDA==
X-Received: by 2002:a05:620a:4541:: with SMTP id u1mr5785047qkp.106.1631635939466;
        Tue, 14 Sep 2021 09:12:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id s18sm7826361qkj.87.2021.09.14.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:12:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mQB2g-000UiF-8O; Tue, 14 Sep 2021 13:12:18 -0300
Date:   Tue, 14 Sep 2021 13:12:18 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, christian.koenig@amd.com,
        galpress@amazon.com, sleybo@amazon.com,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, dledford@redhat.com,
        airlied@gmail.com, alexander.deucher@amd.com, leonro@nvidia.com,
        hch@lst.de, amd-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <20210914161218.GF3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUCvNzpyC091KeaJ@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > Hi,
> > Re-sending this patch-set following the release of our user-space TPC
> > compiler and runtime library.
> > 
> > I would appreciate a review on this.
> 
> I think the big open we have is the entire revoke discussions. Having the
> option to let dma-buf hang around which map to random local memory ranges,
> without clear ownership link and a way to kill it sounds bad to me.
> 
> I think there's a few options:
> - We require revoke support. But I've heard rdma really doesn't like that,
>   I guess because taking out an MR while holding the dma_resv_lock would
>   be an inversion, so can't be done. Jason, can you recap what exactly the
>   hold-up was again that makes this a no-go?

RDMA HW can't do revoke.

So we have to exclude almost all the HW and several interesting use
cases to enable a revoke operation.

>   - For non-revokable things like these dma-buf we'd keep a drm_master
>     reference around. This would prevent the next open to acquire
>     ownership rights, which at least prevents all the nasty potential
>     problems.

This is what I generally would expect, the DMABUF FD and its DMA
memory just floats about until the unrevokable user releases it, which
happens when the FD that is driving the import eventually gets closed.

I still don't think any of the complexity is needed, pinnable memory
is a thing in Linux, just account for it in mlocked and that is
enough.

Jason
