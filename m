Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB58A3B7648
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 18:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhF2QNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 12:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhF2QNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 12:13:52 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BE3C061766
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 09:10:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l1so1786787wme.4
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 09:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IIlOYRCaj+ShA3h8Y+rmk3/XB2OjyG065It4K03dEsc=;
        b=Yyy576Z7dNJUzHPJQU8uai6Yh+f+9AFdsJTPBOSkDJc8ioZYNmvXnfjKyVGeNJqsED
         48c0dTJtLxOfOKqnTxKBgEQeXgSAYDQyfodxUHdVOyU+rqjzpGouc390+Uc4h3v6O+mg
         bQFzBvUdniaLAaBOoIYUOq7VAcBK6OleLzvCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=IIlOYRCaj+ShA3h8Y+rmk3/XB2OjyG065It4K03dEsc=;
        b=RsiOj7F9MvplRN3LWR+hRyaRL/qAu33WZbOM4j30b4kCV8E3GXpxCS/nTUwoefwzFH
         qL0hQn1A7HCGurJd4+oNwjxFsLaCO+Yi7/sfKwdDu6+5j87/m/cqjKUY54XOuH0HBSa+
         LKENQO5F7ZAWjn8l41JTD8DKBMJK91Fcz685YEfIgfJpyRKSFd9j6pvFC1n1SDgAYjrt
         wdal94tHno96RKJna8UOwYr9queapvkxCI4rQU1YVxTHZ+8T5x8bUs4WmL8pQnJ81tWN
         Gl9KYhUHEWbfq7UPWbyv5XFfpfaFQY+Y6p18+bpAYzChOcjuaICyHrj3l/Iu8nAA8rdO
         n2KQ==
X-Gm-Message-State: AOAM533Zv3fxOlvAi59yeq33OoenkeSlYgT6dE4y4jKAnDN35N5VsUzp
        CpLl5nv8POc65vYGOVbQJEUNjQ==
X-Google-Smtp-Source: ABdhPJxy7OleyqTIDl/EevkdvTG2Irn85jwGL0g0GTH5GZoLarLIjRNeB5FJ3+VSxmkQV0t8tsRdlg==
X-Received: by 2002:a05:600c:4f96:: with SMTP id n22mr33649331wmq.116.1624983020119;
        Tue, 29 Jun 2021 09:10:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u12sm19552686wrq.50.2021.06.29.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 09:10:19 -0700 (PDT)
Date:   Tue, 29 Jun 2021 18:10:17 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH -next] <linux/dma-resv.h>: correct a function name in
 kernel-doc
Message-ID: <YNtF6aiUSqngxXoq@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20210628004012.6792-1-rdunlap@infradead.org>
 <YNtCYyHXOrObRUDK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YNtCYyHXOrObRUDK@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 29, 2021 at 05:55:15PM +0200, Daniel Vetter wrote:
> On Sun, Jun 27, 2021 at 05:40:12PM -0700, Randy Dunlap wrote:
> > Fix kernel-doc function name warning:
> > 
> > ../include/linux/dma-resv.h:227: warning: expecting prototype for dma_resv_exclusive(). Prototype was for dma_resv_excl_fence() instead
> > 
> > Fixes: 6edbd6abb783d ("ma-buf: rename and cleanup dma_resv_get_excl v3")

Script caught a lost      'd' here, I fixed that up when applying.
-Daniel

> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Queued up, thanks for your patch (and the handy -next signifier in the
> patch tag). I think Christian had the fix for this already, but queued up
> in the next branch (for the 5.15 merge window, we're already prepping
> stuff there to avoid late feature additions for 5.14), so applied yours
> once more to the right tree.
> 
> Cheers, Daniel
> 
> > ---
> >  include/linux/dma-resv.h |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- linux-next-20210625.orig/include/linux/dma-resv.h
> > +++ linux-next-20210625/include/linux/dma-resv.h
> > @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struc
> >  }
> >  
> >  /**
> > - * dma_resv_exclusive - return the object's exclusive fence
> > + * dma_resv_excl_fence - return the object's exclusive fence
> >   * @obj: the reservation object
> >   *
> >   * Returns the exclusive fence (if any). Caller must either hold the objects
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
