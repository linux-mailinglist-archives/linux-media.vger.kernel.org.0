Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B787F533D75
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 15:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241789AbiEYNOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 09:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240581AbiEYNOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 09:14:01 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096251F609
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 06:13:57 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso1107785wma.0
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lmbJRuO8uHeaBnVDzKY/ZYIDnHRrOxdK5BjQnLSy42w=;
        b=Pg/PqdMHjPIw9ISgM0XG0Quw8mgnBQMljExJqpBKyIldTVVwIG4CebJ6u7VjSJmlkI
         /68YGv7wGJsRAJp+58CvnscocvB6gGa7TlmeZ807OmyQidk/oltdSjMSSzjzhGgRKhZz
         yAm2MJk57oAqUOb5dFVPdxBCc69cqVB65Y1y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lmbJRuO8uHeaBnVDzKY/ZYIDnHRrOxdK5BjQnLSy42w=;
        b=z7MVKe+6MShdVEOApWulPhFKMy8pw2HPIgI3mVOJyjpOHrSjQrma6tW457pVIr80K+
         FLrc38lVYzh+AuAJJd1Ry7C364Ieg5RWwnYU0Lt+NJqYScARHKkl3Kx20Q8jbEYf3lAr
         XYITvAwgBYv9RazBrO13ZcGxWEeXGIzDSb5L0pK0P/5ErC280OuIJCVe3RY+pDIE2x7c
         JN8eTdBlv6mLqK9D5jK+13e9PU86WhVfupRWIOn+t1i+Jo9yNW4WMWxdrZiTb94pd+Ex
         W3J08VsOnD50xuf7DLKUpokStWV4AelT198n+RTeeC6uiVXr1m00xoFK1zZWoUz5etkB
         fPZw==
X-Gm-Message-State: AOAM530qX+Vyh3lEMV8WszwKRaVZze18Wu8PMT0OMD/LPmRK7F4OO/vN
        eVy4cXO4E0QekJWPb1v2++epqg==
X-Google-Smtp-Source: ABdhPJwxgdGa79ycChw5p3tzy0jtFWtqcvHwQvr8K6MJgm1hA+uLhjMa/mzAxYHClQnbnKrzvuq1tQ==
X-Received: by 2002:a05:600c:350f:b0:397:7204:ce8e with SMTP id h15-20020a05600c350f00b003977204ce8emr1636850wmq.0.1653484435543;
        Wed, 25 May 2022 06:13:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p40-20020a05600c1da800b003973a3fe4fasm2216698wms.42.2022.05.25.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 06:13:54 -0700 (PDT)
Date:   Wed, 25 May 2022 15:13:52 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Message-ID: <Yo4rkGsNuG8bDRp0@phenom.ffwll.local>
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <20220506141009.18047-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506141009.18047-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 06, 2022 at 04:10:07PM +0200, Christian König wrote:
> dma_fence_chain containers cleanup signaled fences automatically, so
> filter those out from arrays as well.
> 
> v2: fix missing walk over the array
> v3: massively simplify the patch and actually update the description.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/linux/dma-fence-unwrap.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index e7c219da4ed7..a4d342fef8e0 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>   * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
>   * potential fences in them. If @head is just a normal fence only that one is
>   * returned.
> + *
> + * Note that signalled fences are opportunistically filtered out, which
> + * means the iteration is potentially over no fence at all.
>   */
>  #define dma_fence_unwrap_for_each(fence, cursor, head)			\
>  	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
> -	     fence = dma_fence_unwrap_next(cursor))
> +	     fence = dma_fence_unwrap_next(cursor))			\
> +		if (!dma_fence_is_signaled(fence))
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
