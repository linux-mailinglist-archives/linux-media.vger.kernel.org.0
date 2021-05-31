Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFB9395993
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhEaLVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbhEaLVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:21:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82A3C061761
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:19:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n4so10551207wrw.3
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oUs1Ch1W6XuZQWHxuWCfWzh2D1v+wPWvtS2pC3Cph6A=;
        b=BKpTdykIchu0BdLJbPIdTBG6OPJWQ2NWxJJ2DgJrdAckZRlbfrgLtz/6OMc85nIjvp
         AF4mYrsSkzmCfALsXQP8dXGV+qP5M+l5PfiroKiH2S3p0g8POSXvnd7gn7Gx6rMpmFnQ
         G/GRUb1xk628c7JS5WTxh5Eec8eGO2IE9anVEiCI/TtT+JnRvx7hv39c+qsnvTWOb6f3
         3NI5Hw7oItV7eNbZ8w4QbvdCDXHwmHFTf3WkE/xKWTTOSyXhpVw63bwBPkPHeHUm2b72
         tcnLGyJ4P5YCigsik3A6O1BIsZMSyvBwO1/dxCco3c9U6uG0W+Dv1jUioYOwlFD7p+M7
         qtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oUs1Ch1W6XuZQWHxuWCfWzh2D1v+wPWvtS2pC3Cph6A=;
        b=L8wbwpo3YHrsZ/1XtFbIJWNOJeXpbPWy0K901k17EHiFrjmKpQaGq6z32t9SoI3KFv
         yOgSqEO30hYnQ9pIpg8wGMnCbRaOqmmucMrfQ5Oh6fXyrKy3wr2wZVZSasZIXaT5uPgY
         WtxxcYBtpaypUBa77B+jJsqANKaniHZSbJKT7crkzJU5F3M1JRlfrdv5OZa6sQSN1Lrp
         55PJqWgrx6QuhoWRkNIvMQ8ks7IZmJU+Yb5AmvA1NKx+Ivi2Gjuu0heJlCFHiPmRWpQS
         rlxsCLo0vg1Wbd3tjRZvWA99R+Ln21R+s3o49QNgkn+4qF0cgg60xxEsCY9/vXe8RYnp
         9pwg==
X-Gm-Message-State: AOAM532LHiQHMPkf5ciCd8WlBOhUZaHF7FUroANdtX85CXTc8d6fKDWJ
        +beRNnifnfCA1olbhpBPR783xn3sd9awvxcb
X-Google-Smtp-Source: ABdhPJxAcE+HR6VWeHGocdXFdWS/JOouoXaV3UQ+Jkgsf/qphTpZhEYdJ9smPocSSlZVzrwnF7CpcA==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr22103935wri.260.1622459995349;
        Mon, 31 May 2021 04:19:55 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.googlemail.com with ESMTPSA id d9sm16708458wrx.11.2021.05.31.04.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 04:19:55 -0700 (PDT)
Subject: Re: [PATCH 4/7] media: venus: hfi: Skip AON register programming for
 V6 1pipe
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
 <1621417008-6117-5-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <48d9044c-aa5f-db63-ebf8-df05714cb2bc@linaro.org>
Date:   Mon, 31 May 2021 14:19:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621417008-6117-5-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/21 12:36 PM, Dikshita Agarwal wrote:
> AON register programming is used to set NOC to low
> power mode during V6 power off sequence. However
> AON register memory map is not applicable to 1pipe,
> hence skipping AON register programming.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Co-developed-by: Vikash Garodia <vgarodia@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
