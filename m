Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E9A35E327
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346048AbhDMPto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345985AbhDMPtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:49:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E540CC06175F
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 08:49:19 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so4951898wrm.1
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PsW0LpLJ+OHoCMT5QibDiVjIFRIsSTW5mUVz9ROm9Ek=;
        b=kO13z57w7JxN4GJv+mAA/cd9x7MNhDzUXMzD4qzANlHEYMc81/IARR+XeaIMbrbuBw
         5VPrPQnEfsOwSQ1I4beRTSvSPSTBB7XZHiCZqzTpRDu2734ZpnUgBuEzgBJJ1/mYet5x
         tTt7YhjEDC3+VxMOLCQCqZ1n98+pQh3NqWUcPAj8Pgb1rjUREYZ5UjSDo57/H5dT4ZGq
         TMc+1Mn1sdHjeToyr6SdHc1XhWqx29JuBC+y0t2l9tTeBmdXfn8GqHTAbsXqmJSUkEZA
         1EDFsXz7IhL09ZrRFadDBSNc6shVf8K8mZal1V5Su0BBQ4gbPMVV2LKyvKu99bXIvB3u
         wzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PsW0LpLJ+OHoCMT5QibDiVjIFRIsSTW5mUVz9ROm9Ek=;
        b=ELcWDPojCkj3oakzE+HHGAsgloGnq5C2tPGr1CP6Q6vBAFGkOz4J8SO1B+/ZdkFjLw
         QknXDJqzbLadxFPzYLiCOmcZUF9mq/r375BA3v+abwyWuA43HekLnvd0DTuQKlH2g49t
         AQzulh5cHG+8x44UJdXRRb0zAekxIZkfmi3ubGkwIoghwyxc1dDasBWDtBgEQY1tl6/K
         X2A9+WnCv2D84Qyh3zMepi+e46wNbHKvrwNYH2oRJnSmIysX7mRruHY1jfJze85j0ClR
         uFdXiu5I7XCjZF7TcYOQ5PCPc0/2IEtjxJKAIiartWzCVrqYSPg2yuJ6vJT4LnZu9pDw
         738g==
X-Gm-Message-State: AOAM533ppusEnCdlD29JIwOWNLUFi3B2sJYPYP1XsyChVaTQrrXGr45C
        3bm8w/W5Ff8RdsH3G88ysOyO8g==
X-Google-Smtp-Source: ABdhPJyF+9Nmae2A35E+099haCMQJXZr77AKTKeOy+sI2cM34f6b049fZ7TlZg95yExarpjoJJZSpQ==
X-Received: by 2002:adf:db52:: with SMTP id f18mr31877255wrj.225.1618328958600;
        Tue, 13 Apr 2021 08:49:18 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id w7sm20814515wrt.15.2021.04.13.08.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 08:49:17 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] Intra-refresh period control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3480b6ee-f442-57be-473f-c90966584d40@linaro.org>
Date:   Tue, 13 Apr 2021 18:49:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Any comments?

On 3/2/21 11:53 AM, Stanimir Varbanov wrote:
> Hi,
> 
> This series add a new intra-refresh period control for encoders. The
> series is a continuation of [1]. Comments addressed:
>  * A typo in .rst (Hans)
>  * Clarified the relationship with CYCLIC_INTRA_REFRESH_MB (Hans)
> 
> Comments are welcome!
> 
> regards,
> Stan
> 
> [1] https://www.spinics.net/lists/linux-media/msg183019.html
> 
> Stanimir Varbanov (2):
>   media: v4l2-ctrls: Add intra-refresh period control
>   venus: venc: Add support for intra-refresh period
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 12 ++++++++
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/venc.c      | 28 +++++++++++++++++++
>  .../media/platform/qcom/venus/venc_ctrls.c    | 13 ++++-----
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  6 files changed, 50 insertions(+), 7 deletions(-)
> 

-- 
regards,
Stan
