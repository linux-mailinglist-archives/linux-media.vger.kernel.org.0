Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A4B2F2B91
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 10:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387948AbhALJpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 04:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbhALJpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 04:45:00 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E4BC061794
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 01:44:20 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id u19so1589101edx.2
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5KZS3oEWwc8UiVa/WStbmjJky91Sx8kkOWesTtdtVNM=;
        b=DwhTdum5YsD9yMVyTaObRK3HUeEOs2BOuqj0ZWpLMfW/7+nGdHmph8sVoNHzuz3/85
         JuCbKiv/hwGa4RZhyEn16y0uTXs+3QqdeAj9cAIuunZ8mAiA9tA5luF8TCZ/JA7Vwvst
         bRWo0z0EpLcEp/8tLMLlCXm7osD6+EsbrcupssopEyF/m12sbzqD0qC4UzhEkRtm9XW4
         SUxy3VKh5jtxp37fF7d7EaZivtOSnOCaFWEfNsJtCxWT8L987agqZ2e4/yT3vc/gYddu
         JtoME8An8A2FNqH7D67C44g0tvKWVE4iFdx5Y+PRDTHztcIPMDYk++5VfGt1J3/w0/W4
         whrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5KZS3oEWwc8UiVa/WStbmjJky91Sx8kkOWesTtdtVNM=;
        b=PvVuK4IPkmrGPbeDE0OPa55AaEXiXjBsjY1HDqzxAjKsoPU34N0pePTyxf8HAVHUEN
         DbqOemQ/BqGcOjHC5uhBKsl1Qgvq0cVmdU+TqWMw4FRoUhpg0qs8oXkqlQaWLsj8s4Pu
         KnPwBVKUKaIvDNna3HH47DxCfBzwmXFkrOSlmko7m16lKOWAlOxfceOOMsAe/2ZChrIm
         uYilaiu74EHSjYvBLce0VNvaN9H8UYLDkvxbN1XZSmKLcIrkE9365h9k9ffOpvb8eIi1
         j8dB/AnNAfDKNFXLzvs0NytYEgxIq/lWs+pEQJgY1KRcxRMhpLfwTX92UDuulOqxsj2t
         elmQ==
X-Gm-Message-State: AOAM530txM+cW3mBwgM7p6XIfYJa/wtlM7/hzwdt8qLHiD8R9ErvD5TS
        1c0WIvXReh9tfoG3MmXXhm+GcQ==
X-Google-Smtp-Source: ABdhPJxYIhgb9NbYU1QUxQqZeeQVCSMUgvkCLjX2BuHgYfsyhf1PwHoB6JRbQwrrD8dzff/8mmUUvg==
X-Received: by 2002:a50:b746:: with SMTP id g64mr2716178ede.33.1610444658903;
        Tue, 12 Jan 2021 01:44:18 -0800 (PST)
Received: from [192.168.0.3] ([84.238.208.208])
        by smtp.googlemail.com with ESMTPSA id z12sm985237ejr.17.2021.01.12.01.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 01:44:18 -0800 (PST)
Subject: Re: [PATCH v4 2/2] venus: venc : Add support for priority ID control.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
 <1609738914-22769-3-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9b3ab98a-f369-9235-1217-9e195a402114@linaro.org>
Date:   Tue, 12 Jan 2021 11:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609738914-22769-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/4/21 7:41 AM, Dikshita Agarwal wrote:
> Add support for base layer priority ID control in
> encoder.
> This is a preparation patch to support v6.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       | 2 ++
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>


-- 
regards,
Stan
