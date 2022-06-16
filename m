Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF94754ECEF
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 23:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbiFPV5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 17:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiFPV5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 17:57:38 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847DF9FC7
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 14:57:37 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id a10so2828439ioe.9
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 14:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=MlGxqbW39rYp8CPZjwUaVHU8zE4nejL508iW3z/QzHQ=;
        b=fK91az+n8H2IcKqrYMmDz34AzqwnzCdwkJXbbfJYJT2NP8oZWPyfrKO9mEEFQiK/Tm
         JdKAPbf5KUBZjIZXtPC0UAx5WiZhx/dbaRCg3ApX/1+0hgm8EutDcnpUvtTckJnh4Ph1
         eC7yc1zpLg1dwnKi7XgcQlX3bwPvLGxnisUTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MlGxqbW39rYp8CPZjwUaVHU8zE4nejL508iW3z/QzHQ=;
        b=lsn0xMKGMsMqt8B6JRGeiRS8wx0tMHIvpvoYFNLPzO+ERm+licvyyZgP4m6MehsIS8
         uwqMgJUafPGZUlxFPPRlaUfB93V20BU4jJ51xputlQvvnIqlzZqzEQeGuqfy93aO2KDp
         XdF0qerO58giGHet4imgfg3qEpzFWtzdxDI29r2kAfmqwW3fzSt2EtMG4YQv01odnHd/
         hknILbMHfdSYbydxawaXHQF509EHSnDU7fnzdXcWCWmHLre3TUZvsIP7DAnJ4A31Qzp9
         obqLNLh0Fa4vJbn+CCYKiVVCNlO1xpHsX1hUDvc6Z1FZbisfCZhPJYLRVxlqruofibbF
         lOXw==
X-Gm-Message-State: AJIora9X7DqebH9XxBVVWUpaFHRtuUCz3T4Il86pheFMf7sqj0f2mrSq
        f31QmH6Ek0JHUEbIgAQxRzandhg//BJWtQ==
X-Google-Smtp-Source: AGRyM1u03rXjK/qDa4vASj/xUHNZDft3y3Y6u8JGRaSV3vGv5zs9jruvujxFk5sOIYR9/7iFnW8kDA==
X-Received: by 2002:a05:6638:35a3:b0:331:e055:cf6e with SMTP id v35-20020a05663835a300b00331e055cf6emr4052797jal.250.1655416656933;
        Thu, 16 Jun 2022 14:57:36 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t6-20020a02c906000000b0033156d6016asm1381338jao.91.2022.06.16.14.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:57:36 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: vimc: expand the names of vimc entity types
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Oakley <daniel.oakley@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
 <20220616100747.48124-2-daniel.oakley@ideasonboard.com>
 <02e4de58-9de7-56e7-d673-6c01f50da64b@linuxfoundation.org>
 <f1bb9483-7199-3e3c-0d8c-89bc13be70f4@linuxfoundation.org>
 <165541466600.2786155.16126381340154209662@Monstersaurus>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9ea3155a-5099-e02d-3707-06b89395f8d1@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 15:57:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <165541466600.2786155.16126381340154209662@Monstersaurus>
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

On 6/16/22 3:24 PM, Kieran Bingham wrote:
> Quoting Shuah Khan (2022-06-16 15:41:45)
>> On 6/16/22 8:29 AM, Shuah Khan wrote:
>>> On 6/16/22 4:07 AM, Daniel Oakley wrote:
>>>> When introducing the lens controller, it became apparent that the vimc
>>>> entity type names were hard to understand, e.g. vimc_len_type refers to the
>>>> lens. The names of the vimc entity types have been expanded to make the
>>>> code easier to understand. There is no functional change intended.
>>>>
>>>> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>>> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
>>>> ---
>>>>    .../media/test-drivers/vimc/vimc-capture.c    | 270 ++++++------
>>>>    drivers/media/test-drivers/vimc/vimc-common.h |  10 +-
>>>>    drivers/media/test-drivers/vimc/vimc-core.c   |  22 +-
>>>>    .../media/test-drivers/vimc/vimc-debayer.c    | 393 +++++++++---------
>>>>    drivers/media/test-drivers/vimc/vimc-lens.c   |  82 ++--
>>>>    drivers/media/test-drivers/vimc/vimc-scaler.c | 216 +++++-----
>>>>    drivers/media/test-drivers/vimc/vimc-sensor.c | 307 +++++++-------
>>>>    7 files changed, 652 insertions(+), 648 deletions(-)
>>>>
>>>
>>> Thank you for the patch to improve code readability. Looks good to me.
>>>
>>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>
>>
>> Reviewed all three patches
>>
>> Mauro,
>>
>> Would you like me to send a pull request for these patches?
> 
> Hi Shuah,
> 
> Please note that I believe these patches are based on top of Yunke's not
> yet accepted patches for the vimc-lens.
> 

Yes. I am aware of that. I will make sure they are applied in the right
order.

thanks,
-- Shuah

