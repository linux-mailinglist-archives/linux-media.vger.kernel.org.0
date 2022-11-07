Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510146203C5
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 00:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiKGX3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 18:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbiKGX3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 18:29:51 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E37217E38
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 15:29:50 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z14so18454055wrn.7
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 15:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pH3DNpIcjBA9CwnMx52/Ysqt1HNVYwLloJ+TzD8ky5I=;
        b=Z7dbzuaS6yszPQ2ifZ5ShbNUjzVKFjF3uPph0RmtOl663VFa2oD5QB0UBtLp1viajH
         5nGkGlf82S1LO/BEdGN6r0lEn3Bsr9GNpA/YaK5S9IwnMVJtWc5cZXXP6wyLmdAkLQpB
         iwQaljQreyNn3MFhO6IgtVYCYCxgDuBt1F4twmc75UDqXLBkGADfaumi62A2XvJvVJt9
         KFivNYBj6Fd9lX8L2O4Cd8fDKc+Y38rTPIxn6y43Byy3E61KeqeHcoCtetzDTzOFoN5N
         ABDzw/UCK1njuta0kC0AAksR+Sv9ZuTK/ywxnYpb9T8gwXi182Pt8z8si6qBfOI2Ln++
         DC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pH3DNpIcjBA9CwnMx52/Ysqt1HNVYwLloJ+TzD8ky5I=;
        b=l69G1+jM4on05YWxK6ULvk+4j3NpdU+fhDyh95rWYEm7btuho/aTUmWECrRH891V8a
         SNGfGGa7uA+QNzSfKyaLU3jQcJZ4pBXEJDCrTtYTL+5jrIVuS4OsuLbyjjUgZyJhck/7
         Oo/oZ7HHlgjXUcxKAYRG4RzTAAhPmTw4VJXBb0B7QY2GTPqtf3W49m0ehkQykcll2iqV
         hGiEAveRMIXvv355HFg1MaZwoJalA6NF1Mv+kcdupApsvCAfreC2nX2iblOXGdM2JwE5
         7JUE0Kg1YW+p4AVudHkr09iGskmJtmFgZ4pjaFAeJa+JjXcbNpiyUdYOaBE86q+VPJxy
         VI6w==
X-Gm-Message-State: ACrzQf0A/ThgQuCLVcPv408HxKA69Ip/uVtaQXC2MbJvECA5mMDLWMo8
        O7J+5HDbshTFGxasOxfRMWgVtQ==
X-Google-Smtp-Source: AMsMyM4WrDVLZGtrS4YPGWazH4HgqXKPTUR7ygl3xn2jRCaadnNTtZgd0gs1b6/vfCNxMH0ZRV8+YQ==
X-Received: by 2002:a05:6000:15c8:b0:236:812d:d3e5 with SMTP id y8-20020a05600015c800b00236812dd3e5mr32877748wry.303.1667863788824;
        Mon, 07 Nov 2022 15:29:48 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b002383fc96509sm8517945wrs.47.2022.11.07.15.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 15:29:48 -0800 (PST)
Message-ID: <34fd2ddc-7645-21d4-45f2-f1534478d586@linaro.org>
Date:   Mon, 7 Nov 2022 23:29:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 0/3] Add imx577 compatible to imx412
Content-Language: en-US
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
References: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        laurent.pinchart@ideasonboard.com
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
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

On 14/10/2022 19:04, Bryan O'Donoghue wrote:
> v6:
> - Drops -items encapsulating compatible - Krzysztof

Ping.

Any chance of the good folks @ 
https://patchwork.linuxtv.org/project/linux-media picking this up ?

It unblocks enabling CAMSS on the qcom RB5 where the feedback I've had 
is we should get compat imx577 merged to accurately map the hardware 
config we have.

https://patchwork.kernel.org/project/linux-media/list/?series=644675

https://patches.linaro.org/project/linux-arm-msm/patch/20220518133004.342775-2-bryan.odonoghue@linaro.org/

---
bod
