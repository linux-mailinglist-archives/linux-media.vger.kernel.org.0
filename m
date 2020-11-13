Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7448A2B2136
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 17:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgKMQ7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 11:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgKMQ7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 11:59:38 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572CCC0613D1;
        Fri, 13 Nov 2020 08:59:38 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id z21so14823039lfe.12;
        Fri, 13 Nov 2020 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rcenlUNh1MwQCSSwTkurwYvPsdLt/CgENRdcvcJRBes=;
        b=p3d04h9Kj38R+B1kBqoK8MeDc9w6BayJmCdiJnoetuMwZ8TsW/2lxOeIFHUCTM/ZPD
         lkIw79lCjiUIJOwLuNWcf9i3tb2IR3s7jHZiKyAXYn2hBVvhMOH24OBXa+PEPuk09uqQ
         2iwlkNcQWY0ihVnQQzlSyC3GImel51O1eAOKy77tF32su+kcafzp4aDJZHWykO94JKvF
         r5Yhl3PM0pMGLuIFKzrxP0LNa9mwP/X2E9XWssYgrIxDIwzazAn0KA/NNnbADjbCJDpD
         BbEt1L/nGZpE44twQCjKWBzzfm0CJ+Voq0eWVLGpVI4ZlZFl4L5R7FdGPhCJI0ZHLaw6
         QtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rcenlUNh1MwQCSSwTkurwYvPsdLt/CgENRdcvcJRBes=;
        b=SndACf+bcF+vXI4BAOyjwoTow/nmu3eHMlFtoDcLrkU1niMO+F/le+eY8hq4H20FKi
         G5m1slRsvbBLiW5hnFskJ8sgkpOlox+a71FZjMcNem6zRdo/If1xidOo0/Dcm8/+dWWi
         v4tW2aGdy3gurS4fiAs3zEBdGiPPJd4Hjly1BCkknwtTTYRPflP8zZoWX3C/aaFhTbtl
         OEWNF6uOCvngDmBcddAceiRiTIzNqfBQ/dQ4CfHdjIKZgvizFhaXSRFFFbWBTxlHR2Z0
         SqmV5PPMCGC2qsaOX05kaeCXVTKonRh63GQKOQYWst2UEkEMJKDw8MmzpQ5GmU+SBjPo
         ckzg==
X-Gm-Message-State: AOAM530SS/kH421Ymk1J7HKxDd+PQCfvTl99JIYJaWJozCPZi+ehlij1
        qwL0QyT4U+uCadBlXer1eBs=
X-Google-Smtp-Source: ABdhPJxbm9i/CgUHRtwu+iuI9UUW98q77BKXF8mR9O2q+WVjlqmtLWhMTdCofQaeaX5qS3B3vv3CFA==
X-Received: by 2002:ac2:5462:: with SMTP id e2mr1342770lfn.552.1605286771975;
        Fri, 13 Nov 2020 08:59:31 -0800 (PST)
Received: from [192.168.15.127] ([194.152.46.38])
        by smtp.gmail.com with ESMTPSA id h2sm1559790ljm.44.2020.11.13.08.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 08:59:31 -0800 (PST)
Subject: Re: [PATCH] s5p-jpeg: hangle error condition in s5p_jpeg_probe
To:     Baskov Evgeiny <baskov@ispras.ru>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
References: <20201113160625.1281-1-baskov@ispras.ru>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <1246b424-eaf7-8d32-c151-7e101a127753@gmail.com>
Date:   Fri, 13 Nov 2020 17:59:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113160625.1281-1-baskov@ispras.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

W dniu 13.11.2020 o 17:06, Baskov Evgeiny pisze:
> If an error happens in jpeg_get_drv_data(), i.e. match fails,
> jpeg->variant field is NULL, so we cannot access it.
> 
> Consider device probe failed if jpeg->variant is NULL.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Baskov Evgeiny <baskov@ispras.ru>
> ---
>   drivers/media/platform/s5p-jpeg/jpeg-core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 9b22dd8e34f4..026111505f5a 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -2862,6 +2862,8 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	jpeg->variant = jpeg_get_drv_data(&pdev->dev);
> +	if (!jpeg->variant)
> +		return -ENODEV;
>   
>   	mutex_init(&jpeg->lock);
>   	spin_lock_init(&jpeg->slock);
> 
