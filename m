Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BEF39AF37
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 02:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhFDAwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 20:52:53 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:36471 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFDAww (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 20:52:52 -0400
Received: by mail-lf1-f52.google.com with SMTP id v22so10168021lfa.3
        for <linux-media@vger.kernel.org>; Thu, 03 Jun 2021 17:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Iwimm5kt1cPOS3WktKznx8Tm3YSJawu3yuys6bu5NIU=;
        b=Gs5lp5tfCZGV7HaOOLREF2vdGYMqTNw3RNRfVR02KWcpUPpLyAkDZxU7KzZFEpILnW
         TS0t5Tw3jHP2Ob59G1pCQ6LYWQnMUKiuyHK3lTTIefXm7iqwG9uq0eGTtxJAGrSis2Ek
         NgYpfpSBSpngnF6vNhFkr+azyg64Nbj9wU4YUX7k4Dz0Mu3a5c83ByA1JJIQ++3PzJA6
         vDwZiKtp6AAOuGW+JBWR48V9np7igTsW2Fn7/DOOm8HTKOkQD5ZzGiEpusGlmlULy59v
         kW8Wrs3I4DQqP6mQqK141gPFmWUyx5cOt7ntAA6X/nilYQsGyV/6fTzlwq5TQsgRvMrV
         133A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Iwimm5kt1cPOS3WktKznx8Tm3YSJawu3yuys6bu5NIU=;
        b=c1MEI4gUfE4gKcAuTAzO6m4SMPv04g+TP+Lg1VNaZ+KDVSlsuc6tozktq+fiqi93nX
         yQRZ3YGN1bS/MLZnI6fnh4YvkwZAF4swEGIsUpf50cbWdEn9wV6xwvIgO/BVrYsVWv6o
         Dq/Cvhs18AZk9197HI7mkxOZTWtKYTNBuKWdRfnzl+UH1AHlEO1i/44t9y+ij1nVNeRQ
         NreUvBALppr+c0lfCeQaoJM4lOp2BaD+AyQguK+l6np9jpSq4FDeRW/Kw4hyf87SgUKh
         fFbQogsOOlFuvGMLiw90Xkfq87DVtGqUXz1phgzPxN8D9hIkQO60M40W9i+RLmVShQOO
         QCWQ==
X-Gm-Message-State: AOAM530yXZ8H9TxVG/q7jA2z9YbsliCWBonv5WJN90ZOm4GI7TKgzQpl
        5/AlxeuYt0MMFUnNxxlQJEnLfg==
X-Google-Smtp-Source: ABdhPJweJXWYYmQjui7kNiJ8H+bSQ43RmGPF8suRIMZscFcJCMH54wVPsAk3g0wsQCdvPIOhcg2PRA==
X-Received: by 2002:a05:6512:32ab:: with SMTP id q11mr961056lfe.21.1622767793930;
        Thu, 03 Jun 2021 17:49:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p26sm448515ljn.33.2021.06.03.17.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 17:49:53 -0700 (PDT)
Subject: Re: [RESEND 12/26] drm/msm/msm_gem: Demote kernel-doc abuses
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-13-lee.jones@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b506aea4-0612-0ac4-1ef2-45b0cc80e7f1@linaro.org>
Date:   Fri, 4 Jun 2021 03:49:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-13-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2021 17:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/msm/msm_gem.c:364: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   drivers/gpu/drm/msm/msm_gem.c:763: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 56df86e5f7400..15434deb19334 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -372,7 +372,7 @@ static void del_vma(struct msm_gem_vma *vma)
>   	kfree(vma);
>   }
>   
> -/**
> +/*
>    * If close is true, this also closes the VMA (releasing the allocated
>    * iova range) in addition to removing the iommu mapping.  In the eviction
>    * case (!close), we keep the iova allocated, but only remove the iommu
> @@ -773,7 +773,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
>   			0, (loff_t)-1);
>   }
>   
> -/**
> +/*
>    * Unpin the backing pages and make them available to be swapped out.
>    */
>   void msm_gem_evict(struct drm_gem_object *obj)
> 


-- 
With best wishes
Dmitry
