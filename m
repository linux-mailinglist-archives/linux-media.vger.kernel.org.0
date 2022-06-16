Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A5C54E526
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377692AbiFPOlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377676AbiFPOlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:41:47 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD5848E72
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:41:46 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id d123so1674424iof.10
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kt9J4KlrMk3jVAjw+6wQklnpylV5YDAq0qnUYsBEcLQ=;
        b=Fzj3TE0fQrLd+1DWJ2PPZjQtIx9jsrBw1ZwqsnJCCDBG03VS4IAWlIdcohE7Uhuj43
         J8PQ4drl9LJuFshWY521LZSdwcIEU/ewCwXsEKOQGcgCN4RxegOJFhwTlwenESwmjIgx
         CZYX8blV6wjR27RNaMMbSAi+lfk5e0KJpoqUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kt9J4KlrMk3jVAjw+6wQklnpylV5YDAq0qnUYsBEcLQ=;
        b=E9dv5RCJJAghixqRd1aSvmH5O7dFFcfxxQktAIHvGgnzoVOoO8gmpcghOkMzEuIJcu
         CJKfpS+Uhto28OAx95sasdM6vu4VkJyPCMNeCwH2HYRTmin4VO/7Rzhbpc4+CE49+V73
         FJUqk5yrCuWT2LPNWZPoWbcqpypamgL8EUIR3GCXxZmvnkYUUleNwWlnqcTfYTnWwFT0
         fQgeFOhgyMijRbzK0uTqHTG417KfUfz55IZHeNHDlvZKNFOpUIBUbObbnI4d/2ziXroi
         LzMeH+39stW9riw35BWjRIxWAiF4ycSTBGNYPFBOrGjahVqkHcNAU1VlmaWqgjW1bQh1
         TP4A==
X-Gm-Message-State: AJIora9V61HLANqAhzNhFOwQ4yuC9xAFFV1Djgjr+F1n709p94gK5BQY
        0AhLQSYAT6xtaKA4uIVqn2VS8A==
X-Google-Smtp-Source: AGRyM1t2okRWmw7A71o8qBwZ0nzWJKBu62I50scVbytj1tTzQpN2sF34Ph+Ao1aYrFP9Zbwny8S1Rw==
X-Received: by 2002:a05:6602:1541:b0:669:d432:6813 with SMTP id h1-20020a056602154100b00669d4326813mr2703880iow.15.1655390506175;
        Thu, 16 Jun 2022 07:41:46 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t1-20020a6b5f01000000b0066940fd6162sm1212219iob.51.2022.06.16.07.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:41:45 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: vimc: expand the names of vimc entity types
To:     Daniel Oakley <daniel.oakley@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
 <20220616100747.48124-2-daniel.oakley@ideasonboard.com>
 <02e4de58-9de7-56e7-d673-6c01f50da64b@linuxfoundation.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f1bb9483-7199-3e3c-0d8c-89bc13be70f4@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:41:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <02e4de58-9de7-56e7-d673-6c01f50da64b@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/22 8:29 AM, Shuah Khan wrote:
> On 6/16/22 4:07 AM, Daniel Oakley wrote:
>> When introducing the lens controller, it became apparent that the vimc
>> entity type names were hard to understand, e.g. vimc_len_type refers to the
>> lens. The names of the vimc entity types have been expanded to make the
>> code easier to understand. There is no functional change intended.
>>
>> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
>> ---
>>   .../media/test-drivers/vimc/vimc-capture.c    | 270 ++++++------
>>   drivers/media/test-drivers/vimc/vimc-common.h |  10 +-
>>   drivers/media/test-drivers/vimc/vimc-core.c   |  22 +-
>>   .../media/test-drivers/vimc/vimc-debayer.c    | 393 +++++++++---------
>>   drivers/media/test-drivers/vimc/vimc-lens.c   |  82 ++--
>>   drivers/media/test-drivers/vimc/vimc-scaler.c | 216 +++++-----
>>   drivers/media/test-drivers/vimc/vimc-sensor.c | 307 +++++++-------
>>   7 files changed, 652 insertions(+), 648 deletions(-)
>>
> 
> Thank you for the patch to improve code readability. Looks good to me.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> 


Reviewed all three patches

Mauro,

Would you like me to send a pull request for these patches?

thanks,
-- Shuah
