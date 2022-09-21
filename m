Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63915E5382
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 21:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiIUTEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 15:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiIUTEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 15:04:47 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1783B24BED
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 12:04:45 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h130-20020a1c2188000000b003b4cadadce7so8534433wmh.3
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JzNLhjPJnXTQMWnkzFAIjnoSD46SxZB1vrr6+KSCoMs=;
        b=wdX8uhqeYAyEibQHCkVG2fOvizi7KD6a9SBE6mvCSvzDJOH6tvQ7cBinfVcaXrdoQH
         6YIv8HHGVIIM7k1SQy/G3NKshjNPKmKle5PGWc8rr9Ay04AJa78Uocecjv26k9pg31m0
         YkxyIRqx+fUZYDc9PSuS8FSEZfN84Kix+RlwnWSBMbiM8U5bKE7eAMw/93rHlnrdJJWl
         y2UBYs0a4dQJg2LuJtgUS8YUYIWDunDOI0NNNbZzy4yKPYb/6ta+awAz4WWxPJ2RQ3Mr
         mTJvLRr14Z18OTKdky8pc7R5t9Zq3o39x6wSt/9k+BYgMvkTMI0rgAVXs5IdrIDQg0mm
         KNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JzNLhjPJnXTQMWnkzFAIjnoSD46SxZB1vrr6+KSCoMs=;
        b=BvZOBXC+aCE293Qko2VINWPMlBY8Qr4xEuvHpiBfhBTPyP7TIcUFER8mjhuQLuoRPN
         /NPPyVIntuqZBhldkh5gsS6DWkVGJLIk9tenNx6MkG2OfFA7IiAb0vgHKe7ot0wuJLn9
         vkqcR3kYzy8lqX4BRu2KYyTJG6G03o7ieRuK1xBANBhQgT8BXnVsj731j06RVvmLttBh
         gyIRAhORtlQk4GbDyH1X3RLcPyj1f90jCYd9mgMnIfsQaVPGtFbRujnxwjWCe/c5Zojp
         wvMDRnAcy9YB3lBn10Zfu8nI0Cq0ClpMNlGMhxoFgWNV3ntkOHro5PbRdXvyMAYDoJ4N
         0EVA==
X-Gm-Message-State: ACrzQf0WEONKFqFgrPv/qmy2VcksOfM9BkFckPI1Lz4hk9RKDpcApWc/
        mysSHMq51Zx+V2sJPBNbNLjzUpaKzIMaug==
X-Google-Smtp-Source: AMsMyM5PIJWAoTtZRHpzT1serTLzKOHm7nvjUdvpCDM1CJBmwkkGUp9VikClnhoH+N02ExSc78D0CA==
X-Received: by 2002:a05:600c:5d1:b0:3b4:68a4:290e with SMTP id p17-20020a05600c05d100b003b468a4290emr6700140wmd.55.1663787084152;
        Wed, 21 Sep 2022 12:04:44 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d5268000000b0022a839d053csm3298679wrc.98.2022.09.21.12.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:04:43 -0700 (PDT)
Message-ID: <5eb11a02-d9b4-da47-6cad-eeda9a4b10e3@linaro.org>
Date:   Wed, 21 Sep 2022 20:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/3] media: dt-bindings: imx412: Extend compatible
 strings
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
References: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
 <20220916140213.1310304-2-bryan.odonoghue@linaro.org>
 <YytgG+uVdk7Lzupd@valkosipuli.retiisi.eu>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YytgG+uVdk7Lzupd@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2022 20:03, Sakari Ailus wrote:
> Hi Brian,
> 
> On Fri, Sep 16, 2022 at 03:02:11PM +0100, Bryan O'Donoghue wrote:
>> Add compatible bindings for imx477 and imx577 both of which use the
>> same silicon enabling reference code from Sony in the available examples
>> provided.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The patch looks good to me and I was waiting for an ack from the DT folks.
> They aren't cc'd. Could you resend the patch, cc'ing the devicetree list
> and Krzysztof Kozlowski, please?
> 
np
