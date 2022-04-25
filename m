Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F35150DD3E
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbiDYJ6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240822AbiDYJ54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:57:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6E01A05D
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:54:51 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id gh6so4473648ejb.0
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=trwsUPYiG6KMyUq4Zqzfw1hzPN7iuzDnqEhgRCdHuUI=;
        b=rYOAM7eV9XQpqxE7Aw3qEkLaPXkoJMn4lNCYNPyaR4+87LfSffGXgEIKNDNk3/A8vp
         7v0UpXMIHdq/IvDWfqoMrzf2v5+xcWTQMsUgd9PxUweb5dPPr/vrt0LuJTJYYI8ODKqe
         LEoJvqcuQ1ULNrjaHNODwiSNgpzauSpQfse5tAig0sY/zCegKm+Ka+CY42coAOKSGGPM
         80xKylv42zx3cXct2vGWAqEqrxRzpG4uLXnBBPle/b5p2tR/yf2rzAuLzQntEm/8zM8S
         jWSzh/NXiZ1NNqosUp0l5uLedxEmYK5uZ14TMNt5Ieb4mhSueDzmW/pWoMDlU1A/MZFJ
         oz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=trwsUPYiG6KMyUq4Zqzfw1hzPN7iuzDnqEhgRCdHuUI=;
        b=lctg8v1DS6YVQ9oB+KHNM2usm5FWQwiKa+qA9CF+fhmMZxVTRf3xYSgQx8bPM5Kqpl
         p0JGBsTxC0NCr4MmFIQZSB+Cv3u7m11dWG/yGT8nU9xTuM01Arbg/IUHO4q6s7Eq3dtg
         kRzjmCx0XGNAflobhWXJf8u6W9pEC3jECZaxABaazT1mlshJTVhwytuXVhiY/3pUYBzc
         I4PzDB2jvzkdvej8Zo/EZJ0q5BTxrvvuclvuZUgDi8IA9uLem0NYRyyJK6Asq9OIHOzs
         rn6+/khY3fhV30QPCP/7nj00oPOBXqipPRvJ0ufTuPBVi3u7DIAbDpb5f8lOGPoewCtk
         AWiQ==
X-Gm-Message-State: AOAM530pywV+ujBGyqTHxwWvDVet1giVKt8GaE8l9Paknu9i5mwa7ihp
        qKjZYscyRcgcMbnXnjEUqQjbuw==
X-Google-Smtp-Source: ABdhPJzHUl7WdPJb8e3R+EAvKEqYuZilIU+1gVVN/+yc6x4QkrsNDSGk9bBwgTJjHg7xp78HXBiVcg==
X-Received: by 2002:a17:906:2bcb:b0:6e7:f655:3b96 with SMTP id n11-20020a1709062bcb00b006e7f6553b96mr15216794ejg.175.1650880490060;
        Mon, 25 Apr 2022 02:54:50 -0700 (PDT)
Received: from [192.168.0.241] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f1-20020a056402194100b00416b174987asm4434770edz.35.2022.04.25.02.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 02:54:49 -0700 (PDT)
Message-ID: <e7fa738b-774f-0763-ce0b-6a9aa0c28b3a@linaro.org>
Date:   Mon, 25 Apr 2022 11:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] media: dt-bindings: media: rockchip-vdec: Add RK3328
 compatible
Content-Language: en-US
To:     Christopher Obbard <chris.obbard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Alex Bee <knaerzche@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220422133803.989256-1-chris.obbard@collabora.com>
 <20220422133803.989256-2-chris.obbard@collabora.com>
 <ff87d5cb-b0d4-95a2-90b0-7827a2a34d05@linaro.org>
 <34819690-5cb7-bbce-a2f5-3f6e66661049@linaro.org>
 <366fe755-6f07-499a-0b19-f046fd03c89a@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <366fe755-6f07-499a-0b19-f046fd03c89a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/04/2022 11:53, Christopher Obbard wrote:
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> I acked this but Johan pointed out that your intention was different and
>> missing patch context is quite important here. Please explain what
>> exactly you wanted in the patch? Now it looks actually wrong, so my ack
>> is not correct.
> 
> Wow - I think i was in weekend mode and forgot to run dtbs_check ;-).
> It will be solved in v2. I have now added the check to my "pre 
> send-patch" review checklist.
> 
> Just out of interest, I didn't get a mail from Johan and I can't seem to 
> find it the archive either. Is that message in public as I'd like to 
> address any other concerns at the same time ?

No, it wasn't public. :(

Best regards,
Krzysztof
