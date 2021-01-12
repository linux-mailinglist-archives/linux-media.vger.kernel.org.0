Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84ABC2F2B98
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 10:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390600AbhALJqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 04:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730148AbhALJqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 04:46:38 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59FEC061786
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 01:45:57 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id i24so1560636edj.8
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 01:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O/JW+c5pRgp3Cdb4ug+adpXkHkQXjO8EvKGs8aX5uuU=;
        b=tQxnMVwg+P8ZPqqWrqYBPfkrgus5bER79E/Prv4nRpohoCKY7I821wzI3Ct8+bkNnr
         dGwGPSxMCcQ/1OJzsIirk5VbDO/XZN6+5tDU/3R1Mr3yrFGIej/Hb5sADBBzcXhweCai
         cSaNOLiYtjjdvibygnU4GKwXJmqlq51TfsPnC2cSu3WgI4/o61h6FlDVkkPwlYPhdiGu
         IYYus7PxY1Z9ALKtxiK3s5g9PEAm0FJkhi3cKANMIIKe54nO2Z3GmuYcNvWBla89z0An
         4ITCnBgfWOIAU1rV34sBbyPdmWa6yLjZ16f3tZCp3QuzSw7p1iU52kSn6h6uBaiNIrp9
         7nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O/JW+c5pRgp3Cdb4ug+adpXkHkQXjO8EvKGs8aX5uuU=;
        b=hndaLfF4XmCszVHJaQxbWT50pWx8STUl96P2NO2Hng1KhxAFrYfJoLKRaehVEOYm6C
         0S2zObjuTds8lEb6Yu8iPfL006SqyzlRabuSxAbbh7mBuQec/QpBsieOcpo5a2UpkOUk
         FbgL9VPPQcTUqbBoJ/gDtK6LE4osfD31uUDCI+G+AUpbRgUO4QJgLPTE1uua/DCI6/gJ
         EZdWwUo4kqN8Le2Gtv18QubsdGIaZTLRCCgljOyaNMsN6Scp44Z3Nq5vVQtzBF48zyke
         psW7CH49bbiEuD6LH/BpYxXN+7tvNPnfgDhZEOvWuSsxRtzjoY0m02zuCrqwvnb6dbVk
         epaQ==
X-Gm-Message-State: AOAM530LiCRDCBixE47/SG169b7quEkIGoyBhCFoZP/5tbxKJIuYUpSX
        B4XEeK/2kZRjr3ZKOoI63kmqdA==
X-Google-Smtp-Source: ABdhPJy3t+H9sQpEf46JojbIuymgMhVRI7yuTtFdO32c8imL2uNFaFrGtfM82VcSi+XaP6Qr/lxPMQ==
X-Received: by 2002:a05:6402:1286:: with SMTP id w6mr2766860edv.351.1610444756536;
        Tue, 12 Jan 2021 01:45:56 -0800 (PST)
Received: from [192.168.0.3] ([84.238.208.208])
        by smtp.googlemail.com with ESMTPSA id e25sm1163550edq.24.2021.01.12.01.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 01:45:56 -0800 (PST)
Subject: Re: [PATCH v4 3/3] venus: venc: Add support for frame-specific
 min/max qp controls
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
 <1608809135-26061-4-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <aa8a9a4d-7be5-ebb5-3588-13387dd554fd@linaro.org>
Date:   Tue, 12 Jan 2021 11:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608809135-26061-4-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/24/20 1:25 PM, Dikshita Agarwal wrote:
> Add support for frame type specific min and max qp controls
> for encoder.
> This is a preparation patch to support v6.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  18 ++++
>  drivers/media/platform/qcom/venus/venc.c       |  21 +++--
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 114 +++++++++++++++++++++++--
>  3 files changed, 142 insertions(+), 11 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>


-- 
regards,
Stan
