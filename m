Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEBC4377CF
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 15:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhJVNTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 09:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJVNTi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 09:19:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7117C061764
        for <linux-media@vger.kernel.org>; Fri, 22 Oct 2021 06:17:20 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u18so4766816wrg.5
        for <linux-media@vger.kernel.org>; Fri, 22 Oct 2021 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xzYyGlNbpTpvd6sNJdRWzkh7BYc81KJzN7aG/37+xnw=;
        b=Wb0IMU0euio0jP04+Ag5kuxoh1MQufsfd2QRp3sI+Az4W30cmQtw3AWAzQ9kufl2u6
         T86AdjyQRsKxL0Rcub27Y0pvseoX06QIabpUUcugftBPPSM1+G3HKXi3jxAVB3sxQlFt
         W1vsR38o56VZW/+5lP81/Wf3mpI513KMR752iV2YyVphELCzOlCQE9+Aj3M51BR8tLed
         xv4dgzu/VuEVzqrD2vZqfgrnRnCEfuCraK+xC+IQNEFburrJFRj1zZI7w16LzDJXKMxl
         WnLkXpRDcn7OfkNHVwIMTI/9CfkObryOC6dmedqohvuRhKWAuH+ZnLdOVk+A0Gz8jMnc
         FMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xzYyGlNbpTpvd6sNJdRWzkh7BYc81KJzN7aG/37+xnw=;
        b=4uxR3WXaCGmDMaHBIeR5JA/9NAk2VnEyFdy+YxCeJ9bZgOeOPL4XNQvuq6sO38TaQv
         4XknLK3ATU0IsBa8qMK8d8QFMEyCbCPerBza8spYQFeEigXnrbgczkh3hgiivvzlHDrD
         pF+ZHirJa4Hror/WqeuevfQTX0rS6uR0+OQW9Hipmo+KhOqxt4I95+eYWLgknbjTpFEv
         rrGikwldKgQzwotjDu8f/2Z56kHFWFNFEUnw4Wy/0pFNHt2D22e3e1nYYv0EnjcFkgXE
         pHLuskrbhak7m04cjP9NdKCdlGXnoF5DXNjm6d0eSjQHsxUwf4OcwmPbWfbctIdrhBMp
         njng==
X-Gm-Message-State: AOAM533uG7QpzmZLSXOuRB/7ov3TvItqpxS4ZvZzt6VxSzZ5MXdiFDE7
        z5tN4435YvfO5hIpGtrbCPU=
X-Google-Smtp-Source: ABdhPJz1bcP9pVdKxvZWKI3UICXsg+Jou2mv8pwgCLGrQkQRbz9ygCJr3KFv1jOtT9CfdADeNSXIRA==
X-Received: by 2002:adf:ab1c:: with SMTP id q28mr15823427wrc.39.1634908639344;
        Fri, 22 Oct 2021 06:17:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a39f:d981:e7cb:e6dc? ([2a02:908:1252:fb60:a39f:d981:e7cb:e6dc])
        by smtp.gmail.com with ESMTPSA id e2sm3047986wrt.8.2021.10.22.06.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 06:17:18 -0700 (PDT)
Subject: Re: [PATCH 26/28] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-27-christian.koenig@amd.com>
 <YWbtV2ZVHg7n1xpm@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cca39a70-5820-18e2-8bda-a4a0d7ad2c31@gmail.com>
Date:   Fri, 22 Oct 2021 15:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbtV2ZVHg7n1xpm@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 13.10.21 um 16:29 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:40PM +0200, Christian König wrote:
>> Makes the handling a bit more complex, but avoids the use of
>> dma_resv_get_excl_unlocked().
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> index 8d048bacd6f0..30712a681e2a 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> @@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   	struct nouveau_bo *nvbo;
>>   	struct nv50_head_atom *asyh;
>>   	struct nv50_wndw_ctxdma *ctxdma;
>> +	struct dma_resv_iter cursor;
>> +	struct dma_fence *fence;
>>   	int ret;
>>   
>>   	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
>> @@ -561,7 +563,13 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   			asyw->image.handle[0] = ctxdma->object.handle;
>>   	}
>>   
>> -	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
>> +	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		/* TODO: We only use the first writer here */
> Same thing as with the atomic core helper. This is actually broken,
> because for atomic we really do _not_ want to wait for any shared fences.
> Which this will do, if there's no exclusive fence attached.
>
> So upgrading my general concern on this and the atomic helper patch to a
> reject, since I think it's broken.

Since we simply had a misunderstanding with that could I get an rb for 
that now?

Thanks,
Christian.

> -Daniel
>
>> +		asyw->state.fence = dma_fence_get(fence);
>> +		break;
>> +	}
>> +	dma_resv_iter_end(&cursor);
>>   	asyw->image.offset[0] = nvbo->offset;
>>   
>>   	if (wndw->func->prepare) {
>> -- 
>> 2.25.1
>>

