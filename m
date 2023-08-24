Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC29786FBF
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 14:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbjHXMy4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 08:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241380AbjHXMyc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 08:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083401FCE
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692881588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kKQ9WOE2Aragce0+o/m7aVIS5d41CLufSWNbA4ImA4I=;
        b=e4XOl6po72VhG+V5ZtDj+oO7mcN4F+dN9421RMZeUeu/6DoP3EGLOTcl2TxR1OWiSyXuSl
        ZpNKT6ZF8UkMGCMUzx0jOB5Lm78uAnZRApLSebrUxoG9fWNl8ruOpv5vCOygS+x1LC3LRU
        mIk/vReqrvy0UjbB53sRnXMSe10A/C4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-iAZ2cMFCOXqfLgC1vglH_w-1; Thu, 24 Aug 2023 08:53:06 -0400
X-MC-Unique: iAZ2cMFCOXqfLgC1vglH_w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bebfada8cso506831866b.1
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 05:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692881584; x=1693486384;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKQ9WOE2Aragce0+o/m7aVIS5d41CLufSWNbA4ImA4I=;
        b=XZxtqfHuvmXtIoZ/TsbWuSLV+13P8Khm7H5y+CXAs8Ri2YZUQDoua+zyjnt+17qIPe
         3IkNDX2xQH2zucj0xMMSUzohlu/JBvDvWKlDD7n/PcVs7hm4FIh/mpqGBe9rzSi26EFR
         CSnQV1LxRAoNYObOx2ol/9B4tjH52697I1ln1upx67jjafV2YYyOLaJuWghAhAB9K0ZX
         W1ZZ6qkibcPCQ0Jx+FKHyVrQ020+SPpoz8FrtuZmRpv0liaGFyC2yl9lfDhFU4sbXqIK
         /ZNUqCTCaHDpG8WnBxH0SrPSWC/lP6omQr5F2RHNJ/69MhJnf94A/KRs15q2IW3bwCm6
         lyww==
X-Gm-Message-State: AOJu0Ywpo3B68Ce3xq+WAAwl9eeECIqS3QCvhR2vHAxwQXBExaVJtWyt
        kT2UhiiwiA7AeyKMazOo33zDSxhtibLGzsiu7IUoXo+0XjkcTBoyN0uWeNsUV1Fp3tzfyWCdMuu
        jkwiNumi2NKXLXnnvBvWdfsrjdYphgkg=
X-Received: by 2002:a17:907:778d:b0:9a1:d7cd:603a with SMTP id ky13-20020a170907778d00b009a1d7cd603amr4013269ejc.58.1692881584347;
        Thu, 24 Aug 2023 05:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX6wkHtTAdCUwl5KxmFYb257JKgY0QOHqKG5XpgYEz7M1IInC82odlL1o5XG742djsg7RGlA==
X-Received: by 2002:a17:907:778d:b0:9a1:d7cd:603a with SMTP id ky13-20020a170907778d00b009a1d7cd603amr4013249ejc.58.1692881584054;
        Thu, 24 Aug 2023 05:53:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id lv27-20020a170906bc9b00b0099cb349d570sm10915871ejb.185.2023.08.24.05.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 05:53:03 -0700 (PDT)
Message-ID: <03804681-51f1-0840-6583-1753bd0a18d3@redhat.com>
Date:   Thu, 24 Aug 2023 14:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/20] drm/drm_gpuva_mgr: Remove set but unused variable
 'prev'
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-19-lee@kernel.org>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230824073710.2677348-19-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

On 8/24/23 09:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/drm_gpuva_mgr.c: In function ‘__drm_gpuva_sm_map’:
>   drivers/gpu/drm/drm_gpuva_mgr.c:1079:39: warning: variable ‘prev’ set but not used [-Wunused-but-set-variable]

Thanks for fixing this up.

However, I already had a patch in the queue addressing the warning,
which I already applied to drm-misc/drm-misc-next-fixes.

- Danilo

> 
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index f86bfad74ff8a..ad99c9cfedac7 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -1076,7 +1076,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   		   u64 req_addr, u64 req_range,
>   		   struct drm_gem_object *req_obj, u64 req_offset)
>   {
> -	struct drm_gpuva *va, *next, *prev = NULL;
> +	struct drm_gpuva *va, *next;
>   	u64 req_end = req_addr + req_range;
>   	int ret;
>   
> @@ -1106,7 +1106,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				ret = op_unmap_cb(ops, priv, va, merge);
>   				if (ret)
>   					return ret;
> -				goto next;
> +				continue;
>   			}
>   
>   			if (end > req_end) {
> @@ -1151,7 +1151,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>   				if (ret)
>   					return ret;
> -				goto next;
> +				continue;
>   			}
>   
>   			if (end > req_end) {
> @@ -1184,7 +1184,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				ret = op_unmap_cb(ops, priv, va, merge);
>   				if (ret)
>   					return ret;
> -				goto next;
> +				continue;
>   			}
>   
>   			if (end > req_end) {
> @@ -1205,8 +1205,6 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				break;
>   			}
>   		}
> -next:
> -		prev = va;
>   	}
>   
>   	return op_map_cb(ops, priv,

