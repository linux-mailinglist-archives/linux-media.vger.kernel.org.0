Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4565536F9
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 17:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351510AbiFUP6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 11:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353304AbiFUP5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 11:57:46 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E1A389B
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 08:57:12 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id e67-20020a9d01c9000000b0060c221b1420so10976165ote.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZFSg0tuJCHUlVKfP5BiklNxDr+62jGtSpH8uTPixkpI=;
        b=IPPw80ba1pr12ciSUM8dybhk7/7RVf4Lr1mEAK8GXVpqzoHFp9fT7iFCHGHb2afhyY
         5UIOJSljJT+PEAa0N8DYZqPiCJ4Aicq/VvsmA4y8Ja2yKXxNsbHIVZ7f4t4fMFtXG+34
         McrNQQm9nVJ895wJMPgodiC+DPC6hRKD3lWy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZFSg0tuJCHUlVKfP5BiklNxDr+62jGtSpH8uTPixkpI=;
        b=DYDcSiLFe+uuLHK1Rda2wYf6bbz9jlJVa49mwxLXoBaIHL4j8s0v36XQtduSGpi1Jg
         AKxFKRpnxBxqW/IU56P4P7DM6CQn6DC6xKWpf9Y/mXy2y7BRFR/E12sQ1GayTw+bcsEz
         h3sWsTKQtS7PrJaEUupa5bpvZ0soRSIG913711fdakRTE8O9Cu1lty+oz7A2GO9eStF1
         TwZ/V5/+O1hnyrjR28fPXc5mooaCYlPfnVKbYW6VJrhQOzpLHET21yJaupFMK8zXtDkn
         lofsRVuKz261OPrAub9erm5Q+YrQPovli95SF+H9kk6b6+B6pbz7lt7rzrT1n+M9yL74
         w7sA==
X-Gm-Message-State: AJIora8ohjQJOId6CApQcvrtNogweGOYihUrsW/3+4KvzOv82CWvr+Lk
        ehlci1wezIOuWqvVFMLP2cUKPA==
X-Google-Smtp-Source: AGRyM1uaGW2QV7qfts3x60BPBwXGM0j7oGrEjN+6VN3FHviBDPqaKkMNhxs6dBTXjyIy7Smr3Fndug==
X-Received: by 2002:a05:6830:1acd:b0:60c:2188:87ee with SMTP id r13-20020a0568301acd00b0060c218887eemr11323040otc.147.1655827031891;
        Tue, 21 Jun 2022 08:57:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056820189100b0041b5d2f3c92sm9935809oob.24.2022.06.21.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:57:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] media: vimc: add ancillary lens
To:     Yunke Cao <yunkec@google.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220617015745.3950197-1-yunkec@google.com>
 <20220617015745.3950197-2-yunkec@google.com>
 <177345ff-f601-e440-31e0-2c967736af6b@linuxfoundation.org>
 <CANqU6Fed=E1ogvR1ccwJA9bR_9VxU4QPd6PjvBAyRrMeQuRWfg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <610bc1b9-c013-46d7-4446-5a5eab4c2569@linuxfoundation.org>
Date:   Tue, 21 Jun 2022 09:57:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANqU6Fed=E1ogvR1ccwJA9bR_9VxU4QPd6PjvBAyRrMeQuRWfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/19/22 7:57 PM, Yunke Cao wrote:
> Hi Shuah,
> 
> Thanks for the review.
> 
> On Sat, Jun 18, 2022 at 5:01 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 6/16/22 7:57 PM, Yunke Cao wrote:
>>> Add a basic version of vimc lens.
>>> The lens supports V4L2_CID_FOCUS_ABSOLUTE control.
>>> Link the lens with vimc sensors using media-controller
>>> ancillary links.
>>>
>>
>> Commit log lines are usually ~75 charracters long. Make it easier
>> to read.
> That's good to know. Thanks!
> Should I send v3 and trim the commit log?
> I'm thinking something like this:
> 
> The lens supports FOCUS_ABSOLUTE control.
> Link the lens with sensors using ancillary links.
> 

Why is this necessary? How did you test this change? How could
one use this feature?

>>
>>> This change can be used to test the recently added ancillary
>>> links.
>>>
>>
>> Care to add instructions on how one would test ancillary with
>> this feature?
> 
> The lens shows up in the media topology. I documented it in 2/2.
> Not sure what else is necessary here.
> 

Why is this necessary? How did you test this change? How could
one use this feature?

Take a look at the some of the other commit messages e.g:
4a2e0a806cb58a4d3106add079488e0b56a221b6
5f3fb5c54d67670fa6743d2434a5bd43a97c01de

This one is a good example of what would a commit log adding a
new feature should include.

commit 9b4a9b31b9aeef262b4fa211f2083c30c4391df7
Author: Pedro Terra <pedro@terraco.de>
Date:   Tue Aug 31 19:48:22 2021 +0200

     media: vimc: Enable set resolution at the scaler src pad

thanks,
-- Shuah
