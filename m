Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA1252A42C
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 16:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241193AbiEQOEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 10:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346447AbiEQOEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 10:04:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330AC3DDDD
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 07:04:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq30so31551394lfb.3
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=82nn5njmNFS06nAyeGbhe4/PKMO1d9feXCrIA8HyNjc=;
        b=GTxGHiVMrZumPRt2uTlizP4Tsv9d4TAS2zKEsgMz9oZTZ3U0+BwXZvY/8fGGwcJpU/
         vVuP1wy6xOr4XPIzQb7HaYdo8TN8xjqwdzoKudqpK1Q09tx1Oy1gFfTWEVixD31Sc45q
         z9QeiFF2MXNBOyba07fDPuiX4hvU30TSHRgVwDNOzuwctb/EK6LZlQg0YyoOmArM5B9E
         DiY/VhrzZqlZ9cIor7Qamto7oJrvCOmoR2wHetRfc4ChF9cqNOqLkhxG9xxEBZuCPt3O
         XtGwxBWjtTmSqnPh1fDnz/xdTTuHTdV7Dy/bAcYtCmx7jOyupgkGGwJqeh2gcWu9/0Qh
         k/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=82nn5njmNFS06nAyeGbhe4/PKMO1d9feXCrIA8HyNjc=;
        b=UooYGtudxiZnEkaK2xd+6CczPVY1gTZABcSqpVuYcO7D8UBUCdNm7M4JNE2tEFLIVT
         y6sVukYtOTFpI9F7PT/9zMsCHUOx1+Sp8LYwiqkceZkEmNDiyeL5bFlc0O/2pEEeUG3m
         R5wXGmRu0g6xvsN5UwYKVUX7oy9xJpGVEG5Wzxo8MXH6QRH9AMT/LjeENjddoqUC82gr
         MnCZlleCduYpEskczf9nvC2f6IcZ9j4GIbxINuWHK7wAP9PDBgPv6PonZC4LRDoCC9a3
         uyIWcm4DTDsG8whDY0PwR4UcrdoPciJVZ6zszWjxAIrqame/9w6Z+mNDznSytTn9Zo1n
         B2bw==
X-Gm-Message-State: AOAM532OWAFVJL97TrD8AvprzAu5NyCM8rtvemBByOlijMbv9elF15uq
        OEyXh9ma57AyDpzBlVdZVqigcA==
X-Google-Smtp-Source: ABdhPJw7Ao2jJpJZDHuKc/blm7UkO+dmm9TC3lGw+GS++5c5qbDv/k/C2KTT4jXpWDmBuyPgTGFFGw==
X-Received: by 2002:a19:fc1b:0:b0:474:4bf7:e135 with SMTP id a27-20020a19fc1b000000b004744bf7e135mr17368382lfi.362.1652796243553;
        Tue, 17 May 2022 07:04:03 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d11-20020a056512368b00b0047255d211cfsm1600354lfs.254.2022.05.17.07.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 07:04:03 -0700 (PDT)
Message-ID: <a5b6a8e8-929b-91ef-c07c-69ed31174121@linaro.org>
Date:   Tue, 17 May 2022 16:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 18/20] media: s5p-mfc: Correction in register read and
 write for H264
Content-Language: en-US
To:     Smitha T Murthy <smitha.t@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, stanimir.varbanov@linaro.org,
        dillon.minfei@gmail.com, david.plowman@raspberrypi.com,
        mark.rutland@arm.com, robh+dt@kernel.org, krzk+dt@kernel.org,
        andi@etezian.org, alim.akhtar@samsung.com,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220517125548.14746-1-smitha.t@samsung.com>
 <CGME20220517125652epcas5p31abe2138fbff6218c9031da714bfb448@epcas5p3.samsung.com>
 <20220517125548.14746-19-smitha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517125548.14746-19-smitha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2022 14:55, Smitha T Murthy wrote:
> Few of the H264 encoder registers written were not
> getting reflected since the read values was not
> stored and getting overwritten.

This looks like a bugfix so:
1. Send it separately please.
2. Add Fixes tag.
3. Add Cc stable tag.


Best regards,
Krzysztof
