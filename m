Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB5479AB46
	for <lists+linux-media@lfdr.de>; Mon, 11 Sep 2023 22:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjIKUrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236446AbjIKKkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 06:40:25 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7211EE5F
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 03:40:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-403012f27e1so21698875e9.1
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694428820; x=1695033620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZSXoR1SQBbf2X2ttBO0g4HsNPppA2Wq4FfW/XOJFlE=;
        b=gMx27TDaB1+ztmyOFKUAY5Sxk9KCDzs4IYPDUJpODv1nZgWwPhNcjezhrhxuPWp2SM
         6DsAa+I/tMMMpN+lGR5g2Z+94Qbgf+VGutcDxUHRCoegw/t8O4IaRara923WexASzL0W
         rJAr3flM2Pgc5axAwRBjgfX/oSJfFW9cGjM/cTUBLYqGMOrTN/hSRcINFKFvBf/BEYpd
         DNvekzNCmPp/icsN70VetofzFs/A+nvap1dvibeHn9kgU7vbrlCiUabfLT1dSVBu52MK
         tVAAzJK54Kzolgix9n1PpuUWspZbh7Ux1eRawUvj5oqqQIvJ/J53mTxcFHrhy99fjDU9
         nQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428820; x=1695033620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZSXoR1SQBbf2X2ttBO0g4HsNPppA2Wq4FfW/XOJFlE=;
        b=sSPud9BWPOD1EQSug4DlHs0F38YsHcxopz+SWXWtcZxBcMomN3nsRobyCbLk9Tg6di
         gYmRmmSif3nfRo4Pzbyp/4YzRBNBq/rWdPdTKShC+j5SQSaD/tSUBUffiVgdY1Hs8iar
         hvV2GXmeFynKxz8JqnIg2CEtjmwqjIUsmI7kHhv97MF13esFn64BYRJcOpr50TsRxgwN
         nUsDidkaZ6WMnKY6LWUVx4KXjiAqml5+bFaIPC61SmpW4cOEzb3M1NoC++dyfWJiLzbS
         LaObix/0GVUIq3/2x46IPNUNgjMww+Mmnv+E3TzFjd21tfP79i3olF5RoB+AVScKyqFs
         EPcA==
X-Gm-Message-State: AOJu0YyjGxfQDRqhlKwFKRrGxQFCg3egFl1ARsd7fUPTDcbMJ/XlxjYq
        iQRQm7yHUlVd8JkDyxemK/LYuw==
X-Google-Smtp-Source: AGHT+IEMtjw51WJ6go/mT//XcIW9jxT+cdwMORAppGRhH9+qDFNOXpaVSQf8LSknkwL6HqZrY9iqUg==
X-Received: by 2002:a5d:4204:0:b0:317:6175:95fd with SMTP id n4-20020a5d4204000000b00317617595fdmr7382285wrq.43.1694428819896;
        Mon, 11 Sep 2023 03:40:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n8-20020a7bcbc8000000b003fe29f6b61bsm9633911wmi.46.2023.09.11.03.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:40:19 -0700 (PDT)
Message-ID: <a2cc29fa-4433-30d1-2206-d07672cb1428@linaro.org>
Date:   Mon, 11 Sep 2023 12:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Content-Language: en-US
To:     Sean Young <sean@mess.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        zelong dong <zelong.dong@amlogic.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
 <ZP7sKdvAWQQSrTmX@gofer.mess.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZP7sKdvAWQQSrTmX@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/09/2023 12:30, Sean Young wrote:
> On Mon, Sep 11, 2023 at 11:46:33AM +0200, Neil Armstrong wrote:
>> On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>>
>>> Zelong Dong (3):
>>>   media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
>>>   dt-bindings: media: Add compatible for Meson-S4 IR Controller
>>>   arm64: dts: meson: add IR controller for Meson-S4 SoC
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
>>
>> [3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
>>       https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622
> 
> Would make more sense to have all three patches go in together through a single
> tree? I was about to apply all three of these patches to the media_stage

No, DTS should not go via driver (non-SoC) tree. If you insist on that,
it would be a sign your patchset is not bisectable or have ABI break.

Best regards,
Krzysztof

