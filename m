Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D911E7C72
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 13:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgE2L55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 07:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgE2L54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 07:57:56 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E78DC03E969;
        Fri, 29 May 2020 04:57:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id n24so1835481ejd.0;
        Fri, 29 May 2020 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cWtX/Y7VOzPG7YV3Ogf5zp2+kyBwby9lvWTjXpKpYH8=;
        b=lARNPdfTRqupIOF/rO/4xOcYmKiia1su27v0OMgzUH2NkfqQLq3tncArxkxnvqG3EP
         xyqBPHSetqJZ7xKEI4ofC2lA4SI4zuDy492w51jY0YmM+qZQMzbgfq1Czwpw9cLWJ5en
         uNV/gSrUMufnxTWGE1Vg6+S0hhQi0wUCSFmmcqYqxbinG0EAKa5ad6tBgEj3P39Nb74J
         7ipVCnKdI9i5GOSxyFee3es/1DOLQHbcpThsFqLLvA2xYQNoQeHLfFKOW9wy7FJCISur
         +7lDDd/nrJy81P8uXHO/HencRfO6xZ3LygPa4Y+gpFy515BH+HJFclEnEafcuKpxjDiZ
         BaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cWtX/Y7VOzPG7YV3Ogf5zp2+kyBwby9lvWTjXpKpYH8=;
        b=E1vvAG/yxmSWnWnUGzfTmG1RP9fVJmu5kc+DZls8VI3aGrXWK3s8AWJ/FsXVu1tvgE
         ZYK3omerDhDWVMI/AZ7ETO6qeaHKSgz8OmeDzlu9rNH3NBu1SUZ38hKxxzxhY4HtTuCl
         ZrXRIoJt22sEad5PgQXhZ+AfjsOZm/2Vjp2ZX1tRhSKp7uCVqpFmDXvBbvM+c5QiWxpd
         FDnW4r7PfqhK/TX6dqlFjcOH7lEdQv4d5qbHKDtriifFKGeB/BKnKBNgWW7qzCipJz3C
         rTb/btlrToTA6iUe34GGYE03FbV/u4rWbClbjfxPvLNDCV5zWOk28uR0sSB+qe+tBbfh
         TrGQ==
X-Gm-Message-State: AOAM532hRVk9T97rxknjsMTB8IEbWzQZ7qJX4ipip8NZU43XjnkTFknY
        /APB/SeyEmJlRKJVz+mkmT/kk0ZYcYo=
X-Google-Smtp-Source: ABdhPJwAzmFtGRuLmS/ngtT88X6xTg2oKi7X/twq4J/ROqrjG7wgfupu63xKAVl/nkOVbRNAh4tp/Q==
X-Received: by 2002:a17:906:b2c6:: with SMTP id cf6mr7321483ejb.210.1590753474289;
        Fri, 29 May 2020 04:57:54 -0700 (PDT)
Received: from [192.168.15.109] ([194.152.46.38])
        by smtp.gmail.com with ESMTPSA id af15sm7258857ejc.89.2020.05.29.04.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 04:57:53 -0700 (PDT)
Subject: Re: [Patch 1/2] media: v4l2-rect.h: add enclosed rectangle helper
To:     Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200528132605.18339-1-bparrot@ti.com>
 <20200528132605.18339-2-bparrot@ti.com>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <6b88258e-4567-3c0b-8c90-6053dbb7634a@gmail.com>
Date:   Fri, 29 May 2020 13:57:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528132605.18339-2-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thank you for the patch,

W dniu 28.05.2020 o 15:26, Benoit Parrot pisze:
> Add a helper function to check if one rectangle is enclosed inside
> another.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   include/media/v4l2-rect.h | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/include/media/v4l2-rect.h b/include/media/v4l2-rect.h
> index 8800a640c224..bd587d0c0dc3 100644
> --- a/include/media/v4l2-rect.h
> +++ b/include/media/v4l2-rect.h
> @@ -184,4 +184,24 @@ static inline bool v4l2_rect_overlap(const struct v4l2_rect *r1,
>   	return true;
>   }
>   
> +/**
> + * v4l2_rect_enclosed() - is r1 enclosed in r2?
> + * @r1: rectangle.
> + * @r2: rectangle.
> + *
> + * Returns true if @r1 is enclosed in @r2.
> + */
> +static inline bool v4l2_rect_enclosed(struct v4l2_rect *r1,
> +				      struct v4l2_rect *r2)
> +{
> +	if (r1->left < r2->left || r1->top < r2->top)
> +		return false;
> +	if (r1->left + r1->width > r2->left + r2->width)
> +		return false;
> +	if (r1->top + r1->height > r2->top + r2->height)
> +		return false;
> +
> +	return true;
> +}
> +
>   #endif
> 
