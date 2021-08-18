Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71523F05B8
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238849AbhHROHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238763AbhHROHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:07:48 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E44C0617AE
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:07:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id gt38so5225732ejc.13
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=64zifREinBHAwmFxgrDBcSqFtKr4jlCZS5WKAwKoAXg=;
        b=Dqv70yX93zXZr6jzmhvMeWNIKTnXuLw0MEEK7GV3TiU2x5BvM11uG8NZWDKBrQ8KFf
         Uod5IWznhUW0T4R7w/UCTcOGE+TI0Bz76CA3wlCkzsNkXqm7X8Esf7ozHWvrYptriVmT
         0QXozwG4Q6j7K+YdY16ETjLy6mMCgA7F1hAs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=64zifREinBHAwmFxgrDBcSqFtKr4jlCZS5WKAwKoAXg=;
        b=c9pSdD7GsH0tkllazTTExMb/PW7s8+Atbz7KvWYYijjWmJALtCh2eO86w1sSo5ARIv
         KIbQIjzRxQ0eZOB8rd93U+RMeDbutiOC7rDAPfeH3f5zHtGXpzKdvy7BmcOUb+Qd67ky
         8GMs3Yq6J78LykZl6C94iFsyEWlW3n79rh2Jx0jIwkaX53K5UCDhJ4tlGpZMxqGbtgbD
         bmTTJAzktBtICxixnIHvYFnigqwCsDKSxKXYQ5043BZ6ffkP9Fbs54epg8+FXM3OXZr5
         eH9riGyvIiMlzvVTKRxRKWVJs1t0SrZ3rtDg6N3o1znH1Y2nkqkzJfwudAEDouPrGCyA
         uK8w==
X-Gm-Message-State: AOAM533U/0B3QSnGMB4b6TH8CTfekirFu+BkG7ykXvL+jeaCPj/vsNxB
        soTYNmUnZR58phBAGfp/JHS6dA==
X-Google-Smtp-Source: ABdhPJxqqKOBz+of90XjDMG6gzll1zUAgspFw9u1WR+Axp7BK9MoT+c8eS8ZPFhua2tvp7B7/05Hfg==
X-Received: by 2002:a17:906:8444:: with SMTP id e4mr10116391ejy.516.1629295631579;
        Wed, 18 Aug 2021 07:07:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m6sm40070edc.82.2021.08.18.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:07:11 -0700 (PDT)
Date:   Wed, 18 Aug 2021 16:07:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Wentao_Liang <Wentao_Liang_g@163.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/prime: fix a potential double put (release) bug
Message-ID: <YR0UDT9G4G37hHtL@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Wentao_Liang <Wentao_Liang_g@163.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210818130231.3484-1-Wentao_Liang_g@163.com>
 <14aa6dfe-faba-8632-01a4-8119f199005c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14aa6dfe-faba-8632-01a4-8119f199005c@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 03:25:59PM +0200, Christian König wrote:
> Am 18.08.21 um 15:02 schrieb Wentao_Liang:
> > In line 317 (#1), drm_gem_prime_import() is called, it will call
> > drm_gem_prime_import_dev(). At the end of the function
> > drm_gem_prime_import_dev() (line 956, #2), "dma_buf_put(dma_buf);" puts
> > dma_buf->file and may cause it to be released. However, after
> > drm_gem_prime_import() returning, the dma_buf may be put again by the
> > same put function in lines 342, 351 and 358 (#3, #4, #5). Putting the
> > dma_buf improperly more than once can lead to an incorrect dma_buf-
> > > file put.
> > We believe that the put of the dma_buf in the function
> > drm_gem_prime_import() is unnecessary (#2). We can fix the above bug by
> > removing the redundant "dma_buf_put(dma_buf);" in line 956.
> 
> Guys I'm getting tired of NAKing those incorrect reference count analysis.
> 
> The dma_buf_put() in the error handling of drm_gem_prime_import_dev()
> function is balanced with the get_dma_buf() in the same function directly
> above.
> 
> This is for the creating a GEM object for a DMA-buf imported from other
> device use case and certainly correct.
> 
> The various dma_buf_put() in drm_gem_prime_fd_to_handle() is balanced with
> the dma_buf_get(prime_fd) at the beginning of the function.
> 
> This is for extracting the DMA-buf from the file descriptor and keeping a
> reference to it while we are busy importing it (e.g. to prevent a race when
> somebody changes the fd at the same time).
> 
> As far as I can see this is correct as well.

Yeah the analysis is just high-grade nonsense. The current code looks
correct, the analysis presented here, not.
-Daniel


> 
> Regards,
> Christian.
> 
> > 
> >   314     if (dev->driver->gem_prime_import)
> >   315         obj = dev->driver->gem_prime_import(dev, dma_buf);
> >   316     else
> >   317         obj = drm_gem_prime_import(dev, dma_buf);
> >   				//#1 call to drm_gem_prime_import
> > 				//   ->drm_gem_prime_import_dev
> > 				//   ->dma_buf_put
> >   ...
> > 
> >   336     ret = drm_prime_add_buf_handle(&file_priv->prime,
> >   337             dma_buf, *handle);
> > 
> >   ...
> > 
> >   342     dma_buf_put(dma_buf);  //#3 put again
> >   343
> >   344     return 0;
> >   345
> >   346 fail:
> > 
> >   351     dma_buf_put(dma_buf); //#4 put again
> >   352     return ret;
> > 
> >   356 out_put:
> >   357     mutex_unlock(&file_priv->prime.lock);
> >   358     dma_buf_put(dma_buf);  //#5 put again
> >   359     return ret;
> >   360 }
> > 
> >   905 struct drm_gem_object *drm_gem_prime_import_dev
> >   							(struct drm_device *dev,
> >   906                         struct dma_buf *dma_buf,
> >   907                         struct device *attach_dev)
> >   908 {
> > 
> >   ...
> > 
> >   952 fail_unmap:
> >   953     dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> >   954 fail_detach:
> >   955     dma_buf_detach(dma_buf, attach);
> >   956     dma_buf_put(dma_buf);  //#2 the first put of dma_buf
> > 								//	 (unnecessary)
> >   957
> >   958     return ERR_PTR(ret);
> >   959 }
> > 
> > Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
> > ---
> >   drivers/gpu/drm/drm_prime.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 2a54f86856af..cef03ad0d5cd 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -953,7 +953,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
> >   	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> >   fail_detach:
> >   	dma_buf_detach(dma_buf, attach);
> > -	dma_buf_put(dma_buf);
> >   	return ERR_PTR(ret);
> >   }
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
