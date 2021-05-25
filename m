Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A3C390388
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 16:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbhEYOKr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 10:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbhEYOKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 10:10:45 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D7EC061574;
        Tue, 25 May 2021 07:09:15 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l18-20020a1c79120000b0290181c444b2d0so6352280wme.5;
        Tue, 25 May 2021 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hg0kLFdzUIdBjsi4lARjo6wP7z8MYrdqivPZrwICJsM=;
        b=Rma14aAQYBXaxY6uZ4wfhq86yRkCJq8fuDMm5Dls1pmgyo2tJmZO9E2OZeypvtjgdR
         fbBV33m11Y6vk+ldV7LF8kX0FAeGhwKvrCU8+Qf0O0L47G8+J6ea8ZjJZv1BaxjYZHjR
         PM2yRsI0yhlakCN5k47kj3j9pLgag/qdGWvoGT7q3Y3uTZnDHyshh2hcLe2Pf0UjuBqr
         9U8n489LVlqfheYYqUk1o3i6AbZ1jRu8mpaFiBKT6CS7wXxTAa7xGagqCnUiQSJ7/dHn
         zqIl7LwxShg9ZqvCK+s+CNPVIGV77QkDE5YAWh2nQlDj2N1JPSb2m8efj5nF5Y2C1zWP
         myGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hg0kLFdzUIdBjsi4lARjo6wP7z8MYrdqivPZrwICJsM=;
        b=qvgIUioMPxdo7V8cMe8JbtqAcVXJ35V+kl/jzMKuUIm35UTZVx2f99IfRFsKYZZreW
         lNWFa0pOcZ5SahhuSqqMXLoCR/0QL6CVKMzqIvFC9oTwcMkFWEhrZtIEqzT5UDZZNqHs
         hMfLU5zj/4UwtV+o+3IYC+tA7reTzOJ6Q3OJ8onSmEHk9HansiKww734Bd2sOzm0IN8c
         WDDvJkEjCWGb4/ejyClYptF7GzlxZL6/t4Gm7x388WidtjU6y27qQLxrjnDSDkIsOtqV
         K282hF5QLhJpcelgmWhFIezYfAvXb3W6O6NEUI70QDhW17Q3ClZ01OgAkd+Zqx0nOtVO
         RwGQ==
X-Gm-Message-State: AOAM530qyQSya/peVtLHK79QcEWyX+boM9XDzlNtT+sQwhSLSChxkZtM
        qcllDV0h5Yq9Km/DGv4j04FyY1C5vSE=
X-Google-Smtp-Source: ABdhPJw9LWIiUBXzKRCmur/frT8mNLcwchqQ0hbKF05DQ70SIz3IzbILlMtineBcApx+kWKJ+9SSkA==
X-Received: by 2002:a1c:bcc3:: with SMTP id m186mr24240821wmf.74.1621951753781;
        Tue, 25 May 2021 07:09:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1? ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
        by smtp.gmail.com with ESMTPSA id l16sm3089148wmj.47.2021.05.25.07.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 07:09:13 -0700 (PDT)
Subject: Re: [PATCH v2] amdgpu: remove unreachable code
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        alexander.deucher@amd.com
Cc:     airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        daniel@ffwll.ch, christian.koenig@amd.com,
        linux-media@vger.kernel.org
References: <1621939214-57004-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0dbdc879-8da7-3a08-1e42-6b8b88dfceb6@gmail.com>
Date:   Tue, 25 May 2021 16:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621939214-57004-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 25.05.21 um 12:40 schrieb Jiapeng Chong:
> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> statement will have a return, so the code below the switch statement
> will not be executed.
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> ignoring unreachable code.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v2:
>    -For the follow advice: https://lore.kernel.org/patchwork/patch/1435074/
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 82f0542..b32ed85 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -840,7 +840,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>   
>   	default:
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> -		return -EINVAL;
>   	}
>   	BUG();

You also need to remove the BUG() here or otherwise that will crash on 
an relatively harmless error.

Christian.

>   	return -EINVAL;

