Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5413477BB
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 12:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbhCXLwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 07:52:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhCXLv7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 07:51:59 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lP23K-00037z-8I
        for linux-media@vger.kernel.org; Wed, 24 Mar 2021 11:51:58 +0000
Received: by mail-wr1-f70.google.com with SMTP id r12so962725wro.15
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 04:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P7Il3i4b2tGglxCQcRzLCrGUrjGLY/eZBTnCizKlJMU=;
        b=ankcpFXU4L5vwrMFB2CXF4jusxvPXgo09hvcxj2FiOeqTpwszXvlAQ1a17XiMEHmN+
         uwVXXmSz0Gb+cM1MrgToTeOMZ/mTHhFN48o5NBFH3QJ4t2xorCqX+rMqXNYvM+Xm2J4K
         agDgG5vYAj/l6nGcdusuUTEO/lzeQPn5rE4pv69Q7Ugf9YV1HA1cEX55Jf+vnoBzSPog
         5nHVBjZ0pXxSUt51bwen31OK0UR8Jk1A/KVNQGh7Uk7I3d53oSpiBo9TwXL/3UATn7c5
         eqlTr/ZEuRXxmj4JTXraqzaUAAmvvEajTyMZjI1upRvOs0+EEXBERFHhenOTN42Ztysc
         wkNw==
X-Gm-Message-State: AOAM532GxbGzj4NCgSy3/SsXMUpkaUs9zaAJsp198qM0xINJ+C97ygbN
        oeXoHqerKPAb33Germ5us9U696XcrKgyVGADNG9I9Yr26tDyzgXFA3hRmeuoLXpl4tJtREWZJ3Y
        +qalvq6R8b/mzCs7gEiV38cCSbhlNd29j2SItoOGA
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr2548369wmj.52.1616586718016;
        Wed, 24 Mar 2021 04:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCme9fufmRr8ci3enlTRpQal24BsvHeCxvKfsd6FMqOX5XJPhYgS6GA4yjUvn/VZhjaZJs0A==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr2548354wmj.52.1616586717881;
        Wed, 24 Mar 2021 04:51:57 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id 18sm2194562wmj.21.2021.03.24.04.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 04:51:57 -0700 (PDT)
Subject: Re: [PATCH] exynos-gsc/gsc-core.h: fix kernel-doc warnings
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <77fc038c-70c3-b9b9-fc68-21cffac2f53d@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <34e52529-98da-da7f-eee2-796784ecb9b5@canonical.com>
Date:   Wed, 24 Mar 2021 12:51:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <77fc038c-70c3-b9b9-fc68-21cffac2f53d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 09:52, Hans Verkuil wrote:
> Fixes these kernel-doc warnings:
> 
> drivers/media/platform/exynos-gsc/gsc-core.h:76: warning: Enum value 'GSC_MIXER' not described in enum 'gsc_datapath'
> drivers/media/platform/exynos-gsc/gsc-core.h:76: warning: Enum value 'GSC_FIMD' not described in enum 'gsc_datapath'
> drivers/media/platform/exynos-gsc/gsc-core.h:76: warning: Excess enum value 'GSC_LOCAL' description in 'gsc_datapath'
> drivers/media/platform/exynos-gsc/gsc-core.h:124: warning: Function parameter or member 'color' not described in 'gsc_fmt'
> drivers/media/platform/exynos-gsc/gsc-core.h:124: warning: Function parameter or member 'num_comp' not described in 'gsc_fmt'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pix_max' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pix_min' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pix_align' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'in_buf_cnt' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'out_buf_cnt' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'sc_up_max' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'sc_down_max' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'poly_sc_down_max' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pre_sc_down_max' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'local_sc_down' not described in 'gsc_variant'
> drivers/media/platform/exynos-gsc/gsc-core.h:310: warning: Function parameter or member 'clk_names' not described in 'gsc_driverdata'
> drivers/media/platform/exynos-gsc/gsc-core.h:310: warning: Function parameter or member 'num_clocks' not described in 'gsc_driverdata'
> drivers/media/platform/exynos-gsc/gsc-core.h:340: warning: Function parameter or member 'num_clocks' not described in 'gsc_dev'
> drivers/media/platform/exynos-gsc/gsc-core.h:340: warning: Function parameter or member 'v4l2_dev' not described in 'gsc_dev'
> drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'rotation' not described in 'gsc_ctx'
> drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'hflip' not described in 'gsc_ctx'
> drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'vflip' not described in 'gsc_ctx'
> drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'gsc_ctrls' not described in 'gsc_ctx'
> drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'out_colorspace' not described in 'gsc_ctx'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
