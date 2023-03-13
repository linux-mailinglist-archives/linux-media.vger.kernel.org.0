Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A936B7A50
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 15:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjCMO2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 10:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbjCMO2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 10:28:20 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D001165E
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 07:28:17 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id o12so49470139edb.9
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678717696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtstJD3/hydqzM3cHZ+u7SVJlCO4w3i30mirExqm+ew=;
        b=n9xc1hix4I04GYTvKHxu6HfVOfV2nhzxwWhUcptyl8ik4Pl5iD9INYXgkGi7q3swIK
         MWzs+601qEmgn2wWf+cQZxEu2pEEFPmV1LfxjA3v2cunZGiQQwmQOUbUpm4sMGi4mjS/
         BP0EHnQHp9Gg30gY0PFswGVvgQO3Kr0KF4eDA5WHgIubG8iMlZgqFixc6EDhCWjqKciO
         EyUTquOGbzpWXt7TLJ5PUKCr4qx9nRXTmeOCZIJ9JACxU1QaO1vdmWN5x9lfKix909S5
         9HCjH9+e8V2xXOZcLeM7COVGkHriqvvRuKpM1oUa2EX9rbMUcLuKVsnGf7ge0bok+T/2
         Tm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678717696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtstJD3/hydqzM3cHZ+u7SVJlCO4w3i30mirExqm+ew=;
        b=GapxBjoUMkhPHCq6wwbdMHl8WJvZPZq5LmDeFeeAvWElFNWGE4tjXEYp/e1E/6p6zH
         6K1tbai7mNm5okMku5mHgUteiiBbWXTViaQVNvaLQnzWBWCQMAeme5wPfMKOqWGEZ+hd
         XKYIupsFtZS0ZldOIfPcYTu9G91ouvxosgfzmSl5Wc3fVEX3VDn7edJ8+BpoPASgPXLf
         o8SlBQUz756+yWCcyLTHLePHxfTxQE0NPRGMu1jaPw/GvQDj8xsuB9pjhH8ekT1ddvAx
         zd9iUs3DgchThJKLqgK3glg7ERRGiuffMDb0BdWNsH73d70cLDeX+Itl/5uaj/NxDgvg
         1+Ww==
X-Gm-Message-State: AO0yUKWM6PgLoWjBxIyz6bxZAn1JcWHXdOUg8keQwwY3cOrheWG8/m9/
        Tn3qdYyr4s5UIe7aFqN6XR0ihQ==
X-Google-Smtp-Source: AK7set8mc1JBzDyrckjzGNOvQdHN9mzEXYplLnbsYbsbM/TPKV8zE5W8ruSj2jhdxMG3uwk3aW8NFQ==
X-Received: by 2002:aa7:d1d5:0:b0:4fb:5795:b7e0 with SMTP id g21-20020aa7d1d5000000b004fb5795b7e0mr5560293edp.31.1678717696370;
        Mon, 13 Mar 2023 07:28:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:69db:4882:d071:27c4? ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906805400b0091ee4923bb4sm3481210ejw.51.2023.03.13.07.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 07:28:16 -0700 (PDT)
Message-ID: <85bbec87-992d-f9a9-2f2b-bc41457933bb@linaro.org>
Date:   Mon, 13 Mar 2023 15:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 6/7] media: dt-bindings: samsung,fimc: convert to
 dtschema
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20230216142204.48394-1-krzysztof.kozlowski@linaro.org>
 <20230216142204.48394-7-krzysztof.kozlowski@linaro.org>
 <ZA8YJx+NE0+89YaD@valkosipuli.retiisi.eu>
 <ZA8v98mqm4Xdt2Sl@valkosipuli.retiisi.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZA8v98mqm4Xdt2Sl@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/03/2023 15:15, Sakari Ailus wrote:
> On Mon, Mar 13, 2023 at 02:33:43PM +0200, Sakari Ailus wrote:
>> Hi Krzysztof,
>>
>> On Thu, Feb 16, 2023 at 03:22:03PM +0100, Krzysztof Kozlowski wrote:
>>> Convert the Samsung S5P/Exynos Camera Subsystem (FIMC) bindings to DT
>>> schema.  Changes during conversion - adjust to existing DTS and Linux
>>> driver: add iommus and power-domains.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> This does not apply on top of -rc1.
>>
>> ...
>>
>>> -- compatible: must be "samsung,fimc"
>>
>> I guess you have another patch removing "simple-bus" here and another
>> location in your tree?
> 
> Ah, what's missing seems to be this set:
> 
> <URL:https://patchwork.linuxtv.org/project/linux-media/list/?series=9839>

Yeah, dependency is mention in cover letter.

> 
> But also the second patch of that set doesn't seem to apply. :-(

Yep, I forgot I already sent same patch two months earlier. Let me merge
two patches, rebase and resent, so everything will be easier for you
(hopefully). Sorry for the mess.


Best regards,
Krzysztof

