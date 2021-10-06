Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405F44239B1
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 10:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237595AbhJFI0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 04:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237411AbhJFI0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 04:26:16 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CF2C061749
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 01:24:24 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t8so6342984wri.1
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bRu/Ff9Ir38OPXGTArHMIziqICHLOKILZrD4xpaYf/Q=;
        b=R+yfWP9qxbK9aHMSr5GWkjaYWvXsWrI0XNXGmiYU1bNPIbXvX6GkBU+j+/KL03S0UR
         swM/2xWcv2R/clqSJrml8rq1s28Aot+92k/wDrwCaV5bUO19ZAVQkVerRH64gg9ZAuAC
         ViHDpR2aYhCEfaifhiujozwCq0xAGLQuYJoRUkkA0wNZivsq9fD4EHPKGUsJxsamJ4ay
         IcDDP6YuRdIYRzq+gL4HtoXpQQzj5BraPHWULbCEIWswVGF6w5TdfZ6wV2Vnub/C6+AX
         FyB5iGET/WHyCDwTnIwEI5Z3STdwUOY66PieAlzMGSZOJU1/PwcosK96oSJPxjy/O2SI
         kNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bRu/Ff9Ir38OPXGTArHMIziqICHLOKILZrD4xpaYf/Q=;
        b=gTnmyAI6u2gWSII16ht3s//uSmSgww4ytL6ANrP3ChoTnFZAVsp3U0ixLqgoFqV+xz
         gmu6OyUpPhTivsdLp75r+X2UG/hzZzUExlswsw8puQrL9gAjArt97N2LPCoQsSd1Pr47
         txQezDoq4zTNc8lqc0vLPSE+lQkatV4Di1Rp5uLRvygxzghxgkzHPPTykeppesjTC4ef
         oBIa4o9NE4N72rU3krNSfxUnaKy/btvS1mF+HeuVl3BvODrhvHINu5TPo86J4WWO52RU
         k0e7oBBdT2klVo462+AdumaLDgulrnAqe9aD1rpf7rO3re7Mg4vpP7cBi6bDXvNw3bTB
         HzOw==
X-Gm-Message-State: AOAM532ArvCm+FHkNXYGOk+Sm4nAb4v5cGldppPUOU5bxkMWWnumxZRG
        lUsE3evxLFOqYHGx06LGlCQ=
X-Google-Smtp-Source: ABdhPJwSKB9J69MYCyfYWofckhT3E2FNK+4DeytJ3TbkoGWD45VMLJp8ZTF6S4Pcir1KcpDXDOSOkA==
X-Received: by 2002:a05:600c:a43:: with SMTP id c3mr8351784wmq.193.1633508662785;
        Wed, 06 Oct 2021 01:24:22 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm5176825wmq.23.2021.10.06.01.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 01:24:22 -0700 (PDT)
Subject: Re: [PATCH 02/28] dma-buf: add dma_resv_for_each_fence v2
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     "tvrtko.ursulin@linux.intel.com >> Tvrtko Ursulin" 
        <tvrtko.ursulin@linux.intel.com>
Cc:     daniel@ffwll.ch,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-3-christian.koenig@amd.com>
Message-ID: <3b946100-cf70-ff83-e090-2d8cbbc52fd6@gmail.com>
Date:   Wed, 6 Oct 2021 10:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005113742.1101-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good morning, could I get an rb for that patch here as well?

I've pushed the first few with Daniel's and your rbs, but this one here 
is blocking all the rest.

Thanks,
Christian.

Am 05.10.21 um 13:37 schrieb Christian König:
> A simpler version of the iterator to be used when the dma_resv object is
> locked.
>
> v2: fix index check here as well
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 49 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   | 19 +++++++++++++++
>   2 files changed, 68 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 3cbcf66a137e..231bae173ef1 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -423,6 +423,55 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
>   }
>   EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>   
> +/**
> + * dma_resv_iter_first - first fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
> +{
> +	struct dma_fence *fence;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->index = 0;
> +	cursor->fences = dma_resv_shared_list(cursor->obj);
> +
> +	fence = dma_resv_excl_fence(cursor->obj);
> +	if (!fence)
> +		fence = dma_resv_iter_next(cursor);
> +
> +	cursor->is_restarted = true;
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_first);
> +
> +/**
> + * dma_resv_iter_next - next fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
> +{
> +	unsigned int idx;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->is_restarted = false;
> +	if (!cursor->all_fences || !cursor->fences ||
> +	    cursor->index >= cursor->fences->shared_count)
> +		return NULL;
> +
> +	idx = cursor->index++;
> +	return rcu_dereference_protected(cursor->fences->shared[idx],
> +					 dma_resv_held(cursor->obj));
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_next);
> +
>   /**
>    * dma_resv_copy_fences - Copy all fences from src to dst.
>    * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 764138ad8583..3df7ef23712d 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -179,6 +179,8 @@ struct dma_resv_iter {
>   
>   struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
>   struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
>   
>   /**
>    * dma_resv_iter_begin - initialize a dma_resv_iter object
> @@ -244,6 +246,23 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   	for (fence = dma_resv_iter_first_unlocked(cursor);		\
>   	     fence; fence = dma_resv_iter_next_unlocked(cursor))
>   
> +/**
> + * dma_resv_for_each_fence - fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @obj: a dma_resv object pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object while holding the
> + * &dma_resv.lock. @all_fences controls if the shared fences are returned as
> + * well. The cursor initialisation is part of the iterator and the fence stays
> + * valid as long as the lock is held.
> + */
> +#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> +	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> +	     fence = dma_resv_iter_first(cursor); fence;	\
> +	     fence = dma_resv_iter_next(cursor))
> +
>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>   

