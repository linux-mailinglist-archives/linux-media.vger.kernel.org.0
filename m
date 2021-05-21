Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DA638C834
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbhEUNhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbhEUNhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:37:18 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A444C061574;
        Fri, 21 May 2021 06:35:55 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h16so23345063edr.6;
        Fri, 21 May 2021 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CQNC5tcnBn2sqXfCRtfQO1Epq9bHKf0uPXF2miAwK8c=;
        b=fLsWWbaiDOqeBWiqz6Z+lTChhnRdQXJhHKLIfA8sFTt4eb1cfC4Lt3RrcQ21kaW+jW
         OHIxj5PhomewXQVDOd/NF4aWy9+nfK225wjSgNf4pICpSZapsAFD8LYus0KDiKKUuQ8g
         q29dSw99YdnCWDV0xwHNcRcX6NgiJpwFfWk5fk2Ot7V6FoTtgokzv/SI1lCWzOgnr2Lc
         FU/z2kh1YvgJfgjqA275Qr3tRFOI5QZVbtUGtxUdON110xwRCN7lFaz+JPDs9sgDLpka
         7E+Uyoi5ddadvNEHHi1V3c2eC9DHyCLuYNLje5KHnohs/PqXiQcNWWZsqQZnDUp3ltdP
         CmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CQNC5tcnBn2sqXfCRtfQO1Epq9bHKf0uPXF2miAwK8c=;
        b=Xbs/h5BxGbIWmNsR3xWwO7KvMJD3ESoqQR1WJxpimhPapkWtDNTUkkn9VwJYQyg6ey
         6oHwhl5yjR/TZTHz+VZ/w+bbqmfIWyrHVrFiz9jiPWLlVIPByphNf66cxUW1T5eKZtyD
         W8LA36oyezv7UAmavRC63hAN0/FrWh26VtgaaQ9JZrmzopyRjcGAbmluHhJk7OO0RsLx
         9yj4+a7BTbAGOk99fm0FqfxMJl/Apegku4+t6yRbJ0JOCbeKjw/H21aklaqc1mol741A
         XYYl8Czv4SHhLC8DuJVlfj4ProseQ7bL6BeEIRRVcA3SlkrsEcdhBiEKvGL/cBDgwCyR
         iBoA==
X-Gm-Message-State: AOAM531heNX0cazn2q/OgUQK5q4PG8bRB12WC1/U9Ow2NkOaA4DJHdR/
        DlwbQK02X4UiCPHC6LXUTOAuetXVAjo=
X-Google-Smtp-Source: ABdhPJyPW3mc2rl6LjDNVIo7U/7GXPuRodp/tiEJiegxksa2IqC/S5vF1kHBS0G+Zgd1fxT0kjpidw==
X-Received: by 2002:aa7:d550:: with SMTP id u16mr9565282edr.72.1621604153975;
        Fri, 21 May 2021 06:35:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d? ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
        by smtp.gmail.com with ESMTPSA id df8sm3942018edb.58.2021.05.21.06.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 06:35:52 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix inconsistent indenting
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        alexander.deucher@amd.com
Cc:     airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        daniel@ffwll.ch, christian.koenig@amd.com,
        linux-media@vger.kernel.org
References: <1621590628-75988-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <09e40764-1d3a-0dfe-b278-5b5ce04670a9@gmail.com>
Date:   Fri, 21 May 2021 15:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621590628-75988-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.05.21 um 11:50 schrieb Jiapeng Chong:
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:449
> sdma_v5_0_ring_emit_mem_sync() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 75d7310..c45e1b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -440,20 +440,19 @@ static void sdma_v5_0_ring_emit_ib(struct amdgpu_ring *ring,
>    */
>   static void sdma_v5_0_ring_emit_mem_sync(struct amdgpu_ring *ring)
>   {
> -    uint32_t gcr_cntl =
> -		    SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
> -			SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
> -			SDMA_GCR_GLI_INV(1);
> +	uint32_t gcr_cntl = SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
> +			    SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
> +			    SDMA_GCR_GLI_INV(1);
>   
>   	/* flush entire cache L0/L1/L2, this can be optimized by performance requirement */
>   	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_GCR_REQ));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD1_BASE_VA_31_7(0));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD2_GCR_CONTROL_15_0(gcr_cntl) |
> -			SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
> +			  SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD3_LIMIT_VA_31_7(0) |
> -			SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
> +			  SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD4_LIMIT_VA_47_32(0) |
> -			SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
> +			  SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
>   }
>   
>   /**

