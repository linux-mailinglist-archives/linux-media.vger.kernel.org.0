Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9E3395992
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhEaLVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhEaLVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:21:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C68AC06174A
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:19:33 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id b9so16076695ejc.13
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3BI+WxFeJVP/z4UaiBvZQjKoXdxnhoRpGlAlohrIfqk=;
        b=Je6AmO3k7uAXvUnE/I3GzXmyor6nphE3Brq+PSZx3AeFDCGiaTdDWdrGOPn+AKjCn/
         Vw0uGlBtR9Cgdhx5ozG5RiN/RJjX6TsGxGDpgS4WUo2rmJxF3gCLoVH5dF+57a5ljdHN
         Ef1i7torbtI3FcsALpLqEgttAxFXUQ3WYyceoiWY5Tw7oMuYEYhfqDq4LA9/oCHRszJ+
         pjsfXZSm3m3+wveFvyEEzvIKI3X9ZzhIvqpBaurwoxmZF4rqZa+PrSVVY+DjWt4mTqJi
         2qgnbqAZSkfhqyFOFlQP861TEp0wRbuCGeE0hHUYSiljyqMooxhTPr0aXpLw6rQcA+Ym
         KZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3BI+WxFeJVP/z4UaiBvZQjKoXdxnhoRpGlAlohrIfqk=;
        b=PJygMFhldPFCSX0ep+x7i7+vMa9jqhAv+wIqqD90uLGzBxFJZ+9Azkx1VoLTNgxjL/
         JYMO3LtAZwzKhNTYL1gEC8ihnfVxqHKD9WX1jejUXN1q37LOK/A0I/q11Ojdfth7Ht+L
         6bDQvGkhanDG29i2dXXsDhJp8tiw1DjxG8ghal65BtK0UGSy6/kvDVIXhkbt3oF19koC
         ZnZCKhDIc3LppucBkqrnjfF3ugL8mk+uV6buP4OU+MNsy8ADEgKwB8vE08qGXrInz1Fp
         T8yY9kUhO4tYy8uJZRk3LddxOB4Vme+IL6MmJbent2dI/8ZKWLb+mCviYK24Qo4lt2uv
         RB+Q==
X-Gm-Message-State: AOAM531dE5Q1ETZb5vBFfuV336GnExClT6u/ehqQHe7bxaVZE1HurHxY
        mtC9gRzhTpFSredg40l3wG4ohw==
X-Google-Smtp-Source: ABdhPJxxUEd7xyydidSoSmThKBcU+xRMvqiwt1PryCgVYHpffzNDjd/oUUhfEb7YVXX8kPyDcjhusQ==
X-Received: by 2002:a17:906:22c6:: with SMTP id q6mr22567073eja.275.1622459972171;
        Mon, 31 May 2021 04:19:32 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.googlemail.com with ESMTPSA id q4sm6699275edv.24.2021.05.31.04.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 04:19:31 -0700 (PDT)
Subject: Re: [PATCH 3/7] media: venus: Add num_vpp_pipes to resource structure
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
 <1621417008-6117-4-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <705244eb-33af-57aa-9c96-9076a11e8436@linaro.org>
Date:   Mon, 31 May 2021 14:19:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621417008-6117-4-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/21 12:36 PM, Dikshita Agarwal wrote:
> V6 HW can have vpp pipes as 1 or 4, add num_vpp_pipes
> to resource struture to differentiate.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c            |  2 ++
>  drivers/media/platform/qcom/venus/core.h            |  1 +
>  drivers/media/platform/qcom/venus/helpers.c         |  2 +-
>  drivers/media/platform/qcom/venus/hfi_platform.c    | 13 -------------
>  drivers/media/platform/qcom/venus/hfi_platform.h    |  2 --
>  drivers/media/platform/qcom/venus/hfi_platform_v6.c |  6 ------
>  6 files changed, 4 insertions(+), 22 deletions(-)
> 

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
