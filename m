Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7AE22C861
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 16:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgGXOuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 10:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgGXOuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 10:50:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90AFC0619E5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 07:50:05 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a15so8557417wrh.10
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sbSetUwrSbr+vfh9kXLAONxXQfhjpBwlhJKLTwQ8Bb0=;
        b=i5z8gThrFymRsCnvkaoVzoEx5yGuK/LL8XHkzaCJLTevTT9PAw0VYe1yZQmtoMq9Lp
         +QKaOL+DWQTrGR8fbW6D10nlFDG4gt4ZnOKT6YpTk1e05mZc12DFSWk0g4iZAZryKAar
         uh/vgzzwtSj9wOePrfZJ3ndzXM0Jy460UCL3asQ/yrcLKH9taUFZzPC4+7oyjl+I6B5C
         ZGwf65Z+NlPUSsMohWlyTpV+74C+pIkhpmMZrxPQTa/7g9/kUcav+/rt+fGNw3kw+v4J
         Pmmp9VpzMw9dNBfsNQLNVNQ3oWigWY8cRNj/zgqfJpMHkzyNdsL+hiBmLXA8mG+e/lSO
         NVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sbSetUwrSbr+vfh9kXLAONxXQfhjpBwlhJKLTwQ8Bb0=;
        b=fWidqrxqHj4vbamojbFliJknSjop2wpfKg68lW949FpB7LbujzVMYfD4rp9GcDFfBt
         9ePJsZxW1BV8Wrmy2LTPFGZQkctMrKxWUOKdxlCV0IbciTR/XGZDgjIGelv4H9D4kttN
         k3VXwKjIgs2Z1Q21X+njcNkTMvSVgnv0FXNSjW3lyVfdgv1l5QzzE+ixNnpOIhMQI8dI
         gMNYkvjhZ9KfogL9takqWK61ntxsQcMkwX9/GjgtA7tUzEsb4fJDEsh31nXaMl/0yVp3
         jL60fEFS7wNzNIzCzc2bbgr1s2oNNv/1Zne4lHcKLpCbjFnRIoToYCFYP3iS8oXp8+uj
         AAdg==
X-Gm-Message-State: AOAM5317OSLsNDJesYvQ5potJa0cgVsuUCf/hkEvqgXJjmQjzMF1zGef
        VJd8U14OMaBecjmJ0EgKd61vHw==
X-Google-Smtp-Source: ABdhPJy/9GpdZScV6nf6EBo7LLjnLn257JkRTwVM70jb/3car4Qzp/R5mh+5lBakuVK9mESEmDwXug==
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr5663164wrc.235.1595602204528;
        Fri, 24 Jul 2020 07:50:04 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id b18sm1595015wrs.46.2020.07.24.07.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 07:50:03 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] Add new controls for CQ and Frame-skip
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <fa34e819-6084-ac73-fdc7-e2a1a3419213@linaro.org>
Date:   Fri, 24 Jul 2020 17:49:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Could you suggest how to proceed with this :

- wait Samsung mainteners for ack.
- make a pull request with your ack for samsung mfc driver changes.
- make a pull request for constant quality only.
- postpone the whole patchset for 5.10 merge window.

On 7/21/20 10:45 AM, Stanimir Varbanov wrote:
> Hello,
> 
> Here is v2 with following changes:
> 
>  * 3/6 Added references for VBV size and h264 CPB size - requested by Nicolas
>  * 4/6 Fixed compile warning
> 
> Previous version can be found at [1].
> 
> regards,
> Stan
> 
> [1] https://lkml.org/lkml/2020/7/20/619
> 
> Maheshwar Ajja (1):
>   media: v4l2-ctrls: Add encoder constant quality control
> 
> Stanimir Varbanov (5):
>   venus: venc: Add support for constant quality control
>   media: v4l2-ctrl: Add frame-skip std encoder control
>   venus: venc: Add support for frame-skip mode v4l2 control
>   media: s5p-mfc: Use standard frame skip mode control
>   media: docs: Deprecate mfc frame skip control
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 53 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  2 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c  | 37 ++++++++++++-
>  .../media/platform/qcom/venus/hfi_helper.h    | 10 +++-
>  drivers/media/platform/qcom/venus/venc.c      | 20 +++++--
>  .../media/platform/qcom/venus/venc_ctrls.c    | 18 ++++++-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 12 +++++
>  include/uapi/linux/v4l2-controls.h            |  8 +++
>  9 files changed, 160 insertions(+), 6 deletions(-)
> 

-- 
regards,
Stan
