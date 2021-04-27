Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25D036C626
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbhD0Mgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbhD0Mgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:36:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6561BC061574;
        Tue, 27 Apr 2021 05:36:05 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 12so93178308lfq.13;
        Tue, 27 Apr 2021 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e40wfw/Msp8OgohEuJUGfn9s94nwzIh3uqb/X0zJbT8=;
        b=qWzb5m9KdwU9E9i86ERBoCnKHvD/vLSSt/dJGKSVmpQzzoN0IoSp+M8juk3dYzw584
         3BFr6ZCnKGDDJhczpNjKH9P3+W+DQdSZNFdoEXdP893TM1ema8E2TwTumkUINNgw8dsz
         /C2RXLNh5NLXu6VmXeVtFgyjR4lqb/TXHdhBjsYSeIpW0GRb29qy6/4LJN8IGAILOPFW
         1S2NJtwqYzyDjo3jwkTgbk8nC2Cr4j/miGG4EUNr1ztl/XpWpOQfllVDfitPb7wiVl1l
         QZPVpzQ6Jei1u8LQMeehCXT3wtvmd8G7VDZS01njeiUPnKBgr7ODE8+kXjyQipxgDS0p
         mkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e40wfw/Msp8OgohEuJUGfn9s94nwzIh3uqb/X0zJbT8=;
        b=T3n9iXjVq68gNzJa9riqGLBhitEp1mzdRlUEHcP3h+plCi4aizZIgTtAytdhD1zGqP
         /cHj5RxVh4PuSUsnVt55sg1AnK4TNtxomq74RY23xSZecC3oIj3g0RfBdJTmvoAmwC+y
         gwi8S1PZeCcIKXxv3NaH5PV27SL92i6PGhgBB7Kr4YK/CVBeX+XFdJ97E9Em0AnuFJqy
         F77+EHkQo5h1OFEn47fMa2zVnQ0Lut9HWdXoLMSgk1altjOwM8WOEEnRk2/+zmI6QPto
         i9bN1/tM+j0QFiwcf7Zd4U7O14+cbY7g8l4iw25msKkBEHP31MEsklvjZEO1ojRe+YYw
         lYeQ==
X-Gm-Message-State: AOAM531OGIzuM/c1OIUMOjO5NefhKbz96ABaDwUdI+g3tWevkPEgo0Xt
        kLmvHFgccGsOUkDenElA5IBNxf+T37/C9A==
X-Google-Smtp-Source: ABdhPJyXlJoB2avjfkXlnYFYbGqmmWyGc8zxT539o2CnxM4K0iZY/gnjjK+2LfaGv0iFlBZLwR5t9A==
X-Received: by 2002:a05:6512:308d:: with SMTP id z13mr17236924lfd.130.1619526963950;
        Tue, 27 Apr 2021 05:36:03 -0700 (PDT)
Received: from [192.168.0.192] ([194.146.248.73])
        by smtp.gmail.com with ESMTPSA id l11sm1793211lfh.16.2021.04.27.05.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 05:36:03 -0700 (PDT)
Subject: Re: [PATCH v3 17/79] media: s5p-jpeg: fix pm_runtime_get_sync() usage
 count
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
 <7ef9d9ec7810a6d2ff53ba8685fcc91a952bbbb5.1619519080.git.mchehab+huawei@kernel.org>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <2aac6758-8f57-f27f-2d43-61a2b925b2f8@gmail.com>
Date:   Tue, 27 Apr 2021 14:36:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7ef9d9ec7810a6d2ff53ba8685fcc91a952bbbb5.1619519080.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the patch.

W dniu 27.04.2021 o 12:26, Mauro Carvalho Chehab pisze:
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/s5p-jpeg/jpeg-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 026111505f5a..c4f19418a460 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -2568,7 +2568,7 @@ static int s5p_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
>   	struct s5p_jpeg_ctx *ctx = vb2_get_drv_priv(q);
>   	int ret;
>   
> -	ret = pm_runtime_get_sync(ctx->jpeg->dev);
> +	ret = pm_runtime_resume_and_get(ctx->jpeg->dev);
>   
>   	return ret > 0 ? 0 : ret;
>   }
> 
