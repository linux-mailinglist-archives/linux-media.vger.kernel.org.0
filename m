Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A09128F409
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 15:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgJON52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 09:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729498AbgJON52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 09:57:28 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C941EC061755;
        Thu, 15 Oct 2020 06:57:26 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p15so3766179ejm.7;
        Thu, 15 Oct 2020 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eqy7Jg2fPCw6JKPfho3FMkiXLNsZ2vOMeF3B2A8Mojc=;
        b=rWAhsjFjxNV2tSGmRZgmV07f7lkrurQgCx9bPljwSM5dlr+cFdfNcNP8TqDYr6RpmV
         kJKrteO6A0BWcah5RksBap2thah0f3FCug6g9rOyet2tvKS6wLurIXPy+sSprVRdDpXO
         IOnftXETFpeSKiWgWdWvXjoSMVSdBSpoxhozwHThiDlqjFFzd9Q9u5Oejc6caqTfdyr4
         wAOCXRStBQxEeLEOZzM3R4MwjLF5LE07MQ+q90DEXSJbdui7Ftt93dj8CphKOBSXE/1U
         TA9yRTGiIYdnvyfGyrO3NxXvENUg3bN9B4wUskFws67k2dcY70IkWJVmV0uurT9DwBTX
         hYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=eqy7Jg2fPCw6JKPfho3FMkiXLNsZ2vOMeF3B2A8Mojc=;
        b=ZiRcefnAtWU4dqlUXuA72SMS54KcNm9aDkHtBjGQ9wCyuupkluZilFFh9TPHScwi7W
         8SNTDOl3RRuW0maYrpOkuoPfbsNSAyynIRpVjOSya1l/T141p/mrQAiLc2PZE4tJAbrU
         PleDCY9lCIE/DiKkDK7b7d2It09OVTbrp5U/rctufoJPrD0/PaiNA5G0oOy7lSpEssYx
         7nEj37bRSbsFYvcr33mCDlzy8Xb8O3ySkSSFEyW99X046CBWXWhXEqDZwv5pISg0SAhl
         j9tN9Se8jtuS4nfAW0ng/bCHH2xFes9YFBOvwEqUQQ4z9n5S4zItP/rPLienkMstxwLF
         4lIg==
X-Gm-Message-State: AOAM531e1OGsbHjXTFwdukCBri7/gXbcXu0222VzyM8SPB1JANOeaDwZ
        yHzFWCYirDcl6Gd88uEenJwcObVYidNAaw==
X-Google-Smtp-Source: ABdhPJzF6r3Ll5i0gnC5JVk814gY1eCy0pl3+e4WV+JpVGbNy1VCb75/aaDOiQbf2OJV/MzOqd48ag==
X-Received: by 2002:a17:906:f4f:: with SMTP id h15mr4501249ejj.17.1602770245105;
        Thu, 15 Oct 2020 06:57:25 -0700 (PDT)
Received: from [192.168.137.56] (tmo-123-114.customers.d1-online.com. [80.187.123.114])
        by smtp.gmail.com with ESMTPSA id i8sm1619354ejg.84.2020.10.15.06.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 06:57:24 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH v4 01/10] drm/vram-helper: Remove invariant parameters
 from internal kmap function
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
        spice-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-2-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <06cab96a-5224-46dc-dbd2-8eb4950946cc@gmail.com>
Date:   Thu, 15 Oct 2020 15:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015123806.32416-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.10.20 um 14:37 schrieb Thomas Zimmermann:
> The parameters map and is_iomem are always of the same value. Removed them
> to prepares the function for conversion to struct dma_buf_map.
>
> v4:
> 	* don't check for !kmap->virtual; will always be false
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 3213429f8444..2d5ed30518f1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -382,32 +382,22 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>   }
>   EXPORT_SYMBOL(drm_gem_vram_unpin);
>   
> -static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> -				      bool map, bool *is_iomem)
> +static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
>   {
>   	int ret;
>   	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> +	bool is_iomem;
>   
>   	if (gbo->kmap_use_count > 0)
>   		goto out;
>   
> -	if (kmap->virtual || !map)
> -		goto out;
> -
>   	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
>   out:
> -	if (!kmap->virtual) {
> -		if (is_iomem)
> -			*is_iomem = false;
> -		return NULL; /* not mapped; don't increment ref */
> -	}
>   	++gbo->kmap_use_count;
> -	if (is_iomem)
> -		return ttm_kmap_obj_virtual(kmap, is_iomem);
> -	return kmap->virtual;
> +	return ttm_kmap_obj_virtual(kmap, &is_iomem);
>   }
>   
>   static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
> @@ -452,7 +442,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
>   	ret = drm_gem_vram_pin_locked(gbo, 0);
>   	if (ret)
>   		goto err_ttm_bo_unreserve;
> -	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
> +	base = drm_gem_vram_kmap_locked(gbo);
>   	if (IS_ERR(base)) {
>   		ret = PTR_ERR(base);
>   		goto err_drm_gem_vram_unpin_locked;

