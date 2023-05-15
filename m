Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73BFC7040F8
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 00:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244832AbjEOW1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 18:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243631AbjEOW1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 18:27:37 -0400
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A8F9ED8
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 15:27:35 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-51452556acdso9247613a12.2
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 15:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684189655; x=1686781655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c63nnhTmzNCcDDPrXmodqbHJR7oOiORNS/8H1q+iK6g=;
        b=fRG9VxvKRKaeRliEX2uB/fmxxtS9bbPYh0LJKEfVnsnYcSI03/2w+KvsFE7C+/9Uk+
         piq0zrRp2HJjQJ+n3NeUNjuskYuKplp+lFh3uYv6IEufqUPpnA7Tx2frH6AmXg5QWui6
         2DPl7rNppJNUVR0KWyBP51X0Kg7g0wZxs6VOWSLhlWouKeeN9VumB3+bnIJAAbj6cYi0
         flWbb+Obkrw67AZKcZ4N7ovQkGW4hLdRgo+Wuhyqihhn0ftPgSfQJmaNe/RhonnR0v9+
         36KH58znJpV4PTeVffvox9XonSnYI6i/hnhYWWf3+H9VK4VtQlQoW6DkwxcO14kjn+Tv
         P/WQ==
X-Gm-Message-State: AC+VfDzphLMdbFsK8wjzN7QMq+ZTS4p69lc3m2d2qoS2+3sUOmW8XvSJ
        C8Escj4eeQVA1K2lQNiTh1W02X7PJsXqcvBp
X-Google-Smtp-Source: ACHHUZ654Qpgl50uQ0TTsz+Sm+yXhr0g/S0spaoX5NDpQanCAD2nDXcpydjHPB8lZdE6LMp1HwPPLA==
X-Received: by 2002:a05:6a20:54a4:b0:101:1951:d491 with SMTP id i36-20020a056a2054a400b001011951d491mr32720818pzk.6.1684189654681;
        Mon, 15 May 2023 15:27:34 -0700 (PDT)
Received: from [192.168.86.26] (cpe-70-95-21-110.san.res.rr.com. [70.95.21.110])
        by smtp.gmail.com with ESMTPSA id l23-20020a62be17000000b006460751222asm8024272pff.38.2023.05.15.15.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 15:27:34 -0700 (PDT)
Message-ID: <0df418ad-3492-4241-1837-55ed89b77e10@linux.com>
Date:   Mon, 15 May 2023 15:27:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm:amd:amdgpu: Fix missing buffer object unlock in
 failure path
Content-Language: en-US
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@gmail.com, daniel@ffwll.ch, Xinhui.Pan@amd.com
Cc:     sumit.semwal@linaro.org, Hawking.Zhang@amd.com,
        Jiadong.Zhu@amd.com, ray.huang@amd.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230503231507.279172-1-sukrut.bellary@linux.com>
From:   Sukrut Bellary <sukrut.bellary@linux.com>
In-Reply-To: <20230503231507.279172-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/3/23 16:15, Sukrut Bellary wrote:
> smatch warning -
> 1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
> warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> 
> 2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
> warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> 
> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 8bd07ff59671..66d5c5d68454 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -6891,8 +6891,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_device *adev)
>  		return r;
>  
>  	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> -	if (unlikely(r != 0))
> +	if (unlikely(r != 0)) {
> +		amdgpu_bo_unreserve(ring->mqd_obj);
>  		return r;
> +	}
>  
>  	gfx_v10_0_kiq_init_queue(ring);
>  	amdgpu_bo_kunmap(ring->mqd_obj);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index bce6919d666a..d5715d8a4128 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -3617,8 +3617,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_device *adev)
>  		return r;
>  
>  	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> -	if (unlikely(r != 0))
> +	if (unlikely(r != 0)) {
> +		amdgpu_bo_unreserve(ring->mqd_obj);
>  		return r;
> +	}
>  
>  	gfx_v9_0_kiq_init_queue(ring);
>  	amdgpu_bo_kunmap(ring->mqd_obj);

Follow-up.
Could you please review this patch?


--
Regards,
Sukrut
