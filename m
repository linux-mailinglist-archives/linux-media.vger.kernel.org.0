Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F693B75FD
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 17:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhF2P5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 11:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhF2P5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 11:57:48 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D9BC061766
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 08:55:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u8so13145108wrq.8
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WEojPjsV3ykyxbi9z7NRgZv6sToKhUFLAsfPvjr4z+E=;
        b=kav40qXis5AYEd1L7EDM6xxJivVvxbNSKSq+CBd5s+18VHu75OqZrXoI+sY+3/1k6t
         +00O8pauIDVVjBILhvdBPu4wUErbUhmbZermGLoCv9sB5xLLeUgW9PhBNqBhLLlJd4R0
         eXT70pVBcNa+evB30t/7wTKlxa/kXzLRBdMu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=WEojPjsV3ykyxbi9z7NRgZv6sToKhUFLAsfPvjr4z+E=;
        b=EH44FZPwmXvWgJWYPn1U79A/HudVOfwBJolIE/kWsm28k+f5u+WWTkZVOchveSTmm3
         PNClB3PMuKTB7R3lQr37IuFRTw7gtrTMa7ISd5+A2eLg8wHCebeSvUyZZCA8sgQXRGvM
         SlNvrChUdvMZsOv7VXhhH1eh7artCn+oZxclixighJjL2Coa4E8E6IhLZYAn/a70f+G4
         OtW3JoIqNftTsF+XuKTFbtHJGMCHuGRom3QFrFRAtat3PJh09x5Iu42VpMR2ftmdQTtB
         6hmWod8IPqdwDhPuwKMh1LANayR6Ulme98vUBcg/hPjpQdf7C6KCNG7R82JjElDMdDEW
         0pOA==
X-Gm-Message-State: AOAM5318esbjIJQ4bwi6baLAJW3O5X9VaJSIJ3cgWED45H5pKGJuGEqw
        bTrYaEwkzMR/0uhkjDAQ04We2A==
X-Google-Smtp-Source: ABdhPJwy//RfOpOtuDUFzUPw0qGyBWCU1xYg2FxNtD+pBORPuM1k7hT2WqXFwV1cl1tJjWezk3iDOA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr8264853wrp.331.1624982118145;
        Tue, 29 Jun 2021 08:55:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t16sm4438422wrx.89.2021.06.29.08.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 08:55:17 -0700 (PDT)
Date:   Tue, 29 Jun 2021 17:55:15 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH -next] <linux/dma-resv.h>: correct a function name in
 kernel-doc
Message-ID: <YNtCYyHXOrObRUDK@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20210628004012.6792-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210628004012.6792-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 27, 2021 at 05:40:12PM -0700, Randy Dunlap wrote:
> Fix kernel-doc function name warning:
> 
> ../include/linux/dma-resv.h:227: warning: expecting prototype for dma_resv_exclusive(). Prototype was for dma_resv_excl_fence() instead
> 
> Fixes: 6edbd6abb783d ("ma-buf: rename and cleanup dma_resv_get_excl v3")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org

Queued up, thanks for your patch (and the handy -next signifier in the
patch tag). I think Christian had the fix for this already, but queued up
in the next branch (for the 5.15 merge window, we're already prepping
stuff there to avoid late feature additions for 5.14), so applied yours
once more to the right tree.

Cheers, Daniel

> ---
>  include/linux/dma-resv.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210625.orig/include/linux/dma-resv.h
> +++ linux-next-20210625/include/linux/dma-resv.h
> @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struc
>  }
>  
>  /**
> - * dma_resv_exclusive - return the object's exclusive fence
> + * dma_resv_excl_fence - return the object's exclusive fence
>   * @obj: the reservation object
>   *
>   * Returns the exclusive fence (if any). Caller must either hold the objects

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
