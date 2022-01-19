Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13001493EEF
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 18:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356353AbiASRUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 12:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345023AbiASRUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 12:20:03 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBBBC061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:20:03 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id e9-20020a05600c4e4900b0034d23cae3f0so6941392wmq.2
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=x1K+9XuZnU2QXSiIOenVV/0BbioWKHd2vi7gWIUztz4=;
        b=ZjDcbktQX1wrIfebPiKigKTZKneWJd4ErYnf1dt5pNy9Jtv+LToiiIVncgX0W4YBXJ
         WHNrl6WoAOT5RHKyYTIRNkCY95mR+MSqAkbhxhgNxsoQ64IkTvrE4NpPR9/UJm4T40QM
         Ib41oXpbBcJ34yd7Fu2m115MV2byinCv02T54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x1K+9XuZnU2QXSiIOenVV/0BbioWKHd2vi7gWIUztz4=;
        b=hedAmbWyeFmrRFmmbBhgOflYvn9mwroSnAIVYdvBdVXnlsfXS3uZ5U5hykxj9lUZ5X
         WtXGgL+i5joLH2iM5NU5Y82xN280GAHXowCXjanlpdzKbHQMPr9J6DjGV30/S3RQCmnx
         7HbvkmG4qiQwAEWN2wY85R4eldIpMO8GH///xi8VTPBd6dB/hv0nv4ixrFzMak20DIAR
         GDiZ4myHI2zvqU00eimCi83wEGllo4fvsUSAGhnp2IkpKnIIzTUS5mJGwdBMtXCDyYps
         mjJ7EApbMsOdZXraqfwWXbWnMYsf+hFGThgglxyllSdUZglbOIr//Q27aupe0bDo7GyH
         8BRA==
X-Gm-Message-State: AOAM5336wm61DMwNGUah8BdSA72O6hn3TuOTVVpZMCy+WotIfi/+VbkA
        OqcI090WpcRuXpPWTNlkhjuqPWPFDEe0ng==
X-Google-Smtp-Source: ABdhPJwpJ/+gWlQUuTp3j3mXrLlbARjuqjVzw39wNQS0Ltl/R0eyrvLAkK+eazHap9QqPxuGOwVN3Q==
X-Received: by 2002:a05:600c:2216:: with SMTP id z22mr4628205wml.119.1642612801812;
        Wed, 19 Jan 2022 09:20:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x13sm427589wru.28.2022.01.19.09.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:20:01 -0800 (PST)
Date:   Wed, 19 Jan 2022 18:19:59 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/4] dma-buf: warn about containers in dma_resv object
Message-ID: <YehIP4zMfcO79Zrl@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <20220119134339.3102-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 19, 2022 at 02:43:39PM +0100, Christian König wrote:
> Drivers should not add containers as shared fences to the dma_resv
> object, instead each fence should be added individually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 6dd9a40b55d4..e8a0c1d51da2 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  
>  	dma_resv_assert_held(obj);
>  
> +	/* Drivers should not add containers here, instead add each fence
> +	 * individually.
> +	 */
> +	WARN_ON(dma_fence_is_container(fence));

I'm honestly not sure whether this could go boom, so good if we push this
asap and let it soak in linux-next for the entire release cycle.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On the change itself, we'll see what it brings.
-Daniel

> +
>  	fobj = dma_resv_shared_list(obj);
>  	count = fobj->shared_count;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
