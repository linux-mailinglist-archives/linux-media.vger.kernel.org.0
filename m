Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0187378E78
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 15:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240643AbhEJNTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 09:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346986AbhEJMdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 08:33:06 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9706C06123F;
        Mon, 10 May 2021 05:26:09 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q186so930577ljq.8;
        Mon, 10 May 2021 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j28BzUpIKRTnonhZ9O0uQVwNvZfw8g36Oo4gUhmWtik=;
        b=Zz27Lf7qIqSjK4ZI+aR0IJ9nK2qZt6aL28GU/G+gfVFpoBv9sGtC9dC5lIVFHww/7P
         bEZHj8sdPCNYc3E/EDqc332H8beriFcV4vsp1/b3RP+rz4JkbVhSVvx5aFb/8drBIRZ9
         5e+JjBOs3rA46Vb88syHDSQCTcC4CdJt0ebl0uakRPiSK+DvM7XK+/wB8/34bVzsSgto
         nvzmXfLmyh375Nzq8AOt4U1tT14qTVi0wZp+3hgBGgAjXaT6N9M1ezsNVqcohVjT+ov0
         LqzH48ceGN916e09G5/qt9NTxLTEE2kqmZ/X5VUypo76tqcFmGs0nhVSoRaoAnKx4NG8
         qwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j28BzUpIKRTnonhZ9O0uQVwNvZfw8g36Oo4gUhmWtik=;
        b=EuRYEwCK7+aB9eWqROJ1XWf/YDz22QJXrkaxGwdgs2jUmdIJmxeFQoxlXxoCItR5iN
         vuqELcxD3ov6PaX3kVM6WG596RQbc0Zt7bnVFIcczzpoXLJMzoZDnyaIFTg+Q7qdvWly
         vcUchgrnRHDNtod5Y/2HonsfPAQd5QMj5/x+UCCdWbbOTLQOpM9NXWV+8nJHJ03Dg6Uf
         xXTvLm5F7XtgTKvgN04GgsEGwFubcCNN/LgfuaMSi+5Zksuz0Hc1Wk/1Hiy5N8iGdy5F
         gETR6k5tUcIA9L8xCbLH6Nr0wx/XB03PMhUbZLU22PoSFDTWAzULavYTGWEIPJ1TAj/K
         UU/g==
X-Gm-Message-State: AOAM532J7somIiH116iznaGJCPYkS2WNggpuRqScXfH+mchfZJqNxNBu
        yux7g4QdFeH/hKIxorS9Xd7N1UJSziA=
X-Google-Smtp-Source: ABdhPJwlZ+hniuV/V3LLIaCld7lAnnvjREuO4c85FmndhkAxGiaw9UdiF6fYd5Od6Eu7Z0KZ+0v3XQ==
X-Received: by 2002:a2e:b4f3:: with SMTP id s19mr19847967ljm.229.1620649568119;
        Mon, 10 May 2021 05:26:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id x1sm3127652ljd.61.2021.05.10.05.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 05:26:07 -0700 (PDT)
Subject: Re: [PATCH v5 05/25] staging: media: tegra-vde: use
 pm_runtime_resume_and_get()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <a1230241a83a6abcd27b91edcafee1685232f81e.1620314616.git.mchehab+huawei@kernel.org>
 <20210507051333.GE1955@kadam>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <19a73d97-3679-0c1d-eefc-a944971effac@gmail.com>
Date:   Mon, 10 May 2021 15:26:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507051333.GE1955@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

07.05.2021 08:13, Dan Carpenter пишет:
> On Thu, May 06, 2021 at 05:25:43PM +0200, Mauro Carvalho Chehab wrote:
>> @@ -1069,11 +1071,19 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>  	 * power-cycle it in order to put hardware into a predictable lower
>>  	 * power state.
>>  	 */
>> -	pm_runtime_get_sync(dev);
>> +	if (pm_runtime_resume_and_get(dev) < 0)
>> +		goto err_pm_runtime;
> 
> Needs an error code on this path.  These days the kbuild bot will send
> a warning for this eventually.

Good catch, thank you.
