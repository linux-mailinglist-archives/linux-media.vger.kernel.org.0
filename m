Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85AB77F4FC
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 13:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350223AbjHQLWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 07:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350239AbjHQLWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 07:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19E030CA
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 04:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692271304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=glxKD+uxNH6EZsGsfBi3qPBBji4XEg2+DVbGwBzUy4k=;
        b=Y+UoH0K2Pomu3tiqOUSmGb/gZF4gshFTaLLg2BOAiGKF5DrqhbgoHi+hMlQCHFIcIJ6pwi
        Mj8EA9+j6LEaf+rnlJyUMxoinXFlDNkw7KKc7A0HGwqFNr9VNsypYq0UTdbhmnD2M5dVFp
        BfvSkhCbbQa4XRZxRx004NyGFBJS24k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-470DaHZoNM-GgVCZji9Oiw-1; Thu, 17 Aug 2023 07:21:43 -0400
X-MC-Unique: 470DaHZoNM-GgVCZji9Oiw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fe1dadb5d2so48143385e9.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692271287; x=1692876087;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glxKD+uxNH6EZsGsfBi3qPBBji4XEg2+DVbGwBzUy4k=;
        b=iT/GLtl60VF9TYLsMUkEA2iDXxtRZWFEcxRaZOsRDOAoq0VrpDsfi5TR7jQ/MawLMb
         0TPE5Q88G/TE7nX5s1TMIIYTiZQR+nE8t5ZxBVq/mmuFmLftuYFWfeoX020SKqr2cleU
         CNBk2x2BnaIgHng/HK367H0hXPczVM/nx/DZ1yg74kQKSjTr8zbPd7fuGjzPjtRlILzd
         XXJn9t681OC89EKXPYnN5IjMSIGDGA42cSWXCnWX+JBXAizCrCpx99zd3a+45iqJz8uf
         AwIbrI3p4FWqE9UEIO6RVfIaDyF3ikLMUhWMuuNAz6RcqzWP+jIkB55W0aIRsRPLABqi
         rlOg==
X-Gm-Message-State: AOJu0YyBYn2QKNvlaEgsMhrkw5M7myAoNojbTYJsv90KGRtulciwPyFR
        RMMdce0pc7acigyQHAVwZlJXh7kXB2HW7xF1OHFt8Np6tkSAXRvAtX7ZA3ID6DI2k1MtFsAR2t/
        jC/NsLs6TFg+uogtfUxARuu8=
X-Received: by 2002:adf:ff8f:0:b0:313:f1c8:a968 with SMTP id j15-20020adfff8f000000b00313f1c8a968mr4605015wrr.2.1692271287058;
        Thu, 17 Aug 2023 04:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuZzI/w+M6KvyuhUGECENVbooRYcJRIVRq7G2eyUWseAU3BId00io4NPwEqdb5BuEA46xAMg==
X-Received: by 2002:adf:ff8f:0:b0:313:f1c8:a968 with SMTP id j15-20020adfff8f000000b00313f1c8a968mr4604997wrr.2.1692271286640;
        Thu, 17 Aug 2023 04:21:26 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003176c6e87b1sm24469786wrm.81.2023.08.17.04.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 04:21:26 -0700 (PDT)
Message-ID: <7ad62d3c-7bcb-5248-4fd9-bcab819d51d3@redhat.com>
Date:   Thu, 17 Aug 2023 13:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: vb2: frame_vector.c: replace WARN_ONCE with a
 comment
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <d5e1ee76-75b3-26cb-23ae-cf6ab40597b7@xs4all.nl>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <d5e1ee76-75b3-26cb-23ae-cf6ab40597b7@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17.08.23 12:41, Hans Verkuil wrote:
> The WARN_ONCE was issued also in cases that had nothing to do with VM_IO
> (e.g. if the start address was just a random value and uaccess fails with
> -EFAULT).
> 
> There are no reports of WARN_ONCE being issued for actual VM_IO cases, so
> just drop it and instead add a note to the comment before the function.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 0f430ddc1f67..fd87747be9b1 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -31,6 +31,10 @@
>    * different type underlying the specified range of virtual addresses.
>    * When the function isn't able to map a single page, it returns error.
>    *
> + * Note that get_vaddr_frames() cannot follow VM_IO mappings. It used
> + * to be able to do that, but that could (racily) return non-refcounted
> + * pfns.
> + *
>    * This function takes care of grabbing mmap_lock as necessary.
>    */
>   int get_vaddr_frames(unsigned long start, unsigned int nr_frames, bool write,
> @@ -59,8 +63,6 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames, bool write,
>   	if (likely(ret > 0))
>   		return ret;
> 
> -	/* This used to (racily) return non-refcounted pfns. Let people know */
> -	WARN_ONCE(1, "get_vaddr_frames() cannot follow VM_IO mapping");
>   	vec->nr_frames = 0;
>   	return ret ? ret : -EFAULT;
>   }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

