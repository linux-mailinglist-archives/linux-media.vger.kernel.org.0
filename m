Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF0F5B9066
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 00:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiINWFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 18:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiINWFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 18:05:32 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6266F4E868
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 15:05:30 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z97so24267046ede.8
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 15:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Holejv5x4Ja/Ig/81V4R1f7COb2CYNqjVPz0cAvGiCM=;
        b=ayCgX547FpPpZErSYJpswnBRNBxPeCchdn1sDtuf7WpoN6yxA6wfPKh/7XzmSdtryk
         SDd3hv6hg6FZEgVnjWHg+z3GMhGjUQLVYMe0mx7GEn3K7Sk0nOfK1sL0m92yr1L8p+iv
         YxSvHYNlDlZJe/MVbYHBpiWPMSS4ISSG1m/mAyaHJczvfFmqgSaehrwbqIJ3GPLlFExf
         I9yeHzlEnPkd0RvqCa1vMIJFE4yy64YhBP314+l7jaSPoUbeoc2LtN0UFSaNtWAi0Y1n
         gKoHu+iUukFsQsFDwNB+wJzFqdcQWgdjlmM7YsK7kOQtRxQVzGYf6lVMpQyWLliIKiWg
         zQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Holejv5x4Ja/Ig/81V4R1f7COb2CYNqjVPz0cAvGiCM=;
        b=Ve8s0bWpy1TjMN5Cx86B9vxQKGgJ+C/XcdVUtvi3jXNpxN9XwoTDCpEgjIouYzsH5D
         9P0vrdqqK0RavBRkVvjCXec7uVyWEuOPKfx8Lhdvg0geIcOKl2ruS4I4Hj7ncWzpnvYs
         NKznST5GWXSqhC6s0aBjWovBWgpvmDKi/bFardnRiTpKKKG+sElUQdFSu4XsHdnVkUSF
         xFUQwI7cp6CjyvwdzhVeXI5C3fwO2pGYtWzMNTZfe4ilNu+xJThl1KrXt9xDGaCnbXEk
         Duf/GlCaaueMTlH8BEatDCEXFlcaFSdOsxajrgDftmybXaB2db+E4UxIAhb3ayIB3h/f
         4EsQ==
X-Gm-Message-State: ACgBeo12scgng9hjar7M/poKOyXTr585+vD6CXKNn1x6bmR77F8Ct80r
        JEQsC31bLm4oyfDtRgIhxSTTdw==
X-Google-Smtp-Source: AA6agR6Um7EfAcKc/t5rmUVVmOpNYFWZ91NjX/7J8A4VMMJRacru6lx+Hj7znbWDiHemUG5SbN4LcA==
X-Received: by 2002:a05:6402:90a:b0:443:8b10:bcad with SMTP id g10-20020a056402090a00b004438b10bcadmr32096151edz.416.1663193129021;
        Wed, 14 Sep 2022 15:05:29 -0700 (PDT)
Received: from [192.168.1.9] (hst-221-107.medicom.bg. [84.238.221.107])
        by smtp.googlemail.com with ESMTPSA id gu2-20020a170906f28200b00718e4e64b7bsm8021631ejb.79.2022.09.14.15.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 15:05:28 -0700 (PDT)
Message-ID: <5beecec3-b2f0-861e-d8bc-4f81ed355b6a@linaro.org>
Date:   Thu, 15 Sep 2022 01:05:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] MAINTAINERS: Add Vikash as VENUS video driver
 co-maintainer
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1663070940-8165-1-git-send-email-quic_vgarodia@quicinc.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <1663070940-8165-1-git-send-email-quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vikash,

On 9/13/22 15:09, Vikash Garodia wrote:
> For the past several amendments in video driver, I have been working
> with Stanimir in multiple design discussions or handling a given
> issue. With this, adding myself as a co-maintainer.

I'd like to thank you for all your work on the Venus driver.

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 936490d..d3ef64f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16969,6 +16969,7 @@ F:	drivers/thermal/qcom/
>  
>  QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>  M:	Stanimir Varbanov <stanimir.varbanov@linaro.org>
> +M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained

-- 
regards,
Stan
