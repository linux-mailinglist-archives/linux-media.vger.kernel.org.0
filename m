Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E4567FEE4
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 13:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbjA2MbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Jan 2023 07:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjA2MbK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Jan 2023 07:31:10 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A7D22001
        for <linux-media@vger.kernel.org>; Sun, 29 Jan 2023 04:31:05 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id m7so8751175wru.8
        for <linux-media@vger.kernel.org>; Sun, 29 Jan 2023 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oMMCjG7xw4KeHO7R13X8iVeuFR01DNR9QgxRsd6r90=;
        b=MJaSgPTYB14TsGSK1qWSJSFkz7r+czxV2yh780u0A+e7b+zJlI5RiTeP63VhOlnKyj
         6mBoI51wz0aG77IeuyOPGpWILfiuVjzTpIfywxSwvqsEAuxzBgOnVPtrogCbTXnzj1zA
         3CF48PGScvJIG3KBTMTklUDDQY8ueHovYutTuW1J4cyyZp2mLn9lHQs4XZa/ApYhCOlI
         xZgcrIcjvWiyD3AwOcxX3dzvBds/Dm0hm/dafvyGv4bl+GtqzrmcfnzU+MKBUjltwJrD
         v+FRUPc45z7r6PWJwHQTQR0qFjgtSlJg4zF23HopDNLNwKLAFao9Peiyso9KAVuPv9Dl
         XRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oMMCjG7xw4KeHO7R13X8iVeuFR01DNR9QgxRsd6r90=;
        b=wYEvQO6p6do0Ebz48pUiTh1HYNF4QH2pjR9pgbK8eK3JhzqhQ2gUstuKsJ2249Kc0F
         s+fHt8C6d+OdztiJFSIrNgBBXgB/DfYV99hcMDHgwJwaXrYShrA5NAoFOCzZnDxCXfBH
         DEdt6pX32MjgdCZvPoji3gvKVgY2TVJ3iaRTrF19Z/vNy5O7ipIKqII9oYYzFSTwvYNT
         grJLuU8XvNnlAYPrI80QWp1EIaZebKgF7mlYEoVYm7zi3Q2J6HFrt/w3sNOhshLE1pX0
         ati8UICmPpZO7W3+DhsX/XQC5DccUzEl9A7hzxPr+s8TpBpPUq1vqRTITxR04BHuOwTg
         theg==
X-Gm-Message-State: AO0yUKV9DQGqZDA9/kjO6URPergO5gssV9F4pJpl6cjOEP3/Fg3qnqRJ
        LiO3j6EF80RE2V9lZSFHP1+04Q==
X-Google-Smtp-Source: AK7set+N19HuPpZ4vhIU3bm1no6GXtfmLeR0XP24mRXinhmCJgsfNb1JKf4KjTM9OAsNlCC8aatg5A==
X-Received: by 2002:adf:cf08:0:b0:2bf:bbd1:1db3 with SMTP id o8-20020adfcf08000000b002bfbbd11db3mr14020755wrj.44.1674995463769;
        Sun, 29 Jan 2023 04:31:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g6-20020adfe406000000b002bf95500254sm9137097wrm.64.2023.01.29.04.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 04:31:03 -0800 (PST)
Message-ID: <0f1fb9df-65e7-d779-e725-84ddd8c5bb1e@linaro.org>
Date:   Sun, 29 Jan 2023 13:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6.1] media: dt-bindings: Add OV5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     chiranjeevi.rapolu@intel.com, luca@z3ntu.xyz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <20230128112736.8000-1-jacopo.mondi@ideasonboard.com>
 <b4794490-b059-373a-dec0-58fcd2344f6f@linaro.org>
 <20230129121132.uamuvywdsuah5ivn@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129121132.uamuvywdsuah5ivn@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/01/2023 13:11, Jacopo Mondi wrote:
> On Sun, Jan 29, 2023 at 12:40:03PM +0100, Krzysztof Kozlowski wrote:
>> On 28/01/2023 12:27, Jacopo Mondi wrote:
>>> Add the bindings documentation for Omnivision OV5670 image sensor.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>> v6->6.1
>>> - Use additionalProperties: false for endpoint properties from
>>>   video-interfaces.yaml
>>> - List 'remote-endpoint' among the accepted endpoint properties
>>>   now that we use additionalProperties: false
>>
>> b4 diff '20230128112736.8000-1-jacopo.mondi@ideasonboard.com'
>> Could not create fake-am range for lower series v1
>>
>> Can you send patches in a way it does not break out workflows? Why
>> making our review process more difficult?
> 
> Because it's a nit on a 10 patches series with no other changes
> requested ?
> 
> What is difficult exactly ?

I wrote above what's difficult.

> 
> I see several patches in linux-media being sent inline to a previous
> version for small fixes if the only required changed is a nit like
> this one.

If you sent it as separate v7 would be fine, but:
1. Threading is wrong - it's buried in other patch.
2. Version is wrong - you did there changes, not nits. There are no
point versions...

Best regards,
Krzysztof

