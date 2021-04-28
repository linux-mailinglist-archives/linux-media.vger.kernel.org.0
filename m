Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C2536D892
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239918AbhD1Nsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239888AbhD1Nsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:48:54 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A17C061574
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 06:48:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ja3so18849881ejc.9
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=;
        b=o+0LiwxEgpzlqOLtELHEXA0LhFqL5ZRAe5RWrHVf4fx5HL5oZPsMUiB01IzQ/FOCjs
         Ok7IfxuomUUCB6wFMd3QKtPYxlryhcvc8thhicSD+sXy2t+nIT/AWiZt5qlCBaeaP5qo
         fQpZ1u2NxaVuhN69Hb55UrUUlhor4wPg2M+1dRJcstJkNaM1zgiX16CHGzxVq6JjvJYy
         67zM1AlxlSaodd/5ApFXn+BiPez1NksXtekEPrOO/smOWeXvCMFix+FaEQtdim1e9vTA
         SLjleD/WfW5T1QAOPgTh4gvJwL+WPzs5hSmhW2OECuhL+W2kpcJVQkUt8k7IOBMdHq1Y
         Iq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=;
        b=app+nLtMbVDevYkWkDKC//xO1KwBlm+sKA80TnCQU9GGp2h6XhVfLyHnW5NL5LO+2S
         FL9JgBHkdUO9OrtDuWToSShKsfQSbFovw5hvG1SKzg0f91/wcAuy5vmwm+1KU/76mQEV
         cqFXsnh2jNURZbJQl9/IFrJOOQhdE+QXsc9q7CCWmVDWRqFlwE9UNe6ySR0nZLtJ8hRh
         0KD/B4KNO8afjRr2wk640HGEQ+xAUphkzHzhR/Kue7mD3ysdDKArSSnymENrBZqQofok
         yxfUjjmLWps7rSgz4b4d7UNjQW3vwRp6knL8ei47G89mA950oz7wbvBQxHjLeL9X6XmZ
         hI+w==
X-Gm-Message-State: AOAM533SircbCrXSsn1Z7lZ+PA28qnztACKpuxDyVIhJPkkh4z42cIRD
        VocpG56fIP3zuQczTa+K7+eiiQ==
X-Google-Smtp-Source: ABdhPJxabnOp31u5I9SpC9p+kssNW+G7GHHKzD880x1P41RkZh5iFTBtUN9HN7ZDuWqWDm7pWtS3Eg==
X-Received: by 2002:a17:906:c297:: with SMTP id r23mr7474073ejz.144.1619617687749;
        Wed, 28 Apr 2021 06:48:07 -0700 (PDT)
Received: from [192.168.1.14] (hst-221-20.medicom.bg. [84.238.221.20])
        by smtp.googlemail.com with ESMTPSA id k12sm4949564edo.50.2021.04.28.06.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 06:48:07 -0700 (PDT)
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
To:     smagar@codeaurora.org, linux-firmware@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        mchehab@infradead.org, linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org,
        adhudase@codeaurora.org, sampnimm@codeaurora.org,
        mansur@codeaurora.org
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
Date:   Wed, 28 Apr 2021 16:48:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/28/21 3:32 PM, smagar@codeaurora.org wrote:
> Hello Team,
> 
> Please include updated firmware bins for venus-5.4 and vpu-2.0.
> 
> I have fixed comment and title updated.
> 
> Removed 0 byte unwanted bins.
> 
> Below is combined pull request for venus-5.4 and VPU-2.0.
> 
> Please find snapshot of pull request, let me know if anything is missing.
> 
> 
> The following changes since commit
> 85286184d9df1b03bb76049edcfd87c39ce46e94:
> 
>   Merge branch 'for-upstream' of
> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> 11:34:11 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/suraj714/linux-firmware-venus.git master
> 
> for you to fetch changes up to 6cdef281cd16d967ad89c01af6fdda85529a2d80:
> 
>   qcom: Add venus firmware files for VPU-2.0 (2021-04-28 14:42:48 +0530)
> 
> ----------------------------------------------------------------
> smagar (2):
>       qcom: update venus firmware files for v5.4
>       qcom: Add venus firmware files for VPU-2.0
> 
>  WHENCE                    |  34 +++++++++++++++++++++++++++++++++-
>  qcom/venus-5.4/venus.b00  | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01  | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02  | Bin 873680 -> 873596 bytes
>  qcom/venus-5.4/venus.b03  | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn  | Bin 919792 -> 919708 bytes
>  qcom/venus-5.4/venus.mdt  | Bin 7020 -> 7020 bytes
>  qcom/vpu-2.0/vpu20_1v.b00 | Bin 0 -> 692 bytes
>  qcom/vpu-2.0/vpu20_1v.b01 | Bin 0 -> 7376 bytes
>  qcom/vpu-2.0/vpu20_1v.b02 | Bin 0 -> 300 bytes
>  qcom/vpu-2.0/vpu20_1v.b03 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b04 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b05 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b06 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b07 | Bin 0 -> 24 bytes
>  qcom/vpu-2.0/vpu20_1v.b08 | Bin 0 -> 16 bytes
>  qcom/vpu-2.0/vpu20_1v.b09 | Bin 0 -> 939184 bytes
>  qcom/vpu-2.0/vpu20_1v.b10 | Bin 0 -> 42976 bytes
>  qcom/vpu-2.0/vpu20_1v.b19 |   1 +
>  qcom/vpu-2.0/vpu20_1v.mbn | Bin 0 -> 2031188 bytes
>  qcom/vpu-2.0/vpu20_1v.mdt | Bin 0 -> 8068 bytes

Which Venus IP/SoCs use vpu-2.0 firmware? And what is the difference
with existing vpu-1.0?

-- 
regards,
Stan
