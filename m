Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A25F33D26B
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237114AbhCPLHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbhCPLG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:06:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092C2C061756
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 04:06:58 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id si25so15701206ejb.1
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SlQ8oAf/ROj/i2pJUiSVLnZWVyAqcbr95/tEIYFMNsI=;
        b=X195eItOiNMnuN3/lDeuNZFouOIAMJUVO/SzgYna2+mmPFrWekyp30te9XXP6ohTIv
         W0rtjww7lcgu2YZQ8Gjcu7gcatDrveTwhW1FbMlxQihBcfSG9MMxe0EcyXF+fRk8gfTQ
         BfpMW5CsgWeWuFpLn5Sf0n1fQ6P+srOt3FBPCOiQvXXOQW2YMNwy/cegu1yRHzudub2s
         YnpSGAKRfU3YW3zh8A6knf+utHuGGq6xZkO9Mek4x0s4upnyY8ape13wnBqYFwUvk+Cy
         wOeyhxWb8V9tpbqeHAZHf/uWu8tv2JNLpvSL7X5q07tfR7rsnSe9LtaTDF1G+9eYUj/J
         1Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SlQ8oAf/ROj/i2pJUiSVLnZWVyAqcbr95/tEIYFMNsI=;
        b=gT3LftdrVLGGK8yID8gDPx2JGkA3zlLkGtMf2zefgRwu1WiBv+imWeUr/pEA9/YB6v
         4M+Ex+xzP05roeyCJPe98KpkHcdsiqFwC39mBZuh8h4Sa6KYgjVn54V/ede8Ct1FWSra
         +VEFhyQJ8LW7c0XyLa9PiupO5/DbJRhiw0urrfrtFDoV5dd4cejzn3vWMcj8q0DT3Kts
         r/6Y9EBqmv78Q6hrbTCwfCt6h4mztv0bE5whkpoMn38m9p1KF3m+tbWb03+uiV5l6k8k
         96hqyymNJtDhgqou9pRGxpBQtKKLvcFGiKAqjoMbOOaCm5IV2e18T1IFrtPbQWQ1UCES
         OwyQ==
X-Gm-Message-State: AOAM531q6WahHQEV63GSEBlb+Fj0fT9jJagLoLvPLkvLE8g3auSlqZGH
        N9OFQlShtwjZJhiPDE3kEva4xA==
X-Google-Smtp-Source: ABdhPJwTN6q9HPzff46bicBabts3M6414B9gMyZHG283RQ9BWUqoBt6nIAWufZ2tHsFrNdF54rRpZg==
X-Received: by 2002:a17:906:3751:: with SMTP id e17mr29237168ejc.553.1615892816743;
        Tue, 16 Mar 2021 04:06:56 -0700 (PDT)
Received: from [192.168.1.19] (hst-208-222.medicom.bg. [84.238.208.222])
        by smtp.googlemail.com with ESMTPSA id r17sm9111422ejz.109.2021.03.16.04.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 04:06:56 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add decoder conceal color ctrl
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <41cb079d-0a9c-a684-661d-05e8c7d97ec3@linaro.org>
Date:   Tue, 16 Mar 2021 13:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans, any comments ?

On 3/2/21 1:44 PM, Stanimir Varbanov wrote:
> Hi,
> 
> The changes in v2 includes:
>  * reformat the table in documetation to define Bits for different
>    bit-depths of color formats.
> 
> regards,
> Stan
> 
> Stanimir Varbanov (2):
>   v4l2-ctrl: Add decoder conceal color control
>   venus: vdec: Add support for conceal control
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c  | 18 ++++++++--
>  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++++
>  drivers/media/platform/qcom/venus/vdec.c      | 11 ++++++-
>  .../media/platform/qcom/venus/vdec_ctrls.c    |  7 ++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  8 files changed, 87 insertions(+), 3 deletions(-)
> 

-- 
regards,
Stan
