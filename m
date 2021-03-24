Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344733477BD
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 12:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhCXLwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 07:52:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40368 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhCXLwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 07:52:24 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lP23j-0003B7-OS
        for linux-media@vger.kernel.org; Wed, 24 Mar 2021 11:52:23 +0000
Received: by mail-wr1-f69.google.com with SMTP id n17so980700wrq.5
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 04:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qmi2ZcZ4Ov2VcWa1bHwgm98xPpUlWNkc1tyPWm2T3qk=;
        b=j+uw+Eeg3NTB39Rv+EcU6GaVVxf0OISAtZVjZ1dDXHy2NCW9KQ29/mnuSqS0x8F3vE
         qQVFRSHQhEYR+K+HM/XxhuxApPlzZEfSTiRMTmzyJ0AI/0K4p+LG6PCm8Iw60lJPQmFn
         rbU2RUkoEU7yGR66KAAokxYkcJKuCQ7C+OBfJm+B9rPLw3SPnSQ0eyxibDyBKGXa4ZvN
         Osk3xeohixYnGYb299CLWIF/dq48m+HfeZs11tRSxTS2DAiksZlzPfZE5GK9ZrdxnO04
         Wmvb6vUj1CDF3sB/Lo/APhtofRH0COUF2diwbcthdc0Z1EpRg30qOpzXtDdebAVluxES
         qXjA==
X-Gm-Message-State: AOAM531gqS7wP9KUcfXIgIdHkjV2+EjU5q/aey5tYrbWzcPPEj+6QNTA
        o/XuJngXkq4BzRHZWQbLMcn5FMcb+LQDZY2ShBDmdOI/b1TnMgKmSyt4uAc/kcYidknDMVB3Buc
        yKAiSEIQQ7nUaCE3aGGxHlfJ4tX9FqlwXcN5erAdV
X-Received: by 2002:adf:b345:: with SMTP id k5mr3150503wrd.14.1616586743518;
        Wed, 24 Mar 2021 04:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+KDo2Qy8gmyHSPoB/SJyI+cQ3ikXBVnqum07z+cQ0kA+sbqSU3h48n07nkS47Fdb99xhCtg==
X-Received: by 2002:adf:b345:: with SMTP id k5mr3150492wrd.14.1616586743403;
        Wed, 24 Mar 2021 04:52:23 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id q9sm2790171wrp.79.2021.03.24.04.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 04:52:23 -0700 (PDT)
Subject: Re: [PATCH] exynos4-is: fix kernel-doc warnings
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <3b56dd72-d04f-40ac-39b1-ebdf16aa80dd@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fdbbc3b8-4176-e7fa-1497-93eec53c13b3@canonical.com>
Date:   Wed, 24 Mar 2021 12:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3b56dd72-d04f-40ac-39b1-ebdf16aa80dd@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 10:15, Hans Verkuil wrote:
> Fixes these kernel-doc warnings:
> 
> drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 've' not described in 'fimc_is_video'
> drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'buf_count' not described in 'fimc_is_video'
> drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'buf_mask' not described in 'fimc_is_video'
> drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'streaming' not described in 'fimc_is_video'
> drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'buffers' not described in 'fimc_is_video'
> drivers/media/platform/exynos4-is/fimc-isp.h:139: warning: Function parameter or member 'pixfmt' not described in 'fimc_is_video'
> drivers/media/platform/exynos4-is/fimc-isp.h:176: warning: Function parameter or member 'src_fmt' not described in 'fimc_isp'
> drivers/media/platform/exynos4-is/fimc-isp.h:176: warning: Function parameter or member 'sink_fmt' not described in 'fimc_isp'
> drivers/media/platform/exynos4-is/fimc-isp.h:176: warning: Function parameter or member 'subdev_lock' not described in 'fimc_isp'
> drivers/media/platform/exynos4-is/fimc-lite.h:178: warning: Function parameter or member 'events' not described in 'fimc_lite'
> drivers/media/platform/exynos4-is/fimc-lite.h:178: warning: Function parameter or member 'streaming' not described in 'fimc_lite'
> drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'wbclk' not described in 'fimc_md'
> drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'fimc_lite' not described in 'fimc_md'
> drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'clk_provider' not described in 'fimc_md'
> drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'subdev_notifier' not described in 'fimc_md'
> drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'pipelines' not described in 'fimc_md'
> drivers/media/platform/exynos4-is/media-dev.h:143: warning: Function parameter or member 'link_setup_graph' not described in 'fimc_md'
> drivers/media/platform/exynos4-is/fimc-core.h:261: warning: Function parameter or member 'alpha' not described in 'fimc_frame'
> drivers/media/platform/exynos4-is/fimc-core.h:321: warning: Function parameter or member 'streaming' not described in 'fimc_vid_cap'
> drivers/media/platform/exynos4-is/fimc-core.h:429: warning: Function parameter or member 'drv_data' not described in 'fimc_dev'
> drivers/media/platform/exynos4-is/fimc-core.h:495: warning: Function parameter or member 'in_order_1p' not described in 'fimc_ctx'
> drivers/media/platform/exynos4-is/fimc-core.h:673: warning: Function parameter or member 'vid_cap' not described in 'fimc_active_queue_add'
> drivers/media/platform/exynos4-is/fimc-core.h:685: warning: Function parameter or member 'vid_cap' not described in 'fimc_active_queue_pop'
> drivers/media/platform/exynos4-is/fimc-core.h:700: warning: Function parameter or member 'vid_cap' not described in 'fimc_pending_queue_add'
> drivers/media/platform/exynos4-is/fimc-core.h:711: warning: Function parameter or member 'vid_cap' not described in 'fimc_pending_queue_pop'
> drivers/media/platform/exynos4-is/fimc-reg.h:333: warning: Function parameter or member 'dev' not described in 'fimc_hw_set_dma_seq'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
