Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E6B78967E
	for <lists+linux-media@lfdr.de>; Sat, 26 Aug 2023 14:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjHZMIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Aug 2023 08:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbjHZMHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Aug 2023 08:07:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C6C2105
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:07:39 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31c8321c48fso692273f8f.1
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051658; x=1693656458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgjOnn8759o52/0xR2SZGeU49du3p6c+06WsheGV4j4=;
        b=cz3G1Tf2I0daNU/qdQZgGdJqb9+dvz2XPOebn9ezsblUs6GOyTLhX9VXpiWMqD3K9l
         ifnVGcIOonu9oa8yDL1MEN8826vPI92uPLQvOd6myLac4XFyKKPpczuh1Y1RLmR/+EBE
         tsbeifr5TDXiCns0I0b15gZJkwwr3gtN6Cbs1IkHSct8heuEWLsDBq20dcHftyXyqUVQ
         RWgBdgIeOnwSKIkHYD4DkoHc1an6rjGC6+ZwXfevOSN1hbaRCqT6CCt3TvvnWp4vXGPA
         xF4U/vW8uVT5oVfdatiG0qDzBj22g7PhBRaBdIWnLJ99bq9DA+MXfoG/Xtz2CJkmnXEQ
         u6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051658; x=1693656458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgjOnn8759o52/0xR2SZGeU49du3p6c+06WsheGV4j4=;
        b=P9G1QweZdZSElrVgOI6giv6R8XM+joyVLusBu7WsJ83PC+G5SC/SMEXXXMqvA8Hoz7
         Bt3XVnkV9W8yvxqf/2V+KNEzk/+r0n7OMiAV89j1YzYMzz8UJW8QfNvEBGTLOhP8EWd9
         S3ELruWBvYAp10LZZKXj8LdvV/Axhs0rPB1xnD2bV3sHgGkQ3MFZNjt5SYuLnR3i8uDA
         TQ25NIdIaTLYO9ocbmI36yy6dS6GKIYYTNOJBTbRX5uHY5+uey5fM7p+6g2rmEoNyQaX
         G9WHN+eJglcEBCnV0tAxv0BAjThfepEFOa1pClFyruNMNvd1U4yP97bpkSNeIxWK8BLk
         a4Pg==
X-Gm-Message-State: AOJu0Yw23DuUUL5wbTmKpwAhWaLzaAeOkJ+UPrNLg1N+AZRe3zrPgTTV
        4pMLlxnIOaNHxR6WPvTQp3lgmw==
X-Google-Smtp-Source: AGHT+IHd4Exu5h9J0XmDWeeqi750ETU8bhPtCzxFplnhIiVlkhJpQeEw9xxbIIb6CYoihBXGSX+5ig==
X-Received: by 2002:adf:ed51:0:b0:319:55d8:5d51 with SMTP id u17-20020adfed51000000b0031955d85d51mr17212507wro.30.1693051658113;
        Sat, 26 Aug 2023 05:07:38 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b003fee6f027c7sm7972018wmr.19.2023.08.26.05.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:07:37 -0700 (PDT)
Message-ID: <1b15ca0d-0781-c3f8-4822-fce3a7fbb7e7@linaro.org>
Date:   Sat, 26 Aug 2023 13:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 11/15] media: qcom: camss: Functionally decompose
 CSIPHY clock lookups
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-12-bryan.odonoghue@linaro.org>
 <d8e54e0a-b176-49eb-9d8d-66324cdcd2e8@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d8e54e0a-b176-49eb-9d8d-66324cdcd2e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2023 11:12, Konrad Dybcio wrote:
>> -			csiphy->rate_set[i] = true;
>> +		for (k = 0; k < camss->res->csiphy_num; k++) {
>> +			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
>> +								      "csiphy%d_timer", k);
> This entire functions is like.. soooo over-engineered

I'm going to accept your compliment there.


> adding something like csiphy_timer_clks and cisphy_clks and stuff
> would make this string comparison mess unnecessary

I don't understand your comment.

Having a litany of static comparisons is definitely inferior to a 
generic helper function.

I'm not sure what you are asking/arguing for here.

---
bod



