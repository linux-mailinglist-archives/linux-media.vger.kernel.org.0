Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BAC767148
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 17:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbjG1P6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 11:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236641AbjG1P6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 11:58:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7C84237
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 08:58:26 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3176a439606so2276654f8f.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690559905; x=1691164705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7fcq9Wxv4AEPI5+GHtEeD9t936v+W4TRrWVcahSl6o=;
        b=twbZD6p5UVZ1hHG2O91qvAxiqy6Y+GYYkkoCpYIZJMvQMygyjgsPtFbGmNaDx7pcJt
         CuIcSNx5GwX6pX5ewFUzTSeQNslrtVUAl1N09pdmKZ29DYeQXKsm1k5nF1iPjegQKQoU
         ISw8hOMq8pKoUJOiDTHxL/YV9dmNDzKXA2wbt3BLA7ocmZwPubT7ATyxCQUVFHQa5vh5
         tqFtcJbvTBGF4uiybSAUalGfJu1p+E0WmFjOyEcgaZBo1HSQm+NHi1E9+xrX10UNOk0G
         cTexK7g39KXh5QqwSf+MOUl4FIfNGd1mu2muZbDmEeF+OVHCyJrq4Y8vIGkv8X3B/sgR
         KdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690559905; x=1691164705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7fcq9Wxv4AEPI5+GHtEeD9t936v+W4TRrWVcahSl6o=;
        b=WT+ALkh5AkdsmZ3JsLZxh9VVaZRDgMQ1drsXvgaYjbsWg/9yeGulPtAMFmSDpl87Rf
         4H+T92JTdaYMP8hUq67jU21Tij70nNLGVGSwBIeCZn93Sp/bp3nW2WHlAhhkL/XvVNal
         WLFbURcbllugNoXY5hXhOHt58kOhif96zQoYUng/qJCvVoUB721Iw4IxfBn+rBcCUJYL
         /WIIMKXp9dYulUr6DJRiYP80UYKLoCWOdigZ3RM0jmE5Fglj3jWIX9gy0vKGgTZLv5LB
         bw04mSzqWaGwX+X8op00Yre761b6UeQgUQhwlqtuysXeIukhSXAk3BrEJs8QeQzYz06g
         UEug==
X-Gm-Message-State: ABy/qLZ4CN6q7nmFh+nGBGFDYadIILrzyfmUuk30bSndBzX40dR+AMXt
        6YpWRNX10NS+7QKjJMwyBkOsvQ==
X-Google-Smtp-Source: APBJJlF+T6NU2JDjjWZC3+SoMRZuFtVWX99/lY4GVDwkIqqKW8Ib9apLj6yZi8qtvwhpUjgsk57Z8g==
X-Received: by 2002:a5d:50cf:0:b0:317:5b1b:1a40 with SMTP id f15-20020a5d50cf000000b003175b1b1a40mr2131659wrt.49.1690559905279;
        Fri, 28 Jul 2023 08:58:25 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j4-20020adfe504000000b003063a92bbf5sm5199752wrm.70.2023.07.28.08.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 08:58:24 -0700 (PDT)
Message-ID: <f31de68f-e64b-2b1d-7fbc-6bf7f94347af@linaro.org>
Date:   Fri, 28 Jul 2023 16:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 18/33] iris: vidc: hfi: add Host Firmware Interface (HFI)
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     quic_dikshita@quicinc.com
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-19-git-send-email-quic_vgarodia@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1690550624-14642-19-git-send-email-quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2023 14:23, Vikash Garodia wrote:
> +	rc = hfi_packet_sys_intraframe_powercollapse(core, core->packet,
> +						     core->packet_size, enable);
> +	if (rc)
> +		return rc;

I'm 99.9999999999 % sure this is misnamed.

"Inter" means in-between two things.
"Intra" means inside of one thing.

So "intraframe" means inside of one frame "interframe" would mean power 
collapsing in-between two frames, which is what I think this does.

And I'd still rather be adding inter-frame power-collapse to as many 
different versions of the existing silicon and new silicon as opposed to 
segregating it off in a new driver.

I'm assuming that more than sm8550 supports it since @ the end of the 
day this is a firmware feature to power-collapse during an active 
session when we aren't busy.

---
bod
