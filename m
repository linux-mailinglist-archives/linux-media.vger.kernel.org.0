Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0E458EB85
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 13:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbiHJLvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 07:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiHJLvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 07:51:25 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EDA6C774
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:51:24 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z12so17451891wrs.9
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
        bh=LDfEYb5ujn1T+y8ZdrYflg44hRzKk8763KEYo/Jqooc=;
        b=VsfOftKCJHPLqJmZsbYKzFsC5wiVuqV/8JCiYAVptPF/YYd4ipgoyhzI0tuqldHgzH
         Ha0LF8Pybi7f5hyNzZO0APTqTQNuLpyB6F/dytyZsNhJNqrIqH+9NgHgqta8zn5/fan6
         gFqzx8Yco8TA6ivlfRBarvt+OEzZ4TOS10urY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=LDfEYb5ujn1T+y8ZdrYflg44hRzKk8763KEYo/Jqooc=;
        b=wobWm/lcg29V5P2NNwf8q2zQODdIauhmG97SjLi9DY6l8BvDKPmtfpTySHJWLwLMpV
         yuN6/2NdCgYmAvt7xEhDvU9Q3fzcps8hWuUN+f/ZN8hYEjC7+vdPo2gV+4ePM0P+emdx
         i8JMg+Aby5VJ+P3uDgFxLUUdHIIsHvnrV5NSb4xvYtBIMN+JLwvicS2YzZ2o7pylVmxY
         urKg78f95IxbzAqgU3/eJ06CEVWxb4OBIRREosAV6jXxUwTS3ILtD/p3kGCYCapADMar
         bh36bXswpfNo2DOdPrmfcx9DVOBblAmXxJOl7jgEg4zPE3aJYyTTYDxSlwmKLVenW5nZ
         gcjg==
X-Gm-Message-State: ACgBeo3u/T4YeDSTZ5sjk3X3THScwNjnEwILaM2bq7+y40UDPpC+Ukzk
        uw3HHOk/kJoPAkn08/HpsigVc0XTC227uHMn
X-Google-Smtp-Source: AA6agR5l9QMtWYfltZKz7qPF62egv4G39OHczeBaxjZ9CRWiL1TB75raui6OQT3z6KcXev2/EWNGFw==
X-Received: by 2002:a05:6000:61c:b0:220:6425:c113 with SMTP id bn28-20020a056000061c00b002206425c113mr17742344wrb.612.1660132282843;
        Wed, 10 Aug 2022 04:51:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b0021edb2d07bbsm15588661wrn.33.2022.08.10.04.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 04:51:22 -0700 (PDT)
Date:   Wed, 10 Aug 2022 13:51:20 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     XueBing Chen <chenxuebing@jari.cn>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sync_file: use strscpy to
 replace strlcpy
Message-ID: <YvObuLevnEWEITnS@phenom.ffwll.local>
Mail-Followup-To: XueBing Chen <chenxuebing@jari.cn>,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
References: <6aad3bff.d1a.181b982d1b1.Coremail.chenxuebing@jari.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aad3bff.d1a.181b982d1b1.Coremail.chenxuebing@jari.cn>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 01, 2022 at 07:26:07PM +0800, XueBing Chen wrote:
> 
> The strlcpy should not be used because it doesn't limit the source
> length. Preferred is strscpy.
> 
> Signed-off-by: XueBing Chen <chenxuebing@jari.cn>

I don't think there's an impact here since we don't check the error return
value, but also doesn't hurt.

Thanks for your patch, applied to drm-misc-next.
-Daniel

> ---
>  drivers/dma-buf/sync_file.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 3ebec19a8e02..af57799c86ce 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -132,7 +132,7 @@ EXPORT_SYMBOL(sync_file_get_fence);
>  char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  {
>  	if (sync_file->user_name[0]) {
> -		strlcpy(buf, sync_file->user_name, len);
> +		strscpy(buf, sync_file->user_name, len);
>  	} else {
>  		struct dma_fence *fence = sync_file->fence;
>  
> @@ -172,7 +172,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  		return NULL;
>  	}
>  	sync_file->fence = fence;
> -	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
> +	strscpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>  	return sync_file;
>  }
>  
> @@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
>  static int sync_fill_fence_info(struct dma_fence *fence,
>  				 struct sync_fence_info *info)
>  {
> -	strlcpy(info->obj_name, fence->ops->get_timeline_name(fence),
> +	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
>  		sizeof(info->obj_name));
> -	strlcpy(info->driver_name, fence->ops->get_driver_name(fence),
> +	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
>  		sizeof(info->driver_name));
>  
>  	info->status = dma_fence_get_status(fence);
> -- 
> 2.25.1
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
