Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B7F735F4A
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 23:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjFSVjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 17:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjFSVjC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 17:39:02 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E828E64
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 14:39:01 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b4725e9917so27688901fa.2
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687210739; x=1689802739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJqgFyZORxKSRICxsmBFhPlaldFyLWkexWK7bDGxjGc=;
        b=RPfDbbXupqzacz7KmZUEQIISSc1lhv+2xRsN7vCGYpBl6AXY9CbUmlVWhZ98RO3D42
         nVQ8K02IklHfRbbOREnhR5b8ttJtfv5xqS3zYzOKuo76kZCzNQQqoqeAO4AUV2DFuUzG
         DniqlfoxeWNQlHekVLs0UT9jbTxhIjD2aUk0Esm/2CsTRRKhZ0pD10m8d1ZG6AyGuYws
         YwK9aOTmhf+qQCZ6mDc8Dxyb5p3EEvQ6npsQ7e/ZtvUyZU2WEN8z+0PBX6gwIWBQi0qW
         fSyQdThWVI6RDHslTDs5eRZQoUcmG9jTevSVKtBGTZHvByvIDf6E+fV2/YAWve5/wkkh
         KfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687210739; x=1689802739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJqgFyZORxKSRICxsmBFhPlaldFyLWkexWK7bDGxjGc=;
        b=gqkqUXt100Rbtd6GuzD+d7ZZaBBfQILC2lbU73O3HOncFKX8P2Snmzi8OTCbXnAX+a
         u9BgoDnXoT1zgsIhpyS1ssnJExDP/RHcmsuREvEh7gx6scgorwO5cBFNQz7vAUJw3J5a
         HyIqfZcubaGhIh7p9Qv4hu9ym9yrUTMICT6QNCmD4XoHH1tLzd0zXpULQ1K8B3yeTPzw
         UcO3c+CCyhnAlINrDZS41gmcJ+gecMz0C7SH+V/1/JddTSZX5AYLeEIR06auhPZjdoIz
         2kHV1Piqf1QcNIaaMI4STZ0y+frqGltGi/fClDNTnX/FJeSiZYkqudPHV05kXq2mOPRT
         L8eA==
X-Gm-Message-State: AC+VfDw9akw6Ha+pmsJJkiO55GpsXjLYcljm6ERVBW+gDTO4oF/gKqel
        o8X6Dp4Sv/9nAGZkKOGYOmkx+g==
X-Google-Smtp-Source: ACHHUZ7mho7mHSB6JCzN3pI1HKBCa5gj+wq/4VTVHdrMTAaqPwUmQrdQYLCZ6sPJApcpZkejhtLHCA==
X-Received: by 2002:a2e:9189:0:b0:2b4:75b7:edda with SMTP id f9-20020a2e9189000000b002b475b7eddamr2530334ljg.24.1687210739281;
        Mon, 19 Jun 2023 14:38:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e22-20020a2e8ed6000000b002adc2fe3fc8sm66717ljl.4.2023.06.19.14.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 14:38:58 -0700 (PDT)
Message-ID: <c25ba108-1363-9c6f-3d02-2524ede7484e@linaro.org>
Date:   Tue, 20 Jun 2023 00:38:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Fix typo in comment
Content-Language: en-GB
To:     zhumao001@208suo.com, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, airlied@gmail.com, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230618143813.15142-1-dengshaomin@cdjrlc.com>
 <20230618143813.15142-4-dengshaomin@cdjrlc.com>
 <610b47a2989976b9dae162ecc55ddc85@208suo.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <610b47a2989976b9dae162ecc55ddc85@208suo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/06/2023 17:54, zhumao001@208suo.com wrote:
> Fix typo in comment of msm_gem.c.
> 
> Signed-off-by: Zhu Mao <zhumao001@208suo.com>
> ---
>   drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

This patch doesn't apply. Please use git send-email to send patches.

-- 
With best wishes
Dmitry

