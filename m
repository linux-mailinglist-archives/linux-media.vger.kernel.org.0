Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5E661FB5E
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 18:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbiKGR3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 12:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbiKGR3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 12:29:35 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702341F9FC
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 09:29:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso10095906wme.5
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xkR0EU5MF5krvYFbRD8gmAbuCphspKLMpA2k8o/icr4=;
        b=jSV89Nd7BOcmUAVxEDddbuNTIYUCBXZutjnld8k4uAuTk1pp9sn+3pw3Joc1NASBoj
         4nVR3LJtXBrpaPW+Cs/OU3xoHH8Qj3HfJ+VRHRBInFLo5QAj2kiOtKR/VXoJTvqYsMd+
         99yUhXBdVs6C5VpVwJLzl2NUdmE5pWId+MP6y0qxgEOPgH3dmLt/40OUyBxPU3JZ/atz
         Sd+2aE/nprLxPxFw1H4Qy0mycrAKfFYpaXbpdFdSzUJXm9KnFcOQosDiMHDpoZ54NdRe
         FbQ5eRq0hhQfqljmkvR4icco1gzyvCgz4mSug1vcSwW4uYOlBI+qhNS1Wo68EB6Kac/d
         1o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkR0EU5MF5krvYFbRD8gmAbuCphspKLMpA2k8o/icr4=;
        b=Mx6sq2Z4il36JQcgK8HfDBNxS85kLMDJXidQsMSZRb71JD9CcHn4FrvcMWIF9ARaeD
         JpSBMTGqJ2vaEY9Uc1kn9ZOjo+AWpbrfNpuzi1EgfKpQq8APQTWnuW6uUY9pEya3s1iM
         thQZ8U4stGYMVu+32Oc9//eRr0Uk6iPmNsJyTmrO40v7pAcqVEFy5BATqIqptehiZ6sG
         QsRVgkr62u3aLgqW0veFZ9xY7PMQ2zICYTZHVYgpct3tJbzearLlR3va2t6/qzPJAppq
         dZciq8XFFKPJnv6NhFshsmYyPgJjYJBznIM4xKghw0Zhv8O3Xf6FbIJeSho0pE/pOQe5
         S/yA==
X-Gm-Message-State: ACrzQf2tQkBCV107TLO1FDqfaUBPa0OKa3HeO8pefliEVxyRLyLHagJh
        zUmLnXQBALUJ8lFmeSPI8s1tmg==
X-Google-Smtp-Source: AMsMyM59E4kUPCWhlqtaCDaCwUhPCvbjXQd61lqCiTFlXO9OHbwPcQvIUzUroZ3V1idre5W77pTe4Q==
X-Received: by 2002:a05:600c:31a2:b0:3cf:8a86:cf1c with SMTP id s34-20020a05600c31a200b003cf8a86cf1cmr17606048wmp.113.1667842172024;
        Mon, 07 Nov 2022 09:29:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:64c8:555c:905:adc6? ([2a01:e0a:982:cbb0:64c8:555c:905:adc6])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b002366fb99cdasm7715664wru.50.2022.11.07.09.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:29:31 -0800 (PST)
Message-ID: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
Date:   Mon, 7 Nov 2022 18:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: patches for staging:media drivers
Content-Language: en-US
To:     Deepak R Varma <drv@mailo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <Y2eSCZJNWn6DzCUu@qemulion>
Organization: Linaro Developer Services
In-Reply-To: <Y2eSCZJNWn6DzCUu@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/11/2022 11:52, Deepak R Varma wrote:
> Greetings to all.
> My name is Deepak R Varma and I was part of the recent Outreachy internship
> round. I learned during this program that patches for the media drivers were
> prohibited to be included in the Outreachy effort due to lack of bandwidth for
> the maintainers to respond on those.
> 
> The Outreachy round is now over but I am continuing to work on code improvement
> and changes. I would like to know if it is okay for me to now identify
> opportunities in the media drivers and send patch proposal for your kind
> consideration. I intend to send couple of Coccinelle identified code
> improvements as patches.
> 
> Please let me know.

I won't say no but since the media maintainers will need to apply them,
the problem is the same.

Neil

> 
> Thank you,
> ./drv
> 
> 

