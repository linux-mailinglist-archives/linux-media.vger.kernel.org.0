Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645783B1D60
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 17:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhFWPRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 11:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWPR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 11:17:29 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1942EC061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 08:15:11 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bg14so4564177ejb.9
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DvsYEcXsNWTy6Jnkq47KIklkbgVvy5KtMShh7FtY3u0=;
        b=WlyCtxxrit0F13PB5LKVc4W8ioTDxZGoz0BDxhp5ADy/+x0DPfJAboMCXqIWhMcdLM
         fG/7Lud5ltzga56OxZ3HjQOTY4JYgDVcvHd5L5Es73O2G10XryTWLzzy68cbS0Bc9LMT
         Vy9D6jY1Dy+wQUgKscUFQz8BiTIsqJcWTtFOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DvsYEcXsNWTy6Jnkq47KIklkbgVvy5KtMShh7FtY3u0=;
        b=IQf6LSw7Ul9eTUsgoe+ydlwYsU1yBaQk3KeZ1pD9GjYe0NRJBCaMeuHGImDHKvhTYA
         PfokmHfFEQSS4mhFCsN2NKpOkMcnWhfR/z6X4KjW6pqt7inFGXtvhitqqh8krkgeNDwp
         LTdhkxXewblLmEt9znYg8GBQuy+aW6V2iWchhyNNxsA63uH3LZHLaTHiP2+/UIDbaAdI
         XaDcs+tzyj8CWB4QWIpzpli9/xaGK7j50V7FBvVIpPhKdrdlFJ/QSuY4DphjiuXDQAix
         pOMmDq/H8lg0jA/WfACMOcu9Hf96PXduSuccjy39Duzpx2g/RdVQTZscy4mxpZW4nfXh
         pz/g==
X-Gm-Message-State: AOAM530j5vAd1dfg7aRle6C/s6slnmMmB/7rbsggvXfyIB+fW4VxdwK+
        gbc/qqZExMqaHESd9KdXs7ZLIQ==
X-Google-Smtp-Source: ABdhPJzKLxUo3F8LpT0py8NX3d9PVLeW21ZVMvCiRMqKaQMl+9VP6WwlxqUsTydvPwu4FdZbDj+/aA==
X-Received: by 2002:a17:906:2608:: with SMTP id h8mr531968ejc.380.1624461309756;
        Wed, 23 Jun 2021 08:15:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h6sm192144edj.91.2021.06.23.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 08:15:09 -0700 (PDT)
Date:   Wed, 23 Jun 2021 17:15:07 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 01/15] dma-resv: Fix kerneldoc
Message-ID: <YNNP+0YuiqsBxpZK@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
 <87f6529c-caf0-6e4b-6506-b0e2d1a0f9e0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87f6529c-caf0-6e4b-6506-b0e2d1a0f9e0@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 10:31:18AM +0200, Christian König wrote:
> Am 22.06.21 um 18:54 schrieb Daniel Vetter:
> > Oversight from
> > 
> > commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
> > Author: Christian König <christian.koenig@amd.com>
> > Date:   Mon May 10 16:14:09 2021 +0200
> > 
> >      dma-buf: rename and cleanup dma_resv_get_excl v3
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Pushed to drm-misc-next.
-Daniel

> 
> > ---
> >   include/linux/dma-resv.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 562b885cf9c3..e1ca2080a1ff 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
> >   }
> >   /**
> > - * dma_resv_exclusive - return the object's exclusive fence
> > + * dma_resv_excl_fence - return the object's exclusive fence
> >    * @obj: the reservation object
> >    *
> >    * Returns the exclusive fence (if any). Caller must either hold the objects
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
