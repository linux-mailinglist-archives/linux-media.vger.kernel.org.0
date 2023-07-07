Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B8874B2D2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 16:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbjGGOLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 10:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjGGOLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 10:11:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77252122
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 07:11:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb7589b187so3147776e87.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688739095; x=1691331095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Psajd6OVU6HONVcYwAF4k7kzKO1bSsPA0lwnR4yTjw=;
        b=k0jYnuzcSLleSs3obf+lLaCtWROeHyPhn8EWW6WP6AGps9GYnwmtxLqnWzko3Y7PZ8
         MGdMD7Lo5VgU6tDGINs34PTZC/AlLTPiP4yN3qypZ897dyhroZoNVbfW3PS51XY6EpeU
         Xzv2ErGjwfl9TtO6WYUHjBLOo2OLwswW86WIdgzvZmGpvaP4nyOC8TcKIGKeWLEgqA0i
         aSCnNlnqho0nUXKhKNTr64NdiMNmAPhbzW0q6jCamtjYfo0jACY8m3YfEM5cMAEC8nAP
         HmzSyD6zZBMsYmqIW6ZKqmHCzwp5AgoV62trz1lwlG2SeHg1NTc+olyPUN3iJnseb4qp
         S5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688739095; x=1691331095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Psajd6OVU6HONVcYwAF4k7kzKO1bSsPA0lwnR4yTjw=;
        b=AeRGerdH+js5X9HjPhQB2TMVBRZ0/Nk4SPxxeSyPWhmz8qboS8SfZqvfIk13TFEtUH
         n7Hubg4LTUefEbVkkwE1p20WlneUpjVK50c9XU+i3uXlH69IVfGLyXG9uYRQwE+aSdru
         AettlOUe9f0XwuZNIV+C3SZ21gPL4YRSjZ3eAwD+L6zobzLRwYueU50SFSo0pePN8nkg
         oifBZ0yN13Y7XqxoqlZBf2NH5N/sADOycnAYLj8AaQuiHfwCVx7zQKcEzLppFZzUJhS5
         NiZShH1bkHy0INZEbmjLy8gmzXkiM3cL5sYpaiYXtW8R7pqVmU24BK8ETbDyo1vXzFMY
         jOCg==
X-Gm-Message-State: ABy/qLYV/IQezdwJf01CRwe3rQ7DwIti7IYO67HA/U2yG6FfYY5TdJC2
        Yf8C7iz6m6mzmoK8Awt528zAww==
X-Google-Smtp-Source: APBJJlGOrHsd3wpz2+GZmZI1MI3v3biMwXG7vAhqELyS89IGLyJw+nKLVuZO69fJqliUZgxCRzWo9g==
X-Received: by 2002:a05:6512:3e9:b0:4f8:6d53:a68f with SMTP id n9-20020a05651203e900b004f86d53a68fmr3527714lfq.64.1688739095027;
        Fri, 07 Jul 2023 07:11:35 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003fbb618f7adsm2577638wml.15.2023.07.07.07.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 07:11:34 -0700 (PDT)
Message-ID: <538096d2-7b24-e1c7-706d-4d4f952d35eb@baylibre.com>
Date:   Fri, 7 Jul 2023 16:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Content-Language: en-US
To:     Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com
Cc:     bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com,
        security@kernel.org, hackerzheng666@gmail.com,
        1395428693sheep@gmail.com, alex000young@gmail.com
References: <20230707092414.866760-1-zyytlz.wz@163.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230707092414.866760-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 07/07/2023 11:24, Zheng Wang wrote:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
> 
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> 
> CPU0                  CPU1
> 
>                      |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>    v4l2_m2m_release  |
>      kfree(m2m_dev); |
>                      |
>                      | v4l2_m2m_get_curr_priv
>                      |   m2m_dev->curr_ctx //use

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
