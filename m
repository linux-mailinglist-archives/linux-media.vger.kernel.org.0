Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F6324065C
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 15:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgHJNG0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 09:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgHJNGZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 09:06:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE1FC061788
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 06:06:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 9so7553654wmj.5
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GPx3S/8jhM90DHfD4TRK0ne1wHxOQ88UPQC+FKKE7b4=;
        b=ZJTdwcMw05cWS5PqS2LysIVEc5cxxTh/xM1RqHbECyfWRIXZvCen0clWxvPs6VsL8q
         Cq6EQCAbihLLjPKPJyDKllfTFcwVKAcaBSZfEd8ufk46Z2BFSR46ol4PLs7U8qV3LRsD
         Jlxb5d3xrm9mAiALhf8zqBuK3j/akqDOrDtQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=GPx3S/8jhM90DHfD4TRK0ne1wHxOQ88UPQC+FKKE7b4=;
        b=d0WdAx9KaBCTf7BLvyQ+DTV9qyqVSKV4REVCK/c5jVcDDMQCjpAhGjmdBdgFZQmuZ7
         kjTpSjJhm5iFU+QkAt/DuyIorpUT275eL87ijkwiHNxZv6+2p/DmgR6h5jnz2duAcs5r
         uug8o2NdwMLGhhgPcTnkh7heL/em/osqHA40XemhTfaaIk8s+9SqagaCZL2YuNe3lRSK
         PoyNFalLDweCxtWeMBjPtSzRRJr5LbplCn4B5zXxpumZ6p54is0mfJ4fcjISCGZMbqn1
         PmaSfSyoufRKA2E5UeRj3JNgLiZIF0wgdv85YVWbFFWnNvJhnJ86YWx9iikvz23gYOdM
         EQyQ==
X-Gm-Message-State: AOAM530MDhDOpZiVS4S1GsIv1Ybs9Fhsal4v8N7Dc3WalccfkjTJI2jZ
        +F1yP57ssSk+qPpYmNNeYEtPOQ==
X-Google-Smtp-Source: ABdhPJyEBEPA21RLrPg4igFyKps9/jMj+ZOxleXUovW4dpHkDIerMq8VNi+ipVYxHqvklkBZYu8Xbw==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr27324020wml.189.1597064783265;
        Mon, 10 Aug 2020 06:06:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p6sm22227267wmg.0.2020.08.10.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 06:06:22 -0700 (PDT)
Date:   Mon, 10 Aug 2020 15:06:20 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf.rst: repair length of title underline
Message-ID: <20200810130620.GS2352366@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
        linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20200809061739.16803-1-lukas.bulwahn@gmail.com>
 <7d434810-79bd-89a3-18f8-c5c2a2524822@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d434810-79bd-89a3-18f8-c5c2a2524822@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 10, 2020 at 01:25:40PM +0200, Christian König wrote:
> Am 09.08.20 um 08:17 schrieb Lukas Bulwahn:
> > With commit 72b6ede73623 ("dma-buf.rst: Document why indefinite fences are
> > a bad idea"), document generation warns:
> > 
> >    Documentation/driver-api/dma-buf.rst:182: \
> >    WARNING: Title underline too short.
> > 
> > Repair length of title underline to remove warning.
> > 
> > Fixes: 72b6ede73623 ("dma-buf.rst: Document why indefinite fences are a bad idea")
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> 
> Should I pick it up into drm-misc-next?

Yes please. For the future if you need to check if someone has commit
rights and can push themselves:

https://people.freedesktop.org/~seanpaul/whomisc.html

Yeah with gitlab this would all be a bit more reasonable, but we get by
meanwhile :-)

Cheers, Daniel
> 
> > ---
> > Daniel, please pick this minor non-urgent fix to your new documentation.
> > 
> >   Documentation/driver-api/dma-buf.rst | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > index 100bfd227265..13ea0cc0a3fa 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -179,7 +179,7 @@ DMA Fence uABI/Sync File
> >      :internal:
> >   Indefinite DMA Fences
> > -~~~~~~~~~~~~~~~~~~~~
> > +~~~~~~~~~~~~~~~~~~~~~
> >   At various times &dma_fence with an indefinite time until dma_fence_wait()
> >   finishes have been proposed. Examples include:
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
