Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D32C318A0EC
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 17:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCRQx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 12:53:26 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34539 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgCRQx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 12:53:26 -0400
Received: by mail-wr1-f65.google.com with SMTP id z15so31282309wrl.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=aeYeB3CANOqnObt2Bin2EEGlMMGDpXacO9WnKapSaKA=;
        b=NeTnpXGGHGa+LDQ3odBkmH8XgCu4vP8uAIprLGgGqv2QtxLAcJwWhqAtAr7VcXEt8I
         Ci+OaEJr91TwVj2Kw3wZ10uq7R96YpdTA0c28dspF+8eZWa9PO1i0PhuOW3ixM15mLdk
         w8fejndds4VLW7Zj+YwlpD7TQv2BaT0HzHWZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=aeYeB3CANOqnObt2Bin2EEGlMMGDpXacO9WnKapSaKA=;
        b=WBNIm3x6irIya9kvhW5xvUKa0isV2OyZlUAstpXqza14NgwfEmkgr3Iv8tZfADSm2b
         /NrFcSq/dKQ8M9Z2NbXuwP1MNlPCtAVi73JDkSe6ERz7EEEPlib1VqrwFP3dUrbbNVpK
         2oVsm1tzRInVhcP44uwbawYpXh4DE6unquEkPNRE4JurSV/lyksF2f5lLlH0UFE2Tu2E
         dpVNBPM5ccNAnDy5vvLKvFnOU1WOoECLlBYgIPCOXzlYgnwoz1Poe+HRXGqJOXQ8XD+L
         +rLl78vn50XXut2XUi7GOh0mLSMYfCGbg4oNDGC3y3cwWm/db2XPTTPEEsSQQfZTLR39
         tK7g==
X-Gm-Message-State: ANhLgQ1rIOAxxvr4KqbM80MC671eaer9E79CmEeP63OukzZ/uN/X779K
        nNyYIBRdik5V3aGzxbDymJW9lgpkCs1NnIza
X-Google-Smtp-Source: ADFU+vtcYeHhH9FydXIAf6eT5ZTQaTUtKOqGS0qBVL7DDqzoRzo3pE0LLtATqw5ydhtSupfkeFxxrQ==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr6775194wro.423.1584550404216;
        Wed, 18 Mar 2020 09:53:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o23sm10472342wro.23.2020.03.18.09.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 09:53:23 -0700 (PDT)
Date:   Wed, 18 Mar 2020 17:53:21 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
Message-ID: <20200318165321.GZ2363188@phenom.ffwll.local>
Mail-Followup-To: Sumit Semwal <sumit.semwal@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
 <CAO_48GH1YkA4mvjyQ=88VRrDPc4Kh8fiFsm-MOaNFfWhhaxfbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO_48GH1YkA4mvjyQ=88VRrDPc4Kh8fiFsm-MOaNFfWhhaxfbw@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 18, 2020 at 09:16:17PM +0530, Sumit Semwal wrote:
> Hello Daniel,
> 
> Thanks for the patch.
> 
> On Wed, 18 Mar 2020 at 02:26, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > We're getting some random other stuff that we're not really interested
> > in, so match only word boundaries. Also avoid the capture group while
> > at it.
> >
> > Suggested by Joe Perches.
> >
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: Joe Perches <joe@perches.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks for your ack, patch applied.
-Daniel

> > ---
> > v2: No single quotes in MAINTAINERS (Joe)
> > v3: Fix typo in commit message (Sam)
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3005be638c2c..ed6088a01bfe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5025,7 +5025,7 @@ F:        include/linux/dma-buf*
> >  F:     include/linux/reservation.h
> >  F:     include/linux/*fence.h
> >  F:     Documentation/driver-api/dma-buf.rst
> > -K:     dma_(buf|fence|resv)
> > +K:     \bdma_(?:buf|fence|resv)\b
> >  T:     git git://anongit.freedesktop.org/drm/drm-misc
> >
> >  DMA-BUF HEAPS FRAMEWORK
> > --
> > 2.25.1
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
