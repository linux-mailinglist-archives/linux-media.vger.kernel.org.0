Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442131D2FCE
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgENMbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 08:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726124AbgENMbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 08:31:16 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E30C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:31:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y16so3851145wrs.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=5L3ztVTSKOLB244G65ZSGtUQqMEEP8hy+Z9x9uH8zas=;
        b=XP2/KMs+gTj7Eg8apXs3bcyaa/CJ9Cg2niFlnTGlqvE5RTQdQT7MpwKkBEqB+JQ8aL
         4UuBD6l5ST1XjJm02s9KnqjR8A0Y1UzmK1O1Om0k1jpP0vfs6D62Kyro76gDWMWI47HK
         HLOKTGmtd6jGITv2+c5urjo14QMTiHh/Mwycg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=5L3ztVTSKOLB244G65ZSGtUQqMEEP8hy+Z9x9uH8zas=;
        b=K474P6OeprToCeqkr9odKpl+5sNcPHBePagc0Tf8eVEPY+n+GtYebwIyHZoFAD6oin
         nzcN07WhwTWzG8ks2ns1VMNI70EqEXQSPcgCGLHA9x/M8VvJrmAGWc79x8NxkJrVtxUe
         qPyb1Nl9nUmPeDK1shWgJ0Nf7ucwdKF4KQFifToIEhBgoi1rvDibbYtl+KROvUl4Inbq
         HNONUYbkCkLIQmDsa2GVLf5HOP29fSESsWpsZcrXScPJhUGaTRdah90KUKC61DJq9eVP
         Fa2t8Pf7FKLNbQp6FkcBv/kqwNkRl9mAxOcUBmeltuGWBGef8MwzM3ba5hyhTqUlR4PL
         E+sA==
X-Gm-Message-State: AOAM533D0D95PtLXboFVd8drhS9z6IWj54PhLlxvMDJZVQC5rk2TnU+G
        snL5jRqQGcJX0mfGCF7t1fn+Ow==
X-Google-Smtp-Source: ABdhPJzO26HExPt8oSSN1CG6GZWaJbzzOwmK5nuzbTE+eMp+2gFxCEKVNXKRppRj4egecVynUjKUXg==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr5670993wro.25.1589459474052;
        Thu, 14 May 2020 05:31:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o15sm3194658wrw.65.2020.05.14.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 05:31:13 -0700 (PDT)
Date:   Thu, 14 May 2020 14:31:11 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        David Airlie <airlied@linux.ie>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514123111.GQ206103@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <20200514075952.zuc3zjtmasaqrw75@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514075952.zuc3zjtmasaqrw75@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 09:59:52AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > - for the runtime upcasting the usual approach is to check the ->ops
> > pointer. Which means that would need to be the same for all virtio
> > dma_bufs, which might get a bit awkward. But I'd really prefer we not
> > add allocator specific stuff like this to dma-buf.
> 
> This is exactly the problem, it gets messy quickly, also when it comes
> to using the drm_prime.c helpers ...

drm_prime.c helpers (not the core bits) exist becaues nvidia needed
something that wasnt EXPORT_SYMBOL_GPL.

I wouldn't shed a big tear if they don't fit anymore, they're kinda not
great to begin with. Much midlayer, not much of valued added, but at least
the _GPL is gone.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
