Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089F738CA10
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 17:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237442AbhEUP2d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 11:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbhEUP2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 11:28:32 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606EFC061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 08:27:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r12so21473180wrp.1
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZVSedFrP+0tpxLZ8F7Yf3PCmIz+TOL1d4BZ3SCIGqFE=;
        b=P2NuhRay4VNswk6R+Mre8cDLI1JTeYXs84jE3PUeuJ9FEjGEy44+eU3AsPhsymn0Y1
         b32L5+CXT9AlhdAFPHq0dTdVjFREUTaNPlay2EoCyebUZE7mS2xazPPpTsLDNYWPZP0c
         fVdScbzLPZLzwbByZaWmThuHDrIQDGkbZ3bbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZVSedFrP+0tpxLZ8F7Yf3PCmIz+TOL1d4BZ3SCIGqFE=;
        b=aVpxSwTJeygRrV7eKuJIK2yFjrhMp4M+WvbeZePjBZVb1k9Khh4Gh1A230hyVE8lJG
         IH0XtTRZrHYl6+c2Rt3CQB+1RcfIjiun/5HdXHFNyZgcX6rnbozVzRvWYnBri91h6ImQ
         MYDBbGwaPIYSRBV7quBbOnJ9BUwwDXZmequgJccLJz0FS41xbab+KyL22y2kZTS4SmH1
         W51OuQ15RBPM16nMbZEznIU+UILqfGENMCqMsqnkJn67W0nMZ2zMLqsvtxezA7+KPh0m
         V7GamoVLxL9Hfg/xJR83UhKzXf1WslcD9khZqoXFtRZSjoEXE7QOnIEHEG7Z7XL81MqU
         CA7Q==
X-Gm-Message-State: AOAM530yISMdkYo28TTUQdeT6mYJ4xOQb82Mg9S9WkjYr92ZlVkt0RRQ
        n4yr8lHV2WCFJQ2/Q6bxzg1Y8w==
X-Google-Smtp-Source: ABdhPJxp5JhtTYd5Eu2lgi4XdHMzE1uuhrrmpFYMpAYZzEYZ74t1J5SVaMxTD3OGi8zkWgSqYJrzZw==
X-Received: by 2002:adf:e50c:: with SMTP id j12mr10249245wrm.418.1621610828056;
        Fri, 21 May 2021 08:27:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m7sm2487624wrv.35.2021.05.21.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 08:27:07 -0700 (PDT)
Date:   Fri, 21 May 2021 17:27:05 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/doc: Includ fence chain api
Message-ID: <YKfRSaG2x6FcrKOL@phenom.ffwll.local>
References: <20210521082457.1656333-1-daniel.vetter@ffwll.ch>
 <b8cfff00-2545-8a09-1591-f2f162e2adb7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8cfff00-2545-8a09-1591-f2f162e2adb7@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 10:26:28AM +0200, Christian König wrote:
> Am 21.05.21 um 10:24 schrieb Daniel Vetter:
> > We have this nice kerneldoc, but forgot to include it.
> 
> Well I didn't forgot it, I just didn't had time to double check that it is
> bug free :)

It does seem to generate decent looking output and no new warnings.

> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks for taking a look, applied to drm-misc-next.
-Daniel

> 
> > ---
> >   Documentation/driver-api/dma-buf.rst | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > index 7f37ec30d9fd..7f21425d9435 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -178,6 +178,15 @@ DMA Fence Array
> >   .. kernel-doc:: include/linux/dma-fence-array.h
> >      :internal:
> > +DMA Fence Chain
> > +~~~~~~~~~~~~~~~
> > +
> > +.. kernel-doc:: drivers/dma-buf/dma-fence-chain.c
> > +   :export:
> > +
> > +.. kernel-doc:: include/linux/dma-fence-chain.h
> > +   :internal:
> > +
> >   DMA Fence uABI/Sync File
> >   ~~~~~~~~~~~~~~~~~~~~~~~~
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
